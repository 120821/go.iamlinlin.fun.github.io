---
layout: post
title: "map join split 的使用"
date: "2022-06-09"
categories: 
---

                    <p>checkedData.map((i) =&gt; this.checkMap[i]).join(" / ")</p> 
<pre><code>map() 方法返回一个新数组，数组中的元素为原始数组元素调用函数处理后的值。
map() 方法按照原始数组元素顺序依次处理元素。
map() 不会对空数组进行检测。
map() 不会改变原始数组。

join用于把数组中的所有元素放入一个字符串</code></pre> 
<pre><code>&lt;script type="text/javascript"&gt;
	var arr = new Array(3)
	arr[0] = "George"
	arr[1] = "John"
	arr[2] = "Thomas"
	document.write(arr.join())	// George,John,Thomas
	document.write(arr.join("."))	// George.John.Thomas
&lt;/script&gt;
</code></pre> 
<p><strong>split() 方法用于把一个字符串分割成字符串数组。</strong></p> 
<blockquote> 
 <p>提示： 如果把空字符串 ("") 用作 separator，那么 stringObject 中的每个字符之间都会被分割。</p> 
 <p>注意： split() 方法不改变原始字符串。</p> 
 <p>分割每个字符，包括空格:</p> 
</blockquote> 
<pre><code>var str="How are you doing today?";
var n=str.split("");
n 输出数组值得结果:
H,o,w, ,a,r,e, ,y,o,u, ,d,o,i,n,g, ,t,o,d,a,y,?</code></pre> 
<p>实例<br> 使用 limit 参数:</p> 
<pre><code>var str="How are you doing today?";
var n=str.split(" ",3);
n 将输出3个数组的值:
How,are,you</code></pre> 
<p>实例<br> 使用一个字符作为分隔符:</p> 
<pre><code>var str="How are you doing today?";
var n=str.split("o");
n 输出数组值得结果:
H,w are y,u d,ing t,day?</code></pre> 
<pre><code>String targetUrl = "jdbc:oracle:thin:@6.1.144.99:1521:DMSF3201";
String dsName = targetUrl.split("@")[1].split(":")[2];
dsName :---&gt;DMSF3201
​</code></pre> 
<p><br><br>  </p>
                
