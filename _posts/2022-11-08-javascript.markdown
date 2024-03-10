---
layout: post
title: "JavaScript 作用域"
date: "2022-11-08"
categories: 
---
<p><a href="https://www.runoob.com/js/js-scope.html">https://www.runoob.com/js/js-scope.html</a></p>
<p>在 JavaScript 中, 对象和函数同样也是变量。</p>
<p><strong>在 JavaScript 中, 作用域为可访问变量，对象，函数的集合。</strong></p>
<p>JavaScript 函数作用域: 作用域在函数内修改</p>
<p>1.局部作用域：</p>
<p>变量在函数内声明，变量为局部变量，具有局部作用域。</p>
<p>局部变量：只能在函数内部访问。</p>
{% highlight html %}&lt;p&gt;局部变量在声明的函数外不可以访问。&lt;/p&gt;
&lt;p id=&quot;demo&quot;&gt;&lt;/p&gt;
&lt;script&gt;
myFunction();
document.getElementById(&quot;demo&quot;).innerHTML = &quot;carName 的类型是：&quot; +&nbsp; typeof carName;
function myFunction()
{
&nbsp;&nbsp;&nbsp; var carName = &quot;Volvo&quot;;
}
&lt;/script&gt;{% endhighlight %}
<p>{% highlight html %}2.全局作用域：{% endhighlight %}变量在函数外定义，即为全局变量。</p>
<p>全局变量有 <strong>全局作用域</strong>: 网页中所有脚本和函数均可使用。</p>
{% highlight html %}&lt;p&gt;全局变量在任何脚本和函数内均可访问。&lt;/p&gt;<br />
&lt;p id=&quot;demo&quot;&gt;&lt;/p&gt;<br />
&lt;script&gt;<br />
var carName = &quot;Volvo&quot;;<br />
myFunction();<br />
function myFunction()<br />
{<br />
&nbsp;&nbsp;&nbsp; document.getElementById(&quot;demo&quot;).innerHTML =<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&quot;我可以显示 &quot; + carName;<br />
}<br />
&lt;/script&gt;{% endhighlight %}
<p>如果变量在函数内没有声明（没有使用 var 关键字），该变量为全局变量。</p>
<p>以下实例中 carName 在函数内，但是为全局变量。</p>
<div class="example">
<pre class="example">{% highlight html %}&lt;p&gt;<br />
如果你的变量没有声明，它将自动成为全局变量：<br />
&lt;/p&gt;<br />
&lt;p id=&quot;demo&quot;&gt;&lt;/p&gt;<br />
&lt;script&gt;<br />
myFunction();<br />
document.getElementById(&quot;demo&quot;).innerHTML =<br />
&nbsp;&nbsp; &nbsp;&quot;我可以显示 &quot; + carName;<br />
function myFunction()<br />
{<br />
&nbsp;&nbsp;&nbsp; carName = &quot;Volvo&quot;;<br />
}<br />
&lt;/script&gt;{% endhighlight %}
</div>
<p>&nbsp;</p>
