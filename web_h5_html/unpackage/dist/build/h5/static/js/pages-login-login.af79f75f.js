(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-login-login"],{1079:function(o,n,t){"use strict";var e;t.d(n,"b",(function(){return i})),t.d(n,"c",(function(){return a})),t.d(n,"a",(function(){return e}));var i=function(){var o=this,n=o.$createElement,t=o._self._c||n;return t("v-uni-view",{staticClass:"loginPage"},[t("v-uni-view",{staticClass:"goRegister",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.goRegister()}}},[o._v("注册")]),t("v-uni-view",{staticClass:"login-form"},[t("v-uni-view",{staticClass:"title-form"},[o._v("账号登录")]),t("v-uni-view",{staticClass:"body-form"},[t("v-uni-view",{staticClass:"body-form-item"},[o.form.username?t("v-uni-text",{staticClass:"label-form"},[o._v("账号:")]):o._e(),t("v-uni-input",{style:o.form.username?"margin-top: 20rpx;":"",attrs:{type:"text",placeholder:"手机号/账号",maxlength:"11","data-key":"mobile"},model:{value:o.form.username,callback:function(n){o.$set(o.form,"username",n)},expression:"form.username"}})],1),t("v-uni-view",{staticClass:"body-form-item"},[o.form.password?t("v-uni-text",{staticClass:"label-form"},[o._v("密码:")]):o._e(),t("v-uni-input",{style:o.form.password?"margin-top: 20rpx;":"",attrs:{password:!o.isPassword,maxlength:"26",placeholder:"请输入您的密码"},model:{value:o.form.password,callback:function(n){o.$set(o.form,"password",n)},expression:"form.password"}}),t("v-uni-view",{staticClass:"more"},[o.form.password?t("v-uni-text",{staticClass:"iconfont icon-close1",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.form.password=void 0}}}):t("v-uni-text"),t("v-uni-text",{staticClass:"iconfont",class:o.isPassword?"icon-eye-on":"icon-eye-off",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.isPassword=!o.isPassword}}}),t("v-uni-text",[o._v("|")]),t("v-uni-text",{on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.forget.apply(void 0,arguments)}}},[o._v("忘记密码")])],1)],1),t("v-uni-view",{staticClass:"btn-info"},[t("v-uni-view",{staticClass:"loginBtn",style:o.isLogin?"opacity:0.8":"opacity:0.4",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.isLogin&&o.login()}}},[t("v-uni-text",[o._v("登录")])],1),t("v-uni-view",{staticClass:"weixinLoginBtn",staticStyle:{opacity:"0.8"},on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.weixinLogin()}}},[t("v-uni-text",[o._v("微信登录")])],1)],1)],1)],1)],1)},a=[]},"26c6":function(o,n,t){var e=t("ed8b");"string"===typeof e&&(e=[[o.i,e,""]]),e.locals&&(o.exports=e.locals);var i=t("4f06").default;i("cc44b1d0",e,!0,{sourceMap:!1,shadowMode:!1})},"8abf":function(o,n,t){"use strict";var e=t("26c6"),i=t.n(e);i.a},baeb:function(o,n,t){"use strict";t.r(n);var e=t("1079"),i=t("d5a9");for(var a in i)"default"!==a&&function(o){t.d(n,o,(function(){return i[o]}))}(a);t("8abf");var s,r=t("f0c5"),c=Object(r["a"])(i["default"],e["b"],e["c"],!1,null,"521dcde9",null,!1,e["a"],s);n["default"]=c.exports},d5a9:function(o,n,t){"use strict";t.r(n);var e=t("ef79"),i=t.n(e);for(var a in e)"default"!==a&&function(o){t.d(n,o,(function(){return e[o]}))}(a);n["default"]=i.a},ed8b:function(o,n,t){var e=t("24fb");n=e(!1),n.push([o.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-input[data-v-521dcde9]:-webkit-autofill{background-color:initial!important;box-shadow:inset 0 0 0 1000px #f7f7f7!important}.loginPage[data-v-521dcde9]{width:100%;min-height:100%;background:url(/static/login/loginbg.png) no-repeat;background-size:cover;position:absolute}.loginPage .goRegister[data-v-521dcde9]{position:absolute;top:%?50?%;right:%?30?%;font-size:%?28?%;color:#fff;opacity:.8}.loginPage .login-form[data-v-521dcde9]{position:absolute;top:16%;left:6%;width:%?650?%;height:%?600?%}.loginPage .login-form .title-form[data-v-521dcde9]{font-size:%?42?%;font-family:PingFang SC;font-weight:500;color:#fff}.loginPage .login-form .body-form[data-v-521dcde9]{margin-top:%?40?%\n  /* 按钮 */}.loginPage .login-form .body-form .body-form-item[data-v-521dcde9]{width:100%;height:%?100?%;color:#fff;font-size:%?32?%;margin-bottom:%?44?%;display:flex;align-items:center;justify-content:space-between;height:%?100?%;border-bottom:%?2?% solid #c4c4c4;position:relative}.loginPage .login-form .body-form .body-form-item .label-form[data-v-521dcde9]{position:absolute;top:%?-8?%;left:%?2?%;font-size:%?26?%}.loginPage .login-form .body-form .body-form-item .more[data-v-521dcde9]{position:absolute;display:flex;align-items:center;justify-content:space-between;right:%?10?%;width:%?240?%;height:%?40?%;font-size:%?30?%;color:#fff}.loginPage .login-form .body-form .btn-info[data-v-521dcde9]{height:%?100?%;margin-top:%?80?%}.loginPage .login-form .body-form .btn-info .loginBtn[data-v-521dcde9],\n.loginPage .login-form .body-form .btn-info .weixinLoginBtn[data-v-521dcde9]{display:flex;align-items:center;justify-content:center;margin:0 auto;border-radius:%?500?%;color:#fff;font-size:%?40?%;opacity:.4;width:100%;height:%?100?%;width:90%}.loginPage .login-form .body-form .btn-info .loginBtn[data-v-521dcde9]{background:#ff4c80}.loginPage .login-form .body-form .btn-info .weixinLoginBtn[data-v-521dcde9]{background:#4feb77;margin-top:%?22?%}',""]),o.exports=n},ef79:function(o,n,t){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e={data:function(){return{isPassword:!1,isLogin:!1,form:{username:void 0,password:void 0},code:""}},mounted:function(){this.out()},onLoad:function(o){this.code=o.code,this.code&&this.getCode()},methods:{out:function(){uni.removeStorageSync("uni_id_token"),this.$request("/login/out",{id:this.id},"POST").then((function(o){}))},login:function(){this.form.password.length<6?uni.showToast({icon:"none",title:"密码少于6位"}):this.$request("/login/index",{phone:this.form.username,pwd:this.form.password},"POST").then((function(o){1==o.code?(uni.setStorageSync("uni_id_token",o.data.token),uni.showToast({icon:"success",title:"登录成功！"}),uni.navigateTo({url:"/pages/UserCenter/UserCenter"})):(console.log(o),uni.showToast({icon:"none",title:o.message}))}))},weixinLogin:function(){this.getCode()},getCode:function(){var o=this,n="",t="",e=uni.getStorageSync("token_code");this.$request("/wx/app",{codes:e}).then((function(i){if(1==i.code)if(n=i.data.app,t=i.data.url+"/pages/login/login",o.code)o.$request("/wx/access_token",{code:o.code,codes:e,pwd:o.form.password},"POST").then((function(o){console.log(o),1==o.code?(uni.setStorageSync("uni_id_token",o.data.token),uni.showToast({icon:"success",title:"登录成功！"}),uni.navigateTo({url:"/pages/UserCenter/UserCenter"})):uni.showToast({icon:"none",title:o.message})}));else{var a=encodeURIComponent(t);window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+n+"&redirect_uri="+a+"&response_type=code&scope=snsapi_userinfo&state=#wechat_redirect"}else uni.showToast({icon:"none",title:"appid不存在"})}))},goRegister:function(){uni.navigateTo({url:"/pages/register/register"})},forget:function(){}},watch:{form:{handler:function(o,n){this.isLogin=!(!o.password||!o.username)},deep:!0}}};n.default=e}}]);