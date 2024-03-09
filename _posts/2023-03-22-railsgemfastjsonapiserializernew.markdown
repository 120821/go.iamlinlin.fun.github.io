---
layout: post
title: "rails gem fast_jsonapi Serializer.new"
date: "2023-03-22"
categories: 
---
<p><a href="https://github.com/Netflix/fast_jsonapi#usage">https://github.com/Netflix/fast_jsonapi#usage</a></p>

<p>这个gem可以让接口更方便地生成。</p>

<p>1.使用命令生成文件</p>

<pre>
<code>rails g serializer Movie name year</code></pre>

<p>会自动生成文件：<code>app/serializers/movie_serializer.rb</code></p>

<p>2.定义model</p>

<pre>
<code>
class Movie
  attr_accessor :id, :name, :year, :actor_ids, :owner_id, :movie_type_id
end</code></pre>

<p>3.定义serializer:</p>

<pre>
<code>
class MovieSerializer
  include FastJsonapi::ObjectSerializer
  set_type :movie  # optional
  set_id :owner_id # optional
  attributes :name, :year
  has_many :actors
  belongs_to :owner, record_type: :user
  belongs_to :movie_type
end</code></pre>

<p>4.创建对象：</p>

<pre>
<code>
movie = Movie.new
movie.id = 232
movie.name = &#39;test movie&#39;
movie.actor_ids = [1, 2, 3]
movie.owner_id = 3
movie.movie_type_id = 1
movie</code></pre>

<p>5.使用</p>

<p>(1)返回hash:</p>

<pre>
<code>
hash = MovieSerializer.new(movie).serializable_hash</code></pre>

<p>(2)返回json：</p>

<pre>
<code>
json_string = MovieSerializer.new(movie).serialized_json</code></pre>

<p>输出：</p>

<pre>
<code>
{
  &quot;data&quot;: {
    &quot;id&quot;: &quot;3&quot;,
    &quot;type&quot;: &quot;movie&quot;,
    &quot;attributes&quot;: {
      &quot;name&quot;: &quot;test movie&quot;,
      &quot;year&quot;: null
    },
    &quot;relationships&quot;: {
      &quot;actors&quot;: {
        &quot;data&quot;: [
          {
            &quot;id&quot;: &quot;1&quot;,
            &quot;type&quot;: &quot;actor&quot;
          },
          {
            &quot;id&quot;: &quot;2&quot;,
            &quot;type&quot;: &quot;actor&quot;
          }
        ]
      },
      &quot;owner&quot;: {
        &quot;data&quot;: {
          &quot;id&quot;: &quot;3&quot;,
          &quot;type&quot;: &quot;user&quot;
        }
      }
    }
  }
}</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

