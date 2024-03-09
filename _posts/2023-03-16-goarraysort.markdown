---
layout: post
title: "go array sort"
date: "2023-03-16"
categories: 
---
<p><a href="https://blog.boot.dev/golang/insertion-sort-golang/">https://blog.boot.dev/golang/insertion-sort-golang/</a></p>

<p>声明自定义函数</p>

<pre>
<code>func insertionSort(arr []int) []int {
	for i := 0; i &lt; len(arr); i++ {
		for j := i; j &gt; 0 &amp;&amp; arr[j-1] &gt; arr[j]; j-- {
			arr[j], arr[j-1] = arr[j-1], arr[j]
		}
	}
	return arr
}
{% endhighlight %}

<p>在main函数调用</p>

<div class="highlight">
<pre>
<code>func main() {
    fmt.Println(insertionSort([]int{5,3,2,1,0,4))
    // prints
    // [0, 1, 2, 3, 4, 5]
}
{% endhighlight %}
</div>

<p>&nbsp;</p>

