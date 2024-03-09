---
layout: post
title: "postgres install 推荐使用asdf安装"
date: "2022-09-30"
categories: 
---
<div>普通的安装：</div>

<pre>
<code>sudo sh -c &#39;echo &quot;deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main&quot; &gt; /etc/apt/sources.list.d/pgdg.list&#39;

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update

sudo apt-get -y install postgresql</code></pre>

