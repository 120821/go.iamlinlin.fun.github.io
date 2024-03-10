---
layout: post
title: "react 部署 不需要 yarn start"
date: "2023-08-14"
categories: 
---
<p>因为react 配置的是静态的nginx，不需要yarn start， yarn start 会占用较多的内存，直接使用build文件夹即可。</p>
<p>go可以使用go build生成的./xxx(可执行文件执行），因为会占用较少的内存。</p>
