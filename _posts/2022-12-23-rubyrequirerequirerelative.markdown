---
layout: post
title: "ruby require require_relative "
date: "2022-12-23"
categories: 
---
<p>ruby api: <a href="http://ruby-doc.org/core-2.1.2/Kernel.html">http://ruby-doc.org/core-2.1.2/Kernel.html</a></p>

<p><a href="https://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby">https://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby</a></p>

<p>1.require_relative 通过允许您加载相对于包含 require_relative 语句的文件的文件来补充内置方法 require 。（require_relative 是 require 的一个方便的子集）</p>

<p>&nbsp;例如，如果您在&ldquo;test&rdquo;目录中有单元测试类，并且在测试&ldquo;test/data&rdquo;目录下有它们的数据，那么您可以在测试用例中使用如下一行：</p>

<pre>
<code>require_relative &quot;data/customer_data_1&quot;</code></pre>

<pre>
<code>例如
require_relative(&#39;path&#39;) 等同于 </code></pre>

<pre>
<code>require(File.expand_path(&#39;path&#39;, File.dirname(__FILE__)))</code></pre>

<p><code>2.</code>require_relative 允许您&ldquo;加载与包含 require_relative 语句的文件相关的文件&rdquo;。 对于 require，./ 表示相对于你的路径</p>

