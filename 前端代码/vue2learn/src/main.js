import Vue from 'vue'
import App from './App.vue'
/*导入并使用element-ui依赖*/
import Element from 'element-ui'
import "element-ui/lib/theme-chalk/index.css"
Vue.use(Element)
/*导入并使用axios依赖*/
import axios from 'axios'
Vue.prototype.$axios = axios
/*添加在router文件夹配置的路由*/
import router from './router'
/*添加store文件*/
import store from './store'

//引入element
import './plugins/element.js';
//引入axios
import './plugins/axios.js';
//引入markdown编辑器
import './plugins/markdown.js';
//引入代码高亮
import './plugins/highlight.js'
//引入图标库
import './assets/icon/iconfont.css';
//引入自定义全局样式
import './assets/css/global.css';
//引入echarts
import './plugins/echarts.js';
//权限指令
import './plugins/permission.js';


/*添加markdown插件*/
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
Vue.use(mavonEditor)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
