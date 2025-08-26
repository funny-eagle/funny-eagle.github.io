import React from 'react'
import { Link } from 'gatsby'

// 分页组件，用于在博客列表等页面中实现分页功能
export default function (props) {
  // 获取当前页码、总页数和URL前缀
  const { currentPage, totalPage, prefix } = props
  return (
    <div className="button-wrapper">
      {/* 当前页码大于1时显示上一页按钮 */}
      {currentPage - 1 > 0 && (
        <Link
          to={prefix + (currentPage - 1 === 1 ? '' : currentPage - 1)}
          rel="prev"
        >
          <button className="page-button">上一页</button>
        </Link>
      )}
      {/* 显示当前页码和总页数 */}
      <div>{`${currentPage} / ${totalPage}`}</div>
      {/* 当前页码小于总页数时显示下一页按钮 */}
      {currentPage + 1 <= totalPage && (
        <Link to={prefix + (currentPage + 1)} rel="next">
          <button className="page-button">下一页</button>
        </Link>
      )}
    </div>
  )
}
