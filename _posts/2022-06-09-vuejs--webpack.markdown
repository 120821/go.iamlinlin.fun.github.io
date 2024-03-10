---
layout: post
title: "vuejs-- webpack环境下父子组件的使用"
date: "2022-06-09"
categories: 
---
<blockquote> 
<p><strong>父组件调用子组件</strong></p> 
<p>    1 在父组件的子组件标签上写上ref属性 ref="child"</p> 
<p>    2 然后通过 ( this.$refs.child.xxxFn()  ) this.$refs.child 调用子组件的相应方法</p> 
<p><strong> 子组件调用父组件</strong></p> 
<p>    1 在父组件的子组件标签上写上，比如@childFn="fatherFn"进行事件绑定</p> 
<p>    2 在父组件的methods里面实现fatherFn方法</p> 
<p>    3 在子组件里使用 this.$emit('childFn',参数)来调用父组件的fatherFn方法就行了<br>            </p> 
{% highlight html %}单参数的时候：fatherFn接收到的第一个参数就是，子组件传过来的那个参数。
多参数的时候：fatherFn接收到的argumnets参数是一个数组，内容是子组件传来的多个参数{% endhighlight %} 
<p>父子组件有两种写法。</p> 
<p>HTML。只需要一个文件即可实现父子组件。</p> 
<p>并不提倡使用，学了没有什么意义。</p> 
<p><strong>vuejs  webpack下的文件</strong>需要路由。视图和vue文件<img alt="" height="181" src="https://img-blog.csdnimg.cn/57b6e9ec62eb44bfb8db94296e4d4775.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1066"></p> 
<p style="text-align:center;">实现上图的效果。首先需要在文件中增加路由。然后创建一个父文件和一个子文件。<img alt="" src="https://img-blog.csdnimg.cn/ee8bc00c383d46c59e8230ce2d0c9e0b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p style="text-align:center;"> <img alt="" src="https://img-blog.csdnimg.cn/0913ed9ff2194d48973f2da207b7378f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/fe420d91ed9c4e699417e723982806c8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
</blockquote> 
<p><br><br>  </p>
