---
layout: post
title: "Run a CKB Mainnet Node"
date: "2022-10-09"
categories: 
---
<p><a href="https://docs.nervos.org/docs/basics/guides/mainnet/">官网：https://docs.nervos.org/docs/basics/guides/mainnet/</a>（下载之后的教程）</p>

<p>下载：<a href="https://github.com/nervosnetwork/ckb/releases">https://github.com/nervosnetwork/ckb/releases</a></p>

<p>直接下载安装这个</p>

<p><img alt="" src="http://bug.sweetysoft.com/uploads/2022-10-09-09-24-46.png" /></p>

<p>运行bundle 安装gem，可以注释了ruby，因为版本不同</p>

<p>安装后，进行db:create</p>

<p>出现报错</p>

<p>Calling `DidYouMean::SPELL_CHECKERS.merge!(error_name =&gt; spell_checker)&#39; has been deprecated. Please call `DidYouMean.correct_error(error_name, spell_checker)&#39; instead.<br />
rake aborted!</p>

<p>解决：<a href="https://qiita.com/vaza__ta/items/1e7a780499b5effbfd65">https://qiita.com/vaza__ta/items/1e7a780499b5effbfd65</a></p>

{% highlight %}
{% highlight %}bundle update --bundler {% endhighlight %}

<p>更新bundle的版本</p>

<p><img height="240" src="/uploads/ckeditor/pictures/529/image-20221009095830-1.png" width="1912" /></p>

<p>然后继续，出现报错：LoadError: cannot load such file -- net/smtp</p>

<p>解决：<a href="https://blog.bccn.net/%E9%9D%99%E5%A4%9C%E6%80%9D/68051">https://blog.bccn.net/%E9%9D%99%E5%A4%9C%E6%80%9D/68051</a></p>

<p>在Gemfile增加：</p>

<pre class="line-numbers language-ruby">
<code class="language-ruby">gem <span class="token string">&#39;net-smtp&#39;</span>
gem <span class="token string">&#39;net-imap&#39;</span>
gem <span class="token string">&#39;net-pop&#39;</span>{% endhighlight %}

<p><code class="language-ruby"><span class="token string">然后bundle即可</span>{% endhighlight %}</p>

<p><img height="218" src="/uploads/ckeditor/pictures/530/image-20221009100037-2.png" width="1912" /></p>

<p>还是报错：</p>

<p>LoadError: Could not open library &#39;libsecp256k1&#39;: libsecp256k1: cannot open shared object file: No such file or directory.<br />
Could not open library &#39;libsecp256k1.so&#39;: libsecp256k1.so: cannot open shared object file: No such file or directory</p>

<p>解决：<a href="https://github.com/cryptape/ruby-bitcoin-secp256k1">https://github.com/cryptape/ruby-bitcoin-secp256k1</a></p>

{% highlight %}
sudo apt install libsecp256k1-dev{% endhighlight %}

<p><img height="218" src="/uploads/ckeditor/pictures/531/image-20221009100205-3.png" width="1912" /></p>

<p>postgres的版本不同，应该使用14.2，现在是9.5</p>

<p><img height="256" src="/uploads/ckeditor/pictures/532/image-20221009111230-1.png" width="587" /></p>

<p>安装14的postgres：<a href="https://citizix.com/how-to-install-and-configure-postgres-14-ubuntu-22-04/">https://citizix.com/how-to-install-and-configure-postgres-14-ubuntu-22-04/</a></p>

<pre class="wp-block-code">
{% highlight %}sudo apt update{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}udo apt -y upgrade{% endhighlight %}

<p>{% highlight %}或者：{% endhighlight %}</p>

<pre class="wp-block-code">
{% highlight %}sudo apt update &amp;&amp; sudo apt -y full-upgrade{% endhighlight %}

<p>{% highlight %}重启：{% endhighlight %}</p>

