---
layout: post
title: "react table td/th css"
date: "2023-08-24"
categories: 
---
<p>react有个table,但是数据显示的时候，Css需要调整，数据显示的时候特别挤，</p>

<p>我意识到问题是：td/th的宽度需要调整好</p>

<p>但是使用width调整后，看起看并没有生效，</p>

<p>解决：使用 padding</p>

<p>示例：</p>

<pre>
<code><span style="color:#ffa07a">.simple_table</span> {
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100%</span>; <span style="color:#d4d0ab">/* 设置表格宽度为100% */</span>
  <span style="color:#ffd700">border-collapse</span>: collapse; <span style="color:#d4d0ab">/* 合并边框 */</span>
}

<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">th</span>,
<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">td</span> {
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">8px</span>; <span style="color:#d4d0ab">/* 设置单元格内边距 */</span>
  <span style="color:#ffd700">text-align</span>: center; <span style="color:#d4d0ab">/* 居中对齐 */</span>
}

<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">th</span> {
  <span style="color:#ffd700">background-color</span>: <span style="color:#f5ab35">#f2f2f2</span>; <span style="color:#d4d0ab">/* 设置表头背景颜色 */</span>
}

<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">td</span> {
  <span style="color:#ffd700">border</span>: <span style="color:#f5ab35">1px</span> solid <span style="color:#f5ab35">#ddd</span>; <span style="color:#d4d0ab">/* 设置单元格边框 */</span>
}{% endhighlight %}

<p>(另外，不太建议，因为数据可能十位以上）如果想要固定每个th、td的宽度也可以尝试这样：</p>

<pre>
<code><span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">th</span>,
<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">td</span> {
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100px</span>; <span style="color:#d4d0ab">/* 设置宽度为100px */</span>
}

<span style="color:#d4d0ab">/* 或 */</span>

<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">th</span>,
<span style="color:#ffa07a">.simple_table</span> <span style="color:#dcc6e0">td</span> {
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">25%</span>; <span style="color:#d4d0ab">/* 设置宽度为相对于父元素的25% */</span>
}{% endhighlight %}

