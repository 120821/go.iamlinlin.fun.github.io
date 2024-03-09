---
layout: post
title: "Query 安装 和jQuery hide"
date: "2022-08-23"
categories: 
---
<p><a href="https://www.runoob.com/jquery/jquery-tutorial.html">jQuery </a></p>

<p>jQuery 库是一个 JavaScript 文件，您可以使用 HTML 的 &lt;script&gt; 标签引用它：</p>

<div class="example">
<div class="example_code">
<p class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">jquery-1.10.2.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></p>

<p class="hl-main">如果你的站点用户是国内的，建议使用百度、又拍云、新浪等国内CDN地址，如果你站点用户是国外的可以使用谷歌和微软。</p>

<p class="example">Staticfile CDN:</p>

<div class="example_code">
<p class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></p>

<div class="hl-main">百度 CDN:</div>

<div class="hl-main">
<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></div>

<div class="hl-main">
<p class="example">又拍云 CDN:</p>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></div>

<div class="hl-main">
<p class="example">新浪 CDN:</p>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></div>

<div class="hl-main">
<p class="example">Google CDN:</p>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></div>

<div class="hl-main">
<p class="example">Microsoft CDN:</p>

<div class="example_code">
<div class="hl-main"><span class="hl-brackets">&lt;</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">head</span><span class="hl-brackets">&gt;</span></div>
</div>
</div>
</div>
</div>

<div class="hl-main">&nbsp;</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<p>使用hide ，先在application增加引入jQuery的文件</p>

<p>&lt;script src=&quot;https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js&quot;&gt;、</p>

<p>然后在视图页面的body增加内容</p>

<p>&lt;p&gt;如果你点我，我就会消失。&lt;/p&gt;<br />
&lt;p&gt;继续点我!&lt;/p&gt;<br />
&lt;p&gt;接着点我!&lt;/p&gt;</p>

<p>&lt;script&gt;<br />
$(document).ready(function(){<br />
&nbsp; $(&quot;p&quot;).click(function(){<br />
&nbsp;&nbsp;&nbsp; $(this).hide();<br />
&nbsp; });<br />
});<br />
&lt;/script&gt;</p>

<p>在浏览器的 Console 窗口中使用 <span class="marked">$.fn.jquery</span> 命令查看当前 jQuery 使用的版本：</p>

<p><img src="https://www.runoob.com/wp-content/uploads/2013/09/B05C63FB-9989-4607-A4FE-5FF8AEE6C770.jpg" /></p>

