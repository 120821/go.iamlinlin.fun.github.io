---
layout: post
title: "ckb  test vcr 的使用"
date: "2023-03-14"
categories: 
---
<p>1.在Gemfile增加VCR gem</p>

<p>git diff Gemfile</p>

<p>得到结果：</p>

<p>+gem &quot;vcr&quot;</p>

<p>2.在单元测试使用VCR进行发送http请求</p>

<p>（1）在test/test_helper.rb增加：</p>

<pre>
<code>VCR.configure do |config|

&nbsp; config.cassette_library_dir = &quot;vcr_fixtures/vcr_cassettes&quot;

&nbsp; config.hook_into :webmock

&nbsp; config.default_cassette_options[:match_requests_on] = [:method, :path, :body]

end{% endhighlight %}

<p>（2）在单元测试增加：</p>

<pre>
<code>&nbsp;test &quot;should get transaction_fees, for pending tx&quot; do

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get transaction_fees_api_v2_statistics_url

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data = JSON.parse(response.body)

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_equal 2, data[&#39;pending_transaction_fee_rates&#39;].size

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert data[&#39;pending_transaction_fee_rates&#39;].first[&#39;fee_rate&#39;] &gt; 0

-

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_response :success

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VCR.use_cassette(&quot;get transaction_fees, for pending tx&quot;) do

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get transaction_fees_api_v2_statistics_url, headers: { &quot;Content-Type&quot;: &quot;application/vnd.api+json&quot;, &quot;Accept&quot;: &quot;application/json&quot; }

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data = JSON.parse(response.body)

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_equal PoolTransactionEntry.all.size, data[&#39;transaction_fee_rates&#39;].size

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert data[&#39;pending_transaction_fee_rates&#39;].first[&#39;fee_rate&#39;] &gt; 0

+

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_response :success

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end{% endhighlight %}

<p>（3）单元测试的方法会生成这样的yml文件：</p>

<pre>
<code>&nbsp;&nbsp;&nbsp; vcr_fixtures/vcr_cassettes/get_post.yml

&nbsp;&nbsp; &nbsp;vcr_fixtures/vcr_cassettes/get_transaction_fees.yml

&nbsp;&nbsp; &nbsp;vcr_fixtures/vcr_cassettes/get_transaction_fees_for_committed_tx.yml

&nbsp;&nbsp; &nbsp;vcr_fixtures/vcr_cassettes/get_transaction_fees_for_last_n_days_transaction_fee_rates.yml

&nbsp;&nbsp; &nbsp;vcr_fixtures/vcr_cassettes/get_transaction_fees_for_pending_tx.yml{% endhighlight %}

<p>查看第一个文件：</p>

<pre>
<code>---

http_interactions:

- request:

&nbsp;&nbsp;&nbsp; method: get #使用了get请求

&nbsp;&nbsp;&nbsp; uri: http://www.example.com/api/v2/statistics/transaction_fees

&nbsp;&nbsp;&nbsp; body:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoding: US-ASCII

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string: &#39;&#39;

&nbsp;&nbsp;&nbsp; headers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accept-Encoding:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - gzip;q=1.0,deflate;q=0.6,identity;q=0.3

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accept:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &quot;*/*&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User-Agent:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Ruby

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - www.example.com

&nbsp; response:

&nbsp;&nbsp;&nbsp; status:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: 404

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message: Not Found

&nbsp;&nbsp;&nbsp; headers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cache-Control:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - max-age=604800

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Content-Type:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - text/html; charset=UTF-8

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Mon, 13 Mar 2023 12:39:52 GMT

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expires:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Mon, 20 Mar 2023 12:39:52 GMT

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Server:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - EOS (vny/0453)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vary:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Accept-Encoding

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Content-Length:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &#39;648&#39;{% endhighlight %}

<p>查看最后一个pending的文件：</p>

<pre>
<code>---

http_interactions:

- request:

&nbsp;&nbsp;&nbsp; method: post #使用了post请求

&nbsp;&nbsp;&nbsp; uri: http://localhost:8114/

&nbsp;&nbsp;&nbsp; body:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoding: UTF-8

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string: &#39;{&quot;id&quot;:1,&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;method&quot;:&quot;get_transaction&quot;,&quot;params&quot;:[&quot;0xe9772bae467924e0feee85e9b7087993d38713bd8c19c954c4b68da69b4f4644&quot;]}&#39;

&nbsp;&nbsp;&nbsp; headers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accept-Encoding:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - gzip;q=1.0,deflate;q=0.6,identity;q=0.3

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accept:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &quot;*/*&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User-Agent:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Ruby

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Content-Type:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - application/json

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connection:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - keep-alive

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Keep-Alive:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &#39;30&#39;

&nbsp; response:

&nbsp;&nbsp;&nbsp; status:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: 200

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message: OK

&nbsp;&nbsp;&nbsp; headers:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Content-Type:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - application/json; charset=utf-8

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Content-Length:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &#39;1341&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Tue, 14 Mar 2023 01:14:00 GMT

&nbsp;&nbsp;&nbsp; body:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoding: UTF-8

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string: &#39;{&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;result&quot;:{&quot;transaction&quot;:{&quot;cell_deps&quot;:[{&quot;dep_type&quot;:&quot;dep_group&quot;,&quot;out_point&quot;:{&quot;index&quot;:&quot;0x0&quot;,&quot;tx_hash&quot;:&quot;0x71a7ba8fc96349fea0ed3a5c47992e3b{% endhighlight %}

<p>&nbsp;</p>

<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;<br />
&nbsp; recorded_at: Tue, 14 Mar 2023 01:14:00 GMT<br />
- request:</code></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

