---
layout: post
title: "phonenix - get started"
date: "2022-11-08"
categories: 
---
<p><a href="https://hexdocs.pm/phoenix/up_and_running.html">https://hexdocs.pm/phoenix/up_and_running.html</a></p>

<p>创建新的框架：</p>

{% highlight %}
{% highlight %}mix phx.new hello{% endhighlight %}

<p>然后就会看到自动生成以下文件：</p>

{% highlight %}
{% highlight %}mix phx.new hello

* creating hello/config/config.exs

* creating hello/config/dev.exs

* creating hello/config/prod.exs

...
Fetch and install dependencies? [Yn]{% endhighlight %}

<p>直接回车即可</p>

<p>完成就会提示接下来的操作：</p>

{% highlight %}
{% highlight %}Fetch and install dependencies? [Yn] Y

* running mix deps.get

* running mix deps.compile

We are almost there! The following steps are missing:

&nbsp;&nbsp;&nbsp; $ cd hello

Then configure your database in config/dev.exs and run:

&nbsp;&nbsp;&nbsp; $ mix ecto.create

Start your Phoenix app with:

&nbsp;&nbsp;&nbsp; $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

&nbsp;&nbsp;&nbsp; $ iex -S mix phx.server{% endhighlight %}

<p>进入文件夹：</p>

<p>cd hello</p>

<p>创建文件：</p>

{% highlight %}
{% highlight %}mix ecto.create

Compiling 13 files (.ex)

Generated hello app

The database for Hello.Repo has been created{% endhighlight %}

<p>启动server</p>

{% highlight %}
{% highlight %}mix phx.server

[info] Running HelloWeb.Endpoint with cowboy 2.9.0 at 127.0.0.1:4000 (http)

[info] Access HelloWeb.Endpoint at http://localhost:4000

[watch] build finished, watching for changes...

...{% endhighlight %}

<p>&nbsp;</p>

