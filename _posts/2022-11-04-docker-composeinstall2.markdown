---
layout: post
title: "docker-compose install 2.+"
date: "2022-11-04"
categories: 
---
<p><a href="https://nextgentips.com/2022/05/06/how-to-install-docker-compose-v2-on-ubuntu-22-04/">https://nextgentips.com/2022/05/06/how-to-install-docker-compose-v2-on-ubuntu-22-04/</a></p>

<p><a href="http://siwei.me/blog/posts/docker-docker-docker-compose">http://siwei.me/blog/posts/docker-docker-docker-compose</a></p>

<p>get docker-compose 2.0.1</p>

<p>delete old compose file</p>

<p>then:</p>

<pre style="background-color:#f0f3f3;-moz-tab-size:4;-o-tab-size:4;tab-size:4" tabindex="0">
<code class="language-bash" data-lang="bash"><span style="display:flex"><span><span style="color:#09f;font-style:italic"># create the docker plugins directory if it doesn&#39;t exist yet</span>
</span></span><span style="display:flex"><span>mkdir -p ~/.docker/cli-plugins
</span></span><span style="display:flex"><span><span style="color:#09f;font-style:italic"># download the CLI into the plugins directory</span>
</span></span><span style="display:flex"><span>curl -sSL https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
</span></span><span style="display:flex"><span><span style="color:#09f;font-style:italic"># make the CLI executable</span>
</span></span><span style="display:flex"><span>chmod +x ~/.docker/cli-plugins/docker-compose</span></span></code></pre>

<p>get docker-compose 2.5.0</p>

<p>delete old docker-compose file</p>

<p>wget<code> https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64</code></p>

<p>sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose</p>

<p>chmod +x /usr/local/bin/docker-compose</p>

<p><code>docker-compose --version<br />
Docker Compose version v2.5.0</code></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

