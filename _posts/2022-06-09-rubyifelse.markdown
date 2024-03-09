---
layout: post
title: "ruby if else 语句"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>如果某事为真（条件），那么你可以做某事。</p> 
 <p>在 Ruby 中，你可以使用 <strong>if 语句</strong>来执行此操作：</p> 
 <pre><code>stock = 10
if stock &lt; 1
  puts "Sorry we are out of stock!"
end
</code></pre> 
 <p>stock &lt; 1 部分就是我们所说的“条件”。</p> 
 <p>这是条件内的代码正常工作所需要的。</p> 
 <p>“如果值 stock 小于 1 则打印‘缺货’消息，否则什么也不做。”</p> 
 <ol>
<li>&lt; 少于</li>
<li>比...更棒</li>
<li>== 等于</li>
<li>!= 不等于</li>
<li>&gt;= 大于或等于</li>
<li>&lt;= 小于或等于</li>
</ol>
 <p>请注意，我们使用两个相等==的符号来表示相等！</p> 
 <p>Ruby 中的一个等号 = 表示“赋值”，当你想知道两件事是否相同时，一定要使用 ==。</p> 
 <p>如果你不这样做，你将不会得到预期的结果</p> 
</blockquote> 
<blockquote> 
 <p>要检查相反的“不正确”（假）时，你可以做两件事。</p> 
 <p>你可以使用 反转该值！。</p> 
 <p><strong>ruby 除非语句 </strong> 代码示例：</p> 
 <pre><code>if !condition
  ## ...
end
</code></pre> 
 <p>可以使用 unless，类似于 if，但它会检查“不正确”：</p> 
 <pre><code class="language-ruby">unless condition
  ## ...
end
</code></pre> 
 <p>if else 语句</p> 
 <p>“如果这不是真的，那就做另一件事”：</p> 
 <pre><code class="language-ruby">if stock &lt; 1
  puts "Sorry we are out of stock!"
else
  puts "Thanks for your order!"
end
</code></pre> 
 <pre><code class="language-ruby">if stock &lt; 1
  puts "Sorry we are out of stock!"
elsif stock == 10
  puts "You get a special discount!"
else
  puts "Thanks for your order!"
end
</code></pre> 
 <p>“如果 stock 小于 1 则打印此消息，否则如果库存等于 10 则打印此特殊消息，否则如果这些都不正确，则打印感谢消息。”</p> 
</blockquote> 
<p>使用多个条件</p> 
<pre><code class="language-ruby">可以使用 &amp;&amp;(AND) 运算符来执行此操作
if name == "David" &amp;&amp; country == "UK"
  ## ...
end
</code></pre> 
<pre><code class="language-ruby">可以使用 ||(OR) 运算符：
if age == 10 || age == 20
end
</code></pre> 
<pre><code class="language-ruby">注意这两个运算符 ( &amp;&amp;, ||) 如何允许你组合条件，但它们必须是适当的条件
你不能这样做：
if age == 10 || 20
end
</code></pre> 
<p>关于比较字符串。</p> 
<p>比较两个字符串时，它们必须看起来完全一样！</p> 
<p>包括“外壳”。</p> 
<p>这意味着“你好”和“你好”是不同的词。</p> 
<p>你可以通过使它们尽可能相等来解决此问题</p> 
<pre><code class="language-ruby">name  = "David"
expected_name = "david"
if expected_name.downcase == name.downcase
  puts "Name is correct!"
end
</code></pre> 
<p>可能遇到的与数组相关的另一个问题是“特殊符号”。</p> 
<p>这些符号用于新行 n 和制表键之类的东西 t。</p> 
<p>问题是当你尝试比较两个看起来相同但它们具有这些特殊符号之一的字符串时。</p> 
<p>要查看这些特殊符号，你需要使用以下 p 方法：</p> 
<pre><code>name = gets
p name
</code></pre> 
<p>试试这个代码，输入一些东西，你会注意到它 name 包含换行符（通常不可见 puts）。</p> 
<p>要删除此字符，你可以使用该 chomp 方法。</p> 
<pre><code>name = gets.chomp
p name
</code></pre> 
<p>现在换行符 ( n) 消失了，它可以让你正确比较字符串。</p> 
<h3 id="如果在一行中构造">在一行书写</h3> 
<p>仅使用一行代码就可以编写一个 if 语句。</p> 
<p>像这样：</p> 
<pre><code>puts 123 if 2.even?
</code></pre> 
<p>这与以下内容相同：</p> 
<pre><code>if 2.even?
  puts 123
end
</code></pre> 
<p>这是一个速记版本，如果你有一个简单的条件，它会很有用。</p> 
<h3 id="有替代方案吗">替代方案</h3> 
<p>如果你有一个 if else 表达式，那么还有一个简写形式。</p> 
<p>它被称为三元运算符：</p> 
<pre><code>40 &gt; 100 ? "Greater than" : "Less than"
</code></pre>
                
