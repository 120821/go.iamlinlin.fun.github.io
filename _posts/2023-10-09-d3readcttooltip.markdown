---
layout: post
title: "d3 readct 地图 显示各个省份的tooltip（显示为省份的名称）"
date: "2023-10-09"
categories: 
---
<p>json： <a href="https://json: https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json">https://json: https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json</a></p>
<p>代码：</p>
<p>import React, { useEffect, useRef } from &#39;react&#39;;<br />
import * as d3 from &#39;d3&#39;;<br />
//import chinaData from &#39;./china.json&#39;;<br />
import chinaData from &#39;./china_map_new.json&#39;;</p>
<p>const ChinaMapForTooltip = () =&gt; {<br />
&nbsp; const mapRef = useRef();</p>
<p>&nbsp; useEffect(() =&gt; {<br />
&nbsp;&nbsp;&nbsp; const svg = d3.select(mapRef.current);</p>
<p>&nbsp;&nbsp;&nbsp; // 创建投影函数<br />
&nbsp;&nbsp;&nbsp; const projection = d3.geoMercator()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //.center([15, 18])<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .scale(200)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //.fitSize([800, 800], chinaData);</p>
<p>&nbsp;&nbsp;&nbsp; // 创建路径生成器<br />
&nbsp;&nbsp;&nbsp; const path = d3.geoPath()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .projection(projection);</p>
<p>&nbsp;&nbsp;&nbsp; // 绘制地图路径<br />
&nbsp;&nbsp;&nbsp; svg.selectAll(&#39;path&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data(chinaData.features)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enter()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(&#39;path&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;d&#39;, path)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke&#39;, &#39;white&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke-width&#39;, 0.8)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseover&#39;, handleMouseOver)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseout&#39;, handleMouseOut);</p>
<p>&nbsp;&nbsp;&nbsp; // 处理鼠标悬停事件<br />
&nbsp;&nbsp;&nbsp; function handleMouseOver(event, d) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d3.select(this)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 在工具提示中显示省份名称<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 这里使用了示例的工具提示样式，你可以根据需要自定义样式<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.append(&#39;text&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;id&#39;, &#39;tooltip&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x&#39;, event.pageX + 10)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;y&#39;, event.pageY - 10)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .text(d.properties.name)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .style(&#39;fill&#39;, &#39;white&#39;); // 设置字体颜色为白色<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; // 处理鼠标离开事件<br />
&nbsp;&nbsp;&nbsp; function handleMouseOut() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d3.select(this)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, &#39;none&#39;);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 移除工具提示<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.select(&#39;#tooltip&#39;).remove();<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; }, []);</p>
<p>&nbsp; return (<br />
&nbsp;&nbsp;&nbsp; &lt;svg ref={mapRef} width={1500} height={1000} /&gt;<br />
&nbsp; );<br />
};</p>
<p>export default ChinaMapForTooltip;</p>
