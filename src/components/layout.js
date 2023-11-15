import React from 'react'
import { Link } from 'gatsby'
import Menu from './Menu'
import { siteName, socialMedia } from '../settings'

let footerStyle = {
  marginBottom: '1rem',
}

class Layout extends React.Component {
  state = {
    menuState: false, // false for close, true for open
    keyword: '',
    animation: [],
    year: '',
    days: '',
    theme: '',
    logo: ''
  }
  componentDidMount() {
    this.setState({
      theme: window.theme,
      year: new Date().getFullYear(),
      days: this.formatTime(new Date() - new Date('2018-12-05T14:13:38')),
      logo: "/funny-eagle-light.jpg"
    })

    const darkModeMediaQuery = window.matchMedia('(prefers-color-scheme: dark)')
    darkModeMediaQuery.addListener((e) => {
      const darkModeOn = e.matches
      if (darkModeOn) {
        this.setTheme('dark')
        this.setState({
          logo : "/funny-eagle.jpg"
        })
      } else {
        this.setTheme('light')
        this.setState({
          logo : "/funny-eagle-light.jpg"
        })
      }
    })
  }
  toggleTheme = () => {
    if (this.state.theme === 'light') {
      this.setTheme('dark')
      this.setState({
        logo : "/funny-eagle.jpg"
      })
    } else {
      this.setTheme('light')
      this.setState({
        logo : "/funny-eagle-light.jpg"
      })
    }
  }
  setTheme = (themeName) => {
    localStorage.setItem('theme', themeName)
    document.documentElement.className = themeName + '-theme'
    this.setState({
      theme: themeName,
    })
  }
  toggleMenuState = () => {
    this.setState({
      menuState: !this.state.menuState,
    })
  }
  change = (e) => {
    this.setState({
      keyword: e.target.value,
    })
  }
  search = () => {
    window.open(
      'https://cn.bing.com/search?q=site%3Afunnyeagle.cn%20' +
        this.state.keyword
    )
  }
  formatTime = (msTime) => {
    const time = msTime / 1000
    const day = Math.floor(time / 60 / 60 / 24)
    return ` ${day} 天`
  }
  handleEnter = (e) => {
    if (e.keyCode === 13) {
      this.search()
    }
  }
  render() {
    const { menuState, days, year, theme , logo} = this.state
    const { pageName, pageDescript, children, aside, className } = this.props

    const websiteName = (
      <div>
        <Link
          style={{
            boxShadow: 'none',
            textDecoration: 'none',
            fontWeight: 200,
          }}
          className="usubeni"
          to={'/'}
        >
          <span className="logo-mobile">{siteName}</span>
          <img className="logo" src={logo}/>
        </Link>
        {pageName ? (
          <div className="page-name">
            {'# ' + pageName}
          </div>
        ) : null}
      </div>
    )
    const descript = <div className="page-description">{pageDescript}</div>
    return (
      <div className={className}>
        <div className="css-main">
          <article className="css-post">{children}</article>
          <aside className={'css-aside ' + (menuState ? 'open' : 'close')}>
            <header className="css-header">
              {websiteName}
              <div className="menu-button" onClick={this.toggleMenuState}>
                <i
                  className={
                    'iconfont icon-' + (menuState ? 'close' : 'menu')
                  }
                />
              </div>
              <meta name="google-adsense-account" content="ca-pub-1730830298664620"></meta>
              <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1730830298664620" crossorigin="anonymous"></script>
            </header>
            {aside ? (
              <div
                className="css-toc"
                onClick={this.toggleMenuState}
                dangerouslySetInnerHTML={{
                  __html: aside,
                }}
              />
            ) : (
              <React.Fragment>
                <Menu direction="column" />
                <div style={{ textAlign: 'center', marginBottom: '20px' }}>
                  <input
                    placeholder="关键字，然后 Enter"
                    onChange={this.change}
                    onKeyUp={this.handleEnter}
                  />
                </div>
              </React.Fragment>
            )}
          </aside>
          
        </div>
        <footer>
          <div className="social-media" style={footerStyle}>
            {socialMedia.map((item) => (
              <a key={item.icon} target="_blank" href={item.href}>
                <i className={'iconfont icon-' + item.icon}></i>
              </a>
            ))}
          </div>
          <div style={footerStyle}>
            © {year} FunnyEagle.CN • Theme{' '}
            <a
              className="usubeni"
              target="_blank"
              href="https://github.com/ssshooter/gatsby-theme-usubeni"
            >
              usubeni
            </a>{' '}
            • Powered by{' '}
            <a
              className="usubeni"
              target="_blank"
              href="https://www.gatsbyjs.org/"
            >
              Gatsbyjs
            </a>
          </div>
        </footer>
      
        <div className="theme-toggle" onClick={this.toggleTheme}>
          {theme === 'light' ? '☀' : '☾'}
        </div>
      </div>
    )
  }
}

export default Layout
