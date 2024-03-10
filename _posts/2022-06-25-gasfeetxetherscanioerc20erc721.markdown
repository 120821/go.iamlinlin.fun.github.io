---
layout: post
title: "入门区块链 了解这些概念 钱包地址 主链 测试链 余额 手续费（gas fee）交易（tx）区块链浏览器（etherscan.io）， erc20, erc721,"
date: "2022-06-25"
categories: 
---
<p>参考：<a href="https://ethereum.org/zh/developers/docs/transactions/">https://ethereum.org/zh/developers/docs/transactions/</a></p>
<p><strong>钱包地址：</strong>就是ETH地址</p>
<p><img height="346" src="/uploads/ckeditor/pictures/74/image-20220625092802-1.png" width="663" /></p>
<p><strong>主链</strong>又称主网。 通常区块链，尤其是公有链都有<strong>主网和测试网</strong>。 主网是区块链社区公认的可信区块链网络，其交易信息被全体成员所认可。 有效的区块在经过区块链网络的共识后会被追加到主网的区块账本中。<img height="984" src="/uploads/ckeditor/pictures/75/image-20220625092937-2.png" width="1392" /></p>
<div class="post-description">TX 的缩写广泛应用于银行、计算机、教育、金融、政府和卫生等行业。除了 TX 之外，交易 可能还简称为其他首字母缩略词。</div>
<p>TX = 交易</p>
<p>交易是由帐户发出，带密码学签名的指令。 帐户将发起交易以更新以太坊网络的状态。 最简单的交易是将 ETH 从一个账户转到另一个帐户。</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB">交易需要收费并且必须开采才能有效。 为了使这种概述更加简单，我们将其称为 Gas 费和挖矿。</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB">所提交的交易包括下列信息：</p>
<ul>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}recipient{% endhighlight %} &ndash; 接收地址（如果为一个外部持有的帐户，交易将传输值。 如果为合约帐户，交易将执行合约代码）</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}signature{% endhighlight %} &ndash; 发送者的标识符。 当通过发送者的私钥签名交易来确保发送者已授权此交易时，生成此签名。</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}value{% endhighlight %} &ndash; 从发件人向收件人转移 ETH 的金额 （以 WEI 为单位，ETH 的一种面值单位）</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}data{% endhighlight %} &ndash; 可包括任意数据的可选字段</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}gasLimit{% endhighlight %} &ndash; 交易可以消耗的 Gas 的最大数量。 Gas 单位代表了计算步骤</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}maxPriorityFeePerGas{% endhighlight %} - 作为矿工小费包含的最大 gas 数量</li>
<li class="SharedStyledComponents__ListItem-sc-1cr9zfr-28 fhHVqu">{% highlight html %}maxFeePerGas{% endhighlight %} - 愿意为交易支付的最大 gas 数量（包括 {% highlight html %}baseFeePerGas{% endhighlight %} 和 {% highlight html %}maxPriorityFeePerGas{% endhighlight %}）</li>
</ul>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB">Gas 是指矿工处理交易所需的算力。 用户必须为此计算支付费用。 {% highlight html %}gasLimit{% endhighlight %} 和 {% highlight html %}gasPrice{% endhighlight %} 决定支付给矿工的最高交易费用</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB"><strong>区块链浏览器:</strong> <a href="https://etherscan.io/">https://etherscan.io/</a></p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB">可以查看所有人的转账或者账户信息，是公开的</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB"><strong>什么是 ERC-20？</strong></p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB">ERC-20 提供了一个同质化代币的标准，换句话说，每个代币与另一个代币（在类型和价值上）完全相同。 例如，一个 ERC-20 代币就像以太币一样，意味着一个代币会并永远会与其他代币一样。</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB"><strong>ERC721</strong>同样是一个代币标准，ERC721官方简要解释是Non-Fungible Tokens，简写为NFTs，多翻译为非同质代币。</p>
<p class="SharedStyledComponents__Paragraph-sc-1cr9zfr-22 kjQfNB"><a href="https://eips.ethereum.org/EIPS/eip-721">https://eips.ethereum.org/EIPS/eip-721</a></p>
<p>非同质代表独一无二，谜恋猫为例，每只猫都被赋予拥有基因，是独一无二的（一只猫就是一个NFTs），猫之间是不能置换的。这种独特性使得某些稀有猫具有收藏价值，也因此受到追捧。</p>
<p>ERC20代币是可置换的，且可细分为N份（1 = 10 * 0.1）, 而ERC721的Token最小的单位为1，无法再分割。</p>
<blockquote>
<p>如果同一个集合的两个物品具有不同的特征，这两个物品是非同质的，而同质是某个部分或数量可以被另一个同等部分或数量所代替。</p>
</blockquote>
<p>非同质性其实广泛存在于我们的生活中，如图书馆的每一本，宠物商店的每一只宠物，歌手所演唱的歌曲，花店里不同的花等等，因此ERC721合约必定有广泛的应用场景。通过这样一个标准，也可建立跨功能的NFTs管理和销售平台（就像有支持ERC20的交易所和钱包一样），使生态更加强大。</p>
<p><a href="https://learnblockchain.cn/2018/03/23/token-erc721/">https://learnblockchain.cn/2018/03/23/token-erc721/</a></p>
