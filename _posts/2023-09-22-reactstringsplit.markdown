---
layout: post
title: "react string split"
date: "2023-09-22"
categories: 
---
<p>react 可以使用spli来分割string,例如:</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">const</span> str = <span style="color:#abe338">&quot;147?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiI4ODg4ODg4OCIsImV4cCI6MTY5NTM3MjY3OCwiaXNzIjoiZ2luLWRvbmd0YWlwYWlmYW5nIn0.SaJtki8y3jy-q7_niyVkVUyZshfBm2W6qyseZqe&quot;</span>;

<span style="color:#dcc6e0">const</span> result = str.split(<span style="color:#abe338">&#39;?&#39;</span>)[<span style="color:#f5ab35">0</span>]; <span style="color:#d4d0ab">// 使用问号进行分割，获取问号前面的部分</span>

<span style="color:#f5ab35">console</span>.log(result); <span style="color:#d4d0ab">// 输出 &quot;calculation_plan_id: 147&quot;</span>{% endhighlight %}

