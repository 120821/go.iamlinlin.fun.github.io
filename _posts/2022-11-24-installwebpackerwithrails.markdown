---
layout: post
title: "install Webpacker with Rails"
date: "2022-11-24"
categories: 
---
<p><a href="https://kinsta.com/blog/how-to-install-node-js/">https://kinsta.com/blog/how-to-install-node-js/</a>&nbsp; <a href="https://github.com/rails/webpacker/issues/940">https://github.com/rails/webpacker/issues/940</a></p>

<p>安装node14</p>

<pre class="language-bash" tabindex="0">
<code class="language-bash"><span class="token function">curl</span> <span class="token parameter variable">-fsSL</span> https://deb.nodesource.com/setup_14.x <span class="token operator">|</span> <span class="token function">sudo</span> <span class="token parameter variable">-E</span> <span class="token function">bash</span> -</code></pre>

<pre class="language-bash" tabindex="0">
<code class="language-bash"><span class="token function">sudo</span> <span class="token function">apt-get</span> <span class="token function">install</span> <span class="token parameter variable">-y</span> nodejs</code></pre>

<pre class="language-bash" tabindex="0">
<code class="language-bash">Node <span class="token parameter variable">--version</span></code></pre>

<pre class="language-bash" tabindex="0">
<code class="language-bash"><span class="token function">npm</span> <span class="token parameter variable">--version</span></code></pre>

<p><img height="120" src="/uploads/ckeditor/pictures/742/image-20221124164254-1.png" width="560" /></p>

<p><code>npm install yarn latest</code></p>

<p><code>bundle exec rake webpacker:install</code></p>

<p><a href="https://stackoverflow.com/questions/46013544/yarn-install-command-error-no-such-file-or-directory-install"><code>https://stackoverflow.com/questions/46013544/yarn-install-command-error-no-such-file-or-directory-install</code></a></p>

<p><code>安装yarn 替换0.32，换为1+</code></p>

<pre>
<code>sudo apt remove cmdtest
sudo apt remove yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo &quot;deb https://dl.yarnpkg.com/debian/ stable main&quot; | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y</code></pre>

<pre>
<code>yarn install</code></pre>

