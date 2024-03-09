---
layout: post
title: "WebSockets in Rails 7 with Action Cable"
date: "2022-08-10"
categories: 
---
<p>参考:&nbsp; <a href="https://iridakos.com/programming/2019/04/04/creating-chat-application-rails-websockets">https://iridakos.com/programming/2019/04/04/creating-chat-application-rails-websockets</a></p>

<p>代码：<a href="https://github.com/120821/chatroom-rails">https://github.com/120821/chatroom-rails</a></p>

<pre>
<code class="bash">创建APP：</code>rails new chatroom-rails --database=postgresql
</pre>

<pre>
注意不要使用这个命令：rails new rails-app-chatroom（这样会报错，因为使用的是postgres，不是sql）</pre>

<p>修改数据库，创建数据库，启动server</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/185/image-20220810165635-1.png" width="1920" /></p>

<p id="users-and-devise"><strong>Users and devise</strong></p>

<p>使用devise，修改Gemfile，增加了gem，先bundle 然后：</p>

<pre class="highlight">
<code>rails generate devise:install
</code></pre>

<p><code>创建user：</code></p>

<pre class="highlight">
<code>rails generate devise User username:string
</code></pre>

<p><code class="highlighter-rouge">修改migrate的内容：db/migrate/&lt;datetime&gt;_devise_create_users.rb</code></p>

<pre class="highlight">
<code> <span class="n">add_index</span> <span class="ss">:users</span><span class="p">,</span>  <span class="ss">:username</span><span class="p">,</span>             <span class="ss">unique: </span><span class="kp">true
找到这一行，然后进行修改为这样</span></code></pre>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">t</span><span class="p">.</span><span class="nf">string</span> <span class="ss">:username</span><span class="p">,</span> <span class="ss">null: </span><span class="kp">false</span>
</code></pre>

<p>完善user的model</p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">t</span><span class="p">.</span><span class="nf">string</span> <span class="ss">:username</span><span class="p">,</span> <span class="ss">null: </span><span class="kp">false</span>
</code></pre>

<p>然后</p>

<pre class="highlight">
<code>rails db:migrate
</code></pre>
</div>
</div>
</div>
</div>

<p id="rooms-and-messages"><strong>Rooms and messages</strong></p>

<p>创建room</p>

<pre class="highlight">
<code>rails generate resource Room name:string:uniq</code></pre>

<p><code>创建room内容</code></p>

<pre class="highlight">
<code>rails generate resource RoomMessage room:references user:references message:text</code></pre>

<p><code>完善model:</code> <code class="highlighter-rouge">app/models/room.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">has_many</span> <span class="ss">:room_messages</span><span class="p">,</span> <span class="ss">dependent: :destroy</span><span class="p">,</span>
                         <span class="ss">inverse_of: :room</span>
</code></pre>

<p><code class="highlighter-rouge">完善model：app/models/room_message.rb:</code></p>

<p><code class="highlighter-rouge">migrate：</code></p>

<pre class="highlight">
<code>rails db:migrate</code></pre>

<p>修改<code class="highlighter-rouge">config/routes.rb</code> ：</p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="no">Rails</span><span class="p">.</span><span class="nf">application</span><span class="p">.</span><span class="nf">routes</span><span class="p">.</span><span class="nf">draw</span> <span class="k">do</span>
  <span class="n">devise_for</span> <span class="ss">:users</span>

  <span class="n">root</span> <span class="ss">controller: :rooms</span><span class="p">,</span> <span class="ss">action: :index</span>

  <span class="n">resources</span> <span class="ss">:room_messages</span>
  <span class="n">resources</span> <span class="ss">:rooms</span>
<span class="k">end</span></code></pre>

<p><code>然后会看到没有视图，增加即可</code></p>

<p><img height="265" src="/uploads/ckeditor/pictures/186/image-20220810171217-1.png" width="729" /></p>
</div>
</div>
</div>
</div>

<p>完善<code class="highlighter-rouge">app/controllers/rooms_controller.rb</code></p>

<p><code class="highlighter-rouge">class RoomsController &lt; ApplicationController<br />
&nbsp; def index<br />
&nbsp; end<br />
end</code></p>

<p>增加：app/views/rooms/index.html.erb</p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;h1&gt;</span>Rooms index<span class="nt">&lt;/h1&gt;</span>
</code></pre>

<p>然后看到：</p>

<p><img height="127" src="/uploads/ckeditor/pictures/187/image-20220810171431-2.png" width="470" /></p>

<p>修改：<em>app/controllers/application_controller.rb</em></p>

<pre class="highlight">
<code><span class="n">before_action</span> <span class="ss">:authenticate_user!</span>
</code></pre>

<p><img height="328" src="/uploads/ckeditor/pictures/188/image-20220810171532-3.png" width="563" /></p>

<p>增加样式：Add bootstrap</p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">gem</span> <span class="s1">&#39;bootstrap&#39;</span><span class="p">,</span> <span class="s1">&#39;~&gt; 4.3.1&#39;</span>
<span class="n">gem</span> <span class="s1">&#39;jquery-rails&#39;</span>
</code></pre>

<p>安装：bundle install</p>

<p><code class="highlighter-rouge">修改：app/assets/stylesheets/application.css</code></p>

<p><code class="highlighter-rouge">替换其他内容：</code></p>

<div class="language-css highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">@import</span> <span class="s1">&quot;bootstrap&quot;</span><span class="p">;</span>
</code></pre>

<p>新增： <code class="highlighter-rouge">app/assets/javascript/application.js</code></p>
</div>
</div>
</div>
</div>
</div>
</div>

<p><code class="highlighter-rouge">在//= require_tree .前边增加：</code></p>

<pre class="highlight">
<code><span class="c1">//= require jquery3</span>
<span class="c1">//= require popper</span>
<span class="c1">//= require bootstrap-sprockets</span>
</code></pre>

<p id="add-simple_form"><strong>Add simple_form</strong></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">gem</span> <span class="s1">&#39;simple_form&#39;</span>
</code></pre>

<p>bundle install</p>

<pre class="highlight">
<code>创建：rails generate simple_form:install <span class="nt">--bootstrap</span></code></pre>

<p><strong>使用引导程序和简单表单设计视图</strong></p>

<pre class="highlight">
<code>rails generate devise:views</code></pre>

