---
layout: post
title: "react button link的简单使用"
date: "2023-10-18"
categories: 
---
<p>在react中，使用button，转换为link:</p>

<p>1.确保已经安装依赖：</p>

<pre>
<code>npm install react-router-dom</code></pre>

<p><code>或：</code></p>

<pre>
<code>yarn add react-router-dom</code></pre>

<p><code>2.在组建引入link:</code></p>

<pre>
<code>import { Link } from &#39;react-router-dom&#39;;</code></pre>

<p><code>3.在页面使用link:</code></p>

<pre>
<code>&lt;Link to=&quot;/about&quot;&gt;关于&lt;/Link&gt;</code></pre>

<p><span style="font-family:monospace">react 我已经有了button，而且button已经有事件：</span></p>

<pre>
<code>&lt;Button onClick={this.handleForgetPassword} size=&quot;small&quot; className=&quot;&quot;&gt;
  忘记密码?
&lt;/Button&gt;</code></pre>

<p><code>事件：</code></p>

<pre>
<code> handleForgetPassword = () =&gt; {
   //this.props.history.push(`forget_password`)
   alert(&#39;请联系管理员&#39;);
 }</code></pre>

<p><span style="font-family:monospace">修改为：</span></p>

<p>1.增加：</p>

<pre>
<code>import { Link } from &#39;react-router-dom&#39;;</code></pre>

<p><code>2.修改button为link:</code></p>

<pre>
<code>&lt;Link to=&quot;/forget_password&quot; className=&quot;&quot; onClick={this.handleForgetPassword}&gt;
  忘记密码?
&lt;/Link&gt;</code></pre>

