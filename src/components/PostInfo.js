import React from 'react'
import { Link } from 'gatsby'

// 文章信息组件，用于显示文章的日期和标签信息
export default function (props) {
  return (
    <div className="css-info">
      {/* 显示文章日期 */}
      <span
        style={{
          paddingRight: '12px',
        }}
      >
        {props.date}
      </span>
      {/* 如果有标签则显示标签列表 */}
      {props.tags ? (
        <React.Fragment>
          {props.tags.map((tag, index) => (
            <span
              key={tag}
              style={{
                paddingRight: '8px',
              }}
            >
              <Link to={`/tag/${tag}`}>#{tag}</Link>
            </span>
          ))}
        </React.Fragment>
      ) : null}
    </div>
  )
}
