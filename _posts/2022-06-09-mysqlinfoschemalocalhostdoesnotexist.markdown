---
layout: post
title: "mysql.infoschema@localhost  does not exist"
date: "2022-06-09"
categories: 
---

                    {% highlight %}DROP USER 'mysql.infoschema'@'localhost';

{% endhighlight %} 
<p>The rest of the solution is like previous answers.</p> 
<ol>
<li>Create the user again</li>
<li>Grant it permissions</li>
<li> {% highlight %}mysql&gt; CREATE USER 'mysql.infoschema'@'localhost' IDENTIFIED BY 'password';

mysql&gt; GRANT SELECT ON *.* TO `mysql.infoschema`@`localhost`;
{% endhighlight %} </li>
</ol>
<p style="text-align:center;"><img src="https://img-blog.csdnimg.cn/fc50987f57234bc595c30da12fca222a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" alt="watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p> 
<p style="text-align:center;"><img src="https://img-blog.csdnimg.cn/2c5d5319ddb14222a4aedffc1e437b51.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" alt="watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p> 
<p> </p>
                
