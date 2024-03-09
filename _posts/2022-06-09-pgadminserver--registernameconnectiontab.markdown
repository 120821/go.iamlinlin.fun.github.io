---
layout: post
title: "pg_admin ： 如何添加的新数据库 ( server -＞ 右键 -＞ register, 填写 name, connection tab )"
date: "2022-06-09"
categories: 
---

                    <p>创建docker后，使用postgres，首先需要创建数据库进行和远程进行连接，进入数据库，点击右键进如register，serve的创建，</p> 
<p><img alt="" height="304" src="https://img-blog.csdnimg.cn/1f4a237323d946409da75c8afd1898cc.png" width="601"></p> 
<p> 然后可以填写一下名称，关键数据是在connection中的，<img alt="" height="394" src="https://img-blog.csdnimg.cn/c007b0ae4b7a4b80bfd1b9f211574968.png" width="487"></p> 
<p></p> 
<p>进行数据库端口的填写和ip的填写，不确定的话就可以进行查看<img alt="" height="543" src="https://img-blog.csdnimg.cn/7b5e34216f524e788a0b6db17388e3df.png" width="502"></p> 
<p>然后在配置好的项目中，进行数据库的创建，就可以看到数据库内容了</p> 
<p>bundle exec rake db:create</p> 
<hr>
<h2>Go 标记</h2> 
<p>Go 程序可以由多个标记组成，可以是关键字，标识符，常量，字符串，符号。如以下 GO 语句由 6 个标记组成：</p> 
<pre>fmt.Println("Hello, World!")</pre> 
<p>6 个标记是(每行一个)：</p> 
<pre>1. fmt
2. .
3. Println
4. (
5. "Hello, World!"
6. )</pre> 
<hr>
<h2>行分隔符</h2> 
<p>在 Go 程序中，一行代表一个语句结束。每个语句不需要像 C 家族中的其它语言一样以分号 ; 结尾，因为这些工作都将由 Go 编译器自动完成。</p> 
<p>如果你打算将多个语句写在同一行，它们则必须使用 ; 人为区分，但在实际开发中我们并不鼓励这种做法。</p> 
<p>以下为两个语句：</p> 
<p>fmt.Println("Hello, World!")<br> fmt.Println("菜鸟教程：runoob.com")</p> 
<hr>
<h2>注释</h2> 
<p>注释不会被编译，每一个包应该有相关注释。</p> 
<p>单行注释是最常见的注释形式，你可以在任何地方使用以 // 开头的单行注释。多行注释也叫块注释，均已以 /* 开头，并以 */ 结尾。如：</p> 
<pre>// 单行注释
/*
 Author by 菜鸟教程
 我是多行注释
 */</pre> 
<hr>
<h2>标识符</h2> 
<p>标识符用来命名变量、类型等程序实体。一个标识符实际上就是一个或是多个字母(A~Z和a~z)数字(0~9)、下划线_组成的序列，但是第一个字符必须是字母或下划线而不能是数字。</p> 
<p>以下是有效的标识符：</p> 
<pre>mahesh   kumar   abc   move_name   a_123
myname50   _temp   j   a23b9   retVal</pre> 
<p>以下是无效的标识符：</p> 
<ul>
<li>1ab（以数字开头）</li>
<li>case（Go 语言的关键字）</li>
<li>a+b（运算符是不允许的）</li>
</ul>
<hr>
<h2>字符串连接</h2> 
<p>Go 语言的字符串可以通过 + 实现：</p> 
<h2>实例</h2> 
<p>package main<br> import "fmt"<br> func main() {<!-- --><br>     fmt.Println("Google" + "Runoob")<br> }</p> 
<p>以上实例输出结果为：</p> 
<pre>GoogleRunoob</pre> 
<hr>
<h2>关键字</h2> 
<p>下面列举了 Go 代码中会使用到的 25 个关键字或保留字：</p> 
<table><tbody>
<tr>
<td>break</td>
<td>default</td>
<td>func</td>
<td>interface</td>
<td>select</td>
</tr>
<tr>
<td>case</td>
<td>defer</td>
<td>go</td>
<td>map</td>
<td>struct</td>
</tr>
<tr>
<td>chan</td>
<td>else</td>
<td>goto</td>
<td>package</td>
<td>switch</td>
</tr>
<tr>
<td>const</td>
<td>fallthrough</td>
<td>if</td>
<td>range</td>
<td>type</td>
</tr>
<tr>
<td>continue</td>
<td>for</td>
<td>import</td>
<td>return</td>
<td>var</td>
</tr>
</tbody></table>
<p>除了以上介绍的这些关键字，Go 语言还有 36 个预定义标识符：</p> 
<table><tbody>
<tr>
<td>append</td>
<td>bool</td>
<td>byte</td>
<td>cap</td>
<td>close</td>
<td>complex</td>
<td>complex64</td>
<td>complex128</td>
<td>uint16</td>
</tr>
<tr>
<td>copy</td>
<td>false</td>
<td>float32</td>
<td>float64</td>
<td>imag</td>
<td>int</td>
<td>int8</td>
<td>int16</td>
<td>uint32</td>
</tr>
<tr>
<td>int32</td>
<td>int64</td>
<td>iota</td>
<td>len</td>
<td>make</td>
<td>new</td>
<td>nil</td>
<td>panic</td>
<td>uint64</td>
</tr>
<tr>
<td>print</td>
<td>println</td>
<td>real</td>
<td>recover</td>
<td>string</td>
<td>true</td>
<td>uint</td>
<td>uint8</td>
<td>uintptr</td>
</tr>
</tbody></table>
<p>程序一般由关键字、常量、变量、运算符、类型和函数组成。</p> 
<p>程序中可能会使用到这些分隔符：括号 ()，中括号 [] 和大括号 {}。</p> 
<p>程序中可能会使用到这些标点符号：.、,、;、: 和 …。</p> 
<hr>
<h2>Go 语言的空格</h2> 
<p>Go 语言中变量的声明必须使用空格隔开，如：</p> 
<pre><code>var age int;</code></pre> 
<p>语句中适当使用空格能让程序更易阅读。</p> 
<p>无空格：</p> 
<pre><code>fruit=apples+oranges;</code></pre> 
<p>在变量与运算符间加入空格，程序看起来更加美观，如：</p> 
<pre><code>fruit = apples + oranges; </code></pre> 
<hr>
<h2>格式化字符串</h2> 
<p>Go 语言中使用 fmt.Sprintf 格式化字符串并赋值给新串：</p> 
<h2>实例</h2> 
<pre><code>package main

import (
    "fmt"
)
</code></pre> 
<pre><code>func main() {
   // %d 表示整型数字，%s 表示字符串
    var stockcode=123
    var enddate="2020-12-31"
    var url="Code=%d&amp;endDate=%s"
    var target_url=fmt.Sprintf(url,stockcode,enddate)
    fmt.Println(target_url)
}</code></pre> 
<p>输出结果为：</p> 
<pre><code>Code=123&amp;endDate=2020-12-31</code></pre> 
<p></p>
                
