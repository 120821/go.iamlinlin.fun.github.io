---
layout: post
title: "vuejs创建新项目--创建页面--v-if--v-for-v-if具有更高的优先级"
date: "2022-06-09"
categories: 
---

                    <blockquote>
 如果没有下载vue，可以用链接的方法进行体验： 
 <pre><code>&lt;script src="https://cdn.jsdelivr.net/npm/vue@3.2.2"&gt;&lt;/script&gt;</code></pre> 
</blockquote> 
<blockquote>
 安装vue,直接输入命令即可   npm install -g @vue/cli@4.5.13 vue@3.2.2
 <img alt="" src="https://img-blog.csdnimg.cn/c4ef18fa7ed643d39f15a27606a00e4d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16">
</blockquote> 
<blockquote>
 <img alt="" src="https://img-blog.csdnimg.cn/e2a107e4e474451f96c8cabe044ceae8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16">
</blockquote> 
<p> 注意不要把$符号放在文件内</p> 
<blockquote>
 创建新项目,输入命令 
 <pre><code>vue init webpack my-project</code></pre> 
 <p style="text-align:center;">填写详细信息,如项目名称,作者等即可.<img alt="" src="https://img-blog.csdnimg.cn/9a866bbd883a43a884ec8a7a35b1eb6c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p> 创建后 直接cd 进入项目 ： cd 项目名字</p> 
 <p style="text-align:center;">创建一个页面，需要创建路由和视图，进入路由文件进行修改<img alt="" src="https://img-blog.csdnimg.cn/c7f772dc9c544cdfa2a81ee4b19230e2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;">修改路由文件后，创建对应的视图文件<img alt="" src="https://img-blog.csdnimg.cn/227fecfc8fce48edb1943c779086b17c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p> 输入命令npm run serve  让项目运行起来<img alt="" src="https://img-blog.csdnimg.cn/b44ab70febec4e119d78f2571ef9122a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;">在浏览器输入网址即可看到项目视图对应的页面，如果没有修改视图文件，看到是官方的欢迎页面，并没有太多影响<img alt="" src="https://img-blog.csdnimg.cn/92d4cdec0bae4e4f95630f693624c67e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"> 同样的，创建对应的视图文件，打开对应的页面，即可，v-for页面是这样的，<img alt="" src="https://img-blog.csdnimg.cn/fb42240c9fc541f5a59c4590f0ccf312.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"> 打开浏览器输入网址后，看到的页面是这样的<img alt="" src="https://img-blog.csdnimg.cn/a03b4c2ac7094b5da4a299bd9a872efe.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;">增加v-if的视图页面，如图：<img alt="" src="https://img-blog.csdnimg.cn/66614b19a76641cb8e6f697dbe1a2f14.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"> 打开v-if的网址，看到的页面是这样的：<img alt="" src="https://img-blog.csdnimg.cn/3d72599934684d67985150b5af7be047.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"> 对于v-if和v-for的优先级比较，可以看一下：<img alt="" src="https://img-blog.csdnimg.cn/29c5f2488a934c4ab7294f9f109f3948.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"> 进入浏览器打开页面。看到：<img alt="" src="https://img-blog.csdnimg.cn/4d0b0f16e202449b93f22ca2f3ebaff4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p>在vue3中，当v-if与v-for一起使用时，<strong>v-if</strong>具有比v-for<strong>更高的优先级</strong>。也就是说，Vue.js会先执行v-if，再执行v-for。</p> 
</blockquote>
                
