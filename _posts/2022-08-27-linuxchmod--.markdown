---
layout: post
title: "Linux chmod命令--控制用户对文件的权限"
date: "2022-08-27"
categories:
---
<p><a href="https://www.runoob.com/linux/linux-comm-chmod.html">Linux chmod</a>（英文全拼：change mode）命令是控制用户对文件的权限的命令</p>
<p>Linux/Unix 的文件调用权限分为三级 : 文件所有者（Owner）、用户组（Group）、其它用户（Other Users）。</p>
<p><img src="https://www.runoob.com/wp-content/uploads/2014/08/file-permissions-rwx.jpg" width="60%" /></p>
<p>&nbsp;</p>
<p>只有文件所有者和超级用户可以修改文件或目录的权限。可以使用绝对模式（八进制数字模式），符号模式指定文件的权限。</p>
<p><img src="https://www.runoob.com/wp-content/uploads/2014/08/rwx-standard-unix-permission-bits.png" width="60%" /></p>
<p>安装APPImage结尾的文件，环境：source ~/env_file , 修改权限：chomd +x Ink.. , 使用：./Ink...</p>
<p><img height="180" src="/uploads/ckeditor/pictures/342/image-20220827222143-1.png" width="397" /></p>
<p>将文件 file1.txt 设为所有人皆可读取 :</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod ugo</span><span class="pun">+</span><span class="pln">r file1</span><span class="pun">.</span><span class="pln">txt</span>
<p>将文件 file1.txt 设为所有人皆可读取 :</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod a</span><span class="pun">+</span><span class="pln">r file1</span><span class="pun">.</span><span class="pln">txt</span>
<p>将文件 file1.txt 与 file2.txt 设为该文件拥有者，与其所属同一个群体者可写入，但其他以外的人则不可写入 :</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod ug</span><span class="pun">+</span><span class="pln">w</span><span class="pun">,</span><span class="pln">o</span><span class="pun">-</span><span class="pln">w file1</span><span class="pun">.</span><span class="pln">txt file2</span><span class="pun">.</span><span class="pln">txt</span>
<p>为 ex1.py 文件拥有者增加可执行权限:</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod u</span><span class="pun">+</span><span class="pln">x ex1</span><span class="pun">.</span><span class="pln">py</span>
<p>将目前目录下的所有文件与子目录皆设为任何人可读取 :</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod </span><span class="pun">-</span><span class="pln">R a</span><span class="pun">+</span><span class="pln">r </span><span class="pun">*</span>
<p>此外chmod也可以用数字来表示权限如 :</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod </span><span class="lit">777</span><span class="pln"> file</span>
<p>语法为：</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod abc file</span>
<p>其中a,b,c各为一个数字，分别表示User、Group、及Other的权限。</p>
<h4>r=4，w=2，x=1</h4>
<ul>
<li>若要 rwx 属性则 4+2+1=7；</li>
<li>若要 rw- 属性则 4+2=6；</li>
<li>若要 r-x 属性则 4+1=5。</li>
</ul>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod a</span><span class="pun">=</span><span class="pln">rwx file</span>
<p>和</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod </span><span class="lit">777</span><span class="pln"> file</span>
<p>效果相同</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod ug</span><span class="pun">=</span><span class="pln">rwx</span><span class="pun">,</span><span class="pln">o</span><span class="pun">=</span><span class="pln">x file</span>
<p>和</p>
<pre class="prettyprint prettyprinted" style="">
<span class="pln">chmod </span><span class="lit">771</span><span class="pln"> file</span>
