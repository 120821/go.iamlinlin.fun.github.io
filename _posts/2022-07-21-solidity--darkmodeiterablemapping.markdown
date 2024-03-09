---
layout: post
title: "solidity--dark mode Iterable Mapping"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/app/iterable-mapping/</p>

<p>You cannot iterate through a {% highlight %}mapping{% endhighlight %}. So here is an example of how to create an iterable {% highlight %}mapping{% endhighlight %}.</p>

<p><font style="vertical-align:inherit">你不能遍历一个 </font>{% highlight %}mapping{% endhighlight %}<font style="vertical-align:inherit">. 所以这里是一个如何创建可迭代的示例 </font>{% highlight %}mapping{% endhighlight %}<font style="vertical-align:inherit">. </font></p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>library IterableMapping {<br />
&nbsp;&nbsp;&nbsp; // Iterable mapping from address to uint;<br />
&nbsp;&nbsp;&nbsp; struct Map {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address[] keys;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping(address =&gt; uint) values;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping(address =&gt; uint) indexOf;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping(address =&gt; bool) inserted;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function get(Map storage map, address key) public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return map.values[key];<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function getKeyAtIndex(Map storage map, uint index) public view returns (address) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return map.keys[index];<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function size(Map storage map) public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return map.keys.length;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function set(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Map storage map,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address key,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint val<br />
&nbsp;&nbsp;&nbsp; ) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (map.inserted[key]) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.values[key] = val;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.inserted[key] = true;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.values[key] = val;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.indexOf[key] = map.keys.length;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.keys.push(key);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function remove(Map storage map, address key) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!map.inserted[key]) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete map.inserted[key];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete map.values[key];</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint index = map.indexOf[key];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint lastIndex = map.keys.length - 1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address lastKey = map.keys[lastIndex];</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.indexOf[lastKey] = index;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete map.indexOf[key];</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.keys[index] = lastKey;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.keys.pop();<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract TestIterableMap {<br />
&nbsp;&nbsp;&nbsp; using IterableMapping for IterableMapping.Map;</p>

<p>&nbsp;&nbsp;&nbsp; IterableMapping.Map private map;</p>

<p>&nbsp;&nbsp;&nbsp; function testIterableMap() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.set(address(0), 0);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.set(address(1), 100);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.set(address(2), 200); // insert<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.set(address(2), 200); // update<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.set(address(3), 300);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i = 0; i &lt; map.size(); i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address key = map.getKeyAtIndex(i);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(map.get(key) == i * 100);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.remove(address(1));</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // keys = [address(0), address(3), address(2)]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(map.size() == 3);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(map.getKeyAtIndex(0) == address(0));<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(map.getKeyAtIndex(1) == address(3));<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(map.getKeyAtIndex(2) == address(2));<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

