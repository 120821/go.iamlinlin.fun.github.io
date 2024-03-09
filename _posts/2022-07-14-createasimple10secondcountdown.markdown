---
layout: post
title: "Create a simple 10 second countdown"
date: "2022-07-14"
categories: 
---
<p>参考：https://stackoverflow.com/questions/55224963/adding-a-button-to-a-javascript-countdown</p>

<pre class="snippet-code-js lang-js s-code-block">
<code class="hljs language-javascript"><span class="hljs-comment">// Set the date we&#39;re counting down to</span>
<span class="hljs-keyword">var</span> countDownDate = <span class="hljs-keyword">new</span> <span class="hljs-title class_">Date</span>(<span class="hljs-title class_">Date</span>.<span class="hljs-title function_">now</span>() + <span class="hljs-number">20000</span>).<span class="hljs-title function_">getTime</span>();

<span class="hljs-comment">// Update the count down every 1 second</span>
<span class="hljs-keyword">var</span> x = <span class="hljs-built_in">setInterval</span>(<span class="hljs-keyword">function</span>() {

  <span class="hljs-comment">// Get todays date and time</span>
  <span class="hljs-keyword">var</span> now = <span class="hljs-keyword">new</span> <span class="hljs-title class_">Date</span>().<span class="hljs-title function_">getTime</span>();

  <span class="hljs-comment">// Find the distance between now and the count down date</span>
  <span class="hljs-keyword">var</span> distance = countDownDate - now;

  <span class="hljs-comment">// Time calculations for days, hours, minutes and seconds</span>
  <span class="hljs-keyword">var</span> days = <span class="hljs-title class_">Math</span>.<span class="hljs-title function_">floor</span>(distance / (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span> * <span class="hljs-number">60</span> * <span class="hljs-number">24</span>));
  <span class="hljs-keyword">var</span> hours = <span class="hljs-title class_">Math</span>.<span class="hljs-title function_">floor</span>((distance % (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span> * <span class="hljs-number">60</span> * <span class="hljs-number">24</span>)) / (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span> * <span class="hljs-number">60</span>));
  <span class="hljs-keyword">var</span> minutes = <span class="hljs-title class_">Math</span>.<span class="hljs-title function_">floor</span>((distance % (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span> * <span class="hljs-number">60</span>)) / (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span>));
  <span class="hljs-keyword">var</span> seconds = <span class="hljs-title class_">Math</span>.<span class="hljs-title function_">floor</span>((distance % (<span class="hljs-number">1000</span> * <span class="hljs-number">60</span>)) / <span class="hljs-number">1000</span>);

  <span class="hljs-comment">// Output the result in an element with id=&quot;demo&quot;</span>
  <span class="hljs-variable language_">document</span>.<span class="hljs-title function_">getElementById</span>(<span class="hljs-string">&quot;demo&quot;</span>).<span class="hljs-property">innerHTML</span> = days + <span class="hljs-string">&quot; days, &quot;</span> + hours + <span class="hljs-string">&quot; hours, &quot;</span> +
    minutes + <span class="hljs-string">&quot; minutes, &amp; &quot;</span> + seconds + <span class="hljs-string">&quot; seconds&quot;</span>;

  <span class="hljs-comment">// If the count down is over, write some text </span>
  <span class="hljs-keyword">if</span> (distance &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-built_in">clearInterval</span>(x);
    <span class="hljs-variable language_">document</span>.<span class="hljs-title function_">getElementById</span>(<span class="hljs-string">&quot;demo&quot;</span>).<span class="hljs-property">innerHTML</span> = <span class="hljs-string">&#39;&lt;a href=&quot;https://facebook.com&quot;&gt;We\&#39;re Live on Facebook!&lt;/a&gt;&#39;</span>;
  }
}, <span class="hljs-number">1000</span>);{% endhighlight %}

<p><code class="hljs language-javascript">视图页面的{% endhighlight %}</p>

<pre class="snippet-code-html lang-html s-code-block">
<code class="hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">p</span> <span class="hljs-attr">id</span>=<span class="hljs-string">&quot;demo&quot;</span> <span class="hljs-attr">class</span>=<span class="hljs-string">&quot;countdown-live&quot;</span> <span class="hljs-attr">style</span>=<span class="hljs-string">&quot;text-align:center;&quot;</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-name">p</span>&gt;</span>{% endhighlight %}

<p><img height="176" src="/uploads/ckeditor/pictures/92/image-20220714093135-2.png" width="489" /></p>

<p>点击链接（按钮），进行倒数，倒数结束进行按钮的显示。</p>

<p><img height="86" src="/uploads/ckeditor/pictures/93/image-20220714093353-3.png" width="386" /></p>

