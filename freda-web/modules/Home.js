import React from 'react'
import NavLink from './NavLink'

class Home extends React.Component{
  render() {
    return (
      <div>
        <h1>nocoder.org</h1>
        <ul role="nav">
          <li><NavLink to="/">Blog</NavLink></li>
          <li><NavLink to="/about">About</NavLink></li>
        </ul>
        <hr/>
        {this.props.children}
      </div>
    )}
}

export default Home
