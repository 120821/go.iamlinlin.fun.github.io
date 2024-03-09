---
layout: post
title: "ES6 - var 作用域 const let"
date: "2022-11-18"
categories: 
---
<p>参考：&nbsp;<a href="https://es6.ruanyifeng.com/">https://es6.ruanyifeng.com/</a>&nbsp;&nbsp;<a href="https://www.cnblogs.com/qd-lbxx/p/15816550.html">https://www.cnblogs.com/qd-lbxx/p/15816550.html</a>&nbsp;&nbsp;<a href="https://www.cnblogs.com/qd-lbxx/p/15816550.html">https://www.cnblogs.com/qd-lbxx/p/15816550.html</a></p>

<p>ES2015(ES6) 新增加了两个重要的 JavaScript 关键字:&nbsp;let&nbsp;和&nbsp;const。</p>

<p>let 是在代码块内有效，var 是在全局范围内有效:</p>

<p>const 声明一个只读的常量，一旦声明，常量的值就不能改变。</p>

<p>let 只能声明一次 var 可以声明多次:</p>

<p>let:</p>

<pre>
<code>{
&nbsp; let a = 0;
&nbsp; a // 0 
} 
a // 报错 ReferenceError: a is not defined{% endhighlight %}

<pre>
<code>const：
{ 
&nbsp; let a = 0;
&nbsp; var b = 1;
} 
a // ReferenceError: a is not defined
b // 1</code>
</pre>

<p>for 循环计数器很适合用 let</p>

<pre>
<code>for (var i = 0; i &lt; 10; i++) {

&nbsp; setTimeout(function(){
&nbsp; &nbsp; console.log(i); }
&nbsp; )
}
// 输出十个 10
for (let j = 0; j &lt; 10; j++) {
&nbsp; setTimeout(function(){ 
&nbsp; &nbsp; console.log(j); }
&nbsp; )=
} // 输出 0123456789{% endhighlight %}

<p>变量 i 是用 var 声明的，在全局范围内有效，所以全局中只有一个变量 i, 每次循环时，setTimeout 定时器里面的 i 指的是全局变量 i ，而循环里的十个 setTimeout 是在循环结束后才执行，所以此时的 i 都是 10。</p>

<p>变量 j 是用 let 声明的，当前的 j 只在本轮循环中有效，每次循环的 j 其实都是一个新的变量，所以 setTimeout 定时器里面的 j 其实是不同的变量，即最后输出 12345。（若每次循环的变量 j 都是重新声明的，如何知道前一个循环的值？这是因为 JavaScript 引擎内部会记住前一个循环的值）。</p>

<p>let 不存在变量提升，var 会变量提升:</p>

<p>console.log(a); //ReferenceError: a is not defined let a = &quot;apple&quot;; console.log(b); //undefined var b = &quot;banana&quot;;</p>

<p>变量 b 用 var 声明存在变量提升，所以当脚本开始运行的时候，b 已经存在了，但是还没有赋值，所以会输出 undefined。</p>

<p>变量 a 用 let 声明不存在变量提升，在声明变量 a 之前，a 不存在，所以会报错。</p>

<hr />
<p>const 命令</p>

<p>const 声明一个只读变量，声明之后不允许改变。意味着，一旦声明必须初始化，否则会报错。</p>

<p>基本用法:</p>

{% highlight %}const&nbsp;PI&nbsp;=&nbsp;&quot;3.1415926&quot;;<br />
PI &nbsp;// 3.1415926<br />
<br />
const&nbsp;MY_AGE;&nbsp;&nbsp;// SyntaxError: Missing initializer in const declaration{% endhighlight %}

<p>暂时性死区:</p>

{% highlight %}var&nbsp;PI&nbsp;=&nbsp;&quot;a&quot;;<br />
if(true){<br />
&nbsp; console.log(PI);&nbsp;&nbsp;// Cannot access &#39;PI&#39; before initialization<br />
&nbsp;&nbsp;const&nbsp;PI&nbsp;=&nbsp;&quot;3.1415926&quot;;<br />
}{% endhighlight %}

<p>ES6 明确规定，代码块内如果存在 let 或者 const，代码块会对这些命令声明的变量从块的开始就形成一个封闭作用域。代码块内，在声明变量 PI 之前使用它会报错。</p>

