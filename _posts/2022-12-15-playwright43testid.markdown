---
layout: post
title: " playwright 的安装 使用（4）编写测试（元素定位3） testID"
date: "2022-12-15"
categories: 
---
<p>参考：<a href="https://playwright.dev/docs/api/class-page#page-get-by-test-id">https://playwright.dev/docs/api/class-page#page-get-by-test-id</a></p>
<p>使用test_id</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#393a34">&lt;</span><span style="color:#22863a">ul</span><span style="color:#393a34">&gt;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">&lt;</span><span style="color:#22863a">li</span><span style="color:#22863a"> </span><span style="color:#0550ae">data-testid</span><span style="color:#393a34">=</span><span style="color:#393a34">&#39;</span><span style="color:#c6105f">apple</span><span style="color:#393a34">&#39;</span><span style="color:#393a34">&gt;</span>apple<span style="color:#393a34">&lt;/</span><span style="color:#22863a">li</span><span style="color:#393a34">&gt;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">&lt;</span><span style="color:#22863a">li</span><span style="color:#22863a"> </span><span style="color:#0550ae">data-testid</span><span style="color:#393a34">=</span><span style="color:#393a34">&#39;</span><span style="color:#c6105f">banana</span><span style="color:#393a34">&#39;</span><span style="color:#393a34">&gt;</span>banana<span style="color:#393a34">&lt;/</span><span style="color:#22863a">li</span><span style="color:#393a34">&gt;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">&lt;</span><span style="color:#22863a">li</span><span style="color:#22863a"> </span><span style="color:#0550ae">data-testid</span><span style="color:#393a34">=</span><span style="color:#393a34">&#39;</span><span style="color:#c6105f">orange</span><span style="color:#393a34">&#39;</span><span style="color:#393a34">&gt;</span>orange<span style="color:#393a34">&lt;/</span><span style="color:#22863a">li</span><span style="color:#393a34">&gt;</span>
</span><span style="color:#393a34"><span style="color:#393a34">&lt;/</span><span style="color:#22863a">ul</span><span style="color:#393a34">&gt;</span></span>{% endhighlight %}
<p>（1）通过&ldquo;橙色&rdquo;的测试 ID 找到一个项目，然后单击它。</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">getByTestId</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;orange&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p>{% highlight html %}<span style="color:#393a34"><span style="color:#393a34">使用的时候，需要把config的关于test_id的内容注释了，如果存在关于test_id的内容的话，没有就不必了。 参考：<a href="https://playwright.dev/docs/api/class-page#page-get-by-test-id">https://playwright.dev/docs/api/class-page#page-get-by-test-id</a></span></span>{% endhighlight %}</p>
{% highlight html %}<span style="color:#393a34"><em>// Set custom test id attribute from @playwright/test config:</em>
</span><span style="color:#393a34"><span style="color:#005cc5">use</span><span style="color:#d73a49">:</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">  <span style="color:#005cc5">testIdAttribute</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;data-pw&#39;</span>
</span><span style="color:#393a34"><span style="color:#393a34">}</span></span>{% endhighlight %}
<p>{% highlight html %}（2）根据第n项进行测试：{% endhighlight %}</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">const</span> banana <span style="color:#d73a49">=</span> <span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">getByRole</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;listitem&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">nth</span><span style="color:#393a34">(</span><span style="color:#005cc5">1</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p>但是，请谨慎使用此方法。 很多时候，页面可能会发生变化，定位器将指向与您预期的元素完全不同的元素。 相反，尝试提出一个将通过 <a href="https://playwright.dev/docs/locators#strictness">严格标准 </a>的唯一定位器。</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
