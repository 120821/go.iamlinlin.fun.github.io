---
layout: post
title: "git commit后回退方法"
date: "2022-06-23"
categories: 
---
<p>使用导入CSV的时候需要创建一个public/files/文件夹，进行测试数据的是时候，测试文件放在文件夹里一起提交了，</p>
{% highlight html %}git commit -m &#39;public/upload_files/ 增加了目录，用来导入文件使用&#39;
[main 9a695f2] public/upload_files/ 增加了目录，用来导入文件使用
&nbsp;3 files changed, 57 insertions(+)
&nbsp;create mode 100644 &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966027&quot;
&nbsp;create mode 100644 &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966139&quot;
&nbsp;create mode 100644 &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966222&quot;{% endhighlight %}
<p>因为还没有进行push，所以进行回退</p>
<p>使用git log进行查看</p>
{% highlight html %}git log
commit 9a695f29923c585858a2c5d24b9c8400f38797 (HEAD -&gt; main)
Author: xxx &lt;sxxxxei@sina.com&gt;
Date:&nbsp;&nbsp; Thu Jun 23 14:42:56 2022 +0800{% endhighlight %}
<p>&nbsp;&nbsp;&nbsp; public/upload_files/ 增加了目录，用来导入文件使用</p>
<p>git show 进行查看：git show 9a695f29923c7450beb2a2c</p>
<p>的确是测试文件，然后记录下commit的id,进行回退git reset --soft id^</p>
<p>例如：整合成这样的一行：git reset --soft 9a695f29923c585858a2c5d24b9c8400f38797^</p>
<p>仍然看到</p>
{% highlight html %}deleted:&nbsp;&nbsp;&nbsp; &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966027&quot;
&nbsp;&nbsp; &nbsp;deleted:&nbsp;&nbsp;&nbsp; &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966139&quot;
&nbsp;&nbsp; &nbsp;deleted:&nbsp;&nbsp;&nbsp; &quot;public/upload_files/NFT\350\256\244\351\242\206\344\272\272CSV\344\270\212\344\274\240\347\244\272\344\276\213.csv1655966222&quot;{% endhighlight %}
<p>rm 之后，git&nbsp; rm 也不可以了，那么进行stash save</p>
<p>或者这样的方式进行回退</p>
<p>1.执行git log找到本次commi的ID信息</p>
<p>比如commit id信息为：90f1ce4d73c5dc63f46fa61984a6bb878f47374</p>
<p>2.执行git reset --soft HEAD^操作</p>
<p>对应HEAD即上述commit id信息</p>
<p>git reset --soft 90f1ce4d73c5dc63f46fa61984a6bb878f47374^</p>
<p>说明：最后的符号^记得不要漏掉</p>
<p>此时通过git status时，可以看到git add 的文件(绿色）</p>
<p>3.git reset modify_file</p>
<p>通过git reset modify_file 操作后，</p>
<p>通过git status可以看到红色的修改文件</p>
<p>4.git checkout modify_file</p>
<p>通过git checkout modify_file还原至修改之前状态<br />
&nbsp;</p>
