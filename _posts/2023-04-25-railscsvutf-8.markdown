---
layout: post
title: "rails  CSV utf-8"
date: "2023-04-25"
categories: 
---
<p>根据需要将数据编码为UTF-8格式并将其发送到用户进行下载。代码如下：</p>

<pre>
<code>require &#39;csv&#39;

data = [[&#39;ID&#39;, &#39;Name&#39;], [&#39;1&#39;, &#39;John&#39;], [&#39;2&#39;, &#39;Sarah&#39;]]

# 将数据编码为UTF-8格式
utf8_data = CSV.generate(encoding: &#39;UTF-8&#39;) do |csv|
  data.each do |row|
    csv &lt;&lt; row
  end
end

# 发送数据进行下载
send_data utf8_data, type: &#39;text/csv; charset=utf-8; header=present&#39;, filename: &#39;data.csv&#39;</code></pre>

<p>这段代码将生成名为data.csv的CSV文件，包含表格数据，并将其发送给用户进行下载。注意，如果数据中包含特殊字符（如非ASCII字符），则必须使用适当的编码格式，以确保数据正确解析。</p>

