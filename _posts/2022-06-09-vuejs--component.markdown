---
layout: post
title: "vuejs--component组件"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong>当不同页面具有相同的板块，抽取出来一个组件，就是组件</strong></p> 
 <p><span style="color:#000000;">Component命名规则</span></p> 
 <pre><code>官方建议每个Component的命名都使用小写字母+横线的形式。例如：

Vue.component('my-component-name', { /* ... */ })

这个是符合W3C规范的。也可以定义为：

Vue.component('MyComponentName', { /* ... */ })

可以使用&lt;MyComponentName/&gt;调用，也可以使用 &lt;my-component-name/&gt;调用。不能使用下划线。</code></pre> 
</blockquote> 
<blockquote> 
 <p style="margin-left:.0001pt;">在原生Vue.js中创建component的过程非常简单，<span style="color:#000000;">可以看出，该component定义了一个 data 代码段，其中</span><span style="color:#000000;">有</span><span style="color:#000000;">一</span><span style="color:#000000;">个count变量</span><span style="color:#000000;">，然后定义一个 template段落即可。</span><img alt="" src="https://img-blog.csdnimg.cn/ede89cd6b32a457da4bf06a78a50abb2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16">点击即可看到数据在变化</p> 
</blockquote> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/2dc64a0833624a1980d0fb0981243df5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>实际项目中很多时候，一个Component中嵌套着另一个，这个component再嵌套另外5个，如果出现this.$emit就更加复杂</p> 
<p></p>
                
