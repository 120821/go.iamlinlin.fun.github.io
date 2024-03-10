---
layout: post
title: "react render 换行"
date: "2023-10-31"
categories: 
---
<p>react里换行和html类似, 使用&lt;br/&gt;标签，注意需要空一个格。</p>
<p>使用：</p>
<p>{% highlight html %}&lt;br /&gt;{% endhighlight %}</p>
<p>比较完整的例子：</p>
{% highlight html %}render() {
return (
&lt;div&gt;
&lt;span&gt;第一行内容&lt;/span&gt;
&lt;br /&gt;
&lt;span&gt;第二行内容&lt;/span&gt;
&lt;/div&gt;
);
}
{% endhighlight %}
