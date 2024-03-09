---
layout: post
title: "ruby - csv 读写文件 csv read write file --从本地"
date: "2022-06-13"
categories: 
---
<pre class="hljs ruby">
 <span class="hljs-function"><span class="hljs-keyword">def</span> </span>save_to_csv(csv)
    <span class="hljs-constant">CSV</span>.open(<span class="hljs-string">&quot;C:/ruby/logs.csv&quot;</span>, <span class="hljs-string">&quot;w&quot;</span>) <span class="hljs-keyword">do</span> |row|
      row &lt;&lt; <span class="hljs-string">%w[name location dishes time]</span>
    <span class="hljs-keyword">end</span>
  <span class="hljs-keyword">end</span>
  
  <span class="hljs-function"><span class="hljs-keyword">def</span> </span><span class="hljs-keyword">self</span>.read_from_csv(csv)
     <span class="hljs-constant">CSV</span>.foreach(<span class="hljs-string">&quot;C:/ruby/logs.csv&quot;</span>) <span class="hljs-keyword">do</span> |row|
     puts row [<span class="hljs-string">&#39;name&#39;</span>, <span class="hljs-string">&#39;location&#39;</span>, <span class="hljs-string">&#39;dishes&#39;</span>, <span class="hljs-string">&#39;time&#39;</span>]
   <span class="hljs-keyword">end</span>
 <span class="hljs-keyword">end</span></pre>

