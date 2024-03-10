---
layout: post
title: "wget 重命名 rename"
date: "2022-10-27"
categories: 
---
<p><a href="https://www.tecmint.com/rename-downloaded-file-with-wget-in-linux/">https://www.tecmint.com/rename-downloaded-file-with-wget-in-linux/</a></p>
<p>示例：</p>
{% highlight html %}wget -cO - https://gist.github.com/chales/11359952/archive/25f48802442b7986070036d214a2a37b8486282d.zip &gt; db-connection-test.zip{% endhighlight %}
<p>测试：</p>
{% highlight html %}wget https://errors.aliyun.com/images/TB15QGaHpXXXXXOaXXXXia39XXX-660-117.png{% endhighlight %}
<p><img height="368" src="/uploads/ckeditor/pictures/666/image-20221027164528-3.png" width="1491" /></p>
{% highlight html %}wget -cO - https://errors.aliyun.com/images/TB15QGaHpXXXXXOaXXXXia39XXX-660-117.png &gt; hi.png{% endhighlight %}
<p><img height="425" src="/uploads/ckeditor/pictures/665/image-20221027164441-2.png" width="1841" /></p>
