---
layout: post
title: "asdf ruby install error"
date: "2022-11-04"
categories: 
---
<p><a href="http://siwei.me/blog/posts/install-libs-on-bare-linux">http://siwei.me/blog/posts/install-libs-on-bare-linux</a></p>

<p>使用第三方包：</p>

<p>sudo apt-get install libapr1-dev libxml2-dev libxslt1-dev libmysqlclient-dev git curl build-essential libssl-dev libreadline-dev build-essential libssl-dev libreadline-dev vim libcurl4 ruby-dev zlib1g-dev liblzma-dev ruby-all-dev</p>

<p>安装ruby ：</p>

<pre class="hljs php">
$ git <span class="hljs-keyword">clone</span> git:<span class="hljs-comment">//github.com/sstephenson/rbenv.git ~/.rbenv</span>
<span class="hljs-keyword">echo</span> <span class="hljs-string">&#39;export PATH=&quot;$HOME/.rbenv/bin:$PATH&quot;&#39;</span> &gt;&gt; ~/.bashrc
<span class="hljs-keyword">echo</span> <span class="hljs-string">&#39;eval &quot;$(rbenv init -)&quot;&#39;</span> &gt;&gt; ~/.bashrc
exec <span class="hljs-variable">$SHELL</span> -l
git <span class="hljs-keyword">clone</span> git:<span class="hljs-comment">//github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build</span>
rbenv install <span class="hljs-number">1.9</span><span class="hljs-number">.3</span>-p551
如果安装失败 , 则加上 前缀: 

RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install <span class="hljs-number">2.5</span><span class="hljs-number">.0</span> </pre>

<p>&nbsp;</p>

<p>下面的不要看了，都是报错的内容。</p>

<p>error：Command &#39;rbenv&#39; not found</p>

<p>但是下载的时候，提示已经存在了：</p>

<p>git clone git://github.com/sstephenson/rbenv.git .rbenv</p>

<p>fatal: destination path &#39;.rbenv&#39; already exists and is not an empty directory.</p>

<p><img height="206" src="/uploads/ckeditor/pictures/689/image-20221104102537-1.png" width="976" /></p>

