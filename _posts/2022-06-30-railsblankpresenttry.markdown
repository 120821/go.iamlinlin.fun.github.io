---
layout: post
title: "rails中 .blank? .present? .try 的作用和用法 "
date: "2022-06-30"
categories: 
---
<p><strong>try</strong>可以实现当对象不为 nil 时在其上调用方法<br />
@number.try(:next)等同于：</p>

<p>unless @number.nil?<br />
&nbsp; @number.next<br />
end</p>

<pre><code>[26] pry(main)&gt; nil.try(:length)<br />
=&gt; nil<br />
[27] pry(main)&gt; &quot;a&quot;.try(:length)<br />
=&gt; 1</code></pre>

<p><strong>blank? 和 present?</strong></p>

<p>Rails 应用中，下面这些值表示<strong>空值</strong>：</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nil 和 false；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 只有空白的字符串（注意下面的说明）；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 空数组和空散列；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 其他能响应 empty? 方法，而且返回值为 true 的对象；</p>

<p>present? 方法等价于 !blank?,返回一个true或者false</p>

<pre><code>[1] pry(main)&gt; &quot; &quot;.blank?<br />
=&gt; true<br />
[2] pry(main)&gt; &quot;&quot;.blank?<br />
=&gt; true<br />
[4] pry(main)&gt; [].blank?<br />
=&gt; true<br />
[5] pry(main)&gt; nil.blank?<br />
=&gt; true<br />
[8] pry(main)&gt; &quot;&quot;.present?<br />
=&gt; false<br />
[9] pry(main)&gt; &quot;a&quot;.present?<br />
=&gt; true</code></pre>

<p>.nil?可以用在一切对象上，当对象为nil时，返回true<br />
<code>.empty?</code>可以用于字符串，数组或者哈希，当满足下列条件时，返回true</p>

<ul>
	<li>String length == 0</li>
	<li>Array length == 0</li>
	<li>Hash length == 0</li>
</ul>

<p>在nil对象上调用 <code>.empty?</code>会抛出<code>NoMethodError</code>异常。<br />
<code>.blank?</code>就是为此而生的。这个方法是<a href="https://apidock.com/rails/Object/blank%3f">Rails</a>实现的，类似于<code>.empty?</code>可以作用于字符串，数组或者哈希，<code>.blank?</code>可以作用于认为对象。</p>

<pre class="prettyprint" data-index="0" name="code">
<code class="language-ruby hljs  has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="hljs-keyword">nil</span>.blank? == <span class="hljs-keyword">true</span>
<span class="hljs-keyword">false</span>.blank? == <span class="hljs-keyword">true</span>
[].blank? == <span class="hljs-keyword">true</span>
{}.blank? == <span class="hljs-keyword">true</span>
<span class="hljs-string">&quot;&quot;</span>.blank? == <span class="hljs-keyword">true</span>
<span class="hljs-number">5</span>.blank? == <span class="hljs-keyword">false</span>
<span class="hljs-number">0</span>.blank? == <span class="hljs-keyword">false</span></code></pre>

<p>对于只包含空格的字符串，<code>.blank?</code>的返回同样为true</p>

<pre class="prettyprint" data-index="1" name="code">
<code class="language-ruby hljs  has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="hljs-string">&quot;  &quot;</span>.blank? == <span class="hljs-keyword">true</span>
<span class="hljs-string">&quot;  &quot;</span>.empty? == <span class="hljs-keyword">false</span></code></pre>

<p>Rails同样提供了<a href="http://apidock.com/rails/Object/presence" rel="noopener noreferrer" target="_blank"><code>.present?</code></a> 方法，其返回值与<code>.blank?</code>相反。</p>

<p>注意，就算数组中的元素都为blank时，对数组调用<code>.blank?</code>仍然会返回false。对于这种情况时，使用<code>.all?</code>配合<code>.blank?</code>，如下例：</p>

<pre class="prettyprint" data-index="2" name="code">
<code class="language-ruby hljs  has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;">[ <span class="hljs-keyword">nil</span>, <span class="hljs-string">&#39;&#39;</span> ].blank? == <span class="hljs-keyword">false</span>
[ <span class="hljs-keyword">nil</span>, <span class="hljs-string">&#39;&#39;</span> ].all? &amp;<span class="hljs-symbol">:blank?</span> == <span class="hljs-keyword">true</span> </code></pre>

