---
layout: post
title: "rails 使用jQuery的datepicker进行时间的选择"
date: "2022-08-01"
categories: 
---
<p>https://jqueryui.com/datepicker/</p>

<p>http://siwei.me/blog/posts/js-jquery-datetimepicker</p>

<p>认领时间（起始）: &lt;%= text_field_tag :claimed_at_begin, params[:claimed_at_begin], id: &#39;begin-datepicker&#39;, placeholder: &#39;例如 20220202&#39; %&gt;</p>

<p>认领时间（截止）: &lt;%= text_field_tag :claimed_at_end, params[:claimed_at_end], id: &#39;end-datepicker&#39;, placeholder: &#39;例如 20220202&#39; %&gt;</p>

<p>&nbsp; &lt;script src=&quot;https://code.jquery.com/jquery-3.6.0.js&quot;&gt;&lt;/script&gt;<br />
&nbsp; &lt;script src=&quot;https://code.jquery.com/ui/1.13.2/jquery-ui.js&quot;&gt;&lt;/script&gt;<br />
&nbsp; &lt;link rel=&quot;stylesheet&quot; href=&quot;//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css&quot;&gt;<br />
&nbsp; &lt;script&gt;<br />
&nbsp; $( function() {<br />
&nbsp;&nbsp;&nbsp; $( &quot;#begin-datepicker&quot; ).datepicker({dateFormat: &quot;yy-mm-dd&quot;});<br />
&nbsp; } );<br />
&nbsp; $( function() {<br />
&nbsp;&nbsp;&nbsp; $( &quot;#end-datepicker&quot; ).datepicker({dateFormat: &quot;yy-mm-dd&quot;});<br />
&nbsp; } );<br />
&nbsp; &lt;/script&gt;</p>

<p><img height="233" src="/uploads/ckeditor/pictures/162/image-20220801114038-1.png" width="364" /><img height="62" src="/uploads/ckeditor/pictures/163/image-20220801114049-2.png" width="317" /></p>

