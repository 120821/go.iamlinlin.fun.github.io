---
layout: post
title: "vue3 图片的使用 require"
date: "2023-11-15"
categories: 
---
<p>我使用图片的时候发现图片并没有出现：(图片位于<code>src/assets</code>目录下)(<code>@</code>符号通常是用作别名，指向项目的根目录。)</p>

<pre>
<code><span style="color:#abe338">&quot;@/assets/zhuifeng_banner3.png&quot;</span></code></pre>

<p>代码段是这样：</p>

<pre>
<code>pictures: [
        { imageUrl: <span style="color:#abe338">&quot;path/to/image1.jpg&quot;</span> },
        { imageUrl: <span style="color:#abe338">&quot;path/to/image2.jpg&quot;</span> },
        { imageUrl: <span style="color:#abe338">&quot;path/to/image3.jpg&quot;</span> },
      ],</code></pre>

<p>解决：需要修改格式例如这样：</p>

<pre>
<code>data() {
  return {
    pictures: [
      { imageUrl: require(&quot;@/assets/image1.jpg&quot;) },
      { imageUrl: require(&quot;@/assets/image2.jpg&quot;) },
      { imageUrl: require(&quot;@/assets/image3.jpg&quot;) },
    ],
    swiper: null
  };
},</code></pre>

