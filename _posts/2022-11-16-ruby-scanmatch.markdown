---
layout: post
title: "ruby - scan match 的区别"
date: "2022-11-16"
categories: 
---
<p>参考：&nbsp;<a href="https://blog.csdn.net/cz9025/article/details/90202839">https://blog.csdn.net/cz9025/article/details/90202839</a></p>

<p><strong>scan:</strong></p>

<p>&emsp;&emsp;查找全部匹配的内容，返回一个数组。</p>

<p>&emsp;&emsp;如果未匹配到，返回[]。</p>

<p>&emsp;&emsp;返回结果：()匹配到的内容。</p>

<p><strong>match:</strong></p>

<p>&emsp;&emsp;只匹配第一次，返回为MatchData类型。</p>

<p>&emsp;&emsp;如果未匹配到，返回nil。</p>

<p>&emsp;&emsp;返回结果：完整匹配部分+（）匹配到的内容。</p>

<p>例如：</p>

<p>hi.rb</p>

<pre>
<code>module ModuleName

&nbsp; def fn

&nbsp; &nbsp; p &quot;module cz&quot;

&nbsp; end

end</code></pre>

<p>以获得model 名称为例：</p>

<p>&nbsp;</p>

<pre>
<code>Dir[&quot;xx.rb&quot;].each do |file|

&nbsp; name1 = File.read(file).scan(/module (.*)/)

&nbsp; p name1

&nbsp; name2 = File.read(file).match(/module (.*)/)

&nbsp; p name2

&nbsp; name3 = File.read(file).scan(/hh (.*)/)

&nbsp; p name3

&nbsp; name4 = File.read(file).match(/hh (.*)/)

&nbsp; p name4

end</code></pre>

<p>运行结果：</p>

<p>&nbsp;</p>

<p><img alt="在这里插入图片描述" src="https://img-blog.csdnimg.cn/20190514112240478.png" /></p>

