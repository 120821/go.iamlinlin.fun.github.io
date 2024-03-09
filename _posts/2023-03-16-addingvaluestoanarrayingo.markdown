---
layout: post
title: "Adding Values to an Array in Go"
date: "2023-03-16"
categories: 
---
<p><a href="https://tutorialedge.net/golang/snippets/adding-values-array-slice-go/">https://tutorialedge.net/golang/snippets/adding-values-array-slice-go/</a></p>

<p>如何使用 Go 向数组中添加值 append功能。</p>

<p>在这个例子中，我们定义了一个类型的数组 string其中包含科学家名单。 在我们创建此数组的位置下方，我们使用 append函数然后添加 Hawkins到科学家名单</p>

<p>追加函数：appendfunction 是一个内置函数，它将元素附加到切片的末尾。 如果需要调整底层数组的大小以容纳任何新元素，它会负责分配底层数组，然后返回新的切片。</p>

<p><code>package main</code></p>

<pre>
<code>import (

&nbsp;&nbsp;&nbsp; &quot;fmt&quot;

)

func main() {

&nbsp;&nbsp;&nbsp; scientists := []string{

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Einstein&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Turing&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Lovelace&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Curie&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Franklin&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Hodgkin&quot;,

&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; scientists = append(scientists, &quot;Hawkins&quot;)

&nbsp;&nbsp;&nbsp; fmt.Println(scientists)



}</code></pre>

<pre>
<code>$&nbsp;</code>go run add_value_to_array.go</pre>

<p>得到返回结果：</p>

<pre>
<code>[Einstein Turing Lovelace Curie Franklin Hodgkin Hawkins] </code></pre>

