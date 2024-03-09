---
layout: post
title: "Arrays.sort(arr,Comparator＜＞) JavaScript"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>sort方法会循环取出数组的数值进行两两对比，如果前一个数（a）比后一个数（b）大，就把两个数对调，如果相等或a&lt;b，就不变，这样当比较完毕后，数组中的元素就按由小到大的顺序重新排列了。<br> 可以简写为：<br> sort((a,b)=&gt;a-b);<br> 如果按由大到小的顺序排列，则是<br> sort((a,b)=&gt;b-a);<img alt="" height="794" src="https://img-blog.csdnimg.cn/4c50bd9bb41e4caab87a48e0e37d46e0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
</blockquote> 
<blockquote> 
 <p> Arrays.sort(arr,Comparator&lt;&gt;)<br> 对数组中相邻的两个数进行比较<br> 一轮完了接着二轮 是一个冒泡排序</p> 
 <p>(a, b) -&gt; a - b 相当于<br> function(a,b){undefined<br> return a-b;<br> }<br> 相当于Comparator&lt;&gt;</p> 
 <p>源码中写作(a, b) =&gt; a - b</p> 
 <p>Arrays.sort(arr, (a, b) -&gt; a - b)<br> 是对数组进行冒泡排序<br> 如果 a - b&gt;0 则b 在前 a 在后、直到有序</p> 
</blockquote>
                
