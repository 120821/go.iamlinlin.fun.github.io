---
layout: post
title: "rails -devies的使用"
date: "2022-09-28"
categories: 
---
<p><a href="https://github.com/heartcombo/devise#getting-started">官网 get start</a></p>

<p>在项目的Gemfile增加</p>

<p>gem &#39;devise&#39;</p>

<p>然后 bundle install</p>

<p>运行：</p>

<pre>
<span class="pl-s1">rails generate devise:install</span></pre>

<p><img height="995" src="/uploads/ckeditor/pictures/485/image-20220928143832-1.png" width="1911" /></p>

<p>然后可以设置一个默认的URL（也可以不设置） <code>config/environments/development.rb：</code></p>

<pre>
<span class="pl-en">config</span><span class="pl-kos">.</span><span class="pl-en">action_mailer</span><span class="pl-kos">.</span><span class="pl-en">default_url_options</span> <span class="pl-c1">=</span> <span class="pl-kos">{</span> <span class="pl-pds">host</span>: <span class="pl-s">&#39;localhost&#39;</span><span class="pl-kos">,</span> <span class="pl-pds">port</span>: <span class="pl-c1">3000</span> <span class="pl-kos">}</span></pre>

<p>然后创建devise的model</p>

<pre>
<span class="pl-s1">rails generate devise abc</span></pre>

<p><img height="180" src="/uploads/ckeditor/pictures/486/image-20220928144118-2.png" width="1900" /></p>

<p>&nbsp;</p>

