---
layout: post
title: "rails Expected to find a manifest file in `app/assets/config/manifest.js` (Sprockets::Railtie::ManifestNeededError)"
date: "2023-06-27"
categories: 
---
<p>检查是否有这个文件，app/assets/config/manifest.js，没有的话就创建一个空的，并填写这样的内容。重启server。</p>

<p>//= link_tree ../images<br />
&nbsp; //= link_directory ../javascripts .js<br />
&nbsp; //= link_directory ../stylesheets .css</p>

<p>&nbsp;</p>

<p>&nbsp;Expected to find a manifest file in `app/assets/config/manifest.js` (Sprockets::Railtie::ManifestNeededError)<br />
But did not, please create this file and use it to link any assets that need<br />
to be rendered by your app:</p>

<p>Example:<br />
&nbsp; //= link_tree ../images<br />
&nbsp; //= link_directory ../javascripts .js<br />
&nbsp; //= link_directory ../stylesheets .css<br />
and restart your server</p>

<p>&nbsp;</p>

