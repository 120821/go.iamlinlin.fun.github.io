---
layout: post
title: "input + button input框中内嵌button按钮"
date: "2022-07-22"
categories: 
---
<p>input和button添加display: inline-block属性, 同时用一个div包裹, div设置border, input的border和outline都去掉, 这时即可实现</p>

<p>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div class=&quot;sign_up_send_validation_code&quot;&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;p&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 电话: &lt;%= f.text_field :mobile, autofocus: true, placeholder: &#39;请输入手机号码&#39;, style: &#39;width: 80%;&#39; %&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= link_to &#39;获取验证码&#39;, &#39;javascript:void(0)&#39;, id:&#39;send_validation_code&#39;, class: &quot;app-btn primary&quot;, style: &quot;margin-left: -92px; position: absolute;display: inline-block; text-align: center; width: 120px; height: 55px; border-radius: 12px; padding: 15px 16px; box-sizing: border-box; font-size: 14px; outline: none; display: inline-block; &quot; %&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/p&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;</p>

<p>增加css到对应的文件</p>

<p>+.sign_up_send_validation_code {^M<br />
+&nbsp; height: 55px;^M<br />
+&nbsp; background: #fff;^M<br />
+&nbsp; /*! border: 1px solid rgba(195, 195, 208, 1); */^M<br />
+&nbsp; border-radius: 12px;^M<br />
+&nbsp; /*! padding: 15px 16px; */^M<br />
+&nbsp; box-sizing: border-box;^M<br />
+&nbsp; color:var(--text-color-main);^M<br />
+&nbsp; outline: none;^M<br />
+&nbsp; width: 100%;^M</p>

<p><img height="82" src="/uploads/ckeditor/pictures/124/image-20220722172703-1.png" width="601" /></p>

