const gatsbyFeedConfig = require('./gatsby-feed-config.js')
const gatsbyMarkdownConfig = require('./gatsby-markdown-config.js')
module.exports = {
  siteMetadata: {
    title: "Funny Eagle",
    author: 'Jason Yang',
    description: "Funny Eagle",
    siteUrl: 'http://funnyeagle.cn',
    keywords: ['编程', '音乐', '生活'],
  },
  jsxRuntime: 'automatic',
  plugins: [
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        path: `${__dirname}/src/pages`,
        name: 'pages',
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `assets`,
        path: `${__dirname}/src/assets/`,
      },
    },
    gatsbyFeedConfig,
    gatsbyMarkdownConfig,
    'gatsby-transformer-yaml',
    `gatsby-plugin-image`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    `gatsby-plugin-sass`,
    `gatsby-plugin-sitemap`,
    {
      resolve: `gatsby-plugin-google-gtag`,
      options: {
        trackingIds: [],
      },
    },
  ],
}
