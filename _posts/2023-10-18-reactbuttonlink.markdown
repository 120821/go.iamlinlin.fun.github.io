---
layout: post
title: "react button link的简单使用"
date: "2023-10-18"
categories: 
---
<p>在react中，使用button，转换为link:</p>

<p>1.确保已经安装依赖：</p>

{% highlight %}
{% highlight %}npm install react-router-dom{% endhighlight %}

<p>{% highlight %}或：{% endhighlight %}</p>

{% highlight %}
{% highlight %}yarn add react-router-dom{% endhighlight %}

<p>{% highlight %}2.在组建引入link:{% endhighlight %}</p>

{% highlight %}
{% highlight %}import { Link } from &#39;react-router-dom&#39;;{% endhighlight %}

<p>{% highlight %}3.在页面使用link:{% endhighlight %}</p>

{% highlight %}
{% highlight %}&lt;Link to=&quot;/about&quot;&gt;关于&lt;/Link&gt;{% endhighlight %}

<p><span style="font-family:monospace">react 我已经有了button，而且button已经有事件：</span></p>

{% highlight %}
{% highlight %}&lt;Button onClick={this.handleForgetPassword} size=&quot;small&quot; className=&quot;&quot;&gt;
  忘记密码?
&lt;/Button&gt;{% endhighlight %}

<p>{% highlight %}事件：{% endhighlight %}</p>

{% highlight %}
{% highlight %} handleForgetPassword = () =&gt; {
   //this.props.history.push(`forget_password`)
   alert(&#39;请联系管理员&#39;);
 }{% endhighlight %}

<p><span style="font-family:monospace">修改为：</span></p>

<p>1.增加：</p>

{% highlight %}
{% highlight %}import { Link } from &#39;react-router-dom&#39;;{% endhighlight %}

<p>{% highlight %}2.修改button为link:{% endhighlight %}</p>

{% highlight %}
{% highlight %}&lt;Link to=&quot;/forget_password&quot; className=&quot;&quot; onClick={this.handleForgetPassword}&gt;
  忘记密码?
&lt;/Link&gt;{% endhighlight %}

