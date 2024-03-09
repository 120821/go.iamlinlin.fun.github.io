---
layout: post
title: "error： You must have ImageMagick or GraphicsMagick installed):"
date: "2023-04-20"
categories: 
---
<p><a href="https://stackoverflow.com/questions/31193495/error-original-error-imagemagick-graphicsmagick-is-not-installed">https://stackoverflow.com/questions/31193495/error-original-error-imagemagick-graphicsmagick-is-not-installed</a></p>

<p>在使用上传图片的时候出现了错误， 页面点击按钮&ldquo;确定&rdquo;进行上传图片的时候，没有反应。</p>

<p>修改controller：</p>

<pre>
<code>@@ -33,7 +33,7 @@ class EnterprisesController &lt; ApplicationController

&nbsp;&nbsp; # PATCH/PUT /enterprises/1

&nbsp;&nbsp; def update

-&nbsp;&nbsp;&nbsp; if @enterprise.update(enterprise_params)

+&nbsp;&nbsp;&nbsp; if @enterprise.update!(enterprise_params)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redirect_to @enterprise, notice: &#39;操作成功&#39;

&nbsp;&nbsp;&nbsp;&nbsp; else

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render :edit{% endhighlight %}

<p>再次操作，就看到了错误提示：</p>

<pre>
<code>You must have ImageMagick or GraphicsMagick installed):{% endhighlight %}

<p>安装：</p>

<pre>
<code>sudo apt-get install imagemagick{% endhighlight %}

