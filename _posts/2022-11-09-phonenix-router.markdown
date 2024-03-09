---
layout: post
title: "phonenix - router 详细内容"
date: "2022-11-09"
categories: 
---
<p><a href="https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Routes.html">https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Routes.html</a></p>

<p><a href="https://hexdocs.pm/phoenix/routing.html">https://hexdocs.pm/phoenix/routing.html</a></p>

<p>查看所有的路由：</p>

<pre>
<code class="makeup shell" translate="no"><span>mix phx.routes</span>{% endhighlight %}

<p>在router文件增加：</p>

<pre>
<code>scope &quot;/&quot;, HelloWeb do
&nbsp; pipe_through :browser
&nbsp; get &quot;/&quot;, PageController, :index
&nbsp; resources &quot;/users&quot;, UserController
&nbsp; ...
end{% endhighlight %}

<p>然后使用命令查看所有的路由：（虽然没有user的controller，但是没有关系）</p>

<pre>
<code class="makeup shell" translate="no"><span>mix phx.routes</span>{% endhighlight %}

<p><img height="387" src="/uploads/ckeditor/pictures/704/image-20221109165628-1.png" width="1098" /></p>

<p>增加：</p>

{% highlight %}resources &quot;/posts&quot;, PostController, only: [:index, :show]{% endhighlight %}

<p>查看路由相对的增加：</p>

{% highlight %}post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /posts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :index<br />
post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /posts/:id&nbsp; HelloWeb.PostController :show{% endhighlight %}

<p>增加：</p>

{% highlight %}resources &quot;/comments&quot;, CommentController, except: [:delete]{% endhighlight %}

<p><a class="no-underline" href="https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Routes.html"><code class="inline">mix phx.routes</code></a></p>

<p>使用<code class="inline">iex -S mix可以进入相当于console 的环境</code></p>

<p>输入：</p>

<pre>
<code class="makeup elixir" translate="no"><span class="nc">HelloWeb.Router.Helpers</span><span class="o">.</span><span class="n">page_path</span><span class="p" data-group-id="4119530099-1">(</span><span class="nc">HelloWeb.Endpoint</span><span class="p">,</span><span class="w"> </span><span class="ss">:index</span><span class="p" data-group-id="4119530099-1">)</span>{% endhighlight %}

<pre><code class="makeup elixir" translate="no"><span class="p" data-group-id="4119530099-1">得到结果： &lsquo;/&rsquo;</span>{% endhighlight %}

<p><img height="66" src="/uploads/ckeditor/pictures/705/image-20221109170203-2.png" width="960" /></p>

<p>然后，我们就可以使用page_path进行跳转根页面</p>

{% highlight %}&lt;%= link &quot;Welcome Page!&quot;, to: Routes.page_path(@conn, :index) %&gt;{% endhighlight %}

<p>当我们为用户资源运行 mix phx.routes 时，它会将 user_path 列为每个输出行的路径辅助函数。&nbsp; 以下是每个动作的含义：</p>

{% highlight %}alias HelloWeb.Router.Helpers, as: Routes<br />
alias HelloWeb.Endpoint

Routes.user_path(Endpoint, :index)<br />
&quot;/users&quot;

Routes.user_path(Endpoint, :show, 17)<br />
&quot;/users/17&quot;

Routes.user_path(Endpoint, :new)<br />
&quot;/users/new&quot;

Routes.user_path(Endpoint, :create)<br />
&quot;/users&quot;

Routes.user_path(Endpoint, :edit, 37)<br />
&quot;/users/37/edit&quot;

Routes.user_path(Endpoint, :update, 37)<br />
&quot;/users/37&quot;

Routes.user_path(Endpoint, :delete, 17)<br />
&quot;/users/17&quot;{% endhighlight %}

<p><img height="444" src="/uploads/ckeditor/pictures/706/image-20221109170739-3.png" width="635" /></p>

<p>带有查询字符串的路径呢？&nbsp; 通过添加可选的键值对的第四个参数，路径助手将在查询字符串中返回这些对</p>

{% highlight %}Routes.user_path(Endpoint, :show, 17, admin: true, active: false)<br />
&quot;/users/17?admin=true&amp;active=false&quot;{% endhighlight %}

