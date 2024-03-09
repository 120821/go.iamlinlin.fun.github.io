---
layout: post
title: "playwright 的安装 使用（7）编写测试（面向对象）"
date: "2022-12-15"
categories: 
---
<p>参考： <a href="https://playwright.dev/docs/pom">https://playwright.dev/docs/pom</a></p>

<p>可以构建大型测试套件以优化编写和维护的便利性。&nbsp; 页面对象模型就是这样一种构建测试套件的方法。</p>

<p>&nbsp;页面对象代表 Web 应用程序的一部分。&nbsp; 电子商务 Web 应用程序可能有一个主页、一个列表页面和一个结帐页面。&nbsp; 它们中的每一个都可以由页面对象模型表示。</p>

<p>&nbsp;页面对象通过创建适合您的应用程序的更高级别的 API 来简化创作，并通过在一个地方捕获元素选择器和创建可重用代码来避免重复来简化维护。</p>

<p>我们将创建一个 PlaywrightDevPage 帮助类来封装 playwright.dev 页面上的常用操作。&nbsp; 在内部，它将使用页面对象。</p>

<pre>
<code><span style="color:#393a34"><em>// playwright-dev-page.js</em>
</span><span style="color:#393a34"><span style="color:#cf222e">const</span> <span style="color:#393a34">{</span> expect <span style="color:#393a34">}</span> <span style="color:#d73a49">=</span> <span style="color:#8250df">require</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;@playwright/test&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span>
<span style="color:#393a34">exports<span style="color:#393a34">.</span>PlaywrightDevPage <span style="color:#d73a49">=</span> <span style="color:#cf222e">class</span> <span style="color:#116329">PlaywrightDevPage</span> <span style="color:#393a34">{</span>
</span>
<span style="color:#393a34">  <em>/**</em>
</span><span style="color:#393a34"><em>   * @param {import(&#39;@playwright/test&#39;).Page} page</em>
</span><span style="color:#393a34"><em>   */</em>
</span><span style="color:#393a34">  <span style="color:#8250df">constructor</span><span style="color:#393a34">(</span><span style="color:#953800">page</span><span style="color:#393a34">)</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>page <span style="color:#d73a49">=</span> page<span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>getStartedLink <span style="color:#d73a49">=</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;a&#39;</span><span style="color:#393a34">,</span> <span style="color:#393a34">{</span> <span style="color:#005cc5">hasText</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;Get started&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>gettingStartedHeader <span style="color:#d73a49">=</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;h1&#39;</span><span style="color:#393a34">,</span> <span style="color:#393a34">{</span> <span style="color:#005cc5">hasText</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;Installation&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>pomLink <span style="color:#d73a49">=</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;li&#39;</span><span style="color:#393a34">,</span> <span style="color:#393a34">{</span> <span style="color:#005cc5">hasText</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;Guides&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;a&#39;</span><span style="color:#393a34">,</span> <span style="color:#393a34">{</span> <span style="color:#005cc5">hasText</span><span style="color:#d73a49">:</span> <span style="color:#c6105f">&#39;Page Object Model&#39;</span> <span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>tocList <span style="color:#d73a49">=</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;article div.markdown ul &gt; li &gt; a&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">}</span>
</span>
<span style="color:#393a34">  <span style="color:#cf222e">async</span> <span style="color:#8250df">goto</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">await</span> <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>page<span style="color:#393a34">.</span><span style="color:#8250df">goto</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;https://playwright.dev&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">}</span>
</span>
<span style="color:#393a34">  <span style="color:#cf222e">async</span> <span style="color:#8250df">getStarted</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">await</span> <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>getStartedLink<span style="color:#393a34">.</span><span style="color:#8250df">first</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">await</span> <span style="color:#8250df">expect</span><span style="color:#393a34">(</span><span style="color:#cf222e">this</span><span style="color:#393a34">.</span>gettingStartedHeader<span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">toBeVisible</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">}</span>
</span>
<span style="color:#393a34">  <span style="color:#cf222e">async</span> <span style="color:#8250df">pageObjectModel</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">await</span> <span style="color:#cf222e">this</span><span style="color:#393a34">.</span><span style="color:#8250df">getStarted</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">    <span style="color:#cf222e">await</span> <span style="color:#cf222e">this</span><span style="color:#393a34">.</span>pomLink<span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#393a34">}</span>
</span><span style="color:#393a34"><span style="color:#393a34">}</span></span>{% endhighlight %}

