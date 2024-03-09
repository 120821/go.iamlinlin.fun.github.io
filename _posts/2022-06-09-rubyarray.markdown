---
layout: post
title: "ruby入门算法：动态创建一个二维Array"
date: "2022-06-09"
categories: 
---

                    <p>实现这样的方法： 可以动态创建一个二维Array, 内容如下</p> 
<pre>获得：

[
  [1],
  [2,2],
  [3,3,3],
  [4,4,4,4]
]

再如：

generate_array(5) 

获得：

[
  [1],
  [2,2],
  [3,3,3],
  [4,4,4,4],
  [5,5,5,5,5]
]

使用loop do 循环</pre> 
<pre><code class="language-ruby">def generate_small_array n
  result = []
  i = 1 
  loop do
    result.push(n)

    i = i + 1 
    if i &gt; n 
      break
    end 
  end 
  return result
end

def generate_array n
  result = []
  i = 1 
  loop do
    small_array = generate_small_array(i)
    result.push(small_array)

    i =  i + 1 
    if i &gt; n 
      break
    end 
  end 
  return result
end

puts generate_array(5).inspect

</code></pre> 
<p>使用for in</p> 
<pre><code class="language-ruby">def generate_array n
result =[] 

for i in (1..n)
  small_array = []
  for i in (1..i)
    small_array.push(i)
  end 
  result.push(small_array)
end
return result
end

puts generate_array(5).inspect
</code></pre> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/15af70fc85ea438b9299b875b8f430d0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p>
                
