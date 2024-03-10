---
layout: post
title: "使用vuejs 2.x (不是nuxt) 做个demo: 使用 vuex, router ( store, action , mutation)"
date: "2022-06-09"
categories: 
---
<p>使用命令创建项目</p> 
<p>根据图片提示选择需要的内容，选择vuex router</p> 
<p>按空格进行多选</p> 
{% highlight html %}vue create vuex1
cd vuex1
yarn serve
{% endhighlight %} 
<p><img alt="" height="1080" src="https://img-blog.csdnimg.cn/20960d5c4847407692479fc3b30b319b.png" width="1200"></p> 
<p></p> 
<p>假设,我们有两个页面: "页面1" 和"页面2" , 共同使用一个变量: counter. 页面1对 "counter" + 1 后, 页面2的值也会发生变化.</p> 
<h3 id="1修改packagejson">1.修改{% highlight html %}package.json{% endhighlight %}:</h3> 
<p>如果该文件没有vuex 版本，进行安装，此时我们已经选择了vuex，就不需要再次安装 <img alt="" height="1080" src="https://img-blog.csdnimg.cn/6c3a0fe956584684bf7a69f06960e274.png" width="1200"></p> 
<h3 id="2新建文件--srcvuexstorejs">2.新建文件: {% highlight html %}src/vuex/store.js{% endhighlight %}
</h3> 
<p>这个文件的作用,是在整个Vuejs项目中, 声明: 我们要使用Vuex进行状态管理了.</p> 
{% highlight html %}import Vue from 'vue'
import Vuex from 'vuex'
// 这个就是我们后续会用到的counter 状态．
import counter from '@/vuex/modules/counter'
Vue.use(Vuex)
const debug = process.env.NODE_ENV !== 'production'
export default new Vuex.Store({
modules: {
counter                // 所有要管理的module, 都要列在这里.
},
strict: debug,
middlewares: []
})
{% endhighlight %} 
<p>3.新建文件: {% highlight html %}src/vuex/modules/counter.js{% endhighlight %}</p> 
{% highlight html %}import { INCREASE } from '@/vuex/mutation_types'
const state = {
points: 0
//默认值为0
}
const getters = {
get_points: state =&gt; {
return state.points
}
}
const mutations = {
[INCREASE](state, data){
state.points = data
}
}
export default {
state,
mutations,
getters
}
{% endhighlight %} 
<p>上面是一个最典型的 vuex module, 它的作用就是计数.</p> 
<ul>
<li>state: 表示状态. 可以认为state是一个数据库，保存了各种数据。我们无法直接访问里面的数据。</li>
<li>mutations: 变化。 可以认为所有的state都是由mutation来驱动变化的。 也可以认为它是个setter.</li>
<li>getter: 取值的方法。 就是getter( 跟setter相对）</li>
</ul>
<p>我们如果希望"拿到"某个数据，就需要调用 vuex module的{% highlight html %}getter{% endhighlight %} 方法。 我们如果希望"更改"某个数据，就需要调用 vuex module的{% highlight html %}mutation{% endhighlight %} 方法。</p> 
<p>4.新增文件: {% highlight html %}src/vuex/mutation_types.js{% endhighlight %}</p> 
{% highlight html %}export const INCREASE = 'INCREASE'
{% endhighlight %} 
<p>大家做项目的时候, 要统一把 mutation type定义在这里. 它类似于 方法列表.</p> 
<p>5.新增路由: {% highlight html %}src/routers/index.js{% endhighlight %}</p> 
{% highlight html %}import ShowCounter1 from '@/components/ShowCounter1'
import ShowCounter2 from '@/components/ShowCounter2'
export default new Router({
routes: [
{
path: '/show_counter_1',
name: 'ShowCounter1',
component: ShowCounter1
},
{
path: '/show_counter_2',
name: 'ShowCounter2',
component: ShowCounter2
}
]
})
{% endhighlight %} 
<p>6.新增两个页面: {% highlight html %}src/components/ShowCounter1.vue{% endhighlight %} 和 {% highlight html %}src/components/ShowCounter2.vue{% endhighlight %}</p> 
<p>这两个页面基本一样.</p> 
{% highlight html %}&lt;template&gt;
&lt;div&gt;
&lt;h1&gt; 这个页面是 1号页面 &lt;/h1&gt;
{<!-- -->{points}} &lt;br/&gt;
&lt;input type='button' @click='increase' value='点击增加1'/&gt;&lt;br/&gt;
&lt;router-link :to="{name: 'ShowCounter2'}"&gt;
计数页面2
&lt;/router-link&gt;
&lt;/div&gt;
&lt;/template&gt;
&lt;script&gt;
import store from '@/vuex/store'
import { INCREASE } from '@/vuex/mutation_types'
export default {
computed: {
points() {
return store.getters.get_points
}
},
store,
methods: {
increase() {
store.commit(INCREASE, store.getters.get_points + 1)
}
}
}
&lt;/script&gt;
{% endhighlight %} 
<p>可以看出， 我们可以在 {% highlight html %}&lt;script&gt;{% endhighlight %}中调用 vuex的module的方法。 例如：</p> 
{% highlight html %}increase() {
store.commit(INCREASE, store.getters.get_points + 1)
}
{% endhighlight %} 
<p>这里， {% highlight html %}store.getters.get_points{% endhighlight %} 就是通过{% highlight html %}getter{% endhighlight %}获取到 状态“points"的方法。</p> 
<p>{% highlight html %}store.commit(INCREASE, .. ){% endhighlight %} 则是 通过 {% highlight html %}INCREASE{% endhighlight %} 这个{% highlight html %}action{% endhighlight %} 来改变 "points"的值。</p> 
<h2 id="computed属性">Computed属性</h2> 
<p>Computed 代表的是某个组件(component)的属性, 这个属性是算出来的。 每当计算因子发生变化时， 这个结果也要及时的重新计算。</p> 
<p>上面的代码中：</p> 
{% highlight html %}&lt;script&gt;
export default {
computed: {
points() {
return store.getters.get_points
}
},
&lt;/script&gt;
{% endhighlight %} 
<p>就是定义了一个叫做 'points' 的 'computed'属性。 然后，我们在页面中显示这个”计算属性":</p> 
{% highlight html %}&lt;template&gt;
&lt;div&gt;
{<!-- -->{points}}
&lt;/div&gt;
&lt;/template&gt;
{% endhighlight %} 
<p>就可以把 state中的数据显示出来， 并且会自动的更新了。</p> 
<p>重启服务器( {% highlight html %}$ npm run serve{% endhighlight %}) , 之后运行, 可以看到如下图所示<img alt="" height="264" src="https://img-blog.csdnimg.cn/fde8a5ff4ec046a2b3aa3d9c2b1ce4b6.png" width="473"></p> 
<p></p>
