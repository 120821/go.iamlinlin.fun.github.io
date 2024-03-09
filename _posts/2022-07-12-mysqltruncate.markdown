---
layout: post
title: "MySQL truncate()函数的使用说明"
date: "2022-07-12"
categories: 
---
<p>参考：https://www.cnblogs.com/miracle-luna/p/12041781.html</p>

<p>1、TRUNCATE()函数介绍</p>

<p>TRUNCATE(X,D) 是MySQL自带的一个系统函数。</p>

<p>其中，X是数值，D是保留小数的位数。</p>

<p>其作用就是按照小数位数，进行数值截取（此处的截取是按保留位数直接进行截取，没有四舍五入）。</p>

<p>&nbsp;</p>

<p>2、数值保留规则</p>

<p>规则如下：</p>

<p>1）当 D 大于0，是对数值 X 的小数位数进行操作；</p>

<p>2）当 D 等于0，是将数值 X 的小数部分去除，只保留整数部分；</p>

<p>3）当 D 小于0，是将数值 X 的小数部分去除，并将整数部分按照 D 指定位数，用 0 替换。</p>

<p>&nbsp;</p>

<p>3、函数示例</p>

<p>示例如下：</p>

<p>1）当 X 为正数时：</p>

<div class="cnblogs_code">
<pre>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">3</span>);   # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.456</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">2</span>);   # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.45</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">1</span>);   # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">0</span>);   # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">123</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">1</span>);  # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">120</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">2</span>);  # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">100</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">3</span>);  # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">0</span></pre>
</div>

<p>&nbsp;</p>

<p>2）当 X 为负数时：</p>

<div class="cnblogs_code">
<pre>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">3</span>);   # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.456</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">2</span>);   # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.45</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">1</span>);   # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 0, 0, 1); font-weight: bold">0</span>);   # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">1</span>);  # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">120</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">2</span>);  # <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">100</span>
<span style="color: rgba(0, 0, 255, 1)">SELECT</span> <span style="color: rgba(0, 0, 255, 1)">TRUNCATE</span>(<span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">123.4567</span>, <span style="color: rgba(128, 128, 128, 1)">-</span><span style="color: rgba(128, 0, 0, 1); font-weight: bold">3</span>);  # <span style="color: rgba(128, 0, 0, 1); font-weight: bold">0</span></pre>
</div>

