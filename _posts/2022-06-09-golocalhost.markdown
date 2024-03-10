---
layout: post
title: "go localhost 的简单使用"
date: "2022-06-09"
categories: 
---
<p>首先在文件夹增加文件web.go</p> 
{% highlight html %}package main
import (
"net/http"
)
func main() {
http.Handle("/", http.FileServer(http.Dir(".")))
http.ListenAndServe(":8080", nil)
}
{% endhighlight %} 
<p>执行命令运行：{% highlight html %}go run web.go{% endhighlight %}</p> 
{% highlight html %}$ go run web.go{% endhighlight %} 
<p>然后打开本地的8080端口就可以看到自己文件夹下的所有文件点击可以查看</p> 
<p><img alt="" height="962" src="https://img-blog.csdnimg.cn/446a6d5b3cf946aab58c2519ce72de7c.png" width="751"></p>
