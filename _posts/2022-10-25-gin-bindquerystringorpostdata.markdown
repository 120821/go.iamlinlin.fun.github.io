---
layout: post
title: "gin - 绑定查询字符串或发布数据 Bind query string or post data"
date: "2022-10-25"
categories: 
---
<p><a href="https://github.com/gin-gonic/gin/issues/742#issuecomment-264681292">https://github.com/gin-gonic/gin/issues/742#issuecomment-264681292</a></p>

<p><a href="https://gin-gonic.com/docs/examples/bind-query-or-post/">https://gin-gonic.com/docs/examples/bind-query-or-post/</a></p>

<p>示例：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">package</span> <span style="color:#000">main</span>

<span style="color:#204a87;font-weight:700">import</span> <span style="color:#000;font-weight:700">(</span>
	<span style="color:#4e9a06">&quot;log&quot;</span>
	<span style="color:#4e9a06">&quot;time&quot;</span>

	<span style="color:#4e9a06">&quot;github.com/gin-gonic/gin&quot;</span>
<span style="color:#000;font-weight:700">)</span>

<span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">Person</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">Name</span>     <span style="color:#204a87;font-weight:700">string</span>    <span style="color:#4e9a06">`form:&quot;name&quot;`</span>
	<span style="color:#000">Address</span>  <span style="color:#204a87;font-weight:700">string</span>    <span style="color:#4e9a06">`form:&quot;address&quot;`</span>
	<span style="color:#000">Birthday</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Time</span> <span style="color:#4e9a06">`form:&quot;birthday&quot; time_format:&quot;2006-01-02&quot; time_utc:&quot;1&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">route</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/testing&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">startPage</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8085&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">startPage</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">person</span> <span style="color:#000">Person</span>
	<span style="color:#8f5902;font-style:italic">// If `GET`, only `Form` binding engine (`query`) used.
</span>	<span style="color:#8f5902;font-style:italic">// If `POST`, first checks the `content-type` for `JSON` or `XML`, then uses `Form` (`form-data`).
</span>	<span style="color:#8f5902;font-style:italic">// See more at https://github.com/gin-gonic/gin/blob/master/binding/binding.go#L48
</span>	<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ShouldBind</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">person</span><span style="color:#000;font-weight:700">)</span> <span style="color:#ce5c00;font-weight:700">==</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">person</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Name</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">person</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Address</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">person</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Birthday</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>

	<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">String</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;Success&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
</code></pre>

<p>然后运行，在命令行：</p>

<pre><code># bind by query<br />
$ curl -X GET &quot;localhost:8085/testing?name=appleboy&amp;address=xyz&quot;<br />
# bind by json<br />
$ curl -X GET localhost:8085/testing --data &#39;{&quot;name&quot;:&quot;JJ&quot;, &quot;address&quot;:&quot;xyz&quot;}&#39; -H &quot;Content-Type:application/json&quot;</code></pre>

<p><img height="119" src="/uploads/ckeditor/pictures/620/image-20221025092430-1.png" width="1691" /></p>

<p><img height="545" src="/uploads/ckeditor/pictures/621/image-20221025092444-2.png" width="1285" /></p>
</div>

