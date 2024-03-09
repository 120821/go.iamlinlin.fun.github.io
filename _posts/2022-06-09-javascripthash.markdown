---
layout: post
title: "javascript hash的使用"
date: "2022-06-09"
categories: 
---

                    <p>在javascript中，hash指的是哈希表，是一种根据关键字直接访问内存存储位置的数据结构；通过哈希表，数据元素的存放位置和数据元素的关键字之间建立起某种对应关系，建立这种对应关系的函数称为哈希函数。</p> 
<p>hash就是一个赋值的方法，含义很多，搜索到的知识和方法也非常复杂，但实际用的并不需要太复杂，能用的就一点点，写法也非常简单，hash有多种写法</p> 
<pre><code>my hash = {}←Object { }
my hash = { "a" : 1}← &gt;Object { a: 1 }
my hash.a← 1
&gt; 
my_hash['a']←1
my_hash = { b: 2}← 
&gt;Object { b: 2}
my hash = { a:l, b: 2}
←&gt;Object { a: 1. b:2}
&gt; 
my_hash.a← 1
&gt; 
my_hash['a' ]← 1</code></pre> 
<p><img alt="" src="https://img-blog.csdnimg.cn/8198fb9fa8fe4110ba3c875156396d12.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>这种方法类似ruby的使用。是最简单的方法<img alt="" src="https://img-blog.csdnimg.cn/2a9289a5891e4a91a43391a1c605c77c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>那么，创建一个hash，它的key是a，对应的value是1</p> 
<p>hash = { "a" : "1" }</p> 
<p>第2个任务再创建一个hash，它的key分别是one和two对应的value分别是100和200</p> 
<p>hash = { one : 100, two : 200}</p>
                
