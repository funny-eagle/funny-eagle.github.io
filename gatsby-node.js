// 引入所需模块
const path = require('path')
const { createFilePath } = require('gatsby-source-filesystem')
const _ = require('lodash')
const get = _.get
const fastExif = require('fast-exif')

// 定义GraphQL查询语句，用于获取所有Markdown文件的元数据
const query = `
{
  allMarkdownRemark(
    sort: {frontmatter: {date: DESC}}
    limit: 1000
  ) {
    group(field: {frontmatter: {tags: SELECT}}) {
      fieldValue
      totalCount
    }
    edges {
      node {
        fields {
          slug
        }
        frontmatter {
          title
          tags
          slug
        }
      }
    }
  }
}
`

// Gatsby API，用于创建页面
exports.createPages = async ({ graphql, actions }) => {
  const { createPage } = actions

  // 定义模板文件路径
  const blogPost = path.resolve('./src/templates/blog-post.js')
  const homePaginate = path.resolve('./src/templates/index.js')
  const tagTemplate = path.resolve('./src/templates/tag.js')

  // 执行GraphQL查询
  const result = await graphql(query)

  // 如果查询出错，则抛出错误
  if (result.errors) {
    throw new Error(result.errors)
  }
  
  // 获取标签和文章数据
  const tags = result.data.allMarkdownRemark.group
  const posts = result.data.allMarkdownRemark.edges

  // 创建归档页面
  const postsPerPage = 50
  const numPages = Math.ceil(posts.length / postsPerPage)

  Array.from({ length: numPages }).forEach((_, i) => {
    createPage({
      path: i === 0 ? `/archive` : `/archive/${i + 1}`,
      component: homePaginate,
      context: {
        currentPage: i + 1,
        totalPage: numPages,
        limit: postsPerPage,
        skip: i * postsPerPage,
      },
    })
  })

  // 创建标签页面
  const TagsPostsPerPage = 8
  tags.forEach((tag) => {
    const TagsTotal = tag.totalCount
    const TagsPages = Math.ceil(TagsTotal / TagsPostsPerPage)
    Array.from({ length: TagsPages }).forEach((_, i) => {
      createPage({
        path:
          i === 0
            ? `/tag/${tag.fieldValue}`
            : `/tag/${tag.fieldValue}/${i + 1}`,
        component: tagTemplate,
        context: {
          tag: tag.fieldValue,
          currentPage: i + 1,
          totalPage: TagsPages,
          limit: TagsPostsPerPage,
          skip: i * TagsPostsPerPage,
        },
      })
    })
  })

  // 创建博客文章页面
  posts.forEach((post, index) => {
    const previous = index === posts.length - 1 ? null : posts[index + 1].node
    const next = index === 0 ? null : posts[index - 1].node
    createPage({
      path: post.node.fields.slug,
      component: blogPost,
      context: {
        slug: post.node.fields.slug,
        previous,
        next,
      },
    })
  })
}

// Gatsby API，用于在创建节点时添加字段
exports.onCreateNode = ({ node, actions, getNode }) => {
  const { createNodeField } = actions

  // 如果节点类型是Markdown文件
  if (node.internal.type === `MarkdownRemark`) {
    // 创建slug字段
    createNodeField({
      node,
      name: `slug`,
      value: node.frontmatter.slug || createFilePath({ node, getNode }),
    })
  }
}
