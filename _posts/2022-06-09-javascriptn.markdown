---
layout: post
title: "JavaScript 递归方式调用函数 计算n的阶乘"
date: "2022-06-09"
categories: 
---
<blockquote> 
<p>JavaScript 允许以递归方式调用函数。</p> 
{% highlight html %}<code class="language-javascript">function countChars(elm) {
if (elm.nodeType == 3) { // 文本节点
return elm.nodeValue.length;
}
var count = 0;
for (var i = 0, child; child = elm.childNodes[i]; i++) {
count += countChars(child);
}
return count;
}
{% endhighlight %} 
<p>既然匿名函数没有名字，那该怎么递归调用它呢？在这一点上，JavaScript 允许你命名这个函数表达式。你可以命名立即调用的函数表达式（IIFE——Immediately Invoked Function Expression），如下所示：</p> 
{% highlight html %}<code class="language-javascript">var charsInBody = (function counter(elm) {
if (elm.nodeType == 3) { // 文本节点
return elm.nodeValue.length;
}
var count = 0;
for (var i = 0, child; child = elm.childNodes[i]; i++) {
count += counter(child);
}
return count;
})(document.body);
{% endhighlight %} 
</blockquote> 
{% highlight html %}<code class="language-javascript"> /* 求阶乘 */
function fun(n) {
if (n == 1) return 1
return fun(n - 1) * n
i--;
}
console.log(fun(3));{% endhighlight %} 
<p>if 语句设置停止条件，在下一行的return语句调用自己</p> 
<p></p>
