---
layout: post
title: "rails 中使用 map 方法转换哈希成 JavaScript 对象"
date: "2023-06-16"
categories: 
---
<p>在rails使用：&lt;%= javascript_tag do %&gt; 176 var data = &lt;%= @statistics.map { | key, value| {name: key.to_s + value.to_s, value: value}} %&gt;;，但是：var data = [{:name=&amp;gt;&amp;quot;米库存量866&amp;quot;, :value=&amp;gt;866}, {:name=&amp;gt;&amp;quot;面粉库存量840&amp;quot;, :value=&amp;gt;840}, {:name=&amp;gt;&amp;quot;油库存量2976&amp;quot;, :value=&amp;gt;2976}, {:name=&amp;gt;&amp;quot..</p>

<p>解决：</p>

<p>在 rails 中使用 <code>map</code> 方法转换哈希成 JavaScript 对象时，哈希中的符号默认会被编码成 HTML 符号。因此，在你的代码中，<code>=&gt;</code> 被编码成 <code>=&amp;gt;</code>。为了解决这个问题，你可以使用 <code>html_safe</code> 方法将字符串标记为 HTML 安全，使得其中的 HTML 符号得以解析。可以参考如下代码：</p>

<pre>
<code>var data = &lt;%= @statistics.map { |key, value| {name: key.to_s + value.to_s, value: value}}.to_json.html_safe %&gt;;</code></pre>

<p>在这段代码中，我们将 <code>map</code> 方法转换成的哈希数组用 <code>to_json</code> 方法转换成 JavaScript 对象格式的 JSON 字符串，然后使用 <code>html_safe</code> 方法标记为 HTML 安全，使得其中的 HTML 符号得以解析。这样就可以避免符号被编码成 HTML 符号的问题。</p>

