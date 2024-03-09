---
layout: post
title: "ruby中的日期操作(date time in ruby) "
date: "2022-08-01"
categories: 
---
<p>http://siwei.me/blog/posts/ruby-date-time-in-ruby</p>

<p>strftime , strptime是关键。</p>

<p>下面的代码打印了两个时间之间的日期：</p>

<pre class="hljs cs">
require <span class="hljs-string">&#39;date&#39;</span>
<span class="hljs-keyword">from</span> = DateTime.strptime(<span class="hljs-string">&#39;2015-05-23&#39;</span>, <span class="hljs-string">&#39;%Y-%m-%d&#39;</span>)
to = DateTime.strptime(<span class="hljs-string">&#39;2015-06-03&#39;</span>, <span class="hljs-string">&#39;%Y-%m-%d&#39;</span>)
(<span class="hljs-keyword">from</span>..to).each <span class="hljs-keyword">do</span> |date|
  puts date.strftime(<span class="hljs-string">&#39;%Y-%m-%d&#39;</span>)
end

<span class="hljs-preprocessor"># 结果：</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">23</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">24</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">25</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">26</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">27</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">28</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">29</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">30</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">05</span>-<span class="hljs-number">31</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">06</span>-<span class="hljs-number">01</span>
<span class="hljs-number">2015</span>-<span class="hljs-number">06</span>-<span class="hljs-number">02</span>
</pre>

<p>获取某个时间的 具体星期几：</p>

<pre><code>DateTime.strptime(date, &#39;%Y-%m-%d&#39;).wday</code></pre>

<pre><code>增加migrate&nbsp; add_column :contracts, :start_time, :datetime</code></pre>

<p>在form表单中，设置默认值，不显示后边的00:00:00 UTC</p>

<pre><code>&lt;%= form.text_field :start_time, value: &quot;#{@contract.start_time.strftime(&quot;%Y-%m-%d&quot;) rescue &#39;&#39;}&quot;, class: &quot;form-control&quot;, placeholder: &quot;例如 2022-09-24&quot; %&gt;</code></pre>

<p>新建页面正常显示即可</p>

<pre><code>&nbsp;&lt;%= form.text_field :start_time, class: &quot;form-control&quot;, placeholder: &quot;例如 2022-09-24 &quot; %&gt;</code></pre>

<pre><code>&lt;%= contract.start_time.strftime(&quot;%Y-%m-%d&quot;) rescue &#39;&#39; %&gt;</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

