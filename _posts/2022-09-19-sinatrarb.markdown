---
layout: post
title: "sinatra  rb文件可以直接变量进行引用，不需要加引号。字符串除外。"
date: "2022-09-19"
categories: 
---
<p>这种写法可以正常使用，但是太麻烦。 &quot;#{a.to_json}&quot;</p>

<p>修改为：</p>

<p>a.to_json</p>

