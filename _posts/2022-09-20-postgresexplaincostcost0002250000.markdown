---
layout: post
title: "postgres explain cost cost=0.00..22500.00"
date: "2022-09-20"
categories: 
---
<p><a href="https://scalegrid.io/blog/postgres-explain-cost/">https://scalegrid.io/blog/postgres-explain-cost/</a></p>

<p>&nbsp;postgres explain cost 的含义，</p>

<p>The costs are in an arbitrary（随意的） unit. A common misunderstanding is that they are in milliseconds or some other unit of time, but that&rsquo;s not the case.</p>

<p>成本是任意单位。&nbsp; 一个常见的误解是它们以毫秒或其他时间单位为单位，但事实并非如此。</p>

<p>The cost units are anchored (by default) to a single sequential page read costing 1.0 units (<code>seq_page_cost</code>). Each row processed adds 0.01 (<code>cpu_tuple_cost</code>), and each non-sequential page read adds 4.0 (<code>random_page_cost</code>). There are many more constants like this, all of which are configurable. That last one is a particularly common candidate, at least on modern hardware. We&rsquo;ll look into that more in a bit.</p>

<p>成本单位（默认情况下）锚定到成本为 1.0 单位 (seq_page_cost) 的单个顺序页面读取。&nbsp; 处理的每一行增加 0.01 (cpu_tuple_cost)，每个非顺序页面读取增加 4.0 (random_page_cost)。&nbsp; 像这样的常量还有很多，所有这些都是可配置的。&nbsp; 最后一个是一个特别常见的候选者，至少在现代硬件上是这样。&nbsp; 稍后我们将对此进行更多研究。</p>

<p>那么：cost=0.00..22500.00，就意味着 cost 从0到22500</p>

<p><img height="411" src="/uploads/ckeditor/pictures/425/image-20220920152034-1.png" width="727" /></p>

<p>In the above query plan, as expected（预期）, the estimated（估计） statement（陈述，语句） execution （执行）cost for the <code>Seq Scan</code> is <code>0.00</code>, and for the <code>Sort</code> is <code>66.83</code>.</p>

<p>在上面的查询计划中，正如预期的那样，Seq Scan 的估计语句执行成本为 0.00，Sort 的估计语句执行成本为 66.83。</p>

<p><img height="242" src="/uploads/ckeditor/pictures/426/image-20220920152200-2.png" width="724" /></p>

<p>我们可以看到 Seq Scan 操作的总成本是 17.00。&nbsp; 对于排序操作是 69.33，这并不比它的启动成本高多少（正如预期的那样）。</p>

<p>costs是怎么计算出来的（calculated）（How the costs are calculated）</p>

<p><img height="318" src="/uploads/ckeditor/pictures/427/image-20220920155413-3.png" width="746" /></p>

<p>在我们的例子中，规划器的统计数据表明该表的数据存储在 7 个页面（或块）内，并且将返回 1000 行。&nbsp; 成本参数 seq_page_cost、cpu_tuple_cost 和 cpu_operator_cost 分别保留为默认值 1、0.01 和 0.0025。</p>

<p>As such, the Seq Scan total cost was calculated as</p>

<p>因此，Seq Scan 总成本计算为</p>

<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="gutter">
			<div class="line number1 index0 alt2">&nbsp;</div>

			<div class="line number2 index1 alt1">2</div>

			<div class="line number3 index2 alt2">3</div>

			<div class="line number4 index3 alt1">4</div>

			<div class="line number5 index4 alt2">5</div>
			</td>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="sql plain">Total cost </code><code class="sql keyword">of</code> <code class="sql plain">Seq Scan</code></div>

			<div class="line number2 index1 alt1"><code class="sql plain">= (estimated sequential page reads * seq_page_cost) + (estimated </code><code class="sql keyword">rows</code> <code class="sql plain">returned * cpu_tuple_cost)</code></div>

			<div class="line number3 index2 alt2"><code class="sql plain">= (7 * 1) + (1000 * 0.01)</code></div>

			<div class="line number4 index3 alt1"><code class="sql plain">= 7 + 10.00</code></div>

			<div class="line number5 index4 alt2"><code class="sql plain">= 17.00</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>

<p>And for the Aggregate as:</p>

<p>总计为：</p>

<div class="container">
<div class="line number1 index0 alt2"><code class="sql plain">Total cost </code><code class="sql keyword">of</code> <code class="sql plain">Aggregate</code></div>

<div class="line number2 index1 alt1"><code class="sql plain">= (cost </code><code class="sql keyword">of</code> <code class="sql plain">Seq Scan) + (estimated </code><code class="sql keyword">rows</code> <code class="sql plain">processed * cpu_operator_cost) + (estimated </code><code class="sql keyword">rows</code> <code class="sql plain">returned * cpu_tuple_cost)</code></div>

<div class="line number3 index2 alt2"><code class="sql plain">= (17.00) + (1000 * 0.0025) + (1 * 0.01) </code></div>

<div class="line number4 index3 alt1"><code class="sql plain">= 17.00 + 2.50 + 0.01</code></div>

<div class="line number5 index4 alt2"><code class="sql plain">= 19.51 </code></div>
</div>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

