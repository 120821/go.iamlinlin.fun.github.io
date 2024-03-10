---
layout: post
title: "playwright - js循环的几种方式总结"
date: "2022-12-16"
categories: 
---
<p>refer : <a href="https://blog.csdn.net/weixin_43285861/article/details/121437740">https://blog.csdn.net/weixin_43285861/article/details/121437740</a></p>
<p>在使用playwright进行数据的抓取的时候，需要进行多页的抓取，那么使用循环就可以了，在js是这样使用循环语句的：</p>
<p>1.for循环</p>
{% highlight html %}for(var i = 0;i&lt;5;i++){
console.log(i)
}
{% endhighlight %}
<p>2.for in 循环</p>
<p>for in同样可以用来循环数组,但是不推荐这么做。有缺陷。</p>
<p>for in循环是用来<a class="hl hl-1" href="https://so.csdn.net/so/search?q=%E9%81%8D%E5%8E%86&amp;spm=1001.2101.3001.7020" target="_blank">遍历</a>对象的。要知道JavaScript对象的所有属性都是字符串，不过属性对应的值可以是任意数据类型。（注意：遍历时不仅能读取对象自身上面的成员属性，也能遍历出对象的原型属性）</p>
{% highlight html %}let obj = {a:1, b:2, c:3};
for (let prop in obj) {    //prop指对象的属性名
console.log(prop, obj[prop]);
}
// 输出:
// a,1
// b,2
// c,3{% endhighlight %}
<p>3.for each循环（forEach循环里面没办法用break跳出循环。而且在IE中无法实现，需要做兼容处理）</p>
{% highlight html %}let arr = [&#39;123&#39;,&#39;qwewq&#39;,&#39;sfds&#39;];
myArray.forEach(function (value, index) {
console.log(value,index);
});
//输出
//&quot;123&quot;,1
//&quot;qwewq&quot;,2
//&quot;sfds&quot;,3{% endhighlight %}
<p>4.for of 循环</p>
<p>作为ES6新增的循环方法，个人觉得相当好用，而且方便。这个方法避开了for-in循环的所有缺陷。而且，它可以正确响应break、continue和return语句。</p>
{% highlight html %}//循环数组
let arr = [&#39;123&#39;,&#39;qwewq&#39;,&#39;sfds&#39;];
for(let item of arr){
console.log(item);    //item指的的就是数组每一项的值。不是索引。
}
//输出
//&#39;123&#39;
//&#39;qwewq&#39;
//&#39;sfds&#39;{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
