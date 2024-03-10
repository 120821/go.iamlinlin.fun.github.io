---
layout: post
title: "solidity--可升级代理Upgradeable Proxy"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/app/upgradeable-proxy/</p>
<p>Example of upgradeable proxy contract. Never use this in production.</p>
<p>This example shows how to use {% highlight html %}delegatecall{% endhighlight %} and return data when {% highlight html %}fallback{% endhighlight %} is called.</p>
<p>可升级代理合约的示例。&nbsp; 永远不要在生产中使用它。</p>
<p>&nbsp;这个例子展示了如何在调用 fallback 时使用委托调用并返回数据。</p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>contract Proxy {<br />
&nbsp;&nbsp;&nbsp; address public implementation;</p>
<p>&nbsp;&nbsp;&nbsp; function setImplementation(address _imp) external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implementation = _imp;<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function _delegate(address _imp) internal virtual {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assembly {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // calldatacopy(t, f, s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // copy s bytes from calldata at position f to mem at position t<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calldatacopy(0, 0, calldatasize())</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // delegatecall(g, a, in, insize, out, outsize)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // - call contract at address a<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // - with input mem[in&hellip;(in+insize))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // - providing g gas<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // - and output area mem[out&hellip;(out+outsize))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // - returning 0 on error and 1 on success<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let result := delegatecall(gas(), _imp, 0, calldatasize(), 0, 0)</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // returndatacopy(t, f, s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // copy s bytes from returndata at position f to mem at position t<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returndatacopy(0, 0, returndatasize())</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch result<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0 {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // revert(p, s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // end execution, revert state changes, return data mem[p&hellip;(p+s))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; revert(0, returndatasize())<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // return(p, s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // end execution, return data mem[p&hellip;(p+s))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return(0, returndatasize())<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; fallback() external payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _delegate(implementation);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>contract V1 {<br />
&nbsp;&nbsp;&nbsp; address public implementation;<br />
&nbsp;&nbsp;&nbsp; uint public x;</p>
<p>&nbsp;&nbsp;&nbsp; function inc() external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x += 1;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>contract V2 {<br />
&nbsp;&nbsp;&nbsp; address public implementation;<br />
&nbsp;&nbsp;&nbsp; uint public x;</p>
<p>&nbsp;&nbsp;&nbsp; function inc() external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x += 1;<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function dec() external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x -= 1;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>不能编译</p>
