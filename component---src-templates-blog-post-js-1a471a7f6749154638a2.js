(self.webpackChunkFunnyEagle=self.webpackChunkFunnyEagle||[]).push([[989],{7290:function(e,t,n){"use strict";n.d(t,{H:function(){return b},b:function(){return ee},c:function(){return U},g:function(){return H},h:function(){return x},p:function(){return c},r:function(){return se}});let s,r,a=!1;const o="undefined"!=typeof window?window:{},l=o.document||{head:{}},i={$flags$:0,$resourcesUrl$:"",jmp:e=>e(),raf:e=>requestAnimationFrame(e),ael:(e,t,n,s)=>e.addEventListener(t,n,s),rel:(e,t,n,s)=>e.removeEventListener(t,n,s),ce:(e,t)=>new CustomEvent(e,t)},c=e=>Promise.resolve(e),$=(()=>{try{return new CSSStyleSheet,"function"==typeof(new CSSStyleSheet).replace}catch(e){}return!1})(),m=(e,t,n,s)=>{n&&n.map((([n,s,r])=>{const a=d(e,n),o=h(t,r),l=u(n);i.ael(a,s,o,l),(t.$rmListeners$=t.$rmListeners$||[]).push((()=>i.rel(a,s,o,l)))}))},h=(e,t)=>n=>{try{256&e.$flags$?e.$lazyInstance$[t](n):(e.$queuedListeners$=e.$queuedListeners$||[]).push([t,n])}catch(s){oe(s)}},d=(e,t)=>4&t?l:8&t?o:e,u=e=>0!=(2&e),g="http://www.w3.org/1999/xlink",f=new WeakMap,p=e=>{const t=e.$cmpMeta$,n=e.$hostElement$,s=t.$flags$,r=(t.$tagName$,()=>{}),a=((e,t,n,s)=>{let r=y(t),a=ce.get(r);if(e=11===e.nodeType?e:l,a)if("string"==typeof a){e=e.head||e;let t,n=f.get(e);n||f.set(e,n=new Set),n.has(r)||(t=l.createElement("style"),t.innerHTML=a,e.insertBefore(t,e.querySelector("link")),n&&n.add(r))}else e.adoptedStyleSheets.includes(a)||(e.adoptedStyleSheets=[...e.adoptedStyleSheets,a]);return r})(n.shadowRoot?n.shadowRoot:n.getRootNode(),t);10&s&&(n["s-sc"]=a,n.classList.add(a+"-h")),r()},y=(e,t)=>"sc-"+e.$tagName$,w={},v=e=>"object"===(e=typeof e)||"function"===e,x=(e,t,...n)=>{let s=null,r=null,a=!1,o=!1,l=[];const i=t=>{for(let n=0;n<t.length;n++)s=t[n],Array.isArray(s)?i(s):null!=s&&"boolean"!=typeof s&&((a="function"!=typeof e&&!v(s))&&(s=String(s)),a&&o?l[l.length-1].$text$+=s:l.push(a?j(null,s):s),o=a)};if(i(n),t){t.key&&(r=t.key);{const e=t.className||t.class;e&&(t.class="object"!=typeof e?e:Object.keys(e).filter((t=>e[t])).join(" "))}}if("function"==typeof e)return e(null===t?{}:t,l,k);const c=j(e,null);return c.$attrs$=t,l.length>0&&(c.$children$=l),c.$key$=r,c},j=(e,t)=>{const n={$flags$:0,$tag$:e,$text$:t,$elm$:null,$children$:null,$attrs$:null,$key$:null};return n},b={},k={forEach:(e,t)=>e.map(N).forEach(t),map:(e,t)=>e.map(N).map(t).map(S)},N=e=>({vattrs:e.$attrs$,vchildren:e.$children$,vkey:e.$key$,vname:e.$name$,vtag:e.$tag$,vtext:e.$text$}),S=e=>{if("function"==typeof e.vtag){const t=Object.assign({},e.vattrs);return e.vkey&&(t.key=e.vkey),e.vname&&(t.name=e.vname),x(e.vtag,t,...e.vchildren||[])}const t=j(e.vtag,e.vtext);return t.$attrs$=e.vattrs,t.$children$=e.vchildren,t.$key$=e.vkey,t.$name$=e.vname,t},L=(e,t,n,s,r,a)=>{if(n!==s){let c=ae(e,t),$=t.toLowerCase();if("class"===t){const t=e.classList,r=R(n),a=R(s);t.remove(...r.filter((e=>e&&!a.includes(e)))),t.add(...a.filter((e=>e&&!r.includes(e))))}else if("style"===t){for(const t in n)s&&null!=s[t]||(t.includes("-")?e.style.removeProperty(t):e.style[t]="");for(const t in s)n&&s[t]===n[t]||(t.includes("-")?e.style.setProperty(t,s[t]):e.style[t]=s[t])}else if("key"===t);else if("ref"===t)s&&s(e);else if(c||"o"!==t[0]||"n"!==t[1]){const o=v(s);if((c||o&&null!==s)&&!r)try{if(e.tagName.includes("-"))e[t]=s;else{let r=null==s?"":s;"list"===t?c=!1:null!=n&&e[t]==r||(e[t]=r)}}catch(l){}let i=!1;$!==($=$.replace(/^xlink\:?/,""))&&(t=$,i=!0),null==s||!1===s?!1===s&&""!==e.getAttribute(t)||(i?e.removeAttributeNS(g,t):e.removeAttribute(t)):(!c||4&a||r)&&!o&&(s=!0===s?"":s,i?e.setAttributeNS(g,t,s):e.setAttribute(t,s))}else t="-"===t[2]?t.slice(3):ae(o,$)?$.slice(2):$[2]+t.slice(3),n&&i.rel(e,t,n,!1),s&&i.ael(e,t,s,!1)}},E=/\s/,R=e=>e?e.split(E):[],C=(e,t,n,s)=>{const r=11===t.$elm$.nodeType&&t.$elm$.host?t.$elm$.host:t.$elm$,a=e&&e.$attrs$||w,o=t.$attrs$||w;for(s in a)s in o||L(r,s,a[s],void 0,n,t.$flags$);for(s in o)L(r,s,a[s],o[s],n,t.$flags$)},M=(e,t,n,r)=>{let a,o,i=t.$children$[n],c=0;if(null!==i.$text$)a=i.$elm$=l.createTextNode(i.$text$);else if(a=i.$elm$=l.createElement(i.$tag$),C(null,i,false),null!=s&&a["s-si"]!==s&&a.classList.add(a["s-si"]=s),i.$children$)for(c=0;c<i.$children$.length;++c)o=M(e,i,c),o&&a.appendChild(o);return a},T=(e,t,n,s,a,o)=>{let l,i=e;for(i.shadowRoot&&i.tagName===r&&(i=i.shadowRoot);a<=o;++a)s[a]&&(l=M(null,n,a),l&&(s[a].$elm$=l,i.insertBefore(l,t)))},P=(e,t,n,s,r)=>{for(;t<=n;++t)(s=e[t])&&(r=s.$elm$,O(s),r.remove())},A=(e,t)=>e.$tag$===t.$tag$&&e.$key$===t.$key$,I=(e,t)=>{const n=t.$elm$=e.$elm$,s=e.$children$,r=t.$children$,a=t.$tag$,o=t.$text$;null===o?("slot"===a||C(e,t,false),null!==s&&null!==r?((e,t,n,s)=>{let r,a,o=0,l=0,i=0,c=0,$=t.length-1,m=t[0],h=t[$],d=s.length-1,u=s[0],g=s[d];for(;o<=$&&l<=d;)if(null==m)m=t[++o];else if(null==h)h=t[--$];else if(null==u)u=s[++l];else if(null==g)g=s[--d];else if(A(m,u))I(m,u),m=t[++o],u=s[++l];else if(A(h,g))I(h,g),h=t[--$],g=s[--d];else if(A(m,g))I(m,g),e.insertBefore(m.$elm$,h.$elm$.nextSibling),m=t[++o],g=s[--d];else if(A(h,u))I(h,u),e.insertBefore(h.$elm$,m.$elm$),h=t[--$],u=s[++l];else{for(i=-1,c=o;c<=$;++c)if(t[c]&&null!==t[c].$key$&&t[c].$key$===u.$key$){i=c;break}i>=0?(a=t[i],a.$tag$!==u.$tag$?r=M(t&&t[l],n,i):(I(a,u),t[i]=void 0,r=a.$elm$),u=s[++l]):(r=M(t&&t[l],n,l),u=s[++l]),r&&m.$elm$.parentNode.insertBefore(r,m.$elm$)}o>$?T(e,null==s[d+1]?null:s[d+1].$elm$,n,s,l,d):l>d&&P(t,o,$)})(n,s,t,r):null!==r?(null!==e.$text$&&(n.textContent=""),T(n,null,t,r,0,r.length-1)):null!==s&&P(s,0,s.length-1)):e.$text$!==o&&(n.data=o)},O=e=>{e.$attrs$&&e.$attrs$.ref&&e.$attrs$.ref(null),e.$children$&&e.$children$.map(O)},q=(e,t)=>{const n=e.$hostElement$,a=e.$cmpMeta$,o=e.$vnode$||j(null,null),l=(i=t)&&i.$tag$===b?t:x(null,null,t);var i;r=n.tagName,a.$attrsToReflect$&&(l.$attrs$=l.$attrs$||{},a.$attrsToReflect$.map((([e,t])=>l.$attrs$[t]=n[e]))),l.$tag$=null,l.$flags$|=4,e.$vnode$=l,l.$elm$=o.$elm$=n.shadowRoot||n,s=n["s-sc"],I(o,l)},H=e=>ne(e).$hostElement$,U=(e,t,n)=>{const s=H(e);return{emit:e=>D(s,t,{bubbles:!!(4&n),composed:!!(2&n),cancelable:!!(1&n),detail:e})}},D=(e,t,n)=>{const s=i.ce(t,n);return e.dispatchEvent(s),s},F=(e,t)=>{t&&!e.$onRenderResolve$&&t["s-p"]&&t["s-p"].push(new Promise((t=>e.$onRenderResolve$=t)))},_=(e,t)=>{if(e.$flags$|=16,4&e.$flags$)return void(e.$flags$|=512);F(e,e.$ancestorComponent$);return fe((()=>B(e,t)))},B=(e,t)=>{const n=(e.$cmpMeta$.$tagName$,()=>{}),s=e.$lazyInstance$;let r;return t&&(e.$flags$|=256,e.$queuedListeners$&&(e.$queuedListeners$.map((([e,t])=>G(s,e,t))),e.$queuedListeners$=null),r=G(s,"componentWillLoad")),n(),K(r,(()=>Z(e,s,t)))},Z=async(e,t,n)=>{const s=e.$hostElement$,r=(e.$cmpMeta$.$tagName$,()=>{}),a=s["s-rc"];n&&p(e);const o=(e.$cmpMeta$.$tagName$,()=>{});z(e,t),a&&(a.map((e=>e())),s["s-rc"]=void 0),o(),r();{const t=s["s-p"],n=()=>W(e);0===t.length?n():(Promise.all(t).then(n),e.$flags$|=4,t.length=0)}},z=(e,t,n)=>{try{t=t.render(),e.$flags$&=-17,e.$flags$|=2,q(e,t)}catch(s){oe(s,e.$hostElement$)}return null},W=e=>{e.$cmpMeta$.$tagName$;const t=e.$hostElement$,n=()=>{},s=e.$lazyInstance$,r=e.$ancestorComponent$;64&e.$flags$?(G(s,"componentDidUpdate"),n()):(e.$flags$|=64,J(t),G(s,"componentDidLoad"),n(),e.$onReadyResolve$(t),r||V()),e.$onInstanceResolve$(t),e.$onRenderResolve$&&(e.$onRenderResolve$(),e.$onRenderResolve$=void 0),512&e.$flags$&&ge((()=>_(e,!1))),e.$flags$&=-517},V=e=>{J(l.documentElement),ge((()=>D(o,"appload",{detail:{namespace:"deckdeckgo-highlight-code"}})))},G=(e,t,n)=>{if(e&&e[t])try{return e[t](n)}catch(s){oe(s)}},K=(e,t)=>e&&e.then?e.then(t):t(),J=e=>e.classList.add("hydrated"),Y=(e,t,n,s)=>{const r=ne(e),a=r.$hostElement$,o=r.$instanceValues$.get(t),l=r.$flags$,i=r.$lazyInstance$;var c,$;if(c=n,$=s.$members$[t][0],n=null==c||v(c)?c:4&$?"false"!==c&&(""===c||!!c):1&$?String(c):c,!(8&l&&void 0!==o||n===o)&&(r.$instanceValues$.set(t,n),i)){if(s.$watchers$&&128&l){const e=s.$watchers$[t];e&&e.map((e=>{try{i[e](n,o,t)}catch(s){oe(s,a)}}))}2==(18&l)&&_(r,!1)}},Q=(e,t,n)=>{if(t.$members$){e.watchers&&(t.$watchers$=e.watchers);const s=Object.entries(t.$members$),r=e.prototype;if(s.map((([e,[s]])=>{31&s||2&n&&32&s?Object.defineProperty(r,e,{get(){return t=e,ne(this).$instanceValues$.get(t);var t},set(n){Y(this,e,n,t)},configurable:!0,enumerable:!0}):1&n&&64&s&&Object.defineProperty(r,e,{value(...t){const n=ne(this);return n.$onInstancePromise$.then((()=>n.$lazyInstance$[e](...t)))}})})),1&n){const n=new Map;r.attributeChangedCallback=function(e,t,s){i.jmp((()=>{const t=n.get(e);if(this.hasOwnProperty(t))s=this[t],delete this[t];else if(r.hasOwnProperty(t)&&"number"==typeof this[t]&&this[t]==s)return;this[t]=(null!==s||"boolean"!=typeof this[t])&&s}))},e.observedAttributes=s.filter((([e,t])=>15&t[0])).map((([e,s])=>{const r=s[1]||e;return n.set(r,e),512&s[0]&&t.$attrsToReflect$.push([e,r]),r}))}}return e},X=async(e,t,n,s,r)=>{if(0==(32&t.$flags$)){{if(t.$flags$|=32,(r=ie(n)).then){const e=()=>{};r=await r,e()}r.isProxied||(n.$watchers$=r.watchers,Q(r,n,2),r.isProxied=!0);const e=(n.$tagName$,()=>{});t.$flags$|=8;try{new r(t)}catch(l){oe(l)}t.$flags$&=-9,t.$flags$|=128,e()}if(r.style){let e=r.style;const t=y(n);if(!ce.has(t)){const s=(n.$tagName$,()=>{});((e,t,n)=>{let s=ce.get(e);$&&n?(s=s||new CSSStyleSheet,s.replace(t)):s=t,ce.set(e,s)})(t,e,!!(1&n.$flags$)),s()}}}const a=t.$ancestorComponent$,o=()=>_(t,!0);a&&a["s-rc"]?a["s-rc"].push(o):o()},ee=(e,t={})=>{const n=()=>{},s=[],r=t.exclude||[],a=o.customElements,c=l.head,$=c.querySelector("meta[charset]"),h=l.createElement("style"),d=[];let u,g=!0;Object.assign(i,t),i.$resourcesUrl$=new URL(t.resourcesUrl||"./",l.baseURI).href,e.map((e=>{e[1].map((t=>{const n={$flags$:t[0],$tagName$:t[1],$members$:t[2],$listeners$:t[3]};n.$members$=t[2],n.$listeners$=t[3],n.$attrsToReflect$=[],n.$watchers$={};const o=n.$tagName$,l=class extends HTMLElement{constructor(e){super(e),re(e=this,n),1&n.$flags$&&e.attachShadow({mode:"open"})}connectedCallback(){u&&(clearTimeout(u),u=null),g?d.push(this):i.jmp((()=>(e=>{if(0==(1&i.$flags$)){const t=ne(e),n=t.$cmpMeta$,s=(n.$tagName$,()=>{});if(1&t.$flags$)m(e,t,n.$listeners$);else{t.$flags$|=1;{let n=e;for(;n=n.parentNode||n.host;)if(n["s-p"]){F(t,t.$ancestorComponent$=n);break}}n.$members$&&Object.entries(n.$members$).map((([t,[n]])=>{if(31&n&&e.hasOwnProperty(t)){const n=e[t];delete e[t],e[t]=n}})),X(0,t,n)}s()}})(this)))}disconnectedCallback(){i.jmp((()=>(e=>{if(0==(1&i.$flags$)){const t=ne(e);t.$rmListeners$&&(t.$rmListeners$.map((e=>e())),t.$rmListeners$=void 0)}})(this)))}componentOnReady(){return ne(this).$onReadyPromise$}};n.$lazyBundleId$=e[0],r.includes(o)||a.get(o)||(s.push(o),a.define(o,Q(l,n,1)))}))})),h.innerHTML=s+"{visibility:hidden}.hydrated{visibility:inherit}",h.setAttribute("data-styles",""),c.insertBefore(h,$?$.nextSibling:c.firstChild),g=!1,d.length?d.map((e=>e.connectedCallback())):i.jmp((()=>u=setTimeout(V,30))),n()},te=new WeakMap,ne=e=>te.get(e),se=(e,t)=>te.set(t.$lazyInstance$=e,t),re=(e,t)=>{const n={$flags$:0,$hostElement$:e,$cmpMeta$:t,$instanceValues$:new Map};return n.$onInstancePromise$=new Promise((e=>n.$onInstanceResolve$=e)),n.$onReadyPromise$=new Promise((e=>n.$onReadyResolve$=e)),e["s-p"]=[],e["s-rc"]=[],m(e,n,t.$listeners$),te.set(e,n)},ae=(e,t)=>t in e,oe=(e,t)=>(0,console.error)(e,t),le=new Map,ie=(e,t,s)=>{const r=e.$tagName$.replace(/-/g,"_"),a=e.$lazyBundleId$,o=le.get(a);return o?o[r]:n(9047)(`./${a}.entry.js`).then((e=>(le.set(a,e),e[r])),oe)},ce=new Map,$e=[],me=[],he=(e,t)=>n=>{e.push(n),a||(a=!0,t&&4&i.$flags$?ge(ue):i.raf(ue))},de=e=>{for(let n=0;n<e.length;n++)try{e[n](performance.now())}catch(t){oe(t)}e.length=0},ue=()=>{de($e),de(me),(a=$e.length>0)&&i.raf(ue)},ge=e=>c().then(e),fe=he(me,!0)},9047:function(e,t,n){var s={"./deckgo-highlight-code.entry.js":[5533,533]};function r(e){if(!n.o(s,e))return Promise.resolve().then((function(){var t=new Error("Cannot find module '"+e+"'");throw t.code="MODULE_NOT_FOUND",t}));var t=s[e],r=t[0];return n.e(t[1]).then((function(){return n(r)}))}r.keys=function(){return Object.keys(s)},r.id=9047,e.exports=r},4186:function(e,t,n){"use strict";n.d(t,{Z:function(){return m}});var s=n(4578),r=n(7294),a=n(1883),o=n(2441),l=n(5893);let i=function(e){function t(){return e.apply(this,arguments)||this}return(0,s.Z)(t,e),t.prototype.render=function(){return(0,l.jsx)("div",{className:"css-menu "+("column"===this.props.direction?"column":"row"),children:o.GI.map((e=>(0,l.jsxs)("a",{target:e.target,href:e.href,children:[(0,l.jsx)("i",{className:"iconfont icon-"+e.icon}),e.name]},e.name)))})},t}(r.Component),c={marginBottom:"1rem"},$=function(e){function t(){for(var t,n=arguments.length,s=new Array(n),r=0;r<n;r++)s[r]=arguments[r];return(t=e.call.apply(e,[this].concat(s))||this).state={menuState:!1,keyword:"",animation:[],year:"",days:"",theme:""},t.toggleTheme=()=>{"light"===t.state.theme?t.setTheme("dark"):t.setTheme("light")},t.setTheme=e=>{localStorage.setItem("theme",e),document.documentElement.className=e+"-theme",t.setState({theme:e})},t.toggleMenuState=()=>{t.setState({menuState:!t.state.menuState})},t.change=e=>{t.setState({keyword:e.target.value})},t.search=()=>{window.open("https://cn.bing.com/search?q=site%3Anocoder.org%20"+t.state.keyword)},t.formatTime=e=>{const t=e/1e3;return" "+Math.floor(t/60/60/24)+" 天"},t.handleEnter=e=>{13===e.keyCode&&t.search()},t}(0,s.Z)(t,e);var n=t.prototype;return n.componentDidMount=function(){this.setState({theme:window.theme,year:(new Date).getFullYear(),days:this.formatTime(new Date-new Date("2018-12-05T14:13:38"))});window.matchMedia("(prefers-color-scheme: dark)").addListener((e=>{e.matches?this.setTheme("dark"):this.setTheme("light")}))},n.render=function(){const{menuState:e,days:t,year:n,theme:s}=this.state,{pageName:$,pageDescript:m,children:h,aside:d,className:u}=this.props,g=(0,l.jsxs)("div",{children:[(0,l.jsxs)(a.rU,{style:{boxShadow:"none",textDecoration:"none",fontWeight:200},className:"usubeni",to:"/tag/coding/",children:[(0,l.jsx)("span",{className:"logo-mobile",children:o.aD}),(0,l.jsx)("img",{className:"logo",src:"/funny-eagle.jpg"})]}),$?(0,l.jsx)("div",{className:"page-name",children:"# "+$}):null]});return(0,l.jsxs)("div",{className:u,children:[(0,l.jsxs)("div",{className:"css-main",children:[(0,l.jsx)("article",{className:"css-post",children:h}),(0,l.jsxs)("aside",{className:"css-aside "+(e?"open":"close"),children:[(0,l.jsxs)("header",{className:"css-header",children:[g,(0,l.jsx)("div",{className:"menu-button",onClick:this.toggleMenuState,children:(0,l.jsx)("i",{className:"iconfont icon-"+(e?"close":"menu")})}),(0,l.jsx)("meta",{name:"google-adsense-account",content:"ca-pub-1730830298664620"}),(0,l.jsx)("script",{async:!0,src:"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1730830298664620",crossorigin:"anonymous"})]}),d?(0,l.jsx)("div",{className:"css-toc",onClick:this.toggleMenuState,dangerouslySetInnerHTML:{__html:d}}):(0,l.jsxs)(r.Fragment,{children:[(0,l.jsx)(i,{direction:"column"}),(0,l.jsx)("div",{style:{textAlign:"center",marginBottom:"20px"},children:(0,l.jsx)("input",{placeholder:"关键字，然后 Enter",onChange:this.change,onKeyUp:this.handleEnter})})]})]})]}),(0,l.jsxs)("footer",{children:[(0,l.jsx)("div",{className:"social-media",style:c,children:o.LF.map((e=>(0,l.jsx)("a",{target:"_blank",href:e.href,children:(0,l.jsx)("i",{className:"iconfont icon-"+e.icon})},e.icon)))}),(0,l.jsxs)("div",{style:c,children:["© ",n," FunnyEagle.CN • Theme"," ",(0,l.jsx)("a",{className:"usubeni",target:"_blank",href:"https://github.com/ssshooter/gatsby-theme-usubeni",children:"usubeni"})," ","• Powered by"," ",(0,l.jsx)("a",{className:"usubeni",target:"_blank",href:"https://www.gatsbyjs.org/",children:"Gatsbyjs"})]})]}),(0,l.jsx)("div",{className:"theme-toggle",onClick:this.toggleTheme,children:"light"===s?"☀":"☾"})]})},t}(r.Component);var m=$},123:function(e,t,n){"use strict";n.d(t,{Z:function(){return o}});var s=n(7294),r=n(1883),a=n(5893);function o(e){return(0,a.jsxs)("div",{className:"css-info",children:[(0,a.jsx)("span",{style:{paddingRight:"12px"},children:e.date}),e.tags?(0,a.jsx)(s.Fragment,{children:e.tags.map(((e,t)=>(0,a.jsx)("span",{style:{paddingRight:"8px"},children:(0,a.jsx)(r.rU,{to:"/tag/"+e,children:e})},e)))}):null]})}},5049:function(e,t,n){"use strict";n.d(t,{Z:function(){return a}});n(7294);var s=n(1883);var r=n(5893);var a=function(e){let{description:t,keywords:n,image:a,title:o,pathname:l}=e;const i=(0,s.K2)("2052298874").site.siteMetadata,c={title:o+" | "+i.title,url:""+i.siteUrl+(l||""),description:t||i.description,keywords:n||i.keywords,author:i.author,image:a};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)("title",{children:c.title}),(0,r.jsx)("meta",{name:"google-adsense-account",content:"ca-pub-1730830298664620"}),(0,r.jsx)("script",{async:!0,src:"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1730830298664620",crossorigin:"anonymous"}),(0,r.jsx)("link",{rel:"canonical",href:c.url}),(0,r.jsx)("meta",{name:"keywords",content:c.keywords.join(",")}),(0,r.jsx)("meta",{name:"description",content:c.description}),(0,r.jsx)("meta",{property:"og:title",content:c.title}),(0,r.jsx)("meta",{property:"og:description",content:c.description}),(0,r.jsx)("meta",{name:"twitter:title",content:c.title}),(0,r.jsx)("meta",{name:"twitter:card",content:"summary"}),(0,r.jsx)("meta",{name:"twitter:url",content:c.url}),(0,r.jsx)("meta",{name:"twitter:description",content:c.description}),(0,r.jsx)("meta",{name:"twitter:creator",content:c.author}),c.img?(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)("meta",{name:"twitter:card",content:"summary_large_image"}),(0,r.jsx)("meta",{name:"twitter:image",content:c.image.src}),(0,r.jsx)("meta",{name:"image",content:c.image.src}),(0,r.jsx)("meta",{property:"og:image:width",content:c.image.width}),(0,r.jsx)("meta",{property:"og:image:height",content:c.image.height})]}):null]})}},2441:function(e,t,n){"use strict";n.d(t,{GI:function(){return a},JW:function(){return r},LF:function(){return o},Vs:function(){return i},aD:function(){return s},l8:function(){return l}});const s="Funny Eagle",r="https://wwwiki.top",a=[{icon:"coding",name:"编程",href:"/tag/coding/"},{icon:"music",name:"音乐",href:"/tag/music/"},{icon:"life",name:"生活",href:"/tag/life/"},{icon:"tag",name:"标签",href:"/tags"},{icon:"archive",name:"归档",href:"/archive"},{icon:"person",name:"关于",href:"/about"}],o=[{icon:"weibo",href:"https://weibo.com/227307890"},{icon:"github-fill",href:"https://github.com/nocdr"},{icon:"twitter",href:"https://twitter.com/yangjinlong86"},{icon:"rss",href:"http://funnyeagle.cn/rss.xml"}],l=[{title:"ECMA-262, 9th edition",description:"ECMAScript 语言规范",href:"https://www.ecma-international.org/ecma-262/9.0/index.html",img:"https://www.ecma-international.org/ecma-262/9.0/img/ecma-logo.svg"}],i=[{title:"老鹰杰森",description:"老鹰杰森的个人网站",href:"http://funnyeagle.cn",img:"http://funnyeagle.cn/static/df1082d3ffc5b1288b5e7e78fe346036/ee81f/profile-pic.avif"}]},790:function(e,t,n){"use strict";n.r(t),n.d(t,{Head:function(){return u},default:function(){return d}});var s=n(4578),r=n(7294),a=n(1883),o=n(4186),l=n(123),i=n(5049),c=n(7290);!function(){if("undefined"!=typeof window&&void 0!==window.Reflect&&void 0!==window.customElements){var e=HTMLElement;window.HTMLElement=function(){return Reflect.construct(e,[],this.constructor)},HTMLElement.prototype=e.prototype,HTMLElement.prototype.constructor=HTMLElement,Object.setPrototypeOf(HTMLElement,e)}}();var $,m=n(5893);"undefined"==typeof window?Promise.resolve():(0,c.p)().then((()=>(0,c.b)([["deckgo-highlight-code",[[1,"deckgo-highlight-code",{language:[513],highlightLines:[513,"highlight-lines"],lineNumbers:[516,"line-numbers"],terminal:[513],editable:[4],theme:[513],revealProgress:[1025,"reveal-progress"],themeStyle:[32],loaded:[32],highlightRows:[32],load:[64],reveal:[64],hide:[64],revealAll:[64],hideAll:[64],nextHighlight:[64],prevHighlight:[64]},[[5,"prismLanguageLoaded","onLanguageLoaded"],[5,"prismLanguageError","onLanguageError"],[8,"copy","onCopyCleanZeroWidthSpaces"]]]]]],$)));let h=function(e){function t(){for(var t,n=arguments.length,s=new Array(n),r=0;r<n;r++)s[r]=arguments[r];return(t=e.call.apply(e,[this].concat(s))||this).componentDidMount=()=>{let e=location.hash||"";e&&(document.querySelector('.css-toc a[href*="'+e+'"]').className="active");let t=document.querySelectorAll(".css-toc a");for(let n of Array.from(t))n.addEventListener("click",(t=>{if(e){document.querySelector('.css-toc a[href*="'+e+'"]').className=""}n.className="active",e=n.hash}));document.addEventListener("scroll",(()=>{let t=Array.from(document.querySelectorAll("h2,h3,h4,h5,h6"));if(0===t.length)return;let n=[];for(let e of t){e.getBoundingClientRect().top<=50&&n.push(e)}if(!n.length)return;let s=n[n.length-1];if(e!==s.hash){if(e){let t=document.querySelector('.css-toc a[href*="'+e+'"]');t&&(t.className="")}let t=document.querySelector('.css-toc a[href*="'+encodeURIComponent(s.id)+'"]');t.className="active",e=t.hash}}))},t}return(0,s.Z)(t,e),t.prototype.render=function(){const e=this.props.data.markdownRemark,{slug:t,previous:n,next:s}=this.props.pageContext;return(0,m.jsxs)(o.Z,{aside:e.tableOfContents,children:[(0,m.jsx)("h1",{children:e.frontmatter.title}),(0,m.jsx)(l.Z,{date:e.frontmatter.date,tags:e.frontmatter.tags}),(0,m.jsx)("div",{className:"css-post-main",dangerouslySetInnerHTML:{__html:e.html}}),(0,m.jsx)("hr",{}),(0,m.jsxs)("ul",{className:"button-wrapper",children:[(0,m.jsx)("li",{children:n&&(0,m.jsx)(a.rU,{to:n.fields.slug,rel:"prev",children:(0,m.jsxs)("button",{children:["Prev: ",n.frontmatter.title]})})}),(0,m.jsx)("li",{children:s&&(0,m.jsx)(a.rU,{to:s.fields.slug,rel:"next",children:(0,m.jsxs)("button",{children:["Next: ",s.frontmatter.title]})})})]})]})},t}(r.Component);var d=h;const u=e=>{let{data:t,location:n}=e;const s=t.markdownRemark,r=n.pathname,a=s.frontmatter.description||s.excerpt;return(0,m.jsx)(i.Z,{title:s.frontmatter.title,description:a,keywords:s.frontmatter.tags,pathname:r})}}}]);
//# sourceMappingURL=component---src-templates-blog-post-js-1a471a7f6749154638a2.js.map