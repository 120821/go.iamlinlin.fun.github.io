---
layout: post
title: "rails datetime 年月日的简化"
date: "2022-06-29"
categories: 
---
<p>参考：<a href="https://apidock.com/ruby/DateTime/strftime">https://apidock.com/ruby/DateTime/strftime</a></p>

<p>使用数据库的时间数据进行视图页面的调用时，可以进行简化，使页面内容更加美观。</p>

<p>使用.strftime(&quot;%Y-%m-%d&quot;)即可把时间进行调整为仅展示年月日不展示+8000或者UTC等后缀。</p>

<pre>
<code>nft_owner.claimed_at.strftime(&quot;%Y-%m-%d&quot;)&nbsp;</code></pre>

<pre>
<code><span class="ident">t</span> <span class="punct">=</span> <span class="constant"><a href="https://apidock.com/ruby/Time">Time</a></span><span class="punct">.</span><span class="ident"><a href="https://apidock.com/ruby/DateTime/now/class">now</a></span>                        <span class="comment">#=&gt; 2007-11-19 08:37:48 -0600</span>
<span class="ident">t</span><span class="punct">.</span><span class="ident"><a href="https://apidock.com/ruby/DateTime/strftime">strftime</a></span><span class="punct">(&quot;</span><span class="string">Printed on %m/%d/%Y</span><span class="punct">&quot;)</span>   <span class="comment">#=&gt; &quot;Printed on 11/19/2007&quot;</span>
<span class="ident">t</span><span class="punct">.</span><span class="ident"><a href="https://apidock.com/ruby/DateTime/strftime">strftime</a></span><span class="punct">(&quot;</span><span class="string">at %I:%M%p</span><span class="punct">&quot;)</span>            <span class="comment">#=&gt; &quot;at 08:37AM&quot;</span></code></pre>

