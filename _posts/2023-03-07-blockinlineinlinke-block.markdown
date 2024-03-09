---
layout: post
title: "block，inline和inlinke-block细节对比"
date: "2023-03-07"
categories: 
---
<p><a href="https://www.cnblogs.com/keithwang/p/3139517.html">https://www.cnblogs.com/keithwang/p/3139517.html</a></p>

<ul>
	<li>display:block</li>
</ul>

<ol>
	<li style="list-style-type:none">
	<ol>
		<li>block元素会独占一行，多个block元素会各自新起一行。默认情况下，block元素宽度自动填满其父元素宽度。</li>
		<li>block元素可以设置width,height属性。块级元素即使设置了宽度,仍然是独占一行。</li>
		<li>block元素可以设置margin和padding属性。</li>
	</ol>
	</li>
</ol>

<ul>
	<li>display:inline</li>
</ul>

<ol>
	<li style="list-style-type:none">
	<ol>
		<li>inline元素不会独占一行，多个相邻的行内元素会排列在同一行里，直到一行排列不下，才会新换一行，其宽度随元素的内容而变化。</li>
		<li>inline元素设置width,height属性无效。</li>
		<li>inline元素的margin和padding属性，水平方向的padding-left, padding-right, margin-left, margin-right都产生边距效果；但竖直方向的padding-top, padding-bottom, margin-top, margin-bottom不会产生边距效果。</li>
	</ol>
	</li>
</ol>

<ul>
	<li>display:inline-block</li>
</ul>

<ol>
	<li style="list-style-type:none">
	<ol>
		<li>简单来说就是将对象呈现为inline对象，但是对象的内容作为block对象呈现。之后的内联对象会被排列在同一行内。比如我们可以给一个link（a元素）inline-block属性值，使其既具有block的宽度高度特性又具有inline的同行特性。</li>
	</ol>
	</li>
</ol>

