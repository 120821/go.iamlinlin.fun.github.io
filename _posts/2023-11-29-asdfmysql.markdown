---
layout: post
title: "asdf 卸载mysql"
date: "2023-11-29"
categories: 
---
<p>1.查看是否Asdf已经安装了mysql</p>

<pre>
<code>asdf plugin-list{% endhighlight %}

<p>2.卸载asdf&nbsp; mysql 以及插件</p>

<pre>
<code>asdf uninstall mysql{% endhighlight %}

<pre>
<code>asdf plugin-remove mysql{% endhighlight %}

<pre>
<code><span style="color:#ffd700">asdf</span> plugin-list
<span style="color:#ffd700">asdf</span>-mongodb.<span style="color:#f5ab35">2</span>GXO
<span style="color:#ffd700">golang</span>
<span style="color:#ffd700">mongodb</span>
<span style="color:#ffd700">mysql</span>
<span style="color:#ffd700">nodejs</span>
<span style="color:#ffd700">postgres</span>
<span style="color:#ffd700">redis</span>
<span style="color:#ffd700">ruby</span>
<span style="color:#ffd700">yarn</span>
<span style="color:#ffd700">linlin</span>@linlin-i<span style="color:#f5ab35">5</span>:~$ asdf uninstall mysql{% endhighlight %}

<p>3.设置mysql为系统安装的mysql</p>

<pre>
<code><span style="color:#ffd700">asdf</span> global mysql system{% endhighlight %}

<p>如果出现了：</p>

<pre>
<code>which mysql
/<span style="color:#ffd700">home</span>/linlin/.asdf/shims/mysql
<span style="color:#ffd700">linlin</span>@linlin-i<span style="color:#f5ab35">5</span>:/workspace$ mysql --version
/<span style="color:#ffd700">usr</span>/bin/mysql  Ver <span style="color:#f5ab35">8</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">35</span>-<span style="color:#f5ab35">0</span>ubuntu<span style="color:#f5ab35">0.22.04.1</span> for Linux <span style="color:#f5ab35">on</span> x<span style="color:#f5ab35">86</span>_<span style="color:#f5ab35">64</span> ((Ubuntu)){% endhighlight %}

<p>在which 和--version返回不同的时候，可以修改bashrc.</p>

<p>&nbsp;</p>

