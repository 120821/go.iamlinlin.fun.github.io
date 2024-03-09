---
layout: post
title: "rails--实例变量-render--params"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong>实例变量instance variable @color 仅作用于instance之内，在Rails大量使用</strong></p> 
 <p>类变量 class variable @@name</p> 
 <p>普通变量 local variable  age=20</p> 
</blockquote> 
<p></p> 
<blockquote> 
 <p><strong>实例变量是哪里来的</strong></p> 
 <p>Rails 提供了 <code>resources</code> 方法，用于声明标准的 REST 资源。创建好项目后，</p> 
 <p>把 color资源添加到 <code>config/routes.rb</code> 文件，此时文件内容应该变成下面这样：</p> 
 <pre><code class="language-ruby">Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :color
 
  root 'welcome#index'
end</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>在视图中是如何使用</strong></p> 
 <p>在控制器中手动定义动作，只需要定义一个新方法。打开 <code>app/controllers/articles_controller.rb</code> 文件，在 <code>ArticlesController</code> 类中定义 <code>new</code> 方法，此时控制器应该变成下面这样</p> 
 <pre><code class="language-ruby">class ArticlesController &lt; ApplicationController
  def new
  end
end</code></pre> 
 <p>新建 <code>app/views/articles/new.html.erb</code> 文件，添加下面的代码：</p> 刷新 
 <a href="http://localhost:3000/articles/new" title="http://localhost:3000/color/new">http://localhost:3000/color/new</a>，会看到页面有了标题。现在路由、控制器、动作和视图都可以协调地工作了！是时候创建用于新建文章的表单了。
</blockquote> 
<blockquote> 
 <p>Rails 中最常用的表单构建器是 <code>form_for</code> 辅助方法。让我们使用这个方法，在 <code>app/views/articles/new.html.erb</code> 文件中添加下面的代码：</p> 
 <pre><code class="language-ruby">&lt;%= form_for :article do |f| %&gt;
  &lt;p&gt;
    &lt;%= f.label :title %&gt;&lt;br&gt;
    &lt;%= f.text_field :title %&gt;
  &lt;/p&gt;
 
  &lt;p&gt;
    &lt;%= f.label :text %&gt;&lt;br&gt;
    &lt;%= f.text_area :text %&gt;
  &lt;/p&gt;
 
  &lt;p&gt;
    &lt;%= f.submit %&gt;
  &lt;/p&gt;
&lt;% end %&gt;</code></pre> 
 <p>修改 <code>app/views/articles/new.html.erb</code> 文件的 <code>form_for</code></p> 
 <pre><code class="language-ruby">&lt;%= form_for :article, url: articles_path do |f| %&gt;</code></pre> 
 <p>修改 <code>app/controllers/articles_controller.rb</code> 文件，在 <code>ArticlesController</code> 类的 <code>new</code> 动作之后添加 <code>create</code> 动作</p> 
 <pre><code class="language-ruby">class ArticlesController &lt; ApplicationController
  def new
  end
 
  def create
  end
end</code></pre> 
 <p>把 <code>create</code> 动作的代码修改，查看参数的内容</p> 
 <pre><code class="language-ruby">def create
  render plain: params[:article].inspect
end</code></pre> 
</blockquote> 
<blockquote> 
 <p>这里 <strong><code>render</code> </strong>方法接受了一个简单的散列<strong>（hash）</strong>作为参数，<code>:plain</code> 键的值是 <code>params[:article].inspect</code>。<code>params</code> 方法是代表表单提交的参数（或字段）的对象。<code>params</code> 方法返回 <code>ActionController::Parameters</code> 对象，这个对象允许使用字符串或符号访问散列的键。这里我们只关注通过表单提交的参数。</p> 
 <p>请确保牢固掌握<strong> <code>params</code> </strong>方法，这个方法很常用。</p> 
 <p>我们看一个示例 URL：<code>http://www.example.com/?username=dhh&amp;email=dhh@email.com</code>。在这个 URL 中，<code>params[:username]</code> 的值是“dhh”，<code>params[:email]</code> 的值是“<code>dhh@email.com</code>”。</p> 
</blockquote> 
<blockquote> 
 <p></p> 
</blockquote>
                
