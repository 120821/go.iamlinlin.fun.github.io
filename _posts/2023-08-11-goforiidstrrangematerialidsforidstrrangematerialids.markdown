---
layout: post
title: "go for i, idStr := range materialIds与for _, idStr := range materialIds"
date: "2023-08-11"
categories: 
---
<p>假设有这样一段代码：</p>
{% highlight html %}<span style="color:#dcc6e0">for</span> i, idStr := <span style="color:#dcc6e0">range</span> materialIds {
currentSale := sale[i]
<span style="color:#d4d0ab">// 在这里对 idStr 和 currentSale 进行操作</span>
fmt.Println(idStr, currentSale)
}{% endhighlight %}
<p>在这段代码里，循环中的占位符{% highlight html %}_{% endhighlight %}是用来忽略索引的占位符，</p>
<p>如果想在循环中依次获得其他数组的元素。例如sale[0] sale[1],可以使用i替换占位符：</p>
{% highlight html %}<span style="color:#dcc6e0">for</span> i, idStr := <span style="color:#dcc6e0">range</span> materialIds {
<span style="color:#dcc6e0">if</span> i &lt; <span style="color:#f5ab35">len</span>(sale) {
currentSale := sale[i]
<span style="color:#d4d0ab">// 在这里对 currentSale 进行操作</span>
fmt.Println(currentSale)
} <span style="color:#dcc6e0">else</span> {
<span style="color:#d4d0ab">// 处理 sale 数组越界的情况</span>
fmt.Println(<span style="color:#abe338">&quot;sale 数组越界&quot;</span>)
}
}{% endhighlight %}
<p>&nbsp;</p>