<p><img height="78" src="/uploads/ckeditor/pictures/707/image-20221109170834-4.png" width="845" /></p>

<p>如果我们需要完整的 URL 而不是路径怎么办？&nbsp; 只需将 _path 替换为 _url：</p>

{% highlight %}Routes.user_url(Endpoint, :index)<br />
&quot;http://localhost:4000/users&quot;{% endhighlight %}

<p><img height="77" src="/uploads/ckeditor/pictures/708/image-20221109170916-5.png" width="469" /></p>

<p>使用：</p>

{% highlight %}resources &quot;/users&quot;, UserController do<br />
&nbsp; resources &quot;/posts&quot;, PostController<br />
end{% endhighlight %}

<p>查看：</p>

{% highlight %}...<br />
user_post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /users/:user_id/posts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :index<br />
user_post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /users/:user_id/posts/:id/edit&nbsp; HelloWeb.PostController :edit<br />
user_post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /users/:user_id/posts/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :new<br />
user_post_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /users/:user_id/posts/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :show<br />
user_post_path&nbsp; POST&nbsp;&nbsp;&nbsp; /users/:user_id/posts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :create<br />
user_post_path&nbsp; PATCH&nbsp;&nbsp; /users/:user_id/posts/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /users/:user_id/posts/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :update<br />
user_post_path&nbsp; DELETE&nbsp; /users/:user_id/posts/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.PostController :delete<br />
...{% endhighlight %}

<p><img height="198" src="/uploads/ckeditor/pictures/709/image-20221109172203-6.png" width="1143" /></p>

<p>重新进入&nbsp; iex -S mix</p>

{% highlight %}alias HelloWeb.Endpoint<br />
HelloWeb.Router.Helpers.user_post_path(Endpoint, :show, 42, 17)<br />
&quot;/users/42/posts/17&quot;{% endhighlight %}

<p><img height="149" src="/uploads/ckeditor/pictures/710/image-20221109172409-7.png" width="879" /></p>

<p>或者：</p>

{% highlight %}alias HelloWeb.Router.Helpers, as: Routes<br />
alias HelloWeb.Endpoint<br />
Routes.user_post_path(Endpoint, :index, 42, active: true)<br />
&quot;/users/42/posts?active=true&quot;{% endhighlight %}

<p><img height="167" src="/uploads/ckeditor/pictures/711/image-20221109172519-8.png" width="879" /></p>

<p>在路由增加：</p>

{% highlight %}scope &quot;/admin&quot;, HelloWeb.Admin do<br />
&nbsp; pipe_through :browser

&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
end{% endhighlight %}

<p><img height="298" src="/uploads/ckeditor/pictures/712/image-20221109172806-9.png" width="1188" /></p>

<p>增加：</p>

{% highlight %}scope &quot;/&quot;, HelloWeb do<br />
&nbsp; pipe_through :browser

&nbsp; ...<br />
&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
end

scope &quot;/admin&quot;, HelloWeb.Admin do<br />
&nbsp; pipe_through :browser

&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
end{% endhighlight %}

<p>得到：</p>

{% highlight %}...<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :index<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id/edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :edit<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :new<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :show<br />
review_path&nbsp; POST&nbsp;&nbsp;&nbsp; /reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :create<br />
review_path&nbsp; PATCH&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :update<br />
review_path&nbsp; DELETE&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :delete<br />
...<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :index<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id/edit&nbsp; HelloWeb.Admin.ReviewController :edit<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :new<br />
review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :show<br />
review_path&nbsp; POST&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :create<br />
review_path&nbsp; PATCH&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
review_path&nbsp; DELETE&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :delete{% endhighlight %}

<p>我们得到的实际路线看起来都是正确的，除了每行开头的路径助手 review_path。&nbsp; 对于面向审核路线的用户和管理员路线，我们得到了相同的帮助程序，这是不正确的。</p>

<p>解决：</p>

{% highlight %}scope &quot;/admin&quot;, HelloWeb.Admin, as: :admin do<br />
&nbsp; pipe_through :browser

&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
end{% endhighlight %}

<p>得到：</p>

