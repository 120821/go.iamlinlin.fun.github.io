---
layout: post
title: "solidity 语法--枚举Enumeration"
date: "2022-07-19"
categories: 
---
<p>Solidity 支持可枚举，它们对于建模选择和跟踪状态很有用。</p>

<p>&nbsp;枚举可以在合同之外声明。</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract Enum {<br />
&nbsp;&nbsp;&nbsp; // Enum representing shipping status<br />
&nbsp;&nbsp;&nbsp; enum Status {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pending,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shipped,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accepted,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Canceled<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Default value is the first element listed in<br />
&nbsp;&nbsp;&nbsp; // definition of the type, in this case &quot;Pending&quot;<br />
&nbsp;&nbsp;&nbsp; Status public status;</p>

<p>&nbsp;&nbsp;&nbsp; // Returns uint<br />
&nbsp;&nbsp;&nbsp; // Pending&nbsp; - 0<br />
&nbsp;&nbsp;&nbsp; // Shipped&nbsp; - 1<br />
&nbsp;&nbsp;&nbsp; // Accepted - 2<br />
&nbsp;&nbsp;&nbsp; // Rejected - 3<br />
&nbsp;&nbsp;&nbsp; // Canceled - 4<br />
&nbsp;&nbsp;&nbsp; function get() public view returns (Status) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return status;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Update status by passing uint into input<br />
&nbsp;&nbsp;&nbsp; function set(Status _status) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status = _status;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // You can update to a specific enum like this<br />
&nbsp;&nbsp;&nbsp; function cancel() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status = Status.Canceled;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // delete resets the enum to its first value, 0<br />
&nbsp;&nbsp;&nbsp; function reset() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete status;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>声明和导入枚举</p>

<p>&nbsp;声明枚举的文件</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;<br />
// This is saved &#39;EnumDeclaration.sol&#39;</p>

<p>enum Status {<br />
&nbsp;&nbsp;&nbsp; Pending,<br />
&nbsp;&nbsp;&nbsp; Shipped,<br />
&nbsp;&nbsp;&nbsp; Accepted,<br />
&nbsp;&nbsp;&nbsp; Rejected,<br />
&nbsp;&nbsp;&nbsp; Canceled<br />
}</p>

<p>导入上述枚举的文件</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>import &quot;./EnumDeclaration.sol&quot;;</p>

<p>contract Enum {<br />
&nbsp;&nbsp;&nbsp; Status public status;<br />
}</p>

<p>引用的时候会出错，不知道为什么找不到文件，明明是存在的</p>

