---
layout: post
title: "Make sure that `gem install rmagick -v '4.2.6'"
date: "2022-08-19"
categories: 
---
<p><a href="https://www.rubydoc.info/gems/rmagick/">Make sure that `gem install rmagick -v &#39;4.2.6&#39;</a></p>

<p>bundle install 的时候出现了错误，</p>

<p><img height="405" src="/uploads/ckeditor/pictures/300/image-20220819162852-1.png" width="1920" /></p>

<p><img height="243" src="/uploads/ckeditor/pictures/301/image-20220819162920-2.png" width="1494" /></p>

<pre class="code sh">
<code class="sh">解决：使用命令
sudo apt-get install libmagickwand-dev</code></pre>

<p><code class="sh">然后继续bundle install</code></p>

<p><code>安装成功</code></p>

<p><img height="832" src="/uploads/ckeditor/pictures/302/image-20220819163757-3.png" width="1494" /></p>

<p>&nbsp;</p>

