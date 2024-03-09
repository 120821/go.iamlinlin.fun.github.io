---
layout: post
title: "rails CarrierWave上传图片，列的类型为binary"
date: "2023-04-20"
categories: 
---
<p>1.要保存图像，建议将 &quot;image&quot; 列的类型设置为二进制类型（BLOB），以便在数据库中保存图像的二进制数据。在 Rails 中，可以使用以下方式在数据库迁移中创建二进制列：</p>

<pre>
<code>class AddImageToProducts &lt; ActiveRecord::Migration[6.1]

&nbsp; def change

&nbsp;&nbsp;&nbsp; add_column :products, :image, :binary

&nbsp; end

end</code></pre>

<p>注意，这将在数据库中创建一个名为 &quot;image&quot; 的二进制列，您可以在模型中使用相应的字段与它进行交互。 另外需要注意的是，将图像保存到数据库可能会使数据库变得庞大，您可以考虑将图像保存到磁盘上的文件系统中，例如在上面提到的 CarrierWave 或者 Paperclip 中。</p>

<p>2.前端展示</p>

<p>如果 `image` 列的数据类型是二进制（`BLOB`），则需要将其转换为可以在前端显示的图像格式（例如 JPEG、PNG、GIF）。您可以使用 Ruby 中的 Base64 编码和解码功能来实现此目的。例如，在 Rails 视图中，您可以使用以下代码：</p>

<pre>
<code>&lt;%= image_tag &quot;data:image/png;base64,#{Base64.encode64(@product.image)}&quot; %&gt;</code></pre>

<p>这将生成一个带有 Base64 编码后图像数据的图像 URL，并将其用作 `&lt;img&gt;` 标签的数据源来展示图像。需要注意的是，这种方法可能会在页面加载时增加一些额外的时间和带宽成本，因为浏览器首先需要将 Base64 编码的图像数据下载到内存中，然后才能将其呈现为图像。</p>

<p>3.修改nginx的配置，重启nginx</p>

<pre>
<code>server {

&nbsp; listen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 80;

&nbsp; server_name&nbsp; server_name.com;

&nbsp; charset utf-8;

&nbsp; client_max_body_size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 500m;

&nbsp; location ~ ^/uploads/ {

&nbsp;&nbsp;&nbsp; #root /root/app/sneak_data/public;

&nbsp;&nbsp;&nbsp; root /opt/app/baogongpingtai-pc/public;

&nbsp; }

&nbsp; location / {

&nbsp;&nbsp;&nbsp; proxy_pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; http://server_name_server;

&nbsp;&nbsp;&nbsp; proxy_set_header&nbsp;&nbsp;&nbsp; X-Forwarded-For $proxy_add_x_forwarded_for;

&nbsp;&nbsp;&nbsp; proxy_set_header&nbsp;&nbsp;&nbsp; X-Real-IP $remote_addr;

&nbsp;&nbsp;&nbsp; proxy_set_header&nbsp;&nbsp;&nbsp; Host $http_host;

&nbsp;&nbsp;&nbsp; proxy_next_upstream http_502 http_504 error timeout invalid_header;

&nbsp; }

#&nbsp; location ~ ^/assets/ {

#&nbsp;&nbsp;&nbsp; root /opt/app/sneak_data/public;

#&nbsp;&nbsp;&nbsp; #expires 1y;

#&nbsp;&nbsp;&nbsp; #add_header Cache-Control public;

#&nbsp;&nbsp;&nbsp; #add_header ETag &quot;&quot;;

#&nbsp;&nbsp;&nbsp; break;

#&nbsp; }

}

upstream server_name_server{

&nbsp; server 127.0.0.1:3001;

}</code></pre>

<p>停止nginx(在任意文件夹即可）</p>

<pre>
<code>sudo nginx -s stop</code></pre>

<p>启动nginx</p>

<pre>
<code>sudo nginx</code></pre>

