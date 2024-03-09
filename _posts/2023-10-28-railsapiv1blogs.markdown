---
layout: post
title: "rails写api/v1/blogs/接口，显示列表和详情数据"
date: "2023-10-28"
categories: 
---
<p>1 写一个文件<code>app/controllers/api/v1/blogs_controller.rb</code></p>

<p><code>内容是这样的：</code></p>

<pre>
<code><span style="color:#dcc6e0">module</span> <span style="color:#00e0e0">Api</span>
  <span style="color:#dcc6e0">module</span> <span style="color:#00e0e0">V1</span>
    <span style="color:#dcc6e0">class</span> <span style="color:#00e0e0">BlogsController</span> &lt; ApplicationController
      <span style="color:#dcc6e0">def</span> <span style="color:#00e0e0">index</span>
        blogs = Blog.select(:id, :title, :created_at).where(&#39;is_public = ?&#39;, &#39;true&#39;).order(&#39;created_at desc&#39;).page(params[:page] || 1).per(100)
        count = blogs.count rescue 0
</code><code>        render <span style="color:#abe338">json:</span> {blogs:blogs, count: count}
      <span style="color:#dcc6e0">end</span>

      <span style="color:#dcc6e0">def</span> <span style="color:#00e0e0">show</span>
        blog = Blog.find(params[<span style="color:#abe338">:id</span>])
        render <span style="color:#abe338">json:</span> blog
      <span style="color:#dcc6e0">end</span>
    <span style="color:#dcc6e0">end</span>
  <span style="color:#dcc6e0">end</span>
<span style="color:#dcc6e0">end</span></code></pre>

<p>2 配置路由：</p>

<p><code>在config/routes.rb增加：</code></p>

<pre>
<code>Rails.application.routes.draw <span style="color:#dcc6e0">do</span>
  namespace <span style="color:#abe338">:api</span> <span style="color:#dcc6e0">do</span>
    namespace <span style="color:#abe338">:v1</span> <span style="color:#dcc6e0">do</span>
      resources <span style="color:#abe338">:blogs</span>, <span style="color:#abe338">only:</span> [<span style="color:#abe338">:index</span>, <span style="color:#abe338">:show</span>]
    <span style="color:#dcc6e0">end</span>
  <span style="color:#dcc6e0">end</span>
<span style="color:#dcc6e0">end</span></code></pre>

<p>3 重启</p>

<pre>
<code>rails <span style="color:#dcc6e0">server</span></code></pre>

