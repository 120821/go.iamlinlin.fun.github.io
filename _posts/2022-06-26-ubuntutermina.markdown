---
layout: post
title: "重命名 ubuntu下的termina"
date: "2022-06-26"
categories:
---
<p>参考：&nbsp;http://siwei.me/blog/posts/ubuntu-terminal-rename-tab&nbsp;</p>
<p>工作开发多了，会发现tab的数量太多， 如果能设置各种标签的名字就好了</p>
<p>这方面 windows&nbsp; terminal preview就很好， 不但能设置名称，还能设置颜色</p>
<p>1. 修改 ~/.bashrc</p>
<p>到根目录下，修改文件内容</p>
<pre class="hljs bash">
<span class="hljs-keyword">function</span> <span class="hljs-function"><span class="hljs-title">renametab</span></span>() {
<span class="hljs-keyword">if</span> [[ -z <span class="hljs-string">&quot;<span class="hljs-variable">$ORIG</span>&quot;</span> ]]; <span class="hljs-keyword">then</span>
ORIG=<span class="hljs-variable">$PS1</span>
<span class="hljs-keyword">fi</span>
TITLE=<span class="hljs-string">&quot;\[\e]2;$*\a\]&quot;</span>
PS1=<span class="hljs-variable">${ORIG}</span><span class="hljs-variable">${TITLE}</span>
}
<p>找不到符合的内容，就直接粘贴好了</p>
<p><img height="1080" src="/uploads/ckeditor/pictures/80/image-20220627080056-1.png" width="1920" /></p>
<p>2. renametab&nbsp; lueluelue</p>
<p>就可以看到效果了</p>
<p>3.如果不升效，就先使用</p>
<pre class="lang-bash s-code-block">
<code class="hljs language-bash"><span class="hljs-built_in">source</span> ~/.bashrc
<p>{% highlight html %}然后进行renametab hihihi{% endhighlight %}</p>
