import React, { useEffect, useRef } from 'react'

const HackerBackground = () => {
  const containerRef = useRef(null)

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    // 创建代码雨效果
    const createCodeRain = () => {
      const characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+-=[]{}|;:,.<>?'
      
      for (let i = 0; i < 30; i++) {
        const drop = document.createElement('div')
        drop.className = 'code-drop'
        drop.style.left = `${Math.random() * 100}%`
        drop.style.animationDuration = `${Math.random() * 4 + 6}s`
        drop.style.animationDelay = `${Math.random() * 10}s`
        drop.textContent = characters.charAt(Math.floor(Math.random() * characters.length))
        container.appendChild(drop)
      }
    }

    // 创建脉冲效果
    const createPulse = () => {
      const pulse = document.createElement('div')
      pulse.className = 'pulse'
      container.appendChild(pulse)
    }

    // 创建网格
    const createGrid = () => {
      const grid = document.createElement('div')
      grid.className = 'hacker-grid'
      container.appendChild(grid)
    }

    createCodeRain()
    createPulse()
    createGrid()

    return () => {
      // 清理函数
      while (container.firstChild) {
        container.removeChild(container.firstChild)
      }
    }
  }, [])

  return (
    <div className="hacker-background">
      <div ref={containerRef} className="code-rain"></div>
    </div>
  )
}

export default HackerBackground