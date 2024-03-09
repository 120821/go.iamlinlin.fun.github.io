---
layout: post
title: "rails test env "
date: "2022-09-30"
categories: 
---
<p><code>rake -T test</code></p>

<p>rake test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Runs all tests in test folder except system ones<br />
rake test:all&nbsp;&nbsp;&nbsp;&nbsp; # Runs all tests, including system tests<br />
rake test:db&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Run tests quickly, but also reset db<br />
rake test:system&nbsp; # Run system tests only</p>

<p><img height="134" src="/uploads/ckeditor/pictures/493/image-20220930104507-2.png" width="789" /></p>

<p>linlin@linlin-i5:/workspace/test-rails-单元测试$ rake test:system</p>

<p><img height="203" src="/uploads/ckeditor/pictures/494/image-20220930104640-3.png" width="805" /></p>

<p>rake test:db</p>

<p><img height="203" src="/uploads/ckeditor/pictures/495/image-20220930104832-4.png" width="1919" /></p>

<p><a href="https://stackoverflow.com/questions/2814901/starting-rails-in-test-environment">test env rails s</a>&nbsp;</p>

<p>linlin@linlin-i5:/workspace/test-rails-单元测试$ rails s -e test</p>

<p><img height="291" src="/uploads/ckeditor/pictures/492/image-20220930104331-1.png" width="1304" /></p>

