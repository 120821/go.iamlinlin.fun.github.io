---
layout: post
title: "rails--read more"
date: "2022-07-12"
categories: 
---
<p>参考：https://stackoverflow.com/questions/15262503/rails-truncate-with-a-read-more-toggle</p>

<p>进行views helper的书写，然后在视图页面调用即可</p>

<p>views helper</p>

<p>&nbsp; def show_contract_description origin_string<br />
&nbsp;&nbsp;&nbsp; part_1 = origin_string[0,130]<br />
&nbsp;&nbsp;&nbsp; return &quot;#{part_1}&quot;<br />
&nbsp; end</p>

<p>&nbsp;&lt;div class=&quot;project-des&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% if @contract.description.length &gt; 130 %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= raw(show_contract_description @contract.description) %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= link_to &#39;...Read more&#39;, &#39;&#39;, class: &quot;read-more-#{@contract.id}&quot; %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;script&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&#39;.read-more-&lt;%= @contract.id %&gt;&#39;).on(&#39;click&#39;, function(e) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.preventDefault()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(this).parent().html(&#39;&lt;%= escape_javascript raw(@contract.description) %&gt;&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/script&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% else %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= raw(@contract.description) rescue &#39;&#39; %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% end %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;</p>

<p>参照模板</p>

<pre class="default s-code-block">
<code class="hljs language-typescript">&lt;div&gt;
  &lt;% <span class="hljs-keyword">if</span> <span class="hljs-meta">@major</span>.<span class="hljs-property">glance</span>.<span class="hljs-property">length</span> &gt; <span class="hljs-number">250</span> %&gt;
    &lt;%= <span class="hljs-title function_">truncate</span>(<span class="hljs-meta">@major</span>.<span class="hljs-property">glance</span>, <span class="hljs-attr">length</span>: <span class="hljs-number">250</span>) %&gt;
    &lt;%= link_to <span class="hljs-string">&#39;...Read more&#39;</span>, <span class="hljs-string">&#39;&#39;</span>, <span class="hljs-attr">class</span>: <span class="hljs-string">&quot;read-more-#{@major.id}&quot;</span> %&gt;
    <span class="language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span>&gt;</span><span class="language-javascript">
      $(<span class="hljs-string">&#39;.read-more-&lt;%= @major.id %&gt;&#39;</span>).<span class="hljs-title function_">on</span>(<span class="hljs-string">&#39;click&#39;</span>, <span class="hljs-keyword">function</span>(<span class="hljs-params">e</span>) {
        e.<span class="hljs-title function_">preventDefault</span>()
        $(<span class="hljs-variable language_">this</span>).<span class="hljs-title function_">parent</span>().<span class="hljs-title function_">html</span>(<span class="hljs-string">&#39;&lt;%= escape_javascript @major.glance %&gt;&#39;</span>)
      })
    </span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span></span>
  &lt;% <span class="hljs-keyword">else</span> %&gt;
    &lt;%= <span class="hljs-meta">@major</span>.<span class="hljs-property">glance</span> %&gt;
  &lt;% end %&gt;
&lt;/div&gt;</code></pre>

