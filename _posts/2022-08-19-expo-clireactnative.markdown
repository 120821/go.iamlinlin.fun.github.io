---
layout: post
title: "用 expo-cli设置一个新的 React Native 应用程序"
date: "2022-08-19"
categories: 
---
<p><a href="https://www.reactnative.express/environment/quick_start">快速开始</a></p>

<p>1.<font style="vertical-align:inherit">安装 </font><a class="sc-fzoJMP eDewpD" href="https://docs.expo.io/versions/latest/workflow/expo-cli/"><code class="sc-fznMnq kEGdgu">expo-cli</code></a><font style="vertical-align:inherit">，一个用于处理 React Native 项目的命令行工具</font></p>

<pre class="sc-fzpkJw ickbIB">
<code class="sc-fznzOf dOLHfr language-bash">npm install --global expo-cli</code></pre>

<p><font style="vertical-align:inherit">1.1 使用 expo-cli 创建一个新应用程序</font></p>

<pre class="sc-fzpkJw ickbIB">
<code class="sc-fznzOf dOLHfr language-bash">expo init MyApp --template blank
cd MyApp
npm start</code></pre>

<p class="sc-fzolEj cQxQWb"><code class="sc-fznMnq kEGdgu">expo-cli</code><font style="vertical-align:inherit">下载依赖项可能需要几分钟。 （真的非常慢）</font></p>

<blockquote class="sc-fzqBkg dMPfra">
<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">如果你有 </font><code class="sc-fznMnq kEGdgu">yarn</code><font style="vertical-align:inherit">安装后，Expo 会询问您是否要使用 </font><code class="sc-fznMnq kEGdgu">yarn</code><font style="vertical-align:inherit">代替 </font><code class="sc-fznMnq kEGdgu">npm</code><font style="vertical-align:inherit">. 无论哪种方式都很好。 </font></p>
</blockquote>

<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">完成后你应该会看到这样的二维码： </font></p>

<p class="sc-fzolEj cQxQWb"><img class="sc-fzoYkl hfPoTr" src="https://www.reactnative.express/_next/static/images/createnativeapp-8724b3b7d8d90eb619925cff699ce07a.png" style="width: 550px; max-width: 100%;" /></p>

<p class="sc-fzolEj cQxQWb">但是，我没有看到二维码：</p>

<p class="sc-fzolEj cQxQWb"><img height="795" src="/uploads/ckeditor/pictures/284/image-20220819094205-1.png" width="1920" /></p>

<p class="sc-fzolEj cQxQWb">根据提示，进入项目文件夹，</p>

<p class="sc-fzolEj cQxQWb"><img height="446" src="/uploads/ckeditor/pictures/285/image-20220819094353-2.png" width="1207" /></p>

<p class="sc-fzolEj cQxQWb">然后使用命令，就会看到二维码：</p>

<p class="sc-fzolEj cQxQWb"><img height="728" src="/uploads/ckeditor/pictures/286/image-20220819094516-3.png" width="905" /></p>

<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">你刚刚创建了你的第一个 React Native 应用程序！ 上安装Expo Client </font><a class="sc-fzoJMP eDewpD" href="https://itunes.apple.com/us/app/expo-client/id982107779?mt=8"><font style="vertical-align:inherit">iOS </font></a><font style="vertical-align:inherit">或 </font><a class="sc-fzoJMP eDewpD" href="https://play.google.com/store/apps/details?id=host.exp.exponent&amp;hl=en"><font style="vertical-align:inherit">Android </font></a><font style="vertical-align:inherit">并扫描二维码查看。 </font></p>

<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">看到这里，就成功了！ 您已准备好开始开发新的 React Native 应用程序。 </font></p>

<p class="sc-fzolEj cQxQWb"><img class="sc-fzoYkl hfPoTr" src="https://www.reactnative.express/_next/static/images/expo-87f5bdb79f467694f2024ae9a191d9c4.png" style="width: 400px; max-width: 100%;" /></p>

<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">尝试更改文本 </font><code class="sc-fznMnq kEGdgu">App.js</code><font style="vertical-align:inherit">，保存文件，并在您的设备上观看它的更新。</font></p>

<p class="sc-fzolEj cQxQWb"><font style="vertical-align:inherit">现在您已经建立了一个项目，让我们开始了解您将使用的一些重要的 JavaScript 语言功能。 如果您已经熟悉每一个，请跳到 </font><a class="sc-fzoJMP eDewpD" href="https://www.reactnative.express/react"><font style="vertical-align:inherit">React </font></a><font style="vertical-align:inherit">以了解有关 React 的更多信息。 如果您已经熟悉 React，请跳至 </font><a class="sc-fzoJMP eDewpD" href="https://www.reactnative.express/core_components"><font style="vertical-align:inherit">核心组件 </font></a><font style="vertical-align:inherit">以了解 React Native 框架提供的组件。 </font></p>

<p class="sc-fzolEj cQxQWb">&nbsp;</p>

