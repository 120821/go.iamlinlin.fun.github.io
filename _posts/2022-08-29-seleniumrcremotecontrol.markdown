---
layout: post
title: "selenium rc (remote control)"
date: "2022-08-29"
categories: 
---
<p>官网（下载）：<a href="https://www.selenium.dev/downloads/">https://www.selenium.dev/downloads/</a></p>

<p>语法:<a href="https://www.selenium.dev/documentation/webdriver/getting_started/first_script/">https://www.selenium.dev/documentation/webdriver/getting_started/first_script/</a></p>

<p><font style="vertical-align:inherit">Selenium Grid 允许在远程机器上执行 WebDriver 脚本 通过将客户端发送的命令路由到远程浏览器实例。 </font></p>

<p><font style="vertical-align:inherit">网格旨在： </font></p>

<ul>
	<li><font style="vertical-align:inherit">提供一种在多台机器上并行运行测试的简单方法 </font></li>
	<li><font style="vertical-align:inherit">允许在不同的浏览器版本上进行测试 </font></li>
	<li><font style="vertical-align:inherit">启用跨平台测试 </font></li>
</ul>

<p>选择版本后，下载，安装：</p>

<pre>
<code>chmod +x selenium-server-4.4.0.jar
./selenium-server-4.4.0.jar{% endhighlight %}

<p><img height="611" src="/uploads/ckeditor/pictures/347/image-20220829110838-1.png" width="919" /></p>

<p>脚本：</p>

<pre>
<code>require &#39;selenium-webdriver&#39; driver = Selenium::WebDriver.for :chrome driver.get &#39;https://selenium.dev&#39; driver.quit{% endhighlight %}

<p>然后运行的时候出现了：Unable to find chromedriver. Please download the server from (Selenium::WebDriver::Error::WebDriverError</p>

<p><img height="387" src="/uploads/ckeditor/pictures/348/image-20220829111554-1.png" width="1913" /></p>

<p><a href="https://stackoverflow.com/questions/19862276/unable-to-find-the-chromedriver-executable">https://stackoverflow.com/questions/19862276/unable-to-find-the-chromedriver-executable</a></p>

<p>解决：</p>

<pre>
<code>sudo apt-get install chromium-chromedriver{% endhighlight %}

<p>再次运行命令，执行脚本：</p>

<p><img height="1047" src="/uploads/ckeditor/pictures/349/image-20220829111708-2.png" width="982" /></p>

<p>下载：<a href="https://github.com/mozilla/geckodriver/releases">https://github.com/mozilla/geckodriver/releases</a></p>

<p>其他版本：<a href="https://www.selenium.dev/documentation/webdriver/getting_started/install_drivers/">https://www.selenium.dev/documentation/webdriver/getting_started/install_drivers/</a></p>

<p><span class="line"><span class="comment">查看版本：(多种方式查看：<a href="https://blog.csdn.net/weixin_34534456/article/details/116808628">https://blog.csdn.net/weixin_34534456/article/details/116808628）</a></span></span></p>

<p><span class="line"><span class="comment">uname -m</span></span></p>

<p><img height="184" src="/uploads/ckeditor/pictures/351/image-20220829113804-2.png" width="1088" /></p>

<p>解压：</p>

<p>tar -zxvf geckodriver-v0.31.0-linux64.tar.gz</p>

<p>使用方式：(大多数机器会自动更新浏览器，但驱动程序不会。&nbsp; 为确保您获得正确的浏览器驱动程序，有许多第三方库可以为您提供帮助。</p>

<p>第一种：</p>

<p>gem &#39;webdrivers&#39;, &#39;~&gt; 5.0&#39;</p>

<p>第二种：</p>

<p>require &#39;webdrivers&#39;</p>

<p>第三种:</p>

<p>driver = Selenium::WebDriver.for :chrome</p>

<p>使用：</p>

<p>./geckodriver</p>

<p><img height="184" src="/uploads/ckeditor/pictures/350/image-20220829113643-1.png" width="1088" /></p>

<p>安装 Selenium 库<br />
&nbsp;为您最喜欢的编程语言设置 Selenium 库。</p>

<p>&nbsp;首先，您需要为自动化项目安装硒绑定。&nbsp; 库的安装过程取决于您选择使用的语言。&nbsp; 确保检查硒下载页面以确保您使用的是最新版本。</p>

<p>gem install selenium-webdriver</p>

<p>或者添加</p>

<p>gem &#39;selenium-webdriver&#39;, &#39;~&gt; 4.4&#39;</p>

<p>此时，运行脚本的时候，需要使用</p>

<p>./geckodriver<br />
1661754159322&nbsp;&nbsp; &nbsp;geckodriver&nbsp;&nbsp; &nbsp;INFO&nbsp;&nbsp; &nbsp;Listening on 127.0.0.1:4444</p>

<p>在另一个窗口打开</p>

<p>ruby xxx.rb</p>

<p>这样就可以打开浏览页面。</p>

