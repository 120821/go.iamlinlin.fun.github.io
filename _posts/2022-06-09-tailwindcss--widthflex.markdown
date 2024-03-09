---
layout: post
title: "tailwind css--width，flex"
date: "2022-06-09"
categories: 
---

                    <p>flex是比较难理解的，宽高是用着比较方便的，</p> 
<p>宽度 w-0 w-px w-0.5</p> 
<p>w-screen w-auto</p> 
<p>高度同理，h-0等</p> 
<p>文本位置也是比较方便的  text-center  text-left  text-right text-justify</p> 
<pre><code>&lt;div class="w-24 md:w-auto"&gt; &lt;/div&gt;自定义宽度
&lt;div class="h-12 w-screen" &gt;&lt;/div&gt;整个页面</code></pre> 
<p>宽度其他会用的样式</p> 
<blockquote> 
 <p>min-w-0    min-width: 0px;<br> min-w-full    min-width: 100%;<br> min-w-min    min-width: min-content;<br> min-w-max    min-width: max-content;</p> 
</blockquote> 
<p>flex 首先要对概念有个认识，方便理解记忆。</p> 
<p>容器默认存在两根轴：水平的主轴（main axis）和垂直的交叉轴（cross axis）。主轴的开始位置（与边框的交叉点）叫做<code>main start</code>，结束位置叫做<code>main end</code>；交叉轴的开始位置叫做<code>cross start</code>，结束位置叫做<code>cross end</code></p> 
<p>项目默认沿主轴排列。单个项目占据的主轴空间叫做<code>main size</code>，占据的交叉轴空间叫做<code>cross size</code>。</p> 
<p>容器有6个属性：</p> 
<blockquote> 
 <ul>
<li>    flex-direction</li>
<li>    flex-wrap</li>
<li>    flex-flow</li>
<li>    justify-content</li>
<li>    align-items</li>
<li>    align-content</li>
</ul>
</blockquote> 
<p><code>flex-direction</code>属性决定主轴的方向（即项目的排列方向）。</p> 
<blockquote> 
 <ul>
<li>
<code>row</code>（默认值）：主轴为水平方向，起点在左端。</li>
<li>
<code>row-reverse</code>：主轴为水平方向，起点在右端。</li>
<li>
<code>column</code>：主轴为垂直方向，起点在上沿。</li>
<li>
<code>column-reverse</code>：主轴为垂直方向，起点在下沿。</li>
</ul>
</blockquote> 
<p>flex-wrap属性，默认情况下，项目都排在一条线（又称"轴线"）上。<code>flex-wrap</code>属性定义，如果一条轴线排不下，如何换行。</p> 
<blockquote> 
 <ul>
<li>
<code>nowrap</code>（默认）：不换行。</li>
<li>
<code>wrap</code>：换行，第一行在上方。</li>
<li>
<code>wrap-reverse</code>：换行，第一行在下方。</li>
</ul>
</blockquote> 
<h3>
<code>flex-flow</code>属性是<code>flex-direction</code>属性和<code>flex-wrap</code>属性的简写形式，默认值为<code>row nowrap</code>。</h3> 
<p><code>justify-content</code>属性定义了项目在主轴上的对齐方式。</p> 
<blockquote> 
 <ul>
<li>
<code>flex-start</code>（默认值）：左对齐</li>
<li>
<code>flex-end</code>：右对齐</li>
<li>
<code>center</code>： 居中</li>
<li>
<code>space-between</code>：两端对齐，项目之间的间隔都相等。</li>
<li>
<code>space-around</code>：每个项目两侧的间隔相等。所以，项目之间的间隔比项目与边框的间隔大一倍。</li>
</ul>
</blockquote> 
<p><code>align-items</code>属性定义项目在交叉轴上如何对齐。</p> 
<blockquote> 
 <ul>
<li>
<code>flex-start</code>：交叉轴的起点对齐。</li>
<li>
<code>flex-end</code>：交叉轴的终点对齐。</li>
<li>
<code>center</code>：交叉轴的中点对齐。</li>
<li>
<code>baseline</code>: 项目的第一行文字的基线对齐。</li>
<li>
<code>stretch</code>（默认值）：如果项目未设置高度或设为auto，将占满整个容器的高度。</li>
</ul>
</blockquote> 
<p><code>align-content</code>属性定义了多根轴线的对齐方式。如果项目只有一根轴线，该属性不起作用。</p> 
<blockquote> 
 <ul>
<li>
<code>flex-start</code>：与交叉轴的起点对齐。</li>
<li>
<code>flex-end</code>：与交叉轴的终点对齐。</li>
<li>
<code>center</code>：与交叉轴的中点对齐。</li>
<li>
<code>space-between</code>：与交叉轴两端对齐，轴线之间的间隔平均分布。</li>
<li>
<code>space-around</code>：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍。</li>
<li>
<code>stretch</code>（默认值）：轴线占满整个交叉轴。</li>
</ul>
</blockquote>
                
