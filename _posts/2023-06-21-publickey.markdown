---
layout: post
title: "查看public key"
date: "2023-06-21"
categories: 
---
<p>要查看公钥（public key），您需要采取以下步骤：</p>
<ol>
<li>打开终端或命令提示符（Terminal或Command Prompt）。</li>
<li>输入以下命令来导航到您的SSH密钥文件所在的目录：
{% highlight html %}cd ~/.ssh{% endhighlight %}
</li>
<li>使用以下命令来查看公钥的内容：
{% highlight html %}cat id_rsa.pub{% endhighlight %}
如果您的密钥文件不是id_rsa.pub，请将命令中的文件名替换为您的公钥文件名。</li>
<li>在终端或命令提示符中显示的内容中，您将看到您的公钥。</li>
</ol>
<p>请注意，这里假设您使用的是OpenSSH。如果您使用的是不同的SSH工具或平台，请根据适当的命令进行调整。</p>
