(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-register-register"],{"13b9":function(o,n,t){"use strict";t.r(n);var i=t("725e"),a=t("8182");for(var e in a)"default"!==e&&function(o){t.d(n,o,(function(){return a[o]}))}(e);t("a2c2");var s,r=t("f0c5"),c=Object(r["a"])(a["default"],i["b"],i["c"],!1,null,"50b5baa6",null,!1,i["a"],s);n["default"]=c.exports},4572:function(o,n,t){"use strict";var i,a;Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e={onLoad:function(){i=this},data:function(){return{isPassword:!1,isLogin:!1,second:0,form:{username:void 0,password:void 0,yzm:void 0}}},computed:{yanzhengma:function(){return 0==this.second?"获取验证码":this.second<10?"重新获取0"+this.second:"重新获取"+this.second}},methods:{clear:function(){clearInterval(a),a=null,this.second=0},getcode:function(){this.second>0||(this.second=60,a=setInterval((function(){i.second--,0==i.second&&i.clear()}),1e3))},login:function(){this.form.password.length<6?uni.showToast({icon:"none",title:"密码少于6位"}):this.$request("/login/register",{phone:this.form.username,pwd:this.form.password,codes:uni.getStorageSync("token_code")},"POST").then((function(o){1==o.code?(uni.setStorageSync("uni_id_token",o.data.token),uni.showToast({icon:"success",title:"注册成功！"}),uni.navigateTo({url:"/pages/login/login"})):uni.showToast({icon:"none",title:o.message})}))},goLogin:function(){uni.navigateTo({url:"/pages/login/login"})},goBack:function(){}},watch:{form:{handler:function(o,n){this.isLogin=!(!o.password||!o.username)},deep:!0}}};n.default=e},"725e":function(o,n,t){"use strict";var i;t.d(n,"b",(function(){return a})),t.d(n,"c",(function(){return e})),t.d(n,"a",(function(){return i}));var a=function(){var o=this,n=o.$createElement,t=o._self._c||n;return t("v-uni-view",{staticClass:"loginPage"},[t("v-uni-view",{staticClass:"goBack",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.goBack()}}},[t("v-uni-view",{staticClass:"iconfont icon-right"})],1),t("v-uni-view",{staticClass:"goLogin",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.goLogin()}}},[o._v("登录")]),t("v-uni-view",{staticClass:"login-form"},[t("v-uni-view",{staticClass:"body-form"},[t("v-uni-view",{staticClass:"body-form-item"},[o.form.username?t("v-uni-text",{staticClass:"label-form"},[o._v("账号:")]):o._e(),t("v-uni-input",{style:o.form.username?"margin-top: 20rpx;":"",attrs:{type:"text",placeholder:"手机号/账号",maxlength:"11","data-key":"mobile"},model:{value:o.form.username,callback:function(n){o.$set(o.form,"username",n)},expression:"form.username"}})],1),t("v-uni-view",{staticClass:"body-form-item"},[o.form.password?t("v-uni-text",{staticClass:"label-form"},[o._v("密码:")]):o._e(),t("v-uni-input",{style:o.form.password?"margin-top: 20rpx;":"",attrs:{password:!o.isPassword,maxlength:"26",placeholder:"请输入您的密码"},model:{value:o.form.password,callback:function(n){o.$set(o.form,"password",n)},expression:"form.password"}}),t("v-uni-view",{staticClass:"more"},[o.form.password?t("v-uni-text",{staticClass:"iconfont",class:o.isPassword?"icon-eye-on":"icon-eye-off",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.isPassword=!o.isPassword}}}):o._e()],1)],1),t("v-uni-view",{staticClass:"btn-info"},[t("v-uni-view",{staticClass:"loginBtn",style:o.isLogin?"opacity:0.8":"opacity:0.4",on:{click:function(n){arguments[0]=n=o.$handleEvent(n),o.isLogin&&o.login()}}},[t("v-uni-text",[o._v("注册")])],1)],1)],1)],1)],1)},e=[]},"7d34":function(o,n,t){var i=t("24fb");n=i(!1),n.push([o.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-input[data-v-50b5baa6]:-webkit-autofill{background-color:initial!important;box-shadow:inset 0 0 0 1000px #f7f7f7!important}.loginPage[data-v-50b5baa6]{width:100%;min-height:100%;background:url(/static/login/loginbg.png) no-repeat;background-size:cover;position:absolute}.loginPage .goBack[data-v-50b5baa6]{position:absolute;top:%?50?%;left:%?40?%}.loginPage .goBack .icon-right[data-v-50b5baa6]{width:%?50?%;height:%?50?%;background:url(/static/icon/back.png) no-repeat;background-size:100% 100%}.loginPage .goLogin[data-v-50b5baa6]{position:absolute;top:%?50?%;right:%?50?%;font-size:%?32?%;color:#fff;opacity:.8}.loginPage .login-form[data-v-50b5baa6]{position:absolute;top:20%;left:6%;width:%?650?%;height:%?600?%}.loginPage .login-form .title-form[data-v-50b5baa6]{font-size:%?42?%;font-family:PingFang SC;font-weight:500;color:#fff}.loginPage .login-form .body-form[data-v-50b5baa6]{\n  /* 按钮 */}.loginPage .login-form .body-form .body-form-item[data-v-50b5baa6]{width:100%;height:%?100?%;color:#fff;font-size:%?32?%;margin-bottom:%?34?%;display:flex;align-items:center;justify-content:space-between;height:%?100?%;border-bottom:%?2?% solid #c4c4c4;position:relative}.loginPage .login-form .body-form .body-form-item .label-form[data-v-50b5baa6]{position:absolute;top:%?-8?%;left:%?2?%;font-size:%?26?%}.loginPage .login-form .body-form .body-form-item .more[data-v-50b5baa6]{position:absolute;display:flex;align-items:center;justify-content:flex-end;right:%?10?%;width:%?200?%;height:%?40?%;font-size:%?30?%;color:#fff}.loginPage .login-form .body-form .btn-info[data-v-50b5baa6]{height:%?100?%;margin-top:%?80?%}.loginPage .login-form .body-form .btn-info .loginBtn[data-v-50b5baa6],\n.loginPage .login-form .body-form .btn-info .weixinLoginBtn[data-v-50b5baa6]{display:flex;align-items:center;justify-content:center;margin:0 auto;border-radius:%?500?%;color:#fff;font-size:%?40?%;opacity:.4;width:100%;height:%?100?%;width:90%}.loginPage .login-form .body-form .btn-info .loginBtn[data-v-50b5baa6]{background:#ff4c80}.loginPage .login-form .body-form .btn-info .weixinLoginBtn[data-v-50b5baa6]{background:#4feb77;margin-top:%?22?%}',""]),o.exports=n},8182:function(o,n,t){"use strict";t.r(n);var i=t("4572"),a=t.n(i);for(var e in i)"default"!==e&&function(o){t.d(n,o,(function(){return i[o]}))}(e);n["default"]=a.a},"91d7":function(o,n,t){var i=t("7d34");"string"===typeof i&&(i=[[o.i,i,""]]),i.locals&&(o.exports=i.locals);var a=t("4f06").default;a("149954f1",i,!0,{sourceMap:!1,shadowMode:!1})},a2c2:function(o,n,t){"use strict";var i=t("91d7"),a=t.n(i);a.a}}]);