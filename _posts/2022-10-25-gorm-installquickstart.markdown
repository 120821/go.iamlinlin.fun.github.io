---
layout: post
title: "gorm - install Quick Start"
date: "2022-10-25"
categories: 
---
<p><a href="https://gorm.io/docs/">https://gorm.io/docs/</a></p>

<p>安装：</p>

{% highlight %}
<span class="line">go get -u gorm.io/gorm</span>
<span class="line">go get -u gorm.io/driver/sqlite</span>{% endhighlight %}

<p><img height="302" src="/uploads/ckeditor/pictures/645/image-20221025110012-1.png" width="780" /></p>

<p>Quick Start</p>

<p>使用postgres：</p>

<p>go get gorm.io/driver/postgres</p>

<p><img height="399" src="/uploads/ckeditor/pictures/646/image-20221025110700-2.png" width="905" /></p>

<p>连接数据库，创建新表,创建数据crud：</p>

{% highlight %}package main

import (<br />
&nbsp; &quot;gorm.io/gorm&quot;<br />
&nbsp; //&nbsp; &quot;gorm.io/driver/sqlite&quot;<br />
&nbsp; //引入sql<br />
&nbsp; &quot;gorm.io/driver/postgres&quot;<br />
&nbsp; //引入 postgres<br />
)

type Product struct {<br />
&nbsp; gorm.Model<br />
&nbsp; Code&nbsp; string<br />
&nbsp; Price uint<br />
}

type Apple struct {<br />
&nbsp;&nbsp; &nbsp;Id&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp; `gorm:&quot;primary_key&quot;`<br />
&nbsp;&nbsp; &nbsp;Name string `gorm:&quot;type:varchar(50);not null;index:ip_idx&quot;`<br />
&nbsp;&nbsp; &nbsp;Color int&nbsp;&nbsp;&nbsp; `gorm:&quot;not null&quot;`<br />
&nbsp;&nbsp; &nbsp;Addr string `gorm:&quot;type:varchar(50);not null;&quot;`<br />
}

func main() {<br />
&nbsp; dsn := &quot;host=localhost user=admin password=88888888 dbname=blogs port=5432 sslmode=disable TimeZone=Asia/Shanghai&quot;<br />
&nbsp; db, err := gorm.Open(postgres.Open(dsn), &amp;gorm.Config{})<br />
&nbsp; if err != nil {<br />
&nbsp;&nbsp;&nbsp; panic(&quot;failed to connect database&quot;)<br />
&nbsp; }

&nbsp; // Migrate the schema<br />
&nbsp; db.AutoMigrate(&amp;Product{})

&nbsp; // Create<br />
&nbsp; db.Create(&amp;Product{Code: &quot;D42&quot;, Price: 100})

&nbsp; // Read<br />
&nbsp; var product Product<br />
&nbsp; db.First(&amp;product, 1) // find product with integer primary key<br />
&nbsp; db.First(&amp;product, &quot;code = ?&quot;, &quot;D42&quot;) // find product with code D42

&nbsp; // Update - update product&#39;s price to 200<br />
&nbsp; db.Model(&amp;product).Update(&quot;Price&quot;, 200)<br />
&nbsp; // Update - update multiple fields<br />
&nbsp; db.Model(&amp;product).Updates(Product{Price: 200, Code: &quot;F42&quot;}) // non-zero fields<br />
&nbsp; db.Model(&amp;product).Updates(map[string]interface{}{&quot;Price&quot;: 200, &quot;Code&quot;: &quot;F42&quot;})

&nbsp; // Delete - delete product<br />
&nbsp; db.Delete(&amp;product, 1)<br />
}{% endhighlight %}

<p>可以看到数据库已经创建了新表，并更新了数据。</p>

<p><img height="168" src="/uploads/ckeditor/pictures/647/image-20221025162115-1.png" width="870" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