<pre class="wp-block-code">
{% highlight %}[ -f /var/run/reboot-required ] &amp;&amp; sudo reboot -f{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}sudo apt install vim curl wget gpg gnupg2 software-properties-common apt-transport-https lsb-release ca-certificates{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}apt policy postgresql{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}sudo sh -c &#39;echo &quot;deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main&quot; &gt; /etc/apt/sources.list.d/pgdg.list&#39;{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}sudo apt  update{% endhighlight %}

<p>{% highlight %}安装：{% endhighlight %}</p>

<pre class="wp-block-code">
{% highlight %}sudo apt install postgresql-14{% endhighlight %}

<pre class="wp-block-code">
{% highlight %}<mark class="has-inline-color has-luminous-vivid-amber-color" style="background-color:initial">查看状态：systemctl status postgresql@14-main.service</mark>{% endhighlight %}

<p><img height="624" src="/uploads/ckeditor/pictures/533/image-20221009111730-2.png" width="1920" /></p>

<pre class="wp-block-code">
{% highlight %}sudo -u postgres psql -c &quot;SELECT version();&quot;{% endhighlight %}

<p>{% highlight %}出现了报错：{% endhighlight %}</p>

<p>Warning: No existing cluster is suitable as a default target. Please see man pg_wrapper(1) how to specify one.<br />
psql: error: connection to server on socket &quot;/var/run/postgresql/.s.PGSQL.5432&quot; failed: No such file or directory<br />
&nbsp;&nbsp; &nbsp;Is the server running locally and accepting connections on that socket?</p>

<p>5432端口的并不是14，而是9.5，因此不需要进行启动9.5，</p>

<p>本地运行：docker pull postgres:14不能成功连接，更新compose</p>

<p>sudo apt&nbsp; install docker-compose</p>

<p>docker pull postgres:14这样就可以了</p>

<p>使用docker启动postgres： docker run&nbsp; -e POSTGRES_PASSWORD=abdfdd3859a24c -d postgres</p>

<p>查看postgres是否成功启动：sudo docker ps -a</p>

<p><img height="427" src="/uploads/ckeditor/pictures/534/image-20221009120605-3.png" width="1536" /></p>

<p>查看postgres的ip：sudo docker inspect f1a6a66855f5</p>

<p><img height="247" src="/uploads/ckeditor/pictures/535/image-20221009121201-1.png" width="632" /></p>

<p>修改数据库配置：config/database.yml</p>

<p><img height="247" src="/uploads/ckeditor/pictures/536/image-20221009121236-2.png" width="632" /></p>

<p>创建数据库： bundle exec rake db:create</p>

<p>创建数据表： bundle exec rake db:migrate</p>

<p><img height="360" src="/uploads/ckeditor/pictures/537/image-20221009135008-3.png" width="1919" /></p>

<p><img height="360" src="/uploads/ckeditor/pictures/538/image-20221009135021-4.png" width="1919" /></p>

<p>运行node节点：<a href="https://docs.nervos.org/docs/basics/guides/mainnet/">https://docs.nervos.org/docs/basics/guides/mainnet/</a></p>

<pre class="prism-code language-text codeBlock_bY9V thin-scrollbar" tabindex="0">
<code class="codeBlockLines_e6Vv"><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">./ckb --version</span>
</span><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">./ckb-cli --version</span></span>{% endhighlight %}

<p><img height="105" src="/uploads/ckeditor/pictures/539/image-20221009142703-1.png" width="659" /></p>

<p>初始化： ./ckb init</p>

<p>运行节点： ./ckb run</p>

<p><img height="483" src="/uploads/ckeditor/pictures/540/image-20221009143204-1.png" width="1920" /></p>

<p>打开新的窗口，进行数据的抓取： bundle exec ruby lib/ckb_block_node_processor.rb</p>

<p><img height="500" src="/uploads/ckeditor/pictures/541/image-20221009143247-2.png" width="1919" /></p>

<p>然后，自动停止了：</p>

<p><img height="500" src="/uploads/ckeditor/pictures/542/image-20221009143323-3.png" width="1919" /></p>

<p>ckb还正在运行</p>

<p>&nbsp;</p>

