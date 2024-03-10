---
layout: post
title: "css实现tooltip "
date: "2022-10-13"
categories: 
---
<p><a href="https://www.w3schools.com/css/tryit.asp?filename=trycss_tooltip">css实现tooltip</a></p>
<p>使用css实现tooltip（可以自行调整tooltip的宽度字体颜色背景色）：</p>
{% highlight html %}&lt;style&gt;
.tooltip {
&nbsp; position: relative;
&nbsp; display: inline-block;
&nbsp; border-bottom: 1px dotted black;
}
.tooltip .tooltiptext {
&nbsp; visibility: hidden;
&nbsp; width: 120px;
&nbsp; background-color: black;
&nbsp; color: #fff;
&nbsp; text-align: center;
&nbsp; border-radius: 6px;
&nbsp; padding: 5px 0;
&nbsp; /* Position the tooltip */<br />
&nbsp; position: absolute;<br />
&nbsp; z-index: 1;<br />
} .tooltip:hover .tooltiptext {<br />
&nbsp; visibility: visible;<br />
}<br />
&lt;/style&gt;<br />
&lt;body style=&quot;text-align:center;&quot;&gt; &lt;h2&gt;Basic Tooltip&lt;/h2&gt; &lt;p&gt;Move the mouse over the text below:&lt;/p&gt; &lt;div class=&quot;tooltip&quot;&gt;Hover over me<br />
&nbsp; &lt;span class=&quot;tooltiptext&quot;&gt;Tooltip text&lt;/span&gt;<br />
&lt;/div&gt; &lt;p&gt;Note that the position of the tooltip text isn&#39;t very good. Go back to the tutorial and continue reading on how to position the tooltip in a desirable way.&lt;/p&gt;{% endhighlight %}
<p><img height="112" src="/uploads/ckeditor/pictures/584/image-20221013085956-1.png" width="527" /></p>
