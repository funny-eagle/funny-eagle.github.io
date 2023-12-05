import React from 'react'
import PropTypes from 'prop-types'

export default class HTML extends React.Component {
  render() {
    return (
      <html lang="zh-CN" {...this.props.htmlAttributes}>
        <head>
          {this.props.headComponents}
          <script
            dangerouslySetInnerHTML={{
              __html: `       
          var theme = 'light'
          let localTheme = localStorage.getItem('theme')
          if (localTheme) {
            if (localTheme === 'light') {
              theme = 'light'
            } else {
              theme = 'dark'
            }
          } else if (window.matchMedia) {
            if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
              theme = 'dark'
            } else {
              theme = 'light'
            }
          } else {
            // default light
            theme = 'light'
          }
          document.documentElement.className = theme + '-theme'

          var _hmt = _hmt || [];
          (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?065ec4ac737fe35f7a9a97a6aabec697";
            var s = document.getElementsByTagName("script")[0]; 
            s.parentNode.insertBefore(hm, s);
          })();
    `,
            }}
          />
          <meta charSet="utf-8" />
          <meta httpEquiv="x-ua-compatible" content="ie=edge" />
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=5"
          />
          <meta
            name="format-detection"
            content="email=no,telephone=no,address=no"
          />
          <meta name="baidu-site-verification" content="rVEuQMP8C6" />
          <link
            rel="apple-touch-icon"
            sizes="180x180"
            href="/icon.png"
          />
          <link
            rel="icon"
            type="image/png"
            sizes="32x32"
            href="/icon.png"
          />
          <link
            rel="icon"
            type="image/png"
            sizes="16x16"
            href="/icon.png"
          />
          <link rel="manifest" href="/site.webmanifest" />
          <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5" />
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.css" integrity="sha384-vKruj+a13U8yHIkAyGgK1J3ArTLzrFGBbBc0tDp4ad/EyewESeXE/Iv67Aj8gKZ0" crossOrigin="anonymous" />
          <meta name="msapplication-TileColor" content="#da532c" />
          <meta name="theme-color" content="#ffffff" />
          <meta name="baidu-site-verification" content="codeva-KiUgz2gAMo" />
        </head>
        <body {...this.props.bodyAttributes}>
          {this.props.preBodyComponents}
          <div
            key={`body`}
            id="___gatsby"
            dangerouslySetInnerHTML={{ __html: this.props.body }}
          />
          {this.props.postBodyComponents}
        </body>
      </html>
    )
  }
}

HTML.propTypes = {
  htmlAttributes: PropTypes.object,
  headComponents: PropTypes.array,
  bodyAttributes: PropTypes.object,
  preBodyComponents: PropTypes.array,
  body: PropTypes.string,
  postBodyComponents: PropTypes.array,
}
