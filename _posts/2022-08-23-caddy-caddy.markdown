---
layout: post
title: "caddy - caddy 的基本用法和使用 "
date: "2022-08-23"
categories:
---
<p><a href="http://siwei.me/blog/posts/caddy-caddy">caddy - caddy 的基本用法和使用 </a></p>
<p>caddy: 一种类似于轻量nginx吧</p>
<p>非常好玩，文件夹中： caddy 命令， CaddyFile</p>
<p>配置CaddyFile即可。</p>
<p>然后 ./caddy restart 就行。</p>
<p>等同于nginx -s reload</p>
<p>Caddy 与rails配合使用</p>
<p>1. rails 正常启动：</p>
<pre class="hljs bash">
bundle 
bundle <span class="hljs-built_in">exec</span> rails webpacker:install 
bundle <span class="hljs-built_in">exec</span> rake db assets:compile 
bundle <span class="hljs-built_in">exec</span> rails s -p <span class="hljs-number">3355</span>
<p>然后caddy中增加：</p>
<pre class="hljs coffeescript">
homeland.yoursite.com {
encode zstd gzip
root * /opt/app/homeland/current/public
file_server
<span class="hljs-property">@notStatic</span> {
<span class="hljs-keyword">not</span> file
}
reverse_proxy <span class="hljs-property">@notStatic</span> <span class="hljs-number">127.0</span><span class="hljs-number">.0</span><span class="hljs-number">.1</span>:<span class="hljs-number">3355</span>
header / { 
Strict-Transport-Security <span class="hljs-string">&quot;max-age=31536000&quot;</span>
}
}
