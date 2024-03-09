---
layout: post
title: "react echarts修改字体和颜色等样式（设置宋体）"
date: "2023-11-14"
categories: 
---
<p>refer: <a href="https://zhuanlan.zhihu.com/p/586459547">https://zhuanlan.zhihu.com/p/586459547</a></p>

<p>在使用echarts的时候，可以设置字体，例如设置为宋体，设置字体颜色等：</p>

{% highlight %}
{% highlight %}// 字体样式设置
textStyle: {
    decoration: &#39;none&#39;,
    fontFamily: &#39;Arial, Verdana, sans-serif&#39;,
    fontFamily2: &#39;微软雅黑&#39;,    // IE8- 字体模糊并且不支持不同字体混排，额外指定一份
    // 宋体是 {% endhighlight %}fontFamily:&#39;SimSun&#39;{% highlight %}
    fontSize: 12,
    fontStyle: &#39;normal&#39;,
    fontWeight: &#39;normal&#39;
 },{% endhighlight %}

<p>更具体的位置是：</p>

{% highlight %}
{% highlight %}     return {
       title: {
-        text: <span style="color:#abe338">&#39;堆积图</span>&#39;
+        text: <span style="color:#abe338">&#39;堆积图</span>&#39;,
+        textStyle:{
+          //文字颜色
+          color:<span style="color:#abe338">&#39;black</span>&#39;,
+          //字体风格,<span style="color:#abe338">&#39;normal</span>&#39;,<span style="color:#abe338">&#39;italic</span>&#39;,<span style="color:#abe338">&#39;oblique</span>&#39;
+          fontStyle:<span style="color:#abe338">&#39;normal</span>&#39;,
+          //字体粗细 <span style="color:#abe338">&#39;normal</span>&#39;,<span style="color:#abe338">&#39;bold</span>&#39;,<span style="color:#abe338">&#39;bolder</span>&#39;,<span style="color:#abe338">&#39;lighter</span>&#39;,<span style="color:#f5ab35">100</span> | <span style="color:#f5ab35">200</span> | <span style="color:#f5ab35">300</span> | <span style="color:#f5ab35">400</span>...
+          fontWeight:<span style="color:#abe338">&#39;bold</span>&#39;,
+          //字体系列
+          fontFamily:<span style="color:#abe338">&#39;SimSun</span>&#39;,
+        }
       },
       tooltip: {
         trigger: <span style="color:#abe338">&#39;axis</span>&#39;,
@@ <span style="color:#f5ab35">-130</span>,<span style="color:#f5ab35">6</span> <span style="color:#f5ab35">+140</span>,<span style="color:#f5ab35">9</span> @@ export default class CalculationCharts extends Component {
           boundaryGap: false,
           //data: [<span style="color:#abe338">&#39;Mon</span>&#39;, <span style="color:#abe338">&#39;Tue</span>&#39;, <span style="color:#abe338">&#39;Wed</span>&#39;, <span style="color:#abe338">&#39;Thu</span>&#39;, <span style="color:#abe338">&#39;Fri</span>&#39;, <span style="color:#abe338">&#39;Sat</span>&#39;, <span style="color:#abe338">&#39;Sun</span>&#39;]
           data: this.state.years,
+          axisTick: {
+            show: false // 隐藏刻度线
+          }
         }
       ],
       yAxis: [{% endhighlight %}

