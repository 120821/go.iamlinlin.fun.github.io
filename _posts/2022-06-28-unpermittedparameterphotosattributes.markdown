---
layout: post
title: "Unpermitted parameter: :photos_attributes"
date: "2022-06-28"
categories: 
---
<p>参考：https://stackoverflow.com/questions/61058955/unpermitted-parameter-photos-attributes</p>

<p>在controller增加，允许使用即可：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby"><span class="hljs-keyword">def</span> <span class="hljs-title function_">blog_form_params</span>
  params.<span class="hljs-keyword">require</span>(<span class="hljs-symbol">:blog_form</span>).permit(<span class="hljs-symbol">:title</span> , <span class="hljs-symbol">:content</span> ).merge!(<span class="hljs-symbol">user_id:</span> current_user.id , <span class="hljs-symbol">:photos_attributes</span> =&gt;[<span class="hljs-symbol">:image</span>, <span class="hljs-symbol">:id</span> ,<span class="hljs-symbol">:destroy</span> ])
<span class="hljs-keyword">end</span>
{% endhighlight %}

