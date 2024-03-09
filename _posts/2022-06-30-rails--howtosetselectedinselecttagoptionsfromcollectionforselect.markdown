---
layout: post
title: "rails-- How to set "selected" in select_tag/options_from_collection_for_select"
date: "2022-06-30"
categories: 
---
<p>参考：<a href="https://stackoverflow.com/questions/6720370/how-to-set-selected-in-select-tag-options-from-collection-for-select">https://stackoverflow.com/questions/6720370/how-to-set-selected-in-select-tag-options-from-collection-for-select</a></p>

<p><a href="https://apidock.com/rails/v5.2.3/ActionView/Helpers/FormOptionsHelper/options_from_collection_for_select">https://apidock.com/rails/v5.2.3/ActionView/Helpers/FormOptionsHelper/options_from_collection_for_select</a></p>

<pre>
<code><a href="https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/options_from_collection_for_select">options_from_collection_for_select</a>(@people, &#39;id&#39;, &#39;name&#39;, 1)</code>

<code>&lt;%= 
  select_tag &quot;name_dropdown&quot;, 
  options_from_collection_for_select(@models, &quot;friendly_id&quot;, &quot;name&quot;, @model.id) 
%&gt;</code></pre>

<p><strong>在form表单中可以使用</strong></p>

<pre>
<code>&lt;%= form.select &quot;contract_creator_id&quot;, options_from_collection_for_select(ContractCreator.all, :id, :name, @contract.contract_creator_id) %&gt;</code></pre>

<p><strong><code>boolean:</code></strong></p>

<pre>
<code>&nbsp;&lt;%= form.select :is_manually_deployed, [[&#39;手动部署&#39;, true], [&#39;自动部署&#39;, false]] %&gt;</code></pre>

