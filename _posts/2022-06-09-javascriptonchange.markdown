---
layout: post
title: "javascript的 onchange"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>onchange 事件会在域的内容改变时发生，可用于单选框与复选框改变后触发的事件，必需。规定该事件发生时执行的 JavaScript。</p> 
 <p>onchange 属性可以使用于： &lt;input&gt;, &lt;select&gt;, 和 &lt;textarea&gt;。</p> 
 <pre><code class="language-html">HTML 中:

&lt;element onchange="SomeJavaScriptCode"&gt;

JavaScript 中:

object.onchange=function(){SomeJavaScriptCode};{% endhighlight %} 
</blockquote> 
<pre><code class="language-html">&lt;script&gt;
function myFunction(){
	var x=document.getElementById("fname");
	x.value=x.value.toUpperCase();
}
&lt;/script&gt;

&lt;body&gt;
输入你的名字: &lt;input type="text" id="fname" onchange="myFunction()"&gt;
&lt;p&gt;当你离开输入框后，将小写字母转为大写字母。&lt;/p&gt;
&lt;/body&gt;{% endhighlight %} 
<p> <img alt="" height="93" src="https://img-blog.csdnimg.cn/ff51f1ca59b34f7385de6d07828d7d21.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_13,color_FFFFFF,t_70,g_se,x_16" width="476"></p> 
<p>函数不同，产生效果不同，</p> 
<pre><code class="language-html">&lt;html&gt;

&lt;head&gt;
&lt;script type="text/javascript"&gt;
function upperCase(x)
{
var y=document.getElementById(x).value
document.getElementById(x).value=y.toUpperCase()
}
&lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;

Enter your name: &lt;input type="text" id="fname" onchange="upperCase(this.id)"&gt;

&lt;/body&gt;
&lt;/html&gt;{% endhighlight %} 
<p><img alt="" height="62" src="https://img-blog.csdnimg.cn/27a1190ee025481aad5a0169eeb89754.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_12,color_FFFFFF,t_70,g_se,x_16" width="445"> \</p> 
<p>也可以用于下拉框，选择或者弹窗的形式</p> 
<pre><code class="language-html">Select下拉框onchange事件获取option的value值
&lt;select name="type" onchange="show_sub(this.options[this.options.selectedIndex].value)"&gt;    
    &lt;option value="0"&gt;请选择主类别&lt;/option&gt;    
    &lt;option value="1"&gt;1&lt;/option&gt;    
    &lt;option value="2"&gt;2&lt;/option&gt;    
 &lt;/select&gt;  
&lt;script&gt;     
    function show_sub(val){     
        alert(val);     
    }     
&lt;/script&gt;  {% endhighlight %} 
<p><img alt="" height="65" src="https://img-blog.csdnimg.cn/c5deb0d03efc4be7aabc5f91bb9fdd12.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_14,color_FFFFFF,t_70,g_se,x_16" width="506"></p> 
<p> </p>
                
