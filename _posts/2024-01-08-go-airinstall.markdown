---
layout: post
title: "go-air install"
date: "2024-01-08"
categories: 
---
<p>refer： <a href="https://github.com/cosmtrek/air/blob/master/README.md">https://github.com/cosmtrek/air/blob/master/README.md</a></p>
<p>如果使用asdf go无法安装air,可以使用sh方法：（有效）</p>
{% highlight html %}
# binary will be $(go env GOPATH)/bin/air
curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
# or install it into ./bin/
curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s
air -v{% endhighlight %}
<p>然后就可以启动go项目了。</p>
<p>&nbsp;</p>