<p><code>完善视图页面：</code></p>

<p><code class="highlighter-rouge">app/views/devise/registrations/new.html.erb</code>和<code class="highlighter-rouge">app/views/devise/sessions/new.html.erb</code></p>

<pre class="highlight">
<code><span class="cp">替换：</span></code></pre>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="cp">&lt;%=</span> <span class="n">f</span><span class="p">.</span><span class="nf">button</span> <span class="ss">:submit</span><span class="p">,</span> <span class="s2">&quot;Sign up&quot;</span> <span class="cp">%&gt;</span>
</code></pre>

<p>为：</p>
</div>
</div>

<pre class="highlight">
<code><span class="cp">&lt;%=</span> <span class="n">f</span><span class="p">.</span><span class="nf">button</span> <span class="ss">:submit</span><span class="p">,</span> <span class="s2">&quot;Sign up&quot;</span><span class="p">,</span> <span class="ss">class: </span><span class="s1">&#39;btn btn-success&#39;</span> <span class="cp">%&gt;</span>
</code></pre>

<p><code>修改</code><code class="highlighter-rouge">app/views/layouts/application.html.erb</code></p>

<p><code class="highlighter-rouge">替换为</code></p>

<pre class="highlight">
<code><span class="cp">&lt;!DOCTYPE html&gt;</span>
<span class="nt">&lt;html&gt;</span>
  <span class="nt">&lt;head&gt;</span>
    <span class="nt">&lt;title&gt;</span>RailsChatTutorial<span class="nt">&lt;/title&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">csrf_meta_tags</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">csp_meta_tag</span> <span class="cp">%&gt;</span>

    <span class="cp">&lt;%=</span> <span class="n">stylesheet_link_tag</span>    <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="ss">media: </span><span class="s1">&#39;all&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">javascript_include_tag</span> <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/head&gt;</span>

  <span class="nt">&lt;body&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;container&quot;</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;row&quot;</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col-12&quot;</span><span class="nt">&gt;</span>
          <span class="cp">&lt;%=</span> <span class="k">yield</span> <span class="cp">%&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/body&gt;</span>
<span class="nt">&lt;/html&gt;</span>
</code></pre>

<p>重启服务server，视图页面</p>

<p><img height="419" src="/uploads/ckeditor/pictures/189/image-20220810173315-4.png" width="790" /></p>

<p>根据提示进行增加内容：<code>app/assets/config/manifest.js</code></p>

<pre>
<code> //= link application.js
</code></pre>

<p><img height="351" src="/uploads/ckeditor/pictures/190/image-20220810173416-5.png" width="540" /></p>

<p>视图并未生效，查看原因---已经解决。没有导入bootstrap的css。增加了一个文件。</p>

<p>清理未使用的组件（如果rails大于5，可以不用做了）</p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="c1"># Use CoffeeScript for .coffee assets and views</span>
<span class="n">gem</span> <span class="s1">&#39;coffee-rails&#39;</span><span class="p">,</span> <span class="s1">&#39;~&gt; 4.2&#39;</span>
<span class="c1"># Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks</span>
<span class="n">gem</span> <span class="s1">&#39;turbolinks&#39;</span><span class="p">,</span> <span class="s1">&#39;~&gt; 5&#39;</span>
</code></pre>

<p><code class="highlighter-rouge">删除部分：app/assets/javascripts/application.js</code></p>

<pre class="highlight">
<code><span class="c1">//= require turbolinks</span></code></pre>

<p><code><span class="c1">修改：</span></code><code class="highlighter-rouge">app/views/layouts/application.html.erb</code></p>

<pre class="highlight">
<code> <span class="cp">&lt;%=</span> <span class="n">stylesheet_link_tag</span>    <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="ss">media: </span><span class="s1">&#39;all&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">javascript_include_tag</span> <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
</code></pre>

<p>为：</p>

<pre class="highlight">
<code> <span class="cp">&lt;%=</span> <span class="n">stylesheet_link_tag</span>    <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="ss">media: </span><span class="s1">&#39;all&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">javascript_include_tag</span> <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="s1">&#39;data-turbolinks-track&#39;</span><span class="p">:</span> <span class="s1">&#39;reload&#39;</span> <span class="cp">%&gt;</span>
</code></pre>

<pre class="highlight">
<code>命令行：rails tmp:cache:clear</code></pre>

<p>添加导航栏</p>

<p>增加目录：<code class="highlighter-rouge">app/views/shared</code></p>

<p><code class="highlighter-rouge">增加：</code> <code class="highlighter-rouge">_navigation_bar.html.erb</code></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;nav</span> <span class="na">class=</span><span class="s">&quot;navbar navbar-expand-lg navbar-dark bg-dark justify-content-between&quot;</span><span class="nt">&gt;</span>
  <span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">&quot;navbar-brand&quot;</span> <span class="na">href=</span><span class="s">&quot;#&quot;</span><span class="nt">&gt;</span>Rails chat tutorial<span class="nt">&lt;/a&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">class=</span><span class="s">&quot;navbar-toggler&quot;</span> <span class="na">type=</span><span class="s">&quot;button&quot;</span> <span class="na">data-toggle=</span><span class="s">&quot;collapse&quot;</span> <span class="na">data-target=</span><span class="s">&quot;#nav-bar-collapse&quot;</span> <span class="na">aria-controls=</span><span class="s">&quot;navbarColor01&quot;</span> <span class="na">aria-expanded=</span><span class="s">&quot;false&quot;</span> <span class="na">aria-label=</span><span class="s">&quot;Toggle navigation&quot;</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">&quot;navbar-toggler-icon&quot;</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;/button&gt;</span>

  <span class="cp">&lt;%</span> <span class="k">if</span> <span class="n">current_user</span> <span class="cp">%&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;dropdown&quot;</span><span class="nt">&gt;</span>
      <span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">&quot;nav-link dropdown-toggle&quot;</span> <span class="na">href=</span><span class="s">&quot;#&quot;</span> <span class="na">id=</span><span class="s">&quot;navbarDropdown&quot;</span> <span class="na">role=</span><span class="s">&quot;button&quot;</span> <span class="na">data-toggle=</span><span class="s">&quot;dropdown&quot;</span> <span class="na">aria-haspopup=</span><span class="s">&quot;true&quot;</span> <span class="na">aria-expanded=</span><span class="s">&quot;false&quot;</span><span class="nt">&gt;</span>
        <span class="nt">&lt;img</span> <span class="na">class=</span><span class="s">&quot;avatar&quot;</span> <span class="na">src=</span><span class="s">&quot;</span><span class="cp">&lt;%=</span> <span class="n">gravatar_url</span><span class="p">(</span><span class="n">current_user</span><span class="p">)</span> <span class="cp">%&gt;</span><span class="s">&quot;</span><span class="nt">&gt;</span>
        <span class="cp">&lt;%=</span> <span class="n">current_user</span><span class="p">.</span><span class="nf">username</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;/a&gt;</span>

      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;dropdown-menu dropdown-menu-right&quot;</span> <span class="na">aria-labelledby=</span><span class="s">&quot;navbarDropdown&quot;</span><span class="nt">&gt;</span>
        <span class="cp">&lt;%=</span> <span class="n">link_to</span> <span class="s1">&#39;Logout&#39;</span><span class="p">,</span> <span class="n">destroy_user_session_path</span><span class="p">,</span> <span class="ss">method: :delete</span><span class="p">,</span> <span class="ss">class: </span><span class="s1">&#39;dropdown-item&#39;</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/nav&gt;</span>
