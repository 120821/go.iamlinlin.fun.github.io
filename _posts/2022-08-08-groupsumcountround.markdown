---
layout: post
title: "分组统计.group .sum .count 小数位round"
date: "2022-08-08"
categories: 
---
<p>参考：https://blog.csdn.net/weixin_30826761/article/details/98887285</p>

<p>rails分组统计</p>

<pre data-index="0">
<span style="color:#0000ff;"><span style="color:#000000;">SpecialGroup.group(:special_type).count</span>
select special_type,<span style="color:#ff00ff;">count(<span style="color:#808080;">*) <span style="color:#0000ff;">from special_groups <span style="color:#0000ff;">group <span style="color:#0000ff;">by special_type

</span></span></span></span></span></span></pre>

<pre data-index="1">
<span style="color:#000000;">SpecialGroup.group(:special_type).count(:sno)
</span><span style="color:#0000ff;">select special_type,<span style="color:#ff00ff;">count(sno) <span style="color:#0000ff;">from special_groups <span style="color:#0000ff;">group <span style="color:#0000ff;">by special_type

</span></span></span></span></span></pre>

<pre data-index="2">
<span style="color:#000000;">SpecialGroup.group(:special_type).count(<span style="color:#800000;">&quot;<span style="color:#800000;">distinct sno<span style="color:#800000;">&quot;)
</span></span></span></span><span style="color:#0000ff;">select special_type,<span style="color:#ff00ff;">count(<span style="color:#0000ff;">distinct sno) <span style="color:#0000ff;">from special_groups <span style="color:#0000ff;">group <span style="color:#0000ff;">by special_type

<span style="color:#000000;">SpecialGroup.group</span><span style="color:#000000;">(:user_id, :name).sum(:count<span style="color:#800000;"><span style="color:#800000;"><span style="color:#800000;">)</span></span></span></span>
SELECT SUM(`<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>`.`count`) AS sum_count, `<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>`.`user_id` AS <span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>_user_id, `<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>`.`name` AS <span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>_name FROM `<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>` GROUP BY `<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>`.`user_id`, `<span style="color:#0000ff;"><span style="color:#ff00ff;"><span style="color:#0000ff;"><span style="color:#0000ff;">special_groups</span></span></span></span>`.`name</span></span></span></span></span></span></pre>

<p><span style="font-family:Tahoma; font-size:14px; line-height:24px">uby按精度保留小数</span></p>

<p style="margin-top:0px; margin-bottom:0px; padding-top:0px; padding-bottom:0px; font-family:Tahoma; font-size:14px; line-height:24px">有一个round函数，用起来非常方便：</p>

<div class="hljs-ln-numbers">
<div class="hljs-ln-line hljs-ln-n" data-line-number="1">&nbsp;</div>
</div>

<div class="hljs-ln-code">
<div class="hljs-ln-line"><code class="language-ruby hljs"><span class="hljs-meta">&gt;&gt;</span> <span class="hljs-number">2.3465</span>.round</code></div>
</div>

<ol class="hljs-ln" style="width:100%">
	<li>
	<div class="hljs-ln-numbers">
	<div class="hljs-ln-line hljs-ln-n" data-line-number="2">&nbsp;</div>
	</div>

	<div class="hljs-ln-code">
	<div class="hljs-ln-line"><code class="language-ruby hljs">=&gt; <span class="hljs-number">2</span></code></div>
	</div>
	</li>
	<li>
	<div class="hljs-ln-numbers">
	<div class="hljs-ln-line hljs-ln-n" data-line-number="3">&nbsp;</div>
	</div>

	<div class="hljs-ln-code">
	<div class="hljs-ln-line"><code class="language-ruby hljs"><span class="hljs-meta">&gt;&gt;</span> <span class="hljs-number">2.3465</span>.round(<span class="hljs-number">2</span>)</code></div>
	</div>
	</li>
	<li>
	<div class="hljs-ln-numbers">
	<div class="hljs-ln-line hljs-ln-n" data-line-number="4">&nbsp;</div>
	</div>

	<div class="hljs-ln-code">
	<div class="hljs-ln-line"><code class="language-ruby hljs">=&gt; <span class="hljs-number">2.35</span></code></div>
	</div>
	</li>
	<li>
	<div class="hljs-ln-numbers">
	<div class="hljs-ln-line hljs-ln-n" data-line-number="5">&nbsp;</div>
	</div>

	<div class="hljs-ln-code">
	<div class="hljs-ln-line"><code class="language-ruby hljs"><span class="hljs-meta">&gt;&gt;</span> <span class="hljs-number">2.3465</span>.round(<span class="hljs-number">3</span>)</code></div>
	</div>
	</li>
	<li>
	<div class="hljs-ln-numbers">
	<div class="hljs-ln-line hljs-ln-n" data-line-number="6">&nbsp;</div>
	</div>

	<div class="hljs-ln-code">
	<div class="hljs-ln-line"><code class="language-ruby hljs">=&gt; <span class="hljs-number">2.347</span></code></div>
	</div>
	</li>
</ol>

