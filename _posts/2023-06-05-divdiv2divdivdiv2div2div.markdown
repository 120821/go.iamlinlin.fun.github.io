---
layout: post
title: "为div和div2设置双击点击事件:默认显示div，双击div显示div2,双击div2显示div"
date: "2023-06-05"
categories: 
---
<p>可以使用JavaScript为div和div2元素添加双击事件监听器，然后在事件处理程序中切换它们的显示状态。以下是一个基本的实现：</p>

<pre>
<code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
	&lt;title&gt;双击切换显示&lt;/title&gt;
	&lt;style&gt;
		#div2 {
			display: none;
		}
	&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
	&lt;div id=&quot;div&quot;&gt;双击我显示div2&lt;/div&gt;
	&lt;div id=&quot;div2&quot;&gt;双击我显示div&lt;/div&gt;

	&lt;script&gt;
		var div = document.getElementById(&quot;div&quot;);
		var div2 = document.getElementById(&quot;div2&quot;);

		div.addEventListener(&quot;dblclick&quot;, function() {
			div.style.display = &quot;none&quot;;
			div2.style.display = &quot;block&quot;;
		});

		div2.addEventListener(&quot;dblclick&quot;, function() {
			div2.style.display = &quot;none&quot;;
			div.style.display = &quot;block&quot;;
		});
	&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>

<p>在上面的代码中，我们使用了CSS将div2元素初始隐藏。然后，我们使用JavaScript获取div和div2元素，并为它们分别添加双击事件监听器。在事件处理程序中，我们使用CSS的display属性来切换它们的显示状态。</p>

