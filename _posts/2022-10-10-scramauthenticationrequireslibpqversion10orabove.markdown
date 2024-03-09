---
layout: post
title: "SCRAM authentication requires libpq version 10 or above"
date: "2022-10-10"
categories: 
---
<p><a href="https://stackoverflow.com/questions/62807717/how-can-i-solve-postgresql-scram-authentication-problem">https://stackoverflow.com/questions/62807717/how-can-i-solve-postgresql-scram-authentication-problem</a></p>

<p>{% highlight %}export DOCKER_DEFAULT_PLATFORM=linux/amd64{% endhighlight %}</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}不要使用docker的postgres（14）, 使用本地的postgres （9.5）{% endhighlight %}</div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}就可以正常的create db/migrate {% endhighlight %}</div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}rails s{% endhighlight %}</div>

