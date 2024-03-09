---
layout: post
title: "nginx React项目 登录问题，无法访问mysite.com/login"
date: "2023-08-17"
categories: 
---
<p>遇到的问题：</p>

<p>部署在nginx后，直接访问reactjs的路径，会提示 404 not found.</p>

<p>某个react项目，在本地运行的时候，可以直接访问localhost:3000/login,但是在部署到远程的服务器后，<br />
远程的域名为mysite.com, 此时可以直接访问该域名，但是无法访问mysite.com/login，错误提示： 404 not found<br />
远程服务器端文件是react 编译后的文件，<br />
远程nginx的配置是：</p>

<pre>
<code><span style="color:#ffd700">server</span> {
<span style="color:#ffd700">  listen</span>       80;
<span style="color:#ffd700">  server_name  mysite</span>.com;
<span style="color:#ffd700">  charset utf</span>-8;

<span style="color:#ffd700">  location</span> / {
<span style="color:#ffd700">    root</span> /tmp/build;
  }

}</code></pre>

<p>其实这是nginx配置的问题，nginx没有正确处理react路由。修改一下配置nginx的代码，然后重启nginx之后，就可以访问mysite.com/login了。</p>

<p><code>以下来自poe的回答：</code><br />
当你在使用React项目部署到远程服务器上，并且使用Nginx作为Web服务器时，遇到404 not found错误的问题，可能是因为Nginx无法正确处理React路由。</p>

<p>React应用程序使用前端路由来处理不同路径的页面。但是，当你使用Nginx作为反向代理时，它默认只会处理静态文件，而不会将路由请求重定向到React应用程序。</p>

<p>要解决这个问题，你可以配置Nginx来处理React的前端路由。下面是一个示例配置：</p>

<pre>
<code><span style="color:#00e0e0">server</span> {
  <span style="color:#ffd700">listen</span> <span style="color:#f5ab35">80</span>;
  <span style="color:#ffd700">server_name</span> mysite.com;
  <span style="color:#ffd700">charset</span> utf-<span style="color:#f5ab35">8</span>;

  <span style="color:#ffd700">root</span> /tmp/build;
  <span style="color:#ffd700">index</span> index.html;

  <span style="color:#ffd700">location</span> / {
    <span style="color:#ffd700">try_files</span> $uri $uri/ /index.html;
  }
}</code></pre>

<p>这个配置中，我们使用<code>try_files</code>指令来尝试匹配请求的文件路径。如果找不到文件，则将请求重定向到<code>index.html</code>。这样，React应用程序将能够处理路由并正确加载相应的页面。</p>

<p>请确保将<code>root</code>指令的路径设置为你的React应用程序构建后的静态文件目录。在示例中，我使用了<code>/tmp/build</code>作为示例路径，你需要将其替换为你实际的构建目录。</p>

