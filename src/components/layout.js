import React from "react"
import { Link } from "gatsby"

import { rhythm, scale } from "../utils/typography"

class Layout extends React.Component {
  render() {
    const { location, title, children } = this.props
    const rootPath = `${__PATH_PREFIX__}/`
    let header

    header = (
      <div>
        <h2>
        <Link style={{ boxShadow: `none`, textDecoration: `none`, color: `teal`}} to={`/`}>
         {title}
        </Link>
        </h2>
      </div>
    )
    
    return (
      <div
        style={{
          marginLeft: `auto`,
          marginRight: `auto`,
          maxWidth: rhythm(24),
          padding: `${rhythm(1.5)} ${rhythm(3 / 4)}`,
        }}
      >
        <header>{header}</header>
        <hr/>
        <main>{children}</main>
        <footer>
          nocoder.org © {new Date().getFullYear()}
        </footer>
      </div>
    )
  }
}

export default Layout
