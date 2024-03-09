---
layout: post
title: "Connecting MyEtherWallet, Mist, and MetaMask to Your Private Blockchain"
date: "2022-07-27"
categories: 
---
<p>https://bitfalls.com/2018/02/19/first-ethereum-address-learning-use-myetherwallet/（有问题）</p>

<p><font style="vertical-align:inherit">MetaMask 是 Google Chrome 连接到以太坊区块链的扩展。 它可以连接到主网、 </font><a href="https://bitfalls.com/3spl"><font style="vertical-align:inherit">区块 </font></a><font style="vertical-align:inherit">或私有 </font></p>

<p><font style="vertical-align:inherit">MetaMask 连接到为主网和测试网生成的相同以太坊地址 </font><a href="https://bitfalls.com/3spl"><font style="vertical-align:inherit">coinbase </font></a><font style="vertical-align:inherit">地址并查看其余额，而是会连接到您的私有区块链，地址已经存在于 MetaMask 中。 例如，如果您有地址 </font>{% highlight %}0x2489efb207809c237c85c202d0fa78c8b236709c{% endhighlight %}<font style="vertical-align:inherit">在 MetaMask 中，然后连接到 Localhost 8545（我们自己运行的 geth 节点）将连接到该地址，但其余额将为 0，因为它尚未在该区块链上获得任何以太币。 </font></p>

<p><font style="vertical-align:inherit">如果您想将 MetaMask 连接到 </font>{% highlight %}coinbase{% endhighlight %}<font style="vertical-align:inherit">您的节点地址，您需要进入账户切换选项，选择&ldquo;导入账户&rdquo;，并找到该节点的 JSON 文件 </font>{% highlight %}coinbase{% endhighlight %}<font style="vertical-align:inherit">帐户，然后上传并输入密码。 </font></p>

<p>账号密码可以在运行命令后看到。</p>

<p><img height="862" src="/uploads/ckeditor/pictures/139/image-20220727090003-1.png" width="1305" /></p>

<p>切换到8545网络，导入账户，即可</p>

<p><img height="586" src="/uploads/ckeditor/pictures/141/image-20220727090043-3.png" width="359" /></p>

<p><img height="540" src="/uploads/ckeditor/pictures/140/image-20220727090024-2.png" width="1238" /></p>

<p>&nbsp;</p>

