---
layout: post
title: "ruby datetime unixtime"
date: "2022-06-30"
categories: 
---
<p>参考：<a href="https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/DateTime.html">https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/DateTime.html</a></p>

<p><a href="https://ruby-doc.org/core-2.6.3/Time.html">https://ruby-doc.org/core-2.6.3/Time.html</a></p>

<p><a href="https://en.wikipedia.org/wiki/Unix_time">https://en.wikipedia.org/wiki/Unix_time</a></p>

<pre>
<code>Time.at(1656551830)

=&gt; 2022-06-30 09:17:10 +0800</code></pre>

<p>datetime：Date 的子类，可以轻松处理日期、小时、分钟、秒和偏移量。 DateTime 不考虑任何闰秒，不跟踪任何夏令时规则。 使用 DateTime::new、DateTime::jd、DateTime::ordinal、DateTime::commercial、DateTime::parse、DateTime::strptime、DateTime::now、Time#to_datetime 等创建 DateTime 对象。</p>

<p>日、小时、分钟或秒的最后一个元素可以是小数。 假设小数的精度最多为纳秒。</p>

<p>进入irb环境：</p>

<pre class="ruby">
<code><span class="ruby-identifier">require</span> <span class="ruby-string">&#39;date&#39;</span>
<span class="ruby-constant">DateTime</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2001</span>,<span class="ruby-value">2</span>,<span class="ruby-value">3</span>,<span class="ruby-value">4</span>,<span class="ruby-value">5</span>,<span class="ruby-value">6</span>)
<span class="ruby-comment">#=&gt; #&lt;DateTime: 2001-02-03T04:05:06+00:00 ...&gt;</span></code></pre>

<pre class="ruby">
<code><span class="ruby-constant">DateTime</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2001</span>,<span class="ruby-value">2</span>,<span class="ruby-value">3.5</span>)
<span class="ruby-comment">#=&gt; #&lt;DateTime: 2001-02-03T12:00:00+00:00 ...&gt;</span></code></pre>

<p>DateTime 对象有多种方法</p>

<pre class="ruby">
<span class="ruby-identifier">d</span> = <span class="ruby-constant">DateTime</span>.<span class="ruby-identifier">parse</span>(<span class="ruby-string">&#39;3rd Feb 2001 04:05:06+03:30&#39;</span>)
                    <span class="ruby-comment">#=&gt; #&lt;DateTime: 2001-02-03T04:05:06+03:30 ...&gt;</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">hour</span>              <span class="ruby-comment">#=&gt; 4</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">min</span>               <span class="ruby-comment">#=&gt; 5</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">sec</span>               <span class="ruby-comment">#=&gt; 6</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">offset</span>            <span class="ruby-comment">#=&gt; (7/48)</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">zone</span>              <span class="ruby-comment">#=&gt; &quot;+03:30&quot;</span>
<span class="ruby-identifier">d</span> <span class="ruby-operator">+=</span> <span class="ruby-constant">Rational</span>(<span class="ruby-string">&#39;1.5&#39;</span>)
                    <span class="ruby-comment">#=&gt; #&lt;DateTime: 2001-02-04%16:05:06+03:30 ...&gt;</span>
<span class="ruby-identifier">d</span> = <span class="ruby-identifier">d</span>.<span class="ruby-identifier">new_offset</span>(<span class="ruby-string">&#39;+09:00&#39;</span>)
                    <span class="ruby-comment">#=&gt; #&lt;DateTime: 2001-02-04%21:35:06+09:00 ...&gt;</span>
<span class="ruby-identifier">d</span>.<span class="ruby-identifier">strftime</span>(<span class="ruby-string">&#39;%I:%M:%S %p&#39;</span>)
                    <span class="ruby-comment">#=&gt; &quot;09:35:06 PM&quot;</span>
<span class="ruby-identifier">d</span> <span class="ruby-operator">&gt;</span> <span class="ruby-constant">DateTime</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">1999</span>)
                    <span class="ruby-comment">#=&gt; true</span></pre>

<p>使用time方法</p>

<pre class="ruby">
<span class="ruby-constant">Time</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2002</span>)         <span class="ruby-comment">#=&gt; 2002-01-01 00:00:00 -0500</span>
<span class="ruby-constant">Time</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2002</span>, <span class="ruby-value">10</span>)     <span class="ruby-comment">#=&gt; 2002-10-01 00:00:00 -0500</span>
<span class="ruby-constant">Time</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2002</span>, <span class="ruby-value">10</span>, <span class="ruby-value">31</span>) <span class="ruby-comment">#=&gt; 2002-10-31 00:00:00 -0500</span></pre>

<p><span class="ruby-comment">UTCtime</span></p>

<pre class="ruby">
<span class="ruby-constant">Time</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2002</span>, <span class="ruby-value">10</span>, <span class="ruby-value">31</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-string">&quot;+02:00&quot;</span>) <span class="ruby-comment">#=&gt; 2002-10-31 02:02:02 +0200</span>
</pre>

<p><span class="ruby-comment">timezone方法</span></p>

<pre class="ruby">
<span class="ruby-identifier">tz</span> = <span class="ruby-identifier">timezone</span>(<span class="ruby-string">&quot;Europe/Athens&quot;</span>) <span class="ruby-comment"># Eastern European Time, UTC+2</span>
<span class="ruby-constant">Time</span>.<span class="ruby-identifier">new</span>(<span class="ruby-value">2002</span>, <span class="ruby-value">10</span>, <span class="ruby-value">31</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-identifier">tz</span>) <span class="ruby-comment">#=&gt; 2002-10-31 02:02:02 +0200</span></pre>

<p>Time.now<br />
=&gt; 2022-06-30 09:17:07 +0800<br />
irb(main):002:0&gt; Time.now.to_i<br />
=&gt; 1656551830</p>

<p>&nbsp;</p>

<div class="notranslate" style="all: initial;">&nbsp;</div>

