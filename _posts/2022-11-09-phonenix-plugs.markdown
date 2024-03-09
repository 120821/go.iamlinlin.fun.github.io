---
layout: post
title: "phonenix - plugs"
date: "2022-11-09"
categories: 
---
<p><a href="https://hexdocs.pm/plug/Plug.Session.html">https://hexdocs.pm/plug/Plug.Session.html</a></p>

<p>使用plugs：</p>

<pre><code>def introspect(conn, _opts) do<br />
&nbsp; IO.puts &quot;&quot;&quot;<br />
&nbsp; Verb: #{inspect(conn.method)}<br />
&nbsp; Host: #{inspect(conn.host)}<br />
&nbsp; Headers: #{inspect(conn.req_headers)}<br />
&nbsp; &quot;&quot;&quot;

&nbsp; conn<br />
end</code></pre>

<p>示例：</p>

<p>修改 <code class="inline">lib/hello_web/endpoint.ex</code></p>

<p><code>内容：</code></p>

<pre><code>defmodule HelloWeb.Endpoint do<br />
&nbsp; ...

&nbsp; plug :introspect<br />
&nbsp; plug HelloWeb.Router

&nbsp; def introspect(conn, _opts) do<br />
&nbsp;&nbsp;&nbsp; IO.puts &quot;&quot;&quot;<br />
&nbsp;&nbsp;&nbsp; Verb: #{inspect(conn.method)}<br />
&nbsp;&nbsp;&nbsp; Host: #{inspect(conn.host)}<br />
&nbsp;&nbsp;&nbsp; Headers: #{inspect(conn.req_headers)}<br />
&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;

&nbsp;&nbsp;&nbsp; conn<br />
&nbsp; end<br />
end</code></pre>

<p>打开链接：<a href="http://localhost:4000/">http://localhost:4000/</a></p>

<pre><code>Verb: &quot;GET&quot;<br />
Host: &quot;localhost&quot;<br />
Headers: [...]</code></pre>

<p>&nbsp;</p>

