"use strict";(self.webpackChunknocoder=self.webpackChunknocoder||[]).push([[969],{4186:function(e,t,n){n.d(t,{Z:function(){return h}});var s=n(4578),a=n(7294),i=n(1883),r=n(2441),o=n(5893);let c=function(e){function t(){return e.apply(this,arguments)||this}return(0,s.Z)(t,e),t.prototype.render=function(){return(0,o.jsx)("div",{className:"css-menu "+("column"===this.props.direction?"column":"row"),children:r.GI.map((e=>(0,o.jsxs)("a",{target:e.target,href:e.href,children:[(0,o.jsx)("i",{className:"iconfont icon-"+e.icon}),e.name]},e.name)))})},t}(a.Component),l={marginBottom:"1rem"},m=function(e){function t(){for(var t,n=arguments.length,s=new Array(n),a=0;a<n;a++)s[a]=arguments[a];return(t=e.call.apply(e,[this].concat(s))||this).state={menuState:!1,keyword:"",animation:[],year:"",days:"",theme:""},t.toggleTheme=()=>{"light"===t.state.theme?t.setTheme("dark"):t.setTheme("light")},t.setTheme=e=>{localStorage.setItem("theme",e),document.documentElement.className=e+"-theme",t.setState({theme:e})},t.toggleMenuState=()=>{t.setState({menuState:!t.state.menuState})},t.change=e=>{t.setState({keyword:e.target.value})},t.search=()=>{window.open("https://cn.bing.com/search?q=site%3Anocoder.org%20"+t.state.keyword)},t.formatTime=e=>{const t=e/1e3;return" "+Math.floor(t/60/60/24)+" 天"},t.handleEnter=e=>{13===e.keyCode&&t.search()},t}(0,s.Z)(t,e);var n=t.prototype;return n.componentDidMount=function(){this.setState({theme:window.theme,year:(new Date).getFullYear(),days:this.formatTime(new Date-new Date("2018-12-05T14:13:38"))});window.matchMedia("(prefers-color-scheme: dark)").addListener((e=>{e.matches?this.setTheme("dark"):this.setTheme("light")}))},n.render=function(){const{menuState:e,days:t,year:n,theme:s}=this.state,{pageName:m,pageDescript:h,children:d,aside:u,className:g}=this.props,p=(0,o.jsxs)("div",{children:[(0,o.jsxs)(i.rU,{style:{boxShadow:"none",textDecoration:"none",fontWeight:200},className:"usubeni",to:"/",children:[(0,o.jsx)("span",{className:"logo-mobile",children:r.aD}),(0,o.jsx)("img",{className:"logo",src:"/logo.png"})]}),m?(0,o.jsx)("div",{className:"page-name",children:"# "+m}):null]});return(0,o.jsxs)("div",{className:g,children:[(0,o.jsxs)("div",{className:"css-main",children:[(0,o.jsx)("article",{className:"css-post",children:d}),(0,o.jsxs)("aside",{className:"css-aside "+(e?"open":"close"),children:[(0,o.jsxs)("header",{className:"css-header",children:[p,(0,o.jsx)("div",{className:"menu-button",onClick:this.toggleMenuState,children:(0,o.jsx)("i",{className:"iconfont icon-"+(e?"close":"menu")})})]}),u?(0,o.jsx)("div",{className:"css-toc",onClick:this.toggleMenuState,dangerouslySetInnerHTML:{__html:u}}):(0,o.jsxs)(a.Fragment,{children:[(0,o.jsx)(c,{direction:"column"}),(0,o.jsx)("div",{style:{textAlign:"center",marginBottom:"20px"},children:(0,o.jsx)("input",{placeholder:"关键字，然后 Enter",onChange:this.change,onKeyUp:this.handleEnter})})]})]})]}),(0,o.jsxs)("footer",{children:[(0,o.jsx)("div",{className:"social-media",style:l,children:r.LF.map((e=>(0,o.jsx)("a",{target:"_blank",href:e.href,children:(0,o.jsx)("i",{className:"iconfont icon-"+e.icon})},e.icon)))}),(0,o.jsxs)("div",{style:l,children:["© ",n," FunnyEagle.CN • Theme"," ",(0,o.jsx)("a",{className:"usubeni",target:"_blank",href:"https://github.com/ssshooter/gatsby-theme-usubeni",children:"usubeni"})," ","• Powered by"," ",(0,o.jsx)("a",{className:"usubeni",target:"_blank",href:"https://www.gatsbyjs.org/",children:"Gatsbyjs"})]})]}),(0,o.jsx)("div",{className:"theme-toggle",onClick:this.toggleTheme,children:"light"===s?"☀":"☾"})]})},t}(a.Component);var h=m},8405:function(e,t,n){n.d(t,{Z:function(){return i}});n(7294);var s=n(1883),a=n(5893);function i(e){const{currentPage:t,totalPage:n,prefix:i}=e;return(0,a.jsxs)("div",{className:"button-wrapper",children:[t-1>0&&(0,a.jsx)(s.rU,{to:i+(t-1==1?"":t-1),rel:"prev",children:(0,a.jsx)("button",{className:"page-button",children:"上一页"})}),(0,a.jsx)("div",{children:t+" / "+n}),t+1<=n&&(0,a.jsx)(s.rU,{to:i+(t+1),rel:"next",children:(0,a.jsx)("button",{className:"page-button",children:"下一页"})})]})}},123:function(e,t,n){n.d(t,{Z:function(){return r}});var s=n(7294),a=n(1883),i=n(5893);function r(e){return(0,i.jsxs)("div",{className:"css-info",children:[(0,i.jsx)("span",{style:{paddingRight:"12px"},children:e.date}),e.tags?(0,i.jsx)(s.Fragment,{children:e.tags.map(((e,t)=>(0,i.jsx)("span",{style:{paddingRight:"8px"},children:(0,i.jsx)(a.rU,{to:"/tag/"+e,children:e})},e)))}):null]})}},5049:function(e,t,n){n.d(t,{Z:function(){return i}});n(7294);var s=n(1883);var a=n(5893);var i=function(e){let{description:t,keywords:n,image:i,title:r,pathname:o}=e;const c=(0,s.K2)("2052298874").site.siteMetadata,l={title:r+" | "+c.title,url:""+c.siteUrl+(o||""),description:t||c.description,keywords:n||c.keywords,author:c.author,image:i};return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)("title",{children:l.title}),(0,a.jsx)("link",{rel:"canonical",href:l.url}),(0,a.jsx)("meta",{name:"keywords",content:l.keywords.join(",")}),(0,a.jsx)("meta",{name:"description",content:l.description}),(0,a.jsx)("meta",{property:"og:title",content:l.title}),(0,a.jsx)("meta",{property:"og:description",content:l.description}),(0,a.jsx)("meta",{name:"twitter:title",content:l.title}),(0,a.jsx)("meta",{name:"twitter:card",content:"summary"}),(0,a.jsx)("meta",{name:"twitter:url",content:l.url}),(0,a.jsx)("meta",{name:"twitter:description",content:l.description}),(0,a.jsx)("meta",{name:"twitter:creator",content:l.author}),l.img?(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)("meta",{name:"twitter:card",content:"summary_large_image"}),(0,a.jsx)("meta",{name:"twitter:image",content:l.image.src}),(0,a.jsx)("meta",{name:"image",content:l.image.src}),(0,a.jsx)("meta",{property:"og:image:width",content:l.image.width}),(0,a.jsx)("meta",{property:"og:image:height",content:l.image.height})]}):null]})}},2441:function(e,t,n){n.d(t,{GI:function(){return i},JW:function(){return a},LF:function(){return r},Vs:function(){return c},aD:function(){return s},l8:function(){return o}});const s="Jason Yang's Website",a="https://wwwiki.top",i=[{icon:"coding",name:"编程",href:"/tag/coding/"},{icon:"music",name:"音乐",href:"/tag/music/"},{icon:"life",name:"生活",href:"/tag/life/"},{icon:"tag",name:"标签",href:"/tags"},{icon:"archive",name:"归档",href:"/archive"},{icon:"person",name:"关于",href:"/about"}],r=[{icon:"weibo",href:"https://weibo.com/227307890"},{icon:"github-fill",href:"https://github.com/nocdr"},{icon:"twitter",href:"https://twitter.com/yangjinlong86"},{icon:"rss",href:"http://funnyeagle.cn/rss.xml"}],o=[{title:"ECMA-262, 9th edition",description:"ECMAScript 语言规范",href:"https://www.ecma-international.org/ecma-262/9.0/index.html",img:"https://www.ecma-international.org/ecma-262/9.0/img/ecma-logo.svg"}],c=[{title:"老鹰杰森",description:"老鹰杰森的个人网站",href:"http://funnyeagle.cn",img:"http://funnyeagle.cn/static/df1082d3ffc5b1288b5e7e78fe346036/ee81f/profile-pic.avif"}]},3450:function(e,t,n){n.r(t),n.d(t,{Head:function(){return u}});var s=n(4578),a=n(7294),i=n(1883),r=n(5049),o=n(4186),c=n(123),l=n(8405),m=n(5893);const h={};let d=function(e){function t(){return e.apply(this,arguments)||this}return(0,s.Z)(t,e),t.prototype.render=function(){const{data:e}=this.props,t=e.allMarkdownRemark.edges,{totalPage:n,currentPage:s,tag:a}=this.props.pageContext;return(0,m.jsxs)(o.Z,{pageName:a,pageDescript:h[a],children:[t.map((e=>{let{node:t}=e;const n=t.frontmatter.title||t.fields.slug;return(0,m.jsxs)("div",{className:"list-item",children:[(0,m.jsx)("div",{className:"list-title",children:(0,m.jsx)(i.rU,{style:{boxShadow:"none"},to:t.fields.slug,children:n})}),(0,m.jsx)(c.Z,{date:t.frontmatter.date,tags:t.frontmatter.tags}),(0,m.jsx)("p",{className:"list-excerpt",children:t.frontmatter.description||t.excerpt})]},t.fields.slug)})),(0,m.jsx)(l.Z,{currentPage:s,totalPage:n,prefix:"/tag/"+a+"/"})]})},t}(a.Component);t.default=d;const u=e=>{let{location:t,pageContext:n}=e;return(0,m.jsx)(r.Z,{title:n.tag,pathname:t.pathname,description:h[n.tag]})}}}]);
//# sourceMappingURL=component---src-templates-tag-js-b71df4048878c3d2dbf9.js.map