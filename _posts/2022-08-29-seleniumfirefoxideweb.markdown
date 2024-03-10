---
layout: post
title: "selenium firefox IDEWeb 的开源记录和回放测试自动化"
date: "2022-08-29"
categories: 
---
<p><a href="https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/">https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/</a>（Web 的开源记录和回放测试自动化）</p>
<p><a href="https://blog.csdn.net/qq_39364032/article/details/108469263?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-108469263-blog-124962948.t5_layer_eslanding_C_0&amp;spm=1001.2101.3001.4242.1&amp;utm_relevant_index=2">参考</a></p>
<p>Selenium IDE 是用于 Selenium 测试的集成开发环境。&nbsp; 它作为 Firefox 扩展实现，允许您记录、编辑和调试测试。</p>
<p>安装：<font style="vertical-align:inherit">从 </font><a href="https://chrome.google.com/webstore/detail/selenium-ide/mooikfkahbdckldjjndioackbalphokd" rel="noopener noreferrer" target="_blank"><font style="vertical-align:inherit">Chrome </font></a><font style="vertical-align:inherit">或 </font><a href="https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/" rel="noopener noreferrer" target="_blank"><font style="vertical-align:inherit">Firefox </font></a><font style="vertical-align:inherit">网上商店安装 Selenium IDE。 </font></p>
<p><img height="1040" src="/uploads/ckeditor/pictures/343/image-20220829095312-1.png" width="1444" /></p>
<p><font style="vertical-align:inherit">安装后，通过单击浏览器菜单栏中的图标来启动它：</font>安装完成可以在浏览器进行使用，点击se按钮，进行使用，也可以查看更多使用方法：<a href="https://www.selenium.dev/selenium-ide/">https://www.selenium.dev/selenium-ide/</a></p>
<p><font style="vertical-align:inherit">启动 IDE 后，您将看到一个欢迎对话框。 </font></p>
<p><font style="vertical-align:inherit">这将使您能够快速访问以下选项： </font></p>
<ul>
<li><font style="vertical-align:inherit">在新项目中记录新测试 </font></li>
<li><font style="vertical-align:inherit">打开现有项目 </font></li>
<li><font style="vertical-align:inherit">创建一个新项目 </font></li>
<li><font style="vertical-align:inherit">关闭 IDE </font></li>
</ul>
<p><font style="vertical-align:inherit">如果这是您第一次使用 IDE（或者您正在开始一个新项目），请选择第一个选项。 </font></p>
<p><img height="916" src="/uploads/ckeditor/pictures/345/image-20220829100201-1.png" width="1303" /></p>
<p><font style="vertical-align:inherit">创建新项目后，系统会提示您为其命名，然后要求您提供基本 URL。 基本 URL 是您正在测试的应用程序的 URL。 这是你设置一次的东西，它会在这个项目的所有测试中使用。 如果需要，您可以稍后更改它。 </font></p>
<p><font style="vertical-align:inherit">完成这些设置后，将打开一个新的浏览器窗口，加载基本 URL，并开始录制。 </font></p>
<p><font style="vertical-align:inherit">与页面交互，您的每个操作都将记录在 IDE 中。 要停止录制，请切换到 IDE 窗口并单击录制图标。 </font></p>
<p>结束后，可以保存数据，选择保存的语言，在编辑器查看详情。</p>
<p><img height="737" src="/uploads/ckeditor/pictures/346/%E5%9B%BE%E7%89%87.png" width="818" /></p>
<p>&nbsp;</p>
