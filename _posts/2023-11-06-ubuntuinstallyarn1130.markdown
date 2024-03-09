---
layout: post
title: "ubuntu install yarn 1.13.0"
date: "2023-11-06"
categories: 
---
<p>1.安装包：</p>

<pre>
<code>curl -sS https:<span style="color:#ffa07a">//</span>dl.yarnpkg.com<span style="color:#ffa07a">/debian/</span>pubkey.gpg | sudo apt-key add -
echo <span style="color:#abe338">&quot;deb https://dl.yarnpkg.com/debian/ stable main&quot;</span> | sudo tee <span style="color:#ffa07a">/etc/</span>apt<span style="color:#ffa07a">/sources.list.d/y</span>arn.list</code></pre>

<p>2.更新：</p>

<pre>
<code>sudo apt <span style="color:#dcc6e0">update</span></code></pre>

<p>3.安装yarn</p>

<pre>
<code><span style="color:#ffd700">sudo</span> apt install yarn=<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">13</span>.<span style="color:#f5ab35">0</span>-<span style="color:#f5ab35">1</span></code></pre>

<p>4.查看是否成功：</p>

<pre>
<code>yarn --version</code></pre>

<p>&nbsp;</p>

