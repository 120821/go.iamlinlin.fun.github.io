---
layout: post
title: "vue3 图片的使用 require"
date: "2023-11-15"
categories: 
---
<p>我使用图片的时候发现图片并没有出现：(图片位于{% highlight %}src/assets{% endhighlight %}目录下)({% highlight %}@{% endhighlight %}符号通常是用作别名，指向项目的根目录。)</p>

{% highlight %}
{% highlight %}<span style="color:#abe338">&quot;@/assets/zhuifeng_banner3.png&quot;</span>{% endhighlight %}

<p>代码段是这样：</p>

{% highlight %}
{% highlight %}pictures: [
        { imageUrl: <span style="color:#abe338">&quot;path/to/image1.jpg&quot;</span> },
        { imageUrl: <span style="color:#abe338">&quot;path/to/image2.jpg&quot;</span> },
        { imageUrl: <span style="color:#abe338">&quot;path/to/image3.jpg&quot;</span> },
      ],{% endhighlight %}

<p>解决：需要修改格式例如这样：</p>

{% highlight %}
{% highlight %}data() {
  return {
    pictures: [
      { imageUrl: require(&quot;@/assets/image1.jpg&quot;) },
      { imageUrl: require(&quot;@/assets/image2.jpg&quot;) },
      { imageUrl: require(&quot;@/assets/image3.jpg&quot;) },
    ],
    swiper: null
  };
},{% endhighlight %}

