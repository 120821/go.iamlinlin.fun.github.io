---
layout: post
title: "rails devise 登录时间 登录ip"
date: "2023-06-04"
categories: 
---
<p>在 `Manager` 模型中覆盖 Devise 提供的 `trackable.rb` 模块的 `to_trackable_array` 方法，自定义需要返回的登录信息数组</p>

<p>修改manager的model</p>

<pre>
<code>class Manager &lt; ApplicationRecord

&nbsp; devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

&nbsp; def to_trackable_array
&nbsp;&nbsp;&nbsp; [current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip]
&nbsp; end

end</code></pre>

<p>增加列到manager</p>

<pre>
<code>class AddTrackableFieldsToManager &lt; ActiveRecord::Migration[7.0]

&nbsp; def change

&nbsp;&nbsp;&nbsp; add_column :managers, :current_sign_in_at, :datetime

&nbsp;&nbsp;&nbsp; add_column :managers, :last_sign_in_at, :datetime

&nbsp;&nbsp;&nbsp; add_column :managers, :current_sign_in_ip, :string

&nbsp;&nbsp;&nbsp; add_column :managers, :last_sign_in_ip, :string

&nbsp; end

end</code></pre>

<p>该方法会将当前用户的 `current_sign_in_at`、`last_sign_in_at`、`current_sign_in_ip`、`last_sign_in_ip` 四个字段分别添加到一个数组中，并返回该数组。<br />
<br />
然后，我们可以在应用程序的某个需要显示登录信息的地方，例如管理员个人资料页面，使用以下代码来显示 `current_sign_in_ip` 和 `last_sign_in_ip`：</p>

<p>在视图页面可以这样显示</p>

<p>&lt;p&gt;当前IP地址: &lt;%= current_manager.current_sign_in_ip %&gt;&lt;/p&gt;<br />
&lt;p&gt;上次登录IP地址: &lt;%= current_manager.last_sign_in_ip %&gt;&lt;/p&gt;</p>

<p>这样就可以在页面上显示当前管理员的登录 IP 地址和上次登录 IP 地址了。注意，如果管理员还没有登录过，则 `current_sign_in_ip` 和 `last_sign_in_ip` 字段都为空</p>

