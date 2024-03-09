---
layout: post
title: "git commit sign"
date: "2023-02-02"
categories: 
---
<p>refer： <a href="http://siwei.me/blog/posts/linux-git-commit-signing-git-commit">http://siwei.me/blog/posts/linux-git-commit-signing-git-commit</a></p>

<p><a href="https://gist.github.com/ankurk91/c4f0e23d76ef868b139f3c28bde057fc">https://gist.github.com/ankurk91/c4f0e23d76ef868b139f3c28bde057fc</a></p>

<p><a href="https://www.linuxjournal.com/content/signing-git-commits">https://www.linuxjournal.com/content/signing-git-commits</a></p>

<p>1.创建一个新的gpg:&nbsp;</p>

{% highlight %}
{% highlight %}# Ubuntu

sudo apt-get install gpa seahorse{% endhighlight %}

<p>2. 生成:&nbsp;</p>

{% highlight %}
{% highlight %}gpg --gen-key{% endhighlight %}

<p>3. 列出来:</p>

{% highlight %}
{% highlight %}gpg --list-secret-keys --keyid-format=long{% endhighlight %}

<p>看到输出结果：</p>

{% highlight %}
sec   rsa3072/&lt;你的秘钥&gt;{% endhighlight %}

<p>4. 复制上面的 &lt;你的秘钥&gt;&nbsp; ，然后列出它的完整内容：</p>

{% highlight %}
{% highlight %}$ gpg --armor --export &lt;你的秘钥&gt;{% endhighlight %}

<p>把输出的结果从begin行到end行复制到GitHub中，路径为：settings -&gt; ssh and gpg keys -&gt; new gpg key</p>

<p>5.修改本地的 .git/config 或者 ~/.gitconfig</p>

{% highlight %}
{% highlight %}[user]
  name = &lt;name&gt;
  email = &lt;email&gt;
  signingkey = &lt;你的秘钥&gt; (增加这一行)
[commit] (增加这一行)
  gpgsign = true (增加这一行){% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

