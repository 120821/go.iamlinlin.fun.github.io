---
layout: post
title: "使用js confirm 退出登录或者删除等危险操作的确认"
date: "2022-09-14"
categories: 
---
<p>视图页面：</p>

<pre>
<code>&lt;a href=&quot;javascript:void(0)&quot; onclick=&quot;disConnect()&quot;&gt;Disconnect&lt;/a&gt;</code></pre>

<p><code>js代码：</code></p>

<pre>
<code>/**

&nbsp;* 断开钱包

&nbsp;*/

function disConnect() {

&nbsp; if(confirm(&#39;确认退出吗&#39;)) {

&nbsp;&nbsp;&nbsp; if (!window.ethereum || !window.ethereum.isMetaMask) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;Please install MetaMask&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return

&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; $.ajax({

&nbsp;&nbsp;&nbsp;&nbsp; url: &#39;/front_ends/the_sign_out&#39;,

&nbsp;&nbsp;&nbsp;&nbsp; type: &#39;GET&#39;,

&nbsp;&nbsp;&nbsp;&nbsp; success: function(response) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;您已成功退出。&quot;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; location.href = &#39;/&#39;

&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; });

&nbsp; }

}</code></pre>

<p>点击退出，弹出确认与取消按钮进行确定</p>

<p><img height="147" src="/uploads/ckeditor/pictures/396/image-20220914092815-1.png" width="525" /></p>

