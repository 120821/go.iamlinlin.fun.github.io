---
layout: post
title: "No route matches [GET] '/path/to/highlight.min.js'"
date: "2022-08-12"
categories:
---
<p><a href="https://itecnote.com/tecnote/javascript-actioncontrollerroutingerror-no-route-matches-get-members-js-bootstrap-min-jsmissing-asset-files/">https://itecnote.com/tecnote/javascript-actioncontrollerroutingerror-no-route-matches-get-members-js-bootstrap-min-jsmissing-asset-files/</a></p>
<p>在使用highlight的时候，出现了报错：No route matches [GET] &quot;/path/to/highlight.min.js</p>
<p>因为本地没有下载，所以切换为在线的即可</p>
<p>
-&nbsp;&nbsp;&nbsp; &lt;script src=&quot;/path/to/highlight.min.js&quot;&gt;&lt;/script&gt;
+&nbsp;&nbsp;&nbsp; &lt;script src=&quot;//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/highlight.min.js&quot;&gt;&lt;/script&gt;</p>
<p><img height="159" src="/uploads/ckeditor/pictures/212/image-20220812101555-1.png" width="1258" /></p>
<div class="mt-3 border-bottom border-success">
<h4 class="text-success"><span>Best Solution</span></h4>
</div>
<div class="bg-transparent mb-3">
<p>Change the Javascript file import to this:</p>
{% highlight html %}&lt;script src=&quot;/assets/bootstrap.min.js&quot;&gt;&lt;/script&gt;
{% endhighlight %}
<p>and the CSS link to this:</p>
{% highlight html %}&lt;link href=&quot;/assets/bootstrap.min.css&quot; media=&quot;all&quot; rel=&quot;stylesheet&quot; /&gt;
{% endhighlight %}
<p><img height="251" src="/uploads/ckeditor/pictures/213/image-20220812101717-2.png" width="896" /></p>
</div>
