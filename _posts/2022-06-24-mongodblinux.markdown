---
layout: post
title: "下载 安装MongoDB  Linux"
date: "2022-06-24"
categories:
---
<p>下载地址：https://www.mongodb.com/try/download/community</p>
<p>进行选择自己需要的版本，然后在本地找到文件的地址，进行解压缩</p>
<p>tgz ~/Downloads/mongodb-org-server-5.0.9-1.amzn1.x86_64.rpm<br />
Command &#39;tgz&#39; not found, but can be installed with:<br />
sudo apt install mtools</p>
<p>根据提示进行解压缩，</p>
<p>sudo apt install mtools<br />
Reading package lists... Done<br />
Building dependency tree... Done<br />
Reading state information... Done<br />
Suggested packages:<br />
&nbsp; floppyd<br />
The following NEW packages will be installed:<br />
&nbsp; mtools<br />
0 upgraded, 1 newly installed, 0 to remove and 51 not upgraded.<br />
Need to get 201 kB of archives.<br />
After this operation, 413 kB of additional disk space will be used.<br />
0% [Working]<br />
Get:1 http://mirrors.aliyun.com/ubuntu impish/main amd64 mtools amd64 4.0.33-1+really4.0.32-1 [201 kB]<br />
Fetched 201 kB in 6s (32.8 kB/s)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
Selecting previously unselected package mtools.<br />
(Reading database ... 312557 files and directories currently installed.)<br />
Preparing to unpack .../mtools_4.0.33-1+really4.0.32-1_amd64.deb ...<br />
Unpacking mtools (4.0.33-1+really4.0.32-1) ...<br />
Setting up mtools (4.0.33-1+really4.0.32-1) ...<br />
Processing triggers for install-info (6.7.0.dfsg.2-6) ...<br />
Processing triggers for man-db (2.9.4-2) ...</p>
<p><img height="1007" src="/uploads/ckeditor/pictures/65/image-20220624165058-1.png" width="1785" /></p>
<p><strong>tar 解压命令</strong></p>
<p>tar -zxvf ~/Downloads/mongodb-org-server-5.0.9-1.amzn1.x86_64.rpm.tgz<br />
./<br />
./Rakefile<br />
./public/</p>
<p>........</p>
<p>./bin/rake<br />
./bin/spring<br />
./postcss.config.js<br />
./test.rb<br />
./Capfile</p>
<p><strong>tar压缩命令</strong></p>
<p>tgz ~/Downloads/mongodb-org-server-5.0.9-1.amzn1.x86_64.rpm<br />
Writing gzip&#39;d tar archive to &quot;/home/linlin/Downloads/mongodb-org-server-5.0.9-1.amzn1.x86_64.rpm.tgz&quot;.<br />
./<br />
./Rakefile<br />
./public/<br />
./public/500.html<br />
./public/robots.txt</p>
<p>....................................</p>
<p>./test.rb<br />
./Capfile<br />
Total bytes written: 254228480 (243MiB, 15MiB/s)<br />
&nbsp;80.2%<br />
-rw-rw-r-- 1 linlin linlin 50258991&nbsp; 6月 24 16:44 /home/linlin/Downloads/mongodb-org-server-5.0.9-1.amzn1.x86_64.rpm.tgz</p>
<p>安装的不是正确的版本，安装Ubuntu20</p>
<p>可以直接点击进行install<img height="779" src="/uploads/ckeditor/pictures/67/image-20220624175222-2.png" width="1092" /></p>
<p>MongoDB 的可执行文件位于 bin 目录下，所以可以将其添加到 <strong>PATH</strong> 路径中：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="kwd">export</span><span class="pln"> PATH</span><span class="pun">=&lt;</span><span class="pln">mongodb</span><span class="pun">-</span><span class="pln">install</span><span class="pun">-</span><span class="pln">directory</span><span class="pun">&gt;/</span><span class="pln">bin</span><span class="pun">:</span><span class="pln">$PATH</span>
<p><strong>&lt;mongodb-install-directory&gt;</strong> 为你 MongoDB 的安装路径。如本文的 <strong>/usr/local/mongodb4</strong> 。</p>
<pre class="prettyprint prettyprinted" style="">
<span class="kwd">export</span><span class="pln"> PATH</span><span class="pun">=</span><span class="str">/usr/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mongodb4</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">:</span><span class="pln">$PATH</span>
<p>选择MongoDB的安装包保存的位置。</p>
<p>放在APP文件夹的话 ，就删除，在垃圾箱找出来继续用。</p>
<h2>创建数据库目录</h2>
<p>默认情况下 MongoDB 启动后会初始化以下两个目录：</p>
<ul>
<li>数据存储目录：/var/lib/mongodb</li>
<li>日志文件目录：/var/log/mongodb</li>
</ul>
<p>我们在启动前可以先创建这两个目录并设置当前用户有读写权限：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">sudo mkdir </span><span class="pun">-</span><span class="pln">p </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">lib</span><span class="pun">/</span><span class="pln">mongo
sudo mkdir </span><span class="pun">-</span><span class="pln">p </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">log</span><span class="pun">/</span><span class="pln">mongodb
sudo chown </span><span class="str">`whoami`</span><span class="pln"> </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">lib</span><span class="pun">/</span><span class="pln">mongo     </span><span class="com"># 设置权限</span><span class="pln">
sudo chown </span><span class="str">`whoami`</span><span class="pln"> </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">log</span><span class="pun">/</span><span class="pln">mongodb   </span><span class="com"># 设置权限</span>
<p><span class="com">可以在根目录进行创建，然后就可以查看log了。</span></p>
<p><span class="com">但是还没有重建好，APP还是不能启动。没有进行MongoDB的连接。</span></p>
<p>接下来<strong>启动 Mongodb 服务：</strong></p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">mongod </span><span class="pun">--</span><span class="pln">dbpath </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">lib</span><span class="pun">/</span><span class="pln">mongo </span><span class="pun">--</span><span class="pln">logpath </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">log</span><span class="pun">/</span><span class="pln">mongodb</span><span class="pun">/</span><span class="pln">mongod</span><span class="pun">.</span><span class="pln">log </span><span class="pun">--</span><span class="pln">fork</span>
<p>打开 /var/log/mongodb/mongod.log 文件看到以下信息，说明启动成功。</p>
<pre class="prettyprint prettyprinted" style="">
<span class="com"># tail -10f /var/log/mongodb/mongod.log</span><span class="pln">
</span><span class="lit">2020</span><span class="pun">-</span><span class="lit">07</span><span class="pun">-</span><span class="lit">09T12</span><span class="pun">:</span><span class="lit">20</span><span class="pun">:</span><span class="lit">17.391</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I  NETWORK  </span><span class="pun">[</span><span class="pln">listener</span><span class="pun">]</span><span class="pln"> </span><span class="typ">Listening</span><span class="pln"> on </span><span class="pun">/</span><span class="pln">tmp</span><span class="pun">/</span><span class="pln">mongodb</span><span class="pun">-</span><span class="lit">27017.sock</span><span class="pln">
</span><span class="lit">2020</span><span class="pun">-</span><span class="lit">07</span><span class="pun">-</span><span class="lit">09T12</span><span class="pun">:</span><span class="lit">20</span><span class="pun">:</span><span class="lit">17.392</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I  NETWORK  </span><span class="pun">[</span><span class="pln">listener</span><span class="pun">]</span><span class="pln"> </span><span class="typ">Listening</span><span class="pln"> on </span><span class="lit">127.0</span><span class="pun">.</span><span class="lit">0.1</span><span class="pln">
</span><span class="lit">2020</span><span class="pun">-</span><span class="lit">07</span><span class="pun">-</span><span class="lit">09T12</span><span class="pun">:</span><span class="lit">20</span><span class="pun">:</span><span class="lit">17.392</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I  NETWORK  </span><span class="pun">[</span><span class="pln">listener</span><span class="pun">]</span><span class="pln"> waiting </span><span class="kwd">for</span><span class="pln"> connections on port </span><span class="lit">27017</span>
<p>MongoDB 后台管理 Shell</p>
<p>如果你需要进入 mongodb 后台管理，你需要先打开 mongodb 装目录的下的 bin 目录，然后执行 mongo 命令文件。</p>
<p>MongoDB Shell 是 MongoDB 自带的交互式 Javascript shell，用来对 MongoDB 进行操作和管理的交互式环境。</p>
<p>当你进入 mongoDB 后台后，它默认会链接到 test 文档（数据库）：</p>
<pre class="prettyprint prettyprinted" style="">
<strong><span class="pln">$ cd </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mongodb4</span><span class="pun">/</span><span class="pln">bin
$ </span><span class="pun">./</span></strong><span class="pln"><strong>mongo</strong>
</span><span class="typ">MongoDB</span><span class="pln"> shell version v4</span><span class="pun">.</span><span class="lit">2.8</span><span class="pln">
connecting to</span><span class="pun">:</span><span class="pln"> mongodb</span><span class="pun">:</span><span class="com">//127.0.0.1:27017/?compressors=disabled&amp;gssapiServiceName=mongodb</span><span class="pln">
</span><span class="typ">Implicit</span><span class="pln"> session</span><span class="pun">:</span><span class="pln"> session </span><span class="pun">{</span><span class="pln"> </span><span class="str">&quot;id&quot;</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> UUID</span><span class="pun">(</span><span class="str">&quot;2cfdafc4-dd56-4cfc-933a-187b887119b3&quot;</span><span class="pun">)</span><span class="pln"> </span><span class="pun">}</span><span class="pln">
</span><span class="typ">MongoDB</span><span class="pln"> server version</span><span class="pun">:</span><span class="pln"> </span><span class="lit">4.2</span><span class="pun">.</span><span class="lit">8</span><span class="pln">
</span><span class="typ">Welcome</span><span class="pln"> to the </span><span class="typ">MongoDB</span><span class="pln"> shell</span><span class="pun">.</span><span class="pln">
</span><span class="pun">&hellip;&hellip;</span>
<p>由于它是一个JavaScript shell，您可以运行一些简单的算术运算:</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pun">&gt;</span><span class="pln"> </span><span class="lit">2</span><span class="pun">+</span><span class="lit">2</span><span class="pln">
</span><span class="lit">4</span><span class="pln">
</span><span class="pun">&gt;</span><span class="pln"> </span><span class="lit">3</span><span class="pun">+</span><span class="lit">6</span><span class="pln">
</span><span class="lit">9</span>
<p>现在让我们插入一些简单的数据，并对插入的数据进行检索：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pun">&gt;</span><span class="pln"> db</span><span class="pun">.</span><span class="pln">runoob</span><span class="pun">.</span><span class="pln">insert</span><span class="pun">({</span><span class="pln">x</span><span class="pun">:</span><span class="lit">10</span><span class="pun">})</span><span class="pln">
</span><span class="typ">WriteResult</span><span class="pun">({</span><span class="pln"> </span><span class="str">&quot;nInserted&quot;</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> </span><span class="pun">})</span><span class="pln">
</span><span class="pun">&gt;</span><span class="pln"> db</span><span class="pun">.</span><span class="pln">runoob</span><span class="pun">.</span><span class="pln">find</span><span class="pun">()</span><span class="pln">
</span><span class="pun">{</span><span class="pln"> </span><span class="str">&quot;_id&quot;</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="typ">ObjectId</span><span class="pun">(</span><span class="str">&quot;5f069bdb4e02f8baf90f1184&quot;</span><span class="pun">),</span><span class="pln"> </span><span class="str">&quot;x&quot;</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="lit">10</span><span class="pln"> </span><span class="pun">}</span><span class="pln">
</span><span class="pun">&gt;</span><span class="pln"> </span>
<p>第一个命令将数字 10 插入到 runoob 集合的 x 字段中。</p>
<p>如果要<strong>停止 mongodb 可以使用以下命令：</strong></p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">mongod </span><span class="pun">--</span><span class="pln">dbpath </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">lib</span><span class="pun">/</span><span class="pln">mongo </span><span class="pun">--</span><span class="pln">logpath </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">log</span><span class="pun">/</span><span class="pln">mongodb</span><span class="pun">/</span><span class="pln">mongod</span><span class="pun">.</span><span class="pln">log </span><span class="pun">--</span><span class="pln">shutdown</span>
<p>也可以在 mongo 的命令出口中实现：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pun">&gt;</span><span class="pln"> </span><span class="kwd">use</span><span class="pln"> admin
switched to db admin
</span><span class="pun">&gt;</span><span class="pln"> db</span><span class="pun">.</span><span class="pln">shutdownServer</span><span class="pun">()</span>
<p>使用默认端口来连接 MongoDB 的服务。</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">mongodb</span><span class="pun">:</span><span class="com">//localhost</span>
<p>通过 shell 连接 MongoDB 服务：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ </span><span class="pun">./</span><span class="pln">mongo
</span><span class="typ">MongoDB</span><span class="pln"> shell version</span><span class="pun">:</span><span class="pln"> </span><span class="lit">4.0</span><span class="pun">.</span><span class="lit">9</span><span class="pln">
connecting to</span><span class="pun">:</span><span class="pln"> test
</span><span class="pun">...</span><span class="pln"> </span>
<p>这时候你返回查看运行 <strong>./mongod</strong> 命令的窗口，可以看到是从哪里连接到MongoDB的服务器，您可以看到如下信息：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pun">&hellip;&hellip;省略信息&hellip;&hellip;</span><span class="pln">
</span><span class="lit">2015</span><span class="pun">-</span><span class="lit">09</span><span class="pun">-</span><span class="lit">25T17</span><span class="pun">:</span><span class="lit">22</span><span class="pun">:</span><span class="lit">27.336</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I CONTROL  </span><span class="pun">[</span><span class="pln">initandlisten</span><span class="pun">]</span><span class="pln"> allocator</span><span class="pun">:</span><span class="pln"> tcmalloc
</span><span class="lit">2015</span><span class="pun">-</span><span class="lit">09</span><span class="pun">-</span><span class="lit">25T17</span><span class="pun">:</span><span class="lit">22</span><span class="pun">:</span><span class="lit">27.336</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I CONTROL  </span><span class="pun">[</span><span class="pln">initandlisten</span><span class="pun">]</span><span class="pln"> options</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> storage</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> dbPath</span><span class="pun">:</span><span class="pln"> </span><span class="str">&quot;/data/db&quot;</span><span class="pln"> </span><span class="pun">}</span><span class="pln"> </span><span class="pun">}</span><span class="pln">
</span><span class="lit">2015</span><span class="pun">-</span><span class="lit">09</span><span class="pun">-</span><span class="lit">25T17</span><span class="pun">:</span><span class="lit">22</span><span class="pun">:</span><span class="lit">27.350</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I NETWORK  </span><span class="pun">[</span><span class="pln">initandlisten</span><span class="pun">]</span><span class="pln"> waiting </span><span class="kwd">for</span><span class="pln"> connections on port </span><span class="lit">27017</span><span class="pln">
</span><span class="lit">2015</span><span class="pun">-</span><span class="lit">09</span><span class="pun">-</span><span class="lit">25T17</span><span class="pun">:</span><span class="lit">22</span><span class="pun">:</span><span class="lit">36.012</span><span class="pun">+</span><span class="lit">0800</span><span class="pln"> I NETWORK  </span><span class="pun">[</span><span class="pln">initandlisten</span><span class="pun">]</span><span class="pln"> connection accepted </span><span class="kwd">from</span><span class="pln"> </span><span class="lit">127.0</span><span class="pun">.</span><span class="lit">0.1</span><span class="pun">:</span><span class="lit">37310</span><span class="pln"> </span><span class="com">#1 (1 connection now open)  # 该行表明一个来自本机的连接</span><span class="pln">
</span>
