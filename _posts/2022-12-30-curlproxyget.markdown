---
layout: post
title: "curl proxy get 保存图片"
date: "2022-12-30"
categories: 
---
<p>refer： <a href="https://dannyda.com/2020/01/20/useful-curl-tips-download-upload-post-proxy-header-download-in-chunks-etc/#section1">https://dannyda.com/2020/01/20/useful-curl-tips-download-upload-post-proxy-header-download-in-chunks-etc/#section1</a></p>

<p>使用--output就可保存图片（文件）了</p>

<pre>
curl www.bing.com --output bing.htm</pre>

<p>使用proxy保存图到本地：</p>

<pre>
<code>command_get_image = %Q{curl -s --socks5 #{proxy.ip}:#{proxy.port} #{image_src} --output public/blog_images/#{image_name}}</code></pre>

