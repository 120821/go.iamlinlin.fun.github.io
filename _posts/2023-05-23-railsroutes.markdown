---
layout: post
title: "rails routes"
date: "2023-05-23"
categories: 
---
<div class="md md_doc_content" id="code_1684811092835_1">
<p>Rails的路由是指将HTTP请求映射到相应的控制器和动作的机制。它定义了URL路径与控制器和动作之间的关系。</p>

<p>在Rails中，有两种类型的路由：RESTful路由和非RESTful路由。</p>

<p>RESTful路由是一组定义常见HTTP操作（如GET、POST、PUT、DELETE）的路由规则，它们可以自动映射到控制器的不同动作，例如index、show、new、create、edit、update和destroy。这些路由通过Rails中的资源（resources）方法来定义。</p>

<p>非RESTful路由则是手动定义的路由，它们将特定的URL路径映射到具有给定名称的控制器动作。这些路由通过Rails中的get、post、put和delete方法来定义。</p>

<div class="md md_doc_content" id="code_1684749211288_3">
<p>Rails基于资源的路由是一种RESTful风格的路由，它通过将URL与控制器和操作相关联来简化路由定义。以下是基于资源的路由的一个例子：</p>

<p>假设我们有一个名为&ldquo;Posts&rdquo;的资源，它有以下操作：index、show、new、create、edit、update和destroy。</p>

<p>我们可以使用以下形式的基于资源的路由来定义这些操作：</p>

<pre>
<code>resources :posts</code></pre>

<p>这样就定义了7个路由，分别对应于上述7个操作，并且它们的URL分别为：</p>

<pre>
<code>GET /posts
GET /posts/:id
GET /posts/new
POST /posts
GET /posts/:id/edit
PATCH/PUT /posts/:id
DELETE /posts/:id</code></pre>

<p>这些路由都是基于资源的路由种类，它们是：</p>

<ol>
	<li>index - 显示所有资源的列表</li>
	<li>show - 显示单个资源的详细信息</li>
	<li>new - 显示用于创建新资源的表单</li>
	<li>create - 创建新资源并将其添加到数据库中</li>
	<li>edit - 显示用于更新现有资源的表单</li>
	<li>update - 更新现有资源并将其更新到数据库中</li>
	<li>destroy - 从数据库中删除现有资源</li>
</ol>
</div>
</div>

