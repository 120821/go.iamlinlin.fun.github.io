---
layout: post
title: "react handsontable render可以做一个默认数据是否存在的判断"
date: "2023-11-13"
categories: 
---
<p>在使用接口的数据的时候，handsontable会出现没有默认数据的情况，可以判断，当数据抓到了，再渲染：</p>

<pre>
<code>{refrigerationDefaultData.length !== 0 &amp;&amp; (
  &lt;HandsonTable
    ref={(ref) =&gt; { this.tableRefs[&#39;refrigerationParamsData&#39;] = ref; }}
    id=&quot;refrigerationParamsData&quot;
    style={{ width: &#39;1000px&#39; }} 
    data={refrigerationDefaultData} 
    onDataChange={this.handleDataChangeForRefrigeration} 
  /&gt; 
)}{% endhighlight %}

<p>&nbsp;</p>

