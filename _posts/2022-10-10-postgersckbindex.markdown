---
layout: post
title: "postgers ckb 简单查询 index "
date: "2022-10-10"
categories: 
---
<p>&nbsp;</p>
{% highlight html %}select count(*) from cell_outputs;
select id,tx_hash,cell_index,capacity from cell_outputs where id = 59153523 limit 1;
select id,tx_hash,cell_index,capacity from cell_outputs where tx_hash = decode(&#39;8df812321b057cd3348927c5296dabb859e1ff9b00fcd0e92b57d6bf22c626dc&#39;, &#39;hex&#39;)&nbsp; limit 1;
select id,tx_hash,cell_index,capacity from cell_outputs where tx_hash = decode(&#39;8df812321b057cd3348927c5296dabb859e1ff9b00fcd0e92b57d6bf22c626dc&#39;, &#39;hex&#39;) and cell_index = 2 limit 1;
explain analyze verbose select id,tx_hash,cell_index,capacity from cell_outputs where tx_hash = decode(&#39;8df812321b057cd3348927c5296dabb859e1ff9b00fcd0e92b57d6bf22c626dc&#39;, &#39;hex&#39;) and cell_index = 2 limit 1;{% endhighlight %}
<p>&nbsp;</p>
