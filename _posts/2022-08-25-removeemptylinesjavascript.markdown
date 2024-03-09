---
layout: post
title: "remove empty lines javascript"
date: "2022-08-25"
categories: 
---
<p><a href="https://www.fwait.com/how-to-remove-empty-lines-in-javascript/">https://www.fwait.com/how-to-remove-empty-lines-in-javascript/</a></p>

<p>添加数据的时候使用js进行判断，删除空白行，并继续执行非空白的内容</p>

<pre class="enlighter-clipboard">
let btnRemove = document.querySelector(&quot;button&quot;);
let output = document.querySelector(&quot;h1&quot;);
let myString = `
Line 1

Line 2

Line 3

`;
output.innerText = myString;
btnRemove.addEventListener(&quot;click&quot;, () =&gt; {
  let regex = /^\s*$(?:\r\n?|\n)/gm;
  let result = myString.replace(regex, &quot;&quot;);
  output.innerText = result;
});</pre>

<p>使用.replace方法就可以进行替换，然后传入参数把空白行进行删除.replace(/^\s*$(?:\r\n?|\n)/gm, &quot;&quot;)</p>

<p><a href="https://itecnote.com/tecnote/javascript-regex-to-remove-white-spaces-blank-lines-and-final-line-break-in-javascript/">https://itecnote.com/tecnote/javascript-regex-to-remove-white-spaces-blank-lines-and-final-line-break-in-javascript/</a></p>

