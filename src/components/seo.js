import React from 'react'
import PropTypes from 'prop-types'
import { useSiteMetadata } from "../hooks/use-site-metadata"

// SEO组件，用于设置页面的搜索引擎优化相关标签
function SEO({
  description,
  keywords,
  image,
  title,
  pathname,
}) {
  // 获取网站元数据
  const meta = useSiteMetadata()
  
  // 构建SEO相关数据
  const seo = {
    title: `${title} | ${meta.title}`,
    url: `${meta.siteUrl}${pathname || ''}`,
    description: description || meta.description,
    keywords: keywords || meta.keywords,
    author: meta.author,
    image,
  }

  return (
    <>
      {/* 页面标题 */}
      <title>{seo.title}</title>
      {/* 规范链接 */}
      <link rel="canonical" href={seo.url} />
      {/* 关键词 */}
      <meta name="keywords" content={seo.keywords.join(',')} />
      {/* 页面描述 */}
      <meta name="description" content={seo.description} />

      {/* Open Graph标签 */}
      <meta property="og:title" content={seo.title} />
      <meta property="og:description" content={seo.description} />

      {/* Twitter标签 */}
      <meta name="twitter:title" content={seo.title} />
      <meta name="twitter:card" content="summary" />
      <meta name="twitter:url" content={seo.url} />
      <meta name="twitter:description" content={seo.description} />
      <meta name="twitter:creator" content={seo.author} />

      {/* 如果有图片则添加图片相关标签 */}
      {seo.img ? <>
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:image" content={seo.image.src} />
        <meta name="image" content={seo.image.src} />
        <meta property="og:image:width" content={seo.image.width} />
        <meta property="og:image:height" content={seo.image.height} />
      </> : null}
    </>
  )
}

export default SEO
