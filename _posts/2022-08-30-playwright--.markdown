---
layout: post
title: "playwright--抓取文本内容"
date: "2022-08-30"
categories: 
---
<p><a href="https://playwright.dev/docs/running-tests">https://playwright.dev/docs/running-tests</a></p>

<p>创建项目：</p>

<pre>
<code>yarn create playwright</code></pre>

<p>运行：</p>

<pre>
<code>yarn playwright test（运行端到端测试。）
&nbsp; yarn playwright test --project=chromium（仅在桌面Chrome上运行测试。）
&nbsp; yarn playwright test example（在特定文件中运行测试。）
&nbsp; yarn playwright test --debug（在调试模式下运行测试。）
&nbsp; yarn playwright codegen（使用Codegen自动生成测试。）
✔ Success! Created a Playwright Test project at /workspace/test_playwright
Inside that directory, you can run several commands:
&nbsp; yarn playwright test
&nbsp;&nbsp;&nbsp; Runs the end-to-end tests.
&nbsp; yarn playwright test --project=chromium
&nbsp;&nbsp;&nbsp; Runs the tests only on Desktop Chrome.
&nbsp; yarn playwright test example
&nbsp;&nbsp;&nbsp; Runs the tests in a specific file.
&nbsp; yarn playwright test --debug
&nbsp;&nbsp;&nbsp; Runs the tests in debug mode.
&nbsp; yarn playwright codegen
&nbsp;&nbsp;&nbsp; Auto generate tests with Codegen.
We suggest that you begin by typing:
</code></pre>

<pre>
<code>&nbsp;&nbsp;&nbsp; yarn playwright test</code></pre>

<pre>
<code>And check out the following files:

&nbsp; - ./tests/example.spec.ts - Example end-to-end test

&nbsp; - ./tests-examples/demo-todo-app.spec.ts - Demo Todo App end-to-end tests

&nbsp; - ./playwright.config.ts - Playwright Test configuration Visit https://playwright.dev/docs/intro for more information. ✨ Happy hacking! 🎭

Done in 29.67s.</code></pre>

<p><img height="558" src="/uploads/ckeditor/pictures/360/image-20220830102418-1.png" width="1141" /></p>

<p>抓取内容（方法）：<a href="https://playwright.bootcss.com/docs/assertions">https://playwright.bootcss.com/docs/assertions</a></p>

<pre>
<code>
  const content = await page.textContent(&#39;nav:first-child&#39;);

  expect(content).toBe(&#39;home&#39;);
</code></pre>

<p>修改内容：（更换URL等）（tests/example.spec.ts）</p>

<pre>
<code>import { test, expect } from &#39;@playwright/test&#39;;
test(&#39;get page content&#39;, async ({ page }) =&gt; {

  &nbsp; //await page.goto(&#39;https://playwright.dev/&#39;);

  &nbsp; await page.goto(&#39;https://www.museumsusa.org/museums/?k=1271407%2cCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454#top&#39;);
nbsp; // Expect a title &quot;to contain&quot; a substring.
&nbsp; //await expect(page).toHaveTitle(/Playwright/);
nbsp; const content = await page.textContent(&#39;.itemGroup&#39;);
&nbsp; console.log(content)
//&nbsp; expect(content).toBe(&#39;home&#39;);
&nbsp; // create a locator
&nbsp; const getStarted = page.locator(&#39;text= Adobe Art Gallery&#39;);
nbsp; // Expect an attribute &quot;to be strictly equal&quot; to the value.
&nbsp; //await expect(getStarted).toHaveAttribute(&#39;href&#39;, &#39;/docs/intro&#39;);
nbsp; // Click the get started link.
&nbsp; await getStarted.click();
&nbsp; // Expects the URL to contain intro.

  &nbsp; //await expect(page).toHaveURL(/.*intro/);

  });</code></pre>

<p>运行：yarn playwright test</p>

<p>会把div的class内容进行打印。</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/361/image-20220830103007-2.png" width="1920" /></p>

