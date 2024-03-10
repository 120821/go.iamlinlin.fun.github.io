---
layout: post
title: "Ubuntu ffmpeg webm 转mp4"
date: "2023-10-19"
categories: 
---
<p>refer:&nbsp;<a href="https://www.aconvert.com/tw/video/webm-to-mp4/">https://www.aconvert.com/tw/video/webm-to-mp4/</a></p>
<p><a href="https://blog.csdn.net/qq_31375855/article/details/124043264">https://blog.csdn.net/qq_31375855/article/details/124043264</a></p>
<p>进入网站，直接上传文件即可转换，但是转换的很慢。</p>
<p>推荐使用Ubuntu的ffmpeg</p>
<p>1.进入有webm视频的文件夹：</p>
{% highlight html %}cd /home/linlin/Videos/Screencasts/{% endhighlight %}
<p>2.使用命令转换（很方便)：({% highlight html %}-vf{% endhighlight %} 后面所带参数的意义是，将视频的长宽强制转换为偶数，否则可能遇到 <strong>&ldquo;width not divisible by 2&rdquo;</strong> 的问题。)</p>
{% highlight html %}&nbsp;ffmpeg -i Tooltip.webm -vf &#39;scale=trunc(iw/2)*2:trunc(ih/2)*2&#39; tooltip.mp4{% endhighlight %}