{% highlight %}...<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :index<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id/edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :edit<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :new<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :show<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; POST&nbsp;&nbsp;&nbsp; /reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :create<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; PATCH&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; review_path&nbsp; DELETE&nbsp; /reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.ReviewController :delete<br />
...<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :index<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id/edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :edit<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :new<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :show<br />
admin_review_path&nbsp; POST&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :create<br />
admin_review_path&nbsp; PATCH&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
admin_review_path&nbsp; DELETE&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :delete{% endhighlight %}

<p>进入console ： iex -S mix</p>

{% highlight %}HelloWeb.Router.Helpers.review_path(HelloWeb.Endpoint, :index)<br />
&quot;/reviews&quot;

HelloWeb.Router.Helpers.admin_review_path(HelloWeb.Endpoint, :show, 1234)<br />
&quot;/admin/reviews/1234&quot;{% endhighlight %}

<p><img height="115" src="/uploads/ckeditor/pictures/713/image-20221109174557-10.png" width="1154" /></p>

<p>修改：</p>

{% highlight %}scope &quot;/admin&quot;, HelloWeb.Admin, as: :admin do<br />
&nbsp; pipe_through :browser

&nbsp; resources &quot;/images&quot;,&nbsp; ImageController<br />
&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
&nbsp; resources &quot;/users&quot;,&nbsp;&nbsp; UserController<br />
end{% endhighlight %}

<p>查看路由：</p>

{% highlight %}...<br />
&nbsp;admin_image_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/images&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :index<br />
&nbsp;admin_image_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/images/:id/edit&nbsp;&nbsp; HelloWeb.Admin.ImageController :edit<br />
&nbsp;admin_image_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/images/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :new<br />
&nbsp;admin_image_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/images/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :show<br />
&nbsp;admin_image_path&nbsp; POST&nbsp;&nbsp;&nbsp; /admin/images&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :create<br />
&nbsp;admin_image_path&nbsp; PATCH&nbsp;&nbsp; /admin/images/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /admin/images/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :update<br />
&nbsp;admin_image_path&nbsp; DELETE&nbsp; /admin/images/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ImageController :delete<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :index<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id/edit&nbsp; HelloWeb.Admin.ReviewController :edit<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :new<br />
admin_review_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :show<br />
admin_review_path&nbsp; POST&nbsp;&nbsp;&nbsp; /admin/reviews&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :create<br />
admin_review_path&nbsp; PATCH&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :update<br />
admin_review_path&nbsp; DELETE&nbsp; /admin/reviews/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.ReviewController :delete<br />
&nbsp; admin_user_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :index<br />
&nbsp; admin_user_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/users/:id/edit&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :edit<br />
&nbsp; admin_user_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/users/new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :new<br />
&nbsp; admin_user_path&nbsp; GET&nbsp;&nbsp;&nbsp;&nbsp; /admin/users/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :show<br />
&nbsp; admin_user_path&nbsp; POST&nbsp;&nbsp;&nbsp; /admin/users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :create<br />
&nbsp; admin_user_path&nbsp; PATCH&nbsp;&nbsp; /admin/users/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PUT&nbsp;&nbsp;&nbsp;&nbsp; /admin/users/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :update<br />
&nbsp; admin_user_path&nbsp; DELETE&nbsp; /admin/users/:id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HelloWeb.Admin.UserController :delete{% endhighlight %}

<p>然后增加：</p>

{% highlight %}scope &quot;/api&quot;, HelloWeb.Api, as: :api do<br />
&nbsp; pipe_through :api

&nbsp; scope &quot;/v1&quot;, V1, as: :v1 do<br />
&nbsp;&nbsp;&nbsp; resources &quot;/images&quot;,&nbsp; ImageController<br />
&nbsp;&nbsp;&nbsp; resources &quot;/reviews&quot;, ReviewController<br />
&nbsp;&nbsp;&nbsp; resources &quot;/users&quot;,&nbsp;&nbsp; UserController<br />
&nbsp; end<br />
end{% endhighlight %}

<p><img height="662" src="/uploads/ckeditor/pictures/714/image-20221109174912-11.png" width="1248" /></p>

<p>&nbsp;</p>

