---
layout: post
title: "react d3 只显示南海的border"
date: "2023-10-19"
categories: 
---
<p>在正常的渲染中，是每个省份都显示border的，但是南海没有数据，会导致背景颜色和tooltip数据出问题，所以，单独画出一个地图显示南海：</p>

<p>做判断，如果是南海，就显示border，否则不显示：</p>

<pre>
<code>svg.selectAll(&#39;path&#39;)
      .data(chinaData.features)
      .enter()
      .append(&#39;path&#39;)
      .attr(&#39;d&#39;, path)
      .attr(&#39;fill&#39;, &#39;none&#39;)
      .attr(&#39;stroke&#39;, (d) =&gt; {
        // 判断是否为南海区域
        if (d.properties.name === &#39;南海诸岛&#39;) {
          return &#39;gray&#39;; // 设置南海边框颜色
        }
        return &#39;none&#39;; // 隐藏其他省份的边框
      })
      .attr(&#39;stroke-width&#39;, (d) =&gt; {
        // 判断是否为南海区域
        if (d.properties.name === &#39;南海诸岛&#39;) {
          return 0.8; // 设置南海边框宽度
        }
        return 0; // 隐藏其他省份的边框
      });</code></pre>

<p>完整的代码：</p>

<pre>
<code>import React, { useEffect, useRef } from &#39;react&#39;;
import * as d3 from &#39;d3&#39;;
import chinaData from &#39;./china_map_new.json&#39;;

const ChinaMapBorder = () =&gt; {
  const mapRef = useRef();

  useEffect(() =&gt; {
    const svg = d3.select(mapRef.current);

    const projection = d3.geoMercator()
      .center([800, 10])
      .scale(700);

    const path = d3.geoPath()
      .projection(projection);

    svg.selectAll(&#39;path&#39;)
      .data(chinaData.features)
      .enter()
      .append(&#39;path&#39;)
      .attr(&#39;d&#39;, path)
      .attr(&#39;fill&#39;, &#39;none&#39;)
      .attr(&#39;stroke&#39;, (d) =&gt; {
        // 判断是否为南海区域
        if (d.properties.name === &#39;南海诸岛&#39;) {
          return &#39;gray&#39;; // 设置南海边框颜色
        }
        return &#39;none&#39;; // 隐藏其他省份的边框
      })
      .attr(&#39;stroke-width&#39;, (d) =&gt; {
        // 判断是否为南海区域
        if (d.properties.name === &#39;南海诸岛&#39;) {
          return 0.8; // 设置南海边框宽度
        }
        return 0; // 隐藏其他省份的边框
      });

  }, []);

  return (
    &lt;div&gt;
      &lt;svg ref={mapRef} width={1200} height={340} style={{marginLeft: &#39;-273px&#39;, marginTop: &#39;-180px&#39;, zIndex: -100}}/&gt;
    &lt;/div&gt;
  );
};

export default ChinaMapBorder;</code></pre>

<p>json数据是:&nbsp;<a href="https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json">https://github.com/120821/react_learn_for_d3_svg_path_20230912/blob/main/src/china_map_new.json</a></p>

