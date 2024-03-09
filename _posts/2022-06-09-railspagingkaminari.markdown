---
layout: post
title: "rails 分页 Paging kaminari"
date: "2022-06-09"
categories: 
---

                    <p>安装，官网地址<a href="https://github.com/kaminari/kaminari" title="GitHub - kaminari/kaminari: ⚡ A Scope &amp; Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps">GitHub - kaminari/kaminari: ⚡ A Scope &amp; Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps</a></p> 
<p>bundller 大于1的话，可以使用这个版本</p> 
<pre><code>gem install kaminari -v 0.16.3</code></pre> 
<p><img alt="" src="https://img-blog.csdnimg.cn/a5974c9ae2384267b547e8b46f574637.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>使用这个命令可以创建一个config文件</p> 
<pre><code>rails g kaminari:config</code></pre> 
<p>在 Gemfile文件中增加环境语句</p> 
<pre><code>gem 'kaminari'</code></pre> 
<pre><code>bundle install</code></pre> 
<p>然后重新启动服务器</p> 
<pre><code>bundle exec rails s</code></pre> 
<p>修改需要分页的controller，增加如下的内容</p> 
<pre><code class="language-ruby"># app/controllers/topics_controller.rb

  def index
    @topics = Topic.page(params[:page]).per(15)
  end</code></pre> 
<p>然后在对应的view文件增加内容，你可以在页面顶部或者底部或者自己需要的地方引入分页的内容</p> 
<pre><code class="language-ruby">&lt;%= paginate @users %&gt;</code></pre> 
<p>就可以看到浏览器对应的页面出现了分页<img alt="" height="52" src="https://img-blog.csdnimg.cn/bbb20db0855d4810a03e9268c452daa2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_9,color_FFFFFF,t_70,g_se,x_16" width="330"></p> 
<p></p>
                
