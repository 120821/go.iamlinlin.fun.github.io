---
layout: post
title: "git clone --ssh: Could not resolve hostname github: Temporary failure in name resolution"
date: "2022-08-19"
categories: 
---
<p><a href="http://siwei.me/blog/posts/git-sock5s-github-git-proxy-socks5">参考</a>&nbsp; <a href="https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport">帖子</a></p>

<p>git clone 的时候，出现了报错, 说明网络跟github之间是断开的,&nbsp; 需要翻墙。</p>

{% highlight %}
{% highlight %}&nbsp;ssh: Could not resolve hostname github: Temporary failure in name resolution

fatal: Could not read from remote repository.

Please make sure you have the correct access rights

and the repository exists.{% endhighlight %}

<p>明确：</p>

<p>#[http]<br />
# proxy = https://127.0.0.1:1080<br />
#[https]<br />
# proxy = https://127.0.0.1:1080<br />
#</p>

<p>改成下面这个就可以了。（仍然提示输入用户名和密码）</p>

<pre class="hljs cpp">
[http <span class="hljs-string">&quot;https://github.com&quot;</span>]
    proxy = socks5h:<span class="hljs-comment">//192.168.0.10:1090</span>
[https <span class="hljs-string">&quot;https://github.com&quot;</span>]
    proxy = socks5h:<span class="hljs-comment">//192.168.0.10:1090</span>
{% endhighlight %}

<p>使用：（这样也可以）</p>

{% highlight %}
{% highlight %}git clone https://github.com/user/projectname --config &#39;http.proxy=socks5://127.0.0.1:8080&#39;{% endhighlight %}

<p><img height="371" src="/uploads/ckeditor/pictures/287/image-20220819100718-1.png" width="1420" /></p>

