---
layout: post
title: "js array triple dot"
date: "2022-06-09"
categories: 
---

                    <p>spread语法是JavaScript ES6中运算符集的新添加。它接受一个iterable（例如数组）并将其扩展为单个元素。<br> spread语法通常用于制作JS对象的浅拷贝。使用此运算符可以使代码简洁，并增强其可读性。<br> 语法<br> 扩展语法由三个点表示…。</p> 
{% highlight %}let array = [...value]{% endhighlight %} 
<p>由于阵列数据结构被广泛使用，因此在接下来的所有示例中都将考虑它。</p> 
<p><strong>1.复制数组</strong><br> array2将array1的元素复制到其中。对array1所做的任何更改都不会反映在array2中，反之亦然。<br> 如果使用了简单赋值运算符，那么array2将被指定一个对array1的引用，并且在一个数组中所做的更改将反映在另一个数组中，这在大多数情况下是不可取的</p> 
{% highlight %}let array1 = ['h', 'e', 'l', 'l', 'o'];
let array2 = [...array1];
console.log(array2);['h', 'e', 'l', 'l', 'o'] // output{% endhighlight %} 
<p>2<strong>.将一个数组的元素插入另一个数组</strong><br> 可以看出，扩展语法可用于在第二个数组的任何元素之后附加一个数组。换言之，甜点只能附加在数组1末尾的开头，这是没有限制的。</p> 
{% highlight %}let desserts = ['cake', 'cookie', 'donut'];
let desserts1 = ['icecream', 'flan', 'frozen yoghurt', ...desserts];
console.log(desserts);//Appending baked_desserts after flan
let desserts2 = ['icecream', 'flan', ...desserts, 'frozen yoghurt'];
console.log(desserts2);// output
[ 'cake', 'cookie', 'donut' ]
[ 'icecream', 'flan', 'cake', 'cookie', 'donut', 'frozen yoghurt' ]{% endhighlight %} 
<p><strong>3.数组到参数</strong></p> 
<p><img alt="" height="105" src="https://img-blog.csdnimg.cn/da1fea3967fa4c038d4057a24a90a408.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_13,color_FFFFFF,t_70,g_se,x_16" width="473"></p> 
<p></p>
                
