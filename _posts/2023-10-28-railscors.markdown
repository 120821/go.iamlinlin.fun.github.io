---
layout: post
title: "Rails 配置接口跳过登录，跳过cors"
date: "2023-10-28"
categories: 
---
<p>1.为特定接口设置cors</p>

<pre>
<code>    <span style="color:#d4d0ab"># 只为特定接口启用CORS</span>
    config.middleware.insert_before <span style="color:#f5ab35">0</span>, Rack::Cors <span style="color:#dcc6e0">do</span>
      allow <span style="color:#dcc6e0">do</span>
        origins <span style="color:#abe338">&#39;*&#39;</span> <span style="color:#d4d0ab"># 允许来自任何域的请求</span>
        resource <span style="color:#abe338">&#39;/api/v1/blogs&#39;</span>, <span style="color:#abe338">headers:</span> <span style="color:#abe338">:any</span>, <span style="color:#abe338">methods:</span> [<span style="color:#abe338">:get</span>]
      <span style="color:#dcc6e0">end</span>
    <span style="color:#dcc6e0">end</span></code></pre>

<p>2.设置跳过登录：</p>

<p>修改文件：app/controllers/api/v1/blogs_controller.rb</p>

<p>增加：</p>

<pre>
<code>&nbsp;skip_before_action :check_user_login</code></pre>

<p>3.前段React发起请求的时候需要在请求头增加cors：</p>

<pre>
<code><span style="color:#dcc6e0">import</span> axios <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;axios&#39;</span>;

<span style="color:#d4d0ab">// 发起 GET 请求并处理跨域请求</span>
axios.get(<span style="color:#abe338">&#39;https://your-api-url.com/api/v1/blogs/123&#39;</span>, { headers: { <span style="color:#abe338">&#39;Access-Control-Allow-Origin&#39;</span>: <span style="color:#abe338">&#39;*&#39;</span> } })
  .then(<span style="color:#f5ab35">response</span> =&gt; {
    <span style="color:#d4d0ab">// 处理响应</span>
  })
  .catch(<span style="color:#f5ab35">error</span> =&gt; {
    <span style="color:#d4d0ab">// 处理错误</span>
  });</code></pre>

<p>&nbsp;</p>

