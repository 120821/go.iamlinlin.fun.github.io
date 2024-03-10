---
layout: post
title: "playwright 的安装 使用（9）编写测试（截图）"
date: "2022-12-15"
categories: 
---
<p>参考： <a href="https://playwright.dev/docs/screenshots">https://playwright.dev/docs/screenshots</a></p>
<p>这是捕获屏幕截图并将其保存到文件中的快速方法：</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">screenshot</span><span style="color:#393a34">(</span><span style="color:#393a34">{</span> <span style="color:#005cc5">path</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;screenshot.png&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p><strong>全页面截图</strong></p>
<p>Full page screenshot 是一个完整的可滚动页面的屏幕截图，就好像你有一个非常高的屏幕并且页面可以完全容纳它。</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">screenshot</span><span style="color:#393a34">(</span><span style="color:#393a34">{</span> <span style="color:#005cc5">path</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;screenshot.png&#39;</span><span style="color:#393a34">,</span> <span style="color:#005cc5">fullPage</span><span style="color:#d73a49">:</span> <span style="color:#005cc5">true</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p><strong>捕获到缓冲区</strong></p>
<p>您可以获取包含图像的缓冲区并对其进行后处理或将其传递给第三方像素差异工具，而不是写入文件。</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">const</span> buffer <span style="color:#d73a49">=</span> <span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">screenshot</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#116329">console</span><span style="color:#393a34">.</span><span style="color:#8250df">log</span><span style="color:#393a34">(</span>buffer<span style="color:#393a34">.</span><span style="color:#8250df">toString</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;base64&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p><strong>元素截图</strong></p>
<p>有时截取单个元素的屏幕截图很有用。</p>
{% highlight html %}<span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;.header&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">screenshot</span><span style="color:#393a34">(</span><span style="color:#393a34">{</span> <span style="color:#005cc5">path</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;screenshot.png&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
