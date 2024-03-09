---
layout: post
title: "Can't verify CSRF token authenticity"
date: "2023-04-25"
categories: 
---
<p>在使用chart.js之前是可以正常使用的，可能是js出错了。修改即可。</p>

<p>理解：</p>

<p>这个错误通常是由于跨站请求伪造（CSRF）攻击防御不当所导致的。</p>

<p>CSRF 攻击是一种恶意攻击方式，黑客可以诱骗用户在已经登录了某个网站的情况下，发送一个伪造请求给该网站，从而执行某些不当操作。为了防止这种攻击，Rails 提供了内置的 CSRF 保护机制。</p>

<p>当你提交一个表单或者发送 Ajax 请求时，Rails 会在请求头中添加一个 csrf-token，同时在 session 中生成一个对应的 token，然后比较这两个 token 是否一致，来判断请求是否合法。如果两个 token 不一致，或者请求头中没有 csrf-token，就会出现 &quot;Can&#39;t verify CSRF token authenticity&quot; 错误。</p>

<p>通常这个错误可以通过以下几种方式来解决：</p>

<p>1. 在表单中添加 csrf_token，例如：</p>

<p>```<br />
&lt;%= hidden_field_tag :authenticity_token, form_authenticity_token %&gt;<br />
```</p>

<p>2. 按照官方文档配置 `protect_from_forgery` 选项，例如：</p>

<p>```<br />
class ApplicationController &lt; ActionController::Base<br />
&nbsp; protect_from_forgery with: :exception<br />
end<br />
```</p>

<p>3. 如果是 API 请求，可以将 `protect_from_forgery` 的选项改为 `null_session`，例如：</p>

<p>```<br />
class ApplicationController &lt; ActionController::API<br />
&nbsp; protect_from_forgery with: :null_session<br />
end<br />
```</p>

<p>需要注意的是，在开启 CSRF 保护机制的情况下，如果你使用了一些第三方库或者后端服务器（例如 Nginx），需要确保它们也正确地传递了 csrf-token。否则也会出现 &quot;Can&#39;t verify CSRF token authenticity&quot; 错误。</p>

