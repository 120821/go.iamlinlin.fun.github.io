---
layout: post
title: "vue3 Elements in iteration expect to have 'v-bind:key' directives"
date: "2023-11-12"
categories: 
---
<p><a href="https://www.cnblogs.com/zdz8207/p/vue-for-v-bind-key.html">https://www.cnblogs.com/zdz8207/p/vue-for-v-bind-key.html</a></p>
<p>解决方法：<br />
1.在v-for 后添加 :key=&#39;item&#39;<br />
&lt;li v-for=&quot;i in list&quot; :key=&quot;i&quot;&gt;</p>
<div>&lt;div class=&quot;item&quot; v-for=&quot;(user,index) in datalist&quot; :key=&#39;index&#39; &gt;</div>
