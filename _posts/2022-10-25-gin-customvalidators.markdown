---
layout: post
title: "gin - 自定义验证器 custom validators"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/custom-validators/">https://gin-gonic.com/docs/examples/custom-validators/</a></p>

<p>也可以注册自定义验证器:<a href="https://github.com/gin-gonic/examples/tree/master/struct-lvl-validations">https://github.com/gin-gonic/examples/tree/master/struct-lvl-validations</a></p>

<p>示例：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">package</span> <span style="color:#000">main</span>

<span style="color:#204a87;font-weight:700">import</span> <span style="color:#000;font-weight:700">(</span>
	<span style="color:#4e9a06">&quot;net/http&quot;</span>
	<span style="color:#4e9a06">&quot;time&quot;</span>

	<span style="color:#4e9a06">&quot;github.com/gin-gonic/gin&quot;</span>
	<span style="color:#4e9a06">&quot;github.com/gin-gonic/gin/binding&quot;</span>
	<span style="color:#4e9a06">&quot;github.com/go-playground/validator/v10&quot;</span>
<span style="color:#000;font-weight:700">)</span>

<span style="color:#8f5902;font-style:italic">// Booking contains binded and validated data.
</span><span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">Booking</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">CheckIn</span>  <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Time</span> <span style="color:#4e9a06">`form:&quot;check_in&quot; binding:&quot;required,bookabledate&quot; time_format:&quot;2006-01-02&quot;`</span>
	<span style="color:#000">CheckOut</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Time</span> <span style="color:#4e9a06">`form:&quot;check_out&quot; binding:&quot;required,gtfield=CheckIn,bookabledate&quot; time_format:&quot;2006-01-02&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">bookableDate</span> <span style="color:#000">validator</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Func</span> <span style="color:#000;font-weight:700">=</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">fl</span> <span style="color:#000">validator</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">FieldLevel</span><span style="color:#000;font-weight:700">)</span> <span style="color:#204a87;font-weight:700">bool</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">date</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">ok</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">fl</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Field</span><span style="color:#000;font-weight:700">().</span><span style="color:#000">Interface</span><span style="color:#000;font-weight:700">().(</span><span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Time</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">ok</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">today</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Now</span><span style="color:#000;font-weight:700">()</span>
		<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">today</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">After</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">date</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#204a87;font-weight:700">return</span> <span style="color:#204a87;font-weight:700">false</span>
		<span style="color:#000;font-weight:700">}</span>
	<span style="color:#000;font-weight:700">}</span>
	<span style="color:#204a87;font-weight:700">return</span> <span style="color:#204a87;font-weight:700">true</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">route</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">v</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">ok</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">binding</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Validator</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Engine</span><span style="color:#000;font-weight:700">().(</span><span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">validator</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Validate</span><span style="color:#000;font-weight:700">);</span> <span style="color:#000">ok</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">v</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">RegisterValidation</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;bookabledate&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">bookableDate</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>

	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/bookable&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">getBookable</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8085&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">getBookable</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">b</span> <span style="color:#000">Booking</span>
	<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ShouldBindWith</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">b</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">binding</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Query</span><span style="color:#000;font-weight:700">);</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">==</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span><span style="color:#4e9a06">&quot;message&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#4e9a06">&quot;Booking dates are valid!&quot;</span><span style="color:#000;font-weight:700">})</span>
	<span style="color:#000;font-weight:700">}</span> <span style="color:#204a87;font-weight:700">else</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusBadRequest</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span><span style="color:#4e9a06">&quot;error&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">err</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Error</span><span style="color:#000;font-weight:700">()})</span>
	<span style="color:#000;font-weight:700">}</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p><code class="language-go" data-lang="go">测试：{% endhighlight %}</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-sh" data-lang="sh">$ curl <span style="color:#4e9a06">&quot;localhost:8085/bookable?check_in=2118-04-16&amp;check_out=2118-04-17&quot;</span>
<span style="color:#ce5c00;font-weight:700">{</span><span style="color:#4e9a06">&quot;message&quot;</span>:<span style="color:#4e9a06">&quot;Booking dates are valid!&quot;</span><span style="color:#ce5c00;font-weight:700">}</span>

$ curl <span style="color:#4e9a06">&quot;localhost:8085/bookable?check_in=2118-03-10&amp;check_out=2118-03-09&quot;</span>
<span style="color:#ce5c00;font-weight:700">{</span><span style="color:#4e9a06">&quot;error&quot;</span>:<span style="color:#4e9a06">&quot;Key: &#39;Booking.CheckOut&#39; Error:Field validation for &#39;CheckOut&#39; failed on the &#39;gtfield&#39; tag&quot;</span><span style="color:#ce5c00;font-weight:700">}</span>
{% endhighlight %}

<p><img height="79" src="/uploads/ckeditor/pictures/634/image-20221025102800-1.png" width="1620" /></p>

<p><img height="348" src="/uploads/ckeditor/pictures/635/image-20221025102828-2.png" width="1458" /></p>
</div>

