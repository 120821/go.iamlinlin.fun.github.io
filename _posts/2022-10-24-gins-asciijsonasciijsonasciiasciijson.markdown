---
layout: post
title: " gins - ASCII json 的使用：使用 AsciiJSON 生成带有转义的非 ASCII 字符的纯 ASCII JSON。"
date: "2022-10-24"
categories: 
---
<p>官网：<a href="https://gin-gonic.com/docs/examples/ascii-json/">https://gin-gonic.com/docs/examples/ascii-json/</a></p>

<p><a href="https://www.quanxiaoha.com/gin/gin-ascii-json.html">https://www.quanxiaoha.com/gin/gin-ascii-json.html</a></p>

<p>使用函数main：</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/someJSON&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">data</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#204a87;font-weight:700">map</span><span style="color:#000;font-weight:700">[</span><span style="color:#204a87;font-weight:700">string</span><span style="color:#000;font-weight:700">]</span><span style="color:#204a87;font-weight:700">interface</span><span style="color:#000;font-weight:700">{}{</span>
			<span style="color:#4e9a06">&quot;lang&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#4e9a06">&quot;GO语言&quot;</span><span style="color:#000;font-weight:700">,</span>
			<span style="color:#4e9a06">&quot;tag&quot;</span><span style="color:#000;font-weight:700">:</span>  <span style="color:#4e9a06">&quot;&lt;br&gt;&quot;</span><span style="color:#000;font-weight:700">,</span>
		<span style="color:#000;font-weight:700">}</span>

		<span style="color:#8f5902;font-style:italic">// will output : {&quot;lang&quot;:&quot;GO\u8bed\u8a00&quot;,&quot;tag&quot;:&quot;\u003cbr\u003e&quot;}
</span>		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">AsciiJSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">data</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#8f5902;font-style:italic">// Listen and serve on 0.0.0.0:8080
</span>	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p>完整代码：</p>

{% highlight %}
<code class="language-go hljs"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
	<span class="hljs-string">&quot;net/http&quot;</span>
	<span class="hljs-string">&quot;github.com/gin-gonic/gin&quot;</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
	r := gin.Default()

	r.GET(<span class="hljs-string">&quot;/testJSON&quot;</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(c *gin.Context)</span></span> {
		data := <span class="hljs-keyword">map</span>[<span class="hljs-keyword">string</span>]<span class="hljs-keyword">interface</span>{}{
			<span class="hljs-string">&quot;domain&quot;</span>: <span class="hljs-string">&quot;www.baidu.com&quot;</span>,
			<span class="hljs-string">&quot;name&quot;</span>:  <span class="hljs-string">&quot;baidu&quot;</span>,
		}

		<span class="hljs-comment">// 输出 : {&quot;domain&quot;:&quot;www.baidu.com&quot;,&quot;name&quot;:&quot;baidu&quot;}</span>
		c.AsciiJSON(http.StatusOK, data)
	})

	<span class="hljs-comment">// 在 8080 端口启动服务</span>
	r.Run(<span class="hljs-string">&quot;:8080&quot;</span>)
}{% endhighlight %}

<p>{% highlight %}运行：{% endhighlight %}启动 Gin Web 服务，我们来访问地址 {% highlight %}http://localhost:8080/{% endhighlight %}testJSON</p>

<p><img height="303" src="/uploads/ckeditor/pictures/607/image-20221024172853-1.png" width="1519" /></p>

<p>会在浏览器看到内容：</p>

<p><img height="497" src="/uploads/ckeditor/pictures/608/image-20221024173023-2.png" width="807" /></p>

