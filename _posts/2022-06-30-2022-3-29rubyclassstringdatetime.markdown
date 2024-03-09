---
layout: post
title: "如何把 字符串 "2022-3-29" 转换成 ruby可以理解的日期(class 从String 变成 DateTime) "
date: "2022-06-30"
categories: 
---
<p>参考：https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/DateTime.html</p>

<p>https://ruby-doc.org/core-2.0.0/Time.html#method-i-strftime</p>

<p>&nbsp;require &#39;date&#39;<br />
=&gt; true</p>

<p>(&#39;2022-06-29 11:27:31 +0800&#39;).to_datetime<br />
=&gt; Wed, 29 Jun 2022 11:27:31 +0800</p>

<p>require &#39;date&#39;</p>

<p>date = DateTime.parse(&quot;2011-05-19 10:30:14&quot;)<br />
formatted_date = date.strftime(&#39;%a %b %d %H:%M:%S %Z %Y&#39;)</p>

<p>Model.where(&quot;cast(strftime(&#39;%Y&#39;, date_column) as int) = ?&quot;, desired_year)<br />
Model.where(&quot;cast(strftime(&#39;%m&#39;, date_column) as int) = ?&quot;, desired_month)<br />
Model.where(&quot;cast(strftime(&#39;%d&#39;, date_column) as int) = ?&quot;, desired_day_of_month)</p>

<p>&nbsp;</p>

<p>irb(main):015:0&gt; DateTime.new(2001,2,3,4,5,6)<br />
=&gt; #&lt;DateTime: 2001-02-03T04:05:06+00:00 ((2451944j,14706s,0n),+0s,2299161j)&gt;<br />
irb(main):016:0&gt; DateTime.new(2001,2,3.5)<br />
=&gt; #&lt;DateTime: 2001-02-03T12:00:00+00:00 ((2451944j,43200s,0n),+0s,2299161j)&gt;<br />
irb(main):017:0&gt; DateTime.iso8601(&#39;1616-04-23&#39;, Date::ENGLAND)<br />
=&gt; #&lt;DateTime: 1616-04-23T00:00:00+00:00 ((2311415j,0s,0n),+0s,2361222j)&gt;<br />
irb(main):018:0&gt;</p>

<p>&nbsp;</p>

