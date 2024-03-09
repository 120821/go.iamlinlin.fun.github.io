---
layout: post
title: "已拦截跨源请求：同源策略禁止读取位于 https://raw.githubusercontent.com/journey-ad/blog-img/master/live2d/Ava/Ava.4096/texture_00.png 的远程资源。（原因：CORS 请求未能成功）"
date: "2022-08-21"
categories: 
---
<p>已拦截跨源请求：同源策略禁止读取位于 https://raw.githubusercontent.com/journey-ad/blog-img/master/live2d/Ava/Ava.4096/texture_00.png 的远程资源。（原因：CORS 请求未能成功）</p>

<p>&nbsp;</p>

<pre class="prettyprint">
<span><code class="hljs lasso"><span class="hljs-subst">&lt;</span>meta http<span class="hljs-attribute">-equiv</span><span class="hljs-subst">=</span><span class="hljs-string">&quot;Access-Control-Allow-Origin&quot;</span> content<span class="hljs-subst">=</span><span class="hljs-string">&quot;*&quot;</span><span class="hljs-subst">&gt;</span>{% endhighlight %}</span>{% endhighlight %}

<pre class="prettyprint">
<span><code class="hljs cs"><span class="hljs-comment">//在被请求的网站上，设置HTTP头，添加</span>
<span class="hljs-string">&quot;Access-Control-Allow-Origin:*&quot;</span> <span class="hljs-comment">//值为*或指定的域名。</span>{% endhighlight %}</span>{% endhighlight %}

<p>例如，页面的嘉然不能在火狐浏览器正常显示的时候，进行修改配置文件：</p>

<p><img height="483" src="/uploads/ckeditor/pictures/312/image-20220822141336-1.png" width="850" /></p>

<pre id="line1">
<span class="comment">可以知道是这个域名不能正常访问导致图片不能正常显示，https://raw.githubusercontent.com（记下这个域名）</span>{% endhighlight %}

<p><span class="comment">在配置文件中增加：（conf/nginx.conf）在server中增加.然后在不开外网的时候也可以正常显示了。</span></p>

{% highlight %}
{% highlight %}add_header &#39;Access-Control-Allow-Origin&#39; &#39;https://raw.githubusercontent.com&#39;;

&nbsp; add_header &#39;Access-Control-Allow-Credentials&#39; &#39;true&#39;;

&nbsp; add_header &#39;Access-Control-Allow-Methods&#39; &#39;GET,POST&#39;;

&nbsp; add_header &#39;Access-Control-Allow-Headers&#39; &#39;x-requested-with,content-type&#39;;

&nbsp; #charset koi8-r;{% endhighlight %}

<p>&nbsp;</p>

<p><img height="1053" src="/uploads/ckeditor/pictures/313/image-20220822141515-2.png" width="924" /></p>

<p>&nbsp;</p>

