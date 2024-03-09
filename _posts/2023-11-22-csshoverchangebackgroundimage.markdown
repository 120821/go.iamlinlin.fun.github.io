---
layout: post
title: "css hover change background image"
date: "2023-11-22"
categories: 
---
<p>refer: <a href="https://www.studytonight.com/css-howtos/how-to-change-image-on-hover-with-css">https://www.studytonight.com/css-howtos/how-to-change-image-on-hover-with-css</a></p>

<p>使用这样的写法即可：</p>

<pre>
<code>&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;
&lt;head&gt;
&lt;meta charset=&quot;utf-8&quot;&gt;
&lt;title&gt;HTML&lt;/title&gt;
&lt;/head&gt;
&lt;style&gt;
   .change {
      height: 200px;
	  width: 300px;
      background-image: url(&quot;https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/tutorials/uploads/pictures/1626415729-101156.png&quot;) ;
	  background-repeat: no-repeat;
	  }
   .change:hover {
	  background-image: url(&quot;https://s3.ap-south-1.amazonaws.com/s3.studytonight.com/tutorials/uploads/pictures/1626415784-101156.png&quot;) ;
	  background-repeat: no-repeat;
	  }
&lt;/style&gt;
&lt;body&gt;
    &lt;h2&gt; Change image on hover&lt;/h2&gt;
	&lt;div class=&quot;change&quot;&gt;&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;{% endhighlight %}

