---
layout: post
title: "OSS Ruby SDK 安装 创建联系 上传文件 删除文件 下载文件 查看文件列表"
date: "2022-06-09"
categories: 
---

                    <p>安装</p> 
<p id="p-5gi-vdc-nhg">您可以通过以下两种方式安装Ruby SDK。</p> 
<ul id="ul-8x5-twa-mwc"><li id="li-eya-yqf-252">方式一 <p id="p-a86-npo-7dr">执行<code id="codeph-qrh-r5v-d5o">gem install aliyun-sdk </code>命令安装SDK。</p> <p><strong>说明</strong> 如果无法访问https://rubygems.org，建议直接使用Ruby China社区维护的镜像源。</p> </li></ul>
<pre><code>gem install aliyun-sdk --clear-sources --source https://gems.ruby-china.com </code></pre> 
<h2 id="title-55z-d3l-apj">依赖</h2> 
<ul id="ul-bxe-tfy-4vc">
<li id="li-zjj-xrx-c0y">Ruby版本 &gt;= 1.9.3</li>
<li id="li-3le-8qu-d16">支持Ruby运行环境的Linux、Windows、OS X系统</li>
</ul>
<p><img alt="" height="59" src="https://img-blog.csdnimg.cn/02c6520d437746c28e99358337d812fb.png" width="688"></p> 
<h2 id="h2-url-1">初始化Client</h2> 
<p>在命令行中输入irb并回车。</p> 
<p>在Ruby的交互式命令行模式下，输入<code>require</code>引入SDK包。</p> 
<pre><code>&gt; require 'aliyun/oss'
=&gt; true
			</code></pre> 
<p><img alt="" height="89" src="https://img-blog.csdnimg.cn/7ab80352201e402797bd14e4aaaf8e8a.png" width="545"></p> 
<p>接下来创建Client：</p> 
<pre><code>&gt; client = Aliyun::OSS::Client.new(
&gt;   endpoint: 'endpoint',
&gt;   access_key_id: 'AccessKeyId',
&gt;   access_key_secret: 'AccessKeySecret')
=&gt; #&lt;Aliyun::OSS::Client...
			</code></pre> 
<p><a href="https://help.aliyun.com/document_detail/31837.html?spm=a2c6h.13066369.question.5.3ab84362PPzJ88" title="访问域名和数据中心 - 对象存储 OSS - 阿里云">访问域名和数据中心 - 对象存储 OSS - 阿里云</a></p> 
<p>查看endpoint access, assec key 需要增自己创建，在oss详情页面右侧列表页面点击进去创建即可，然后好好保管，不要泄露</p> 
<p><img alt="" height="853" src="https://img-blog.csdnimg.cn/3ed090f0de164fbd9d561a7cf4ca5852.png" width="514"></p> 
<p></p> 
<h2 id="title-qvx-r3a-xr4">公共云下OSS Region和Endpoint对照表</h2> 
<p id="p-dp3-27s-j2h">公共云下OSS各地域Endpoint如下：</p> 
<blockquote> 
 <h2 id="h2-url-2">查看Bucket列表</h2> 
 <p>通过以下命令查看Bucket列表：</p> 
 <pre><code>&gt; buckets = client.list_buckets
=&gt; #&lt;Enumerator...
&gt; buckets.each { |b| puts b.name }
=&gt; bucket-1
=&gt; bucket-2
=&gt; ...
			</code></pre> 
</blockquote> 
<blockquote> 
 <p>如果Bucket列表为空，则可以用以下命令创建一个Bucket：</p> 
 <pre><code>&gt; client.create_bucket('my-bucket')
=&gt; true
			</code></pre> 
</blockquote> 
<blockquote> 
 <h2 id="h2-url-4">上传文件</h2> 
 <p>通过以下命令向Bucket中上传一个文件：</p> 
 <pre><code>&gt; bucket.put_object('my-object', :file =&gt; 'local-file')
=&gt; true
			</code></pre> 
 <p>其中<code>local-file</code>是需要上传的本地文件的路径。上传成功后，可以通过<code>list_objects</code>来查看：</p> 
 <pre><code>&gt; objects = bucket.list_objects
=&gt; #&lt;Enumerator...
&gt; objects.each { |obj| puts obj.key }
=&gt; my-object
=&gt; ...
			</code></pre> 
 <h2 id="h2-url-5">下载文件</h2> 
 <p>通过以下命令从Bucket中下载一个文件：</p> 
 <pre><code>&gt; bucket.get_object('my-object', :file =&gt; 'local-file')
=&gt; #&lt;Aliyun::OSS::Object...
			</code></pre> 
 <p>其中<code>local-file</code>是文件保存的路径。下载成功后，可以打开文件查看其内容。</p> 
 <h2 id="h2-url-6">删除文件</h2> 
 <p>通过以下命令从Bucket中删除一个文件：</p> 
 <pre><code>&gt; bucket.delete_object('my-object')
=&gt; true
			</code></pre> 
 <p>删除文件后可以通过<code>list_objects</code>来查看文件确实已经被删除：</p> 
 <pre><code>&gt; objects = bucket.list_objects
=&gt; #&lt;Enumerator...
&gt; objects.each { |obj| puts obj.key }
=&gt; object-1
=&gt; ...
			</code></pre> 
</blockquote> 
<p><strong>查看文件列表</strong></p> 
<p> 通过以下命令查看Bucket中的文件列表：</p> 
<blockquote> 
 <pre><code>&gt; bucket = client.get_bucket('my-bucket')
=&gt; #&lt;Aliyun::OSS::Bucket...
&gt; objects = bucket.list_objects
=&gt; #&lt;Enumerator...
&gt; objects.each { |obj| puts obj.key }
=&gt; object-1
=&gt; object-2
=&gt; ...
			</code></pre> 
</blockquote> 
<blockquote> 
 <h2 id="h2-url-3"><img alt="" height="484" src="https://img-blog.csdnimg.cn/7ab2afac1c6541938505f01aa8bddf12.png" width="1200"></h2> 
</blockquote>
                
