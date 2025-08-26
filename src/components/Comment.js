import React from 'react'
import CommentSubmit from './CommentSubmit'
import { useEffect, useState } from 'react'
import axios from 'axios'
import { apiUrl } from '../settings'

// 日期格式化函数，将日期对象格式化为 YYYY-MM-DD 格式
const dateFormat = (date) => {
  date = new Date(date)
  let m = date.getMonth() + 1
  m = m < 10 ? '0' + m : m
  let d = date.getDate()
  d = d < 10 ? '0' + d : d
  return `${date.getFullYear()}-${m}-${d}`
}

// 评论组件，用于显示和管理文章评论
export default function Comment({ slug }) {
  // 回复数据状态，包含父评论ID和被回复的用户
  const [replyData, setReplyData] = useState({
    parentId: null,
    to: null,
  })
  
  // 取消回复操作
  const cancelReply = () => {
    setReplyData({
      parentId: null,
      to: null,
    })
  }
  
  // 设置回复操作，滚动到评论输入框并设置回复数据
  const reply = (parentId, to) => () => {
    document.querySelector('#comment-input').scrollIntoView()
    setReplyData({
      parentId,
      to,
    })
  }

  // 评论数据状态
  const [comments, setComments] = useState([])
  
  // 获取评论数据的异步函数
  const getComment = async () => {
    try {
      const { data } = await axios.get(
        apiUrl + '/api/comment/' + slug.slice(1, -1)
      )
      setComments(data.data)
    } catch (e) {
      console.error(e)
    }
  }
  
  // 组件挂载时获取评论数据
  useEffect(() => {
    getComment()
  }, [])

  // 评论显示组件，用于渲染单条评论
  const CommentDisplay = ({ item, comment }) => {
    const date = dateFormat(item.date)
    return (
      <div
        className={
          item.to ? 'css-child-comment-display' : 'css-comment-display'
        }
      >
        <div className="name">
          {item.site ? (
            <a target="_blank" href={item.site}>
              {item.author}
            </a>
          ) : (
            <span>{item.author}</span>
          )}
          {item.to && ' -> ' + item.to}
          <span className="date">{date}</span>
          <span
            className="inline-button css-reply"
            onClick={reply(comment ? comment._id : item._id, item.author)}
          >
            回复
          </span>
        </div>
        <div className="message">{item.content}</div>
      </div>
    )
  }
  
  return (
    <>
      {comments.length > 0
        ? comments.map((comment) => {
            return (
              <React.Fragment>
                <CommentDisplay item={comment} />
                {comment.replies.length > 0
                  ? comment.replies.map((commentChild) => {
                      return (
                        <CommentDisplay
                          item={commentChild}
                          parent={comment}
                          key={commentChild._id}
                        />
                      )
                    })
                  : null}
              </React.Fragment>
            )
          })
        : '暂时没有留言，要抢沙发吗？'}
      <CommentSubmit
        url={slug}
        parent={replyData.parentId}
        to={replyData.to}
        onCancel={cancelReply}
        onSuccess={getComment}
      />
    </>
  )
}
