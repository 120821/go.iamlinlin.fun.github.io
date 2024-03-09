---
layout: post
title: "sinatra - graphql 抓取数据 post "
date: "2022-09-28"
categories: 
---
<p><a href="https://cloud.hasura.io/public/graphiql?endpoint=https%3A%2F%2Fmoonbeamgraph.test-pns-link.com%2Fsubgraphs%2Fname%2Fgraphprotocol%2Fpns">pns 网址</a>&nbsp;&nbsp; <a href="https://moonbeamgraph.test-pns-link.com/subgraphs/name/graphprotocol/pns">pns 抓取的接口URL</a></p>

<p>定义一个方法进行数据的抓取，因为需要用到多次，所以会更方便</p>

{% highlight %}
{% highlight %}# 发起http post请求

def post_request options
&nbsp; server_url = options[:server_url]

&nbsp; body_in_hash = options[:body_in_hash]


&nbsp; response = HTTParty.post server_url,

&nbsp;&nbsp;&nbsp; :headers =&gt; { &#39;Content-Type&#39; =&gt; &#39;application/json&#39;, &#39;Accept&#39; =&gt; &#39;application/json&#39;},

&nbsp;&nbsp;&nbsp; :body =&gt; body_in_hash.to_json


&nbsp; puts &quot;== response: #{response}&quot;


&nbsp; result = response.body

&nbsp; return result

end{% endhighlight %}

<p>方法的使用：</p>

{% highlight %}
{% highlight %}def get_result_for_pns name temp_result = post_request server_url: &#39;https://moonbeamgraph.test-pns-link.com/subgraphs/name/graphprotocol/pns&#39;, &nbsp;&nbsp;&nbsp; body_in_hash: { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;operationName&quot;: &quot;MyQuery&quot;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;query&quot;: &quot;query MyQuery {\n&nbsp; domains(where: {name: \&quot;#{name}\&quot;}) {\n&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; subdomains {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; owner {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; subdomainCount\n&nbsp;&nbsp;&nbsp; owner {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; parent {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp; }\n&nbsp; sets(where: {domain_: {name: \&quot;#{name}\&quot;}}) {\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; keyHash\n&nbsp;&nbsp;&nbsp; value\n&nbsp; }\n&nbsp; registrations(where: {labelName: \&quot;#{name.sub(&quot;.dot&quot;, &#39;&#39;)}\&quot;}) {\n&nbsp;&nbsp;&nbsp; expiryDate\n&nbsp;&nbsp;&nbsp; events {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; triggeredDate\n&nbsp;&nbsp;&nbsp; }\n&nbsp; }\n}\n&quot;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;variables&quot;: nil &nbsp;&nbsp;&nbsp; } &nbsp; return temp_result end{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

