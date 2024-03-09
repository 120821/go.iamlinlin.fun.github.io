---
layout: post
title: "rails--redirect_back fallback_location notice alert "
date: "2022-07-01"
categories: 
---
<p>参考：https://www.rubyguides.com/2019/11/rails-flash-messages/</p>

<p>https://apidock.com/rails/v5.0.0.1/ActionController/Redirecting/redirect_back</p>

<p>在controller这样使用</p>

<pre>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span> <span class="punct">{</span> <span class="ident">action</span><span class="punct">:</span> <span class="punct">&quot;</span><span class="string">show</span><span class="punct">&quot;,</span> <span class="ident">id</span><span class="punct">:</span> <span class="number">5</span> <span class="punct">}</span>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span> <span class="ident">post</span>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span> <span class="punct">&quot;</span><span class="string">http://www.rubyonrails.org</span><span class="punct">&quot;</span>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span>  <span class="punct">&quot;</span><span class="string">/images/screenshot.jpg</span><span class="punct">&quot;</span>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span>  <span class="ident">articles_url</span>
<span class="ident"><a href="https://apidock.com/rails/ActionController/Redirecting/redirect_back">redirect_back</a></span> <span class="ident">fallback_location</span><span class="punct">:</span>  <span class="ident">proc</span> <span class="punct">{</span> <span class="ident">edit_post_url</span><span class="punct">(</span><span class="attribute">@post</span><span class="punct">)</span> <span class="punct">}</span></pre>

<p><span class="punct">在视图页面增加，或者直接在application页面增加</span></p>

<pre><code>&lt;% flash.each do |type, msg| %&gt;

&nbsp; &lt;div class=&quot;alert alert-success&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= msg %&gt;<br />
&nbsp; &lt;/div&gt;<br />
&lt;% end %&gt;</code></pre>

<p>然后在视图页面就会出现alert，操作成功等<img height="45" src="/uploads/ckeditor/pictures/85/image-20220701144506-1.png" width="658" /></p>

<p>使用alert会出现一个边框背景。会更加明显</p>

