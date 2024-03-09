---
layout: post
title: "solidity--try and catch"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/try-catch/</p>

<p><code>try / catch</code> can only catch errors from external function calls and contract creation.</p>

<div class="App_main__nhgh3">
<div class="Example_component__4Fiv8">
<div class="Example_content__6NsNh">
<div>
<p><code>try / catch</code><font style="vertical-align:inherit">只能从外部函数调用和合约创建中捕获错误。 </font></p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>// External contract used for try / catch examples<br />
contract Foo {<br />
&nbsp;&nbsp;&nbsp; address public owner;</p>

<p>&nbsp;&nbsp;&nbsp; constructor(address _owner) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(_owner != address(0), &quot;invalid address&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(_owner != 0x0000000000000000000000000000000000000001);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; owner = _owner;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function myFunc(uint x) public pure returns (string memory) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(x != 0, &quot;require failed&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;my func was called&quot;;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract Bar {<br />
&nbsp;&nbsp;&nbsp; event Log(string message);<br />
&nbsp;&nbsp;&nbsp; event LogBytes(bytes data);</p>

<p>&nbsp;&nbsp;&nbsp; Foo public foo;</p>

<p>&nbsp;&nbsp;&nbsp; constructor() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This Foo contract is used for example of try catch with external call<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foo = new Foo(msg.sender);<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Example of try / catch with external call<br />
&nbsp;&nbsp;&nbsp; // tryCatchExternalCall(0) =&gt; Log(&quot;external call failed&quot;)<br />
&nbsp;&nbsp;&nbsp; // tryCatchExternalCall(1) =&gt; Log(&quot;my func was called&quot;)<br />
&nbsp;&nbsp;&nbsp; function tryCatchExternalCall(uint _i) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try foo.myFunc(_i) returns (string memory result) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Log(result);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Log(&quot;external call failed&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Example of try / catch with contract creation<br />
&nbsp;&nbsp;&nbsp; // tryCatchNewContract(0x0000000000000000000000000000000000000000) =&gt; Log(&quot;invalid address&quot;)<br />
&nbsp;&nbsp;&nbsp; // tryCatchNewContract(0x0000000000000000000000000000000000000001) =&gt; LogBytes(&quot;&quot;)<br />
&nbsp;&nbsp;&nbsp; // tryCatchNewContract(0x0000000000000000000000000000000000000002) =&gt; Log(&quot;Foo created&quot;)<br />
&nbsp;&nbsp;&nbsp; function tryCatchNewContract(address _owner) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try new Foo(_owner) returns (Foo foo) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // you can use variable foo here<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Log(&quot;Foo created&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch Error(string memory reason) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // catch failing revert() and require()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Log(reason);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (bytes memory reason) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // catch failing assert()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit LogBytes(reason);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>
</div>
</div>
</div>
</div>

