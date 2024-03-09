---
layout: post
title: "javascript - console. ouput long object"
date: "2022-07-15"
categories: 
---
<p>参考：<a href="https://stackoverflow.com/questions/10729276/how-can-i-get-the-full-object-in-node-jss-console-log-rather-than-object">https://stackoverflow.com/questions/10729276/how-can-i-get-the-full-object-in-node-jss-console-log-rather-than-object</a></p>

{% highlight %}
{% highlight %}+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(&quot;====================&quot;)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(JSON.stringify(result, null, 4));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(&quot;-------------------------------&quot;)
+&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp; console.log(JSON.stringify(result, null, 4));</strong>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let nft_id = result.events.MintedEventLog.returnValues.nftId
得到结果：
{

&nbsp;&nbsp;&nbsp; &quot;blockHash&quot;: &quot;0xd61bdd17b1e4d935cd9ef2baa652281d19928a9c29d73824929f7da8b79a1cca&quot;,

&nbsp;&nbsp;&nbsp; &quot;blockNumber&quot;: 11620282,

&nbsp;&nbsp;&nbsp; &quot;contractAddress&quot;: null,

&nbsp;&nbsp;&nbsp; &quot;cumulativeGasUsed&quot;: 140918,

&nbsp;&nbsp;&nbsp; &quot;effectiveGasPrice&quot;: 27500000000,

&nbsp;&nbsp;&nbsp; &quot;from&quot;: &quot;0x960781b058da688735c98d5165af8ff4e1b400e0&quot;,

&nbsp;&nbsp;&nbsp; &quot;gasUsed&quot;: 140918,

&nbsp;&nbsp;&nbsp; &quot;logsBloom&quot;: &quot;0x00000000000000000008080000000000000000000000000000000000000000000000800000000000000000000000000000000000040000000020000000000000080000400000000000000008000000000000000000000000000000000000000000000000020000000000000000000800000000000000000000000010000000000000000000000000010000000000000000000000800000000004000004000000000000000000000000004000000000000000000000000800000000000000000000000002000000000100000000000000000000000000000000000000000020000000000000000000000100000000000000000000000000000000000000000000&quot;,

&nbsp;&nbsp;&nbsp; &quot;status&quot;: true,

&nbsp;&nbsp;&nbsp; &quot;to&quot;: &quot;0xbc61652e3ec01e883c8abf8b36e18576ab01a3a1&quot;,

&nbsp;&nbsp;&nbsp; &quot;transactionHash&quot;: &quot;0x9ba351da58edbea451f44bc638de6fb4e1188be17de701faa8f2b501c807f238&quot;,

&nbsp;&nbsp;&nbsp; &quot;transactionIndex&quot;: 0,

&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;0x2&quot;,

&nbsp;&nbsp;&nbsp; &quot;events&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Transfer&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;address&quot;: &quot;0xbc61652e3Ec01e883c8AbF8b36E18576aB01A3a1&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockNumber&quot;: 11620282,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionHash&quot;: &quot;0x9ba351da58edbea451f44bc638de6fb4e1188be17de701faa8f2b501c807f238&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionIndex&quot;: 0,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockHash&quot;: &quot;0xd61bdd17b1e4d935cd9ef2baa652281d19928a9c29d73824929f7da8b79a1cca&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;logIndex&quot;: 0,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;removed&quot;: false,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: &quot;log_cf491656&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;returnValues&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;: &quot;0x0000000000000000000000000000000000000000&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;2&quot;: &quot;10&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;from&quot;: &quot;0x0000000000000000000000000000000000000000&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;to&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;tokenId&quot;: &quot;10&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;event&quot;: &quot;Transfer&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signature&quot;: &quot;0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;raw&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: &quot;0x&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;topics&quot;: [

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x0000000000000000000000000000000000000000000000000000000000000000&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x000000000000000000000000960781b058da688735c98d5165af8ff4e1b400e0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x000000000000000000000000000000000000000000000000000000000000000a&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RemoveFromWhiteListEventLog&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;address&quot;: &quot;0xbc61652e3Ec01e883c8AbF8b36E18576aB01A3a1&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockNumber&quot;: 11620282,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionHash&quot;: &quot;0x9ba351da58edbea451f44bc638de6fb4e1188be17de701faa8f2b501c807f238&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionIndex&quot;: 0,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockHash&quot;: &quot;0xd61bdd17b1e4d935cd9ef2baa652281d19928a9c29d73824929f7da8b79a1cca&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;logIndex&quot;: 1,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;removed&quot;: false,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: &quot;log_c6ef7e5b&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;returnValues&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;the_address&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;event&quot;: &quot;RemoveFromWhiteListEventLog&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signature&quot;: &quot;0x6394ab9f9d00c882788c8d592c818b9b094e5760363e7bbad72d34268d2c0af0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;raw&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: &quot;0x000000000000000000000000960781b058da688735c98d5165af8ff4e1b400e0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;topics&quot;: [

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x6394ab9f9d00c882788c8d592c818b9b094e5760363e7bbad72d34268d2c0af0&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MintedEventLog&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;address&quot;: &quot;0xbc61652e3Ec01e883c8AbF8b36E18576aB01A3a1&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockNumber&quot;: 11620282,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionHash&quot;: &quot;0x9ba351da58edbea451f44bc638de6fb4e1188be17de701faa8f2b501c807f238&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionIndex&quot;: 0,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;blockHash&quot;: &quot;0xd61bdd17b1e4d935cd9ef2baa652281d19928a9c29d73824929f7da8b79a1cca&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;logIndex&quot;: 2,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;removed&quot;: false,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: &quot;log_778aef08&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;returnValues&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1&quot;: &quot;10&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;2&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;to&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &quot;nftId&quot;: &quot;10&quot;,</strong>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;minter&quot;: &quot;0x960781B058da688735c98D5165aF8FF4e1B400E0&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;event&quot;: &quot;MintedEventLog&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signature&quot;: &quot;0xd873115f99b556f44716505d36cf48b0ea89f182db7b8c307900433c3b27b43c&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;raw&quot;: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: &quot;0x000000000000000000000000960781b058da688735c98d5165af8ff4e1b400e0000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000960781b058da688735c98d5165af8ff4e1b400e0&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;topics&quot;: [

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0xd873115f99b556f44716505d36cf48b0ea89f182db7b8c307900433c3b27b43c&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; }

}

+

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(&quot;====================&quot;, nft_id){% endhighlight %}

<p>&nbsp;</p>

