---
layout: post
title: "简要介绍 X Window System (又称为X11 or X)"
date: "2022-08-30"
categories: 
---
<p><a href="http://t.zoukankan.com/gremount-p-6941058.html">http://t.zoukankan.com/gremount-p-6941058.html</a></p>

<div><span class="pre-scrollable"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 18px"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px">X11是一个应用程序，而不是一个操作系统，主要功能是提供图形界面，实现架构和网络架构相同，有X Client和X Server组件，另外还有Window Manager和Display Manager组件。</span></span></span></div>

<div><span class="pre-scrollable"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px">　　其中X Client是应用程序（例如gedit, firefox, terminal等），X Server负责管理硬件（例如鼠标，键盘，显示器）。</span></span></div>

<div><span class="pre-scrollable"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px">　　Window Manager常见的有GNOME, KDE等，负责管理所有的X Client，窗口控制参数（窗口的大小，窗口的移动等），设置背景壁纸等。</span></span></div>

<div><span class="pre-scrollable"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px">　　Display Manager功能是提供登录界面，并加载用户选择的Window Manager和语系等。</span></span></div>

<div><span class="pre-scrollable"><span style="font-family: &quot;Microsoft YaHei&quot;; font-size: 14px">　　可以按照登录CentOS操作系统的过程来理解这4个组件。</span></span></div>

