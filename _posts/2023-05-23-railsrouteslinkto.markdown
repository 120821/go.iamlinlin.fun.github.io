---
layout: post
title: "rails routes link_to"
date: "2023-05-23"
categories: 
---
<div class="md md_doc_content" id="code_1684749211288_5">
<p>Rails基于资源的路由是一种常用的RESTful风格的路由方式，它将URL与应用程序中的控制器和操作方法相对应。举个例子，假设我们有一个简单的博客应用，其中有文章和评论两个资源，那么我们可以通过Rails基于资源的路由来定义这两个资源的路由，如下所示：</p>

<pre>
<code># config/routes.rb

Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
end</code></pre>

<p>在这个路由配置中，我们使用<code>resources</code>方法来定义了文章和评论两个资源。这个方法会自动为文章和评论生成七个标准RESTful路由，包括<code>index</code>、<code>new</code>、<code>create</code>、<code>show</code>、<code>edit</code>、<code>update</code>和<code>destroy</code>。此外，我们还使用了嵌套路由来表示评论属于某篇文章，这样就可以通过<code>/articles/:article_id/comments</code>来访问某篇文章的所有评论。</p>

<p>在视图中，我们可以使用<code>link_to</code>方法来生成链接，例如：</p>

<pre>
<code>&lt;%= link_to &quot;查看文章&quot;, article_path(article) %&gt;</code></pre>

<p>这个链接会生成类似于<code>/articles/:id</code>的URL，其中<code>:id</code>表示文章的ID。类似地，我们也可以使用<code>link_to</code>方法来生成评论的链接，例如：</p>

<pre>
<code>&lt;%= link_to &quot;查看评论&quot;, article_comment_path(article, comment) %&gt;</code></pre>

<p>这个链接会生成类似于<code>/articles/:article_id/comments/:id</code>的URL，其中<code>:article_id</code>表示文章的ID，<code>:id</code>表示评论的ID。</p>
</div>

