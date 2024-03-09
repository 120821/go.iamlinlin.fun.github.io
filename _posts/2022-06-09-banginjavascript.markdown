---
layout: post
title: "“bang” in JavaScript"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>！这个是一个逻辑运算符，用于将值转换为其相反的布尔值。因为JavaScript会强制值，所以它会将值“转换”为true/false形式，并返回相反的布尔值。<br> 当我们使用的时候！对0以外的数字进行运算，返回false。这是因为除0以外的所有数字都是真实的。</p> 
 <p><img alt="" height="295" src="https://img-blog.csdnimg.cn/54091a0d5ded47528864301a6ff85268.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="696"></p> 
 <p> </p> 
 <h2>JavaScript Logical Operators</h2> 
 <table><tbody>
<tr>
<th>Operator</th>
<th>Description</th>
</tr>
<tr>
<td>&amp;&amp;</td>
<td>logical and</td>
</tr>
<tr>
<td>||</td>
<td>logical or</td>
</tr>
<tr>
<td>!</td>
<td>logical not</td>
</tr>
</tbody></table>
 <p style="margin-left:.0001pt;"><img alt="" height="807" src="https://img-blog.csdnimg.cn/fe1a9db28d994e9bbb8a159c94b5a1cb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
 <p style="margin-left:.0001pt;">Root是一个变量。叹号root是对这个变量进行，取反。例如，如果root等于true, 那么叹号，root就是false。另外在js语言当中，false null  undefined这些表示为否或者空的变量，加上叹号都会变成true。所以很多时候大伙就喜欢不写条件判断，而是通过一个叹号加变量的形式来表示该变量的一些条件。</p> 
 <p style="margin-left:.0001pt;">例如。</p> 
 {% highlight %}if(!root){% endhighlight %} 
 <p style="margin-left:.0001pt;">的完整写法是</p> 
 {% highlight %}if(root!=undefined&amp;&amp;root!=null){% endhighlight %} 
 <p style="margin-left:.0001pt;">但是这种语法仅仅在js语言里面有，其他语言里面很少见</p> 
 <p style="margin-left:.0001pt;">所以在其他语言里面判断一个变量非空，就得用比较长的语句，上边的那个条件判断语句</p> 
 <p style="margin-left:.0001pt;"></p> 
</blockquote>
                
