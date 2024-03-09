---
layout: post
title: "rails 4.2.13  cancancan 2.3.x uninitialized constant CanCanCan::ControllerAdditions  "
date: "2023-08-25"
categories: 
---
<p>refer: <a href="https://github.com/CanCanCommunity/cancancan">https://github.com/CanCanCommunity/cancancan</a></p>

<p>在rails中使用cancancan,出现了:</p>

<pre>
<code>uninitialized constant CanCanCan::ControllerAdditions</code></pre>

<p>&nbsp;但是所有的步骤都已经是参照文档修改好，Gemfile里是cancancan 3.5, 已经配置了，</p>

<p>解决： 是版本的冲突：应该安装Cancancan 2.3.x(这个版本是兼容rails4.x),所以可以指定安装一下cancancan</p>

<pre>
<code>gem &#39;cancancan&#39;, &#39;~&gt; 2.3&#39;, &#39;&lt; 3.0&#39;</code></pre>

<p>or:</p>

<pre>
<code>gem &#39;cancancan&#39;, &#39;2.2.0&#39;</code></pre>