</code></pre>

<p>完善：<code class="highlighter-rouge">app/helpers/application_helper.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">def</span> <span class="nf">gravatar_url</span><span class="p">(</span><span class="n">user</span><span class="p">)</span>
  <span class="n">gravatar_id</span> <span class="o">=</span> <span class="no">Digest</span><span class="o">::</span><span class="no">MD5</span><span class="o">::</span><span class="n">hexdigest</span><span class="p">(</span><span class="n">user</span><span class="p">.</span><span class="nf">email</span><span class="p">).</span><span class="nf">downcase</span>
  <span class="n">url</span> <span class="o">=</span> <span class="s2">&quot;https://gravatar.com/avatar/</span><span class="si">#{</span><span class="n">gravatar_id</span><span class="si">}</span><span class="s2">.png&quot;</span>
<span class="k">end</span>
</code></pre>

<p>新建：<code class="highlighter-rouge">app/assets/stylesheets/rails-chat-tutorial.scss</code></p>

<pre class="highlight">
<code><span class="nc">.avatar</span> <span class="p">{</span>
  <span class="nl">max-height</span><span class="p">:</span><span class="m">30px</span><span class="p">;</span>
  <span class="nl">border-radius</span><span class="p">:</span> <span class="m">15px</span><span class="p">;</span>
  <span class="nl">width</span><span class="p">:</span><span class="nb">auto</span><span class="p">;</span>
  <span class="nl">vertical-align</span><span class="p">:</span><span class="nb">middle</span><span class="p">;</span>
<span class="p">}</span></code>
</pre>

<p>打开：<code class="highlighter-rouge">application.scss</code></p>

<p><code class="highlighter-rouge">增加：</code></p>

<pre class="highlight">
<code>@import &quot;rails-chat-tutorial&quot;</code></pre>

<p><code>编辑：</code><code class="highlighter-rouge">app/views/layouts/application.html.erb</code></p>

<pre class="highlight">
<code><span class="cp">&lt;!DOCTYPE html&gt;</span>
<span class="nt">&lt;html&gt;</span>
  <span class="nt">&lt;head&gt;</span>
    <span class="nt">&lt;title&gt;</span>RailsChatTutorial<span class="nt">&lt;/title&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">csrf_meta_tags</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">csp_meta_tag</span> <span class="cp">%&gt;</span>

    <span class="cp">&lt;%=</span> <span class="n">stylesheet_link_tag</span>    <span class="s1">&#39;application&#39;</span><span class="p">,</span> <span class="ss">media: </span><span class="s1">&#39;all&#39;</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">javascript_include_tag</span> <span class="s1">&#39;application&#39;</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/head&gt;</span>

  <span class="nt">&lt;body&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;container&quot;</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;row&quot;</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col-12&quot;</span><span class="nt">&gt;</span>
          <span class="cp">&lt;%=</span> <span class="n">render</span> <span class="ss">partial: </span><span class="s1">&#39;shared/navigation_bar&#39;</span> <span class="cp">%&gt;</span>
          <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;my-3&quot;</span><span class="nt">&gt;</span>
            <span class="cp">&lt;%=</span> <span class="k">yield</span> <span class="cp">%&gt;</span>
          <span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/body&gt;</span>
<span class="nt">&lt;/html&gt;</span>
</code></pre>
</div>
</div>
</div>
</div>

<p><img height="208" src="/uploads/ckeditor/pictures/191/image-20220810200431-1.png" width="1157" /></p>

<p><img height="194" src="/uploads/ckeditor/pictures/192/image-20220810200544-1.png" width="1259" /></p>

<p>打开：<code class="highlighter-rouge">app/controllers/rooms_controller.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">def</span> <span class="nf">index</span>
  <span class="vi">@rooms</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">all</span>
<span class="k">end</span>
</code></pre>

<p>打开：<code class="highlighter-rouge">app/views/rooms/index.html.erb</code></p>

