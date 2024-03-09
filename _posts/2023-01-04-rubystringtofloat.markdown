---
layout: post
title: "ruby string to float "
date: "2023-01-04"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/29595256/ruby-convert-string-to-float">https://stackoverflow.com/questions/29595256/ruby-convert-string-to-float</a></p>

<pre>
<code>a = &quot;5.21&quot;
b = &quot;5.22&quot;
c = &quot;5.23&quot;

[a, b, c].map(&amp;:to_f).inject(:+)
#=&gt; 15.66</code></pre>

