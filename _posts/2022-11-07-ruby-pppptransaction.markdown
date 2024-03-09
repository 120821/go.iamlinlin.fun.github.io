---
layout: post
title: "ruby - pp 的使用 pp transaction"
date: "2022-11-07"
categories: 
---
<p><a href="https://ruby-doc.org/stdlib-2.4.1/libdoc/pp/rdoc/PP.html">https://ruby-doc.org/stdlib-2.4.1/libdoc/pp/rdoc/PP.html</a></p>

<p>增加：</p>

<pre class="ruby">
<code><span class="ruby-identifier">require</span> <span class="ruby-string">&#39;pp&#39;</span></code></pre>

<pre>
<code>pp(obj)             #=&gt; obj
pp obj              #=&gt; obj
pp(obj1, obj2, ...) #=&gt; [obj1, obj2, ...]
pp()                #=&gt; nil</code></pre>

<p><span class="ruby-string">使用的时候，一般用于打印log</span></p>

<pre class="ruby">
<code><span class="ruby-comment">#&lt;PP:0x81fedf0 @genspace=#&lt;Proc:0x81feda0&gt;, @group_queue=#&lt;PrettyPrint::GroupQueue:0x81fed3c @queue=[[#&lt;PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false&gt;], []]&gt;, @buffer=[], @newline=&quot;\n&quot;, @group_stack=[#&lt;PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false&gt;], @buffer_width=0, @indent=0, @maxwidth=79, @output_width=2, @output=#&lt;IO:0x8114ee4&gt;&gt;</span></code></pre>

<p><span class="ruby-comment">就会变成这样的（会自动换行）：</span></p>

<pre>
<code>#&lt;PP:0x81fedf0
 @buffer=[],
 @buffer_width=0,
 @genspace=#&lt;Proc:0x81feda0&gt;,
 @group_queue=
  #&lt;PrettyPrint::GroupQueue:0x81fed3c
   @queue=
    [[#&lt;PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0&gt;],
     []]&gt;,
 @group_stack=
  [#&lt;PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0&gt;],
 @indent=0,
 @maxwidth=79,
 @newline=&quot;\n&quot;,
 @output=#&lt;IO:0x8114ee4&gt;,
 @output_width=2&gt;</code></pre>

<p>&nbsp;</p>

