var plugins = [{
      plugin: require('/Users/jason/local/github/freda/node_modules/_gatsby-plugin-google-analytics@2.0.18@gatsby-plugin-google-analytics/gatsby-ssr'),
      options: {"plugins":[]},
    },{
      plugin: require('/Users/jason/local/github/freda/node_modules/_gatsby-plugin-feed@2.1.1@gatsby-plugin-feed/gatsby-ssr'),
      options: {"plugins":[]},
    },{
      plugin: require('/Users/jason/local/github/freda/node_modules/_gatsby-plugin-manifest@2.0.29@gatsby-plugin-manifest/gatsby-ssr'),
      options: {"plugins":[],"name":"Gatsby Starter Blog","short_name":"GatsbyJS","start_url":"/","background_color":"#ffffff","theme_color":"#663399","display":"minimal-ui","icon":"content/assets/gatsby-icon.png"},
    },{
      plugin: require('/Users/jason/local/github/freda/node_modules/_gatsby-plugin-react-helmet@3.0.12@gatsby-plugin-react-helmet/gatsby-ssr'),
      options: {"plugins":[]},
    },{
      plugin: require('/Users/jason/local/github/freda/node_modules/_gatsby-plugin-typography@2.2.13@gatsby-plugin-typography/gatsby-ssr'),
      options: {"plugins":[],"pathToConfigModule":"src/utils/typography"},
    }]
// During bootstrap, we write requires at top of this file which looks like:
// var plugins = [
//   {
//     plugin: require("/path/to/plugin1/gatsby-ssr.js"),
//     options: { ... },
//   },
//   {
//     plugin: require("/path/to/plugin2/gatsby-ssr.js"),
//     options: { ... },
//   },
// ]

const apis = require(`./api-ssr-docs`)

// Run the specified API in any plugins that have implemented it
module.exports = (api, args, defaultReturn, argTransform) => {
  if (!apis[api]) {
    console.log(`This API doesn't exist`, api)
  }

  // Run each plugin in series.
  // eslint-disable-next-line no-undef
  let results = plugins.map(plugin => {
    if (!plugin.plugin[api]) {
      return undefined
    }
    const result = plugin.plugin[api](args, plugin.options)
    if (result && argTransform) {
      args = argTransform({ args, result })
    }
    return result
  })

  // Filter out undefined results.
  results = results.filter(result => typeof result !== `undefined`)

  if (results.length > 0) {
    return results
  } else {
    return [defaultReturn]
  }
}
