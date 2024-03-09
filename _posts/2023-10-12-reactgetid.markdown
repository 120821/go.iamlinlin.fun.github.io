---
layout: post
title: "react get id 正则表达式的使用"
date: "2023-10-12"
categories: 
---
<p>react我有一个这样的URL，需要在页面得到ID，然后从接口得到该数据：</p>

<p><a href="http://localhost:3000/calculation_templates/edit/18?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiI4ODg4ODg4OCIsImV4cCI6MTY5NzA4MjUzMCwiaXNzIjoiZ2luLWRvbmd0YWlwYWlmYW5nIn0.Welsd0qdayT4k1FGm6BfjYb1R6ZjisvrhuuJZJXeWI0" target="_blank">http://localhost:3000/calculation_templates/edit/18?token=eyJhbGciOiJIUzI1NiIsI</a></p>

<p>需要处理URL得到ID，可以这样：</p>

<pre>
<code><span style="color:#dcc6e0">async</span> <span style="color:#00e0e0">fetchData</span>() {
  <span style="color:#dcc6e0">try</span> {
    <span style="color:#dcc6e0">const</span> currentURL = <span style="color:#f5ab35">window</span>.location.href;
    <span style="color:#f5ab35">console</span>.log(<span style="color:#abe338">&quot;== currentURL: &quot;</span>, currentURL);
    <span style="color:#dcc6e0">const</span> match = currentURL.match(<span style="color:#ffa07a">/\/calculation_templates\/edit\/(\d+)/</span>);
    <span style="color:#dcc6e0">if</span> (match) {
      <span style="color:#dcc6e0">const</span> id = match[<span style="color:#f5ab35">1</span>];
      <span style="color:#f5ab35">console</span>.log(id); <span style="color:#d4d0ab">// 输出捕获到的ID</span>
      
      <span style="color:#dcc6e0">const</span> response = <span style="color:#dcc6e0">await</span> axios.get(<span style="color:#abe338">`</span><span style="color:#abe338">${Config.BASE_URL}</span><span style="color:#abe338">/api/v1/calculation_templates/</span><span style="color:#abe338">${id}</span><span style="color:#abe338">?token=</span><span style="color:#abe338">${getToken()}</span><span style="color:#abe338">`</span>);
      <span style="color:#dcc6e0">const</span> data = <span style="color:#dcc6e0">await</span> response.data;
      
      <span style="color:#dcc6e0">if</span> (data.message === <span style="color:#abe338">&#39;ok&#39;</span>) {
        <span style="color:#f5ab35">this</span>.setState({ data: data.data });
        <span style="color:#f5ab35">console</span>.log(<span style="color:#abe338">&quot;== data: &quot;</span>, data);
      }
    }
  } <span style="color:#dcc6e0">catch</span> (error) {
    <span style="color:#f5ab35">console</span>.error(<span style="color:#abe338">&#39;== Error get calculation template details:&#39;</span>, error);
  }
}{% endhighlight %}

