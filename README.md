# Freda Blog

Freda Blog 是 基于 GatabyJS 的个人博客，支持根据 markdown 文件生成静态页面，配置简单，访问速度快，还有很多丰富的插件可用，是个人静态博客网站的一个很好的选择。接触 Gatsby 是在 Reactjs 官网看到的，简单学习之后，发现很适合做个人博客，就用 [gatsby-starter-blog](https://github.com/gatsbyjs/gatsby-starter-blog) 重新构建了 freda blog，以后也会基于这个版本做后续的功能开发。

## 安装 gatsby 环境

首先配置好nodejs环境。

然后安装 Gatsby CLI。

```shell
npm install -g gatsby-cli
```
## 开发模式启动项目

接着，到 freda 目录下，以开发模式启动项目：

```shell
cd freda/
npm install
gatsby develop
```

默认情况下会使用 8000 端口，启动后通过 http://localhost:8000 来访问 freda blog。

## 自动部署到 github pages

在repository的settings中设置用master分支来构建github pages，并指定自定义域名，到godaddy去设置域名dns，a记录指向yangjinlong86.github.io的IP，再创建一个分支用来存放gatsby博客源码，使用gh-pages自动提交生成的静态文件到master分支。

我用另一个repository[nocoder blog](https://github.com/yangjinlong86/nocoder/tree/master/data/blog)来存放文章，使用相对路径的方式，在gatsby源码中指定markdown文件的目录，这样的好处是博客源码项目不会太臃肿。

安装 gh-pages package

使用 gh-pages package 推送 Gatsby APP 到 github pages。

```shell
npm install gh-pages --save-dev
```

在package.json中添加部署脚本

```json
{
  "scripts": {
    "deploy": "gatsby build --prefix-paths && gh-pages -d public"
  }
}
```

自动将生成的静态页面push到master分支，然后通过github pages自动构建，完成博客的部署

```shell
npm run deploy 
```

