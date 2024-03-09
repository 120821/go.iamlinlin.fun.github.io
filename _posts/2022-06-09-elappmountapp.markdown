---
layout: post
title: "el #app 与 mount(‘#app‘)的使用"
date: "2022-06-09"
categories: 
---

                    <pre><code>new Vue({
  router,
  render: h =&gt; h(App)
}).$mount('#app')</code></pre> 
<p>这里创建的vue实例没有el属性，而是在实例后面添加了一个$mount(’#app’)方法。<br> $mount(’#app’) ：手动挂载到id为app的dom中的意思<br> 当Vue实例没有el属性时，则该实例尚没有挂载到某个dom中；<br> 假如需要延迟挂载，可以在之后手动调用vm.$mount()方法来挂载</p> 
<p><br> 需要注意的是：该方法是直接挂载到入口文件index.html 的 id=app 的dom 元素上的<br>  </p> 
<pre><code>new Vue({
router,
render: h =&gt; h(App)
}).$mount("#app");</code></pre> 
<p><br> 1. 联系：$mount和el都是用来将vue实例挂载到dom上的<br> 2. 区别：<strong>el是自动挂载，$mount是手动挂载</strong><br> 注：如果$mount没有提供参数，模板将被渲染为文档之外的的元素，并且你必须使用原生DOM API把它插入文档中。</p>
                
