---
layout: post
title: "math.floor javascript"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><code><strong>Math.floor()</strong></code> 返回小于或等于一个给定数字的最大整数。语法</p> 
 {% highlight %}Math.floor(<em>x</em>) {% endhighlight %} 
 <p><code>参数x</code>    一个数字。</p> 
 <p>返回值 一个表示小于或等于指定数字的最大整数的数字。</p> 
 <p>由于 <code>floor</code> 是 <code>Math</code> 的一个静态方法，你总是应该像这样使用它 <code>Math.floor()</code>，而不是作为你创建的一个Math对象的一种方法（Math不是一个构造函数）。</p> 
 <p>例如：Math.floor(1.6)返回1；<br> Math.floor(5.1) = 5<br> Math.floor(-5.1) = -6<img alt="" height="479" src="https://img-blog.csdnimg.cn/8c7d545ccc024e86bd468ef710dc7cd0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
 <p> 使用</p> 
 <pre><code class="language-javascript">Math.floor( 45.95);
// 45
Math.floor( 45.05);
// 45
Math.floor( 4 );
// 4
Math.floor(-45.05);
// -46
Math.floor(-45.95);
// -46

{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>Math是javascript的对象，Math 对象方法有：</p> 
 <p>1、Math.abs(x) ：返回数的绝对值；</p> 
 <p>2、Math.acos(x) ：返回数的反余弦值；</p> 
 <p>3、Math.asin(x) ：返回数的反正弦值； </p> 
 <p>4、Math.ceil(x) ：对数进行上舍入；</p> 
 <p>5、Math.max(x,y) ：返回 x 和 y 中的最高值；   </p> 
 <p>6、Math.min(x,y) ：返回 x 和 y 中的最低值</p> 
</blockquote>
                
