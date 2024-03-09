---
layout: post
title: "rails 增加表的列后，怎么把列增加在params permit,怎么修改新建编辑详情列表页面，怎么区分哪个文件是新建编辑详情列表。"
date: "2023-05-31"
categories: 
---
<div id="rtf5581">
<div>
<p>增加表的列后，要想将该列增加到 <code>params</code> 的 <code>permit</code> 中，需要在对应的控制器文件中的 <code>permit</code> 方法中添加该列的名称。例如，如果要将列名为 <code>new_column</code> 的列加入到 <code>User</code> 表的 <code>permit</code> 中，可以在 <code>UsersController</code> 的 <code>user_params</code> 方法中添加 <code>:new_column</code>，如下所示：</p>

<pre>
<code>def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :new_column)
end</code></pre>

<p>需要修改新建、编辑、详情列表页面时，要先确定使用的是哪个模板引擎，常用的有 ERB、Haml、Slim 等。在 Rails 中，控制器中的方法一般与模板文件同名，例如 <code>users_controller.rb</code> 中的 <code>index</code> 方法对应的视图文件为 <code>index.html.erb</code>。</p>

<p>新建编辑详情列表页面通常在 <code>views</code> 文件夹下的与控制器同名的文件夹中。例如 <code>UsersController</code> 的视图文件位于 <code>views/users</code> 目录下。其中，<code>new.html.erb</code> 和 <code>edit.html.erb</code> 分别是新建和编辑页面的模板文件，<code>show.html.erb</code> 是详情页面的模板文件，<code>index.html.erb</code> 是列表页面的模板文件。</p>

<p>要区分不同的文件，可以查看文件的内容、文件名、文件路径等信息。</p>
</div>
</div>

