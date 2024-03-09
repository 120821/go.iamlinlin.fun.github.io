---
layout: post
title: "简单兑换码生成 loop do ruby"
date: "2022-06-09"
categories: 
---

                    <p>使用循环。生成简单的兑换码。很有趣。</p> 
<pre><code>loop do
  puts (('A'..'Z').to_a + (0..9).to_a).shuffle[0,12].join
  sleep 1
end
      </code></pre> 
<p>那么怎么进行生成点击按钮新建兑换码就直接在表格进行填写生成的验证码呢？</p> 
<p><img alt="" height="261" src="https://img-blog.csdnimg.cn/059fa58c2c6648098c42784c5ccad619.png" width="1200"></p> 
<p>在一个表格中增加默认值 value</p> 
<p>然后引入数据即可，明确一个概念，在erb文件中使用rb代码使用&lt;% %&gt; 或者&lt;%= %&gt; 加上等号就是可以输出数据，不加等号就是不输出数据。</p> 
<pre><code>&lt;%= form_for @blog do |form| %&gt;
    &lt;div class="title"&gt;
     &lt;label&gt;
        标题:
     &lt;%= form.text_field :title, :value =&gt; "#{(('A'..'Z').to_a + (0..9).to_a).shuffle[0,12].join}" %&gt;
     &lt;/label&gt;
    &lt;/div&gt;
&lt;% end %&gt;
</code></pre> 
<p>,然后使用我们需要的数据生成即可,刷新页面，兑换码会自动变化</p> 
<p><img alt="" height="526" src="https://img-blog.csdnimg.cn/66164152ca0b4283bf2cde4faf5761db.png" width="836"></p> 
<pre><code>Recognized Tags

ERB recognizes certain tags in the provided template and converts them based on the rules below:

&lt;% Ruby code -- inline with output %&gt;
&lt;%= Ruby expression -- replace with result %&gt;
&lt;%# comment -- ignored -- useful in testing %&gt;
% a line of Ruby code -- treated as &lt;% line %&gt; (optional -- see ERB.new)
%% replaced with % if first thing on a line and % processing is used
&lt;%% or %%&gt; -- replace with &lt;% or %&gt; respectively

All other text is passed through ERB filtering unchanged.</code></pre> 
<h1 id="view的基本概念和用法">View的基本概念和用法</h1> 
<p>View在MVC中,一直是最简单的概念. 大家要分分钟入门.</p> 
<p>视图在Rails中, 就是 .html.erb 文件. 我们原则上把跟HTML有关的东西,都写在 视图中.</p> 
<p>每个视图都要由controller触发. 所有的视图文件,都放在: <code>app/views/</code> 目录下. 例如: <code>app/views/books/new.html.erb</code> 这是Rails的约定 .</p> 
<p>最基本用法</p> 
<p>下面是一个最简单的erb文件:</p> 
<pre><code>&lt;p&gt;当前时间是:  &lt;%= Time.now %&gt;&lt;/p&gt;
</code></pre> 
<p>它会直接被转换成下面的HTML:</p> 
<pre><code>&lt;p&gt;当前时间: 2016-10-08 21:01:35 +0800&lt;/p&gt;
</code></pre> 
<h1 id="-与---的区别">
<code>&lt;% %&gt;</code> 与 <code>&lt;%= %&gt;</code> 的区别</h1> 
<p><code>&lt;% %&gt;</code> 表示仅运行代码, 例如: <code>&lt;% a = 1 %&gt;</code> <code>&lt;%= %&gt;</code> 表示,不但运行, 而且把结果渲染到html中. 例如: <code>&lt;%= Time.now %&gt;</code></p>
                
