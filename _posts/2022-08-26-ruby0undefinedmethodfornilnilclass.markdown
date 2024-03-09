---
layout: post
title: "ruby ||= 0（undefined method `+' for nil:NilClass）"
date: "2022-08-26"
categories: 
---
<p><a href="https://stackoverflow.com/questions/995593/what-does-or-equals-mean-in-ruby">https://stackoverflow.com/questions/995593/what-does-or-equals-mean-in-ruby</a></p>

<p>由于accout : asset 的关系为 1：N ，在app/model进行关联关系的设置，Account每增加一个资产，就会增加Account的列count的数值，但是由于migrate的时候，没有增加默认值为0，那么导致在新建的时候，会产生报错：undefined method `+&#39; for nil:NilClass, 并且进行提示是model的计数问题</p>

<p>||运算法则为：左边为false或nil时，返回右边的对象。<br style="margin:0px; padding:0px" />
左边不为false或nil时，直接返回左边的对象，右边的不会运算。</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>hi.rb</code></div>

<pre><code>puts false &amp;&amp; &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; false<br />
puts nil&nbsp;&nbsp; &amp;&amp; &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; nil<br />
&nbsp;<br />
puts true&nbsp; &amp;&amp; &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; &quot;abc&quot;<br />
puts &quot;123&quot; &amp;&amp; &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; &quot;abc&quot;<br />
&nbsp;<br />
puts false || &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; &quot;abc&quot;<br />
puts nil&nbsp;&nbsp; || &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; &quot;abc&quot;<br />
&nbsp;<br />
puts true&nbsp; || &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; true<br />
puts &quot;123&quot; || &quot;abc&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =&gt; &quot;123&quot;</code></pre>

<p><img height="547" src="/uploads/ckeditor/pictures/339/image-20220826164853-1.png" width="1100" /></p>

<pre><code>ruby hihi.rb</code></pre>

<p><img height="432" src="/uploads/ckeditor/pictures/340/image-20220826164921-2.png" width="567" /></p>

<p>那么在model的+=1 的上一行增加：</p>

<p>@params ||= 0</p>

<p>再次运行就不会出现错误了。</p>

<p>或者在migrate，增加类似这样的：</p>

<pre><code>t.integer :visit, default: 0</code></pre>

<p><img height="215" src="/uploads/ckeditor/pictures/341/image-20220826165126-3.png" width="750" /></p>

<p>&nbsp;</p>

