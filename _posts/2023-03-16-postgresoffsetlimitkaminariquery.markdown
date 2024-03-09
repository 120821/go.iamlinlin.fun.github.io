---
layout: post
title: "postgres offset limit kaminari query "
date: "2023-03-16"
categories: 
---
<p><a href="https://www.postgresql.org/message-id/007801c66547%2435e26270%248300a8c0%40tridecap.com">https://www.postgresql.org/message-id/007801c66547%2435e26270%248300a8c0%40tridecap.com</a></p>

<p><a href="https://www.cybertec-postgresql.com/en/pagination-problem-total-result-count/">https://www.cybertec-postgresql.com/en/pagination-problem-total-result-count/</a></p>

<p><a href="https://stackoverflow.com/questions/26625614/select-query-with-offset-limit-is-too-much-slow">https://stackoverflow.com/questions/26625614/select-query-with-offset-limit-is-too-much-slow</a></p>

<p><a href="https://stackoverflow.com/questions/34110504/optimize-query-with-offset-on-large-table">https://stackoverflow.com/questions/34110504/optimize-query-with-offset-on-large-table</a></p>

<div class="post-layout--right postcell">
<div class="js-post-body s-prose">
<p>I created 10 million pieces of data in the nfts table of the local postgres database, paged the data, inverted the data according to the id, 10 pieces of data per page, and queried the first ten pages and the last ten pages of data. Each page was queried ten times. Here is the average time required.</p>

<p>The following is the time required for data query of the first ten pages, in milliseconds</p>

<pre>
<code>20.5
12.9
15.6
13.6
13.9
12.9
12.5
13.1
12.2
13.7
{% endhighlight %}

<p>The following is the time required for data query on the last ten pages, in seconds</p>

<pre>
<code>2.377
2.385
2.389
2.399
2.388
2.385
2.394
2.374
2.399
2.377
{% endhighlight %}

<p>My paging uses gem &quot;kaminari&quot;.The usage is as follows<code>NFT.order(:id).page(params[:page]).per(10)</code> To display the index page. I added index to id. The query statement on the back end is:</p>

<pre>
<code>Started GET &quot;/nfts?page=999992&quot; for ::1 at 2023-03-16 09:10:03 +0800
  ActiveRecord::SchemaMigration Pluck (1.1ms)  SELECT &quot;schema_migrations&quot;.&quot;version&quot; FROM &quot;schema_migrations&quot; ORDER BY &quot;schema_migrations&quot;.&quot;version&quot; ASC
Processing by NftsController#index as JSON
  Parameters: {&quot;page&quot;=&gt;&quot;999992&quot;, &quot;nft&quot;=&gt;{}}
  NFT Count (785.6ms)  SELECT COUNT(*) FROM (SELECT 1 AS one FROM &quot;nfts&quot; ORDER BY id desc LIMIT $1 OFFSET $2) subquery_for_count  [[&quot;LIMIT&quot;, 10], [&quot;OFFSET&quot;, 9999910]]
  ↳ app/controllers/nfts_controller.rb:10:in `index&#39;
  NFT Load (1670.2ms)  SELECT &quot;nfts&quot;.* FROM &quot;nfts&quot; ORDER BY id desc LIMIT $1 OFFSET $2  [[&quot;LIMIT&quot;, 10], [&quot;OFFSET&quot;, 9999910]]
  ↳ app/controllers/nfts_controller.rb:12:in `index&#39;
Completed 200 OK in 2480ms (Views: 9.2ms | ActiveRecord: 2466.1ms | Allocations: 14400)

{% endhighlight %}

<p>How can I solve the problem of slow query on the last ten pages.</p>

<p>Attach the time required for each page of the first ten pages and the last ten pages The following is the time required for data query on each page of the first ten pages, in milliseconds</p>

<pre>
<code>1:[77ms, 13ms, 10ms, 11ms, 17ms, 11ms, 17ms, 16ms, 12ms, 21ms]
2.[16ms, 11ms, 12ms, 10ms, 11ms, 11ms, 10ms, 18ms, 11ms, 19ms]
3.[23ms, 14ms, 16ms, 13ms, 23ms, 18ms, 12ms, 15ms, 12ms, 10ms]
4.[15ms, 16ms, 16ms, 11ms, 11ms, 12ms, 10ms, 10ms, 15ms, 20ms]
5.[22ms, 11ms, 11ms, 11ms, 12ms, 17ms, 12ms, 17ms, 16ms, 10ms]OFFSET</code>和 <code>LIMIT
6.[13ms, 19ms, 19ms, 10ms, 16ms, 11ms, 10ms, 10ms, 10ms, 11ms]
7.[11ms, 11ms, 20ms, 10ms, 16ms, 12ms, 9ms, 14ms, 11ms, 11ms]
8.[11ms, 16ms, 16ms, 11ms, 11ms, 9ms, 12ms, 12ms, 22ms, 11ms]
9.[12ms, 10ms, 15ms, 9ms, 14ms ,10ms, 12ms, 15ms, 11ms, 14ms]
10.[10ms, 23ms, 10ms, 11ms, 17ms, 11ms, 15ms, 10ms, 21ms, 9ms]
{% endhighlight %}

<p>The following is the time required for data query on each page of the last ten pages, in seconds</p>

<pre>
<code>-1.[2.37s, 2.42s, 2.41s, 2.39s, 2.35s, 2.37s, 2.31s, 2.34s, 2.37s, 2.44s]
-2.[2.36s, 2.40s, 2.43s, 2.39s, 2.40s, 2.47s, 2.36s, 2.36s, 2.33s, 2.35s]
-3.[2.34s, 2.37s, 2.40s, 2.41s, 2.41s, 2.37s, 2.52s, 2.37s, 2.35s, 2.35s]
-4.[2.35s, 2.38s, 2.43s, 2.42s, 2.38s, 2.38s, 2.46s, 2.38s, 2.39s, 2.42s]
-5.[2.37s, 2.37s, 2.37s, 2.46s, 2.38s, 2.40s, 2.35s, 2.40s, 2.40s, 2.38s]
-6.[2.43s, 2.35s, 2.40s, 2.41s, 2.36s, 2.38s, 2.39s, 2.33s, 2.41s, 2.39s]
-7.[2.38s, 2.36s, 2.39s, 2.37s, 2.42s, 2.40s, 2.50s, 2.37s, 2.37s, 2.38s]
-8.[2.39s, 2.38s, 2.37s, 2.39s, 2.34s, 2.37s, 2.37s, 2.35s, 2.40s, 2.38s]
-9.[2.38s, 2.41s, 2.38s, 2.38s, 2.38s, 2.39s, 2.43s, 2.41s, 2.41s, 2.42s]
-10.[2.37s, 2.40s, 2.33s, 2.37s, 2.38s, 2.37s, 2.40s, 2.38s, 2.39s, 2.38s]
{% endhighlight %}

<p>可以看到默认使用的是limit offset进行数据的查询，这样虽然可以查询到所有的数据，但是有一个很大的弊端： 获取后面的页面时，性能会变得更差。</p>

<p>解决方法：</p>

<pre>
<code>select * from foo where ID &gt; [huge] order by ID limit 100{% endhighlight %}
</div>
</div>

