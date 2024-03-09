---
layout: post
title: "ruby loop do end break // go 环境变量"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong>使用loop do </strong></p> 
 <p>loop方法没有携带任何普通的参数，只管调用就行，还可以使用代码块，这是一种有明确界限的、作为方法的调用（调用loop的部分），可以在方法中调用的程序指令集合。<br>      代码块编写要么放在（{}）中，要么使用关键字 do 和 end<br>       </p> 
 <pre><code>  loop {put "looping"}
        loop do
            puts "looping"
        end</code></pre> 
 <p>以上两个代码块是对等的。<br>   控制循环<br>       停止循环一种方式为break<br>        </p> 
 <pre><code>  n=1
         loop do
             n=n+1
             break    if n &gt; 9                 
         end</code></pre> 
 <p><br>          另一个技术则是跳过循环的下一次迭代而不是结束整个过程，使用关键字next 达到此目的<br>          </p> 
 <pre><code>   n=1
             loop  do
               n=n+1
               next unless n != 10
               break
             end</code></pre> 
</blockquote> 
<pre><code> #(0..20).each do |i|
 32 #  i*900 
 33 #  puts i*900
 34 i = 0
 35 loop do
 42   body = { 
 43     "query" =&gt; "query MyQuery {\n  subdomains(first: 1000, skip: #{i*900}) {\n    id\n    name\n    owner\n  }\n}",
 44     "variables" =&gt; nil ,
 45     "operationName" =&gt; "MyQuery",
 46     "extensions" =&gt; {
 47       "headers" =&gt; nil
 48     }
 49   }.to_json
 50 
 51   response = HTTParty.post url, headers: headers, body: body
 52   puts response.inspect
 53 
 54   parsed_response = JSON.parse(response.body)
 55   puts parsed_response
 56   if parsed_response['data']['subdomains'].blank?
 57     break
 58   end
 59   i = i + 1
 60 end 
</code></pre> 
<p>另外注意body的写法是使用json，不是string，也不是使用：，而是使用=&gt;, \n 也不必删除。</p> 
<p>注意51行是key ： value的形式，不能少写</p> 
<hr>
<h1>Go 语言变量</h1> 
<p>变量来源于数学，是计算机语言中能储存计算结果或能表示值抽象概念。</p> 
<p>变量可以通过变量名访问。</p> 
<blockquote> 
 <p>Go 语言变量名由字母、数字、下划线组成，其中首个字符不能为数字。</p> 
 <p>声明变量的一般形式是使用 var 关键字：</p> 
 <pre>var identifier type</pre> 
 <p>可以一次声明多个变量：</p> 
 <pre>var identifier1, identifier2 type</pre> 
 <h2>实例</h2> 
 <p>package main<br> import "fmt"<br> func main() {<!-- --><br>     var a string = "Runoob"<br>     fmt.Println(a)<br><br>     var b, c int = 1, 2<br>     fmt.Println(b, c)<br> }</p> 
 <p>以上实例输出结果为：</p> 
 <pre>Runoob
1 2</pre> 
</blockquote> 
<blockquote> 
 <h3>变量声明</h3> 
 <p><strong>第一种，指定变量类型，如果没有初始化，则变量默认为零值</strong>。</p> 
 <pre>var v_name v_type
v_name = value</pre> 
 <p>零值就是变量没有做初始化时系统默认设置的值。</p> 
 <h2>实例</h2> 
 <p>package main<br> import "fmt"<br> func main() {<!-- --><br><br>     // 声明一个变量并初始化<br>     var a = "RUNOOB"<br>     fmt.Println(a)<br><br>     // 没有初始化就为零值<br>     var b int<br>     fmt.Println(b)<br><br>     // bool 零值为 false<br>     var c bool<br>     fmt.Println(c)<br> }</p> 
 <p>以上实例执行结果为：</p> 
 <pre>RUNOOB
0
false</pre> 
 <ul>
<li> <p>数值类型（包括complex64/128）为 <strong>0</strong></p> </li>
<li> <p>布尔类型为 <strong>false</strong></p> </li>
<li> <p>字符串为 <strong>""</strong>（空字符串）</p> </li>
<li> <p>以下几种类型为 <strong>nil</strong>：</p> <pre>var a *int
var a []int
var a map[string] int
var a chan int
var a func(string) int
var a error // error 是接口</pre> </li>
</ul>
 <h2>实例</h2> 
 <p>package main<br><br> import "fmt"<br><br> func main() {<!-- --><br>     var i int<br>     var f float64<br>     var b bool<br>     var s string<br>     fmt.Printf("%v %v %v %q\n", i, f, b, s)<br> }</p> 
 <p>输出结果是：</p> 
 <pre>0 0 false ""</pre> 
</blockquote> 
<blockquote> 
 <p><strong>第二种，根据值自行判定变量类型。</strong></p> 
 <pre>var v_name = value</pre> 
 <h2>实例</h2> 
 <p>package main<br> import "fmt"<br> func main() {<!-- --><br>     var d = true<br>     fmt.Println(d)<br> }</p> 
 <p>输出结果是：</p> 
 <pre>true</pre> 
</blockquote> 
<blockquote> 
 <p><strong>第三种，如果变量已经使用 var 声明过了，再使用 := 声明变量，就产生编译错误，格式：</strong></p> 
 <pre>v_name := value</pre> 
 <p>例如：</p> 
 <pre>var intVal int 
intVal :=1 // 这时候会产生编译错误，因为 intVal 已经声明，不需要重新声明</pre> 
 <p>直接使用下面的语句即可：</p> 
 <pre>intVal := 1 // 此时不会产生编译错误，因为有声明新的变量，因为 := 是一个声明语句</pre> 
 <p>intVal := 1 相等于：</p> 
 <pre>var intVal int 
intVal =1 </pre> 
 <p>可以将 var f string = "Runoob" 简写为 f := "Runoob"：</p> 
 <h2>实例</h2> 
 <p>package main<br> import "fmt"<br> func main() {<!-- --><br>     f := "Runoob" // var f string = "Runoob"<br><br>     fmt.Println(f)<br> }</p> 
 <p>输出结果是：</p> 
 <pre>Runoob</pre> 
</blockquote> 
<blockquote> 
 <h3>多变量声明</h3> 
 <pre>//类型相同多个变量, 非全局变量
var vname1, vname2, vname3 type
vname1, vname2, vname3 = v1, v2, v3

var vname1, vname2, vname3 = v1, v2, v3 // 和 python 很像,不需要显示声明类型，自动推断

vname1, vname2, vname3 := v1, v2, v3 // 出现在 := 左侧的变量不应该是已经被声明过的，否则会导致编译错误


// 这种因式分解关键字的写法一般用于声明全局变量
var (
    vname1 v_type1
    vname2 v_type2
)</pre> 
</blockquote> 
<h2>实例</h2> 
<pre><code>package main

var x, y int
var (  // 这种因式分解关键字的写法一般用于声明全局变量
    a int
    b bool
)</code></pre> 
<pre><code>var c, d int = 1, 2
var e, f = 123, "hello"</code></pre> 
<blockquote> 
 <p><br><br> //这种不带声明格式的只能在函数体中出现<br> //g, h := 123, "hello"<br><br> func main(){<!-- --><br>     g, h := 123, "hello"<br>     println(x, y, a, b, c, d, e, f, g, h)<br> }</p> 
 <p>以上实例执行结果为：</p> 
 <pre>0 0 0 false 1 2 123 hello 123 hello</pre> 
</blockquote>
                
