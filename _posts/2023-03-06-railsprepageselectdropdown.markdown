---
layout: post
title: "rails pre page select dropdown"
date: "2023-03-06"
categories: 
---
<p><a href="https://stackoverflow.com/questions/1281093/rails-showing-10-or-20-or-50-results-per-page-with-will-paginate-how-to">https://stackoverflow.com/questions/1281093/rails-showing-10-or-20-or-50-results-per-page-with-will-paginate-how-to</a></p>

<p>1.在controller index方法中增加：</p>

<pre>
<code>@servers = @servers.order(params[&quot;order_by&quot;] || &quot;id desc&quot;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .order(&#39;level asc&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .page(params[:page]).per(params[:per_page] || 500)</code></pre>

<p><code>2.在前端index页面增加：</code></p>

<pre>
<code>&lt;%= select_tag :per_page, options_for_select([100,200,500], params[:per_page].to_i),
       :onchange =&gt; &quot;if(this.value){window.location=&#39;?per_page=&#39;+this.value;}&quot; %&gt;
</code></pre>

