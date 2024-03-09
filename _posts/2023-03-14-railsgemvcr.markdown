---
layout: post
title: "rails gem VCR"
date: "2023-03-14"
categories: 
---
<p>&nbsp;gem： <a href="https://github.com/vcr/vcr">https://github.com/vcr/vcr</a></p>

<p>&nbsp;1.安装： Gemfile 增加</p>

<pre>
<code>gem &#39;vcr&#39;</code></pre>

<pre>
<code>$ bundle install</code></pre>

<p>2.在test/helper_test.rb增加：</p>

<pre>
<code>require &#39;rubygems&#39;

require &#39;test/unit&#39;

require &#39;vcr&#39;

VCR.configure do |config|

&nbsp; config.cassette_library_dir = &quot;fixtures/vcr_cassettes&quot;

&nbsp; config.hook_into :webmock

end class VCRTest &lt; Test::Unit::TestCase

&nbsp; def test_example_dot_com

&nbsp;&nbsp;&nbsp; VCR.use_cassette(&quot;synopsis&quot;) do

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response = Net::HTTP.get_response(URI(&#39;http://www.iana.org/domains/reserved&#39;))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_match /Example domains/, response.body

&nbsp;&nbsp;&nbsp; end

&nbsp; end

end</code></pre>

<p>这会自动生成<code>fixtures/vcr_cassettes/synopsis.yml</code></p>

<p>3.使用</p>

<p>在test文件的方法中使用：</p>

<pre>
<code>
VCR.use_cassette(&quot;synopsis&quot;) do
  response = Net::HTTP.get_response(URI(&#39;http://www.iana.org/domains/reserved&#39;)) # 你的http请求，这里是使用了get，如果使用了post，但是想要修改为get，把自动生成的yml文件删除，然后进行单元测试，就会自动生成get的yml文件
  assert_match /Example domains/, response.body # 测试的内容，自行定义
end</code></pre>

<p><code>&nbsp;</code></p>