<p>现在我们可以在我们的测试中使用 PlaywrightDevPage 类。</p>

<pre>
<code><span style="color:#393a34"><em>// example.spec.js</em>
</span><span style="color:#393a34"><span style="color:#cf222e">const</span> <span style="color:#393a34">{</span> test<span style="color:#393a34">,</span> expect <span style="color:#393a34">}</span> <span style="color:#d73a49">=</span> <span style="color:#8250df">require</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;@playwright/test&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#cf222e">const</span> <span style="color:#393a34">{</span> PlaywrightDevPage <span style="color:#393a34">}</span> <span style="color:#d73a49">=</span> <span style="color:#8250df">require</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;./playwright-dev-page&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span>
<span style="color:#393a34"><span style="color:#8250df">test</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;getting started should contain table of contents&#39;</span><span style="color:#393a34">,</span> <span style="color:#cf222e">async</span> <span style="color:#393a34">(</span><span style="color:#393a34">{</span><span style="color:#953800"> page </span><span style="color:#393a34">}</span><span style="color:#393a34">)</span> <span style="color:#d73a49">=&gt;</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">const</span> playwrightDev <span style="color:#d73a49">=</span> <span style="color:#cf222e">new</span> <span style="color:#116329">PlaywrightDevPage</span><span style="color:#393a34">(</span>page<span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> playwrightDev<span style="color:#393a34">.</span><span style="color:#8250df">goto</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> playwrightDev<span style="color:#393a34">.</span><span style="color:#8250df">getStarted</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> <span style="color:#8250df">expect</span><span style="color:#393a34">(</span>playwrightDev<span style="color:#393a34">.</span>tocList<span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">toHaveText</span><span style="color:#393a34">(</span><span style="color:#393a34">[</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">How to install Playwright</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">What&#39;s Installed</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">How to run the example test</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">How to open the HTML test report</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">Write tests using web first assertions, page fixtures and locators</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">Run single test, multiple tests, headed mode</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">Generate tests with Codegen</span><span style="color:#c6105f">`</span><span style="color:#393a34">,</span>
</span><span style="color:#393a34">    <span style="color:#c6105f">`</span><span style="color:#c6105f">See a trace of your tests</span><span style="color:#c6105f">`</span>
</span><span style="color:#393a34">  <span style="color:#393a34">]</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span>
<span style="color:#393a34"><span style="color:#8250df">test</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;should show Page Object Model article&#39;</span><span style="color:#393a34">,</span> <span style="color:#cf222e">async</span> <span style="color:#393a34">(</span><span style="color:#393a34">{</span><span style="color:#953800"> page </span><span style="color:#393a34">}</span><span style="color:#393a34">)</span> <span style="color:#d73a49">=&gt;</span> <span style="color:#393a34">{</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">const</span> playwrightDev <span style="color:#d73a49">=</span> <span style="color:#cf222e">new</span> <span style="color:#116329">PlaywrightDevPage</span><span style="color:#393a34">(</span>page<span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> playwrightDev<span style="color:#393a34">.</span><span style="color:#8250df">goto</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> playwrightDev<span style="color:#393a34">.</span><span style="color:#8250df">pageObjectModel</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34">  <span style="color:#cf222e">await</span> <span style="color:#8250df">expect</span><span style="color:#393a34">(</span>page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;article&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">toContainText</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;Page Object Model is a common pattern&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#393a34">}</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

