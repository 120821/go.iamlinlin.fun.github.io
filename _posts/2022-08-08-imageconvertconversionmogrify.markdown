---
layout: post
title: "图片转换 image convert conversion mogrify"
date: "2022-08-08"
categories: 
---
<p><a href="http://siwei.me/blog/posts/image-convert-conversion-mogrify">http://siwei.me/blog/posts/image-convert-conversion-mogrify</a></p>

<p>官网：<a href="https://github.com/inkscape/inkscape">https://github.com/inkscape/inkscape</a></p>

<p>svg -&gt; png:</p>

<p>可以使用ffmpeg</p>

<p>更专业的是 inkscape</p>

<pre class="hljs ruby">
<span class="hljs-constant">Dir</span>.glob(<span class="hljs-string">&#39;*.svg&#39;</span>).each <span class="hljs-keyword">do</span> |file|
  puts <span class="hljs-string">&quot;== processing file: <span class="hljs-subst">#{file}</span>&quot;</span>
  inkscape = <span class="hljs-string">&#39;/mnt/d/softwares/Inkscape/bin/inkscape.exe&#39;</span>
  command = <span class="hljs-string">&quot;<span class="hljs-subst">#{inkscape}</span> -o <span class="hljs-subst">#{file.sub(<span class="hljs-string">&#39;.svg&#39;</span>, <span class="hljs-string">&#39;&#39;</span>)}</span>.png -w 1080 <span class="hljs-subst">#{file}</span>&quot;</span>
  <span class="hljs-string">`<span class="hljs-subst">#{command}</span>`</span>
<span class="hljs-keyword">end</span>
{% endhighlight %}

<p>png -&gt; jpg</p>

<p>mogrify -format jpg MY-PNG-FILE.png</p>

<pre class="hljs ruby">
<span class="hljs-constant">Dir</span>.glob(<span class="hljs-string">&#39;*.png&#39;</span>).each <span class="hljs-keyword">do</span> |file|
  puts <span class="hljs-string">&quot;== processing file: <span class="hljs-subst">#{file}</span>&quot;</span>
  command = <span class="hljs-string">&quot;mogrify -format jpg <span class="hljs-subst">#{file}</span>&quot;</span>
  <span class="hljs-string">`<span class="hljs-subst">#{command}</span>`</span>
<span class="hljs-keyword">end</span>
{% endhighlight %}

