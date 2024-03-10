---
layout: post
title: "playwright sleep n seconds"
date: "2022-12-16"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/66251670/how-to-wait-for-javascript-to-finish-in-playwright">https://stackoverflow.com/questions/66251670/how-to-wait-for-javascript-to-finish-in-playwright</a></p>
<p>1.Using the {% highlight html %}page.waitFor...{% endhighlight %} functions&nbsp; (<a href="https://playwright.dev/docs/api/class-page#page-wait-for-timeout">https://playwright.dev/docs/api/class-page#page-wait-for-timeout</a>)</p>
<p>{% highlight html %}page.waitFor{% endhighlight %}的使用：</p>
{% highlight html %}<span style="color:#393a34"><em>// wait for 1 second</em>
</span><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">waitForTimeout</span><span style="color:#393a34">(</span><span style="color:#005cc5">1000</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
