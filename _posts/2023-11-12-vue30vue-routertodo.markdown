---
layout: post
title: "vue3.0 vue-router的理解 TODO"
date: "2023-11-12"
categories: 
---
<p>我这样定义了路由：</p>

<pre>
<code><span style="color:#dcc6e0">import</span> Vue <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;vue&#39;</span>;
<span style="color:#dcc6e0">import</span> VueRouter <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;vue-router&#39;</span>;

<span style="color:#dcc6e0">import</span> HelloWorld <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;./components/HelloWorld.vue&#39;</span>;

Vue.use(VueRouter);

<span style="color:#dcc6e0">export</span> <span style="color:#dcc6e0">default</span> <span style="color:#dcc6e0">new</span> VueRouter({
  routes: [
    {
      path: <span style="color:#abe338">&#39;/&#39;</span>,
      name: <span style="color:#abe338">&#39;HelloWorld&#39;</span>,
      component: HelloWorld
    },
  ]
});</code></pre>

<p>但是我访问http://localhost:8081/&nbsp;&nbsp; 和 http://localhost:8081/hello_world 都是可以看到HelloWorld的页面 。可以确认的是我没有定义&#39;/&#39;路径，原因是：（好像是默认匹配的原因，再看看吧）</p>

<pre>
<code>当你在VueRouter的路由配置中没有显式定义根路径（<span style="color:#abe338">&#39;/&#39;</span>），VueRouter会默认对所有路径进行匹配。这意味着，无论你访问什么路径，VueRouter都会尝试寻找与该路径匹配的路由配置，并根据配置渲染相应的组件。

在你的代码中，你定义了一个路由配置path: <span style="color:#abe338">&#39;/hello_world&#39;</span>，这意味着当你访问http:<span style="color:#ffa07a">//</span>localhost:<span style="color:#f5ab35">8081</span>/hello_world时，VueRouter会匹配到该路由配置，并渲染HelloWorld组件。

而当你访问根路径http:<span style="color:#ffa07a">//</span>localhost:<span style="color:#f5ab35">8081</span><span style="color:#ffa07a">/时，由于没有显式定义根路径的路由配置，VueRouter会继续寻找下一个匹配的路由配置。在你的代码中，它会匹配到path: &#39;/</span>hello_world<span style="color:#abe338">&#39;这个路由配置，并渲染HelloWorld组件。
</span><span style="color:#abe338">
</span><span style="color:#abe338">因此，你会发现当你访问http://localhost:8081/时，也能够看到HelloWorld组件的页面。这是因为VueRouter默认对所有路径进行匹配，并渲染与路径匹配的组件。</span></code></pre>

