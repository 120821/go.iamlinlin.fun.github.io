---
layout: post
title: "sinatra logger"
date: "2022-09-29"
categories: 
---
<p><a href="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=2ahUKEwjLhvOZoLf6AhV4zYsBHYX4CScQFnoECAsQAQ&amp;url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F73338400%2Fturning-off-log-rotation-with-ruby-logging-gem&amp;usg=AOvVaw382owlkZfbqP7oWqZ-WJsn">sinatra logger</a></p>
<p>在 app.rb顶部增加：</p>
{% highlight html %}require &#39;sinatra/custom_logger&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
require &#39;logger&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
set :logger, Logger.new(&#39;log.txt&#39;)&nbsp;&nbsp;&nbsp;{% endhighlight %}
<p>既可以使用：</p>
{% highlight html %}&nbsp;logger.info &quot;== response: #{response}&quot;{% endhighlight %}
<p>在terminal查看：</p>
{% highlight html %}tail -f log.txt{% endhighlight %}
