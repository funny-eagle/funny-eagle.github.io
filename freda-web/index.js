import React from 'react'
import { render } from 'react-dom'
import { Router, Route, IndexRoute, hashHistory } from 'react-router'
import Home from './modules/Home'
import About from './modules/About'
import Dashboard from './modules/Dashboard'

render((
    <Router history={hashHistory}>
      <Route path="/" component={Home}>
        <IndexRoute component={Dashboard}/>
        <Route path="/about" component={About}/>
      </Route>
    </Router>
), document.getElementById('app'))
