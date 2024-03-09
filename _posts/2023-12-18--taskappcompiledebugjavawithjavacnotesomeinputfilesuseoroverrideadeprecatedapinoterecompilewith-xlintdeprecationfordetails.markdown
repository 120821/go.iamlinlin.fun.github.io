---
layout: post
title: "安卓逆向-> Task :app:compileDebugJavaWithJavac Note: Some input files use or override a deprecated API. Note: Recompile with -Xlint:deprecation for details."
date: "2023-12-18"
categories: 
---
<p>在安装依赖的时候，提示：</p>

<pre>
<code>&gt; Task :<span style="color:#dcc6e0">app</span>:compileDebugJavaWithJavac
<span style="color:#dcc6e0">Note</span>: Some <span style="color:#dcc6e0">input</span> files <span style="color:#dcc6e0">use</span> or override a deprecated API.
<span style="color:#dcc6e0">Note</span>: Recompile with -Xlint:deprecation <span style="color:#dcc6e0">for</span> details.
{% endhighlight %}

<p>意思是：</p>

<p>表明你的代码中使用了一些已经被废弃（deprecated）的 API。</p>

<p>解决：</p>

<p>打开你的模块级别的 <code>build.gradle</code> 文件。</p>

<p>然后增加：</p>

<pre>
<code>android {
    <span style="color:#d4d0ab">// 其他配置...</span>

    <span style="color:#d4d0ab">// 启用编译器警告提示</span>
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
        <span style="color:#d4d0ab">// 添加以下代码</span>
        <span style="color:#abe338">&quot;-Xlint:deprecation&quot;</span>
    }
}{% endhighlight %}

<p>重新编译。即可。</p>

<p>&nbsp;</p>

