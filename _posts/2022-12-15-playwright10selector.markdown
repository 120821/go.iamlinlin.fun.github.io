---
layout: post
title: "playwright 的安装 使用（10）编写测试（selector） "
date: "2022-12-15"
categories: 
---
<p>参考： <a href="https://playwright.dev/docs/selectors">https://playwright.dev/docs/selectors</a></p>

<p><strong>文本选择器</strong>（更多的：text selector <a href="https://playwright.dev/docs/selectors#text-selector">https://playwright.dev/docs/selectors#text-selector</a>）</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;text=Log in&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>文本选择器定位包含传递文本的元素。</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;text=Log in&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>文本选择器有一些变化：</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; text=Log in - 默认匹配不区分大小写，修剪空格并搜索子字符串。&nbsp; 例如，text=Log 匹配 &lt;button&gt;Log in&lt;/button&gt;。</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;text=Log in&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>text=&quot;Log in&quot; - 文本主体可以用单引号或双引号转义，以在修剪空格后搜索具有准确内容的文本节点。&nbsp; 例如，text=&quot;Log&quot; 与 &lt;button&gt;Log in&lt;/button&gt; 不匹配，因为 &lt;button&gt; 包含不等于&ldquo;Log&rdquo;的单个文本节点&ldquo;Log in&rdquo;。&nbsp; 但是，text=&quot;Log&quot; 匹配 &lt;button&gt; Log &lt;span&gt;in&lt;/span&gt;&lt;/button&gt;，因为 &lt;button&gt; 包含文本节点&ldquo; Log &rdquo;。&nbsp; 这种精确模式意味着区分大小写匹配，因此 text=&quot;Download&quot; 将不匹配 &lt;button&gt;download&lt;/button&gt;。</p>

<p>&nbsp;引用的正文遵循通常的转义规则，例如使用 \&quot; 来转义双引号字符串中的双引号：text=&quot;foo\&quot;bar&quot;。</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;text=&quot;Log in&quot;&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p><strong>CSS selector</strong>(more: <a href="https://playwright.dev/docs/selectors#css-selector">https://playwright.dev/docs/selectors#css-selector</a>)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;button&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;#nav-bar .contact-us-item&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p><strong>按属性选择，使用 css 选择器</strong></p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;[data-test=login-button]&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;[aria-label=&quot;Sign in&quot;]&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>结合 css 和文本选择器(more <a href="https://playwright.dev/docs/selectors#text-selector"><code>:has-text()</code> and <code>:text()</code> pseudo classes</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;article:has-text(&quot;Playwright&quot;)&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span>
</span><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;#nav-bar &gt;&gt; text=Contact Us&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>包含另一个的元素，带有 css 选择器(more <a href="https://playwright.dev/docs/selectors#selecting-elements-that-contain-other-elements"><code>:has()</code> pseudo class</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;.item-description:has(.item-promo-banner)&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>基于布局选择，使用 css 选择器(more <a href="https://playwright.dev/docs/selectors#selecting-elements-based-on-layout">layout selectors</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;input:right-of(:text(&quot;Username&quot;))&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>只有可见元素，带有 css 选择器(more <a href="https://playwright.dev/docs/selectors#selecting-visible-elements">selecting visible elements</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;.login-button:visible&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>Pick n-th match(more <a href="https://playwright.dev/docs/selectors#pick-n-th-match-from-the-query-result"><code>:nth-match()</code> pseudo-class</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;:nth-match(:text(&quot;Buy&quot;), 3)&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>XPath selector(<a href="https://playwright.dev/docs/selectors#xpath-selectors">XPath selector</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;xpath=//button&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>React 选择器（实验性的）(<a href="https://playwright.dev/docs/selectors#react-selectors">React selectors</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;_react=ListItem[text *= &quot;milk&quot; i]&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>Vue 选择器（实验性）( <a href="https://playwright.dev/docs/selectors#vue-selectors">Vue selectors</a>.)</p>

<pre>
<code><span style="color:#393a34"><span style="color:#cf222e">await</span> page<span style="color:#393a34">.</span><span style="color:#8250df">locator</span><span style="color:#393a34">(</span><span style="color:#c6105f">&#39;_vue=list-item[text *= &quot;milk&quot; i]&#39;</span><span style="color:#393a34">)</span><span style="color:#393a34">.</span><span style="color:#8250df">click</span><span style="color:#393a34">(</span><span style="color:#393a34">)</span><span style="color:#393a34">;</span></span>{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

