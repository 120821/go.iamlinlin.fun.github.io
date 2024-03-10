---
layout: post
title: "vue3 axios get 传递参数"
date: "2023-11-20"
categories: 
---
<p>例如有一个input：</p>
{% highlight html %}&lt;input type=&quot;text&quot; class=&quot;login_input white-text&quot; id=&quot;phone&quot; v-model=&quot;phone&quot; placeholder=&quot;&nbsp;&nbsp; 请输入手机号&quot; /&gt;{% endhighlight %}
<p>需要 使用这样的写法</p>
{% highlight html %}axios.get(<span style="color:#abe338">&#39;https://127.0.0.1:4567/booking/verify-mobile/send&#39;</span>, { params: { mobile: <span style="color:#f5ab35">this</span>.phone } }){% endhighlight %}
<p>这样就会发送这样的请求：</p>
<div class="url">{% highlight html %}https://127.0.0.1:4567/booking/verify-mobile/send?mobile=188xxxx9333{% endhighlight %}</div>
