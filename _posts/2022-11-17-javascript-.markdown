---
layout: post
title: "JavaScript - 三元运算符"
date: "2022-11-17"
categories: 
---
<p><a href="https://blog.csdn.net/squad/article/details/98511086">参考</a></p>

<p>&nbsp;三元运算符又称为三目运算符。 &nbsp; &nbsp; &nbsp;</p>

{% highlight %}
{% highlight %}&nbsp;语法格式 &nbsp; (条件表达式)?表达式1：表达式2；
&nbsp;如果条件为true，运算后的结果是表达式1；
&nbsp;如果条件为false，运算后的结果是表达式2；{% endhighlight %}
例如：
用三目运算找出两数中的最小值
&nbsp;{% highlight %} double x=2.223;
&nbsp; double y=6.4562;
&nbsp; System.out.println(***x&gt;y?y:x***);{% endhighlight %}
返回：
&nbsp;2.223
理解：x&gt;y ？y：x 在这个表达式中条件表达式为x&gt;y；
&nbsp; &nbsp;若条件为ture，运算结果是表达式1
&nbsp; &nbsp;若条件为false，运算结果为表达式2
&nbsp; &nbsp;先假设条件是成立的，x比y大，最小值为y，这个时候表达式1就应该为y，表达式2就应该为x；&nbsp; &nbsp;
&nbsp; &nbsp;若条件不成立，那么x比y小，最小值为x，这个时候表达式1就应该为y，表达式2就应该为x。
在上面的例子， x&lt;y；所以条件不成立，输出x的值

&nbsp;{% endhighlight %}

<p>&nbsp;</p>

