---
layout: post
title: "playwright 的安装 使用（1）"
date: "2022-12-15"
categories: 
---
<p>官方的git：<a href="https://github.com/microsoft/playwright">https://github.com/microsoft/playwright</a></p>

<p>官方的教程：<a href="https://playwright.dev/docs/intro">https://playwright.dev/docs/intro</a></p>

<p>1.安装：</p>

<p>（1）使用npm</p>

<pre>
<code><span style="color:#393a34"><span style="color:#8250df">npm</span> init playwright@latest</span>{% endhighlight %}

<p>（2）使用yarn</p>

<pre>
<code>yarn create playwright{% endhighlight %}

<p>（3）安装的是这些：</p>

<pre>
<code>playwright.config.ts(添加配置的地方,</code>例如修改您希望在哪些浏览器上运行 Playwright。 如果您在现有项目中运行测试，那么依赖项将直接添加到您的 package.json.<code>)

package.json

package-lock.json

tests/（</code>包含一个基本示例测试，可帮助您开始测试。 有关更详细的示例，请查看 tests-examples包含为测试待办事项应用程序而编写的测试的文件夹）<code>）

&nbsp; example.spec.ts

tests-examples/

&nbsp; demo-todo-app.spec.ts{% endhighlight %}

<p>(4)运行测试示例</p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span></span>{% endhighlight %}

<p>（5）html测试报告</p>

<p>npx playwright show-report</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

