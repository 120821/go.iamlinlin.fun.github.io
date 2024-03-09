---
layout: post
title: "ruby 中使用socket "
date: "2022-08-09"
categories: 
---
<p>参考：https://www.rubyguides.com/2015/04/ruby-network-programming/</p>

<p>修改一下模板中的地址，然后运行，这是一个自行停止的脚本。</p>

<p>require &#39;socket&#39;</p>

<p>socket = TCPServer.new(&#39;localhost&#39;, 8000)<br />
client = socket.accept</p>

<p>puts &quot;New client! #{client}&quot;</p>

<p>client.write(&quot;Hello from server&quot;)<br />
client.close</p>

<p>ruby TCPSocket.rb<br />
New client! #&lt;TCPSocket:0x000055d654afd360&gt;</p>

<p><img height="174" src="/uploads/ckeditor/pictures/176/image-20220809174152-1.png" width="461" /></p>

<p>这是一个不会自动停止的脚本，修改端口号，注意8080是正在用的</p>

<p>cat TCPSocket_not_kill.rb<br />
require &#39;socket&#39;</p>

<p>PORT&nbsp;&nbsp; = 8081<br />
socket = TCPServer.new(&#39;localhost&#39;, PORT)</p>

<p>def handle_connection(client)<br />
&nbsp; puts &quot;New client! #{client}&quot;</p>

<p>&nbsp; client.write(&quot;Hello from server&quot;)<br />
&nbsp; client.close<br />
end</p>

<p>puts &quot;Listening on #{PORT}. Press CTRL+C to cancel.&quot;</p>

<p>loop do<br />
&nbsp; client = socket.accept</p>

<p>&nbsp; Thread.new { handle_connection(client) }<br />
end</p>

<p>ruby TCPSocket_not_kill.rb<br />
Listening on 8081. Press CTRL+C to cancel.<br />
New client! #&lt;TCPSocket:0x000055c3e1604a78&gt;<br />
New client! #&lt;TCPSocket:0x000055c3e16047f8&gt;</p>

<p><img height="180" src="/uploads/ckeditor/pictures/177/image-20220809174631-1.png" width="1372" /></p>

<p><img height="112" src="/uploads/ckeditor/pictures/178/image-20220809174836-1.png" width="425" /></p>

