---
layout: post
title: "ruby GraphQl 的简单使用"
date: "2022-06-09"
categories: 
---

                    <p>使用ruby 或者rails进行api的管理</p> 
<p>首先进行安装gem，使用如下命令直接安装,或者进行githob的安装。在Gemfile文件增加然后$ bundle install也可以。$ rails generate graphql:install</p> 
<pre><code># Gemfile
gem 'graphql'</code></pre> 
<p><a href="https://github.com/rmosolgo/graphql-ruby" title="GitHub - rmosolgo/graphql-ruby: Ruby implementation of GraphQL">GitHub - rmosolgo/graphql-ruby: Ruby implementation of GraphQL</a></p> 
<pre><code>gem install graphql</code></pre> 
<p><img alt="" height="108" src="https://img-blog.csdnimg.cn/6588a6b8d5484f3da627b48a23bea7cc.png" width="700">进行尝试，hello.rb</p> 
<pre><code>require 'graphql'

class QueryType &lt; GraphQL::Schema::Object
  field :hello, String

  def hello
    "Hello world!"
  end
end

class Schema &lt; GraphQL::Schema
  query QueryType
end

puts Schema.execute('{ hello }').to_json</code></pre> 
<p><img alt="" height="73" src="https://img-blog.csdnimg.cn/24c28bb229e440eea5e6c9ecb5915382.png" width="627"></p> 
<p>同样的 ，使用field，熟悉一下方法 的定义和使用。</p> 
<pre><code>require 'graphql'

class QueryType &lt; GraphQL::Schema::Object
  field :hero, String

  def hero
    "R2-D2"
  end
end

class Schema &lt; GraphQL::Schema
  query QueryType
end

puts Schema.execute('{ hero}').to_json
</code></pre> 
<p><img alt="" height="55" src="https://img-blog.csdnimg.cn/6ea0219cd2644811a6e8a6b9156655d7.png" width="672"></p>
                
