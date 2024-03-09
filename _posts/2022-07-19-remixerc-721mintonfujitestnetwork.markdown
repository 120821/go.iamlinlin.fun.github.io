---
layout: post
title: "使用remix 进行erc-721的发币 mint , on fuji test network"
date: "2022-07-19"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-remix-erc-721-mint-on-fuji-test-network">参考</a></p>

<p>通过这里创建一个 ERC721模板：</p>

<p><a href="http://https://wizard.openzeppelin.com/#erc721">http://https://wizard.openzeppelin.com/#erc721</a></p>

<p><img height="672" src="/uploads/ckeditor/pictures/114/image-20220719160354-1.png" width="1148" /></p>

<p>然后把内容进行copy，粘贴到新的SOL文件</p>

<p><a href="https://remix.ethereum.org/">https://remix.ethereum.org/</a></p>

<p>进行编译，使用，版本号选择对应的版本，<img height="521" src="/uploads/ckeditor/pictures/115/image-20220719160526-2.png" width="1125" /></p>

<p>然后进行deploy<img height="612" src="/uploads/ckeditor/pictures/116/image-20220719160558-3.png" width="1108" /></p>

<p>进行认领</p>

<p><img height="650" src="/uploads/ckeditor/pictures/117/image-20220719160659-4.png" width="366" /></p>

<p>认领后，就可以看到区块链浏览器上，出现了对应的记录：</p>

<p><a href="https://testnet.snowtrace.io/token/0xbcea7cf44e958014d6e64d749ec42f4f6b048bde">https://testnet.snowtrace.io/token/0xbcea7cf44e958014d6e64d749ec42f4f6b048bde</a></p>

<p>burn 功能： 参数token ID 填写 erc-721的id&nbsp; （ 0， 1， 2 。。。）</p>

<p>并且当前操作用户需要是&nbsp; 该token 的拥有者。<img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_110832.png" /></p>

<p>蓝色按钮的方法调用都是不发起交易的</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_150720.png" /></p>

<p>上图的ownerOf&nbsp; 方法，需要传入tokenid ，数字就行， 不用非得字符串。</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_151110.png" /></p>

<h3>转移 token id</h3>

<p>如下图所示，我们可以看到，尾号 7cda, 有token id = 0 和3 的两个NFT</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_151410.png" /></p>

<p>接下来我们使用transfer 来进行转移</p>

<p>在左侧输入参数，点击按钮， metamask中确认，右侧就会出现日志</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_152042.png" /></p>

<p>可以看到， 出现了对应的转移</p>

<p><a href="https://testnet.snowtrace.io/token/0xe5951c52d9ff78b7b570b4249460054f3517a604">https://testnet.snowtrace.io/token/0xe5951c52d9ff78b7b570b4249460054f3517a604</a></p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_152201.png" /></p>

<p>查看nft holders:</p>

<p>发现对应的地址，在持有NFT的数量上 多了一个</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_152415.png" /></p>

<p>我们再试试，root能不能把其他用户的NFT做转移，转到自己头上（上一步操作的反向操作）</p>

<p>结论是不行，如下图所示，&nbsp;</p>

<pre><code>Gas estimation errored with the following message (see below). The transaction execution will likely fail. Do you want to force sending?<br />
Internal JSON-RPC error. { &quot;code&quot;: 3, &quot;message&quot;: &quot;execution reverted: ERC721: transfer caller is not owner nor approved&quot;, &quot;data&quot;: &quot;0x08c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000314552433732313a207472616e736665722063616c6c6572206973206e6f74206f776e6572206e6f7220617070726f766564000000000000000000000000000000&quot; }</code></pre>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_152701.png" /></p>

<p>看起来是这样的：</p>

<p><img src="https://files.sweetysoft.com/blog_images/from_paste_20220430_152838.png" /></p>

<p><img height="999" src="/uploads/ckeditor/pictures/118/image-20220719160750-5.png" width="1434" /></p>

