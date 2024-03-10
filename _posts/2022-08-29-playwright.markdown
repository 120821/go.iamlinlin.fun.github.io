---
layout: post
title: "playwright"
date: "2022-08-29"
categories: 
---
<p>官网：<a href="https://playwright.dev/docs/intro">https://playwright.dev/docs/intro</a></p>
<p>安装：</p>
{% highlight html %}npm：
npm init playwright@latest
yarn:
yarn install playwright{% endhighlight %}
<p><img height="383" src="/uploads/ckeditor/pictures/352/image-20220829150258-1.png" width="1681" /></p>
<p><img height="784" src="/uploads/ckeditor/pictures/353/image-20220829150314-2.png" width="1705" /></p>
<p>然后，在运行的时候出现了错误，<img height="784" src="/uploads/ckeditor/pictures/354/image-20220829150334-3.png" width="1705" /></p>
<p>同时，浏览器页面也出现</p>
<p><img height="394" src="/uploads/ckeditor/pictures/355/image-20220829150415-4.png" width="1366" /></p>
<p>运行安装命令并选择以下开始：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 在 TypeScript 或 JavaScript 之间进行选择（默认为 TypeScript）<br />
&nbsp;&nbsp;&nbsp;&nbsp; 您的测试文件夹的名称（如果您的项目中已经有一个测试文件夹，则默认为测试或 e2e）<br />
&nbsp;&nbsp;&nbsp;&nbsp; 添加 GitHub Actions 工作流程以轻松在 CI 上运行测试</p>
<p>Playwright 将下载所需的浏览器并创建以下文件:</p>
{% highlight html %}playwright.config.ts
package.js
package-lock.json
tests/
&nbsp; example.spec.ts
tests-examples/
&nbsp; demo-todo-app.spec.ts{% endhighlight %}
<p>默认情况下，测试将在所有 3 个浏览器上运行，chrome、firefox 和 webkit，使用 3 个 worker。&nbsp; 这可以在 playwright.config 文件中进行配置。&nbsp; 测试以无头模式运行，这意味着在运行测试时不会打开任何浏览器。&nbsp; 测试结果和测试日志将显示在终端中。</p>
{% highlight html %}npx playwright test
{% endhighlight %}
<p>&nbsp;请参阅关于<a href="https://playwright.dev/docs/running-tests">运行测试的文档</a>，以了解有关在 headed 模式下运行测试、运行多个测试、运行特定测试等的更多信息。</p>
