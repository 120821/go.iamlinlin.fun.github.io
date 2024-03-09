---
layout: post
title: "Rails Routing from the Outside In"
date: "2022-08-23"
categories: 
---
<p><a href="http://linlin.fun/blogs/529">http://linlin.fun/blogs/529</a></p>

<p>自动生成：</p>

<pre>
<code>rails&nbsp;g&nbsp;model&nbsp;Foo&nbsp;

rails&nbsp;g&nbsp;scaffold_controller&nbsp;Admin::Foo&nbsp;--model-name=Foo</code></pre>

<p>或者自己编写(写路由，controller， views， migrate， 。。）：</p>

<table>
	<thead>
		<tr>
			<th>HTTP Verb</th>
			<th>Path</th>
			<th>Controller#Action</th>
			<th>Used for</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>GET</td>
			<td>/photos</td>
			<td>photos#index</td>
			<td>display a list of all photos</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/photos/new</td>
			<td>photos#new</td>
			<td>return an HTML form for creating a new photo</td>
		</tr>
		<tr>
			<td>POST</td>
			<td>/photos</td>
			<td>photos#create</td>
			<td>create a new photo</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/photos/:id</td>
			<td>photos#show</td>
			<td>display a specific photo</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/photos/:id/edit</td>
			<td>photos#edit</td>
			<td>return an HTML form for editing a photo</td>
		</tr>
		<tr>
			<td>PATCH/PUT</td>
			<td>/photos/:id</td>
			<td>photos#update</td>
			<td>update a specific photo</td>
		</tr>
		<tr>
			<td>DELETE</td>
			<td>/photos/:id</td>
			<td>photos#destroy</td>
			<td>delete a specific photo</td>
		</tr>
	</tbody>
</table>

<pre>
<code>namespace :admin do

&nbsp; resources :articles, :comments

end</code></pre>

<p>或：</p>

<pre>
<code>resources :articles, path: &#39;/admin/articles&#39;</code></pre>

<p>产生：</p>

<table>
	<thead>
		<tr>
			<th>HTTP Verb</th>
			<th>Path</th>
			<th>Controller#Action</th>
			<th>Named Route Helper</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>GET</td>
			<td>/admin/articles</td>
			<td>admin/articles#index</td>
			<td>admin_articles_path</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/admin/articles/new</td>
			<td>admin/articles#new</td>
			<td>new_admin_article_path</td>
		</tr>
		<tr>
			<td>POST</td>
			<td>/admin/articles</td>
			<td>admin/articles#create</td>
			<td>admin_articles_path</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/admin/articles/:id</td>
			<td>admin/articles#show</td>
			<td>admin_article_path(:id)</td>
		</tr>
		<tr>
			<td>GET</td>
			<td>/admin/articles/:id/edit</td>
			<td>admin/articles#edit</td>
			<td>edit_admin_article_path(:id)</td>
		</tr>
		<tr>
			<td>PATCH/PUT</td>
			<td>/admin/articles/:id</td>
			<td>admin/articles#update</td>
			<td>admin_article_path(:id)</td>
		</tr>
		<tr>
			<td>DELETE</td>
			<td>/admin/articles/:id</td>
			<td>admin/articles#destroy</td>
			<td>admin_article_path(:id)</td>
		</tr>
	</tbody>
</table>

