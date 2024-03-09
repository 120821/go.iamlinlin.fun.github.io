---
layout: post
title: "Burp Suite using Java 17+, please supply the following JVM argument:  --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java"
date: "2023-11-25"
categories: 
---
<p>在安装burpsuite的时候，出现：</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">java </span>-<span style="color:#dcc6e0">jar </span><span style="color:#dcc6e0">burpsuite_pro_v2021.12.1.jar
</span>To run <span style="color:#dcc6e0">Burp </span>Suite using <span style="color:#dcc6e0">Java </span><span style="color:#f5ab35">17</span>+, please supply the following <span style="color:#dcc6e0">JVM </span>argument:

--<span style="color:#dcc6e0">add-opens=java.desktop/javax.swing=ALL-UNNAMED </span>--<span style="color:#dcc6e0">add-opens=java.base/java.lang=ALL-UNNAMED </span>{% endhighlight %}

<p>解决：需要设置路径</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">java --add-opens</span>=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -jar &lt;path_to_jar&gt;{% endhighlight %}

<p>注意路径需要替换，例如：</p>

{% highlight %}
{% highlight %}which java
<span style="color:#ffa07a">/workspace/</span>coding_tools<span style="color:#ffa07a">/jdk18/</span>jdk-<span style="color:#f5ab35">18.0</span>.<span style="color:#f5ab35">2.1</span><span style="color:#ffa07a">/bin/</span>java{% endhighlight %}

<p>可以替换为：</p>

{% highlight %}
{% highlight %}/workspace/coding_tools/jdk18/jdk-18.0.2.1/bin/java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -jar burpsuite_pro_v2021.12.1.jar{% endhighlight %}

<p>&nbsp;</p>

