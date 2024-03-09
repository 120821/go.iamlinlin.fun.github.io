---
layout: post
title: "sql  group by 1 order by 1 desc"
date: "2023-02-15"
categories: 
---
<p><a href="https://stackoverflow.com/questions/7392730/what-does-sql-clause-group-by-1-mean">https://stackoverflow.com/questions/7392730/what-does-sql-clause-group-by-1-mean</a></p>

<p>这意味着按结果集的第一列分组，而不管它叫什么。&nbsp; 您可以使用 ORDER BY 执行相同的操作。</p>

<div class="js-post-body s-prose">
<p>It means to group by the first column of your result set regardless of what it&#39;s called. You can do the same with <code>ORDER BY</code>.</p>

<pre>
<code>SELECT account_id, open_emp_id
         ^^^^        ^^^^
          1           2

FROM account
GROUP BY 1;{% endhighlight %}
</div>

