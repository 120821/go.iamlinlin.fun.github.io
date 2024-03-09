---
layout: post
title: "go - crud postgres todos test"
date: "2022-10-25"
categories: 
---
<p><a href="https://blog.logrocket.com/building-simple-app-go-postgresql/">https://blog.logrocket.com/building-simple-app-go-postgresql/</a></p>

<p>创建server</p>

<pre>
<code>package main

import (
&nbsp; &quot;fmt&quot;
&nbsp; &quot;log&quot;
&nbsp; &quot;os&quot;

&nbsp; &quot;github.com/gofiber/fiber/v2&quot;

) func indexHandler(c *fiber.Ctx) error {

&nbsp; return c.SendString(&quot;Hello&quot;)

}

func postHandler(c *fiber.Ctx) error {

&nbsp; return c.SendString(&quot;Hello&quot;)

}

func putHandler(c *fiber.Ctx) error {

&nbsp; return c.SendString(&quot;Hello&quot;)

}

func deleteHandler(c *fiber.Ctx) error {

&nbsp; return c.SendString(&quot;Hello&quot;)

} func main() {

&nbsp; app := fiber.New() &nbsp; app.Get(&quot;/&quot;, indexHandler) &nbsp; app.Post(&quot;/&quot;, postHandler) &nbsp; app.Put(&quot;/update&quot;, putHandler) &nbsp; app.Delete(&quot;/delete&quot;, deleteHandler) &nbsp; port := os.Getenv(&quot;PORT&quot;)

&nbsp; if port == &quot;&quot; {

&nbsp;&nbsp;&nbsp; port = &quot;3000&quot;

&nbsp; }

&nbsp; log.Fatalln(app.Listen(fmt.Sprintf(&quot;:%v&quot;, port)))

}</code> </pre>

<p>下载需要的包：<a href="https://docs.gofiber.io/">https://docs.gofiber.io/</a></p>

<pre>
<code>
<code>go get github.com/gofiber/fiber/v2</code></code></pre>

<p>运行： <img height="124" src="/uploads/ckeditor/pictures/651/image-20221025173529-2.png" width="439" /> <img height="290" src="/uploads/ckeditor/pictures/650/image-20221025173455-1.png" width="934" /></p>

<p>然后运行：</p>

<p><code class="prettyprinted" style=""><span class="str">go mod init</span></code></p>

<p><code class="prettyprinted" style=""><span class="str">go mod tidy</span></code></p>

<p><img height="245" src="/uploads/ckeditor/pictures/652/image-20221025174035-1.png" width="746" /></p>

<p>引入：</p>

<p><code class="prettyprinted" style=""><span class="str">go get github.com/cosmtrek/air</span></code></p>

<p><code class="prettyprinted" style=""><span class="str">go run github.com/cosmtrek/air</span></code></p>

<p>&nbsp;</p>

