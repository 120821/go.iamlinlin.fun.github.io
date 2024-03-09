---
layout: post
title: "postgres docker bash 清空表数据后，批量创建数据"
date: "2023-10-24"
categories: 
---
<p>创建sh脚本， xx.sh</p>

<pre>
<code>chmod +x xx.sh</code></pre>

<pre>
<code><span style="color:#f5ab35">#!/bin/bash
</span>脚本内容可以是：

<span style="color:#d4d0ab"># 数据库连接参数</span>
db_username=<span style="color:#abe338">&quot;postgres&quot;</span>
db_name=<span style="color:#abe338">&quot;asdf&quot;</span>
container_name=<span style="color:#abe338">&quot;abc&quot;</span>

<span style="color:#d4d0ab"># 清空表中的数据</span>
clear_table_query=<span style="color:#abe338">&quot;DELETE FROM calculation_templates&quot;</span>
docker <span style="color:#f5ab35">exec</span> <span style="color:#ffa07a">$container_name</span> psql -U <span style="color:#ffa07a">$db_username</span> -d <span style="color:#ffa07a">$db_name</span> -c <span style="color:#abe338">&quot;</span><span style="color:#ffa07a">$clear_table_query</span><span style="color:#abe338">&quot;</span>

<span style="color:#d4d0ab"># 算法名称数组</span>
algorithm_names=(<span style="color:#abe338">&quot;算法1&quot;</span> <span style="color:#abe338">&quot;算法2&quot;</span> <span style="color:#abe338">&quot;算法3&quot;</span> <span style="color:#abe338">&quot;算法4&quot;</span> <span style="color:#abe338">&quot;算法5&quot;</span> <span style="color:#abe338">&quot;算法6&quot;</span> <span style="color:#abe338">&quot;算法7&quot;</span> <span style="color:#abe338">&quot;算法8&quot;</span> <span style="color:#abe338">&quot;算法9&quot;</span> <span style="color:#abe338">&quot;算法10&quot;</span>)

<span style="color:#d4d0ab"># 生成算法数据</span>
<span style="color:#dcc6e0">for</span> ((i=0; i&lt;<span style="color:#ffa07a">${#algorithm_names[@]}</span>; i++)); <span style="color:#dcc6e0">do</span>
    algorithm_name=<span style="color:#abe338">&quot;</span><span style="color:#ffa07a">${algorithm_names[i]}</span><span style="color:#abe338">&quot;</span>
    initial_discharge_rate=0.01
    initial_filling_amount=10
    operating_discharge_rate=0.02
    maintenance_discharge_rate=0.03
    maintenance_filling_rate=0.04
    annual_maintenance_rate=0.05
    scrap_discharge_rate=0.06
    factor_tui_yi=0.07
    factor_by_year=0.08
    factor_production=0.09

    insert_query=<span style="color:#abe338">&quot;INSERT INTO calculation_templates (algorithm_name, initial_discharge_rate, initial_filling_amount, operating_discharge_rate, maintenance_discharge_rate, maintenance_filling_rate, annual_maintenance_rate, scrap_discharge_rate, factor_tui_yi, factor_by_year, factor_production) VALUES (&#39;</span><span style="color:#ffa07a">$algorithm_name</span><span style="color:#abe338">&#39;, </span><span style="color:#ffa07a">$initial_discharge_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$initial_filling_amount</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$operating_discharge_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$maintenance_discharge_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$maintenance_filling_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$annual_maintenance_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$scrap_discharge_rate</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$factor_tui_yi</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$factor_by_year</span><span style="color:#abe338">, </span><span style="color:#ffa07a">$factor_production</span><span style="color:#abe338">)&quot;</span>
    psql_cmd=<span style="color:#abe338">&quot;docker exec </span><span style="color:#ffa07a">$container_name</span><span style="color:#abe338"> psql -U </span><span style="color:#ffa07a">$db_username</span><span style="color:#abe338"> -d </span><span style="color:#ffa07a">$db_name</span><span style="color:#abe338"> -c&quot;</span>

    <span style="color:#ffa07a">$psql_cmd</span> <span style="color:#abe338">&quot;</span><span style="color:#ffa07a">$insert_query</span><span style="color:#abe338">&quot;</span>
<span style="color:#dcc6e0">done</span>

<span style="color:#f5ab35">echo</span> <span style="color:#abe338">&quot;数据插入完成&quot;</span></code></pre>

<p>执行</p>

<pre>
<code>./xx.sh</code></pre>