<pre class="highlight">
<code><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;row&quot;</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col-12 col-md-3&quot;</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;mb-3&quot;</span><span class="nt">&gt;</span>
      <span class="cp">&lt;%=</span> <span class="n">link_to</span> <span class="n">new_room_path</span><span class="p">,</span> <span class="ss">class: </span><span class="s2">&quot;btn btn-primary&quot;</span> <span class="k">do</span> <span class="cp">%&gt;</span>
        Create a room
      <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
    <span class="nt">&lt;/div&gt;</span>

    <span class="cp">&lt;%</span> <span class="k">if</span> <span class="vi">@rooms</span><span class="p">.</span><span class="nf">present?</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;nav</span> <span class="na">class=</span><span class="s">&quot;nav flex-column&quot;</span><span class="nt">&gt;</span>
        <span class="cp">&lt;%</span> <span class="vi">@rooms</span><span class="p">.</span><span class="nf">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">room</span><span class="o">|</span> <span class="cp">%&gt;</span>
          <span class="cp">&lt;%=</span> <span class="n">link_to</span> <span class="n">room</span><span class="p">.</span><span class="nf">name</span><span class="p">,</span> <span class="n">room_path</span><span class="p">(</span><span class="n">room</span><span class="p">),</span> <span class="ss">class: </span><span class="s2">&quot;nav-link room-nav-link&quot;</span> <span class="cp">%&gt;</span>
        <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;/nav&gt;</span>
    <span class="cp">&lt;%</span> <span class="k">else</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;text-muted&quot;</span><span class="nt">&gt;</span>
        The are no rooms
      <span class="nt">&lt;/div&gt;</span>
    <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/div&gt;</span>

  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col&quot;</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;alert alert-primary&quot;</span><span class="nt">&gt;</span>
      <span class="nt">&lt;h4</span> <span class="na">class=</span><span class="s">&quot;alert-heading&quot;</span><span class="nt">&gt;</span>
        Welcome to the RailsChatTutorial!
      <span class="nt">&lt;/h4&gt;</span>

      <span class="nt">&lt;p&gt;</span>
        We need to talk.
      <span class="nt">&lt;/p&gt;</span>

      <span class="nt">&lt;hr</span> <span class="nt">/&gt;</span>

      <span class="nt">&lt;p&gt;</span>
        You can create or join a room from the sidebar.
      <span class="nt">&lt;/p&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
</code></pre>

<p><img height="354" src="/uploads/ckeditor/pictures/193/image-20220810200756-2.png" width="1237" /></p>
</div>
</div>

<p>打开：<code class="highlighter-rouge">app/controllers/rooms_controller.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">class</span> <span class="nc">RoomsController</span> <span class="o">&lt;</span> <span class="no">ApplicationController</span>
  <span class="c1"># Loads:</span>
  <span class="c1"># @rooms = all rooms</span>
  <span class="c1"># @room = current room when applicable</span>
  <span class="n">before_action</span> <span class="ss">:load_entities</span>

  <span class="k">def</span> <span class="nf">index</span>
    <span class="vi">@rooms</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">all</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">new</span>
    <span class="vi">@room</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">new</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">create</span>
    <span class="vi">@room</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">new</span> <span class="n">permitted_parameters</span>

    <span class="k">if</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">save</span>
      <span class="n">flash</span><span class="p">[</span><span class="ss">:success</span><span class="p">]</span> <span class="o">=</span> <span class="s2">&quot;Room </span><span class="si">#{</span><span class="vi">@room</span><span class="p">.</span><span class="nf">name</span><span class="si">}</span><span class="s2"> was created successfully&quot;</span>
      <span class="n">redirect_to</span> <span class="n">rooms_path</span>
    <span class="k">else</span>
      <span class="n">render</span> <span class="ss">:new</span>
    <span class="k">end</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">edit</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">update</span>
    <span class="k">if</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">update_attributes</span><span class="p">(</span><span class="n">permitted_parameters</span><span class="p">)</span>
      <span class="n">flash</span><span class="p">[</span><span class="ss">:success</span><span class="p">]</span> <span class="o">=</span> <span class="s2">&quot;Room </span><span class="si">#{</span><span class="vi">@room</span><span class="p">.</span><span class="nf">name</span><span class="si">}</span><span class="s2"> was updated successfully&quot;</span>
      <span class="n">redirect_to</span> <span class="n">rooms_path</span>
    <span class="k">else</span>
      <span class="n">render</span> <span class="ss">:new</span>
    <span class="k">end</span>
  <span class="k">end</span>

  <span class="kp">protected</span>

  <span class="k">def</span> <span class="nf">load_entities</span>
    <span class="vi">@rooms</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">all</span>
    <span class="vi">@room</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">find</span><span class="p">(</span><span class="n">params</span><span class="p">[</span><span class="ss">:id</span><span class="p">])</span> <span class="k">if</span> <span class="n">params</span><span class="p">[</span><span class="ss">:id</span><span class="p">]</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">permitted_parameters</span>
    <span class="n">params</span><span class="p">.</span><span class="nf">require</span><span class="p">(</span><span class="ss">:room</span><span class="p">).</span><span class="nf">permit</span><span class="p">(</span><span class="ss">:name</span><span class="p">)</span>
  <span class="k">end</span>
<span class="k">end</span>
</code></pre>

<p>新建<code class="highlighter-rouge">app/views/rooms/_form.html.erb</code></p>

<pre class="highlight">
<code><span class="cp">&lt;%=</span> <span class="n">simple_form_for</span> <span class="vi">@room</span> <span class="k">do</span> <span class="o">|</span><span class="n">form</span><span class="o">|</span> <span class="cp">%&gt;</span>
  <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">input</span> <span class="ss">:name</span> <span class="cp">%&gt;</span>
  <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">submit</span> <span class="s2">&quot;Save&quot;</span><span class="p">,</span> <span class="ss">class: </span><span class="s1">&#39;btn btn-success&#39;</span> <span class="cp">%&gt;</span>
<span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
</code></pre>

<p><em>app/views/rooms/new.html.erb</em></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;h1&gt;</span>
  Creating a room  
<span class="nt">&lt;/h1&gt;</span>

<span class="cp">&lt;%=</span> <span class="n">render</span> <span class="ss">partial: </span><span class="s1">&#39;form&#39;</span> <span class="cp">%&gt;</span>
</code></pre>
</div>
</div>

<p><em>app/views/rooms/edit.html.erb</em></p>
</div>
</div>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;h1&gt;</span>
  Editing room <span class="cp">&lt;%=</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">name</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/h1&gt;</span>

<span class="cp">&lt;%=</span> <span class="n">render</span> <span class="ss">partial: </span><span class="s1">&#39;form&#39;</span> <span class="cp">%&gt;</span>
</code></pre>

<p><img height="365" src="/uploads/ckeditor/pictures/194/image-20220810201245-3.png" width="1226" /></p>
</div>
</div>

<p>&nbsp;</p>

<p><code class="highlighter-rouge">增加：app/assets/stylesheets/rails-chat-tutorial.scss（</code>$primary 可以直接替换为颜色，blue，red 等。例如（blue，45%）<code class="highlighter-rouge">）</code></p>

