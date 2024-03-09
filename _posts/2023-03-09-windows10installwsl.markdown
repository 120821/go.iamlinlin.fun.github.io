---
layout: post
title: "windows10 install wsl"
date: "2023-03-09"
categories: 
---
<p>无法下载Windows store，所以不使用应用市场直接安装：</p>

<p>refer：&nbsp;<a href="https://www.jianshu.com/p/87a0b7ef9f51">https://www.jianshu.com/p/87a0b7ef9f51</a></p>

<p>0.1提前进行准备环境：（refer： <a href="https://blog.csdn.net/mengjian11111/article/details/125188584">https://blog.csdn.net/mengjian11111/article/details/125188584</a>）</p>

<p>Windows功能下相关模块开启:Hyper-V、适用于Linux的Windows子系统、虚拟机平台这几项需要开启，Windows功能可以通过控制面板-&gt;程序-&gt;程序和功能-&gt;启用或关闭Windows功能查看到。</p>

<p>1.直接下载kali Linux：<a href="https://aka.ms/wsl-kali-linux-new">https://aka.ms/wsl-kali-linux-new</a>, 应该会很慢，但是没关系。等。可以先尝试2</p>

<p>其他版本的链接：<a href="https://links.jianshu.com/go?to=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fwindows%2Fwsl%2Finstall-manual%23downloading-distributions">https://links.jianshu.com/go?to=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fwindows%2Fwsl%2Finstall-manual%23downloading-distributions</a>（有需要可以看一下）</p>

<p>2.WSL：需要升级wsl内核为WSL2，<a href="https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi">点击下载升级</a>， 下载完成后就install。</p>

<p>如果你的Windows版本不支持Microsoft Store，或者&ldquo;可选功能&rdquo;页面上没有&ldquo;Windows Subsystem for Linux&rdquo;选项，你可以尝试通过以下步骤手动启用WSL：</p>

<ul>
	<li>1. 打开Windows PowerShell（管理员权限）。</li>
	<li>2. 运行以下命令：</li>
</ul>

<p><code>&nbsp;dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart</code></p>

<p>&nbsp;如果出现了报错：</p>

<p>Suggestion [3,General]: 找不到命令 dism.exe，但它确实存在于当前位置。默认情况下，Windows PowerShell 不会从当前位置加载命令。如果信任此命令，请改为键入&ldquo;.\dism.exe&rdquo;。有关详细信息，请参阅 &quot;get-help about_Command_Precedence&quot;。</p>

<p>使用以下命令：</p>

<p>PS C:\Windows\system32&gt;<code> ./dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart</code></p>

<p><code>部署映像服务和管理工具<br />
版本: 10.0.17763.3406</code></p>

<p><code>映像版本: 10.0.17763.4131</code></p>

<p><code>启用一个或多个功能<br />
[==================&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32.5%</code></p>

<p><code>提示操作完成即可：</code></p>

<p><code>映像版本: 10.0.17763.4131</code></p>

<p><code>启用一个或多个功能<br />
[==========================100.0%==========================]<br />
操作成功完成。</code></p>

<ul>
	<li>3. 运行以下命令以启用虚拟机功能：</li>
	<li><code>&nbsp;&nbsp;&nbsp; dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart</code></li>
	<li><code>同上，如果出现了错误：</code></li>
	<li>
	<p><code>Suggestion [3,General]: 找不到命令 dism.exe，但它确实存在于当前位置。默认情况下，Windows PowerShell 不会从当前位置加载命令。如果信任此命令，请改为键入&ldquo;.\dism.exe&rdquo;。有关详细信息，请参阅 &quot;get-help about_Command_Precedence&quot;。</code><br />
	那么就使用以下命令：</p>
	</li>
	<li>
	<p><code>PS C:\Windows\system32&gt; ./dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart</code></p>

	<p><code>部署映像服务和管理工具<br />
	版本: 10.0.17763.3406</code></p>

	<p><code>映像版本: 10.0.17763.4131</code></p>

	<p><code>启用一个或多个功能<br />
	[==========================100.0%==========================]<br />
	操作成功完成。</code></p>
	</li>
	<li>4. 重新启动计算机。</li>
	<li>5. 下载并安装&ldquo;WSL2 Linux内核更新包&rdquo;，可以在此处下载：<a href="http://https://docs.microsoft.com/zh-cn/windows/wsl/wsl2-kernel"><code> https://docs.microsoft.com/zh-cn/windows/wsl/wsl2-kernel</code></a></li>
	<li>6. 安装完后，打开Microsoft Store并搜索你想要的Linux发行版，例如Ubuntu、Debian等。</li>
	<li>请注意，WSL2需要在Windows 10版本2004或更高版本上运行。如果你的Windows版本太旧，可能无法通过这种方式安装WSL。</li>
</ul>

<p>&nbsp;</p>

