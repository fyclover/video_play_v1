(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-search-search"],{"09c0":function(t,e,a){"use strict";a.r(e);var i=a("cc8c"),s=a.n(i);for(var n in i)["default"].indexOf(n)<0&&function(t){a.d(e,t,(function(){return i[t]}))}(n);e["default"]=s.a},"1fe7":function(t,e,a){var i=a("602f");i.__esModule&&(i=i.default),"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var s=a("4f06").default;s("38da0a04",i,!0,{sourceMap:!1,shadowMode:!1})},"3c0b":function(t,e,a){"use strict";var i=a("1fe7"),s=a.n(i);s.a},"5f19":function(t,e,a){"use strict";a("7a82");var i=a("4ea4").default;Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var s=i(a("a9a3")),n={getHotTopicList:function(t){return s.default.post("/goodsInfo/hotTopic",t)},getHotTopicLabel:function(t){return s.default.post("/goodsInfo/HotLabel",t)},getHotDramatist:function(t){return s.default.post("/goodsInfo/HotDramatist",t)},videoLike:function(t){return s.default.post("/goodsInfo/give",t)},publishComments:function(t){return s.default.post("/goodsInfo/comment",t)},getRankVideos:function(t){return s.default.post("/goodsInfo/heat",t)}},o=n;e.default=o},"602f":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-7dc4b02e]{height:100%}.search[data-v-7dc4b02e]{height:100%}.search .search_head[data-v-7dc4b02e]{height:%?80?%;display:flex;padding:0 %?30?%;justify-content:space-between;align-items:center;background-color:#3f6af4}.search .search_cus[data-v-7dc4b02e]{width:%?80?%;height:%?80?%;display:flex;justify-content:center;align-items:center;color:#fff}.search .search_search[data-v-7dc4b02e]{width:65vw;background-color:#fff;border-radius:%?6?%;padding-left:%?80?%;height:%?62?%}.search .search_box[data-v-7dc4b02e]{position:relative}.search .search_search_i[data-v-7dc4b02e]{position:absolute;width:%?56?%;z-index:99;left:%?8?%;top:%?2?%}.search .search_panel[data-v-7dc4b02e]{height:calc(100% - %?80?%);padding:%?20?% %?30?% 0 %?30?%}.search .search_hot[data-v-7dc4b02e]{height:%?50?%;font-size:18px;font-family:PingFang SC;font-weight:700;color:#333;display:flex;align-items:center;padding:%?20?% 0}.search .search_key[data-v-7dc4b02e]{display:flex;flex-wrap:wrap;justify-content:flex-start;margin-top:%?20?%}.search .search_k[data-v-7dc4b02e]{display:flex;justify-content:flex-start;align-items:center;width:45vw;margin-bottom:%?40?%}.search .search_k img[data-v-7dc4b02e]{width:%?50?%;height:auto}.search .search_k_top[data-v-7dc4b02e]{color:#f61273}.search .search_label[data-v-7dc4b02e]{background:#e1e1e1;border-radius:%?8?%;padding:%?8?% %?18?%;font-size:12px;font-family:PingFang SC;font-weight:500;color:#999;margin-right:%?10?%;margin-bottom:%?16?%}.search .search_rich[data-v-7dc4b02e]{display:flex;justify-content:flex-start;align-items:center;width:45vw;margin-bottom:%?30?%}.search .search_ri_mark[data-v-7dc4b02e]{width:%?50?%;height:auto}.search .search_poster[data-v-7dc4b02e]{width:%?90?%;height:%?90?%;border-radius:50%;border:1px solid #333;margin:0 %?20?%}.search .search_serial[data-v-7dc4b02e]{font-size:16px;font-family:PingFang SC;font-weight:700;color:#f61273}.search .search_ri_text[data-v-7dc4b02e]{word-break:keep-all;max-width:%?160?%;overflow:hidden}',""]),t.exports=e},8532:function(t,e,a){"use strict";a.d(e,"b",(function(){return i})),a.d(e,"c",(function(){return s})),a.d(e,"a",(function(){}));var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"search"},[a("v-uni-view",{staticClass:"search_head"},[a("v-uni-view",{staticClass:"search_box"},[a("img",{staticClass:"search_search_i",attrs:{src:"/static/img_index/search.svg"},on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.handleSearch()}}}),a("v-uni-input",{staticClass:"search_search",attrs:{"placeholder-style":"color: #C0C0C0;font-size:14px",type:"text",placeholder:"请输入影视剧名称"},model:{value:t.keywords,callback:function(e){t.keywords=e},expression:"keywords"}})],1),a("v-uni-view",{staticClass:"search_cus"},[t._v("取消")])],1),a("v-uni-view",{staticClass:"search_panel"},[a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜主题")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotTopicList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"search_k",class:{search_k_top:i<3}},[a("v-uni-text",[t._v(t._s(e.title))]),i<3?a("img",{attrs:{src:"/static/img_index/fire.png",alt:""}}):t._e()],1)})),1),a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜标签")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotTopicLabels,(function(e){return a("v-uni-view",{key:e,staticClass:"search_label"},[a("v-uni-text",[t._v(t._s(e))])],1)})),1),a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜剧主")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotDramatList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"search_rich",class:{search_k_top:i<3}},[a("v-uni-text",{staticClass:"search_serial"},[t._v(t._s(i+1))]),a("img",{staticClass:"search_poster",attrs:{src:"/static/img_index/erweima.png",alt:""}}),a("v-uni-text",{staticClass:"search_ri_text"},[t._v(t._s(e))]),i<3?a("img",{staticClass:"search_ri_mark",attrs:{src:"/static/img_index/fire.png",alt:""}}):t._e()],1)})),1)],1)],1)},s=[]},a9a3:function(t,e,a){"use strict";a("7a82");var i=a("4ea4").default;Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var s=i(a("5530"));a("caad"),a("2532"),a("d3b7");var n=i(a("bcac")),o={common:{header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},method:"GET",data:{}},request:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return t.url=n.default.baseUrl+t.url,t.method=t.method||this.common.method,t.data=t.data||{},t.header=t.header||this.common.header,t.url.includes("login")||(t.header["x-csrf-token"]=uni.getStorageSync("token")),new Promise((function(e,a){uni.request((0,s.default)((0,s.default)({},t),{},{success:function(t){return 200!==t.statusCode?a(t.data):255!=t.data.code?e(t.data):void uni.navigateTo({url:"/pages/login/login"})},fail:function(t){return a(t)}}))}))},get:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return a.url=t,a.data=e,a.method="GET",this.request(a)},post:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return a.url=t,a.data=e,a.method="POST",this.request(a)},upload:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return e.url=t,e.filePath=e.filePath||"",e.header=e.header||{},e.name=e.name||"userpic",new Promise((function(t,a){uni.uploadFile((0,s.default)((0,s.default)({},e),{},{success:function(e){if(200===e.statusCode)return t(JSON.parse(e.data))}}))}))}};e.default=o},ac21:function(t,e,a){"use strict";a.r(e);var i=a("8532"),s=a("09c0");for(var n in s)["default"].indexOf(n)<0&&function(t){a.d(e,t,(function(){return s[t]}))}(n);a("3c0b");var o=a("f0c5"),c=Object(o["a"])(s["default"],i["b"],i["c"],!1,null,"7dc4b02e",null,!1,i["a"],void 0);e["default"]=c.exports},bcac:function(t,e,a){"use strict";a("7a82"),Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i={baseUrl:"https://api.bxgtv.top/home"};e.default=i},cc8c:function(t,e,a){"use strict";a("7a82");var i=a("4ea4").default;Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var s=i(a("5f19")),n={data:function(){return{hotTopicList:[],hotTopicLabels:[],hotDramatList:[],keywords:""}},created:function(){this.getHotTopicList(),this.getHotTopicLabel(),this.getHotDramatist()},methods:{handleSearch:function(){uni.setStorageSync("searchKeywords",this.keywords),uni.setStorageSync("indexTheme","zone"),uni.switchTab({url:"/pages/index/index"})},getHotTopicList:function(){var t=this;s.default.getHotTopicList({}).then((function(e){1==e.code?t.hotTopicList=e.data:uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))},getHotTopicLabel:function(){var t=this;s.default.getHotTopicLabel({}).then((function(e){1==e.code?t.hotTopicLabels=e.data:uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))},getHotDramatist:function(){var t=this;s.default.getHotDramatist({}).then((function(e){1==e.code?(t.hotDramatList=e.data,t.hotDramatList.length):uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))}}};e.default=n}}]);