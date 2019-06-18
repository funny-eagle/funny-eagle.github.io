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
      <div style={{}}>
        <div style={{ margin: `0 auto`,padding: `0 1rem`, maxWidth: rhythm(30)}}>
          <Link style={{ boxShadow: `none`, textDecoration: `none`}} to={`/`}>
            <strong style={{fontSize: `22px`}}>{title}</strong>
          </Link>
          <hr/>
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
            paddingLeft: `1rem`,
            paddingRight: `1rem`,
          }}
        >
          <main>{children}</main>
          <footer>
            <hr style={{marginBottom: 0}}/>
            <span style={{color: `grey`}}>nocoder.org © {new Date().getFullYear()}</span>
          </footer>
        </div>
      </div>
    )
  }
}

export default Layout