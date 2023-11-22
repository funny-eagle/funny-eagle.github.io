"use strict";(self.webpackChunkFunnyEagle=self.webpackChunkFunnyEagle||[]).push([[883],{4186:function(e,t,n){n.d(t,{Z:function(){return m}});var s=n(1721),a=n(7294),i=n(4160),o=n(2441),c=n(5893);let r=function(e){function t(){return e.apply(this,arguments)||this}return(0,s.Z)(t,e),t.prototype.render=function(){return(0,c.jsx)("div",{className:"css-menu "+("column"===this.props.direction?"column":"row"),children:o.GI.map((e=>(0,c.jsxs)("a",{target:e.target,href:e.href,children:[(0,c.jsx)("i",{className:"iconfont icon-"+e.icon}),e.name]},e.name)))})},t}(a.Component),l={marginBottom:"1rem"},h=function(e){function t(){for(var t,n=arguments.length,s=new Array(n),a=0;a<n;a++)s[a]=arguments[a];return(t=e.call.apply(e,[this].concat(s))||this).state={menuState:!1,keyword:"",animation:[],year:"",days:"",theme:"",logo:"/funny-eagle-light.jpg"},t.toggleTheme=()=>{"light"===t.state.theme?t.setTheme("dark"):t.setTheme("light")},t.setTheme=e=>{localStorage.setItem("theme",e),document.documentElement.className=e+"-theme",t.setState({theme:e})},t.toggleMenuState=()=>{t.setState({menuState:!t.state.menuState})},t.change=e=>{t.setState({keyword:e.target.value})},t.search=()=>{window.open("https://cn.bing.com/search?q=site%3Afunnyeagle.cn%20"+t.state.keyword)},t.formatTime=e=>{const t=e/1e3;return` ${Math.floor(t/60/60/24)} 天`},t.handleEnter=e=>{13===e.keyCode&&t.search()},t}(0,s.Z)(t,e);var n=t.prototype;return n.componentDidMount=function(){this.setState({theme:window.theme,year:(new Date).getFullYear(),logo:"/funny-eagle-light.jpg"});window.matchMedia("(prefers-color-scheme: dark)").addListener((e=>{e.matches?this.setTheme("dark"):this.setTheme("light")}))},n.render=function(){const{menuState:e,days:t,year:n,theme:s,logo:h}=this.state,{pageName:m,pageDescript:u,children:d,aside:g,className:p}=this.props,f=(0,c.jsxs)("div",{children:[(0,c.jsx)(i.rU,{style:{boxShadow:"none",textDecoration:"none",fontWeight:200},className:"usubeni",to:"/",children:(0,c.jsx)("span",{className:"logo-mobile",children:o.aD})}),m?(0,c.jsx)("div",{className:"page-name",children:"#"+m}):null]});return(0,c.jsxs)("div",{className:p,children:[(0,c.jsxs)("div",{className:"css-main",children:[(0,c.jsxs)("aside",{className:"css-aside "+(e?"open":"close"),children:[(0,c.jsxs)("header",{className:"css-header",children:[f,(0,c.jsx)("div",{className:"menu-button",onClick:this.toggleMenuState,children:(0,c.jsx)("i",{className:"iconfont icon-"+(e?"close":"menu")})}),(0,c.jsx)("meta",{name:"google-adsense-account",content:"ca-pub-1730830298664620"}),(0,c.jsx)("script",{async:!0,src:"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1730830298664620",crossorigin:"anonymous"})]}),g?(0,c.jsx)("div",{className:"css-toc",onClick:this.toggleMenuState,dangerouslySetInnerHTML:{__html:g}}):(0,c.jsxs)(a.Fragment,{children:[(0,c.jsx)(r,{direction:"column"}),(0,c.jsx)("div",{style:{textAlign:"center",marginBottom:"20px"},children:(0,c.jsx)("input",{placeholder:"关键字，然后 Enter",onChange:this.change,onKeyUp:this.handleEnter})})]})]}),(0,c.jsx)("article",{className:"css-post",children:d})]}),(0,c.jsxs)("footer",{children:[(0,c.jsx)("div",{className:"social-media",style:l,children:o.LF.map((e=>(0,c.jsx)("a",{target:"_blank",href:e.href,children:(0,c.jsx)("i",{className:"iconfont icon-"+e.icon})},e.icon)))}),(0,c.jsxs)("div",{style:l,children:["© ",n," FunnyEagle.CN • Theme"," ",(0,c.jsx)("a",{className:"usubeni",target:"_blank",href:"https://github.com/ssshooter/gatsby-theme-usubeni",children:"usubeni"})," ","• Powered by"," ",(0,c.jsx)("a",{className:"usubeni",target:"_blank",href:"https://www.gatsbyjs.org/",children:"Gatsbyjs"})]})]}),(0,c.jsx)("div",{className:"theme-toggle",onClick:this.toggleTheme,children:"light"===s?"☀":"☾"})]})},t}(a.Component);var m=h},429:function(e,t,n){n.r(t);var s=n(1721),a=n(7294),i=n(4186),o=n(5893);let c=function(e){function t(){return e.apply(this,arguments)||this}return(0,s.Z)(t,e),t.prototype.render=function(){return(0,o.jsxs)(i.Z,{location:this.props.location,children:[(0,o.jsx)("h1",{children:"Not Found"}),(0,o.jsx)("p",{children:"You just hit a route that doesn't exist... the sadness."})]})},t}(a.Component);t.default=c},2441:function(e,t,n){n.d(t,{GI:function(){return i},JW:function(){return a},LF:function(){return o},Vs:function(){return r},aD:function(){return s},l8:function(){return c}});const s="Funny Eagle",a="https://wwwiki.top",i=[{icon:"coding",name:"编程",href:"/tag/coding/"},{icon:"music",name:"音乐",href:"/tag/music/"},{icon:"life",name:"生活",href:"/tag/life/"},{icon:"tag",name:"标签",href:"/tags"},{icon:"archive",name:"归档",href:"/archive"},{icon:"person",name:"关于",href:"/about"}],o=[{icon:"weibo",href:"https://weibo.com/227307890"},{icon:"github-fill",href:"https://github.com/funny-eagle"},{icon:"twitter",href:"https://twitter.com/yangjinlong86"},{icon:"rss",href:"http://funnyeagle.cn/rss.xml"}],c=[{title:"ECMA-262, 9th edition",description:"ECMAScript 语言规范",href:"https://www.ecma-international.org/ecma-262/9.0/index.html",img:"https://www.ecma-international.org/ecma-262/9.0/img/ecma-logo.svg"}],r=[{title:"老鹰杰森",description:"老鹰杰森的个人网站",href:"http://funnyeagle.cn",img:"http://funnyeagle.cn/static/df1082d3ffc5b1288b5e7e78fe346036/ee81f/profile-pic.avif"}]}}]);
//# sourceMappingURL=component---src-pages-404-js-c1e1ef808e6342b094f8.js.map