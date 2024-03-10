---
layout: post
title: "ERROR:  null value in column 'created_at' of relation 'blogs' violates not-null constraint (ActiveRecord::NotNullViolation)"
date: "2022-12-30"
categories:
---
<p>refer: <a href="https://www.grepper.com/tpc/null+value+in+column+%22%22modified_by%22%22+violates+not-null+constraint">https://www.grepper.com/tpc/null+value+in+column+%22%22modified_by%22%22+violates+not-null+constraint</a></p>
<p>解决：</p>
{% highlight html %}ALTER TABLE &lt;your-table&gt; ALTER COLUMN &lt;your-column&gt; DROP NOT NULL;{% endhighlight %}
<p>把表的not null删除</p>
{% highlight html %}ALTER TABLE blogs ALTER COLUMN created_at DROP NOT NULL;{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
