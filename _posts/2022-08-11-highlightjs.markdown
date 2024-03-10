---
layout: post
title: "highlightjs"
date: "2022-08-11"
categories: 
---
<p>官网：<a href="https://highlightjs.org/">https://highlightjs.org/</a></p>
<p>使用：<a href="https://highlightjs.org/usage/">https://highlightjs.org/usage/</a></p>
<p>增加：app/views/application.html.erb</p>
{% highlight html %}
<code class="hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">link</span> <span class="hljs-attr">rel</span>=<span class="hljs-string">&quot;stylesheet&quot;</span>
<span class="hljs-attr">href</span>=<span class="hljs-string">&quot;//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/styles/default.min.css&quot;</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">src</span>=<span class="hljs-string">&quot;//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/highlight.min.js&quot;</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>{% endhighlight %}
<p>{% highlight html %}然后，使用，{% endhighlight %}</p>
{% highlight html %}
<code class="language-html hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">pre</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-name">code</span> <span class="hljs-attr">class</span>=<span class="hljs-string">&quot;language-plaintext&quot;</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-name">code</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-name">pre</span>&gt;</span>
{% endhighlight %}
<p>就产生这样的效果：<img height="282" src="/uploads/ckeditor/pictures/206/image-20220811151326-1.png" width="725" /></p>
<p>使用全局的js</p>
{% highlight html %}
<code class="language-html hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">link</span> <span class="hljs-attr">rel</span>=<span class="hljs-string">&quot;stylesheet&quot;</span> <span class="hljs-attr">href</span>=<span class="hljs-string">&quot;/path/to/styles/default.min.css&quot;</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">src</span>=<span class="hljs-string">&quot;/path/to/highlight.min.js&quot;</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">script</span>&gt;</span>hljs.highlightAll();<span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
{% endhighlight %}
<p>然后刷新页面，是这样的效果：</p>
<p><img height="338" src="/uploads/ckeditor/pictures/207/image-20220811151553-2.png" width="744" /></p>
<p>怎么进行颜色的变化呢，保存页面，后看到了颜色变化：</p>
<p><img height="496" src="/uploads/ckeditor/pictures/208/image-20220811151824-1.png" width="727" /></p>
