---
layout: post
title: "explain sql"
date: "2022-09-20"
categories: 
---
<p><a href="https://www.yisu.com/zixun/689967.html">https://www.yisu.com/zixun/689967.html</a></p>

<p>用于：查看一个这些SQL语句的执行计划</p>

<pre class="brush:sql;toolbar:false hljs">
<span class="hljs-comment">--&nbsp;实际SQL，查找用户名为Jefabc的员工</span>
<span class="hljs-keyword">select</span>&nbsp;*&nbsp;<span class="hljs-keyword">from</span>&nbsp;emp&nbsp;<span class="hljs-keyword">where</span>&nbsp;<span class="hljs-keyword">name</span>&nbsp;=&nbsp;<span class="hljs-string">&#39;Jefabc&#39;</span>;
<img height="677" src="/uploads/ckeditor/pictures/413/image-20220920141716-2.png" width="900" />
<span class="hljs-comment">--&nbsp;查看SQL是否使用索引，前面加上explain即可</span>
<span class="hljs-keyword">explain</span>&nbsp;<span class="hljs-keyword">select</span>&nbsp;*&nbsp;<span class="hljs-keyword">from</span>&nbsp;emp&nbsp;<span class="hljs-keyword">where</span>&nbsp;<span class="hljs-keyword">name</span>&nbsp;=&nbsp;<span class="hljs-string">&#39;Jefabc&#39;</span></pre>

<p><img height="190" src="/uploads/ckeditor/pictures/414/image-20220920141908-1.png" width="769" /></p>

<p>expain出来的信息有10列，分别是id、select_type、table、type、possible_keys、key、key_len、ref、rows、Extra</p>

<p>概要描述：</p>

<p>id:选择标识符</p>

<p>select_type:表示查询的类型。</p>

<p>table:输出结果集的表</p>

<p>partitions:匹配的分区</p>

<p>type:表示表的连接类型</p>

<p>possible_keys:表示查询时，可能使用的索引</p>

<p>key:表示实际使用的索引</p>

<p>key_len:索引字段的长度</p>

<p>ref:列与索引的比较</p>

<p>rows:扫描出的行数(估算的行数)</p>

<p>filtered:按表条件过滤的行百分比</p>

<p>Extra:执行情况的描述和说明</p>

<p>一、 id</p>

<p>SELECT识别符。这是SELECT的查询序列号</p>

<p>我的理解是SQL执行的顺序的标识，SQL从大到小的执行</p>

<p>1. id相同时，执行顺序由上至下</p>

<p>2. 如果是子查询，id的序号会递增，id值越大优先级越高，越先被执行</p>

<p>3. id如果相同，可以认为是一组，从上往下顺序执行；在所有组中，id值越大，优先级越高，越先执行</p>

<pre class="brush:sql;toolbar:false hljs">
<span class="hljs-comment">--&nbsp;查看在研发部并且名字以Jef开头的员工，经典查询</span>
<span class="hljs-keyword">explain</span>&nbsp;<span class="hljs-keyword">select</span>&nbsp;e.no,&nbsp;e.name&nbsp;<span class="hljs-keyword">from</span>&nbsp;emp&nbsp;e&nbsp;<span class="hljs-keyword">left</span>&nbsp;<span class="hljs-keyword">join</span>&nbsp;dept&nbsp;d&nbsp;<span class="hljs-keyword">on</span>&nbsp;e.dept_no&nbsp;=&nbsp;d.no&nbsp;<span class="hljs-keyword">where</span>&nbsp;e.name&nbsp;<span class="hljs-keyword">like</span>&nbsp;<span class="hljs-string">&#39;Jef%&#39;</span>&nbsp;<span class="hljs-keyword">and</span>&nbsp;d.name&nbsp;=&nbsp;<span class="hljs-string">&#39;研发部&#39;</span>;</pre>

