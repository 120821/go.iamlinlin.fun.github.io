---
layout: post
title: "rails socket close "
date: "2022-08-10"
categories: 
---
<p>参考：https://www.honeybadger.io/blog/building-a-simple-websockets-server-from-scratch-in-ruby/</p>

<p>git clone https://github.com/stewart/eventmachine-websockets-demo.git</p>

<p>首先进行server的书写</p>

<p>cat app.rb<br />
require &#39;thin&#39;<br />
require &#39;em-websocket&#39;<br />
require &#39;sinatra/base&#39;</p>

<p>EM.run do<br />
&nbsp; class App &lt; Sinatra::Base<br />
&nbsp;&nbsp;&nbsp; get &#39;/&#39; do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; erb :index<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>&nbsp; @clients = []</p>

<p>&nbsp; EM::WebSocket.start(:host =&gt; &#39;0.0.0.0&#39;, :port =&gt; &#39;3001&#39;) do |ws|<br />
&nbsp;&nbsp;&nbsp; ws.onopen do |handshake|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @clients &lt;&lt; ws<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ws.send &quot;Connected to #{handshake.path}.&quot;<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; ws.onclose do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ws.send &quot;Closed.&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @clients.delete ws<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; ws.onmessage do |msg|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts &quot;Received Message: #{msg}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @clients.each do |socket|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.send msg<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>&nbsp; App.run! :port =&gt; 3000<br />
end</p>

<p>&nbsp;</p>

<p><img height="690" src="/uploads/ckeditor/pictures/181/image-20220810094917-1.png" width="770" /></p>

<p>views/index 可以进行修改，然后视图页面就会产生变化，显示一行。</p>

<p><img height="286" src="/uploads/ckeditor/pictures/182/image-20220810162243-1.png" width="511" /></p>

<p>68：&nbsp;if (event.keyCode == &#39;13&#39;) { send(); }</p>

<p>13就是表示回车，只要回车就会发送。</p>

<p>views/index.erb</p>

<p>&lt;!doctype html&gt;<br />
&lt;html&gt;<br />
&nbsp; &lt;head&gt;<br />
&nbsp; &lt;/head&gt;<br />
&nbsp; &lt;body&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;div class=&quot;container&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h1&gt;WebSockets Chat App&lt;/h1&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div id=&quot;chat-log&quot;&gt;&lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div id=&quot;form&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;input type=&quot;text&quot; id=&quot;message&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;button id=&quot;disconnect&quot;&gt;Disconnect&lt;/button&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;script src=&quot;https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js&quot;&gt;&lt;/script&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;script&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // where our WebSockets logic will go later<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var socket, host;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; host = &quot;ws://localhost:3001&quot;;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function connect() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket = new WebSocket(host);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Socket State: &quot; + socket.readyState);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.onopen = function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Socket Status: &quot; + socket.readyState + &quot; (open)&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.onclose = function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Socket Status: &quot; + socket.readyState + &quot; (closed)&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.onmessage = function(msg) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Received: &quot; + msg.data);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch(exception) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Error: &quot; + exception);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function addMessage(msg) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#chat-log&quot;).append(&quot;&lt;p&gt;11111&quot; + msg + &quot;&lt;/p&gt;&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function send() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var text = $(&quot;#message&quot;).val();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (text == &#39;&#39;) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Please Enter a Message&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.send(text);<br />
//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Sent: &quot; + text);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch(exception) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addMessage(&quot;Failed To Send&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#message&quot;).val(&#39;&#39;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connect();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&#39;#message&#39;).keypress(function(event) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (event.keyCode == &#39;13&#39;) { send(); }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#disconnect&quot;).click(function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; socket.close();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });<br />
&nbsp;&nbsp;&nbsp; &lt;/script&gt;<br />
&nbsp; &lt;/body&gt;<br />
&lt;/html&gt;</p>

<p><img height="364" src="/uploads/ckeditor/pictures/183/image-20220810162459-2.png" width="434" /></p>

<p>这样，就可以进行不同浏览器的在线发送信息。网络这里就是进行交互，服务器端到本地。</p>

<p><img height="406" src="/uploads/ckeditor/pictures/184/image-20220810162631-3.png" width="1857" /></p>

