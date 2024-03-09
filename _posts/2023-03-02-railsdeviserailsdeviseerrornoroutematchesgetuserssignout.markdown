---
layout: post
title: "rails devise Rails Devise Error "No route matches [GET] "/users/sign_out"""
date: "2023-03-02"
categories: 
---
<p><a href="https://stackoverflow.com/questions/21040168/rails-devise-error-no-route-matches-get-users-sign-out">https://stackoverflow.com/questions/21040168/rails-devise-error-no-route-matches-get-users-sign-out</a></p>

<p>在config/routes.rb增加：</p>

<pre>
<code>devise_scope :user do&nbsp;&nbsp;

&nbsp;&nbsp; get &#39;/users/sign_out&#39; =&gt; &#39;devise/sessions#destroy&#39;

end </code></pre>

