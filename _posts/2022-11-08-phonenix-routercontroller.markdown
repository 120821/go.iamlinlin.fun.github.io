---
layout: post
title: "phonenix - router controller "
date: "2022-11-08"
categories: 
---
<p><a href="https://hexdocs.pm/phoenix/request_lifecycle.html">https://hexdocs.pm/phoenix/request_lifecycle.html</a>&nbsp;&nbsp; <a href="https://hexdocs.pm/phoenix/controllers.html">controller guide</a></p>

<p>路由文件(假设项目名为hello)：</p>

{% highlight %}<code class="inline">lib/hello_web/router.ex{% endhighlight %}

<p>{% highlight %}在文件中增加路由：{% endhighlight %}</p>

{% highlight %}scope &quot;/&quot;, HelloWeb do<br />
&nbsp; pipe_through :browser

&nbsp; get &quot;/&quot;, PageController, :index<br />
&nbsp; get &quot;/hello&quot;, HelloController, :index<br />
end{% endhighlight %}

{% highlight %}创建新的controller文件：{% endhighlight %}<code class="inline">lib/hello_web/controllers/hello_controller.ex{% endhighlight %}

<p><code class="inline">内容：{% endhighlight %}</p>

{% highlight %}defmodule HelloWeb.HelloController do<br />
&nbsp; use HelloWeb, :controller</p>

<p>&nbsp; def index(conn, _params) do<br />
&nbsp;&nbsp;&nbsp; render(conn, &quot;index.html&quot;)<br />
&nbsp; end<br />
end{% endhighlight %}

<p>创建新的视图页面：</p>

{% highlight %}<code class="inline">lib/hello_web/views/hello_view.ex{% endhighlight %}

<p><code class="inline">内容：{% endhighlight %}</p>

{% highlight %}defmodule HelloWeb.HelloView do<br />
&nbsp; use HelloWeb, :view<br />
end{% endhighlight %}

<p>增加新的template：</p>

{% highlight %}<code class="inline">lib/hello_web/templates/hello/index.html.heex{% endhighlight %}

<p><code class="inline">内容：{% endhighlight %}</p>

{% highlight %}&lt;section class=&quot;phx-hero&quot;&gt;<br />
&nbsp; &lt;h2&gt;Hello World, from Phoenix!&lt;/h2&gt;<br />
&lt;/section&gt;{% endhighlight %}

<p>打开：<a href="http://localhost:4000/hello">http://localhost:4000/hello</a></p>

<p>可以看到：</p>

<p><img height="378" src="/uploads/ckeditor/pictures/701/image-20221108162608-1.png" width="1370" /></p>

<p>查看layout文件：</p>

{% highlight %}<code class="inline">lib/hello_web/templates/layout/app.html.heex{% endhighlight %}

<p><code class="inline">可以看到有以下内容：{% endhighlight %}</p>

{% highlight %}&lt;%= @inner_content %&gt;{% endhighlight %}</p>

<p>在将 HTML 发送到浏览器之前，它将我们的模板注入到布局中。</p>

<p>增加show页面，先增加路由：</p>

{% highlight %}scope &quot;/&quot;, HelloWeb do<br />
&nbsp; pipe_through :browser</p>

<p>&nbsp; get &quot;/&quot;, PageController, :index<br />
&nbsp; get &quot;/hello&quot;, HelloController, :index<br />
&nbsp; get &quot;/hello/:messenger&quot;, HelloController, :show<br />
end{% endhighlight %}

<p>然后修改controller：</p>

{% highlight %}<code class="inline">lib/hello_web/controllers/hello_controller.ex{% endhighlight %}

<p><code class="inline">内容：{% endhighlight %}</p>

{% highlight %}def show(conn, %{&quot;messenger&quot; =&gt; messenger}) do<br />
&nbsp; render(conn, &quot;show.html&quot;, messenger: messenger)<br />
end{% endhighlight %}

<p>增加视图页面：</p>

{% highlight %}<code class="inline">show.html.heex{% endhighlight %}

{% highlight %}&lt;section class=&quot;phx-hero&quot;&gt;<br />
&nbsp; &lt;h2&gt;Hello World, from &lt;%= @messenger %&gt;!&lt;/h2&gt;<br />
&lt;/section&gt;{% endhighlight %}

<p>打开页面：<a href="http://localhost:4000/hello/Frank">http://localhost:4000/hello/Frank</a></p>

<p><img height="387" src="/uploads/ckeditor/pictures/703/image-20221109153739-1.png" width="1098" /></p>

<p>如果需要这样的show/2， 则：</p>

{% highlight %}def show(conn, %{&quot;messenger&quot; =&gt; messenger} = params) do<br />
&nbsp; ...<br />
end{% endhighlight %}

