---
layout: post
title: "http cache"
date: "2023-03-07"
categories: 
---
<p><a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Caching#heuristic_caching">https://developer.mozilla.org/en-US/docs/Web/HTTP/Caching#heuristic_caching</a></p>

<p>1.HTTP 缓存会存储与请求关联的响应，并将存储的响应复用于后续请求。</p>

<p>可复用性有几个优点。首先，由于不需要将请求传递到源服务器，因此客户端和缓存越近，响应速度就越快。最典型的例子是浏览器本身为浏览器请求存储缓存。</p>

<p>此外，当响应可复用时，源服务器不需要处理请求&mdash;&mdash;因为它不需要解析和路由请求、根据 cookie 恢复会话、查询数据库以获取结果或渲染模板引擎。这减少了服务器上的负载。</p>

<p>缓存的正确操作对系统的稳定运行至关重要</p>

<p>2.有两种不同类型的缓存：<strong>私有缓存</strong>和<strong>共享缓存</strong>。</p>

<p>私有缓存是绑定到特定客户端的缓存&mdash;&mdash;通常是浏览器缓存。由于存储的响应不与其它客户端共享，因此私有缓存可以存储该用户的个性化响应。</p>

<p>另一方面，如果个性化内容存储在私有缓存以外的缓存中，那么其它用户可能能够检索到这些内容&mdash;&mdash;这可能会导致无意的信息泄露。</p>

<p>如果响应包含个性化内容并且你只想将响应存储在私有缓存中，则必须指定 <code>private</code> 指令。</p>

<pre>
<code>Cache-Control: private{% endhighlight %}

<p>个性化内容通常由 cookie 控制，但 cookie 的存在并不能表明它是私有的，因此单独的 cookie 不会使响应成为私有的。</p>

<p>请注意，如果响应具有 <code>Authorization</code> 标头，则不能将其存储在私有缓存（或共享缓存，除非 Cache-Control 指定的是 <code>public</code>）中。</p>

<p>共享缓存位于客户端和服务器之间，可以存储能在用户之间共享的响应。共享缓存可以进一步细分为<strong>代理缓存</strong>和<strong>托管缓存</strong>。</p>

<p>3.代理缓存：</p>

<p>除了访问控制的功能外，一些代理还实现了缓存以减少网络流量。这通常不由服务开发人员管理，因此必须由恰当的 HTTP 标头等控制。然而，在过去，过时的代理缓存实现&mdash;&mdash;例如没有正确理解 HTTP 缓存标准的实现&mdash;&mdash;经常给开发人员带来问题。</p>

<p><strong>Kitchen-sink 标头</strong>如下所示，用于尝试解决不理解当前 HTTP 缓存规范指令（如 <code>no-store</code>）的&ldquo;旧且未更新的代理缓存&rdquo;的实现。</p>

<pre>
<code>Cache-Control: no-store, no-cache, max-age=0, must-revalidate, proxy-revalidate{% endhighlight %}

<p>然而，近年来，随着 HTTPS 变得越来越普遍，客户端/服务器通信变得加密，在许多情况下，路径中的代理缓存只能传输响应而不能充当缓存。因此，在这种情况下，无需担心甚至无法看到响应的过时代理缓存的实现。</p>

<p>4.托管缓存由服务开发人员明确部署，以降低源服务器负载并有效地交付内容。示例包括反向代理、CDN 和 service worker 与缓存 API 的组合。</p>

<p>托管缓存的特性因部署的产品而异。在大多数情况下，你可以通过 <code>Cache-Control</code> 标头和你自己的配置文件或仪表板来控制缓存的行为。</p>

<p>例如，HTTP 缓存规范本质上没有定义显式删除缓存的方法&mdash;&mdash;但是使用托管缓存，可以通过仪表板操作、API 调用、重新启动等实时删除已经存储的响应。这允许更主动的缓存策略。</p>

<p>也可以忽略标准 HTTP 缓存规范协议以支持显式操作。例如，可以指定以下内容以选择退出私有缓存或代理缓存，同时使用你自己的策略仅在托管缓存中进行缓存。</p>

<pre>
<code>Cache-Control: no-store{% endhighlight %}

<p>5.启发式缓存：HTTP 旨在尽可能多地缓存，因此即使没有给出 <code>Cache-Control</code>，如果满足某些条件，响应也会被存储和重用。这称为<strong>启发式缓存</strong>。</p>

<p>例如，采取以下响应。此回复最后一次更新是在 1 年前。</p>

<pre>
<code>HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2021 22:22:22 GMT

&lt;!doctype html&gt;
&hellip;{% endhighlight %}

<p>试探性地知道，整整一年没有更新的内容在那之后的一段时间内不会更新。因此，客户端存储此响应（尽管缺少 <code>max-age</code>）并重用它一段时间。复用多长时间取决于实现，但规范建议存储后大约 10%（在本例中为 0.1 年）的时间。</p>

<p>启发式缓存是在 <code>Cache-Control</code> 被广泛采用之前出现的一种解决方法，基本上所有响应都应明确指定 <code>Cache-Control</code> 标头。</p>

<p>6.存储的 HTTP 响应有两种状态：<strong>fresh</strong> 和 <strong>stale</strong>。<em>fresh</em> 状态通常表示响应仍然有效，可以重复使用，而 <em>stale</em> 状态表示缓存的响应已经过期。</p>

<p>确定响应何时是 fresh 的和何时是 stale 的标准是 <strong>age</strong>。在 HTTP 中，age 是自响应生成以来经过的时间。</p>

<p>以下面的示例响应为例（604800 秒是一周）：</p>

<pre>
<code>HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Cache-Control: max-age=604800

&lt;!doctype html&gt;
&hellip;{% endhighlight %}

<p>&nbsp;</p>

