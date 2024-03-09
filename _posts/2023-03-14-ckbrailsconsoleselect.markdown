---
layout: post
title: "ckb rails console select 的使用"
date: "2023-03-14"
categories: 
---
<p>进入console，使用select语句：</p>

<pre>
<code>PoolTransactionEntry.select(:id, :transaction_fee, :bytes)</code></pre>

<p>这将生成这样的sql:</p>

<pre>
<code>SELECT &quot;pool_transaction_entries&quot;.&quot;id&quot;, &quot;pool_transaction_entries&quot;.&quot;transaction_fee&quot;, &quot;pool_transaction_entries&quot;.&quot;bytes&quot; FROM &quot;pool_transaction_entries&quot;</code></pre>

<p>得到这样的输出：</p>

<pre>
<code>=&gt; [#&lt;PoolTransactionEntry:0x00007f565e238910 id: 4, transaction_fee: 1000, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238848 id: 5, transaction_fee: 886, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238780 id: 7, transaction_fee: 10026, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e2386b8 id: 9, transaction_fee: 1000, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e2385f0 id: 11, transaction_fee: 4770, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238528 id: 6, transaction_fee: 1969, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238460 id: 8, transaction_fee: 1000, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238398 id: 12, transaction_fee: 10026, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e2382d0 id: 10, transaction_fee: 107658, bytes: 0&gt;,

&nbsp;#&lt;PoolTransactionEntry:0x00007f565e238208 id: 3, transaction_fee: 4770, bytes: 0&gt;]</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

