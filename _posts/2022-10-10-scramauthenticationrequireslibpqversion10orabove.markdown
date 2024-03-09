---
layout: post
title: "SCRAM authentication requires libpq version 10 or above"
date: "2022-10-10"
categories: 
---
<p><a href="https://stackoverflow.com/questions/62807717/how-can-i-solve-postgresql-scram-authentication-problem">https://stackoverflow.com/questions/62807717/how-can-i-solve-postgresql-scram-authentication-problem</a></p>

<p><code>export DOCKER_DEFAULT_PLATFORM=linux/amd64</code></p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>不要使用docker的postgres（14）, 使用本地的postgres （9.5）</code></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>就可以正常的create db/migrate </code></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>rails s</code></div>

