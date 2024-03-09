---
layout: post
title: "rails - 阿里云部署rails项目"
date: "2022-09-05"
categories: 
---
<p>1.购买服务器，重置密码，解析域名</p>

<p>2.安装环境，运行项目，</p>

<pre><code>apt install git
apt install bundler
bundle install</code></pre>
<p>然后运行bundle install 出现了报错<a href="https://stackoverflow.com/questions/39511485/an-error-occurred-while-installing-pg-0-18-4-and-bundler-cannot-continue">https://stackoverflow.com/questions/39511485/an-error-occurred-while-installing-pg-0-18-4-and-bundler-cannot-continue</a></p>
<pre><code>An error occurred while installing pg (0.18.4),</code></pre>
<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">解决：
sudo apt-get install libpq-dev</code></pre>
<p>然后继续bundle install 就可以了</p>
<p>修改<pre><code>config/datebase.yml</code></pre></p>
<p>然后<pre><code>rake db:migrate</code></pre></p>
<p>出现了报错<a href="https://stackoverflow.com/questions/34420554/there-was-an-error-while-trying-to-load-the-gem-uglifier-bundlergemrequire">https://stackoverflow.com/questions/34420554/there-was-an-error-while-trying-to-load-the-gem-uglifier-bundlergemrequire</a></p>
<pre><code>There was an error while trying to load the gem &#39;uglifier&#39;</code></pre>
<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">解决：sudo apt-get install nodejs</code></pre>
<p>还是不能连上pg数据库，安装：<a href="https://www.postgresql.org/download/linux/ubuntu/">https://www.postgresql.org/download/linux/ubuntu/</a></p>
<pre class="code" id="script-box">
<code># Create the file repository configuration:
sudo sh -c &#39;echo &quot;deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main&quot; &gt; /etc/apt/sources.list.d/pgdg.list&#39;
# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Update the package lists:
sudo apt-get update
# Install the latest version of PostgreSQL.
# If you want a specific version, use &#39;postgresql-12&#39; or similar instead of &#39;postgresql&#39;:
sudo apt-get -y install postgresql</code></pre>
<p>然后进行migrate，出现错：<a href="https://chartio.com/resources/tutorials/how-to-set-the-default-user-password-in-postgresql/">https://chartio.com/resources/tutorials/how-to-set-the-default-user-password-in-postgresql/</a></p>

<p>PG::ConnectionBad: connection to server on socket &quot;/var/run/postgresql/.s.PGSQL.5432&quot; failed: FATAL:&nbsp; Peer authentication failed for user &quot;admin&quot;</p>

<pre class="highlight">
<code>sudo -u postgres psql</code></pre>

<p>Create a user with no password:<a href="https://www.postgresql.org/docs/8.0/sql-createuser.html">https://www.postgresql.org/docs/8.0/sql-createuser.html</a></p>

<pre class="PROGRAMLISTING">
<code>CREATE USER jonathan;
Create a user with a password:

CREATE USER davide WITH PASSWORD &#39;jw8s0F4&#39;;


Create a user with a password that is valid until the end of 2004. After one second has ticked in 2005, the password is no longer valid.


CREATE USER miriam WITH PASSWORD &#39;jw8s0F4&#39; VALID UNTIL &#39;2005-01-01&#39;;

Create an account where the user can create databases:

CREATE USER manuel WITH PASSWORD &#39;jw8s0F4&#39; CREATEDB;</code>
</pre>

<p>创建了用户后还是不行</p>

<pre class="lang-sql s-code-block">
<code class="hljs language-sql"><span class="hljs-operator">/</span>etc<span class="hljs-operator">/</span>init.d<span class="hljs-operator">/</span>postgresql status</code></pre>

<p>查看状态，正在启动：</p>

<p><img height="301" src="/uploads/ckeditor/pictures/382/image-20220905151406-1.png" width="974" /></p>

<p>启动命令：<a href="https://blog.csdn.net/lxq_9532/article/details/96302851">https://blog.csdn.net/lxq_9532/article/details/96302851</a></p>

<pre><code>sudo systemctl enable postgresql<br />
sudo systemctl start postgresql</code></pre>

<p>进入文件夹：/etc/postgresql/14/main#编辑文件：postgresql.conf</p>

<p>设置用户<a href="https://www.cnblogs.com/fireblackman/p/15740695.html">https://www.cnblogs.com/fireblackman/p/15740695.html</a></p>

<p>参考：<a href="http://siwei.me/blog/posts/postgres-postgres">http://siwei.me/blog/posts/postgres-postgres</a></p>

