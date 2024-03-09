---
layout: post
title: "git push error"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 {% highlight %}error: Your local changes to the following files would be overwritten by merge:
    readme.rb
Please commit your changes or stash them before you merge.
Aborting
{% endhighlight %} 
 <p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/b263f55e829349e494a8d61717e45909.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p> 如果在远程修改了文件，在本地同时修改了文件，会发生冲突，需要在本地修改合并文件，手动完成修改。<br> 首先把本地的文件保存并提交，</p> 
 {% highlight %}git status   
git diff    
git add   
git commit{% endhighlight %} 
 <p><img alt="" src="https://img-blog.csdnimg.cn/c26d4b1dc7bc4d35996d559c8f3e656f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p> 然后把远程的数据提取到本地，进行文件合并修改<img alt="" src="https://img-blog.csdnimg.cn/6ecd710621fd46cd9a84ac28be92005b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"><br>  </p> 
 {% highlight %}git pull

git log

git status

vim

git add

git commit

git push{% endhighlight %} 
 <p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/157f9f01d8c642fca45b34eeb1e0271f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/62dd439440af4d34a6fa275b5b065eb6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"> </p> 
 <p> </p> 
</blockquote>
                
