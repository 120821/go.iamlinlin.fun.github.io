---
layout: post
title: "blogs rails crud"
date: "2022-06-09"
categories: 
---

                    <p>使用rails创建一个新的项目，blogs 在远程也创建项目，进行git init .创建连接</p> 
<p>首先，使用scaffold 直接创建表格和列</p> 
<pre><code>bundle exec rails genreate scaffold blogs title:string content:string</code></pre> 
<p>创建数据表</p> 
<pre><code>bundle exec rake db:migrate</code></pre> 
<p>修改环境文件</p> 
<pre><code>app/controllers/application_controller.rb


class ApplicationController &lt; ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #注释下边这一行
  #protect_from_forgery with: :exception
end</code></pre> 
<p>修改路由</p> 
<pre><code>class BlogsController &lt; ApplicationController

  before_action :get_by_id,:only =&gt;[:show,:destroy,:edit,:update]

  def index
    @blogs = Blog
    puts "--------------------hihih"
    @blogs = @blogs.where('name like ? ', "%#{params[:blog_title]}%") if params[:blog_title].present?
    @blogs = @blogs.where('address like ? ', "%#{params[:blog_content]}%") if params[:blog_content].present?
    @blogs = @blogs.page(params[:page]).per(30)

    puts "-------end--index-----------hihih"
  end

  def new
    @blog = Blog.new
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.content = params[:blog_content]
    @blog.save!

  end

  def create
    puts("==params is: ")
    blog.create(  { :time =&gt; params[:time], :title=&gt; params[:title], :content =&gt; params[:content] }  )
    redirect_to blogs_path
  end

  def edit
  end

  def update
    #@blog = Blog.find(params[:id])
    puts "=== in update, before : #{@blog.inspect}"
    @blog.title = params[:blog_title]
    @blog.time = params[:blog_time]
    @blog.content = params[:blog_content]
    @blog.save!
    puts "=== in update, after: #{@blog.inspect}"
    redirect_to blogs_path

  end

  def show
    puts "==== im show"
  end

  def destroy
    @blog.delete
    redirect_to blogs_path
  end

  private
  def get_by_id
    @blog = Blog.find(params[:id])
  end
end</code></pre> 
<p>渲染页面app/views/layouts/application.html.erb<br> ​</p> 
<pre><code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Blogs&lt;/title&gt;
    &lt;%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' =&gt; true %&gt;
    &lt;%= javascript_include_tag 'application', 'data-turbolinks-track' =&gt; true %&gt;
    &lt;%= csrf_meta_tags %&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
    &lt;link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css"&gt;
    &lt;script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"&gt;&lt;/script&gt;
    &lt;script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"&gt;&lt;/script&gt;
    &lt;script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"&gt;&lt;/script&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;div&gt; application.html.erb&lt;/div&gt;
    &lt;%= yield %&gt;
  &lt;/body&gt;
&lt;/html&gt;</code></pre> 
<p>编辑页面 app/views/blogs/edit.html.erb</p> 
<pre><code class="language-ruby">&lt;h3&gt;编辑&lt;/h3&gt;
&lt;%= render 'form', blog: @blog %&gt;

&lt;br/&gt;
&lt;%= link_to '详情', @blog %&gt; |
&lt;%= link_to '返回', @blog_path %&gt;
</code></pre> 
<p>form 页面app/views/blogs/_form.html.erb</p> 
<pre><code class="language-html">&lt;%= form_for @blog do |form| %&gt;
  &lt;teble class='table table-striped table-hover table-border'&gt;
    &lt;tr&gt;
        &lt;th style="width: 150px;"&gt;
            标题
        &lt;/th&gt;
        &lt;td&gt; 
            &lt;%= form.text_field :title,class: "form-control" %&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;th&gt;
            content
        &lt;/th&gt;
        &lt;td&gt; 
            &lt;%= form.text_field : contenet,class: "form-control" %&gt;
        &lt;/td&gt;
    &lt;/tr&gt;
&lt;%= end %&gt;</code></pre> 
<p>列表页面app/views/blogs/index.html.erb<br>  </p> 
<pre><code class="language-html">&lt;h3&gt;列表&lt;/h3&gt;

博客总数&lt;%= @total_ count  %&gt;
&lt;br/&gt;
&lt;%= paginate @blogs %&gt;

&lt;table class="table table-striped"&gt;
  &lt;% @blogs.each do |blog| %&gt;
    &lt;tr&gt;
      &lt;td &gt;
        &lt;a href="/blogs/&lt;%= blog.id %&gt;" &gt; &lt;%= blog.id %&gt; &lt;%= blog.title %&gt; &lt;/a&gt;
      &lt;/td&gt;
      &lt;td&gt;
        &lt;%=blog.title %&gt;
      &lt;/td&gt;
      &lt;td&gt;
        &lt;%=blog.content %&gt;
      &lt;/td&gt;
      &lt;td&gt;
        &lt;%= link_to "编辑", edit_blog_path(:id =&gt; blog.id) %&gt;
        &lt;%= link_to "删除",blog,:method =&gt; :delete, class: 'btn btn-primary' %&gt;
      &lt;/td&gt;
    &lt;/tr&gt;
  &lt;% end %&gt;
&lt;/table&gt;

&lt;br/&gt;

&lt;%= link_to "新建", new_blog_path %&gt;&lt;br/&gt;</code></pre> 
<p>新建页面app/views/blogs/new.html.erb</p> 
<pre><code>&lt;h3&gt;新建页面&lt;/h3&gt;
&lt;%= render 'form', blog: @blog %&gt;
&lt;br/&gt;
&lt;%= link_to "返回",blogs_path %&gt;</code></pre> 
<p>详情页面app/views/blogs/show.html.erb</p> 
<pre><code class="language-html">&lt;table class='table table-striped table-hover table-border'&gt;
  &lt;tr&gt;
    &lt;th style="width:150px;"&gt;
      标题
    &lt;/th&gt;
    &lt;td&gt;
      &lt;%= @blog.title %&gt;
    &lt;/td&gt;
    &lt;td&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;
      内容
    &lt;/th&gt;
    &lt;td&gt;
      &lt;%= @blog.content %&gt;
    &lt;/td&gt;
    &lt;td&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
&lt;/table&gt;

&lt;br/&gt;
&lt;%= link_to'返回',blogs_path, class: 'btn btn-primary' %&gt;</code></pre> 
<p>使用hash  <strong>routes.rb</strong></p> 
<pre><code>Rails.application.routes.draw do resources :blogs do
    collection do
      get :list
    end
  end

  namespace :interface do
    resources :blogs do
     collection do
      get :all
      end
    end
  end

end</code></pre> 
<p>增加文件</p> 
<pre><code>app/controllers/interface/blogs_controller.rb</code></pre> 
<pre><code>module Interface
  class BlogsController &lt; ApplicationController
    def all

      #blog = Blog.first
      #result = {
      #  id: blog.id,
      #  title: blog.title,
      #  content: blog.content
      #}

      result = Blog.all.map do |blog|

        # 这个是返回值，在map 中，不能写return, 默认返回最后一行代码的值
        {
          id: blog.id,
          title: blog.title,
          content: blog.content
        }
      end

      render json: result
    end
  end
end</code></pre> 
<p>使用分页Gemfile</p> 
<pre><code>
source 'https://rubygems.org'


gem 'kaminari'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
#gem 'mysql2'
#gem 'mysql2', '~&gt; 0.3.18'
gem 'pg', '0.18.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~&gt; 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '&gt;= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~&gt; 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~&gt; 2.0'
# bundle exec rake doc:rails generates the API under doc/api.</code></pre> 
<p></p>
                
