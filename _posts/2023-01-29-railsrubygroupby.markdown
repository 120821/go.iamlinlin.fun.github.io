---
layout: post
title: "rails ruby group by"
date: "2023-01-29"
categories: 
---
<p><a href="https://stackoverflow.com/questions/31879150/group-by-and-count-using-activerecord">https://stackoverflow.com/questions/31879150/group-by-and-count-using-activerecord</a></p>

<pre>
<code>Person.group(:name).count
(1.2ms)  SELECT COUNT(*) AS count_all, name AS name FROM &quot;people&quot; GROUP BY &quot;people&quot;.&quot;name&quot;
=&gt; {&quot;Dan&quot;=&gt;3, &quot;Dave&quot;=&gt;2, &quot;Vic&quot;=&gt;1} </code></pre>

