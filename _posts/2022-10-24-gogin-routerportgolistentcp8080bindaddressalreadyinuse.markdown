---
layout: post
title: "go gin- router port：修改go使用的默认端口，listen tcp :8080: bind: address already in use"
date: "2022-10-24"
categories: 
---
<p><a href="https://stackoverflow.com/questions/74179363/how-to-modify-the-default-port-of-go-gin-my-8080-port-is-in-use/74179494#74179494">https://stackoverflow.com/questions/74179363/how-to-modify-the-default-port-of-go-gin-my-8080-port-is-in-use/74179494#74179494</a></p>

<p>当我运行测试的时候，出现了错误，listen tcp :8080: bind: address already in use</p>

<pre class="lang-golang s-code-block">
<code class="hljs language-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-comment">//r := gin.Default()</span>
  <span class="hljs-comment">//r.GET(&quot;/ping&quot;, func(c *gin.Context) {</span>
  <span class="hljs-comment">//  c.JSON(http.StatusOK, gin.H{</span>
  <span class="hljs-comment">//    &quot;message&quot;: &quot;pong&quot;,</span>
  <span class="hljs-comment">//  })</span>
  <span class="hljs-comment">//})</span>
  router := gin.Default()
    router.GET(<span class="hljs-string">&quot;/hi&quot;</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(context *gin.Context)</span></span> {
        context.String(http.StatusOK, <span class="hljs-string">&quot;Hello world!&quot;</span>)
    })
    err := router.Run()
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        <span class="hljs-built_in">panic</span>(<span class="hljs-string">&quot;[Error] failed to start Gin server due to: &quot;</span> + err.Error())
        <span class="hljs-keyword">return</span>
    }
  router.Run(<span class="hljs-string">&quot;:9888&quot;</span>)
  <span class="hljs-comment">//r.Run() // listen and serve on 0.0.0.0:8080 (for windows &quot;localhost:8080&quot;)</span>
}
{% endhighlight %}

<p>但是根据提示，进行使用其他端口的时候，仍然提示使用的时候8080端口，那么是为什么：</p>

<p>根据回答，是因为我调用 Run() 两次 - 第一个实例在没有提供任何地址的情况下被调用。 因此，在本例中使用了默认端口 8080。 更新代码以在第一次调用中提供地址，并删除重复调用。</p>

<p>正确的代码是：</p>

<pre class="lang-golang s-code-block">
<code class="hljs language-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    router := gin.Default()
    router.GET(<span class="hljs-string">&quot;/hi&quot;</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(context *gin.Context)</span></span> {
        context.String(http.StatusOK, <span class="hljs-string">&quot;Hello world!&quot;</span>)
    })
    err := router.Run(<span class="hljs-string">&quot;:9888&quot;</span>)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        <span class="hljs-built_in">panic</span>(<span class="hljs-string">&quot;[Error] failed to start Gin server due to: &quot;</span> + err.Error())
        <span class="hljs-keyword">return</span>
    }
}{% endhighlight %}

<p>运行代码：</p>

<p><img height="329" src="/uploads/ckeditor/pictures/612/image-20221024205214-2.png" width="1202" /></p>

<p><img height="135" src="/uploads/ckeditor/pictures/611/image-20221024205203-1.png" width="633" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

