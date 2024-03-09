---
layout: post
title: "windows 小程序的css转换"
date: "2023-12-04"
categories: 
---
<p>对于我react的css,我需要转化为这样的内容：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
<code><span style="color:#dcc6e0">body</span> {
  <span style="color:#ffd700">background-image</span>: <span style="color:#f5ab35">url</span>(<span style="color:#abe338">&#39;friends.jpeg&#39;</span>);
  <span style="color:#ffd700">height</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">background-position</span>: center center;
  <span style="color:#ffd700">background-size</span>: cover;
  <span style="color:#ffd700">background-attachment</span>: fixed;
}

<span style="color:#ffa07a">.created_at</span> {
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">80%</span>;
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">text-align</span>: center;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">line-height</span>: <span style="color:#f5ab35">1.5</span>;
}

<span style="color:#ffa07a">.title</span> {
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">80%</span>;
  <span style="color:#ffd700">text-align</span>: center;
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">20px</span>;
  <span style="color:#ffd700">line-height</span>: <span style="color:#f5ab35">1.5</span>;
}

<span style="color:#ffa07a">.content</span> {
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">80%</span>;
  <span style="color:#ffd700">height</span>: auto;
  <span style="color:#ffd700">line-height</span>: <span style="color:#f5ab35">1.5</span>;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">30px</span>;
}

<span style="color:#ffa07a">.blog-page</span> {
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-position</span>: center center;
  <span style="color:#ffd700">background-size</span>: cover;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">min-width</span>: <span style="color:#f5ab35">1080</span>rpx;
  <span style="color:#ffd700">min-height</span>: <span style="color:#f5ab35">1080</span>rpx;
}

<span style="color:#ffa07a">.show-blog</span> {
  <span style="color:#ffd700">background-color</span>: <span style="color:#f5ab35">rgba</span>(<span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">0.3</span>);
  <span style="color:#ffd700">border-radius</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">overflow</span>: auto;
  <span style="color:#ffd700">max-width</span>: <span style="color:#f5ab35">1140</span>rpx;
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-position</span>: center center;
  <span style="color:#ffd700">background-size</span>: cover;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">min-width</span>: <span style="color:#f5ab35">1080</span>rpx;
  <span style="color:#ffd700">min-height</span>: <span style="color:#f5ab35">1080</span>rpx;
}

<span style="color:#ffa07a">.a-link</span> {
  <span style="color:#ffd700">color</span>: white;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">text-decoration</span>: none;
  <span style="color:#ffd700">margin-left</span>: <span style="color:#f5ab35">20px</span>;
}

<span style="color:#ffa07a">.blogs-page</span> {
  <span style="color:#ffd700">display</span>: flex;
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-position</span>: center center;
  <span style="color:#ffd700">background-size</span>: cover;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">min-width</span>: <span style="color:#f5ab35">1080</span>rpx;
  <span style="color:#ffd700">min-height</span>: <span style="color:#f5ab35">1080</span>rpx;
}

<span style="color:#ffa07a">.blog-list-title-top</span> {
  <span style="color:#ffd700">text-align</span>: center;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">20px</span>;
  <span style="color:#ffd700">font-weight</span>: <span style="color:#f5ab35">700</span>;
  <span style="color:#ffd700">padding-top</span>: <span style="color:#f5ab35">10px</span>;
  <span style="color:#ffd700">padding-bottom</span>: <span style="color:#f5ab35">5px</span>;
  <span style="color:#ffd700">color</span>: snow;
}

<span style="color:#ffa07a">.container-right</span> {
  <span style="color:#ffd700">height</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">795</span>rpx;
  <span style="color:#ffd700">background-color</span>: <span style="color:#f5ab35">rgba</span>(<span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">0.3</span>);
  <span style="color:#ffd700">border-radius</span>: <span style="color:#f5ab35">20px</span>;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">overflow</span>: auto;
}

<span style="color:#ffa07a">.home-link</span> {
  <span style="color:#ffd700">margin-left</span>: <span style="color:#f5ab35">12%</span>;
  <span style="color:#ffd700">color</span>: snow;
}

<span style="color:#ffa07a">.container-left</span> {
  <span style="color:#ffd700">height</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">200</span>rpx;
  <span style="color:#ffd700">margin-left</span>: <span style="color:#f5ab35">5%</span>;
}

<span style="color:#ffa07a">.card</span> <span style="color:#dcc6e0">a</span> {
  <span style="color:#ffd700">display</span>: block;
  <span style="color:#ffd700">text-decoration</span>: none;
  <span style="color:#ffd700">text-align</span>: center;
  <span style="color:#ffd700">color</span>: snow;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">3px</span>;
  <span style="color:#ffd700">color</span>: grey;
}

<span style="color:#ffa07a">.card-link-div</span> {
  <span style="color:#ffd700">margin-top</span>: <span style="color:#f5ab35">10px</span>;
}

<span style="color:#ffa07a">.card</span> {
  <span style="color:#ffd700">position</span>: relative;
  <span style="color:#ffd700">display</span>: flex;
  <span style="color:#ffd700">flex-direction</span>: column;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">30px</span>;
  <span style="color:#ffd700">min-width</span>: <span style="color:#f5ab35">0</span>;
  <span style="color:#ffd700">word-wrap</span>: break-word;
  <span style="color:#ffd700">background-color</span>: <span style="color:#f5ab35">#fff</span>;
  <span style="color:#ffd700">background-clip</span>: border-box;
  <span style="color:#ffd700">border</span>: <span style="color:#f5ab35">1px</span> solid <span style="color:#f5ab35">rgba</span>(<span style="color:#f5ab35">0</span>, <span style="color:#f5ab35">0</span>, <span style="color:#f5ab35">0</span>, <span style="color:#f5ab35">0.125</span>);
  <span style="color:#ffd700">border-radius</span>: <span style="color:#f5ab35">4px</span>;
}

<span style="color:#ffa07a">.blog-list-title-simple</span> {
  <span style="color:#ffd700">margin-top</span>: <span style="color:#f5ab35">0</span>;
  <span style="color:#ffd700">margin-bottom</span>: <span style="color:#f5ab35">1rem</span>;
  <span style="color:#ffd700">color</span>: snow;
  <span style="color:#ffd700">font-size</span>: <span style="color:#f5ab35">28</span>rpx;
  <span style="color:#ffd700">font-weight</span>: <span style="color:#f5ab35">400</span>;
  <span style="color:#ffd700">line-height</span>: <span style="color:#f5ab35">1.5</span>;
  <span style="color:#ffd700">color</span>: <span style="color:#f5ab35">#212529</span>;
  <span style="color:#ffd700">text-align</span>: left;
}

<span style="color:#ffa07a">.list-blog</span> {
  <span style="color:#ffd700">background-color</span>: <span style="color:#f5ab35">rgba</span>(<span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">255</span>, <span style="color:#f5ab35">0.3</span>);
  <span style="color:#ffd700">border-radius</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">overflow</span>: auto;
  <span style="color:#ffd700">max-width</span>: <span style="color:#f5ab35">940</span>rpx;
  <span style="color:#ffd700">margin</span>: <span style="color:#f5ab35">0</span> auto;
  <span style="color:#ffd700">padding</span>: <span style="color:#f5ab35">16px</span>;
  <span style="color:#ffd700">background-position</span>: center center;
  <span style="color:#ffd700">background-size</span>: cover;
  <span style="color:#ffd700">background-attachment</span>: fixed;
  <span style="color:#ffd700">width</span>: <span style="color:#f5ab35">100%</span>;
  <span style="color:#ffd700">min-width</span>: <span style="color:#f5ab35">800</span>rpx;
  <span style="color:#ffd700">min-height</span>: <span style="color:#f5ab35">1080</span>rpx;
}

<span style="color:#dcc6e0">a</span>:hover {
  <span style="color:#ffd700">color</span>: white <span style="color:#f5ab35">!important</span>;
}{% endhighlight %}

