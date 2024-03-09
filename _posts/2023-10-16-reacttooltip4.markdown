---
layout: post
title: "React tooltip 显示4位小数"
date: "2023-10-16"
categories: 
---
<p>在地图组件里，我有这样的代码，（显示了10位小数）</p>

<pre>
<code>.text(d.properties.name + &quot;:&quot; + d.properties.emission);</code></pre>

<p>修改为显示4位小数</p>

<pre>
<code>.text(d.properties.name + &quot;:&quot; + d.properties.emission.toFixed(4));</code></pre>

<p>&nbsp;</p>

