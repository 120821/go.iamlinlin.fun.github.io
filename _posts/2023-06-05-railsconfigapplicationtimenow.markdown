---
layout: post
title: "rails ,不修改config/application显示time.now为北京时间"
date: "2023-06-05"
categories: 
---
<div class="md md_doc_content" id="code_1685970381388_3">
<p>要将 <code>Time.now</code> 转换为北京时间，需要先将其转换为东八区时间。可以使用 <code>ActiveSupport::TimeZone</code> 类来完成此操作。以下是具体操作步骤：</p>

<ol>
	<li>在 <code>config/application.rb</code> 中设置默认时区为北京时间：</li>
</ol>

<pre>
<code>config.time_zone = &#39;Beijing&#39;</code></pre>

<ol start="2">
	<li>在控制器中使用 <code>in_time_zone</code> 方法将当前时间转换为北京时间，并格式化为字符串：</li>
</ol>

<pre>
<code>@time = Time.now.in_time_zone.strftime(&quot;%H:%M:%S&quot;)</code></pre>

<p>这样就可以将当前时间转换为北京时间，并以指定格式显示出来。</p>

<p>解释：</p>

<p>要显示北京时间，可以使用<code>ActiveSupport</code>库中的<code>TimeWithZone</code>和<code>in_time_zone</code>方法来实现。首先需要将当前时间转化为北京时区，然后再格式化为字符串，示例如下：</p>

<pre>
<code>require &#39;active_support/time&#39;

beijing_time = Time.now.in_time_zone(&#39;Beijing&#39;)
formatted_time = beijing_time.strftime(&#39;%H:%M:%S&#39;)

puts formatted_time # 输出格式化后的北京时间</code></pre>

<p>在上面的代码中，我们先使用<code>require &#39;active_support/time&#39;</code>导入<code>ActiveSupport</code>库，然后使用<code>in_time_zone</code>方法将当前时间转化为北京时区的时间。<code>in_time_zone</code>方法需要传入一个时区名，这里我们使用字符串<code>&#39;Beijing&#39;</code>来表示北京时区。转化后的时间将自动考虑到北京的夏令时、冬令时等因素。</p>

<p>最后，我们使用<code>strftime</code>方法将北京时间格式化为字符串，格式为<code>&#39;%H:%M:%S&#39;</code>表示小时、分钟和秒数。将格式化后的时间输出，即可得到北京时间的字符串表示。</p>
</div>

