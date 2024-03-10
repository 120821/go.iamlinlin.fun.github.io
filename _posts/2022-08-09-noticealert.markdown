---
layout: post
title: "发送验证码 禁止重复绑定 后端不传notice 前端alert"
date: "2022-08-09"
categories: 
---
<p>&lt;script&gt;<br />
&nbsp; var count=60,timer=null;<br />
&nbsp; jQuery(&quot;#send_validation_code&quot;).click(function() {<br />
&nbsp;&nbsp;&nbsp; let email = jQuery(&#39;#email&#39;).val();<br />
&nbsp;&nbsp;&nbsp; if(email==&#39;&#39;){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;邮箱不能为空&#39;)<br />
&nbsp;&nbsp;&nbsp; }else{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let url =&nbsp; &#39;/front_ends/send_validation_code?type=email&amp;to=&#39; + email +&#39;&amp;account_id=&lt;%= current_account.id %&gt;&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jQuery.get(url , function(data){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(data)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data.result == &#39;ok&#39;){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(timer==null){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timer=setInterval(function(){count--;$(&quot;#send_validation_code&quot;).text(count+&quot;s&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(count&lt;=0){clearInterval(timer);$(&quot;#send_validation_code&quot;).text(&quot;获取验证码&quot;);timer=null;}},1000);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }else{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;该邮箱已经存在,无法被绑定，请确认邮箱是否正确&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; });</p>
<p>&nbsp; def send_validation_code<br />
&nbsp;&nbsp;&nbsp; type = params[:type]<br />
&nbsp;&nbsp;&nbsp; to = params[:to]<br />
&nbsp;&nbsp;&nbsp; code = ((0..9).to_a + (0..9).to_a).shuffle[0,4].join<br />
&nbsp;&nbsp;&nbsp; subject = &quot;您的验证码是#{code}&quot;<br />
&nbsp;&nbsp;&nbsp; if Account.where(&#39;email = ? or mobile = ?&#39;, to, to).blank?</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if type == &#39;mobile&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; YunPianJob.perform_now to, code<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserMailer.send_validation_email(to, code, subject).deliver_now<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if current_account.present?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ValidationCode.create code_type: type, code: code, valid_through: (Time.now + 15 * 60), account_id: current_account.id, receive: to, is_used: false<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ValidationCode.create code_type: type, code: code, valid_through: (Time.now + 15 * 60), receive: to, is_used: false<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render json: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: &#39;ok&#39;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to: to,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: code<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render json: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: &#39;error&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>
<p><img height="124" src="/uploads/ckeditor/pictures/173/image-20220809162847-1.png" width="520" /></p>
<p>&nbsp;</p>
