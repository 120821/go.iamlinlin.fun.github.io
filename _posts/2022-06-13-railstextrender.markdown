---
layout: post
title: "rails 使用text 渲染 render"
date: "2022-06-13"
categories: 
---
<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">render <span class="hljs-symbol">plain:</span> <span class="hljs-string">&quot;OK&quot;</span></code></pre>

<p>&nbsp;def send_sms<br />
&nbsp;&nbsp;&nbsp; YunPianJob.perform_later<br />
&nbsp;&nbsp;&nbsp; render plain: &#39;ok&#39;<br />
&nbsp; end</p>

<p>&nbsp; def send_email<br />
&nbsp;&nbsp;&nbsp; to = params[:to]<br />
&nbsp;&nbsp;&nbsp; subject = params[:subject]</p>

<p>&nbsp;&nbsp;&nbsp; UserMailer.welcome_email(to, subject).deliver_now<br />
&nbsp;&nbsp;&nbsp; render plain: &#39;ok&#39;<br />
&nbsp; end</p>

<p>&nbsp;</p>

