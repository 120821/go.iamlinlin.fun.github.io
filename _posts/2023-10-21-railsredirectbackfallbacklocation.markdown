---
layout: post
title: "rails redirect_back fallback_location的使用"
date: "2023-10-21"
categories: 
---
<p>refer <a href="http://linlin.fun/blogs/93">http://linlin.fun/blogs/93</a></p>

<p>1. 把配置文件的提示错误信息的代码删除</p>

<pre>
<code>config/locales/zh-CN.yml</code></pre>

<pre>
<code>zh-CN:

&nbsp; devise:

&nbsp;&nbsp;&nbsp; failure:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; manager:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unauthenticated: &quot;用户名与密码不匹配&quot; </code></pre>

<p>2.在controller修改代码</p>

<pre>
<code>redirect_to root_path, alert: &#39;用户名与密码不匹配&#39; and return</code></pre>

<p>为这样的格式</p>

<pre>
<code>redirect_back(<span style="color:#abe338">fallback_location:</span> root_path, <span style="color:#abe338">notice:</span> <span style="color:#abe338">&#39;hahahhaha&#39;</span>)</code></pre>

<p><code>3.视图页面修改alert为notice</code></p>

<pre>
<code>&nbsp;&nbsp; &lt;div class=&quot;login_right&quot;&gt;

&nbsp;&nbsp;&nbsp;&nbsp; &lt;div class=&quot;error&quot;&gt;

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% if flash[:alert] %&gt;

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% if flash[:notice] %&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div class=&quot;alert alert-danger&quot;&gt;

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= flash[:alert] %&gt;

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= flash[:notice] %&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% end %&gt;

&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;</code></pre>

<p>&nbsp;</p>

