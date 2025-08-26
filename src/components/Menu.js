import React, { Component } from 'react'
import { menu } from '../settings'

// 菜单组件，用于渲染网站导航菜单
export default class Menu extends Component {
  render() {
    return (
      <div
        className={
          'css-menu ' + (this.props.direction === 'column' ? 'column' : 'row')
        }
      >
        {/* 遍历菜单项并渲染链接 */}
        {menu.map((item) => (
          <a target={item.target} href={item.href} key={item.name}>
            <i className={'iconfont icon-' + item.icon} />
            {item.name}
          </a>
        ))}
      </div>
    )
  }
}
