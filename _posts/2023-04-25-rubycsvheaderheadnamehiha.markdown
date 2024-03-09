---
layout: post
title: "ruby 导出CSV header 包含 head name hi ha 三个列"
date: "2023-04-25"
categories: 
---
<p>如果你想要导出 CSV 文件，其中包含头部列名为 &quot;head name&quot;、&quot;hi&quot; 和 &quot;ha&quot;，可以使用以下代码：</p>

<pre>
<code>require &#39;csv&#39;

# 创建 CSV 文件
file = CSV.generate do |csv|
  # 添加头部列名
  csv &lt;&lt; [&quot;head name&quot;, &quot;hi&quot;, &quot;ha&quot;]
  # 添加数据行
  csv &lt;&lt; [&quot;data 1&quot;, &quot;data 2&quot;, &quot;data 3&quot;]
  csv &lt;&lt; [&quot;data 4&quot;, &quot;data 5&quot;, &quot;data 6&quot;]
end

# 将生成的 CSV 文件发送给客户端下载
send_data file, filename: &quot;export.csv&quot;, type: &quot;text/csv&quot;</code></pre>

<p>你可以将以上代码放在控制器内，例如一个名为 &quot;export_controller.rb&quot; 的文件内，然后访问 &quot;/export&quot; 路径就可以下载导出的 CSV 文件了。你需要配置路由指向该控制器函数。</p>

<p>如果你需要导出 ActiveRecord 查询的结果，可以将查询结果遍历，将每行数据放入一个数组中，然后依次写入 CSV 文件即可。例如：</p>

<pre>
<code>require &#39;csv&#39;

def export
  # 获取需要导出的数据
  data = ModelName.all

  # 创建 CSV 文件
  file = CSV.generate do |csv|
    # 添加头部列名
    csv &lt;&lt; [&quot;head name&quot;, &quot;hi&quot;, &quot;ha&quot;]
    # 添加数据行
    data.each do |d|
      row = [d.column_1, d.column_2, d.column_3]
      csv &lt;&lt; row
    end
  end

  # 将生成的 CSV 文件发送给客户端下载
  send_data file, filename: &quot;export.csv&quot;, type: &quot;text/csv&quot;
end</code></pre>

<p>注意，如果查询结果较大，可能会导致内存占用过高，建议使用分页查询，写入 CSV 文件时逐页写入。</p>

