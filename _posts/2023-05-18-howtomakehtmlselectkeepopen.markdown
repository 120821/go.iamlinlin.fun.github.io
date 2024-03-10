---
layout: post
title: "how to make html select keep open"
date: "2023-05-18"
categories: 
---
<p><a href="https://stackoverflow.com/questions/8430597/how-to-keep-select-dropdown-open-to-test-styles-on-option-in-firebug">https://stackoverflow.com/questions/8430597/how-to-keep-select-dropdown-open-to-test-styles-on-option-in-firebug</a></p>
<p>让下拉框一直显示可以使用mutiple,然后调整hight就可以了</p>
{% highlight html %}&lt;select class=&quot;select&quot; multiple=&quot;multiple&quot;&gt;
&lt;option selected&gt;Select&lt;/option&gt;
&lt;option&gt;Blue&lt;/option&gt;
&lt;option &gt;Red&lt;/option&gt;
&lt;option&gt;Green&lt;/option&gt;
&lt;option&gt;Yellow&lt;/option&gt;
&lt;option&gt;Brown&lt;/option&gt;
&lt;/select&gt;
{% endhighlight %}
