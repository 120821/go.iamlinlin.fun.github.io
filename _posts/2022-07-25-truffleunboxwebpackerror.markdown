---
layout: post
title: "truffle unbox webpack error"
date: "2022-07-25"
categories: 
---
<p>{% highlight %}truffle unbox webpack{% endhighlight %}初始化时：Truffle Box at URL https://github.com/truffle-box/webpack-box doesn&rsquo;t exist.</p>

<p>或者</p>

{% highlight %}
{% highlight %}Error: Error making request to https://raw.githubusercontent.com/truffle-box/web
pack-box/master/truffle.js. Got error: connect ECONNREFUSED 151.101.8.133:443. P
lease check the format of the requested resource.
    at Request._callback (C:\Users\Administrator\AppData\Roaming\npm\node_module
s\truffle\build\webpack:\~\truffle-box\lib\utils\unbox.js:45:1)
    at self.callback (C:\Users\Administrator\AppData\Roaming\npm\node_modules\tr
uffle\build\webpack:\~\truffle-box\~\request\request.js:186:1)
    at emitOne (events.js:116:13)
    at Request.emit (events.js:211:7)
    at Request.onRequestError (C:\Users\Administrator\AppData\Roaming\npm\node_m
odules\truffle\build\webpack:\~\truffle-box\~\request\request.js:878:1)
    at emitOne (events.js:116:13)
    at ClientRequest.emit (events.js:211:7)
    at TLSSocket.socketErrorListener (_http_client.js:387:9)
    at emitOne (events.js:116:13)
    at TLSSocket.emit (events.js:211:7){% endhighlight %}

<p><strong>git clone https://github.com/trufflesuite/truffle-init-webpack.git</strong><br />
Cloning into &#39;truffle-init-webpack&#39;...<br />
remote: Enumerating objects: 125, done.<br />
remote: Total 125 (delta 0), reused 0 (delta 0), pack-reused 125<br />
Receiving objects: 100% (125/125), 65.46 KiB | 615.00 KiB/s, done.<br />
Resolving deltas: 100% (46/46), done.<br />
linlin@linlin-i5:/workspace/blockchain/contract_on_goerli_using_infura$ cd truffle-init-webpack</p>

<p><img height="1042" src="/uploads/ckeditor/pictures/134/image-20220725172903-1.png" width="1029" /></p>

