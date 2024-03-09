---
layout: post
title: " Ruby on Rails Mail Setup--Connection refused - connect(2)"
date: "2022-06-13"
categories: 
---
<p>报错：`initialize&#39;: Connection refused - connect(2) for &quot;localhost&quot; port 25 (Errno::ECONNREFUSED)</p>

<p><img height="207" src="/uploads/ckeditor/pictures/13/image-20220613113551-1.png" width="1904" /></p>

<p>取消注释：config.action_mailer.raise_delivery_errors = false</p>

<p>首先看一下：</p>

<p>replace</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">config.action_mailer.delivery_method = <span class="hljs-string">&#39;smtp&#39;</span>
</code></pre>

<p>with</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">config.action_mailer.delivery_method = <span class="hljs-symbol">:smtp</span>
</code></pre>

<p>&nbsp;</p>

<p>from</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">config.action_mailer.raise_delivery_errors = <span class="hljs-literal">true</span>
</code></pre>

<p>to</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">config.action_mailer.raise_delivery_errors = <span class="hljs-literal">false</span>
</code></pre>

<p>邮件依旧不能发送</p>

<p>&nbsp;#&lt;Mail::Message:65380, Multipart: false, Headers: &lt;Date: Mon, 13 Jun 2022 11:35:15 +0800&gt;, &lt;From: SPARK2022@TUTANOTA.COM&gt;, &lt;To: 1208215066@qq.com&gt;, &lt;Message-ID: &lt;62a6b0735da79_15157f3c904b5@linlin-i5.mail&gt;&gt;, &lt;Subject: hihihi&gt;, &lt;Mime-Version: 1.0&gt;, &lt;Content-Type: text/html&gt;, &lt;Content-Transfer-Encoding: 7bit&gt;&gt;</p>

<p>&nbsp;</p>

