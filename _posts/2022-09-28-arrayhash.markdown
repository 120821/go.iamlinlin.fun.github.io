---
layout: post
title: "array hash 的使用"
date: "2022-09-28"
categories: 
---
<p>对抓取的数据进行去重，取最新的数据，hash array的使用</p>

{% highlight %}
{% highlight %}def get_result_hash_for_lueluelue_result_sets
  #对数据进行确认，无论怎么进行修改用户的列的id是不会变化的，只会随着修改时间进行增加数据，后者取代前者
&nbsp; temp_hash = {

&nbsp;&nbsp;&nbsp; &quot;DOT&quot; =&gt; &#39;70476024645083539914866120258902002044389822943217047784978736702069848167247&#39;,

&nbsp;&nbsp;&nbsp; &quot;ETH&quot; =&gt; &#39;77201932000687051421874801696342701541816747065578039511607412978553675800564&#39;,

&nbsp;&nbsp;&nbsp; &quot;BTC&quot; =&gt; &#39;105640063387051144792550451261497903460441457163918809975891088748950929433065&#39;,

&nbsp;&nbsp;&nbsp; &quot;IPFS&quot; =&gt; &#39;109444936916467285377972213791356162468265265799777646334604004948560489512394&#39;,

&nbsp;&nbsp;&nbsp; &quot;EMAIL&quot; =&gt; &#39;50101170924916254227885891120695131387383646459470231890507002477095918146885&#39;,

&nbsp;&nbsp;&nbsp; &quot;NOTICE&quot; =&gt; &#39;31727182724036554852371956750201584211517824919105130426252222689897810866214&#39;,

&nbsp;&nbsp;&nbsp; &quot;TWITTER_COM&quot; =&gt; &#39;11710898932869919534375710263824782355793106641910621555855312720536896315685&#39;,

&nbsp;&nbsp;&nbsp; &quot;GITHUB&quot; =&gt; &#39;102576668688838416847107385580607409742813859881781246507337882384803237069874&#39;,

&nbsp;&nbsp;&nbsp; &quot;TWITTER_URL&quot; =&gt; &#39;23368862207911262087635895660209245090921614897479706708279561601163163997039&#39;,

&nbsp;&nbsp;&nbsp; &quot;AVATAR&quot; =&gt; &#39;98593787308120460448886304499976840768878166060614499815391824681489593998420&#39;,

&nbsp;&nbsp;&nbsp; &quot;C_NAME&quot; =&gt; &#39;69611991539268867131500085835156593536513732089793432642972060827780580969128&#39;

&nbsp; }

&nbsp; result_hash = {}
  #定义一个空的hash，进行结果的提取，获取需要的数据
&nbsp; temp_hash.map { |key, value|
  #抓取用户修改的所有数据
&nbsp;&nbsp;&nbsp; dot_value = []
    #定义一个空的数组，把id相同的数据进行提取，取最后一个（也就是最新的数据）
&nbsp;&nbsp;&nbsp; result_sets.each { |e|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if e[&#39;keyHash&#39;] == value

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dot_value &lt;&lt; e

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts dot_value

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts key

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts value

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts e[&#39;keyHash&#39;]
        #数据打印后，后续不需要的话，可以删除打印的数据，不打印数据
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if dot_value.last == nil

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash = result_hash.store(key, &#39;&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash = result_hash.store(key, dot_value.last)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; }

&nbsp; }

&nbsp; puts &quot;=== temp_hash : #{temp_hash}&quot;

&nbsp; puts &quot;=== result_hash: #{result_hash}&quot;

&nbsp; return result_hash

end{% endhighlight %}

<p><img src="/uploads/ckeditor/pictures/482/image-20220928113437-1.png" style="height:988px; width:1313px" /></p>

<p>后台打印的数据</p>

<p><img src="/uploads/ckeditor/pictures/483/image-20220928113933-2.png" style="height:1080px; width:1920px" /></p>

<p>最终的结果：</p>

<p><img src="/uploads/ckeditor/pictures/484/image-20220928114012-3.png" style="height:261px; width:1920px" /></p>

