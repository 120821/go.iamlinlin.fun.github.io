---
layout: post
title: "rails password field"
date: "2023-03-07"
categories: 
---
<p><a href="https://stackoverflow.com/questions/4011685/how-to-create-password-and-confirmation-when-using-form-for">https://stackoverflow.com/questions/4011685/how-to-create-password-and-confirmation-when-using-form-for</a></p>

<p>这样写可以不直接显示输入的内容，会隐藏起来</p>

<pre>
<code>&lt;%= f.password_field :password %&gt;
&lt;%= f.password_field :password_confirmation %&gt;</code></pre>

