---
layout: post
title: "ruby入门算法：打印一个hash, key 为数字，value为可以被整除的被除数"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>Ruby 注释</p> 
 <p>注释是在运行时会被忽略的 Ruby 代码内的注释行。单行注释以 # 字符开始，直到该行结束</p> 
 <pre><code class="language-ruby"># 这是一个单行注释。
 
puts "Hello, Ruby!"</code></pre> 
 <h2>Ruby 多行注释</h2> 
 <p>您可以使用 <strong>=begin</strong> 和 <strong>=end</strong> 语法注释多行，</p> 
 <pre><code class="language-ruby">puts "Hello, Ruby!"
 
=begin
这是一个多行注释。
可扩展至任意数量的行。
但 =begin 和 =end 只能出现在第一行和最后一行。 
=end</code></pre> 
 <p>请确保尾部的注释离代码有足够的距离，以便容易区分注释和代码。如果尾部超过一条注释，请将它们对齐</p> 
 <pre><code class="language-ruby">@counter      # 跟踪页面被点击的次数
@siteCounter  # 跟踪所有页面被点击的次数</code></pre> 
 <table><tbody>
<tr>
<th>运算符</th>
<th>描述</th>
<th>实例</th>
</tr>
<tr>
<td>==</td>
<td>检查两个操作数的值是否相等，如果相等则条件为真。</td>
<td>(a == b) 不为真。</td>
</tr>
<tr>
<td>!=</td>
<td>检查两个操作数的值是否相等，如果不相等则条件为真。</td>
<td>(a != b) 为真。</td>
</tr>
<tr>
<td>&gt;</td>
<td>检查左操作数的值是否大于右操作数的值，如果是则条件为真。</td>
<td>(a &gt; b) 不为真。</td>
</tr>
<tr>
<td>&lt;</td>
<td>检查左操作数的值是否小于右操作数的值，如果是则条件为真。</td>
<td>(a &lt; b) 为真。</td>
</tr>
<tr>
<td>&gt;=</td>
<td>检查左操作数的值是否大于或等于右操作数的值，如果是则条件为真。</td>
<td>(a &gt;= b) 不为真。</td>
</tr>
<tr>
<td>&lt;=</td>
<td>检查左操作数的值是否小于或等于右操作数的值，如果是则条件为真。</td>
<td>(a &lt;= b) 为真。</td>
</tr>
</tbody></table>
</blockquote> 
<blockquote> 
 <p>例如：</p> 
 <pre>prime_numbers(5)  ,

结果

{
  1: [1],
  2: [1,2],
  3: [1,3],
  4: [1,2,4],
  5: [1,5]
}

再比如：

prime_numbers(8)  ,

结果

{
  1: [1],
  2: [1,2],
  3: [1,3],
  4: [1,2,4],
  5: [1,5],
  6: [1,2,3,6],
  7: [1,7],
  8: [1,2,4,8]
}</pre> 
 <pre><code class="language-ruby"># 获得某个数的所有除数
def get_all_divisors(n)

  result = []

  # 对 1 .. n 的所有数进行遍历
  for i in (1..n)

    # 把每个数都：  n / i , 看余数
    # 如果余数是0 ，表示 i 可以整除 n ,
    if n % i == 0
      #  就把i 放到结果中。
      result.push i
    end 
  end 

  # 循环结束, 返回结果
  return result

end

def get_all_divisors_by_range max 
  result = {}
  for i in (1 .. max)
    # TODO 这里不使用独立的方法

    small_result = []
    for j in (1..i)
      if i % j == 0
        small_result.push j
      end
    end

    result[i] = small_result

  end
  return result
end


#puts get_all_divisors 10
puts get_all_divisors_by_range 10
</code></pre> 
 <pre><code class="language-ruby"># 获得某个数的所有除数
def get_all_divisors(n)

  result = []

  # 对 1 .. n 的所有数进行遍历
  for i in (1..n)

    # 把每个数都：  n / i , 看余数
    # 如果余数是0 ，表示 i 可以整除 n ,
    if n % i == 0
      #  就把i 放到结果中。
      result.push i
    end 
  end 

  # 循环结束, 返回结果
  return result

end

def get_all_divisors_by_range max 
  result = {}
  for i in (1 .. max)
    result[i] = get_all_divisors(i)
  end 
  return result
end


#puts get_all_divisors 10
puts get_all_divisors_by_range 10
~                                                                                                                                                                            
~                                      </code></pre> 
 <p></p> 
</blockquote> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/f8db80822b4848d4929e60e885615f9f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p></p>
                
