---
layout: post
title: "根据已有的hash，创建一个新的hash， value为已有的hash的value + “ new value“"
date: "2022-06-09"
categories: 
---
<blockquote> 
{% highlight html %}hash1 = { "k1" =&gt; 'v1' , 'k2' =&gt; 'v2'}
hash2 = create_new_hash hash1
puts hash1  # =&gt; { "k1" =&gt; 'v1' , 'k2' =&gt; 'v2'}
puts hash2  # =&gt; { "k1" =&gt; 'v1 new value' , 'k2' =&gt; 'v2 new value'}
{% endhighlight %} 
<p>提示：只能使用for 循环. 不能使用其他的第三方方法，例如 map, each</p> 
{% highlight html %}<code class="language-ruby">#根据已有的hash，创建一个新的hash， value为已有的hash的value + " new value"
def creat_new_hash_value_add_new_value
#首先创建一个hash，key为kn ，value为vn
#hash为给定的值
hash = { "k1" =&gt; 'v1' , 'k2' =&gt; 'v2'}
#把给定hash的key提取出来
my_hash = {}
puts hash.keys
for i in hash.keys
my_hash[i] = hash[i] + 'new value'
end
puts hash
puts my_hash
end
~            {% endhighlight %} 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/a6e52f51055a4c05a8eb41f6c7d2dfce.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p> 
</blockquote>
