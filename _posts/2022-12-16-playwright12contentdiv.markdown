---
layout: post
title: "playwright  使用（12）抓取页面的内容，content或者div等"
date: "2022-12-16"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/69980581/get-entire-playwright-page-in-html-and-text">https://stackoverflow.com/questions/69980581/get-entire-playwright-page-in-html-and-text</a></p>

<p><a href="https://playwright.dev/docs/api/class-page#page-content">https://playwright.dev/docs/api/class-page#page-content</a></p>

<p>For the full html of the page, this is what you need:</p>

{% highlight %}
{% highlight %}const html = await page.content(){% endhighlight %}

<p>To get the inner text of the div, this should work:</p>

{% highlight %}
{% highlight %}const pageText = await page.innerText(&#39;div&#39;){% endhighlight %}

<p>测试：</p>

{% highlight %}
{% highlight %}const { test, expect } = require(&#39;@playwright/test&#39;);
test(&#39;localhost locator&#39;, async ({ page }) =&gt; {

&nbsp; await&nbsp; page.goto(&quot;https://www.tafsirweb.com/3739-surat-yusuf-ayat-1.html&quot;)

&nbsp; const html = await page.content();

&nbsp; const pageText = await page.innerText(&#39;div&#39;);

&nbsp; console.log(&quot;====== html&quot;)

&nbsp; console.log(html);

&nbsp; console.log(&quot;====== pageText&quot;)

&nbsp; console.log(pageText);

});{% endhighlight %}

<p>&nbsp;</p>

