---
layout: post
title: "如何查看ubuntu版本的架构 查看ubuntu版本号"
date: "2023-06-27"
categories: 
---
<p><a href="https://blog.51cto.com/u_16099252/6284358">https://blog.51cto.com/u_16099252/6284358</a></p>

<p>1、查看内核版本号</p>

{% highlight %}
{% highlight %}uname -a{% endhighlight %}

{% highlight %}
{% highlight %}Linux linlin-i5 5.19.0-45-generic #46~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Wed Jun 7 15:06:04 UTC 20 x86_64 x86_64 x86_64 GNU/Linux{% endhighlight %}

<p>2、查看ubuntu版本号</p>

{% highlight %}
{% highlight %}cat /etc/issue{% endhighlight %}

{% highlight %}
{% highlight %}Ubuntu 22.04.1 LTS \n \l{% endhighlight %}

<p>3、查看ubuntu版本号</p>

{% highlight %}
{% highlight %}sudo lsb_release -a{% endhighlight %}

{% highlight %}
{% highlight %}[sudo] password for linlin:

No LSB modules are available.

Distributor ID:&nbsp;&nbsp; &nbsp;Ubuntu

Description:&nbsp;&nbsp; &nbsp;Ubuntu 22.04.1 LTS

Release:&nbsp;&nbsp; &nbsp;22.04

Codename:&nbsp;&nbsp; &nbsp;jammy{% endhighlight %}

<p>4. 查看版本号</p>

{% highlight %}
{% highlight %}cat /etc/*release*{% endhighlight %}

<p>&nbsp;</p>

{% highlight %}
{% highlight %}DISTRIB_ID=Ubuntu

DISTRIB_RELEASE=22.04

DISTRIB_CODENAME=jammy

DISTRIB_DESCRIPTION=&quot;Ubuntu 22.04.1 LTS&quot;

PRETTY_NAME=&quot;Ubuntu 22.04.1 LTS&quot;

NAME=&quot;Ubuntu&quot;

VERSION_ID=&quot;22.04&quot;

VERSION=&quot;22.04.1 LTS (Jammy Jellyfish)&quot;

VERSION_CODENAME=jammy

ID=ubuntu

ID_LIKE=debian

HOME_URL=&quot;https://www.ubuntu.com/&quot;

SUPPORT_URL=&quot;https://help.ubuntu.com/&quot;

BUG_REPORT_URL=&quot;https://bugs.launchpad.net/ubuntu/&quot;

PRIVACY_POLICY_URL=&quot;https://www.ubuntu.com/legal/terms-and-policies/privacy-policy&quot;

UBUNTU_CODENAME=jammy{% endhighlight %}

<p>&nbsp;</p>

