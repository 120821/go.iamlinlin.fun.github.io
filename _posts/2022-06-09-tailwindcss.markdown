---
layout: post
title: "tailwind css的使用"
date: "2022-06-09"
categories: 
---
<p>安装不成功，就不要安装了直接复制链接在文档使用就可以了，可一看到一样的效果。</p> 
{% highlight html %}<code class="language-html">&lt;link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"&gt;{% endhighlight %} 
<p>创建config .rb文件，或者不同名字的文件在文件夹，知道自己引用的样式即可。文件内容比较少也可以不创建。样式占据了四五百行可以考虑进行整理。</p> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/7ce64c2f7ea04c878965734994bcf16c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> 整理好也就一百多一点。还是很方便的。</p> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/2596d6c3fa3b436aba74187967262b0f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p> 
<p>在项目上的属性：</p> 
<blockquote> 
<ul>
<li>{% highlight html %}order{% endhighlight %}</li>
<li>{% highlight html %}flex-grow{% endhighlight %}</li>
<li>{% highlight html %}flex-shrink{% endhighlight %}</li>
<li>{% highlight html %}flex-basis{% endhighlight %}</li>
<li>{% highlight html %}flex{% endhighlight %}</li>
<li>{% highlight html %}align-self{% endhighlight %}</li>
</ul>
</blockquote> 
<p>{% highlight html %}order{% endhighlight %}属性定义项目的排列顺序。数值越小，排列越靠前，默认为0。</p> 
<blockquote> 
<p>{% highlight html %}flex-grow{% endhighlight %}属性定义项目的放大比例，默认为{% highlight html %}0{% endhighlight %}，即如果存在剩余空间，也不放大。</p> 
<p>如果所有项目的{% highlight html %}flex-grow{% endhighlight %}属性都为1，则它们将等分剩余空间（如果有的话）。如果一个项目的{% highlight html %}flex-grow{% endhighlight %}属性为2，其他项目都为1，则前者占据的剩余空间将比其他项多一倍。</p> 
</blockquote> 
<p>{% highlight html %}flex-shrink{% endhighlight %}属性定义了项目的缩小比例，默认为1，即如果空间不足，该项目将缩小。</p> 
<p>如果所有项目的{% highlight html %}flex-shrink{% endhighlight %}属性都为1，当空间不足时，都将等比例缩小。如果一个项目的{% highlight html %}flex-shrink{% endhighlight %}属性为0，其他项目都为1，则空间不足时，前者不缩小。</p> 
<p>记不住没关系，可以多熟悉一下。</p>
