// 引入文件系统模块
const fs = require('fs')

// 获取命令行参数：标题和日期
let title = process.argv[2]
let DATE = process.argv[3]

// 设置时区差异（8小时）
let timeDifference = 8
// 根据提供的日期或当前日期生成ISO格式的日期字符串
let date = DATE
  ? new Date(+new Date(DATE) + timeDifference * 60 * 60 * 1000).toISOString()
  : new Date(+new Date() + timeDifference * 60 * 60 * 1000).toISOString()
  
// 获取当前日期对象
let tmpDate = new Date()
// 获取年份并补零
let yyyy = String(tmpDate.getFullYear()).padStart(4, 0)
// 获取月份并补零（注意：getMonth() 返回的月份从0开始）
let mm = String(tmpDate.getMonth() + 1).padStart(2, 0)
// 获取日期并补零
let dd = String(tmpDate.getDate()).padStart(2, 0)

// 格式化日期为 YYYY-MM-DD
let yyyymmdd = `${yyyy}-${mm}-${dd}`

// 定义Markdown文件的模板内容
let template = `---
path: '/${title}'
slug: '/${title}'
date: '${date}'
title: ''
tags: ['coding']
description: 'description'
---`

// 创建目录
fs.mkdirSync(`./src/posts/${DATE || yyyymmdd}-${title}`)

// 在创建的目录中写入index.md文件
fs.appendFile(
  `./src/posts/${DATE || yyyymmdd}-${title}/index.md`,
  template,
  err => {
    if (err) throw err
    console.log('New file is created')
  }
)
