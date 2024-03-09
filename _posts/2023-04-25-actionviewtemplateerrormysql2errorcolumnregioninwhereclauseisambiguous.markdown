---
layout: post
title: "ActionView::Template::Error (Mysql2::Error: Column 'region' in where clause is ambiguous)"
date: "2023-04-25"
categories: 
---
<p>这个错误提示的意思是查询条件中的 &#39;region&#39; 列有二义性，即不清楚是哪个表的列。可能是因为在 SQL 查询语句中使用到了多个表，并且这些表中都包含了 &#39;region&#39; 这个列。</p>

<p>为了解决这个问题，需要在查询条件中指定表名或者使用别名。例如，如果查询中涉及了 users 表和 region 表，并且这两个表中都有 &#39;region&#39; 列，那么可以这样修改查询语句：</p>

{% highlight %}
{% highlight %}SELECT users.* FROM users INNER JOIN region ON users.region_id=region.id WHERE region.region=&#39;xxx&#39;;{% endhighlight %}

<p>上述查询语句使用了 INNER JOIN 来链接 users 表和 region 表，同时将 users 表中的 region_id 列和 region 表中的 id 列进行关联。然后在查询条件 WHERE 中使用表名或者别名来指定 &#39;region&#39; 列属于哪个表，例如这里指定为 region.region。</p>

<p>根据具体情况进行修改即可。</p>

{% highlight %}
{% highlight %}@enterprise_personnels = @enterprise_personnels.joins(:region).where(&#39;regions.region = ?&#39;, params[:region]) if params[:region].present?{% endhighlight %}

