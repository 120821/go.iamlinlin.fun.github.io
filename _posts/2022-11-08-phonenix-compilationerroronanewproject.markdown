---
layout: post
title: "phonenix - Compilation error on a new project"
date: "2022-11-08"
categories: 
---
<p><a href="https://github.com/phoenixframework/phoenix/issues/1418">https://github.com/phoenixframework/phoenix/issues/1418</a></p>

<p>启动server的时候出现了报错，根据提示进行操作没有效果，陷入循环</p>

<pre>
<code>could not compile dependency :gettext, &quot;mix compile&quot; failed. You can recompile this dependency with &quot;mix deps.compile gettext&quot;, update it with &quot;mix deps.update gettext&quot; or clean it with &quot;mix deps.clean gettext&quot;{% endhighlight %}

<p>解决：</p>

<pre>
<code class="notranslate">sudo apt install erlang{% endhighlight %}

