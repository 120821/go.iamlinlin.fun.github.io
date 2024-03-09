---
layout: post
title: "rails笔记 目录结构和基本的Linux命令"
date: "2022-06-09"
categories: 
---
<p>参考： rails 入门第五版</p>

<p><strong>Rails 目录结构简介</strong></p><br />
<pre><code>文件/文件夹作用<br />
app/应用的核心文件，包含模型、视图、控制器和辅助方法<br />
app/assets应用的静态资源文件，例如层叠样式表（CSS）、JavaScript 文件和图像<br />
bin/可执行的二进制文件<br />
config/应用的配置<br />
db/数据库文件<br />
doc/应用的文档<br />
lib/代码库模块文件<br />
lib/assets代码库的静态资源文件，例如层叠样式表（CSS）、JavaScript 文件和图<br />
像<br />
log/应用的日志文件<br />
public/公共（如浏览器）可访问的文件，例如错误页面<br />
bin/rails生成代码、打开终端会话或启动本地服务器的程序<br />
test/应用的测试<br />
tmp/临时文件<br />
vendor/第三方代码，例如插件和 gem<br />
vendor/assets第三方静态资源文件，例如层叠样式表（CSS）、JavaScript 文件和图像<br />
README.md应用简介<br />
Rakefile使用 rake 命令执行的实用任务<br />
Gemfile应用所需的 gem<br />
Gemfile.lockgem 列表，确保这个应用的副本使用相同版本的 gem<br />
config.ruRack 中间件的配置文件<br />
.gitignoreGit 忽略的文件模式</code></pre>

<p><strong>一些常用的 Unix 命令</strong><p><br />
作用命令示例<br />
<pre><code>列出内容ls$ ls -l<br />
新建目录mkdir &lt;dirname&gt;$ mkdir environment<br />
变换目录cd &lt;dirname&gt;$ cd environment/<br />
进入上层目录$ cd ..<br />
进入家目录$ cd ~ 或 $ cd<br />
进入家目录中的文件夹$ cd ~/environment/<br />
移动文件（重命名）mv &lt;source&gt; &lt;target&gt;$ mv foo bar<br />
复制文件cp &lt;source&gt; &lt;target&gt;$ cp foo bar<br />
删除文件rm &lt;file&gt;$ rm foo<br />
删除空目录rmdir &lt;directory&gt;$ rmdir environment/<br />
删除非空目录rm -rf &lt;directory&gt;$ rm -rf tmp/<br />
拼接并显示文件的内容cat &lt;file&gt;$ cat ~/.ssh/id_rsa.pub</code></pre>

