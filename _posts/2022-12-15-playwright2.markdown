---
layout: post
title: "playwright 的安装 使用（2）运行测试"
date: "2022-12-15"
categories: 
---
<p>参考：<a href="https://playwright.dev/docs/running-tests">https://playwright.dev/docs/running-tests</a></p>

<p>您可以运行单个测试、一组测试或所有测试。 测试可以在一个浏览器或多个浏览器上运行。 默认情况下，测试以无头方式运行，这意味着在运行测试时不会打开浏览器窗口，并且会在终端中看到结果。</p>

<p>1.运行所有的测试</p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span></span></code></pre>

<p><code><span style="color:#393a34"><span style="color:#116329">2.运行单个的测试</span></span></code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> landing-page.spec.ts</span></code></pre>

<p><code><span style="color:#393a34">3.运行一组测试</span></code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> tests/todo-page/ tests/landing-page/</span></code></pre>

<p><code>4.运行所有含有landing文件夹或者在login在文件名中的测试文件</code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> landing login</span></code></pre>

<p><code>5.</code>运行带有标题的文件</p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> <span style="color:#e36209">-g</span> <span style="color:#c6105f">&quot;add a todo item&quot;</span></span></code></pre>

<p><code>6.在引导模式下运行测试文件</code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> landing-page.spec.ts <span style="color:#e36209">--headed</span></span></code></pre>

<p><code>7.在特定的项目进行测试</code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> landing-page.ts <span style="color:#e36209">--project</span><span style="color:#d73a49">=</span>chromium</span></code></pre>

<p><code><span style="color:#393a34">8.调试所有的测试文件</span></code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> <span style="color:#e36209">--debug</span>
</span></code></pre>

<p><code><span style="color:#393a34">9.调试一个测试文件</span></code></p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> example.spec.ts <span style="color:#e36209">--debug</span></span></code>
</pre>

<p>10.从行号调试测试 <code>test(..</code>被定义为：</p>

<pre>
<code><span style="color:#393a34">npx playwright <span style="color:#116329">test</span> example.spec.ts:42 <span style="color:#e36209">--debug</span></span></code></pre>

<p><code><span style="color:#393a34"><span style="color:#e36209">11.测试报告（如果测试出现错误，就会自动出现html的测试报告，点击可以查看错误的详情）</span></span></code></p>

<pre>
<code><span style="color:#393a34">npx playwright show-report</span></code></pre>

