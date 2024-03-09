---
layout: post
title: "react d3 tooltip 不导致地图各个省份fill的颜色消失"
date: "2023-10-09"
categories: 
---
<p>json: <a href="https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map.json">https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map.json</a></p>

<p>代码：</p>

<pre>
<code>import React, { useState, useEffect, useRef } from &#39;react&#39;;

import ChinaMap from &#39;moment&#39;;

import * as d3 from &#39;d3&#39;;

import chinaGeoJson from &#39;./china_map.json&#39;;

import &#39;./ChinaMap.css&#39;;

//import chinaGeoJson from &#39;./china_map_new.json&#39;;

const MyMapToShowResult = ({ realData }) =&gt; {

&nbsp; const [data, setData] = useState({});

&nbsp; const [loading, setLoading] = useState(true);

&nbsp; const svgRef = useRef(null);

&nbsp; const [hoveredProvince, setHoveredProvince] = useState(null);

nbsp; useEffect(() =&gt; {

&nbsp;&nbsp;&nbsp; const svg = d3.select(svgRef.current);

nbsp;&nbsp;&nbsp; const width = 1000;

&nbsp;&nbsp;&nbsp; const height = 580;

nbsp;&nbsp;&nbsp; const projection = d3.geoMercator()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .center([20, 50])

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .scale(2000)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fitSize([width, height], chinaGeoJson)

nbsp;&nbsp;&nbsp; const path = d3.geoPath()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .projection(projection);

nbsp;&nbsp;&nbsp; const features = JSON.parse(JSON.stringify(chinaGeoJson.features));

nbsp;&nbsp;&nbsp; features.forEach((feature, i) =&gt; {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const provinceData = realData.find(data =&gt; data.province === feature.properties.name);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (provinceData) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature.properties.emission = provinceData.emission;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature.properties.emission = 0;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; });

&nbsp;&nbsp;&nbsp; console.log(&#39;== 省份数据:&#39;, features);

nbsp;&nbsp;&nbsp; svg.selectAll(&#39;path&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data(features)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enter()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(&#39;path&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;d&#39;, path)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;class&#39;, &#39;province&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;fill&#39;, (d, i) =&gt; {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const colorScale = d3

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .scaleSequential()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .interpolator(d3.interpolateRgb(&#39;#ffffff&#39;, &#39;#008000&#39;))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .domain([0, d3.max(features, (d) =&gt; d.properties.emission)]);

nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return colorScale(d.properties.emission);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke&#39;, &#39;black&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stroke-width&#39;, 0.8)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseover&#39;, handleMouseOver)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .on(&#39;mouseout&#39;, handleMouseOut);

&nbsp;&nbsp;&nbsp; // 创建比色卡

&nbsp;&nbsp;&nbsp; const legendWidth = 200;

&nbsp;&nbsp;&nbsp; const legendHeight = 20;

&nbsp;&nbsp;&nbsp; const legendPadding = 10;

&nbsp;&nbsp;&nbsp; const legend = svg.append(&#39;g&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;transform&#39;, `translate(${width - legendWidth - legendPadding},${height - legendHeight - legendPadding})`);

nbsp;&nbsp;&nbsp; const colorScale = d3.scaleSequential()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .interpolator(d3.interpolateRgb(&#39;#ffffff&#39;, &#39;#008000&#39;))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .domain([0, d3.max(features, d =&gt; d.properties.emission)]);

nbsp;&nbsp;&nbsp; console.log(&#39;== 比色卡前，省份数据:&#39;, features);

&nbsp;&nbsp;&nbsp; const legendXScale = d3.scaleLinear()

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .domain([0, d3.max(features, d =&gt; d.properties.emission)])

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .range([0, legendWidth]);

&nbsp;&nbsp;&nbsp; // 根据需要设置刻度数量

&nbsp;&nbsp;&nbsp; const legendXAxis = d3.axisBottom(legendXScale)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ticks(5);

nbsp;&nbsp;&nbsp; legend.append(&#39;g&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;class&#39;, &#39;legend-axis&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;transform&#39;, `translate(0, ${legendHeight})`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .call(legendXAxis);

nbsp;&nbsp;&nbsp; const legendGradient = legend.append(&#39;linearGradient&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;id&#39;, &#39;legend-gradient&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;gradientUnits&#39;, &#39;userSpaceOnUse&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x1&#39;, 0)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x2&#39;, legendWidth)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .selectAll(&#39;stop&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data(colorScale.ticks().map((t, i, n) =&gt; ({

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset: `${100 * i / n.length}%`,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; color: colorScale(t)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .join(&#39;stop&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;offset&#39;, d =&gt; d.offset)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;stop-color&#39;, d =&gt; d.color);

nbsp;&nbsp;&nbsp; legend.append(&#39;rect&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x&#39;, 0)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;y&#39;, -legendHeight / 2)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;width&#39;, legendWidth)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;height&#39;, legendHeight)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .style(&#39;fill&#39;, &#39;url(#legend-gradient)&#39;);

nbsp;&nbsp;&nbsp; function handleMouseOver(event, d) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.append(&#39;text&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;id&#39;, &#39;tooltip&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;class&#39;, &#39;tooltip&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;x&#39;, event.pageX - 120)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr(&#39;y&#39;, event.pageY - 180)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .text(d.properties.name + &quot;:&quot; + d.properties.emission);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(d.properties.name)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(d.properties)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(d.properties.emission)

&nbsp;&nbsp;&nbsp; }

nbsp;&nbsp;&nbsp; function handleMouseOut() {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svg.select(&#39;#tooltip&#39;).remove();

&nbsp;&nbsp;&nbsp; }

br /&gt;
nbsp; }, [data]);

nbsp; return (

&nbsp;&nbsp;&nbsp; &lt;&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;svg ref={svgRef} width={1200} height={600}&gt;&lt;/svg&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div id=&quot;tooltip&quot; style={{ display: &#39;none&#39;, position: &#39;absolute&#39;, backgroundColor: &#39;white&#39;, padding: &#39;5px&#39;, borderRadius: &#39;5px&#39;, boxShadow: &#39;0 2px 5px rgba(0, 0, 0, 0.3)&#39;, zIndex: &#39;999&#39; }}&gt;&lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {hoveredProvince &amp;&amp; (

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div id=&quot;tooltip&quot; style={{ display: &#39;block&#39;, position: &#39;absolute&#39;, backgroundColor: &#39;white&#39;, padding: &#39;5px&#39;, borderRadius: &#39;5px&#39;, boxShadow: &#39;0 2px 5px rgba(0, 0, 0, 0.3)&#39;, zIndex: &#39;999&#39;, left: &#39;10px&#39;, top: &#39;10px&#39; }}&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {hoveredProvince}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )}

&nbsp;&nbsp;&nbsp; &lt;/&gt;

nbsp; );

};

export default MyMapToShowResult;{% endhighlight %}

<p>&nbsp;</p>

