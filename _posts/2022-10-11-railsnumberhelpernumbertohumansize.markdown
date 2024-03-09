---
layout: post
title: "rails NumberHelper  number_to_human_size"
date: "2022-10-11"
categories: 
---
<p><a href="https://www.ruby-forum.com/t/number-to-human-size/191945">https://www.ruby-forum.com/t/number-to-human-size/191945</a></p>

<p>官网：<a href="https://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_human_size">https://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_human_size</a></p>

<p>添加：</p>

<pre>
<code>include ActionView::Helpers::NumberHelper</code></pre>

<p><img height="104" src="/uploads/ckeditor/pictures/567/image-20221011102810-1.png" width="670" /></p>

<p>在controller添加：</p>

<p><img height="104" src="/uploads/ckeditor/pictures/568/image-20221011102837-2.png" width="670" /></p>

<p>使用：</p>

<pre>
<code>storage = Storage.create name: result.split(&#39; &#39;)[2], domain_id: &#39;&#39;, cid: result.split(&#39; &#39;)[1], size: number_to_human_size(file_size)</code></pre>

<p><img height="103" src="/uploads/ckeditor/pictures/569/image-20221011102900-3.png" width="1009" /></p>

<pre class="cpp" data-result="[object Object]" data-second_best="[object Object]">
<code>number_to_human_size(<span class="number">123</span>)                                          <span class="preprocessor"># =&gt; 123 Bytes</span>
number_to_human_size(<span class="number">1234</span>)                                         <span class="preprocessor"># =&gt; 1.21 KB</span>
number_to_human_size(<span class="number">12345</span>)                                        <span class="preprocessor"># =&gt; 12.1 KB</span>
number_to_human_size(<span class="number">1234567</span>)                                      <span class="preprocessor"># =&gt; 1.18 MB</span>
number_to_human_size(<span class="number">1234567890</span>)                                   <span class="preprocessor"># =&gt; 1.15 GB</span>
number_to_human_size(<span class="number">1234567890123</span>)                                <span class="preprocessor"># =&gt; 1.12 TB</span>
number_to_human_size(<span class="number">1234567890123456</span>)                             <span class="preprocessor"># =&gt; 1.1 PB</span>
number_to_human_size(<span class="number">1234567890123456789</span>)                          <span class="preprocessor"># =&gt; 1.07 EB</span>
number_to_human_size(<span class="number">1234567</span>, precision: <span class="number">2</span>)                        <span class="preprocessor"># =&gt; 1.2 MB</span>
number_to_human_size(<span class="number">483989</span>, precision: <span class="number">2</span>)                         <span class="preprocessor"># =&gt; 470 KB</span>
number_to_human_size(<span class="number">1234567</span>, precision: <span class="number">2</span>, separator: <span class="string">&#39;,&#39;</span>)        <span class="preprocessor"># =&gt; 1,2 MB</span>
number_to_human_size(<span class="number">1234567890123</span>, precision: <span class="number">5</span>)                  <span class="preprocessor"># =&gt; &quot;1.1228 TB&quot;</span>
number_to_human_size(<span class="number">524288000</span>, precision: <span class="number">5</span>)                      <span class="preprocessor"># =&gt; &quot;500 MB&quot;</span></code></pre>

