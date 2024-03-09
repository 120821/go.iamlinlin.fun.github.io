---
layout: post
title: "ruby-dns async-dns 自定义服务器 （1）"
date: "2022-11-07"
categories: 
---
<p><a href="https://github.com/socketry/async-dns">async-dns</a>&nbsp;&nbsp; <a href="https://github.com/socketry/rubydns">rubydns</a>&nbsp;</p>

<p>自定义服务器</p>

<pre>
<code>class MyServer &lt; Async::DNS::Server
&nbsp;&nbsp; &nbsp;def process(name, resource_class, transaction)
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;transaction.fail!(:NXDomain)
&nbsp;&nbsp; &nbsp;end
end
Async::Reactor.run do
&nbsp;&nbsp; &nbsp;task = MyServer.new.run
&nbsp;&nbsp; &nbsp;# ... do other things, e.g. run specs/tests
&nbsp;&nbsp; &nbsp;# Shut down the server manually if required, otherwise it will run indefinitely.
&nbsp;&nbsp; &nbsp;# task.stop
end</code></pre>

<p>自定义脚本（尝试，这个脚本暂时只能获取数据库的ip或者A记录或者TXT的第一条数据）：</p>

<pre>
<code>!/usr/bin/env ruby

require &#39;rubydns&#39;

require &#39;active_record&#39;

password = &#39;你的密码&#39;

host = &#39;localhost&#39;

ActiveRecord::Base.establish_connection(adapter: &#39;postgresql&#39;, pool: &quot;#{ENV[&quot;DATABASE_POOL&quot;] || 64}&quot;, timeout: 5000, encoding: &#39;utf-8&#39;, host: &quot;#{host}&quot;, user: &#39;admin&#39;, username: &#39;admin&#39;, password: &quot;#{password}&quot;, port: 5432, database: &#39;ddns_rails&#39;)

class Record &lt; ActiveRecord::Base

end

class Domain &lt; ActiveRecord::Base

end

puts Record.all.size

records = Record.all

records.each do |record|

&nbsp; puts &quot;== record #{record.inspect}&quot;

end

class MyServer &lt; Async::DNS::Server

&nbsp; def process(name, resource_class, transaction)

&nbsp;&nbsp;&nbsp; @resolver ||= Async::DNS::Resolver.new([[:udp, &#39;8.8.8.8&#39;, 53], [:tcp, &#39;8.8.8.8&#39;, 53]])

&nbsp;&nbsp;&nbsp; puts &quot;== name #{name}&quot;

&nbsp;&nbsp;&nbsp; puts &quot;=== @resolver #{@resolver.inspect}&quot;

&nbsp;&nbsp;&nbsp; #transaction.fail!(:NXDomain)

&nbsp;&nbsp;&nbsp; #&nbsp; #Record.types.keys[record.record_type] rescue 0

&nbsp;&nbsp;&nbsp; #&nbsp; # enum :type, { A: 0, CNAME: 1, TXT: 2, IPFS: 3 }

&nbsp;&nbsp;&nbsp; record_db = Record.where(&#39;domain_name = ?&#39;, name).first

&nbsp;&nbsp;&nbsp; puts &quot;=== record_db #{record_db.inspect}&quot;

&nbsp;&nbsp;&nbsp; if record_db.present?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; transaction.respond!(&quot;#{record_db.content}&quot;)

&nbsp;&nbsp;&nbsp; else

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; transaction.passthrough!(@resolver)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #transaction.passthrough!(UPSTREAM)

&nbsp;&nbsp;&nbsp; end

&nbsp; end

end

server = MyServer.new([[:udp, &#39;127.0.0.1&#39;, 2346]])

server.run</code></pre>

<p>执行后，进行查询：</p>

<pre>
<code>dig @localhost -p 2346 baidu.com</code></pre>

<pre>
<code>dig @localhost -p 2346 daydayup666.eth</code></pre>

<p>打印的数据是这样的：</p>

<p><img height="374" src="/uploads/ckeditor/pictures/695/image-20221107102253-1.png" width="1920" /></p>

<p>获得的数据是这样的：</p>

<p><img height="957" src="/uploads/ckeditor/pictures/697/image-20221107102415-3.png" width="1029" /></p>

