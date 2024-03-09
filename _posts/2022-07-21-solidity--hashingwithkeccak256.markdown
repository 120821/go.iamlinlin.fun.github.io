---
layout: post
title: "solidity--hashing with Keccak256"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/hashing/</p>

<p><code>keccak256</code> computes the Keccak-256 hash of the input.</p>

<p>Some use cases are:</p>

<ul>
	<li>Creating a deterministic unique ID from a input</li>
	<li>Commit-Reveal scheme</li>
	<li>Compact cryptographic signature (by signing the hash instead of a larger input)</li>
</ul>

<p><code>keccak256</code><font style="vertical-align:inherit">计算输入的 Keccak-256 哈希。 </font></p>

<p><font style="vertical-align:inherit">一些用例是： </font></p>

<ul>
	<li><font style="vertical-align:inherit">从输入创建确定性唯一 ID </font></li>
	<li><font style="vertical-align:inherit">提交-显示方案 </font></li>
	<li><font style="vertical-align:inherit">紧凑的加密签名（通过签名散列而不是更大的输入） </font></li>
</ul>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract HashFunction {<br />
&nbsp;&nbsp;&nbsp; function hash(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string memory _text,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _num,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address _addr<br />
&nbsp;&nbsp;&nbsp; ) public pure returns (bytes32) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return keccak256(abi.encodePacked(_text, _num, _addr));<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Example of hash collision<br />
&nbsp;&nbsp;&nbsp; // Hash collision can occur when you pass more than one dynamic data type<br />
&nbsp;&nbsp;&nbsp; // to abi.encodePacked. In such case, you should use abi.encode instead.<br />
&nbsp;&nbsp;&nbsp; function collision(string memory _text, string memory _anotherText)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (bytes32)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // encodePacked(AAA, BBB) -&gt; AAABBB<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // encodePacked(AA, ABBB) -&gt; AAABBB<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return keccak256(abi.encodePacked(_text, _anotherText));<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract GuessTheMagicWord {<br />
&nbsp;&nbsp;&nbsp; bytes32 public answer =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;</p>

<p>&nbsp;&nbsp;&nbsp; // Magic word is &quot;Solidity&quot;<br />
&nbsp;&nbsp;&nbsp; function guess(string memory _word) public view returns (bool) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return keccak256(abi.encodePacked(_word)) == answer;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

