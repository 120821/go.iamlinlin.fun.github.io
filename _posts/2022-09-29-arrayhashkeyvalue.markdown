---
layout: post
title: "array, hash 的数据处理，替换key, value"
date: "2022-09-29"
categories: 
---
<p>使用array和hash查找并替换array的value</p>

{% highlight %}
{% highlight %}1.9.3p194 :007 &gt; array1 = [{&quot;name&quot;=&gt;&quot;Bob&quot;}, {&quot;age&quot;=&gt;&quot;30&quot;}] 
=&gt; [{&quot;name&quot;=&gt;&quot;Bob&quot;}, {&quot;age&quot;=&gt;&quot;30&quot;}] 
1.9.3p194 :008 &gt; hash1 = array1.find { |h| h[&#39;age&#39;] == &quot;30&quot; }
 =&gt; {&quot;age&quot;=&gt;&quot;30&quot;} 
1.9.3p194 :009 &gt; hash1[&#39;age&#39;] = 31 
=&gt; 31 
1.9.3p194 :010 &gt; array1 
=&gt; [{&quot;name&quot;=&gt;&quot;Bob&quot;}, {&quot;age&quot;=&gt;31}]{% endhighlight %}

<p><img height="239" src="/uploads/ckeditor/pictures/487/image-20220929150609-1.png" width="701" /></p>

<p>字符串替换使用.sub</p>

{% highlight %}
{% highlight %}a = &quot;foo,bar,baz&quot;

b = a.sub( &quot;foo&quot;, &quot;boo&quot; ){% endhighlight %}

<p><img height="93" src="/uploads/ckeditor/pictures/488/image-20220929150947-2.png" width="525" /></p>

<p>subdomain是一个数组：</p>

{% highlight %}
{% highlight %}&quot;subdomains&quot;:[{&quot;name&quot;:&quot;zfd2.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;zfd.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test6.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;zfd10.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test1.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test3.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;zfd3.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test2.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;zfd11.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test4.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}},{&quot;name&quot;:&quot;test5.zzzzzzzzzzzzzzzzzzzzz.dot&quot;,&quot;owner&quot;:{&quot;id&quot;:&quot;0x0b23e3588c906c3f723c58ef4d6baee7840a977c&quot;}}]{% endhighlight %}

<p><img height="363" src="/uploads/ckeditor/pictures/490/image-20220929151357-1.png" width="530" /></p>

<p>把抓取的数据进行处理，不显示id，直接显示owner：&lsquo;afjdifods&rsquo;</p>

{% highlight %}subdomanis.each do |a|<br />
&nbsp; a[&#39;owner&#39;] = a[&#39;owner&#39;][&#39;id&#39;]<br />
end{% endhighlight %}

<p>&nbsp;</p>

