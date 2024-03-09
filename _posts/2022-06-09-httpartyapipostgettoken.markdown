---
layout: post
title: "( httparty api post get )token的使用"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>api接口创建的时候在postman使用。出现报错，在controller文件增加如下内容</p> 
</blockquote> 
<p>页面使用过时的真实性令牌进行缓冲，并且所有使用 post/put/delete 方法的操作都被视为伪造尝试</p> 
<pre><code>module Api
▾ app/                         |  2   class HomesController &lt; ActionController::Base               
  ▸ assets/                    |  3     skip_before_action :verify_authenticity_token
  ▸ channels/                  |  4     
  ▾ controllers/               |  5     def new_account
    ▾ api/                     |  6       render json: {
</code></pre> 
<p><img alt="" height="1200" src="https://img-blog.csdnimg.cn/6985104f46444bdd84678be7e4090b2d.png" width="1200"></p> 
<pre><code>skip_before_action :verify_authenticity_token</code></pre> 
<pre><code class="language-ruby"># To send custom user agents to identify your application to a web service (or mask as a specific browser for testing), send "User-Agent" as a hash to headers as shown below.

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httparty')
require 'pp'

response = HTTParty.get('http://example.com', {
  headers: {"User-Agent" =&gt; "Httparty"},
  debug_output: STDOUT, # To show that User-Agent is Httparty
})</code></pre> 
<p>官网<a href="https://github.com/jnunemaker/httparty/blob/master/examples/headers_and_user_agents.rb" title="https://github.com/jnunemaker/httparty/blob/master/examples/headers_and_user_agents.rb">https://github.com/jnunemaker/httparty/blob/master/examples/headers_and_user_agents.rb</a></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p>
                
