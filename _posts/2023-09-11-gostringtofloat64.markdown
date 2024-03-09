---
layout: post
title: "go [][]string to []float64"
date: "2023-09-11"
categories: 
---
<p>对于数据：</p>

<pre>
<code>maintenanceFillingRate := [][]string{

&nbsp;&nbsp; &nbsp;{&quot;&quot;, &quot;R41022&quot;, &quot;R410&quot;, &quot;R3332&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2022&quot;, &quot;22&quot;, &quot;23&quot;, &quot;22&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2023&quot;, &quot;11&quot;, &quot;43&quot;, &quot;43&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2024&quot;, &quot;22&quot;, &quot;42&quot;, &quot;34&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2025&quot;, &quot;44&quot;, &quot;53&quot;, &quot;34&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2026&quot;, &quot;33&quot;, &quot;53&quot;, &quot;32&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2027&quot;, &quot;35&quot;, &quot;43&quot;, &quot;25&quot;},

&nbsp;&nbsp; &nbsp;{&quot;2028&quot;, &quot;52&quot;, &quot;32&quot;, &quot;22&quot;},

}</code></pre>

<p>想要得到除去第一行和第一列的数据，后面的数据每一列作为一个[]float64，可以在循环里实现：</p>

<p>示例：</p>

<pre>
<code><span style="color:#dcc6e0">package</span> main

<span style="color:#dcc6e0">import</span> (
	<span style="color:#abe338">&quot;fmt&quot;</span>
	<span style="color:#abe338">&quot;strconv&quot;</span>
)

<span style="color:#dcc6e0">func</span> <span style="color:#00e0e0">main</span><span style="color:#f5ab35">()</span> {
	maintenanceFillingRate := [][]<span style="color:#dcc6e0">string</span>{
		{<span style="color:#abe338">&quot;&quot;</span>, <span style="color:#abe338">&quot;R41022&quot;</span>, <span style="color:#abe338">&quot;R410&quot;</span>, <span style="color:#abe338">&quot;R3332&quot;</span>},
		{<span style="color:#abe338">&quot;2022&quot;</span>, <span style="color:#abe338">&quot;22&quot;</span>, <span style="color:#abe338">&quot;23&quot;</span>, <span style="color:#abe338">&quot;22&quot;</span>},
		{<span style="color:#abe338">&quot;2023&quot;</span>, <span style="color:#abe338">&quot;11&quot;</span>, <span style="color:#abe338">&quot;43&quot;</span>, <span style="color:#abe338">&quot;43&quot;</span>},
		{<span style="color:#abe338">&quot;2024&quot;</span>, <span style="color:#abe338">&quot;22&quot;</span>, <span style="color:#abe338">&quot;42&quot;</span>, <span style="color:#abe338">&quot;34&quot;</span>},
		{<span style="color:#abe338">&quot;2025&quot;</span>, <span style="color:#abe338">&quot;44&quot;</span>, <span style="color:#abe338">&quot;53&quot;</span>, <span style="color:#abe338">&quot;34&quot;</span>},
		{<span style="color:#abe338">&quot;2026&quot;</span>, <span style="color:#abe338">&quot;33&quot;</span>, <span style="color:#abe338">&quot;53&quot;</span>, <span style="color:#abe338">&quot;32&quot;</span>},
		{<span style="color:#abe338">&quot;2027&quot;</span>, <span style="color:#abe338">&quot;35&quot;</span>, <span style="color:#abe338">&quot;43&quot;</span>, <span style="color:#abe338">&quot;25&quot;</span>},
		{<span style="color:#abe338">&quot;2028&quot;</span>, <span style="color:#abe338">&quot;52&quot;</span>, <span style="color:#abe338">&quot;32&quot;</span>, <span style="color:#abe338">&quot;22&quot;</span>},
	}

	<span style="color:#d4d0ab">// 获取行数和列数</span>
	rows := <span style="color:#f5ab35">len</span>(maintenanceFillingRate)
	cols := <span style="color:#f5ab35">len</span>(maintenanceFillingRate[<span style="color:#f5ab35">0</span>])

	<span style="color:#d4d0ab">// 创建一个切片，用于存储每一列的数据</span>
	columns := <span style="color:#f5ab35">make</span>([][]<span style="color:#dcc6e0">float64</span>, cols<span style="color:#f5ab35">-1</span>)

	<span style="color:#d4d0ab">// 遍历每一列，并将数据转换为 float64 类型</span>
	<span style="color:#dcc6e0">for</span> j := <span style="color:#f5ab35">1</span>; j &lt; cols; j++ {
		column := <span style="color:#f5ab35">make</span>([]<span style="color:#dcc6e0">float64</span>, rows<span style="color:#f5ab35">-1</span>)
		<span style="color:#dcc6e0">for</span> i := <span style="color:#f5ab35">1</span>; i &lt; rows; i++ {
			value, err := strconv.ParseFloat(maintenanceFillingRate[i][j], <span style="color:#f5ab35">64</span>)
			<span style="color:#dcc6e0">if</span> err == <span style="color:#f5ab35">nil</span> {
				column[i<span style="color:#f5ab35">-1</span>] = value
			} <span style="color:#dcc6e0">else</span> {
				fmt.Printf(<span style="color:#abe338">&quot;无法将 \&quot;%s\&quot; 转换为 float64\n&quot;</span>, maintenanceFillingRate[i][j])
			}
		}
		columns[j<span style="color:#f5ab35">-1</span>] = column
	}

	<span style="color:#d4d0ab">// 打印每一列的数据</span>
	<span style="color:#dcc6e0">for</span> j := <span style="color:#f5ab35">0</span>; j &lt; cols<span style="color:#f5ab35">-1</span>; j++ {
		fmt.Println(columns[j])
	}
}</code></pre>

<p>输出：</p>

<pre>
<code>[22<span style="color:#f5ab35"> 11 </span>22<span style="color:#f5ab35"> 44 </span>33<span style="color:#f5ab35"> 35 </span>52]
[23<span style="color:#f5ab35"> 43 </span>42<span style="color:#f5ab35"> 53 </span>53<span style="color:#f5ab35"> 43 </span>32]
[22<span style="color:#f5ab35"> 43 </span>34<span style="color:#f5ab35"> 34 </span>32<span style="color:#f5ab35"> 25 </span>22]
</code></pre>

