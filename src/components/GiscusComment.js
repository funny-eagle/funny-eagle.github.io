import React, { useEffect, useRef } from 'react'
import { giscusConfig } from '../settings'

// Giscus评论组件
export default function GiscusComment({ slug }) {
  const commentsRef = useRef(null)

  useEffect(() => {
    // 检查是否启用了Giscus评论
    if (!giscusConfig.enabled) {
      return
    }

    // 移除可能存在的旧脚本
    const existingScript = document.querySelector('script[src="https://giscus.app/client.js"]')
    if (existingScript) {
      existingScript.remove()
    }

    // 创建Giscus脚本元素
    const script = document.createElement('script')
    script.src = 'https://giscus.app/client.js'
    script.async = true
    script.crossOrigin = 'anonymous'
    script.setAttribute('data-repo', giscusConfig.repo)
    script.setAttribute('data-repo-id', giscusConfig.repoId)
    script.setAttribute('data-category', giscusConfig.category)
    script.setAttribute('data-category-id', giscusConfig.categoryId)
    script.setAttribute('data-mapping', giscusConfig.mapping)
    script.setAttribute('data-reactions-enabled', giscusConfig.reactionsEnabled)
    script.setAttribute('data-emit-metadata', giscusConfig.emitMetadata)
    script.setAttribute('data-input-position', giscusConfig.inputPosition)
    script.setAttribute('data-theme', giscusConfig.theme)
    script.setAttribute('data-lang', giscusConfig.lang)
    script.setAttribute('data-loading', giscusConfig.loading)

    // 将脚本添加到评论容器中
    if (commentsRef.current) {
      commentsRef.current.innerHTML = '' // 清空容器
      commentsRef.current.appendChild(script)
    }

    // 清理函数
    return () => {
      script.remove()
    }
  }, [slug])

  // 如果未启用Giscus评论，不渲染任何内容
  if (!giscusConfig.enabled) {
    return null
  }

  return (
    <div className="css-comment-section">
      <div className="css-comment-title">评论区</div>
      <div id="giscus" ref={commentsRef} />
    </div>
  )
}