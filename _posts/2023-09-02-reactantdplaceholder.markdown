---
layout: post
title: "react antd placeholder"
date: "2023-09-02"
categories: 
---
<p>refer: <a href="https://juejin.cn/s/antd%20change%20input%20placeholder%20color">https://juejin.cn/s/antd%20change%20input%20placeholder%20color</a></p>

<p>在react 中使用ant design 的inpu inpunumber select ，如果想要修改 placeholder的颜色，不能直接定义Css,例如下面这样，这样是不生效的：</p>

<pre>
<code>.my-input::placeholder {
  color: red;
}

&lt;Input placeholder=&quot;Enter your name&quot; className=&quot;my-input&quot; /&gt;
{% endhighlight %}

<p>可以使用这样的Css:</p>

<p>（1）input-number:</p>

<pre>
<code>import React from &#39;react&#39;;
import { InputNumber } from &#39;antd&#39;;

const YourComponent = () =&gt; {
  return (
    &lt;InputNumber className=&quot;ant-input-number-input&quot; placeholder=&quot;Enter a number&quot; /&gt;
  );
};

export default YourComponent;{% endhighlight %}

<p>在css文件增加：</p>

<pre>
<code><span style="color:#ffa07a">.ant-input-number-input</span>::placeholder {
  <span style="color:#ffd700">color</span>: red; <span style="color:#d4d0ab">/* 修改为你想要的颜色 */</span>
}{% endhighlight %}

<p>（2）其他的同理：</p>

<pre>
<code>.ant-select-selection__placeholder {

&nbsp; color: rgba(0, 0, 0, 0.68);

}

.ant-picker-input&gt;input::placeholder {

&nbsp; color: rgba(0, 0, 0, 0.68);

}

.ant-input {

&nbsp; &amp;::placeholder {

&nbsp;&nbsp;&nbsp; color: rgba(0, 0, 0, 0.68)!important;

&nbsp; }

}

.ant-input-number-input::placeholder {

&nbsp; color: rgba(0, 0, 0, 0.68);

}{% endhighlight %}

