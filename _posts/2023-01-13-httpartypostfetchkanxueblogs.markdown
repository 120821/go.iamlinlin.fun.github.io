---
layout: post
title: "httparty post fetch kanxue blogs"
date: "2023-01-13"
categories: 
---
<p>官网：<a href="https://www.kanxue.com/">https://www.kanxue.com/</a></p>

<p>使用post httparty</p>

<pre>
<code>cat scripts/get_blogs_from_kanxue_use_httparty.rb

ENV[&#39;RAILS_ENV&#39;] = ARGV.first || ENV[&#39;RAILS_ENV&#39;] || &#39;development&#39;

require File.expand_path(File.dirname(__FILE__) + &quot;/../config/environment&quot;)

require &#39;rails&#39;

require &#39;json&#39;

require &#39;rubygems&#39;

require &#39;httparty&#39;

require &#39;nokogiri&#39;

Rails.logger = Logger.new(&quot;log/update_kanxue_blogs_using_httparty.log&quot;)

i = 19

loop do

&nbsp; url = &quot;https://www.kanxue.com/homepost-morearticle.htm&quot;

&nbsp; query = {

&nbsp;&nbsp;&nbsp; &quot;page&quot; =&gt; &quot;#{i}&quot;,

&nbsp;&nbsp;&nbsp; &quot;pagesize&quot; =&gt; &quot;10&quot;

&nbsp; }

&nbsp; headers = {

&nbsp;&nbsp;&nbsp; &quot;Host&quot;&nbsp; =&gt; &quot;www.kanxue.com&quot;,

&nbsp;&nbsp;&nbsp; &quot;User-Agent&quot; =&gt; &quot;Mozilla/5.0 (X11; Linux x86_64; rb:108.0) Gecko/20100101 Firefox/108.0&quot;,

&nbsp;&nbsp;&nbsp; &quot;Accept&quot; =&gt; &quot;text/plain, */*; q=0.01&quot;,

&nbsp;&nbsp;&nbsp; &quot;Accept-Language&quot; =&gt; &quot;zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2&quot;,

&nbsp;&nbsp;&nbsp; &quot;Accept-Encoding&quot; =&gt; &quot;gzip, deflate, br&quot;,

&nbsp;&nbsp;&nbsp; &quot;Referer&quot; =&gt; &quot;https://www.kanxue.com/&quot;,

&nbsp;&nbsp;&nbsp; &quot;Content-Type&quot; =&gt; &quot;application/x-www-form-urlencoded; charset=UTF-8&quot;,

&nbsp;&nbsp;&nbsp; &quot;X-Requested-With&quot; =&gt; &quot;XMLHttpRequest&quot;,

&nbsp;&nbsp;&nbsp; &quot;Content-Length&quot; =&gt; &quot;18&quot;,

&nbsp;&nbsp;&nbsp; &quot;Origin&quot; =&gt; &quot;https://www.kanxue.com&quot;,

&nbsp;&nbsp;&nbsp; &quot;Connection&quot; =&gt; &quot;keep-alive&quot;,

&nbsp;&nbsp;&nbsp; &quot;Cookie&quot; =&gt; &quot;__jsluid_s=61f26b9d4fbbe7b03612225e7a61b899; Hm_lvt_820e73ad7ccba42be0e5b528c537e327=1666926727,1667283362; __jsluid_h=dfdce607d78e6fd261a8a092f8d3eb39; tree_expandedNodes=%2C1001600%2C1001671%2C1000000%2C1000001%2C1000002%2C1001202%2C1000713%2C1001372%2C1001373%2C1000003%2C1000965%2C1001189%2C1000966%2C1000972%2C1001522%2C; PHPSESSID=278ff8bf0af353e637c64377aad1716c&quot;,

&nbsp;&nbsp;&nbsp; &quot;Sec-Fetch-Dest&quot; =&gt; &quot;empty&quot;,

&nbsp;&nbsp;&nbsp; &quot;Sec-Fetch-Mode&quot; =&gt; &quot;cors&quot;,

&nbsp;&nbsp;&nbsp; &quot;Sec-Fetch-Site&quot; =&gt; &quot;same-origin&quot;,

&nbsp;&nbsp;&nbsp; &quot;DNT&quot;: &quot;1&quot;

&nbsp; }

&nbsp; Rails.logger.info &quot;==== step 1 httparty post, query: #{query}, url: #{url}&quot;

&nbsp; response = HTTParty.post(

&nbsp;&nbsp;&nbsp; &quot;#{url}&quot;,

&nbsp;&nbsp;&nbsp; :query =&gt; query,

&nbsp;&nbsp;&nbsp; :headers =&gt; headers

&nbsp; )

&nbsp; result = JSON.parse(response)

&nbsp; Rails.logger.info &quot;=== step 2 after post, result: #{result} response.code, #{response.code} ===response.headers is #{response.headers} query: #{query}&quot;</code></pre>

<p>&nbsp;</p>

<p>&nbsp; blogs = result[&#39;message&#39;][&#39;list&#39;]<br />
&nbsp; blog_local = &#39;&#39;<br />
&nbsp; if blogs.present?<br />
&nbsp;&nbsp;&nbsp; blogs.each do |blog|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rails.logger.info &quot;=== step 3 before if blog_url #{blog[&#39;source_url&#39;].inspect}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if blog[&#39;source_url&#39;].present?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rails.logger.info &quot;==== step 3.1 in present blog_url: #{blog[&#39;source_url&#39;]} title: #{blog[&#39;subject&#39;]} created_at: #{blog[&#39;create_date_fmt&#39;]}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blog_local = Blog.where(&#39;blog_url = ? and source_website = ?&#39;, blog[&#39;source_url&#39;], &#39;kanxue&#39;).first<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if blog_local.blank?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blog_local = Blog.create blog_url: blog[&#39;source_url&#39;], title: blog[&#39;subject&#39;], created_at: blog[&#39;create_date_fmt&#39;], author: blog[&#39;userinfo&#39;][&#39;username&#39;], image_url: &quot;https://www.kanxue.com/#{blog[&#39;pic_fmt&#39;]}&quot;, brief: blog[&#39;brief&#39;], views: blog[&#39;views&#39;].to_i, source_website: &#39;kanxue&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep 10<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blog_url = &quot;https://zhuanlan.kanxue.com/article-#{blog[&#39;articleid&#39;]}.htm&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rails.logger.info &quot;==== step 3.2 in else blog_url: #{blog_url} title: #{blog[&#39;subject&#39;]} created_at: #{blog[&#39;create_date_fmt&#39;]}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blog_local = Blog.where(&#39;blog_url = ? and source_website = ?&#39;, blog_url, &#39;kanxue&#39;).first<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if blog_local.blank?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blog_local = Blog.create blog_url: blog_url, title: blog[&#39;subject&#39;], created_at: blog[&#39;create_date_fmt&#39;], author: blog[&#39;userinfo&#39;][&#39;username&#39;], image_url: &quot;https://www.kanxue.com/#{blog[&#39;pic_fmt&#39;]}&quot;, brief: blog[&#39;brief&#39;], views: blog[&#39;views&#39;].to_i, source_website: &#39;kanxue&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep 10<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; category_names = blog[&#39;tags&#39;].split(&#39;,&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if category_names.present?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; category_names.each do |category_name|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; category_local = Category.where(&#39;name = ? and blog_id = ?&#39;, category_name, blog_local.id).first<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rails.logger.info &quot;==== step 4 in create category, category_local is #{category_local.inspect} category_name: #{category_name} blog_local.id #{blog_local.id}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category.create name: category_name, blog_id: blog_local.id if category_local.blank?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
&nbsp; sleep 50<br />
&nbsp; i = i + 1<br />
&nbsp; if i &gt; 1650<br />
&nbsp;&nbsp;&nbsp; break<br />
&nbsp; end end</p>

<p>&nbsp;</p>

