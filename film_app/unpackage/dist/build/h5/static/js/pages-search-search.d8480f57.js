(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-search-search"],{"06c6":function(t,e,a){"use strict";a.r(e);var i=a("5bbd"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a},"08fb":function(t,e,a){"use strict";var i=a("a3de"),n=a.n(i);n.a},1561:function(t,e,a){"use strict";a.r(e);var i=a("6e17"),n=a("06c6");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("08fb");var s,r=a("f0c5"),c=Object(r["a"])(n["default"],i["b"],i["c"],!1,null,"2860320a",null,!1,i["a"],s);e["default"]=c.exports},"1b14":function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i(a("6db7")),o={getHotTopicList:function(t){return n.default.post("/goodsInfo/hotTopic",t)},getHotTopicLabel:function(t){return n.default.post("/goodsInfo/HotLabel",t)},getHotDramatist:function(t){return n.default.post("/goodsInfo/HotDramatist",t)},videoLike:function(t){return n.default.post("/goodsInfo/give",t)},publishComments:function(t){return n.default.post("/goodsInfo/comment",t)},getRankVideos:function(t){return n.default.post("/goodsInfo/heat",t)},getMygive:function(t){return n.default.post("/goodsInfo/mygive",t)}},s=o;e.default=s},"20f7":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,'@charset "UTF-8";\r\n/**\r\n * 这里是uni-app内置的常用样式变量\r\n *\r\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\r\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\r\n *\r\n */\r\n/**\r\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\r\n *\r\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\r\n */\r\n/* 颜色变量 */\r\n/* 行为相关颜色 */\r\n/* 文字基本颜色 */\r\n/* 背景颜色 */\r\n/* 边框颜色 */\r\n/* 尺寸变量 */\r\n/* 文字尺寸 */\r\n/* 图片尺寸 */\r\n/* Border Radius */\r\n/* 水平间距 */\r\n/* 垂直间距 */\r\n/* 透明度 */\r\n/* 文章场景相关 */uni-page-body[data-v-2860320a]{height:100%}.search[data-v-2860320a]{height:100%}.search .search_head[data-v-2860320a]{height:%?80?%;display:flex;padding:0 %?30?%;justify-content:space-between;align-items:center;background-color:#3f6af4}.search .search_cus[data-v-2860320a]{width:%?80?%;height:%?80?%;display:flex;justify-content:center;align-items:center;color:#fff}.search .search_search[data-v-2860320a]{width:65vw;background-color:#fff;border-radius:%?6?%;padding-left:%?80?%;height:%?62?%}.search .search_box[data-v-2860320a]{position:relative}.search .search_search_i[data-v-2860320a]{position:absolute;width:%?56?%;z-index:99;left:%?8?%;top:%?2?%}.search .search_panel[data-v-2860320a]{height:calc(100% - %?80?%);padding:%?20?% %?30?% 0 %?30?%}.search .search_hot[data-v-2860320a]{height:%?50?%;font-size:18px;font-family:PingFang SC;font-weight:700;color:#333;display:flex;align-items:center;padding:%?20?% 0}.search .search_key[data-v-2860320a]{display:flex;flex-wrap:wrap;justify-content:flex-start;margin-top:%?20?%}.search .search_k[data-v-2860320a]{display:flex;justify-content:flex-start;align-items:center;width:45vw;margin-bottom:%?40?%}.search .search_k img[data-v-2860320a]{width:%?50?%;height:auto}.search .search_k_top[data-v-2860320a]{color:#f61273}.search .search_label[data-v-2860320a]{background:#e1e1e1;border-radius:%?8?%;padding:%?8?% %?18?%;font-size:12px;font-family:PingFang SC;font-weight:500;color:#999;margin-right:%?10?%;margin-bottom:%?16?%}.search .search_rich[data-v-2860320a]{display:flex;justify-content:flex-start;align-items:center;width:45vw;margin-bottom:%?30?%}.search .search_ri_mark[data-v-2860320a]{width:%?50?%;height:auto}.search .search_poster[data-v-2860320a]{width:%?90?%;height:%?90?%;border-radius:50%;border:1px solid #333;margin:0 %?20?%}.search .search_serial[data-v-2860320a]{font-size:16px;font-family:PingFang SC;font-weight:700;color:#f61273}.search .search_ri_text[data-v-2860320a]{max-width:%?320?%;overflow:hidden;overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;color:#2e8b57}',""]),t.exports=e},"5bbd":function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i(a("1b14")),o={data:function(){return{hotTopicList:[],hotTopicLabels:[],hotDramatList:[],keywords:uni.getStorageSync("searchKeywords")||""}},created:function(){this.getHotTopicList(),this.getHotTopicLabel(),this.getHotDramatist()},methods:{handleCancel:function(){uni.navigateBack({delta:1})},toHome:function(t,e){"type"==t&&uni.setStorageSync("searchType",JSON.stringify(e)),"label"==t&&uni.setStorageSync("searchLabels",e),uni.setStorageSync("indexTheme","zone"),uni.switchTab({url:"/pages/index/index"})},handleSearch:function(){this.getHotTopicList(),this.getHotTopicLabel(),this.getHotDramatist(),uni.setStorageSync("searchKeywords",this.keywords),uni.setStorageSync("indexTheme","zone"),uni.switchTab({url:"/pages/index/index"})},getHotTopicList:function(){var t=this;n.default.getHotTopicList({}).then((function(e){1==e.code?t.hotTopicList=e.data:uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))},getHotTopicLabel:function(){var t=this;n.default.getHotTopicLabel({}).then((function(e){1==e.code?t.hotTopicLabels=e.data:uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))},transfer:function(t){return uni.switchTab({url:"/pages/sortVideo/sortVideo"}),20==t.type?(uni.switchTab({url:"/pages/videoPlay/videoPlay"}),void uni.setStorageSync("videoInfo",JSON.stringify(t))):"slm3u8"==t.vod_play_from?(uni.setStorageSync("sortVideoInfo",JSON.stringify(t)),void uni.switchTab({url:"/pages/sortVideo/sortVideo"})):void 0},getHotDramatist:function(){var t=this;n.default.getHotDramatist({}).then((function(e){1==e.code?(t.hotDramatList=e.data,t.hotDramatList.length):uni.showToast({title:e.message||"请求失败",icon:"none"})})).catch((function(t){console.log(t)}))}}};e.default=o},"6db7":function(t,e,a){"use strict";var i=a("4ea4");a("caad"),a("d3b7"),a("2532"),Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i(a("5530")),o=i(a("d9d3")),s={common:{header:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},method:"GET",data:{}},request:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return t.url=o.default.baseUrl+t.url,t.method=t.method||this.common.method,t.data=t.data||{},t.header=t.header||this.common.header,t.url.includes("login")||t.url.includes("/upload")||(t.header["x-csrf-token"]=uni.getStorageSync("token")),new Promise((function(e,a){uni.request((0,n.default)((0,n.default)({},t),{},{success:function(t){return 200!==t.statusCode?a(t.data):255!=t.data.code?e(t.data):void uni.navigateTo({url:"/pages/login/login"})},fail:function(t){return a(t)}}))}))},get:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return a.url=t,a.data=e,a.method="GET",this.request(a)},post:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return a.url=t,a.data=e,a.method="POST",this.request(a)},upload:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return a.url=o.default.baseUrl+t,a.filePath=e.image.path||"",a.method="POST",a.header=a.header||{},console.log("options:",e.image.path),a.name=a.name||"image",new Promise((function(a,i){uni.uploadFile({header:{},url:o.default.baseUrl+t,filePath:e.image.path,name:"image",formData:{user:"test"},success:function(t){if(console.log("ddddddddddddd"),200===t.statusCode)return a(JSON.parse(t.data))}})}))}};e.default=s},"6e17":function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"search"},[a("v-uni-view",{staticClass:"search_head"},[a("v-uni-view",{staticClass:"search_box"},[a("img",{staticClass:"search_search_i",attrs:{src:"/static/img_index/search.svg"}}),a("v-uni-input",{staticClass:"search_search",attrs:{"placeholder-style":"color: #C0C0C0;font-size:14px",type:"text",placeholder:"请输入影视剧名称"},model:{value:t.keywords,callback:function(e){t.keywords=e},expression:"keywords"}})],1),a("v-uni-view",{staticClass:"search_cus",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.handleSearch()}}},[t._v("确定")]),a("v-uni-view",{staticClass:"search_cus",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.handleCancel()}}},[t._v("取消")])],1),a("v-uni-view",{staticClass:"search_panel"},[a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜主题")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotTopicList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"search_k",class:{search_k_top:i<3},on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.toHome("type",e)}}},[a("v-uni-text",[t._v(t._s(e.title))]),i<3?a("img",{attrs:{src:"/static/img_index/fire.png",alt:""}}):t._e()],1)})),1),a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜标签")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotTopicLabels,(function(e){return a("v-uni-view",{key:e,staticClass:"search_label",on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.toHome("label",e)}}},[a("v-uni-text",[t._v(t._s(e))])],1)})),1),a("v-uni-view",{staticClass:"search_hot"},[t._v("热搜剧主")]),a("v-uni-view",{staticClass:"search_key"},t._l(t.hotDramatList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"search_rich",class:{search_k_top:i<3},on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.transfer(e)}}},[a("v-uni-text",{staticClass:"search_ri_text"},[t._v(t._s(e))]),i<3?a("img",{staticClass:"search_ri_mark",attrs:{src:"/static/img_index/fire.png",alt:""}}):t._e()],1)})),1)],1)],1)},o=[]},a3de:function(t,e,a){var i=a("20f7");i.__esModule&&(i=i.default),"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("15669aa6",i,!0,{sourceMap:!1,shadowMode:!1})},d9d3:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i="https://api.bxgtv.top/home",n={baseUrl:i};e.default=n}}]);