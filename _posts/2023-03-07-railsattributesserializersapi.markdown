---
layout: post
title: "rails attributes serializers api"
date: "2023-03-07"
categories: 
---
<p><a href="https://github.com/jsonapi-serializer/jsonapi-serializer">https://github.com/jsonapi-serializer/jsonapi-serializer</a></p>

<p>1.<a href="https://github.com/jsonapi-serializer/jsonapi-serializer#installation">install</a></p>

<p>在Gemfile增加：</p>

<pre>
<code>
gem &#39;jsonapi-serializer&#39;</code></pre>

<p>安装：</p>

<pre>
<code>
$ bundle install</code></pre>

<p>2.<a href="https://github.com/jsonapi-serializer/jsonapi-serializer#rails-generator">使用</a></p>

<pre>
<code>rails g serializer Movie name year</code></pre>

<p>这会创建一个文件：app/serializers/movie_serializer.</p>

<p>3.定义model</p>

<pre>
<code>
class Movie
  attr_accessor :id, :name, :year, :actor_ids, :owner_id, :movie_type_id
end</code></pre>

<p>4.Serializer 定义</p>

<pre>
class MovieSerializer
  include JSONAPI::Serializer

  set_type :movie  # optional
  set_id :owner_id # optional
  attributes :name, :year
  has_many :actors
  belongs_to :owner, record_type: :user
  belongs_to :movie_type
end</pre>

<p>5.简单的对象：</p>

<pre>
<code>
movie = Movie.new
movie.id = 232
movie.name = &#39;test movie&#39;
movie.actor_ids = [1, 2, 3]
movie.owner_id = 3
movie.movie_type_id = 1
movie

movies =
  2.times.map do |i|
    m = Movie.new
    m.id = i + 1
    m.name = &quot;test movie #{i}&quot;
    m.actor_ids = [1, 2, 3]
    m.owner_id = 3
    m.movie_type_id = 1
    m
  end</code></pre>

<p>6.对象 Serialization</p>

<p>（1）返回一个集合（hash）</p>

<pre>
<code>
hash = MovieSerializer.new(movie).serializable_hash</code></pre>

<p>（2）返回一个序列化程序json</p>

<pre>
<code>
json_string = MovieSerializer.new(movie).serializable_hash.to_json</code></pre>

<p>（3）Serialization 输出：</p>

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

<p>7.属性（Attributes）</p>

<p>使用Attributes方法定义属性。此方法也别名为属性，这在定义单个属性时非常有用。</p>

<p>默认情况下，属性直接从同名的模型属性中读取。在本例中，name应该是正在序列化的对象的属性：</p>

<pre>
<code>
class MovieSerializer
  include JSONAPI::Serializer

  attribute :name
end</code></pre>

<p>必须序列化但模型中不存在的自定义属性可以使用 Ruby 块语法声明：</p>

<pre>
<code>
class MovieSerializer
  include JSONAPI::Serializer

  attributes :name, :year

  attribute :name_with_year do |object|
    &quot;#{object.name} (#{object.year})&quot;
  end
end</code></pre>

<p>块语法也可用于覆盖对象的属性：</p>

<pre>
<code>
class MovieSerializer
  include JSONAPI::Serializer

  attribute :name do |object|
    &quot;#{object.name} Part 2&quot;
  end
end</code></pre>

<p>通过使用 proc 快捷方式传递原始方法或访问器，属性也可以使用不同的名称：</p>

<pre>
<code>
class MovieSerializer
  include JSONAPI::Serializer

  attributes :name

  attribute :released_in_year, &amp;:year
end</code></pre>

<p>8.每个对象的链接</p>

<p>使用链接方法定义链接。默认情况下，链接直接从同名的模型属性中读取。在本例中，public_url应该是正在序列化的对象的属性。</p>

<p>您可以配置在对象上使用的方法，例如，带有键self的链接将设置为电影对象上名为url的方法返回的值。</p>

<p>您还可以使用一个块来定义一个url，如custom_url中所示。您可以访问这些块中的参数以及personalized_url中显示的参数</p>

<pre>
<code>
class MovieSerializer
  include JSONAPI::Serializer

  link :public_url

  link :self, :url

  link :custom_url do |object|
    &quot;https://movies.com/#{object.name}-(#{object.year})&quot;
  end

  link :personalized_url do |object, params|
    &quot;https://movies.com/#{object.name}-#{params[:user].reference_code}&quot;
  end
end</code></pre>

<p>...</p>

