---
layout: post
title: "使用httparty+graph+sintra + json 实现若干接口"
date: "2022-09-19"
categories: 
---
<p><a href="https://api.thegraph.com/subgraphs/name/ensdomains/ens/graphql?query=query+MyQuery+%7B%0A++domains%28where%3A+%7Bname%3A+%22bitsofcode.eth%22%7D%29+%7B%0A++++id%0A++++labelName%0A++++name%0A++++resolver+%7B%0A++++++id%0A++++%7D%0A++++labelhash%0A++++owner+%7B%0A++++++id%0A++++%7D%0A++++parent+%7B%0A++++++id%0A++++++labelName%0A++++++labelhash%0A++++++name%0A++++%7D%0A++++subdomainCount%0A++++subdomains+%7B%0A++++++id%0A++++++labelName%0A++++++labelhash%0A++++++name%0A++++%7D%0A++++resolvedAddress+%7B%0A++++++id%0A++++++domains+%7B%0A++++++++labelName%0A++++++++labelhash%0A++++++++name%0A++++++%7D%0A++++%7D%0A++++ttl%0A++%7D%0A%0A%7D">graph query</a></p>
<p>在Gemfile增加gem json和httparty</p>
<p>增加测试的脚本 ens.rb</p>
{% highlight html %}require &#39;json&#39;
require &#39;httparty&#39;
server_url = &#39;https://ensgraph.test-lueluelue-link.com/subgraphs/name/graphprotocol/ens&#39;
response = httparty.post server_url,
&nbsp; :headers =&gt; { &#39;content-type&#39; =&gt; &#39;application/json&#39;, &#39;accept&#39; =&gt; &#39;application/json&#39;},
&nbsp; :body =&gt; {
&nbsp;&nbsp;&nbsp; #&quot;query&quot;: &quot;query myquery {\n&nbsp; domains(where: {name: \&quot;bitsofcode.eth\&quot;}) {\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; labelname\n&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; resolver {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp; owner {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; parent {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelname\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; subdomaincount\n&nbsp;&nbsp;&nbsp; subdomains {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelname\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; resolvedaddress {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domains {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelname\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; ttl\n&nbsp; }\n}&quot;,
&nbsp;&nbsp;&nbsp; &quot;query&quot;: &quot;query myquery {\n&nbsp; domains(where: {name_contains: \&quot;bitsofcode.eth\&quot;}) {\n&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; labelhash\n&nbsp; }\n&nbsp; registration(\n&nbsp;&nbsp;&nbsp; id: \&quot;0x25c26fd2b6c4dc073ae089f5354a505e6266a0047aefdcb47baff2d736c523ca\&quot;\n&nbsp; ) {\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; expirydate\n&nbsp;&nbsp;&nbsp; labelname\n&nbsp;&nbsp;&nbsp; registrationdate\n&nbsp;&nbsp;&nbsp; cost\n&nbsp; }\n}&quot;,
&nbsp;&nbsp;&nbsp; &quot;variables&quot;: nil,
&nbsp;&nbsp;&nbsp; &quot;operationname&quot;: &quot;myquery&quot;,
&nbsp;&nbsp;&nbsp; &quot;extensions&quot;:{&quot;headers&quot;: nil}
&nbsp; }.to_json{% endhighlight %}
<p>然后进行测试，放在app.rb</p>
{% highlight html %}+&nbsp; get &quot;/name&quot; do
+&nbsp;&nbsp;&nbsp; server_url = &#39;https://ensgraph.test-lueluelue-link.com/subgraphs/name/graphprotocol/ens&#39;
+&nbsp;&nbsp;&nbsp; response = HTTParty.post server_url,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :headers =&gt; { &#39;Content-Type&#39; =&gt; &#39;application/json&#39;, &#39;Accept&#39; =&gt; &#39;application/json&#39;},
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :body =&gt; {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;query&quot;: &quot;query MyQuery {\n&nbsp; domains(where: {name: \&quot;bitsofcode.eth\&quot;}) {\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; resolver {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp; owner {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; parent {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; subdomainCount\n&nbsp;&nbsp;&nbsp; subdomains {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; resolvedAddress {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domains {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labelhash\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; }\n&nbsp;&nbsp;&nbsp; ttl\n&nbsp; }\n}&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;variables&quot;: nil,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;operationName&quot;: &quot;MyQuery&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extensions&quot;:{&quot;headers&quot;: nil}
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }.to_json
+&nbsp;&nbsp;&nbsp; puts &quot;== response: #{response}&quot;
+&nbsp;&nbsp;&nbsp; body = JSON.parse(response.body)
+&nbsp;&nbsp;&nbsp; domains = body[&#39;data&#39;][&#39;domains&#39;][0]
+&nbsp;&nbsp;&nbsp; puts &quot;==domains&quot;
+&nbsp;&nbsp;&nbsp; puts domains.inspect
+
+&nbsp;&nbsp;&nbsp; response_registration = HTTParty.post server_url,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :headers =&gt; { &#39;content-type&#39; =&gt; &#39;application/json&#39;, &#39;accept&#39; =&gt; &#39;application/json&#39;},
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :body =&gt; {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;query&quot;: &quot;query MyQuery {\n&nbsp; registration(\n&nbsp;&nbsp;&nbsp; id: \&quot;#{domains[&#39;labelhash&#39;]}\&quot;\n&nbsp; ) {\n&nbsp;&nbsp;&nbsp; id\n&nbsp;&nbsp;&nbsp; expiryDate\n&nbsp;&nbsp;&nbsp; labelName\n&nbsp;&nbsp;&nbsp; registrationDate\n&nbsp;&nbsp;&nbsp; cost\n&nbsp; }\n}&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;variables&quot;: nil,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;operationname&quot;: &quot;myquery&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extensions&quot;:{&quot;headers&quot;: nil}
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }.to_json
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts &quot;== response_registration: #{response_registration}&quot;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; body_registration = JSON.parse(response_registration.body)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts body_registration[&#39;data&#39;].inspect
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; registration = body_registration[&#39;data&#39;][&#39;registration&#39;]
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts &quot;==registration&quot;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts registration.inspect
+&nbsp;&nbsp;&nbsp; json({#注意json的格式，多行json，外层需要增加（）
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: 1,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message: &#39;success&#39;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name: &quot;#{domains[&#39;name&#39;]}&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...... &nbsp;&nbsp;&nbsp; } }）{% endhighlight %}
<p>因为json部分数据需要根据graph的数据进行变化，所以进行参数的替换，并进行两次抓取</p>
<p>接口的参数需要根据需求进行设置，在内容已经设置了参数#{name},在接口api可以根据&#39;/name/:name&#39;进行设置参数，使用：&#39;/name/lihua&#39;</p>
<p>或者：&#39;/name&#39;,使用：&#39;/name?name=liuli&#39;</p>
<p><img src="/uploads/ckeditor/pictures/410/image-20220919170705-1.png" style="height:768px; width:804px" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
