---
layout: post
title: "gin - Grouping routes 分组的路由"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/grouping-routes/">https://gin-gonic.com/docs/examples/grouping-routes/</a></p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">router</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#8f5902;font-style:italic">// Simple group: v1
</span>	<span style="color:#000">v1</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Group</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/v1&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">v1</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/login&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">loginEndpoint</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">v1</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/submit&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">submitEndpoint</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">v1</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/read&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">readEndpoint</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>

	<span style="color:#8f5902;font-style:italic">// Simple group: v2
</span>	<span style="color:#000">v2</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Group</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/v2&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">v2</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/login&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">loginEndpoint</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">v2</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/submit&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">submitEndpoint</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">v2</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/read&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">readEndpoint</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>

	<span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p>{% highlight %}补全代码：{% endhighlight %}</p>

<p>{% highlight %}增加代码中引入的内容和定义一下函数,可以把post修改为get，或者增加表单等{% endhighlight %}</p>

<p><img height="122" src="/uploads/ckeditor/pictures/642/image-20221025105217-2.png" width="479" /></p>

<p><img height="558" src="/uploads/ckeditor/pictures/643/image-20221025105233-3.png" width="1213" /></p>

<p><img height="446" src="/uploads/ckeditor/pictures/644/image-20221025105249-4.png" width="479" /></p>

