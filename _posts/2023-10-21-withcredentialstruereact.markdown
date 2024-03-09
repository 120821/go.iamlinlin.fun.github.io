---
layout: post
title: "withCredentials: true react"
date: "2023-10-21"
categories: 
---
<p>refer&nbsp;<a href="http://Make Axios send cookies in its requests automatically">http://Make Axios send cookies in its requests automatically</a></p>

<p>设置cookie 需要注意：</p>

{% highlight %}
{% highlight %}axios.get(BASE_URL + &#39;/todos&#39;, { withCredentials: true });{% endhighlight %}

<p>也可以：</p>

{% highlight %}
{% highlight %}axios.defaults.withCredentials = true{% endhighlight %}

<p>同时{% highlight %}Access-Control-Allow-Origin设置为https://a.com（客户端器）（不能设置为*）{% endhighlight %}</p>