<div class="language-css highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nc">.room-nav-link</span> <span class="p">{</span>
  <span class="nl">border</span><span class="p">:</span> <span class="m">1px</span> <span class="nb">solid</span> <span class="n">lighten</span><span class="p">(</span><span class="err">$</span><span class="n">primary</span><span class="p">,</span> <span class="m">40%</span><span class="p">);</span>
  <span class="nl">background</span><span class="p">:</span> <span class="n">lighten</span><span class="p">(</span><span class="err">$</span><span class="n">primary</span><span class="p">,</span> <span class="m">45%</span><span class="p">);</span>

  <span class="err">&amp;</span> <span class="err">+</span> <span class="err">.room-nav-link</span> <span class="err">{</span>
    <span class="nl">border-top</span><span class="p">:</span> <span class="m">0</span> <span class="nb">none</span><span class="p">;</span>
  <span class="p">}</span>
<span class="err">}</span>
</code></pre>
</div>
</div>

<p>&nbsp;</p>

<p><img height="287" src="/uploads/ckeditor/pictures/197/image-20220810224218-1.png" width="933" /><code class="highlighter-rouge">增加：app/views/rooms/_rooms.html.erb</code></p>

<pre class="highlight">
<code><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;mb-3&quot;</span><span class="nt">&gt;</span>
  <span class="cp">&lt;%=</span> <span class="n">link_to</span> <span class="n">new_room_path</span><span class="p">,</span> <span class="ss">class: </span><span class="s1">&#39;btn btn-primary&#39;</span> <span class="k">do</span> <span class="cp">%&gt;</span>
    Create a room
  <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/div&gt;</span>

<span class="cp">&lt;%</span> <span class="k">if</span> <span class="vi">@rooms</span><span class="p">.</span><span class="nf">present?</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;nav</span> <span class="na">class=</span><span class="s">&quot;nav flex-column&quot;</span><span class="nt">&gt;</span>
    <span class="cp">&lt;%</span> <span class="vi">@rooms</span><span class="p">.</span><span class="nf">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">room</span><span class="o">|</span> <span class="cp">%&gt;</span>
      <span class="cp">&lt;%=</span> <span class="n">link_to</span> <span class="n">room</span><span class="p">.</span><span class="nf">name</span><span class="p">,</span> <span class="n">room_path</span><span class="p">(</span><span class="n">room</span><span class="p">),</span> <span class="ss">class: </span><span class="s1">&#39;nav-link room-nav-link&#39;</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/nav&gt;</span>
<span class="cp">&lt;%</span> <span class="k">else</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;text-muted&quot;</span><span class="nt">&gt;</span>
    The are no rooms
  <span class="nt">&lt;/div&gt;</span>
<span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
</code></pre>

<p>修改：<code class="highlighter-rouge">app/views/rooms/index.html.erb</code></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;row&quot;</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col-12 col-md-3&quot;</span><span class="nt">&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">render</span> <span class="ss">partial: </span><span class="s1">&#39;rooms&#39;</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/div&gt;</span>

  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col&quot;</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;alert alert-primary&quot;</span><span class="nt">&gt;</span>
      <span class="nt">&lt;h4</span> <span class="na">class=</span><span class="s">&quot;alert-heading&quot;</span><span class="nt">&gt;</span>
        Welcome to the RailsChatTutorial!
      <span class="nt">&lt;/h4&gt;</span>

      <span class="nt">&lt;p&gt;</span>
        We need to talk.
      <span class="nt">&lt;/p&gt;</span>

      <span class="nt">&lt;hr</span> <span class="nt">/&gt;</span>

      <span class="nt">&lt;p&gt;</span>
        You can create or join a room from the sidebar.
      <span class="nt">&lt;/p&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
</code></pre>

<p>增加：<code class="highlighter-rouge">app/controllers/rooms_controller.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">def</span> <span class="nf">show</span>
  <span class="vi">@room_message</span> <span class="o">=</span> <span class="no">RoomMessage</span><span class="p">.</span><span class="nf">new</span> <span class="ss">room: </span><span class="vi">@room</span>
  <span class="vi">@room_messages</span> <span class="o">=</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">room_messages</span><span class="p">.</span><span class="nf">includes</span><span class="p">(</span><span class="ss">:user</span><span class="p">)</span>
<span class="k">end</span>
</code></pre>
</div>
</div>

<p>新建：<code class="highlighter-rouge">app/views/rooms/show.html.erb</code></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;h1&gt;</span>
  <span class="cp">&lt;%=</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">name</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/h1&gt;</span>

<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;row&quot;</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col-12 col-md-3&quot;</span><span class="nt">&gt;</span>
    <span class="cp">&lt;%=</span> <span class="n">render</span> <span class="ss">partial: </span><span class="s1">&#39;rooms&#39;</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/div&gt;</span>

  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;col&quot;</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;chat&quot;</span><span class="nt">&gt;</span>
      <span class="cp">&lt;%</span> <span class="vi">@room_messages</span><span class="p">.</span><span class="nf">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">room_message</span><span class="o">|</span> <span class="cp">%&gt;</span>
        <span class="cp">&lt;%=</span> <span class="n">room_message</span> <span class="cp">%&gt;</span>
      <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
    <span class="nt">&lt;/div&gt;</span>

    <span class="cp">&lt;%=</span> <span class="n">simple_form_for</span> <span class="vi">@room_message</span><span class="p">,</span> <span class="ss">remote: </span><span class="kp">true</span> <span class="k">do</span> <span class="o">|</span><span class="n">form</span><span class="o">|</span> <span class="cp">%&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;input-group mb-3&quot;</span><span class="nt">&gt;</span>
        <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">input</span> <span class="ss">:message</span><span class="p">,</span> <span class="ss">as: :string</span><span class="p">,</span>
                                 <span class="ss">wrapper: </span><span class="kp">false</span><span class="p">,</span>
                                 <span class="ss">label: </span><span class="kp">false</span><span class="p">,</span>
                                 <span class="ss">input_html: </span><span class="p">{</span>
                                   <span class="ss">class: </span><span class="s1">&#39;chat-input&#39;</span>
                                 <span class="p">}</span> <span class="cp">%&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;input-group-append&quot;</span><span class="nt">&gt;</span>
          <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">submit</span> <span class="s2">&quot;Send&quot;</span><span class="p">,</span> <span class="ss">class: </span><span class="s1">&#39;btn btn-primary chat-input&#39;</span> <span class="cp">%&gt;</span>
        <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;/div&gt;</span>

      <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">input</span> <span class="ss">:room_id</span><span class="p">,</span> <span class="ss">as: :hidden</span> <span class="cp">%&gt;</span>
    <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
