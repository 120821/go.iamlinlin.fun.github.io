---
layout: post
title: "docker postgres bash insert data"
date: "2023-10-24"
categories: 
---
<p>使用了docker postgres， 想要在命令行执行脚本直接创建数据，可以这样：</p>

<pre>
<code>docker <span style="color:#f5ab35">exec</span> id psql -U postgres(user_name) -d database_name -c <span style="color:#abe338">&quot;INSERT INTO table_name (column) VALUES (&#39;name&#39;)&quot;</span>{% endhighlight %}

<p>如果是多列都增加可以使用例如：</p>

<pre>
<code>docker <span style="color:#f5ab35">exec</span> abc psql -U postgres -d asdf -c <span style="color:#abe338">&quot;INSERT INTO calculation_templates (algorithm_name, initial_discharge_rate, initial_filling_amount, operating_discharge_rate, maintenance_discharge_rate, maintenance_filling_rate, annual_maintenance_rate, scrap_discharge_rate, factor_tui_yi, factor_by_year, factor_production) VALUES (&#39;算法名称&#39;, 0.01, 10, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09)&quot;</span>{% endhighlight %}

