---
layout: post
title: "rails text_area_tag  form.text_area ：rows的使用"
date: "2023-03-02"
categories: 
---
<p><a href="https://apidock.com/rails/ActionView/Helpers/FormTagHelper/text_area_tag">https://apidock.com/rails/ActionView/Helpers/FormTagHelper/text_area_tag</a></p>

<p>text_area_tag 的使用：</p>

<pre>
<code>text_area_tag &#39;body&#39;, nil, rows: 10, cols: 25 </code></pre>

<pre>
<code># =&gt; &lt;textarea cols=&quot;25&quot; id=&quot;body&quot; name=&quot;body&quot; rows=&quot;10&quot;&gt;&lt;/textarea&gt;&nbsp; </code></pre>

<p><code>form.text_area的使用</code></p>

<p><a href="https://stackoverflow.com/questions/4223931/rails-text-area-size">https://stackoverflow.com/questions/4223931/rails-text-area-size</a></p>

<pre>
<code>&lt;%= day_form.text_area :hatch, cols: 30, rows: 10 %&gt; </code></pre>