</code></pre>

<p>增加：app/assets/stylesheets/rails-chat-tutorial.scss</p>

<div class="language-css highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nc">.chat</span> <span class="p">{</span>
  <span class="nl">border</span><span class="p">:</span> <span class="m">1px</span> <span class="nb">solid</span> <span class="n">lighten</span><span class="p">(</span><span class="err">$</span><span class="n">secondary</span><span class="p">,</span> <span class="m">40%</span><span class="p">);</span>
  <span class="nl">background</span><span class="p">:</span> <span class="n">lighten</span><span class="p">(</span><span class="err">$</span><span class="n">secondary</span><span class="p">,</span> <span class="m">50%</span><span class="p">);</span>
  <span class="nl">height</span><span class="p">:</span> <span class="m">50vh</span><span class="p">;</span>
  <span class="nl">border-radius</span><span class="p">:</span> <span class="m">5px</span> <span class="m">5px</span> <span class="m">0</span> <span class="m">0</span><span class="p">;</span>
  <span class="nl">overflow-y</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
<span class="p">}</span>

<span class="nc">.chat-input</span> <span class="p">{</span>
  <span class="nl">border-top</span><span class="p">:</span> <span class="m">0</span> <span class="nb">none</span><span class="p">;</span>
  <span class="nl">border-radius</span><span class="p">:</span> <span class="m">0</span> <span class="m">0</span> <span class="m">5px</span> <span class="m">5px</span><span class="p">;</span>
<span class="p">}</span>
</code></pre>
</div>
</div>
</div>
</div>
</div>
</div>

<p>$secondary可以替换为black&nbsp; red 等</p>

<p><strong>安装redis</strong></p>

<pre class="highlight">
<code><span class="nb">sudo </span>apt update
<span class="nb">sudo </span>apt <span class="nb">install </span>redis-server
</code></pre>

<p>检查：</p>

<pre class="highlight">
<code>$ redis-cli
127.0.0.1:6379&gt; ping
PONG
</code></pre>

<p>修改配置（替换）： <code class="highlighter-rouge">config/cable.yml</code></p>