<p>设置超级用户才有权限进行创建数据库登出操作。</p>

<p>配置了puma和NGINX，然后server启动</p>

<p><a href="https://xiaozhuanlan.com/topic/4928651307">https://xiaozhuanlan.com/topic/4928651307</a></p>

<pre class="line-numbers  language-csharp">
<code class="language-csharp">安装：sudo apt<span class="token operator">-</span><span class="token keyword">get</span> install nginx
</code></pre>

<p>nginx 配置文件 <code>/etc/nginx/sites-enabled/default</code></p>

<pre class="line-numbers  language-bash">
<code class="language-bash">安装：gem &#39;puma&#39;</code></pre>

<pre><code class="language-bash">bundle install</code></pre>

<p>nginx 配置文件 <code>/etc/nginx/sites-enabled/default</code></p>

<pre class="line-numbers  language-php">
<code class="language-php">upstream app <span class="token punctuation">{</span>
    <span class="token comment">// 改成实际 puma.sock 的文件路径</span>
    server unix<span class="token punctuation">:</span><span class="token operator">/</span>home<span class="token operator">/</span>vagrant<span class="token operator">/</span>foo<span class="token operator">/</span>shared<span class="token operator">/</span>sockets<span class="token operator">/</span>puma<span class="token punctuation">.</span>sock<span class="token punctuation">;</span>
<span class="token punctuation">}</span>

server <span class="token punctuation">{</span>
    listen <span class="token number">80</span><span class="token punctuation">;</span>
    <span class="token comment">// 改成实际服务器域名</span>
    server_name <span class="token number">192.168</span><span class="token number">.1</span><span class="token number">.2</span><span class="token punctuation">;</span>

    <span class="token comment">// 改成实际 APP 路径</span>
    root <span class="token operator">/</span>home<span class="token operator">/</span>vagrant<span class="token operator">/</span>foo<span class="token operator">/</span><span class="token keyword">public</span><span class="token punctuation">;</span>

    try_files <span class="token variable">$uri</span><span class="token operator">/</span>index<span class="token punctuation">.</span>html <span class="token variable">$uri</span> @app<span class="token punctuation">;</span>

    location @app <span class="token punctuation">{</span>
        proxy_set_header <span class="token constant">X</span><span class="token operator">-</span>Forwarded<span class="token operator">-</span><span class="token keyword">For</span> <span class="token variable">$proxy_add_x_forwarded_for</span><span class="token punctuation">;</span>
        proxy_set_header Host <span class="token variable">$http_host</span><span class="token punctuation">;</span>
        proxy_redirect off<span class="token punctuation">;</span>
        proxy_pass http<span class="token punctuation">:</span><span class="token comment">//app;</span>
    <span class="token punctuation">}</span>

    error_page <span class="token number">500</span> <span class="token number">502</span> <span class="token number">503</span> <span class="token number">504</span> <span class="token operator">/</span><span class="token number">500.</span>html<span class="token punctuation">;</span>
    keepalive_timeout <span class="token number">10</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>
</code></pre>

<p><a href="https://xiaozhuanlan.com/topic/4928651307">https://xiaozhuanlan.com/topic/4928651307</a></p>

<p>重启：</p>

<pre>
<code class="hljs nginx"><span class="hljs-attribute">nginx</span> -s reload</code></pre>

<p><a href="http://siwei.me/blog/posts/ruby-puma-5"><code class="hljs nginx">http://siwei.me/blog/posts/ruby-puma-5</code></a></p>

<p><code class="hljs nginx">启动：</code></p>

<p>bundle exec puma</p>

<p><img height="228" src="/uploads/ckeditor/pictures/383/image-20220906091448-1.png" width="993" /></p>

<p>配置NGINX：</p>

<p>配置<code>nginx</code>。<a href="https://www.cnblogs.com/Mr-RanX/p/15484735.html">https://www.cnblogs.com/Mr-RanX/p/15484735.html</a></p>

<pre><code># echo &quot;deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx&quot; \<br />
&nbsp;&nbsp;&nbsp; | sudo tee /etc/apt/sources.list.d/nginx.list

# curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key<br />
# mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc<br />
# apt update<br />
# apt install nginx</code></pre>

<p><img height="231" src="/uploads/ckeditor/pictures/385/image-20220906105701-2.png" width="1463" /></p>

<pre><code>nginx -v<br />
nginx version: nginx/1.14.0 (Ubuntu)</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

