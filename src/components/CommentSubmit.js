import React, { Component } from 'react'
import axios from 'axios'
import { apiUrl } from '../settings'

// 评论提交组件，用于处理用户评论的提交
export default class Comment extends Component {
  // 组件状态，包含提交按钮的文本状态
  state = {
    submitState: '发送留言',
  }
  
  // 提交评论的函数
  submit = () => {
    // 获取表单输入值
    const author = this.name.value
    const mail = this.email.value
    const site = this.site.value || null
    const content = this.message.value
    
    // 验证必填字段
    if (!author || !mail || !content) return
    
    // 获取组件属性
    const { parent, to, url, onSuccess } = this.props
    let data = undefined
    
    // 根据是否有父评论构建不同的数据结构
    if (parent) {
      data = {
        to,
        parent: parent,
        author,
        mail,
        content,
        site,
        path: window.location.pathname,
      }
    } else {
      data = {
        url: url.slice(1, -1),
        author,
        mail,
        content,
        site,
        path: window.location.pathname,
      }
    }
    
    // 发送评论数据到服务器
    axios
      .post(apiUrl + '/api/comment', data)
      .then((res) => {
        // 保存用户信息到本地存储
        localStorage.name = author
        localStorage.email = mail
        localStorage.site = site
        
        // 清空评论内容并更新状态
        this.message.value = ''
        onSuccess()
        this.setState({
          submitState: '已发送',
        })
      })
      .catch((err) => {
        // 处理错误情况
        alert(err)
        this.button.disabled = false
        this.setState({
          submitState: '发送留言',
        })
      })
      
    // 更新提交状态为发送中并禁用按钮
    this.setState({
      submitState: '发送中',
    })
    this.button.disabled = true
  }
  
  render() {
    const { parent, to, onCancel } = this.props
    return (
      <div className="css-comment-submit">
        <div className="title">留言</div>
        {/* 显示回复信息和取消回复按钮 */}
        {parent && (
          <div>
            回复 {to}
            <span className="inline-button" onClick={onCancel}>
              取消回复
            </span>
          </div>
        )}
        {/* 用户名输入框 */}
        <input
          ref={(input) => {
            this.name = input
            if (this.name && localStorage.name) {
              this.name.value = localStorage.name
            }
          }}
          type="text"
          placeholder="必填 请输入你的昵称"
          required
        />
        {/* 邮箱输入框 */}
        <input
          ref={(input) => {
            this.email = input
            if (this.email && localStorage.email) {
              this.email.value = localStorage.email
            }
          }}
          type="email"
          placeholder="必填 请输入你邮箱，收到回复时推送提醒"
        />
        {/* 网站输入框 */}
        <input
          id="comment-input"
          ref={(input) => {
            this.site = input
            if (this.site && localStorage.site) {
              this.site.value = localStorage.site
            }
          }}
          placeholder="选填 输入你的博客地址 带上 http(s)"
          required
        />
        {/* 评论内容输入框 */}
        <textarea
          id="comment-textarea"
          ref={(input) => (this.message = input)}
          placeholder="必填 请输入留言内容"
          required
        />
        {/* 提交按钮 */}
        <button ref={(button) => (this.button = button)} onClick={this.submit}>
          {this.state.submitState}
        </button>
      </div>
    )
  }
}
