---
layout: post
title: "rails join的使用"
date: "2023-06-14"
categories: 
---
<div id="rtf13441">
<div>
<p>假设我们的数据库中有两个表：<code>enterprises</code>和<code>daily_statistics</code>，其中<code>enterprises</code>表中存储了所有企业的信息，包括企业名称和企业分类，<code>daily_statistics</code>表记录了所有企业的物资日统计数据，包括企业ID、日期和统计数据。</p>

<p>我们需要在物资日统计列表页面，根据重点商超的企业名称查询所有的物资日统计表数据。以下是一个可能的实现方式：</p>

<ol>
	<li>首先，在路由文件中定义物资日统计列表的路由：</li>
</ol>

<pre>
<code># config/routes.rb
get &#39;daily_statistics&#39;, to: &#39;daily_statistics#index&#39;</code></pre>

<ol start="2">
	<li>在控制器中实现<code>index</code>方法，查询符合条件的物资日统计数据：</li>
</ol>

<pre>
<code># app/controllers/daily_statistics_controller.rb
class DailyStatisticsController &lt; ApplicationController
  def index
    if params[:enterprise_name]
      # 如果参数中有企业名称，按照名称筛选
      @daily_statistics = DailyStatistic.joins(:enterprise)
                                         .where(&#39;enterprises.enterprise_type = ? and enterprises.name = ?&#39;, &#39;重点商超&#39;, params[:enterprise_name])
      # 这里假设重点商超企业分类的名称为&ldquo;重点商超&rdquo;，使用joins方法连接两个表，使用where方法过滤查询条件
      # 如果使用了scope，可以将上面的查询语句封装在scope中
    else
      # 如果没有参数，查询所有物资日统计数据
      @daily_statistics = DailyStatistic.all
    end
  end
end</code></pre>

<ol start="3">
	<li>在视图页面中，展示物资日统计数据的列表和查询表单：</li>
</ol>

<pre>
<code># app/views/daily_statistics/index.html.erb
&lt;%= form_tag daily_statistics_path, method: :get do %&gt;
  &lt;%= text_field_tag :enterprise_name, params[:enterprise_name], placeholder: &#39;企业名称&#39; %&gt;
  &lt;%= submit_tag &#39;查询&#39; %&gt;
&lt;% end %&gt;

&lt;table&gt;
  &lt;thead&gt;
    &lt;tr&gt;
      &lt;th&gt;企业名称&lt;/th&gt;
      &lt;th&gt;日期&lt;/th&gt;
      &lt;th&gt;统计数据&lt;/th&gt;
    &lt;/tr&gt;
  &lt;/thead&gt;
  &lt;tbody&gt;
    &lt;% @daily_statistics.each do |statistic| %&gt;
      &lt;tr&gt;
        &lt;td&gt;&lt;%= statistic.enterprise.name %&gt;&lt;/td&gt;
        &lt;td&gt;&lt;%= statistic.date %&gt;&lt;/td&gt;
        &lt;td&gt;&lt;%= statistic.data %&gt;&lt;/td&gt;
      &lt;/tr&gt;
    &lt;% end %&gt;
  &lt;/tbody&gt;
&lt;/table&gt;</code></pre>

<p>在上面的代码中，我们使用form_tag方法生成一个查询表单，使用text_field_tag方法生成一个文本输入框，用于输入企业名称。在表格中展示查询结果，使用<code>statistic.enterprise.name</code>取出每条记录对应的企业名称。</p>
</div>
</div>

<div style="background-image:url(&quot;https://noss.douguguo.com/static/pc/copy.png&quot;); background-position:0% 0%; background-repeat:no-repeat; background-size:100% 100%">&nbsp;</div>

