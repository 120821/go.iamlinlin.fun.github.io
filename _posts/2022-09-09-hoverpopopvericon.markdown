---
layout: post
title: "hover popopver icon"
date: "2022-09-09"
categories: 
---
<p>引用：</p>
{% highlight html %}&lt;link rel=&quot;stylesheet&quot; href=&quot;https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css&quot; integrity=&quot;sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N&quot; crossorigin=&quot;anonymous&quot;&gt;{% endhighlight %}
<p>使用bootstrap进行hover popover无论使用什么 标签都不用影响hover的使用，只需要增加title和属性就可以了</p>
{% highlight html %}+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 你的钱包地址是: &lt;%= current_account.address %&gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;img class=&quot;&quot; alt=&quot;&quot; src=&quot;&lt;%= asset_path &#39;icon.png&#39; %&gt;&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&#39;由airdrop服务器为您生成的钱包地址&#39;&gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;span class=&quot;&quot; alt=&quot;&quot; src=&quot;&lt;%= asset_path &#39;icon.png&#39; %&gt;&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&#39;由airdrop服务器为您生成的钱包
地址&#39;&gt;?&lt;/span&gt;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;a class=&quot;&quot; alt=&quot;&quot; src=&quot;&lt;%= asset_path &#39;icon.png&#39; %&gt;&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&#39;由airdrop服务器为您生成的钱包地址&#39;&gt;?&lt;/a&gt;{% endhighlight %}
<p><img height="227" src="/uploads/ckeditor/pictures/390/image-20220909110636-1.png" width="589" /></p>
