---
layout: post
title: "如何使用split方法在Ruby中将字符串转换为数组"
date: "2022-07-12"
categories: 
---
<p>参考：https://www.educative.io/answers/how-to-convert-a-string-to-an-array-in-ruby-using-split-method</p>

<p>https://jsonlint.com/</p>

<div style="color: #f8f8f0;background-color: #1e1e1e;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;">
<p><span style="color: #f8f8f0;">str = </span><span style="color: #ce9178;">&quot;This can be split into smaller pieces&quot;</span></p>

<p><span style="color: #f8f8f0;">print str.split</span><span style="color: #dcdcdc;">(</span><span style="color: #ce9178;">&quot; &quot;</span><span style="color: #dcdcdc;">)</span></p>

<p>[&quot;This&quot;, &quot;can&quot;, &quot;be&quot;, &quot;split&quot;, &quot;into&quot;, &quot;smaller&quot;, &quot;pieces&quot;]</p>

<div style="color: #f8f8f0;background-color: #1e1e1e;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;">
<div><span style="color: #f8f8f0;">str = </span><span style="color: #ce9178;">&quot;scissors&quot;</span></div>

<div><span style="color: #f8f8f0;">print str.split</span><span style="color: #dcdcdc;">(</span><span style="color: #ce9178;">&quot;&quot;</span><span style="color: #dcdcdc;">)</span></div>

<div>[&quot;s&quot;, &quot;c&quot;, &quot;i&quot;, &quot;s&quot;, &quot;s&quot;, &quot;o&quot;, &quot;r&quot;, &quot;s&quot;]</div>

<div>&nbsp;</div>

<div>
<div style="color: #f8f8f0;background-color: #1e1e1e;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;">
<div><span style="color: #f8f8f0;">str = </span><span style="color: #ce9178;">&quot;This can be split into smaller pieces&quot;</span></div>

<div><span style="color: #f8f8f0;">print str.split</span><span style="color: #dcdcdc;">(</span><span style="color: #ce9178;">&quot;into&quot;</span><span style="color: #dcdcdc;">)</span></div>

<div>[&quot;This can be split &quot;, &quot; smaller pieces&quot;]</div>
</div>
</div>
</div>
</div>

