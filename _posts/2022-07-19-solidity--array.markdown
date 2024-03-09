---
layout: post
title: "solidity 语法--array "
date: "2022-07-19"
categories: 
---
<p>数组可以具有编译时固定大小或动态大小。</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract Array {<br />
&nbsp;&nbsp;&nbsp; // Several ways to initialize an array<br />
&nbsp;&nbsp;&nbsp; uint[] public arr;<br />
&nbsp;&nbsp;&nbsp; uint[] public arr2 = [1, 2, 3];<br />
&nbsp;&nbsp;&nbsp; // Fixed sized array, all elements initialize to 0<br />
&nbsp;&nbsp;&nbsp; uint[10] public myFixedSizeArr;</p>

<p>&nbsp;&nbsp;&nbsp; function get(uint i) public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return arr[i];<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Solidity can return the entire array.<br />
&nbsp;&nbsp;&nbsp; // But this function should be avoided for<br />
&nbsp;&nbsp;&nbsp; // arrays that can grow indefinitely in length.<br />
&nbsp;&nbsp;&nbsp; function getArr() public view returns (uint[] memory) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return arr;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function push(uint i) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Append to array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This will increase the array length by 1.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.push(i);<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function pop() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Remove last element from array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This will decrease the array length by 1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.pop();<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function getLength() public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return arr.length;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function remove(uint index) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Delete does not change the array length.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // It resets the value at index to it&#39;s default value,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // in this case 0<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete arr[index];<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function examples() external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // create array in memory, only fixed size can be created<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint[] memory a = new uint[](5);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>array这段不能进行编译，看看吧</p>

<p>array移除元素，通过从右向左移动元素来删除数组元素</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract ArrayRemoveByShifting {<br />
&nbsp;&nbsp;&nbsp; // [1, 2, 3] -- remove(1) --&gt; [1, 3, 3] --&gt; [1, 3]<br />
&nbsp;&nbsp;&nbsp; // [1, 2, 3, 4, 5, 6] -- remove(2) --&gt; [1, 2, 4, 5, 6, 6] --&gt; [1, 2, 4, 5, 6]<br />
&nbsp;&nbsp;&nbsp; // [1, 2, 3, 4, 5, 6] -- remove(0) --&gt; [2, 3, 4, 5, 6, 6] --&gt; [2, 3, 4, 5, 6]<br />
&nbsp;&nbsp;&nbsp; // [1] -- remove(0) --&gt; [1] --&gt; []</p>

<p>&nbsp;&nbsp;&nbsp; uint[] public arr;</p>

<p>&nbsp;&nbsp;&nbsp; function remove(uint _index) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(_index &lt; arr.length, &quot;index out of bound&quot;);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i = _index; i &lt; arr.length - 1; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[i] = arr[i + 1];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.pop();<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function test() external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr = [1, 2, 3, 4, 5];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove(2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // [1, 2, 4, 5]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[0] == 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[1] == 2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[2] == 4);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[3] == 5);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr.length == 4);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr = [1];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove(0);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // []<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr.length == 0);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>通过将最后一个元素复制到要删除的位置来删除数组元素</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract ArrayReplaceFromEnd {<br />
&nbsp;&nbsp;&nbsp; uint[] public arr;</p>

<p>&nbsp;&nbsp;&nbsp; // Deleting an element creates a gap in the array.<br />
&nbsp;&nbsp;&nbsp; // One trick to keep the array compact is to<br />
&nbsp;&nbsp;&nbsp; // move the last element into the place to delete.<br />
&nbsp;&nbsp;&nbsp; function remove(uint index) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Move the last element into the place to delete<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[index] = arr[arr.length - 1];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Remove the last element<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.pop();<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function test() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr = [1, 2, 3, 4];</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove(1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // [1, 4, 3]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr.length == 3);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[0] == 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[1] == 4);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[2] == 3);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove(2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // [1, 4]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr.length == 2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[0] == 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[1] == 4);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

