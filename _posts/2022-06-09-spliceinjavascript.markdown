---
layout: post
title: ".splice in javascript"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>splice（）方法是JavaScript数组对象的内置方法。它允许您通过删除现有元素或用新元素替换现有元素来更改数组的内容。<br> 此方法修改原始数组，并将删除的元素作为新数组返回。<br><strong>使用splice（）方法删除、添加或替换阵列元素</strong>。<img alt="" height="680" src="https://img-blog.csdnimg.cn/9800e601e9d54de2b9f61b4f677214f2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
</blockquote> 
<blockquote> 
 <p>先从<strong>移除数组中的元素</strong>开始。</p> 
 <p>如何使用splice（）删除和添加数组元素<br> 该方法还允许在删除操作之后立即添加新元素。只需在删除计数后将要添加到数组中的元素传递给数组。<br> splice（）方法的完整语法如下：</p> 
 {% highlight %}Array.splice(start, removeCount, newItem, newItem, newItem, ...){% endhighlight %} 
 <p>下面的示例显示了如何删除“星期一”和“星期二”，同时将“三月”和“四月”添加到月数组中</p> 
 {% highlight %}let months = ["January", "February", "Monday", "Tuesday"];
let days = months.splice(2, 2, "March", "April");

console.log(days); // ["Monday", "Tuesday"]
console.log(months); // ["January", "February", "March", "April"]
{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>如何在不删除任何元素的情况下<strong>添加新数组元素</strong></p> 
 <p>通过将数字0传递给removeCount参数，可以添加新元素而不删除任何元素。当没有删除任何元素时，拼接方法将返回一个空数组。可以选择是否将返回的空数组存储到变量。<br> 下面的示例演示如何在“二月”旁边添加新元素“三月”，而不删除任何元素。因为splice（）方法返回一个空数组，所以不需要存储返回的数组</p> 
 {% highlight %}let months = ["January", "February", "Monday", "Tuesday"];
months.splice(2, 0, "March");

console.log(months); 
// ["January", "February", "March", "Monday", "Tuesday"]{% endhighlight %} 
</blockquote>
                
