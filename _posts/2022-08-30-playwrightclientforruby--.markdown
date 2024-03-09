---
layout: post
title: "Playwright client for Ruby--截图"
date: "2022-08-30"
categories: 
---
<p>参考：<a href="https://github.com/YusukeIwaki/playwright-ruby-client">https://github.com/YusukeIwaki/playwright-ruby-client</a></p>

<p>在Gemfile增加gem：（bundle install）</p>

<p>gem &#39;playwright-ruby-client&#39;</p>

<p>安装playwright：</p>

<p>npm install playwright<br />
./node_modules/.bin/playwright install</p>

<p>设置路径：</p>

<p><code>&nbsp;playwright_cli_executable_path: &#39;./node_modules/.bin/playwright&#39;</code></p>

<p><code>截图脚本：</code></p>

<p>require &#39;playwright&#39;</p>

<p>Playwright.create(playwright_cli_executable_path: &#39;./node_modules/.bin/playwright&#39;) do |playwright|<br />
&nbsp; playwright.chromium.launch(headless: false) do |browser|<br />
&nbsp;&nbsp;&nbsp; page = browser.new_page<br />
&nbsp;&nbsp;&nbsp; page.goto(&#39;https://github.com/YusukeIwaki&#39;)<br />
&nbsp;&nbsp;&nbsp; page.screenshot(path: &#39;./YusukeIwaki.png&#39;)<br />
&nbsp; end<br />
end</p>

<p>运行后，ls就看到新增了文件</p>

<p dir="auto">Simple scraping（脚本）</p>

<p>require &#39;playwright&#39;</p>

<p>Playwright.create(playwright_cli_executable_path: &#39;./node_modules/.bin/playwright&#39;) do |playwright|<br />
&nbsp; playwright.chromium.launch(headless: false) do |browser|<br />
&nbsp;&nbsp;&nbsp; page = browser.new_page<br />
&nbsp;&nbsp;&nbsp; page.goto(&#39;https://github.com/&#39;)</p>

<p>&nbsp;&nbsp;&nbsp; form = page.query_selector(&quot;form.js-site-search-form&quot;)<br />
&nbsp;&nbsp;&nbsp; search_input = form.query_selector(&quot;input.header-search-input&quot;)<br />
&nbsp;&nbsp;&nbsp; search_input.click<br />
&nbsp;&nbsp;&nbsp; page.keyboard.type(&quot;playwright&quot;)<br />
&nbsp;&nbsp;&nbsp; page.expect_navigation {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.keyboard.press(&quot;Enter&quot;)<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; list = page.query_selector(&quot;ul.repo-list&quot;)<br />
&nbsp;&nbsp;&nbsp; items = list.query_selector_all(&quot;div.f4&quot;)<br />
&nbsp;&nbsp;&nbsp; items.each do |item|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title = item.eval_on_selector(&quot;a&quot;, &quot;a =&gt; a.innerText&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts(&quot;==&gt; #{title}&quot;)<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end</p>

<p><img height="558" src="/uploads/ckeditor/pictures/363/image-20220830105350-1.png" width="1912" /></p>

<p>require &#39;playwright&#39;</p>

<p>Playwright.create(playwright_cli_executable_path: &#39;./node_modules/.bin/playwright&#39;) do |playwright|<br />
&nbsp; devices = playwright.android.devices<br />
&nbsp; unless devices.empty?<br />
&nbsp;&nbsp;&nbsp; device = devices.last<br />
&nbsp;&nbsp;&nbsp; begin<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts &quot;Model: #{device.model}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts &quot;Serial: #{device.serial}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts device.shell(&#39;ls /system&#39;)</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device.launch_browser do |context|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page = context.pages.first<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.goto(&#39;https://github.com/YusukeIwaki&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.click(&#39;header button&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.click(&#39;input[name=&quot;q&quot;]&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.keyboard.type(&#39;puppeteer&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.expect_navigation {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.keyboard.press(&#39;Enter&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page.screenshot(path: &#39;YusukeIwaki.android.png&#39;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; ensure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device.close<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end</p>