<div class="language-yml highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="na">development</span><span class="pi">:</span>
  <span class="na">adapter</span><span class="pi">:</span> <span class="s">redis</span>
  <span class="na">url</span><span class="pi">:</span> <span class="s">&lt;%= ENV.fetch(&quot;REDIS_URL&quot;) { &quot;redis://localhost:6379/1&quot; } %&gt;</span>
  <span class="na">channel_prefix</span><span class="pi">:</span> <span class="s">rails-chat-tutorial_development</span>

<span class="na">test</span><span class="pi">:</span>
  <span class="na">adapter</span><span class="pi">:</span> <span class="s">async</span>

<span class="na">production</span><span class="pi">:</span>
  <span class="na">adapter</span><span class="pi">:</span> <span class="s">redis</span>
  <span class="na">url</span><span class="pi">:</span> <span class="s">&lt;%= ENV.fetch(&quot;REDIS_URL&quot;) { &quot;redis://localhost:6379/1&quot; } %&gt;</span>
  <span class="na">channel_prefix</span><span class="pi">:</span> <span class="s">rails-chat-tutorial_production</span>
</code></pre>
</div>
</div>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">安装：gem</span> <span class="s1">&#39;redis&#39;</span>
</code></pre>

<p><code>新建:</code><code class="highlighter-rouge">config/initializers/warden_hooks.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="no">Warden</span><span class="o">::</span><span class="no">Manager</span><span class="p">.</span><span class="nf">after_set_user</span> <span class="k">do</span> <span class="o">|</span><span class="n">user</span><span class="p">,</span><span class="n">auth</span><span class="p">,</span><span class="n">opts</span><span class="o">|</span>
  <span class="n">scope</span> <span class="o">=</span> <span class="n">opts</span><span class="p">[</span><span class="ss">:scope</span><span class="p">]</span>
  <span class="n">auth</span><span class="p">.</span><span class="nf">cookies</span><span class="p">.</span><span class="nf">signed</span><span class="p">[</span><span class="s2">&quot;</span><span class="si">#{</span><span class="n">scope</span><span class="si">}</span><span class="s2">.id&quot;</span><span class="p">]</span> <span class="o">=</span> <span class="n">user</span><span class="p">.</span><span class="nf">id</span>
<span class="k">end</span>

<span class="no">Warden</span><span class="o">::</span><span class="no">Manager</span><span class="p">.</span><span class="nf">before_logout</span> <span class="k">do</span> <span class="o">|</span><span class="n">user</span><span class="p">,</span> <span class="n">auth</span><span class="p">,</span> <span class="n">opts</span><span class="o">|</span>
  <span class="n">scope</span> <span class="o">=</span> <span class="n">opts</span><span class="p">[</span><span class="ss">:scope</span><span class="p">]</span>
  <span class="n">auth</span><span class="p">.</span><span class="nf">cookies</span><span class="p">.</span><span class="nf">signed</span><span class="p">[</span><span class="s2">&quot;</span><span class="si">#{</span><span class="n">scope</span><span class="si">}</span><span class="s2">.id&quot;</span><span class="p">]</span> <span class="o">=</span> <span class="kp">nil</span>
<span class="k">end</span>
</code></pre>

<p>完善：<code class="highlighter-rouge">app/channels/application_cable/connection.rb</code></p>

<pre class="highlight">
<code><span class="k">module</span> <span class="nn">ApplicationCable</span>
  <span class="k">class</span> <span class="nc">Connection</span> <span class="o">&lt;</span> <span class="no">ActionCable</span><span class="o">::</span><span class="no">Connection</span><span class="o">::</span><span class="no">Base</span>
    <span class="n">identified_by</span> <span class="ss">:current_user</span>

    <span class="k">def</span> <span class="nf">connect</span>
      <span class="nb">self</span><span class="p">.</span><span class="nf">current_user</span> <span class="o">=</span> <span class="n">find_verified_user</span>
    <span class="k">end</span>

    <span class="kp">private</span>

    <span class="k">def</span> <span class="nf">find_verified_user</span>
      <span class="k">if</span> <span class="n">verified_user</span> <span class="o">=</span> <span class="no">User</span><span class="p">.</span><span class="nf">find_by</span><span class="p">(</span><span class="ss">id: </span><span class="n">cookies</span><span class="p">.</span><span class="nf">signed</span><span class="p">[</span><span class="s1">&#39;user.id&#39;</span><span class="p">])</span>
        <span class="n">verified_user</span>
      <span class="k">else</span>
        <span class="n">reject_unauthorized_connection</span>
      <span class="k">end</span>
    <span class="k">end</span>
  <span class="k">end</span>
<span class="k">end</span>
</code></pre>

<p>创建：<code class="highlighter-rouge">app/channels/room_channel.rb</code></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">class</span> <span class="nc">RoomChannel</span> <span class="o">&lt;</span> <span class="no">ApplicationCable</span><span class="o">::</span><span class="no">Channel</span>
  <span class="k">def</span> <span class="nf">subscribed</span>
    <span class="n">room</span> <span class="o">=</span> <span class="no">Room</span><span class="p">.</span><span class="nf">find</span> <span class="n">params</span><span class="p">[</span><span class="ss">:room</span><span class="p">]</span>
    <span class="n">stream_for</span> <span class="n">room</span>

    <span class="c1"># or</span>
    <span class="c1"># stream_from &quot;room_#{params[:room]}&quot;</span>
  <span class="k">end</span>
<span class="k">end</span>
</code></pre>
</div>
</div>
</div>
</div>
</div>
</div>

<p>解释：</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 一旦建立了对频道的订阅，就会调用 subscribed 方法，并且它负责设置来回发送数据的流。</p>

<p>&nbsp;稍后我们将配置房间页面代码以请求订阅此频道并传递房间参数。</p>

<p>&nbsp;我们有两个选择：</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 使用 stream_for：这样 Rails 会自动为给定对象（在我们的例子中是房间）生成一个流名称，例如：&ldquo;room:asdfwer234&rdquo;。&nbsp; 当我们之后想要将数据广播到流中时，我们所要做的就是调用 RoomChannel.broadcast_to(room_object, data) 在这种情况下，Rails 从 room_object 解析流名称。&nbsp; 换句话说，我们不必手动解析必须在其中发送数据的流名称（请参阅下一项）。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当频道处理绑定到模型的订阅时，此选项可用，例如在我们的案例中，特定房间<br />
&nbsp;&nbsp;&nbsp;&nbsp; 使用stream_from：我们手动定义流的名称，稍后，当我们要广播到流时，我们必须使用：ActionCable.server.broadcast(&quot;room_#{a_room_id_here}&quot;, data)。</p>

<p>&nbsp;在这里阅读更多。<a href="https://guides.rubyonrails.org/action_cable_overview.html#streams">https://guides.rubyonrails.org/action_cable_overview.html#streams</a></p>

<p>创建action：<code class="highlighter-rouge">app/controllers/room_messages_controller.rb</code></p>

<pre class="highlight">
<code><span class="k">def</span> <span class="nf">create</span>
  <span class="vi">@room_message</span> <span class="o">=</span> <span class="no">RoomMessage</span><span class="p">.</span><span class="nf">create</span> <span class="ss">user: </span><span class="n">current_user</span><span class="p">,</span>
                                     <span class="ss">room: </span><span class="vi">@room</span><span class="p">,</span>
                                     <span class="ss">message: </span><span class="n">params</span><span class="p">.</span><span class="nf">dig</span><span class="p">(</span><span class="ss">:room_message</span><span class="p">,</span> <span class="ss">:message</span><span class="p">)</span>

  <span class="no">RoomChannel</span><span class="p">.</span><span class="nf">broadcast_to</span> <span class="vi">@room</span><span class="p">,</span> <span class="vi">@room_message</span>
<span class="k">end</span>
</code></pre>

<p>打开：<code class="highlighter-rouge">app/models/user.rb</code></p>

<pre class="highlight">
<code>def gravatar_url
  gravatar_id = Digest::MD5::hexdigest(email).downcase
  &quot;https://gravatar.com/avatar/#{gravatar_id}.png&quot;
end</code></pre>

<p>我们已经在 app/helpers/application_helper.rb 文件中实现了这个，我们将不再使用它，所以删除它。--不理解，稍后看看吧。删除哪一个。--TODO</p>

<p><samp><code class="highlighter-rouge">更新：app/views/shared/_navigation_bar.html.erb</code></samp></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;img</span> <span class="na">class=</span><span class="s">&quot;avatar&quot;</span> <span class="na">src=</span><span class="s">&quot;</span><span class="cp">&lt;%=</span> <span class="n">current_user</span><span class="p">.</span><span class="nf">gravatar_url</span> <span class="cp">%&gt;</span><span class="s">&quot;</span><span class="nt">&gt;</span>
</code></pre>

<p>更新：<code class="highlighter-rouge">app/views/rooms/show.html.erb</code></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;img</span> <span class="na">src=</span><span class="s">&quot;</span><span class="cp">&lt;%=</span> <span class="n">room_message</span><span class="p">.</span><span class="nf">user</span><span class="p">.</span><span class="nf">gravatar_url</span> <span class="cp">%&gt;</span><span class="s">&quot;</span> <span class="na">class=</span><span class="s">&quot;avatar&quot;</span> <span class="na">alt=</span><span class="s">&quot;&quot;</span><span class="nt">&gt;</span>
</code></pre>

<p>更新：<em>app/models/room_message.rb</em></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="k">def</span> <span class="nf">as_json</span><span class="p">(</span><span class="n">options</span><span class="p">)</span>
  <span class="k">super</span><span class="p">(</span><span class="n">options</span><span class="p">).</span><span class="nf">merge</span><span class="p">(</span><span class="ss">user_avatar_url: </span><span class="n">user</span><span class="p">.</span><span class="nf">gravatar_url</span><span class="p">)</span>
<span class="k">end</span>
</code></pre>
</div>
</div>
</div>
</div>
</div>
</div>

<p>订阅房间流</p>

<p><code class="highlighter-rouge">打开：app/views/rooms/show.html.erb</code></p>

<p><code class="highlighter-rouge">把定义chat的div更改为：</code></p>

<div class="language-erb highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">&quot;chat&quot;</span> <span class="na">data-channel-subscribe=</span><span class="s">&quot;room&quot;</span> <span class="na">data-room-id=</span><span class="s">&quot;</span><span class="cp">&lt;%=</span> <span class="vi">@room</span><span class="p">.</span><span class="nf">id</span> <span class="cp">%&gt;</span><span class="s">&quot;</span><span class="nt">&gt;</span>
</code></pre>
</div>
</div>

<p>说明：我们添加了两个数据属性，一个定义我们要订阅哪个频道，一个定义我们在哪个房间。</p>

<p>&nbsp;在文件末尾，添加以下代码段：</p>

<p>创建：<code class="highlighter-rouge">app/assets/javascripts/channels/room_channel.js</code></p>

<div class="language-js highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="nx">$</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span>
  <span class="nx">$</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">[data-channel-subscribe=&quot;room&quot;]</span><span class="dl">&#39;</span><span class="p">).</span><span class="nx">each</span><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">index</span><span class="p">,</span> <span class="nx">element</span><span class="p">)</span> <span class="p">{</span>
    <span class="kd">var</span> <span class="nx">$element</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">element</span><span class="p">),</span>
        <span class="nx">room_id</span> <span class="o">=</span> <span class="nx">$element</span><span class="p">.</span><span class="nx">data</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">room-id</span><span class="dl">&#39;</span><span class="p">)</span>
        <span class="nx">messageTemplate</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">[data-role=&quot;message-template&quot;]</span><span class="dl">&#39;</span><span class="p">);</span>

    <span class="nx">$element</span><span class="p">.</span><span class="nx">animate</span><span class="p">({</span> <span class="na">scrollTop</span><span class="p">:</span> <span class="nx">$element</span><span class="p">.</span><span class="nx">prop</span><span class="p">(</span><span class="dl">&quot;</span><span class="s2">scrollHeight</span><span class="dl">&quot;</span><span class="p">)},</span> <span class="mi">1000</span><span class="p">)</span>        

    <span class="nx">App</span><span class="p">.</span><span class="nx">cable</span><span class="p">.</span><span class="nx">subscriptions</span><span class="p">.</span><span class="nx">create</span><span class="p">(</span>
      <span class="p">{</span>
        <span class="na">channel</span><span class="p">:</span> <span class="dl">&quot;</span><span class="s2">RoomChannel</span><span class="dl">&quot;</span><span class="p">,</span>
        <span class="na">room</span><span class="p">:</span> <span class="nx">room_id</span>
      <span class="p">},</span>
      <span class="p">{</span>
        <span class="na">received</span><span class="p">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">data</span><span class="p">)</span> <span class="p">{</span>
          <span class="kd">var</span> <span class="nx">content</span> <span class="o">=</span> <span class="nx">messageTemplate</span><span class="p">.</span><span class="nx">children</span><span class="p">().</span><span class="nx">clone</span><span class="p">(</span><span class="kc">true</span><span class="p">,</span> <span class="kc">true</span><span class="p">);</span>
          <span class="nx">content</span><span class="p">.</span><span class="nx">find</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">[data-role=&quot;user-avatar&quot;]</span><span class="dl">&#39;</span><span class="p">).</span><span class="nx">attr</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">src</span><span class="dl">&#39;</span><span class="p">,</span> <span class="nx">data</span><span class="p">.</span><span class="nx">user_avatar_url</span><span class="p">);</span>
          <span class="nx">content</span><span class="p">.</span><span class="nx">find</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">[data-role=&quot;message-text&quot;]</span><span class="dl">&#39;</span><span class="p">).</span><span class="nx">text</span><span class="p">(</span><span class="nx">data</span><span class="p">.</span><span class="nx">message</span><span class="p">);</span>
          <span class="nx">content</span><span class="p">.</span><span class="nx">find</span><span class="p">(</span><span class="dl">&#39;</span><span class="s1">[data-role=&quot;message-date&quot;]</span><span class="dl">&#39;</span><span class="p">).</span><span class="nx">text</span><span class="p">(</span><span class="nx">data</span><span class="p">.</span><span class="nx">updated_at</span><span class="p">);</span>
          <span class="nx">$element</span><span class="p">.</span><span class="nx">append</span><span class="p">(</span><span class="nx">content</span><span class="p">);</span>
          <span class="nx">$element</span><span class="p">.</span><span class="nx">animate</span><span class="p">({</span> <span class="na">scrollTop</span><span class="p">:</span> <span class="nx">$element</span><span class="p">.</span><span class="nx">prop</span><span class="p">(</span><span class="dl">&quot;</span><span class="s2">scrollHeight</span><span class="dl">&quot;</span><span class="p">)},</span> <span class="mi">1000</span><span class="p">);</span>
        <span class="p">}</span>
      <span class="p">}</span>
    <span class="p">);</span>
  <span class="p">});</span>
<span class="p">});</span>
</code></pre>

<p>1. 不要使用simple form<br />
2.&nbsp; 使用jquery 实现ajax 请求</p>

<p>修改simple_form_for为form_for，因为不好用</p>

<p>然后增加jQuery</p>

<p>app/views/rooms/show.html.erb</p>

<pre>
<code>&nbsp;&lt;input type=&quot;text&quot; id=&#39;message&#39; name=&quot;message&quot; placeholder=&#39;输入一些东东&#39;/&gt;

&nbsp;&nbsp;&nbsp; &lt;input type=&quot;button&quot; id=&#39;send&#39; value=&#39;Send&#39;/&gt;</code></pre>

<pre>
<code>&lt;script&gt;

&nbsp; jQuery(&#39;#send&#39;).click(function(e){

&nbsp;&nbsp;&nbsp; $.ajax({ url: &#39;/room_messages&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type: &#39;POST&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; beforeSend: function(xhr) {xhr.setRequestHeader(&#39;X-CSRF-Token&#39;, $(&#39;meta[name=&quot;csrf-token&quot;]&#39;).attr(&#39;content&#39;))},

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data: &#39;room_message[room_id]=&#39; + &lt;%= params[:id] %&gt; + &#39;&amp;room_message[message]=&#39; + jQuery(&#39;#message&#39;).val(),

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; success: jQuery(&#39;#message&#39;).val(&#39;&#39;)//(这里是进行清空)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //function(response) { }

&nbsp;&nbsp;&nbsp; });

&nbsp; })

&lt;/script&gt;</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
</div>
</div>
</div>
</div>
</div>

