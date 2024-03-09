---
layout: post
title: "本地只能运行localhost的node.js"
date: "2022-08-17"
categories: 
---
<p><a href="https://ethereum.stackexchange.com/questions/23719/invalid-json-rpc-response-undefined-when-running-web3-eth-accounts-node">https://ethereum.stackexchange.com/questions/23719/invalid-json-rpc-response-undefined-when-running-web3-eth-accounts-node</a></p>

<p>根据写好的脚本，传入参数</p>

<p>node mint_by_server.js https://api.avax-test.network/ext/bc/C/rpc 0x35AC2540CDfd427802e6487f6A3bFD49ec501231 abis/template_14.abi &#39;http://www.baidu.com&#39;</p>

<p>打印出来后，会发现，最前边的都是正常的，但是最后会出现报错</p>

<p><img src="/uploads/ckeditor/pictures/231/image-20220817140727-2.png" style="height:332px; width:1200px" /></p>

<p>使用curl https://api.avax-test.network/ext/bc/C/rpc进行测试是否可以连接到网络</p>

<p>curl https://api.avax-test.network/ext/bc/C/rpc:443</p>

<p><img src="/uploads/ckeditor/pictures/232/image-20220817140822-3.png" style="height:330px; width:1229px" /></p>

<p>查看env_file</p>

{% highlight %}
{% highlight %}cat ~/env_file

export HTTP_PROXY=&quot;http://192.168.0.102:8080&quot;

export HTTPS_PROXY=&quot;http://192.168.0.102:8080&quot;

export http_proxy=&quot;http://192.168.0.102:8080&quot;

export https_proxy=&quot;http://192.168.0.102:8080&quot;{% endhighlight %}

<p>测试一些谷歌是否可以正常连接，</p>

<p>curl google.com<br />
&lt;HTML&gt;&lt;HEAD&gt;&lt;meta http-equiv=&quot;content-type&quot; content=&quot;text/html;charset=utf-8&quot;&gt;<br />
&lt;TITLE&gt;301 Moved&lt;/TITLE&gt;&lt;/HEAD&gt;&lt;BODY&gt;<br />
&lt;H1&gt;301 Moved&lt;/H1&gt;<br />
The document has moved<br />
&lt;A HREF=&quot;http://www.google.com/&quot;&gt;here&lt;/A&gt;.<br />
&lt;/BODY&gt;&lt;/HTML&gt;</p>

{% highlight %}
{% highlight %}curl https://api.avax-test.network/ext/bc/C/rpc:443

Not Foundlinlin@linlin-i5:/workspace/pns-airdrop-admin${% endhighlight %}

<p><img src="/uploads/ckeditor/pictures/233/image-20220817141016-1.png" style="height:200px; width:1124px" /></p>

<p>使用node进行测试：</p>

<p>node</p>

<p>Web3 = require(&#39;web3&#39;)</p>

<p>web3 = require(&#39;web3&#39;)</p>

<p>web3 = new Web3(new Web3.providers.HttpProvider(&quot;https://api.avax-test.network/ext/bc/C/rpc&quot;));</p>

<p>web3.eth</p>

<p>以上几个命令都是正常运行的</p>

<p><img src="/uploads/ckeditor/pictures/234/image-20220817141150-1.png" style="height:386px; width:632px" /></p>

<p>但是web3.eth.accounts并不能得到数据</p>

{% highlight %}
{% highlight %}web3.eth.accounts

Uncaught Error: Invalid JSON RPC response: undefined

&nbsp;&nbsp;&nbsp; at Object.InvalidResponse (/workspace/pns-airdrop-admin/node_modules/web3/lib/web3/errors.js:38:16)

&nbsp;&nbsp;&nbsp; at HttpProvider.send (/workspace/pns-airdrop-admin/node_modules/web3/lib/web3/httpprovider.js:91:22)

&nbsp;&nbsp;&nbsp; at RequestManager.send (/workspace/pns-airdrop-admin/node_modules/web3/lib/web3/requestmanager.js:58:32)

&nbsp;&nbsp;&nbsp; at Eth.get [as accounts] (/workspace/pns-airdrop-admin/node_modules/web3/lib/web3/property.js:107:62){% endhighlight %}

<p>&nbsp;</p>

<p><img src="/uploads/ckeditor/pictures/235/image-20220817141420-2.png" style="height:167px; width:1228px" /></p>

<div class="notranslate" style="all:initial">&nbsp;</div>

