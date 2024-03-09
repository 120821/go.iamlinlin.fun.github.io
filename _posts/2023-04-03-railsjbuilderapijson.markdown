---
layout: post
title: "rails jbuilder api json"
date: "2023-04-03"
categories: 
---
<p>refer: <a href="https://github.com/rails/jbuilder">https://github.com/rails/jbuilder</a></p>

<p>1.安装gem</p>

<pre>
<code>gem &#39;jbuilder&#39;</code></pre>

<pre>
<code>bundle install</code></pre>

<p><code>2.使用：</code></p>

<pre>
<code># app/views/articles/index.json.jbuilder
json.array! @articles do |article|
  json.id article.id
  json.title article.title
  json.url article.url
  json.created_at article.created_at
end</code></pre>

<p><code>返回结果：</code></p>

<pre>
<code>[
  {
    &quot;id&quot;: 1,
    &quot;title&quot;: &quot;Sint maxime et unde.&quot;,
    &quot;url&quot;: &quot;http://mante.io/travis_klocko&quot;,
    &quot;created_at&quot;: &quot;2018-11-10T12:21:20.376Z&quot;
  },
  {
    &quot;id&quot;: 2,
    &quot;title&quot;: &quot;Soluta est beatae cum.&quot;,
    &quot;url&quot;: &quot;http://blick.biz/alexis&quot;,
    &quot;created_at&quot;: &quot;2018-11-10T12:21:20.381Z&quot;
  }
]</code></pre>

