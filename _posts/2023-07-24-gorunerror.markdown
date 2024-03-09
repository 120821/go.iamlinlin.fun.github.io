---
layout: post
title: "go run error "
date: "2023-07-24"
categories: 
---
<p>运行go run main.go的时候出现了错误：</p>

<pre>
<code>routers/api/v1/verification_code.go:10:2: github.com/aliyun/alibaba-cloud-sdk-go@v1.62.429: Get &quot;https://proxy.golang.org/github.com/aliyun/alibaba-cloud-sdk-go/@v/v1.62.429.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

routers/api/auth.go:7:2: github.com/astaxie/beego@v1.12.3: Get &quot;https://proxy.golang.org/github.com/astaxie/beego/@v/v1.12.3.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

pkg/util/jwt.go:6:2: github.com/dgrijalva/jwt-go@v3.2.0+incompatible: Get &quot;https://proxy.golang.org/github.com/dgrijalva/jwt-go/@v/v3.2.0+incompatible.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

routers/router.go:4:2: github.com/gin-contrib/cors@v1.4.0: Get &quot;https://proxy.golang.org/github.com/gin-contrib/cors/@v/v1.4.0.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

main.go:7:2: github.com/gin-gonic/gin@v1.9.1: Get &quot;https://proxy.golang.org/github.com/gin-gonic/gin/@v/v1.9.1.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

pkg/setting/setting.go:7:2: github.com/go-ini/ini@v1.67.0: Get &quot;https://proxy.golang.org/github.com/go-ini/ini/@v/v1.67.0.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

models/models.go:8:2: github.com/jinzhu/gorm@v1.9.16: Get &quot;https://proxy.golang.org/github.com/jinzhu/gorm/@v/v1.9.16.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

models/models.go:9:2: github.com/jinzhu/gorm@v1.9.16: Get &quot;https://proxy.golang.org/github.com/jinzhu/gorm/@v/v1.9.16.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

models/calculation_plans.go:3:8: github.com/lib/pq@v1.10.9: Get &quot;https://proxy.golang.org/github.com/lib/pq/@v/v1.10.9.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout

pkg/util/pagination.go:6:2: github.com/unknwon/com@v1.0.1: Get &quot;https://proxy.golang.org/github.com/unknwon/com/@v/v1.0.1.zip&quot;: dial tcp 142.251.42.241:443: i/o timeout{% endhighlight %}

<p>这个错误提示显示了在下载依赖包时出现了网络连接超时的问题。你可以尝试以下几个解决方法：</p>

<p>1. 检查你的网络连接是否正常，确保你能够正常访问这些依赖包的下载地址。<br />
2. 如果你使用了代理，请检查代理配置是否正确，并根据需要进行相应的调整。<br />
3. 有时候，这个错误可能只是暂时的问题，你可以稍后再尝试一次，看是否能够正常下载依赖包。</p>

<p>另外，你还可以尝试使用国内的镜像源来下载依赖包，比如使用 goproxy.io 或者 proxy.golang.org.cn。你可以通过设置环境变量来切换镜像源，例如：修改~/.bashrc</p>

<p>增加：</p>

<pre>
<code>export GOPROXY=https://goproxy.io{% endhighlight %}

<p>然后</p>

<pre>
<code>source ~/.bashrc{% endhighlight %}

<p>重新运行即可</p>

<p>&nbsp;</p>

