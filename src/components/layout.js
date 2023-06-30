import * as React from "react"
import { Link } from "gatsby"
import DarkModeToggle from './DarkModeToggle';
import { StaticImage } from "gatsby-plugin-image"


const Layout = ({ location, title, children }) => {
  const rootPath = `${__PATH_PREFIX__}/`
  const isRootPath = location.pathname === rootPath
  let header

    header = (
      <div className="navbar">
        <Link className="header-link-home" to="/">
          <StaticImage
              layout="fixed"
              formats={["auto"]}
              src="../images/title-logo.png"
              height={32}
              quality={100}
              alt="Jason Yang's Blog"
          />
        </Link>
        <DarkModeToggle />
      </div>
      
    )
    

  return (
    <div className="global-wrapper" data-is-root-path={isRootPath}>
      
      <header className="global-header">
        {header}
        
      </header>
      <main>{children}</main>
      <footer>
        © {new Date().getFullYear()}, Built with
        {` `}
        <a href="https://www.gatsbyjs.com">Gatsby</a>
      </footer>
    </div>
  )
}

export default Layout
