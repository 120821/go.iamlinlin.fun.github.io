---
layout: post
title: "ruby array hash的使用"
date: "2022-06-09"
categories: 
---

                    <ul>
<li> <pre><code>在 Ruby 中创建哈希的方法：

ip_to_domain = { "rubyguides.com" = &gt; "185.14.187.159" }   

你可以像这样获取哈希键的值：

ip_to_domain["rubyguides.com"]
## =&gt; "185.14.187.159"

你可以像这样更改值：

ip_to_domain["rubyguides.com"] = "8.8.8.8"

这些是你可以使用哈希执行的 3 个主要操作。

顺便说一句，你使用逗号分隔多个键/值对。

像这样：

values = { "a" =&gt; 100, "b" =&gt; 200 }</code></pre> </li>
<li>使用以下值创建一个名称为的 food 数组 ：“bacon”、“orange”、“apple”</li>
<li>访问数组 food 的第一个元素</li>
<li>访问数组 food 的最后一个元素</li>
<li>在数组中添加一个新元素：“yogurt”</li>
<li>创建一个包含 3 个键/值对的哈希，这些键/值对代表国家代码（如 ES）及其国家名称（如西班牙）。</li>
<li>回答这个问题：1 和 '1' 有什么区别？</li>
</ul>
<pre><code class="language-ruby">food = ["bacon", "orange","apple"]

food(.first

food.last

food += ["yugjort"]

hash = {"ES" =&gt; "西班牙", "USA" =&gt; "美国" , " UK" =&gt; "英国"}

1是数字，'1'是字符串</code></pre> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/8c34eab4ff834f1a9f455a437e305fb7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p></p>
                
