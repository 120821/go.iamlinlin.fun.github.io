---
layout: post
title: "rails pagy"
date: "2023-04-11"
categories: 
---
<p>refer:&nbsp; <a href="https://hackernoon.com/pagination-with-pagy-bulma-oe1m32ik">https://hackernoon.com/pagination-with-pagy-bulma-oe1m32ik</a></p>

<p>1.增加gem</p>

<pre>
<code>gem <span style="color:#b9ca4a">&#39;pagy&#39;</span></code></pre>

<p>2.增加配置文件：</p>

<pre>
<code><span style="color:#969896">config/initializer/pagy.rb</span></code></pre>

<div class="code-container">
<pre>
<code><span style="color:#969896"># config/initializer/pagy.rb</span>

<span style="color:#c397d8">require</span> <span style="color:#b9ca4a">&#39;pagy/extras/bulma&#39;</span>
<span style="color:#c397d8">require</span> <span style="color:#b9ca4a">&#39;pagy/extras/array&#39;</span></code></pre>
</div>

<p>3.在controller使用：</p>

<div class="code-container">
<pre>
<code><span style="color:#969896"># app/controllers/ApplicationController.rb</span>

<span style="color:#c397d8">class</span> <span style="color:#7aa6da">ApplicationController</span> &lt; ActionController::Base
  <span style="color:#c397d8">include</span> Pagy::Backend
<span style="color:#c397d8">end</span></code></pre>

<p>4.在helper增加：</p>

<div class="code-container">
<pre>
<code><span style="color:#969896"># app/helper/ApplicationHelper.rb</span>

<span style="color:#c397d8">module</span> <span style="color:#7aa6da">ApplicationHelper</span>
  <span style="color:#c397d8">include</span> Pagy::Frontend
<span style="color:#c397d8">end</span></code></pre>

<p>5.在controller使用pagy</p>

<pre>
<code># app/controllers/user_controllers.rb

class UsersController <span style="color:#d54e53">&lt; ApplicationController
  def show
    @user = <span style="color:#b9ca4a">User.find(params[:user_id])</span>
    @pagy, @friends = <span style="color:#b9ca4a">pagy(@user.friends,</span> items: 3) 
  end

  def index
    @users = <span style="color:#b9ca4a">User.all</span>
    @pagy, @nofriends = <span style="color:#b9ca4a">pagy(User.all_except(current_user),</span> page: params[:page], items: 9)
  end
.
.
  def friends
    @user = <span style="color:#b9ca4a">User.find(params[:user_id])</span>
    @pagy_a, @friends = <span style="color:#b9ca4a">pagy_array(@user.friends,</span> items: 9)
  end
end</span></code></pre>

<p>6.在view使用：</p>

<pre>
<code>At the bottom of 
# app/views/users/users.html.erb

&lt;%= pagy_bulma_nav(@pagy).html_safe %&gt;</code></pre>

<p><code>或者</code></p>

<pre>
<code># app/views/micrpost/friends.html.erb

&lt;%= pagy_bulma_nav(@pagy).html_safe %&gt;</code></pre>

<p>如果渲染的是数组：</p>

<pre>
<code>At the bottom <span style="color:#c397d8">of</span> 
# app/views/users/friends.html.erb

&lt;%= pagy_bulma_nav(@pagy_a).html_safe %&gt;</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
</div>

