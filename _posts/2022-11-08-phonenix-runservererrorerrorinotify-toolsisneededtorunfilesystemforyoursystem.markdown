---
layout: post
title: "phonenix - run server error [error] `inotify-tools` is needed to run `file_system` for your system"
date: "2022-11-08"
categories: 
---
<p><a href="https://github.com/inotify-tools/inotify-tools/wiki">https://github.com/inotify-tools/inotify-tools/wiki</a></p>

<p>[error] `inotify-tools` is needed to run `file_system` for your system, check https://github.com/rvoicilas/inotify-tools/wiki for more information about how to install it. If it&#39;s already installed but not be found, appoint executable file with `config.exs` or `FILESYSTEM_FSINOTIFY_EXECUTABLE_FILE` env</p>

<p>解决：</p>

<p><code>apt-get install inotify-tools</code></p>

