---
layout: post
title: "jquery ui datepicker 中文"
date: "2023-08-28"
categories: 
---
<p>引入jquery ui的cdn:</p>

<pre>
<code>&nbsp;&nbsp;&nbsp;&nbsp; &lt;script src=&quot;https://code.jquery.com/jquery-3.6.0.js&quot;&gt;&lt;/script&gt;

&nbsp;&nbsp;&nbsp;&nbsp; &lt;script src=&quot;https://code.jquery.com/ui/1.13.2/jquery-ui.js&quot;&gt;&lt;/script&gt;

&nbsp;&nbsp;&nbsp; &lt;link rel=&quot;stylesheet&quot; href=&quot;https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/themes/base/jquery-ui.min.css&quot; integrity=&quot;sha512-ELV+xyi8IhEApPS/pSj66+Jiw+sOT1Mqkzlh8ExXihe4zfqbWkxPRi8wptXIO9g73FSlhmquFlUOuMSoXz5IRw==&quot; crossorigin=&quot;anonymous&quot; referrerpolicy=&quot;no-referrer&quot; /&gt;</code></pre>

<p>然后在layout页面增加：</p>

<pre>
<code>&lt;script&gt;

&nbsp;&nbsp; $( function() {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $( &quot;#datepicker&quot; ).datepicker({

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dateFormat: &quot;yy-mm-dd&quot;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dayNamesMin: [&nbsp; &quot;日&quot;, &quot;一&quot;, &quot;二&quot;, &quot;三&quot;, &quot;四&quot;, &quot;五&quot;, &quot;六&quot; ],

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; monthNames: [&quot;一月&quot;, &quot;二月&quot;, &quot;三月&quot;, &quot;四月&quot;, &quot;五月&quot;, &quot;六月&quot;, &quot;七月&quot;, &quot;八月&quot;, &quot;九月&quot;, &quot;十月&quot;, &quot;十一月&quot;, &quot;十二月&quot; ]

&nbsp;&nbsp;&nbsp;&nbsp; });

&nbsp;&nbsp; } );

&nbsp;&lt;/script&gt;</code></pre>

<p>在对应的视图页面就可以使用：</p>

<pre>
<code>&nbsp;&lt;%= text_field_tag :start_at_day, params[:start_at_day], id: &#39;datepicker&#39;, placeholder: &#39;开始日期时间&#39;, class: &#39;select_date&#39;, style: &#39;margin-top: 20px; margin-right: 20px;&#39; %&gt;</code></pre>

