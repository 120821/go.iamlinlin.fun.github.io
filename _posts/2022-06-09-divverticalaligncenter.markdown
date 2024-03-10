---
layout: post
title: "div vertical align center"
date: "2022-06-09"
categories: 
---
<p>文字不能横向居中时，有不同方法调整</p> 
<blockquote> 
<p><strong>可以把行高调整与边框相同的高度</strong></p> 
<p>line-height 与 height相等，但是这种方法在不同的浏览器看起来效果不同，不建议使用</p> 
<p>比如火狐和谷歌就会产生不同的页面效果</p> 
</blockquote> 
<blockquote> 
<p>可以<strong>加上样式</strong>定义</p> 
{% highlight html %}display: flex;
justify-content: center;
align-items: center;
height: 200px;{% endhighlight %} 
<p>但是这样写，不同浏览器的字号会发生变化，位置会相对美观，只需要加上字号即可。</p> 
</blockquote>
