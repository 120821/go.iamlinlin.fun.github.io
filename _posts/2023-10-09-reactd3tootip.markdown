---
layout: post
title: "react d3 修改地图tootip的位置"
date: "2023-10-09"
categories: 
---
<p>json: <a href="https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json">https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json</a></p>
<p>代码：</p>
{% highlight html %}import React, { useEffect, useRef } from &#39;react&#39;;
import * as d3 from &#39;d3&#39;;
//import chinaData from &#39;./china.json&#39;;
import chinaData from &#39;./china_map_new.json&#39;;
const ChinaMapForTooltip = () =&gt; {
&nbsp; const mapRef = useRef();
nbsp; useEffect(() =&gt; {
&nbsp;&nbsp;&nbsp; const svg = d3.select(mapRef.current);
nbsp;&nbsp;&nbsp; // 创建投影函数
&nbsp;&nbsp;&nbsp; const projection = d3.geoMercator()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //.center([15, 18])
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .scale(200)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //.fitSize([800, 800], chinaData);
nbsp;&nbsp;&nbsp; // 创建路径生成器
&nbsp;&nbsp;&nbsp; const path = d3.geoPath()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .projection(projection);
nbsp;&nbsp;&nbsp; // 绘制地图路径
&nbsp;&nbsp;&nbsp; svg.selectAll(&#39;path&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data(chinaData.features)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enter()
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(&#39;path&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;d&#39;, path)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke&#39;, &#39;white&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke-width&#39;, 0.8)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseover&#39;, handleMouseOver)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseout&#39;, handleMouseOut);
nbsp;&nbsp;&nbsp; // 处理鼠标悬停事件
&nbsp;&nbsp;&nbsp; function handleMouseOver(event, d) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d3.select(this)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;);
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 在工具提示中显示省份名称
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 这里使用了示例的工具提示样式，你可以根据需要自定义样式
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.append(&#39;text&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;id&#39;, &#39;tooltip&#39;)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x&#39;, event.pageX - 80) // 修改tooltip的位置，左右
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;y&#39;, event.pageY - 180) // 修改tooltip的位置，上下
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .text(d.properties.name)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .style(&#39;fill&#39;, &#39;white&#39;); // 设置字体颜色为白色
&nbsp;&nbsp;&nbsp; }
nbsp;&nbsp;&nbsp; // 处理鼠标离开事件
&nbsp;&nbsp;&nbsp; function handleMouseOut() {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d3.select(this)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;);
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 移除工具提示
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.select(&#39;#tooltip&#39;).remove();
&nbsp;&nbsp;&nbsp; }
&nbsp; }, []);
nbsp; return (
&nbsp;&nbsp;&nbsp; &lt;svg ref={mapRef} width={1500} height={1000} /&gt;
&nbsp; );
};
export default ChinaMapForTooltip;{% endhighlight %}
<p>&nbsp;</p>
