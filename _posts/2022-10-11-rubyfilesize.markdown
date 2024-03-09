---
layout: post
title: "ruby  file.size "
date: "2022-10-11"
categories: 
---
<p><a href="https://stackoverflow.com/questions/16026048/pretty-file-size-in-ruby">https://stackoverflow.com/questions/16026048/pretty-file-size-in-ruby</a></p>

<p>官网：<a href="https://ruby-doc.org/core-2.5.0/File.html#method-c-size">https://ruby-doc.org/core-2.5.0/File.html#method-c-size</a></p>

<p>写一个脚本：（包含一个方法，以及方法的调用）</p>

<pre><code>class Integer<br />
&nbsp; def to_filesize<br />
&nbsp;&nbsp;&nbsp; {&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;B&#39;&nbsp; =&gt; 1024,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;KB&#39; =&gt; 1024 * 1024,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;MB&#39; =&gt; 1024 * 1024 * 1024,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;GB&#39; =&gt; 1024 * 1024 * 1024 * 1024,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;TB&#39; =&gt; 1024 * 1024 * 1024 * 1024 * 1024<br />
&nbsp;&nbsp;&nbsp; }.each_pair { |e, s| return &quot;#{(self.to_f / (s / 1024)).round(2)}#{e}&quot; if self &lt; s }<br />
&nbsp; end<br />
end

puts File.size(&#39;Gemfile&#39;)<br />
a = File.size(&#39;Gemfile&#39;)<br />
puts a.to_filesize</code></pre>

<p>运行：ruby hi.rb</p>

<p><img height="121" src="/uploads/ckeditor/pictures/566/image-20221011093514-1.png" width="539" /></p>

