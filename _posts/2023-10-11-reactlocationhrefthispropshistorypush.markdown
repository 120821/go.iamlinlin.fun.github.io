---
layout: post
title: "React中的导航方式：location.href和this.props.history.push的区别"
date: "2023-10-11"
categories: 
---
<p>react地图页面根据材料来显示不同的地图，点击材料后，不能正常显示地图，是因为导航方式不同，这样解决：</p>

<pre>
<code>+&nbsp;&nbsp;&nbsp; const newUrl = `/show_result_as_map/${calculationResultDetailId}?calculation_result_id=${calculationResultId}&amp;material_id=${materialIdUpdate}&amp;token=${getToken()}`

+&nbsp;&nbsp;&nbsp; location.href = newUrl

+&nbsp;&nbsp;&nbsp; //this.props.history.push(newUrl);{% endhighlight %}

<p>理解</p>

<p>使用location.href类似于直接在浏览器地址栏中输入URL并按下回车键进行导航，使用histrory.push是React router提供的方式，是在React项目中使用 。location.href可以直接操作浏览器刷新。</p>

