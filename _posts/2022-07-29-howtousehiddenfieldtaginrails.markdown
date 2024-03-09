---
layout: post
title: "How to use hidden field tag in rails"
date: "2022-07-29"
categories: 
---
<p>https://stackoverflow.com/questions/46565199/how-to-use-hidden-field-tag-in-rails</p>

<div class="lang-rb s-code-block" style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="hljs language-ruby">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= f.hidden_field <span class="hljs-symbol">:client_id</span>, <span class="hljs-number">1</span> %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= hidden_field_tag <span class="hljs-string">&#39;client_id&#39;</span>, <span class="hljs-string">&#39;1&#39;</span>&nbsp; %&gt;</code></div>

<div class="lang-rb s-code-block" style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="hljs language-ruby">&nbsp;&nbsp;&nbsp; 例如参数id的传递&nbsp; &lt;%= hidden_field_tag &#39;&#39;, <span class="hljs-string">:id</span>, params[:id] %&gt;</code></div>

<p>&lt;%= form_tag save_deploy_information_contracts_path(id: params[:id], name: params[:name]) do %&gt;<br />
&nbsp;&lt;%= hidden_field_tag :id, &#39;&#39;, value: params[:id] %&gt;</p>

<p>同样的效果</p>

<p>&nbsp;</p>

