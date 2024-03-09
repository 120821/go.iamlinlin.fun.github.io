---
layout: post
title: "truffle init error"
date: "2022-07-25"
categories: 
---
<p>参考：http://www.4k8k.xyz/article/sinyusin/88776939</p>

<p>truffle init<br />
Downloading...<br />
<strong>Error: Error making request. Please check the format of the requested resource: https://raw.githubusercontent.com/truffle-box/bare-box/master/truffle.js</strong><br />
&nbsp;&nbsp;&nbsp; at Request._callback (/snap/truffle/2/node_modules/truffle/build/cli.bundled.js:311386:23)<br />
&nbsp;&nbsp;&nbsp; at self.callback (/snap/truffle/2/node_modules/truffle/build/cli.bundled.js:283165:22)<br />
&nbsp;&nbsp;&nbsp; at emitOne (events.js:96:13)<br />
&nbsp;&nbsp;&nbsp; at Request.emit (events.js:188:7)<br />
&nbsp;&nbsp;&nbsp; at Request.onRequestError (/snap/truffle/2/node_modules/truffle/build/cli.bundled.js:283857:8)<br />
&nbsp;&nbsp;&nbsp; at emitOne (events.js:96:13)<br />
&nbsp;&nbsp;&nbsp; at ClientRequest.emit (events.js:188:7)<br />
&nbsp;&nbsp;&nbsp; at TLSSocket.socketErrorListener (_http_client.js:310:9)<br />
&nbsp;&nbsp;&nbsp; at emitOne (events.js:96:13)<br />
&nbsp;&nbsp;&nbsp; at TLSSocket.emit (events.js:188:7)</p>

<p><span>下面这部分摘自<a href="https://www.jianshu.com/p/e3ea54ed8d3a">https://www.jianshu.com/p/e3ea54ed8d3a</a></span></p>

<p><span>解决方法可以是直接git代码取代truffle init命令</span></p>

<p><span>git clone https://github.com/truffle-box/bare-box</span></p>

<p><span>后续的命令需要先执行：</span></p>

<p><span>cd bare-box</span></p>

<p><span>后继续照旧</span></p>

<p><img height="454" src="/uploads/ckeditor/pictures/132/image-20220725160549-1.png" width="1081" /></p>

<p>然后还是不行</p>

<p><img height="509" src="/uploads/ckeditor/pictures/135/image-20220725175912-1.png" width="1916" /></p>

<p>接着进行更新 npm install</p>

<p><img height="298" src="/uploads/ckeditor/pictures/136/image-20220725180004-2.png" width="981" /></p>

<p>然后进行init即可</p>

<p><img height="538" src="/uploads/ckeditor/pictures/137/image-20220725180032-3.png" width="1898" /></p>

