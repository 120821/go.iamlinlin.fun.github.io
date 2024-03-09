---
layout: post
title: "<a> ， <button> 与 <form> 的基本用法和区别"
date: "2022-06-30"
categories: 
---
<p>参考：https://www.runoob.com/tags/tag-form.html</p>

<p>&lt;a&gt; 标签定义超链接，用于从一个页面链接到另一个页面。</p>

<p>&lt;a&gt; 元素最重要的属性是 href 属性，它指定链接的目标。</p>

<p>在所有浏览器中，链接的默认外观如下：</p>

<ul>
	<li>未被访问的链接带有下划线而且是蓝色的</li>
	<li>已被访问的链接带有下划线而且是紫色的</li>
	<li>活动链接带有下划线而且是红色的</li>
</ul>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">a</span><span class="hl-code"> </span><span class="hl-var">href</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">http://www.baidu.com</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code">百度一下!</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">a</span><span class="hl-brackets">&gt;</span></div>
</div>

<p>&lt;button&gt; 标签定义一个按钮。</p>

<p>在 &lt;button&gt; 元素内部，您可以放置内容，比如文本或图像。这是该元素与使用 &lt;input&gt; 元素创建的按钮之间的不同之处。</p>

<p><b>提示：</b>请始终为 &lt;button&gt; 元素规定 type 属性。不同的浏览器对 &lt;button&gt; 元素的 type 属性使用不同的默认值。</p>

<p>&lt;button type=&quot;button&quot;&gt;点我!&lt;/button&gt;</p>

<p>form表单可以进行字段和按钮提交</p>

<p>带有两个<strong>输入字段</strong>和一个<strong>提交按钮的</strong> HTML <strong>表单</strong>：</p>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">form</span><span class="hl-code"> </span><span class="hl-var">action</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">demo_form.php</span><span class="hl-quotes">&quot;</span><span class="hl-code"> </span><span class="hl-var">method</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">get</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> First name: </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">input</span><span class="hl-code"> </span><span class="hl-var">type</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">text</span><span class="hl-quotes">&quot;</span><span class="hl-code"> </span><span class="hl-var">name</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">fname</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;</span><span class="hl-reserved">br</span><span class="hl-brackets">&gt;</span><span class="hl-code"> Last name: </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">input</span><span class="hl-code"> </span><span class="hl-var">type</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">text</span><span class="hl-quotes">&quot;</span><span class="hl-code"> </span><span class="hl-var">name</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">lname</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;</span><span class="hl-reserved">br</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">input</span><span class="hl-code"> </span><span class="hl-var">type</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">submit</span><span class="hl-quotes">&quot;</span><span class="hl-code"> </span><span class="hl-var">value</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">提交</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">form</span><span class="hl-brackets">&gt;</span></div>
</div>

