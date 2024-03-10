---
layout: post
title: "注意go安装后需要使用重新加载和配置 Go 版本：asdf reshim golang 1.18.3"
date: "2023-08-03"
categories: 
---
<p>为什么安装go后需要使用：asdf reshim golang version?</p>
<p>回答来自poe:</p>
<p>在安装 Go 后使用 {% highlight html %}asdf reshim golang version{% endhighlight %} 的目的是重新加载和配置 Go 版本，以便让 {% highlight html %}asdf{% endhighlight %} 能够正确地管理和使用安装的 Go 版本。</p>
<p>{% highlight html %}asdf{% endhighlight %} 是一个版本管理工具，用于管理多个编程语言的不同版本。当您使用 {% highlight html %}asdf{% endhighlight %} 安装 Go 时，它会将 Go 的安装路径添加到系统的环境变量中，以便您可以在命令行中直接访问 Go 相关的可执行文件（例如 {% highlight html %}go{% endhighlight %} 命令）。</p>
<p>然而，有时候在安装 Go 后，操作系统可能不会立即更新环境变量，这可能导致无法正确识别和使用新安装的 Go 版本。这时候，您可以<strong>使用 {% highlight html %}asdf reshim golang version{% endhighlight %} 命令来重新加载和配置 Go 版</strong>本。</p>
<p>执行 {% highlight html %}asdf reshim golang version{% endhighlight %} 命令会重新配置当前正在使用的 Go 版本，使其生效。这将更新环境变量和相关的配置，以便您可以正确地使用已安装的 Go 版本。</p>
<p>通过运行 {% highlight html %}asdf reshim golang version{% endhighlight %}，您可以确保系统正确识别和使用您安装的 Go 版本，以便您可以在命令行中顺利地运行 Go 相关的命令和程序。</p>
<p>请注意，{% highlight html %}version{% endhighlight %} 部分应替换为您实际安装的 Go 版本号。</p>
