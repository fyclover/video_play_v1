(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-setting-setting"],{"4af2":function(t,e,n){"use strict";var a=n("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=a(n("fbbd")),o={data:function(){return{}},methods:{toUserinfo:function(){uni.navigateTo({url:"/pages/info/info"})},guanyuwomen:function(){uni.navigateTo({url:"/pages/about/about"})},logout:function(){i.default.logout({}).then((function(t){1!=t.code?uni.showToast({title:t.message||"请求失败",icon:"none"}):uni.navigateTo({url:"/pages/login/login"})})).catch((function(t){console.log("err:",t)}))}}};e.default=o},"6db7":function(t,e,n){"use strict";var a=n("4ea4");n("caad"),n("d3b7"),n("2532"),Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=a(n("5530")),o=a(n("d9d3")),r={common:{header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},method:"GET",data:{}},request:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return t.url=o.default.baseUrl+t.url,t.method=t.method||this.common.method,t.data=t.data||{},t.header=t.header||this.common.header,t.url.includes("login")||t.url.includes("/upload")||(t.header["x-csrf-token"]=uni.getStorageSync("token")),new Promise((function(e,n){uni.request((0,i.default)((0,i.default)({},t),{},{success:function(t){return 200!==t.statusCode?n(t.data):255!=t.data.code?e(t.data):void uni.navigateTo({url:"/pages/login/login"})},fail:function(t){return n(t)}}))}))},get:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return n.url=t,n.data=e,n.method="GET",this.request(n)},post:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return n.url=t,n.data=e,n.method="POST",this.request(n)},upload:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return n.url=o.default.baseUrl+t,n.filePath=e.image.path||"",n.method="POST",n.header=n.header||{},console.log("options:",e.image.path),n.name=n.name||"image",new Promise((function(n,a){uni.uploadFile({header:{},url:o.default.baseUrl+t,filePath:e.image.path,name:"image",formData:{user:"test"},success:function(t){if(console.log("ddddddddddddd"),200===t.statusCode)return n(JSON.parse(t.data))}})}))}};e.default=r},7313:function(t,e,n){"use strict";n.r(e);var a=n("4af2"),i=n.n(a);for(var o in a)"default"!==o&&function(t){n.d(e,t,(function(){return a[t]}))}(o);e["default"]=i.a},"74c4":function(t,e,n){"use strict";var a=n("96ff"),i=n.n(a);i.a},"7cce":function(t,e,n){"use strict";var a;n.d(e,"b",(function(){return i})),n.d(e,"c",(function(){return o})),n.d(e,"a",(function(){return a}));var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("v-uni-view",{staticClass:"setting"},[n("v-uni-view",{staticClass:"setting_section"},[n("v-uni-view",{staticClass:"setting_row"},[n("v-uni-text",[t._v("基本信息")]),n("v-uni-view",{staticClass:"setting_id setting_ne",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.toUserinfo()}}},[n("v-uni-text"),n("img",{staticClass:"setting_next",attrs:{src:"/static/video/next.svg",alt:""}})],1)],1),n("v-uni-view",{staticClass:"setting_row"},[n("v-uni-text",[t._v("关于我们")]),n("v-uni-view",{staticClass:"setting_id setting_ne"},[n("v-uni-text"),n("img",{staticClass:"setting_next",attrs:{src:"/static/video/next.svg",alt:""},on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.guanyuwomen()}}})],1)],1)],1),n("v-uni-view",{staticClass:"setting_section2"}),n("v-uni-button",{staticClass:"setting_btn",attrs:{type:"primary"},on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.logout()}}},[t._v("退出")])],1)},o=[]},"96ff":function(t,e,n){var a=n("cc61");a.__esModule&&(a=a.default),"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var i=n("4f06").default;i("93fd07ea",a,!0,{sourceMap:!1,shadowMode:!1})},bf01:function(t,e,n){"use strict";n.r(e);var a=n("7cce"),i=n("7313");for(var o in i)"default"!==o&&function(t){n.d(e,t,(function(){return i[t]}))}(o);n("74c4");var r,u=n("f0c5"),s=Object(u["a"])(i["default"],a["b"],a["c"],!1,null,"406a4a9f",null,!1,a["a"],r);e["default"]=s.exports},cc61:function(t,e,n){var a=n("24fb");e=a(!1),e.push([t.i,'@charset "UTF-8";\r\n/**\r\n * 这里是uni-app内置的常用样式变量\r\n *\r\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\r\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\r\n *\r\n */\r\n/**\r\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\r\n *\r\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\r\n */\r\n/* 颜色变量 */\r\n/* 行为相关颜色 */\r\n/* 文字基本颜色 */\r\n/* 背景颜色 */\r\n/* 边框颜色 */\r\n/* 尺寸变量 */\r\n/* 文字尺寸 */\r\n/* 图片尺寸 */\r\n/* Border Radius */\r\n/* 水平间距 */\r\n/* 垂直间距 */\r\n/* 透明度 */\r\n/* 文章场景相关 */uni-page-body[data-v-406a4a9f]{height:100%}.setting[data-v-406a4a9f]{height:100%;background-color:#f3f3f3;padding-top:%?30?%}.setting_section[data-v-406a4a9f]{background-color:#fff}.setting_row[data-v-406a4a9f]{display:flex;width:95%;border-bottom:1px solid #ededed;padding:%?40?% %?18?%;align-items:center;font-size:14px;font-family:PingFang SC;font-weight:500;color:#333;margin:0 auto}.setting_id[data-v-406a4a9f]{margin:0 0 0 auto;color:#999}.setting_ne[data-v-406a4a9f]{display:flex;align-items:center}.setting_next[data-v-406a4a9f]{width:%?40?%;height:auto}.setting_section2[data-v-406a4a9f]{background-color:#fff;margin-top:%?30?%}.setting_btn[data-v-406a4a9f]{width:89%;margin-top:%?50?%}',""]),t.exports=e},d9d3:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var a="https://api.bxgtv.top/home",i={baseUrl:a};e.default=i},fbbd:function(t,e,n){"use strict";var a=n("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=a(n("6db7")),o={login:function(t){return i.default.post("/login/index",t)},forgetPassword:function(t){return i.default.post("/login/forget",t)},logout:function(t){return i.default.post("/login/out",t)},register:function(t){return i.default.post("/login/register",t)},registerTest:function(t){return i.default.post("/login/register_test",t)},updatePhone:function(t){return i.default.post("/login/update_phone",t)}},r=o;e.default=r}}]);