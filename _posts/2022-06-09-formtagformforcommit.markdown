---
layout: post
title: "form_tag form_for commit"
date: "2022-06-09"
categories: 
---
{% highlight html %}form_tag(url_for_options = {}, options = {}, &amp;block) public{% endhighlight %} 
<p>启动一个表单标记，将操作指向一个配置了url_for_选项的url，就像ActionController:：Base#url_for一样。表单的方法默认为POST。</p> 
<blockquote>
{% highlight html %}使用方法是地址加上方法，使用get和post都可以{% endhighlight %} 
{% highlight html %}&lt;%= form_tag("/search", method: "get") do %&gt;
&lt;%= label_tag(:q, "Search for:") %&gt;
&lt;%= text_field_tag(:q) %&gt;
&lt;%= submit_tag("Search") %&gt;
&lt;% end %&gt;{% endhighlight %} 
{% highlight html %}&lt;!--
&lt;form action="/domains" method="get"&gt;
domain_name: &lt;input type="text" name="domain_name" value=&lt;%= params[:domain_name] %&gt;/&gt;
domain_address: &lt;input type="text" name="domain_address"/&gt;
&lt;input type='submit'  /&gt;
&lt;/form&gt;
--&gt;
&lt;%= form_tag '', method: :get do %&gt;
&lt;%= text_field_tag :domain_name, params[:domain_name] %&gt;
&lt;% end %&gt;
{% endhighlight %} 
<p>这里的地址设置的就是本页面的地址，不会跳转其他页面，' ' 和 "/domains" 的作用是一样的。都是指向原有的页面。</p> 
</blockquote> 
{% highlight html %}form_tag('/posts')
# =&gt; &lt;form action="/posts" method="post"&gt;
form_tag('/posts/1', method: :put)
# =&gt; &lt;form action="/posts/1" method="post"&gt; ... &lt;input name="_method" type="hidden" value="put" /&gt; ...
form_tag('/upload', multipart: true)
# =&gt; &lt;form action="/upload" method="post" enctype="multipart/form-data"&gt;
&lt;%= form_tag('/posts') do -%&gt;
&lt;div&gt;&lt;%= submit_tag 'Save' %&gt;&lt;/div&gt;
&lt;% end -%&gt;
# =&gt; &lt;form action="/posts" method="post"&gt;&lt;div&gt;&lt;input type="submit" name="commit" value="Save" /&gt;&lt;/div&gt;&lt;/form&gt;
&lt;%= form_tag('/posts', remote: true) %&gt;
# =&gt; &lt;form action="/posts" method="post" data-remote="true"&gt;
form_tag('http://far.away.com/form', authenticity_token: false)
# form without authenticity token
form_tag('http://far.away.com/form', authenticity_token: "cf50faa3fe97702ca1ae")
# form with custom authenticity token{% endhighlight %} 
<p></p>
