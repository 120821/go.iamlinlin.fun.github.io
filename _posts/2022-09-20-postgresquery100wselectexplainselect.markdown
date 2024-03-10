---
layout: post
title: "postgres query 100w 条数据，使用select和explain select的用时"
date: "2022-09-20"
categories: 
---
<p>select count(*) from managers;</p>
<p><img height="150" src="/uploads/ckeditor/pictures/423/image-20220920151402-9.png" width="391" /></p>
<p>select * from managers where first_name = &#39;jim&#39; or last_name=&#39;jim&#39;;</p>
<p><img height="327" src="/uploads/ckeditor/pictures/415/image-20220920145519-1.png" width="542" /></p>
<p>select * from managers where&nbsp; last_name=&#39;jim&#39;;</p>
<p><img height="403" src="/uploads/ckeditor/pictures/416/image-20220920145621-2.png" width="537" /></p>
<p>select * from managers where&nbsp; first_name=&#39;jim&#39;;</p>
<p><img height="403" src="/uploads/ckeditor/pictures/417/image-20220920145657-3.png" width="537" /></p>
<p>select * from managers where last_name = &#39;PHRZO&#39;;</p>
<p><img height="297" src="/uploads/ckeditor/pictures/418/image-20220920145847-4.png" width="511" /></p>
<p>explain select * from managers where last_name = &#39;PHRZO&#39;;</p>
<p><img height="297" src="/uploads/ckeditor/pictures/419/image-20220920145919-5.png" width="511" /></p>
<p>select * from managers where last_name like &#39;%HRZO%&#39;;</p>
<p><img height="297" src="/uploads/ckeditor/pictures/422/image-20220920150756-8.png" width="511" /></p>
<p>&nbsp;</p>
