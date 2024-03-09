---
layout: post
title: "ruby  string replace"
date: "2023-06-28"
categories: 
---
<p><a href="https://linuxhint.com/ruby-string-replace/">https://linuxhint.com/ruby-string-replace/</a></p>

<p><a href="https://ruby-doc.org/core-2.4.2/String.html">https://ruby-doc.org/core-2.4.2/String.html</a></p>

<p>1.使用split,然后使用&ldquo;#{}&rdquo;（根据情况使用）</p>

<pre>
<code>&quot; now&#39;s  the time&quot;.split        #=&gt; [&quot;now&#39;s&quot;, &quot;the&quot;, &quot;time&quot;],
&quot; now&#39;s  the time&quot;.split(&#39; &#39;)   #=&gt; [&quot;now&#39;s&quot;, &quot;the&quot;, &quot;time&quot;]
&quot; now&#39;s  the time&quot;.split(/ /)   #=&gt; [&quot;&quot;, &quot;now&#39;s&quot;, &quot;&quot;, &quot;the&quot;, &quot;time&quot;]
&quot;1, 2.34,56, 7&quot;.split(%r{,\s*}) #=&gt; [&quot;1&quot;, &quot;2.34&quot;, &quot;56&quot;, &quot;7&quot;]
&quot;hello&quot;.split(//)               #=&gt; [&quot;h&quot;, &quot;e&quot;, &quot;l&quot;, &quot;l&quot;, &quot;o&quot;]
&quot;hello&quot;.split(//, 3)            #=&gt; [&quot;h&quot;, &quot;e&quot;, &quot;llo&quot;]
&quot;hi mom&quot;.split(%r{\s*})         #=&gt; [&quot;h&quot;, &quot;i&quot;, &quot;m&quot;, &quot;o&quot;, &quot;m&quot;]

&quot;mellow yellow&quot;.split(&quot;ello&quot;)   #=&gt; [&quot;m&quot;, &quot;w y&quot;, &quot;w&quot;]
&quot;1,2,,3,4,,&quot;.split(&#39;,&#39;)         #=&gt; [&quot;1&quot;, &quot;2&quot;, &quot;&quot;, &quot;3&quot;, &quot;4&quot;]
&quot;1,2,,3,4,,&quot;.split(&#39;,&#39;, 4)      #=&gt; [&quot;1&quot;, &quot;2&quot;, &quot;&quot;, &quot;3,4,,&quot;]
&quot;1,2,,3,4,,&quot;.split(&#39;,&#39;, -4)     #=&gt; [&quot;1&quot;, &quot;2&quot;, &quot;&quot;, &quot;3&quot;, &quot;4&quot;, &quot;&quot;, &quot;&quot;]

&quot;1:2:3&quot;.split(/(:)()()/, 2)     #=&gt; [&quot;1&quot;, &quot;:&quot;, &quot;&quot;, &quot;&quot;, &quot;2:3&quot;]

&quot;&quot;.split(&#39;,&#39;, -1)               #=&gt; []</code></pre>

<p>2.使用sub</p>

<pre>
<code>var1 = &quot;hello world&quot;

var1.sub(/\w+lo/, &quot;hey&quot;)</code></pre>

<p>output:</p>

<div class="blackboard codecolorer-container ruby" style="width:100%">
<div class="codecolorer ruby"><code>&quot;hey world&quot;</code></div>
</div>

<p>3.如果是多处替换，使用gsub</p>

<pre>
<code>var = &quot;hello world&quot;

=&gt; &quot;hello world&quot;

irb(main):006:0&gt;&nbsp; var.gsub(/\bhello\b/, &quot;Hello&quot;)

=&gt; &quot;Hello world&quot;</code></pre>

<p>4.insert</p>

<pre>
<code>msg = &quot;Hello world&quot;

=&gt; &quot;Hello world&quot;

irb(main):008:0&gt;&nbsp; msg.insert 5, &quot;,&quot;

=&gt; &quot;Hello, world&quot;</code></pre>

