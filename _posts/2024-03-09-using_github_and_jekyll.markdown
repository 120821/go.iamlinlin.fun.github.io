---
layout: post
title:  "使用GitHub和自定义域名以及jekyll创建一个静态网站"
date:   2024-03-09 16:48:54 +0800
categories: jekyll update
---
refer:
[阮一峰的学习笔记]: https://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html
[Maple_ROSI的学习笔记]: https://blog.csdn.net/Maple_ROSI/article/details/79629531
创建一个新的项目
{% highlight shell%}
jekyll new my-awesome-site
#=> 输出
Running bundle install in /workspace/my-awesome-site...
  Bundler: Fetching gem metadata from https://rubygems.org/............
  Bundler: Resolving dependencies...
  Bundler: Using rake 13.1.0
  Bundler: Using bundler 2.3.11
  Bundler: Using concurrent-ruby 1.2.3
  Bundler: Using forwardable-extended 2.6.0
  Bundler: Using rexml 3.2.6
  Bundler: Using public_suffix 5.0.4
  Bundler: Using colorator 1.1.0
  Bundler: Using eventmachine 1.2.7
  Bundler: Using http_parser.rb 0.8.0
  Bundler: Using ffi 1.16.3
  Bundler: Fetching google-protobuf 3.25.3 (x86_64-linux)
  Bundler: Using rb-fsevent 0.11.2
  Bundler: Using liquid 4.0.4
  Bundler: Using mercenary 0.4.0
  Bundler: Using rouge 4.2.0
  Bundler: Using safe_yaml 1.0.5
  Bundler: Using unicode-display_width 2.5.0
  Bundler: Using webrick 1.8.1
  Bundler: Using pathutil 0.16.2
  Bundler: Fetching i18n 1.14.4
  Bundler: Using kramdown 2.4.0
  Bundler: Using rb-inotify 0.10.1
  Bundler: Using addressable 2.8.6
  Bundler: Using em-websocket 0.5.3
  Bundler: Using terminal-table 3.0.2
  Bundler: Using kramdown-parser-gfm 1.1.0
  Bundler: Fetching listen 3.9.0
  Bundler: Installing i18n 1.14.4
  Bundler: Installing listen 3.9.0
  Bundler: Using jekyll-watch 2.2.1
  Bundler: Installing google-protobuf 3.25.3 (x86_64-linux)
  Bundler: Using sass-embedded 1.69.5
  Bundler: Using jekyll-sass-converter 3.0.0
  Bundler: Using jekyll 4.3.3
  Bundler: Using jekyll-feed 0.17.0
  Bundler: Using jekyll-seo-tag 2.8.0
  Bundler: Using minima 2.5.1
  Bundler: Bundle complete! 7 Gemfile dependencies, 34 gems now installed.
  Bundler: Use `bundle info [gemname]` to see where a bundled gem is installed.
New jekyll site installed in /workspace/my-awesome-site.
{% endhighlight %}

进入文件夹，启动项目：
{% highlight shell%}
cd my-awesome-site
bundle exec jekyll serve
{% endhighlight %}
修改配置文件，根据提示修改即可
`_config.yml`
然后在GitHub上创建一个新的项目，名字格式为`xxx.github.io`
把本地的文件push在新创建的项目里，然后在根目录新建一个文件`CNAME`
内容是你的域名，例如设置为二级域名，可以直接写xxx.yousite.com
进入你的域名控制台，进行域名解析，二级域名可以设置CNAME,记录值设置为你的GitHub项目名称
顺便进行ssl证书申请。
接着进入GitHub，进入Setting，查看Custom domain菜单下是否设置为自己的域名，如果没有开启就在Custom domain上的菜单`Build and deployment`里的`Branch`设置一下，确认一下部署的分支。
保存即可
然后发现dns和https都设置好就可以了。

