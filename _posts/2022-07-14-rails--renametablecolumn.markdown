---
layout: post
title: "rails --rename table column"
date: "2022-07-14"
categories: 
---
<p>参考：https://stackoverflow.com/questions/46940405/rails-5-rename-table-migration</p>

<pre class="default s-code-block">
<code class="hljs language-scss">$ rails g migration change_<span class="hljs-selector-attr">[old_table_name]</span>_to_<span class="hljs-selector-attr">[new_table_name]</span>
</code></pre>

<p>Within the <code>change</code> method in the migration file generated, add this:</p>

<pre class="default s-code-block">
<code class="hljs language-less"><span class="hljs-selector-tag">def</span> <span class="hljs-selector-tag">change</span>
  <span class="hljs-selector-tag">rename_table</span> :<span class="hljs-selector-attr">[old_table_name]</span>, :<span class="hljs-selector-attr">[new_table_name]</span>
<span class="hljs-selector-tag">end</span>
</code></pre>

<p>Change <code>[old_table_name]</code> and <code>[new_table_name]</code> in both cases.</p>

