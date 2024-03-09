---
layout: post
title: "rails form select_tag default all"
date: "2023-03-07"
categories: 
---
<p><a href="https://stackoverflow.com/questions/4632226/rails-select-form-tag-how-to-add-a-default-all-option">https://stackoverflow.com/questions/4632226/rails-select-form-tag-how-to-add-a-default-all-option</a></p>

<p>Simply include a <code>:include_blank =&gt; &#39;All People&#39;</code> option in your <code>select_tag</code>:</p>

<pre>
<code>&lt;%= select_tag &quot;people&quot;, options_from_collection_for_select(@people, &quot;id&quot;, &quot;name&quot;), :include_blank =&gt; &#39;All People&#39; %&gt;</code></pre>

<p>&nbsp;</p>

