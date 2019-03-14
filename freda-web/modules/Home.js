import React from 'react'
import NavLink from './NavLink'
export default React.createClass({
  render() {
    return (
      <div>
        <h1>React Router Tutorial</h1>
        <ul role="nav">
          <li><NavLink to="/">Home</NavLink></li>
          <li><NavLink to="/about">About</NavLink></li>
        </ul>
        <hr/>
        {this.props.children}
      </div>
    )}
})
