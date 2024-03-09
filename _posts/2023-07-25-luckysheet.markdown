---
layout: post
title: "Luckysheet 不显示功能菜单和标题"
date: "2023-07-25"
categories: 
---
<p>refer： <a href="https://dream-num.github.io/LuckysheetDocs/guide/config.html#configuration-item">https://dream-num.github.io/LuckysheetDocs/guide/config.html#configuration-item</a></p>

<p><a href="https://dream-num.github.io/LuckysheetDocs/guide/config.html#configuration-item">https://dream-num.github.io/LuckysheetDocs/guide/config.html#configuration-item</a></p>

<p>根据官方文档，把script文件的配置修改：</p>

{% highlight %}
{% highlight %}&nbsp; &lt;script&gt;

&nbsp;&nbsp;&nbsp; $(function () {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //配置项

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var options = {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container: &#39;luckysheet&#39;, //luckysheet为容器id

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title: &#39;hahah&#39;, // 居中的标题内容

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; showtoolbar: false, // 这一行就是不显示功能菜单的，可以把加粗 打印 链接 居中等功能不显示

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; userInfo: false //

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; luckysheet.create(options)

&nbsp;&nbsp;&nbsp; })

&nbsp; &lt;/script&gt;{% endhighlight %}

<p>&nbsp;</p>

