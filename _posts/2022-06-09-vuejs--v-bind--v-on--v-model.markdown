---
layout: post
title: "vuejs--v-bind--v-on--v-model"
date: "2022-06-09"
categories: 
---
<blockquote> 
<p>v-bind页面和浏览页面，在console中输入：app.$data.my_color = "red"，就可以看到对应的文字颜色变成了红色，点击变颜色也会发生颜色变化<img alt="" src="https://img-blog.csdnimg.cn/3acfc2b87fb04735a385abe1b058524c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"><img alt="" src="https://img-blog.csdnimg.cn/7894f3c541464012a304bc781e1d5cdf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p><strong>v-on用于触发事件  </strong><img alt="" src="https://img-blog.csdnimg.cn/8c65f183e8204fbfb6f373cc8c6c1437.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/b438e53b956243f59d833f2a31b27464.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p><span style="color:#000000;">v-on后面可以接HTML的标准事件</span><span style="color:#000000;">。</span><span style="color:#000000;">例如：</span></p> 
<ol>
<li>
<span style="color:#000000;">click（单击鼠标左键</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">dblclick</span><span style="color:#000000;">（</span><span style="color:#000000;">双击鼠标左键</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">contextmenu</span><span style="color:#000000;">（</span><span style="color:#000000;">单</span><span style="color:#000000;">击</span><span style="color:#000000;">鼠标右键</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">mouseover</span><span style="color:#000000;">（</span><span style="color:#000000;">指针移到有事件监听的元素或</span><span style="color:#000000;">其</span><span style="color:#000000;">子元素内</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">mouseout</span><span style="color:#000000;">（</span><span style="color:#000000;">指针移出元素，或者移到</span><span style="color:#000000;">其</span><span style="color:#000000;">子元素上</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">keydown</span><span style="color:#000000;">（</span><span style="color:#000000;">键盘动作：按下任意键</span><span style="color:#000000;">）</span>
</li>
<li>
<span style="color:#000000;">keyup</span><span style="color:#000000;">（</span><span style="color:#000000;">键盘动作：释放任意键</span><span style="color:#000000;">）</span>
</li>
</ol>
<p style="margin-left:.0001pt;text-align:justify;">注意：v-on可以简写，v-on:click 往往会写成@click，v-on:dblclick，也会写成@dblclick，读者看代码的时候要注意。</p> 
</blockquote> 
<blockquote> 
<p><span style="color:#000000;">model往往用来做</span><span style="color:#000000;">“</span><span style="color:#000000;">双向绑定</span><span style="color:#000000;">”（</span><span style="color:#000000;">two way binding</span><span style="color:#000000;">）。</span><span style="color:#000000;">双向绑定的含义</span><span style="color:#000000;">如下</span><span style="color:#000000;">：</span></p> 
<p style="margin-left:.0001pt;text-align:justify;">（1）可以通过表单（用户手动输入的值）来修改某个变量的值。</p> 
<p style="margin-left:.0001pt;">（2）可以通过程序的运算来修改某个变量的值，并且影响页面的展示。<img alt="" src="https://img-blog.csdnimg.cn/5ba43a0a1dd745318437fa2a36794f70.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/743ec24e570f4ea1b16f8c48244a60d0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"> </p> 
<p> </p> 
</blockquote>
