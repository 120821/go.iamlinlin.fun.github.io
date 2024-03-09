---
layout: post
title: "Mysql2::Error: Invalid default value for 'status"
date: "2023-05-16"
categories: 
---
<p>在服务器上运行db:migrate 出现了错误：</p>

<pre>
<code>-- add_column(:enterprises, :status, :string, {:comment=&gt;&quot;是否审批&quot;, :default=&gt;&quot;未处理&quot;}) 

rake aborted!

StandardError: An error has occurred, all later migrations canceled: Mysql2::Error: Invalid default value for &#39;status </code></pre>

<p>这个错误意味着 &#39;status&#39; 字段的默认值无效。解决此错误的一种方法是在添加 &#39;status&#39; 字段时指定有效的默认值。</p>

<p>例如，您可以使用以下命令来指定 &#39;status&#39; 字段的默认值：</p>

<pre>
<code>add_column(:enterprises, :status, :string, {:comment=&gt;&quot;是否审批&quot;, :default=&gt;&quot;pending&quot;})</code></pre>

<p>在这个示例中，我们将 &#39;status&#39; 字段的默认值设置为 &#39;pending&#39;，这是一个有效的默认值，不会触发错误。</p>

<p>然后，您可以运行 <code>rake db:migrate</code> 命令来运行迁移并将更改保存到数据库中。</p>

<p>但是仍然报错，直接把默认值删除就可以了。可用在model或者controller对该列赋值</p>

<p><code>add_column(:enterprises, :status, :string</code></p>

