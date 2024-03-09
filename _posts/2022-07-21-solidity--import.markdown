---
layout: post
title: "solidity--import"
date: "2022-07-21"
categories: 
---
<p>&nbsp;</p>

<p><font style="vertical-align:inherit">您可以在 Solidity 中导入本地和外部文件。 </font>You can import local and external files in Solidity.</p>

<h3 id="local">Here is our folder structure.</h3>

<p><font style="vertical-align:inherit">这是我们的文件夹结构。 </font></p>

<pre>
<code>├── Import.sol
└── Foo.sol
{% endhighlight %}

<p><font style="vertical-align:inherit">foo.sol </font></p>

<pre>
<code class="language-solidity">// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = &quot;Foo&quot;;
}
{% endhighlight %}

<p><font style="vertical-align:inherit">import.sol </font></p>

<pre>
<code class="language-solidity">// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import Foo.sol from current directory
import &quot;./Foo.sol&quot;;

// import {symbol1 as alias, symbol2} from &quot;filename&quot;;
import {Unauthorized, add as func, Point} from &quot;./Foo.sol&quot;;

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();

    // Test Foo.sol by getting it&#39;s name.
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
{% endhighlight %}

<h3 id="external"><font style="vertical-align:inherit">外部的 </font></h3>

<p><font style="vertical-align:inherit">您也可以 </font><a href="https://github.com"><font style="vertical-align:inherit">GitHub </font></a><font style="vertical-align:inherit">通过简单地复制 url </font></p>

<p>// https://github.com/owner/repo/blob/branch/path/to/Contract.sol<br />
import &quot;https://github.com/owner/repo/blob/branch/path/to/Contract.sol&quot;;</p>

<p>// Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch<br />
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol<br />
import &quot;https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol&quot;;</p>

<p>&nbsp;</p>

