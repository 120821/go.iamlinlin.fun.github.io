---
layout: post
title: "Sortable Table Columns--header --click--order"
date: "2022-06-21"
categories: 
---
<div class="code_block">
<div class="code_header">ruby</div>

<div class="CodeRay">
<div class="code">
{% highlight %}
<span class="r">class</span> <span class="cl">ProductsController</span> &lt; <span class="co">ApplicationController</span>
  helper_method <span class="sy">:sort_column</span>, <span class="sy">:sort_direction</span>
  
  <span class="r">def</span> <span class="fu">index</span>
    <span class="iv">@products</span> = <span class="co">Product</span>.order(sort_column + <span class="s"><span class="dl">&quot;</span><span class="k"> </span><span class="dl">&quot;</span></span> + sort_direction)
  <span class="r">end</span>
  
  <span class="c"># ...</span>
  
  private
  
  <span class="r">def</span> <span class="fu">sort_column</span>
    <span class="co">Product</span>.column_names.include?(params[<span class="sy">:sort</span>]) ? params[<span class="sy">:sort</span>] : <span class="s"><span class="dl">&quot;</span><span class="k">name</span><span class="dl">&quot;</span></span>
  <span class="r">end</span>
  
  <span class="r">def</span> <span class="fu">sort_direction</span>
    <span class="s"><span class="dl">%w[</span><span class="k">asc desc</span><span class="dl">]</span></span>.include?(params[<span class="sy">:direction</span>]) ? params[<span class="sy">:direction</span>] : <span class="s"><span class="dl">&quot;</span><span class="k">asc</span><span class="dl">&quot;</span></span>
  <span class="r">end</span>
<span class="r">end</span>{% endhighlight %}
</div>
</div>
</div>

<div class="code_block">
<div class="code_header">application_helper.rb</div>

<div class="CodeRay">
<div class="code">
{% highlight %}
<span class="r">def</span> <span class="fu">sortable</span>(column, title = <span class="pc">nil</span>)
  title ||= column.titleize
  css_class = column == sort_column ? <span class="s"><span class="dl">&quot;</span><span class="k">current </span><span class="il"><span class="idl">#{</span>sort_direction<span class="idl">}</span></span><span class="dl">&quot;</span></span> : <span class="pc">nil</span>
  direction = column == sort_column &amp;&amp; sort_direction == <span class="s"><span class="dl">&quot;</span><span class="k">asc</span><span class="dl">&quot;</span></span> ? <span class="s"><span class="dl">&quot;</span><span class="k">desc</span><span class="dl">&quot;</span></span> : <span class="s"><span class="dl">&quot;</span><span class="k">asc</span><span class="dl">&quot;</span></span>
  link_to title, {<span class="sy">:sort</span> =&gt; column, <span class="sy">:direction</span> =&gt; direction}, {<span class="sy">:class</span> =&gt; css_class}
<span class="r">end</span>{% endhighlight %}
</div>
</div>
</div>

<div class="code_block">
<div class="code_header">products/index.html.erb</div>

<div class="CodeRay">
<div class="code">
{% highlight %}
<span class="ta">&lt;tr&gt;</span>
  <span class="ta">&lt;th&gt;</span><span class="il"><span class="idl">&lt;%=</span> sortable <span class="s"><span class="dl">&quot;</span><span class="k">name</span><span class="dl">&quot;</span></span> <span class="idl">%&gt;</span></span><span class="ta">&lt;/th&gt;</span>
  <span class="ta">&lt;th&gt;</span><span class="il"><span class="idl">&lt;%=</span> sortable <span class="s"><span class="dl">&quot;</span><span class="k">price</span><span class="dl">&quot;</span></span> <span class="idl">%&gt;</span></span><span class="ta">&lt;/th&gt;</span>
  <span class="ta">&lt;th&gt;</span><span class="il"><span class="idl">&lt;%=</span> sortable <span class="s"><span class="dl">&quot;</span><span class="k">released_at</span><span class="dl">&quot;</span></span>, <span class="s"><span class="dl">&quot;</span><span class="k">Released</span><span class="dl">&quot;</span></span> <span class="idl">%&gt;</span></span><span class="ta">&lt;/th&gt;</span>
<span class="ta">&lt;/tr&gt;</span>{% endhighlight %}
</div>
</div>
</div>

<div class="code_block">
<div class="code_header">application.css</div>

<div class="CodeRay">
<div class="code">
{% highlight %}
<span class="cl">.pretty</span> <span class="ty">th</span> <span class="cl">.current</span> {
  <span class="ke">padding-right</span>: <span class="fl">12px</span>;
  <span class="ke">background-repeat</span>: <span class="vl">no-repeat</span>;
  <span class="ke">background-position</span>: <span class="vl">right</span> <span class="vl">center</span>;
}

<span class="cl">.pretty</span> <span class="ty">th</span> <span class="cl">.asc</span> {
  <span class="ke">background-image</span>: <span class="s"><span class="dl">url(</span><span class="k">/images/up_arrow.gif</span><span class="dl">)</span></span>;
}

<span class="cl">.pretty</span> <span class="ty">th</span> <span class="cl">.desc</span> {
  <span class="ke">background-image</span>: <span class="s"><span class="dl">url(</span><span class="k">/images/down_arrow.gif</span><span class="dl">)</span></span>;
}{% endhighlight %}
</div>
</div>
</div>

