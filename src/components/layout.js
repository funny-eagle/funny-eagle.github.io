import React from "react"
import { Link } from "gatsby"

import { rhythm, scale } from "../utils/typography"

class Layout extends React.Component {
  render() {
    const { location, title, children } = this.props
    const rootPath = `${__PATH_PREFIX__}/`
    let header
    const ListLink = props => (
      <li style={{ display: `inline-block`, marginRight: `1rem`}}>
        <Link to={props.to}>{props.children}</Link>
      </li>
    )
    header = (
      <div style={{backgroundColor: `rgb(40, 44, 48)`}}>
        <div style={{ margin: `0 auto`,padding: `0 1rem`, maxWidth: rhythm(30)}}>
          <Link style={{ boxShadow: `none`, textDecoration: `none`, color: `white`}} to={`/`}>
            <strong style={{fontSize: `22px`}}>{title}</strong>
          </Link>
          <p><span style={{color: `white`}}>Standing on the shoulders of giants.</span></p>
        </div>
      </div>
    )
    
    return (
      <div>
        <header>{header}</header>
        <div
          style={{
            marginLeft: `auto`,
            marginRight: `auto`,
            maxWidth: rhythm(30),
            padding: `${rhythm(1.5)} ${rhythm(3 / 4)}`,
          }}
        >
          <main>{children}</main>
          <footer>
            nocoder.org © {new Date().getFullYear()}
          </footer>
        </div>
      </div>
    )
  }
}

export default Layout
