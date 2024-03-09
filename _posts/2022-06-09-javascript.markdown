---
layout: post
title: "JavaScript 的一些基本概念"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong>1&lt;&lt;i </strong>是将1左移i位，即第i位为1，其余位为0；</p> 
 <p>例如1&lt;&lt;2 则0001-&gt;0100</p> 
 <p>n&amp;(1&lt;&lt;i)是将左移i位的1与n进行按位与，即为保留n的第i位，其余位置零</p> 
 <p>如果n第i位为0，则n&amp;(1&lt;&lt;i)的值为0</p> 
 <p>否则不为0</p> 
 <p>常用if(n&amp;(1&lt;&lt;i)==0)用于判断n的第i位是否为0</p> 
 {% highlight %}编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为汉明重量）。

提示：
    请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
    在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 3 中，输入表示有符号整数 -3。
{% endhighlight %} 
 <pre><code class="language-javascript">var hammingWeight = function(n) {
    let ret = 0;
    for (let i = 0; i &lt; 32; i++) {
        if ((n &amp; (1 &lt;&lt; i)) !== 0) {
            ret++;
        }
    }
    return ret;
};{% endhighlight %} 
 <p><img alt="" height="742" src="https://img-blog.csdnimg.cn/8c4333afd4154d8a99a2b6e79a5fd415.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
</blockquote> 
<blockquote> 
 <p>1、自增的顺序不同</p> 
 <p>x＋＋表示x自增1后再参与其它运算。</p> 
 <p>＋＋x是x参与运算后，x的值再自增1。</p> 
 <p>2、自增类型不同</p> 
 <p>x＋＋属于后置自增运算。</p> 
 <p>＋＋x属于前置自增运算。<img alt="" src="https://img-blog.csdnimg.cn/2e39a02c8fd9474fae0d3b8e0ef4bcd5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p> </p> 
 <p><strong>&gt;&gt;=:这是复合运算符</strong></p> 
 <p>“&gt;&gt;”是双目移位运算符，其功能是把“&gt;&gt; ”左边的运算数的各二进位全部右移若干位，“&gt;&gt;”右边的数指定移动的位数。</p> 
 <p>例如：设 a=15(这是十进制，要把它转换为2进制数)，a&gt;&gt;2表示把000001111右移为00000011(十进制3)。</p> 
</blockquote> 
<p></p> 
<blockquote> 
 <p><code>Set</code>对象是值的集合，你可以按照插入的顺序迭代它的元素。 Set中的元素只会<strong>出现一次</strong>，即 Set 中的元素是唯一的。<img alt="" src="https://img-blog.csdnimg.cn/3bac921a12e041dd8c129d2947db40d2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p><img alt="" height="723" src="https://img-blog.csdnimg.cn/7517aec119cb42aba838222caf036353.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="705"> </p> 
 <p> 可以认为a b的值相等 但是内存地址不同，是可以==  但是不是！==</p> 
</blockquote>
                
