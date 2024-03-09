---
layout: post
title: "Rufus ubuntu wsl"
date: "2023-04-25"
categories: 
---
<p>1.安装 wsl 1</p>

<p>要在 Windows 10 中安装 WSL 1，请按照以下步骤进行操作：</p>

<ul>
	<li>1. 打开 Windows 功能。</li>
	<li>2. 在开始菜单中搜索&ldquo;Windows 功能&rdquo;并单击&ldquo;打开&rdquo;。</li>
	<li>3. 在&ldquo;Windows 功能&rdquo;窗口中，找到&ldquo;适用于 Linux 的 Windows 子系统&rdquo;选项。</li>
	<li>4. 将其选中，然后单击&ldquo;确定&rdquo;。</li>
	<li>5. 等待一段时间，直到功能安装完毕。系统可能需要您重新启动计算机。</li>
	<li>6. 打开 Microsoft Store 应用商店。</li>
	<li>7. 在搜索栏中搜索您想要安装的 Linux 发行版，例如 Ubuntu。</li>
	<li>8. 单击&ldquo;获取&rdquo;按钮以开始下载和安装发行版。</li>
	<li>9. 安装完成后，可通过在开始菜单中搜索&ldquo;Ubuntu&rdquo;或其他 Linux 发行版名称来打开它。</li>
	<li>10. 打开 Linux 终端，开始使用 WSL 1！</li>
</ul>

<p>请注意，需要使用 Windows 10 版本 1903 或更高版本才能使用 WSL 1。</p>

<p>2.Windows 10 版本 18xx应该怎么安装wsl</p>

<p>如果您的 Windows 10 版本是 1803 或 1809，则可以按照以下步骤安装 WSL 1：</p>

<ul>
	<li>1. 在开始菜单中搜索&ldquo;控制面板&rdquo;，并单击打开。</li>
	<li>2. 选择&ldquo;程序&rdquo; -&gt; &ldquo;启用或关闭 Windows 功能&rdquo;。</li>
	<li>3. 滚动到底部，找到&ldquo;适用于 Linux 的 Windows 子系统&rdquo;选项。选中该选项，单击&ldquo;确定&rdquo;。</li>
	<li>4. 系统会提示您重新启动计算机。请保存所有未保存的工作，并关闭所有应用程序。</li>
	<li>5. 等待计算机重新启动完成。</li>
	<li>6. 打开 Microsoft Store 应用商店。</li>
	<li>7. 在搜索栏中搜索您想要安装的 Linux 发行版，例如 Ubuntu。</li>
	<li>8. 点击&ldquo;获取&rdquo;以下载和安装发行版。</li>
	<li>9. 完成后，打开发行版并创建您的 Linux 用户帐户。</li>
	<li>10. 现在，您已经可以在 Windows 10 上使用 WSL 1 了！</li>
	<li>请注意，WSL 要求 Windows 10 版本至少为 16215 版或更高版本。如果您的计算机不满足要求，请先升级 Windows 10，然后再按照上述步骤安装 WSL 1。</li>
</ul>

<p>3.Windows 10 版本 18xx应该怎么安装使用linux</p>

<ul>
	<li>对于 Windows 10 版本 1803 或更高版本，Microsoft 提供了 Windows Subsystem for Linux（WSL）功能，可以在 Windows 中运行 Linux 子系统。以下是安装和使用 WSL 的步骤：</li>
	<li>1. 打开&ldquo;控制面板&rdquo;，选择&ldquo;程序&rdquo; -&gt; &ldquo;启用或关闭 Windows 功能&rdquo;，选中&ldquo;适用于 Linux 的 Windows 子系统&rdquo;。</li>
	<li>2. 从 Microsoft Store 下载和安装您选择的 Linux 发行版，例如 Ubuntu。</li>
	<li>3. 安装完成后，从开始菜单中打开&ldquo;Ubuntu&rdquo;（或者您选择的 Linux 发行版）。</li>
	<li>4. 第一次运行时，要求创建 Linux 用户名和密码。请注意，这些用户名和密码不同于您的 Windows 登录凭据。</li>
	<li>5. 在 Linux 终端中，可以使用各种 Linux 命令和应用程序，例如 bash、vim、git 等。</li>
	<li>6. Linux 文件系统的根目录（/）位于 C:\Users\用户名\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_8wekyb3d8bbwe\LocalState\rootfs\ 中。</li>
	<li>在 WSL 中使用的文件和文件系统仅在 Linux 子系统中可访问，并不会对 Windows 操作系统造成直接的影响。如果需要在 Windows 和 Linux 之间共享文件，可以使用共享文件夹或网络共享等功能。</li>
	<li>请注意，WSL 实际上是在 Windows 中运行一个虚拟机，因此可能会对系统资源产生一定的负担。如果需要更高性能或更完整的 Linux 环境，可以考虑使用虚拟机软件或双启动方式来安装 Linux 操作系统。</li>
</ul>

<p>4.rufus没有ubuntu的镜像的选择是什么原因</p>

<p>Rufus是一个开源的Windows下的USB启动盘制作工具，它并不提供Ubuntu镜像的选择，原因可能有以下几点：</p>

<ul>
	<li>1. Rufus的开发者选择只提供一些常见的操作系统镜像，以保持软件的轻量级和易用性。</li>
	<li>2. Rufus可能并不支持所有版本的Ubuntu镜像，如果开发者提供了Ubuntu镜像的选择，就需要保证支持所有版本的Ubuntu，这会增加维护和更新的难度。</li>
	<li>3. 用户可以手动选择下载Ubuntu镜像并使用Rufus制作启动盘，这也是一个常见的做法。</li>
	<li>总之，Rufus没有Ubuntu镜像的选择并不影响用户制作Ubuntu的启动盘，只需要手动下载镜像文件即可。</li>
</ul>

<p>5.rufus 选择非引导，还可以安装ubuntu吗？</p>

<p>如果你在Rufus中选择&ldquo;非引导&rdquo;选项，那么Rufus会将Ubuntu镜像文件仅仅拷贝到USB闪存驱动器中，并不会将其制作成引导盘（Bootable），因此在这种情况下，你可能不能够使用该U盘安装Ubuntu操作系统。</p>

<p>为了在U盘上制作一个可引导的Ubuntu安装盘，应该选择&ldquo;引导&rdquo;选项，然后选择相应的Ubuntu镜像进行制作。请注意，如果你想将Ubuntu安装盘制作成UEFI模式的启动盘，可以选择GPT分区方式；如果选择传统的BIOS boot模式，建议使用MBR分区风格。</p>

<p>总之，在使用Rufus制作Ubuntu启动盘时，请确保选对启动类型和分区风格以获得最佳的效果。</p>

<p>6.怎么使用rufus刻录ubuntu22?</p>

<p>以下是使用Rufus制作Ubuntu 22.04的步骤：</p>

<ul>
	<li>1. 首先，你需要先下载Ubuntu 22.04的镜像文件，在Ubuntu官网上进行下载即可。</li>
	<li>2. 接下来，你需要下载并安装最新版本的Rufus，确保从官方网站下载并安装，以获得最佳的性能和稳定性。</li>
	<li>3. 连接可写入的USB闪存驱动器到计算机上，并打开Rufus应用程序。</li>
	<li>4. 在Rufus的主界面上，选择你连接的USB闪存驱动器，并确保文件系统为FAT32。</li>
	<li>5. 点击&ldquo;引导选择&rdquo;按钮，并选择Ubuntu 22.04的ISO镜像文件。</li>
	<li>6. 在&ldquo;分区模式&rdquo;下，选择你想要的分区模式（MBR或GPT），并在&ldquo;目标系统&rdquo;下选择&ldquo;BIOS或UEFI&rdquo;。</li>
	<li>7. 点击&ldquo;开始&rdquo;按钮，开始制作Ubuntu 22.04启动盘，整个过程可能需要几分钟时间。</li>
	<li>8. 制作完成后，关闭Rufus，然后将制作好的Ubuntu 22.04启动盘插入到需要安装Ubuntu的计算机上，重启计算机并从U盘启动。</li>
	<li>9. 在Ubuntu安装程序中按照提示操作，以完成Ubuntu 22.04的安装。</li>
	<li>总之，以上是使用Rufus制作Ubuntu 22.04的步骤，记得选择正确的启动类型和分区类型，以获得最佳的结果。</li>
</ul>

<p>7.windows 10 x32 没有快速电源启动的选项，应该怎么启动BIOS设置？</p>

<p>如果你的Windows 10 x32系统没有快速电源启动选项，你可以尝试以下几种方法：</p>

<p>方法一：使用Windows 10的高级启动选项</p>

<ul>
	<li>1. 单击&ldquo;开始&rdquo;按钮，并选择&ldquo;电源&rdquo;选项，然后按住Shift键并单击&ldquo;重新启动&rdquo;按钮。</li>
	<li>2. 选择&ldquo;故障排除&rdquo; &gt; &ldquo;高级选项&rdquo; &gt; &ldquo;UEFI固件设置&rdquo;（如果你的计算机安装的是UEFI固件）或&ldquo;BIOS设置&rdquo;（如果你的计算机安装的是传统BIOS固件）。</li>
	<li>3. 点击&ldquo;重新启动&rdquo;按钮，然后你的系统将会自动进入到BIOS设置界面。</li>
</ul>

<p>方法二：使用Windows设置菜单</p>

<ul>
	<li>1. 单击&ldquo;开始&rdquo;按钮，选择&ldquo;设置&rdquo;选项。</li>
	<li>2. 选择&ldquo;更新和安全&rdquo; &gt; &ldquo;恢复&rdquo; &gt; &ldquo;高级启动&rdquo; &gt; &ldquo;立即重新启动&rdquo;按钮。</li>
	<li>3. 选择&ldquo;故障排除&rdquo; &gt; &ldquo;高级选项&rdquo; &gt; &ldquo;UEFI固件设置&rdquo;（如果你的计算机安装的是UEFI固件）或&ldquo;BIOS设置&rdquo;（如果你的计算机安装的是传统BIOS固件）。</li>
	<li>4. 点击&ldquo;重新启动&rdquo;按钮，然后你的系统将会自动进入到BIOS设置界面。</li>
	<li>方法三：使用计算机制造商提供的方法</li>
</ul>

<p>你可以查看计算机制造商提供的文档或手册，了解如何进入到BIOS设置界面。通常在开机时会有提示键入某个键进入BIOS设置界面，所以你可以尝试按照提示进行操作。</p>

<p>总之，以上是在Windows 10 x32系统中进入BIOS设置的方法，如果你仍无法进入BIOS设置，请查看计算机制造商提供的文档或手册，或联系技术支持寻求帮助。</p>

<p>8.电脑怎么进入启动项设置</p>

<p>不同品牌的电脑进入启动项设置的方法可能不同，以下是几种常见电脑品牌的方法：</p>

<ul>
	<li>1. 进入启动项设置 - 华硕电脑</li>
	<li>开机时按下DEL或F2键进入BIOS设置，然后找到&ldquo;Boot&rdquo;或&ldquo;启动&rdquo;选项卡，选择需要先启动的设备，如硬盘、光驱、U盘等。</li>
	<li>2. 进入启动项设置 - 联想电脑</li>
	<li>开机时按下F12、F1、F2或Novo按键（一般在电源键旁边，可能需要长按数秒）进入启动项设置。如果是Windows 10系统，可以在&ldquo;开始&rdquo;菜单中的&ldquo;设置&rdquo; &rarr; &ldquo;更新和安全&rdquo; &rarr; &ldquo;恢复&rdquo; &rarr; &ldquo;立即重新启动&rdquo; &rarr; &ldquo;Troubleshoot&rdquo; &rarr; &ldquo;Advanced options&rdquo; &rarr; &ldquo;UEFI Firmware Settings&rdquo;中进入BIOS设置。</li>
	<li>3. 进入启动项设置 - 戴尔电脑</li>
	<li>开机时按下F12或F2键进入BIOS设置，然后找到&ldquo;Boot Sequence&rdquo;选项卡，设置启动次序。</li>
	<li>4. 进入启动项设置 - HP电脑</li>
	<li>开机时按下F10键进入BIOS设置，然后找到&ldquo;System Configuration&rdquo;选项卡，选择&ldquo;Boot Options&rdquo;进入启动项设置。</li>
	<li>5. 进入启动项设置 - ThinkPad电脑</li>
	<li>开机时按下F1键进入BIOS设置，找到&ldquo;Startup&rdquo;选项卡，设置启动次序。</li>
	<li>总之，进入不同电脑品牌的启动项设置，需要不同的按键或方法。如果你不确定自己的电脑具体要按哪个键，则可以在开机时反复按下F12、F2、F1等键，查看是否进入了BIOS设置或启动项设置。</li>
</ul>

<p>9.bios 没有Support怎么操作？</p>

<p>如果你在BIOS中没有找到&quot;Support&quot;选项，则可能是因为该选项在你的电脑BIOS中不存在。不同品牌和型号的电脑BIOS可能会有所不同，一些较老的电脑可能会缺少某些高级设置选项。</p>

<p>通常，&quot;Support&quot;选项通常与CPU虚拟化相关，如果你需要开启虚拟化功能，可以按照以下步骤操作：</p>

<ul>
	<li>1. 开机时按下电脑制造商提供的进入BIOS的按键，如Del、F2、F10等。</li>
	<li>2. 进入BIOS后，找到&quot;Advanced&quot;或&quot;Security&quot;选项卡，查找CPU虚拟化选项（通常被称为VT-x或AMD-V）。</li>
	<li>3. 如果虚拟化选项处于关闭状态，将其开启并保存更改。</li>
</ul>

<p>注意：虚拟化功能的开启可能会影响电脑的性能，同时也可能不利于电脑的稳定性。因此，如果你不确定是否需要开启虚拟化功能，请谨慎操作，在开启前先了解一下虚拟化的相关知识。</p>

<p>10.bios2.20.1275应该怎么选择进行ubuntu的设置？</p>

<p>在BIOS 2.20.1275中设置Ubuntu的方法如下：</p>

<ul>
	<li>1. 开机时按下对应键进入BIOS设置界面（可能是Del、F2、F10或其他键）。</li>
	<li>2. 找到&ldquo;Boot&rdquo;选项，如果有&ldquo;Boot Option Priorities&rdquo;选项，可以先进入该选项进行设置。</li>
	<li>3. 将启动顺序设置为首选从USB设备（U盘）启动，或者首选从DVD或CD启动，然后按F10保存设置并退出BIOS。</li>
	<li>4. 将Ubuntu安装文件（.iso镜像）写入U盘或DVD/CD中。</li>
	<li>5. 将U盘或DVD/CD插入电脑，并重启电脑，按下对应键进入启动选择界面，选择U盘或DVD/CD启动。</li>
	<li>6. 进入Ubuntu安装界面后，按照提示进行安装和设置。如果需要，可以在安装过程中对分区进行设置和调整。</li>
	<li>7. 安装完成后，重启电脑，进入已安装的Ubuntu系统。</li>
</ul>

<p>注意事项：</p>

<p>在更改BIOS设置时，应该仔细检查所有设置，以确保在不影响其他操作系统的情况下进行修改。</p>

<p>在Ubuntu安装之前，建议先备份所有重要数据。</p>

<p>如果您不确定如何进行这些操作，请考虑寻求有经验的电脑技术人员的帮助。</p>

<p>11.rufus设置后找不到ubuntu的iso文件了, 怎么做？</p>

<p>如果您在使用Rufus创建Ubuntu引导U盘时，发现在设置后找不到Ubuntu的ISO文件，请尝试以下方法：</p>

<ul>
	<li>1. 确认ISO文件路径是否正确。在Rufus创建U盘时，需要手动选择Ubuntu的ISO文件，并指定它的路径。请检查路径是否输入正确。</li>
	<li>2. 更换ISO文件。有时候ISO文件可能会损坏或不完整，导致Rufus无法识别文件。您可以重新下载Ubuntu的ISO文件，并选择新的ISO文件进行创建。</li>
	<li>3. 确认U盘是否正确插入。有时候U盘可能没有正确插入，导致Rufus无法对其进行操作。请将U盘正确插入电脑，并重新打开Rufus进行创建。</li>
	<li>4. 检查Rufus的版本是否正确。不同版本的Rufus在用户界面上可能有所不同，操作也会有所不同。请确保您使用的是最新版的Rufus，并参考正确的教程进行操作。</li>
	<li>5. 关闭安全软件。如果您的电脑上有安全软件（如杀毒软件、防火墙等），请尝试关闭它们，并重新运行Rufus进行创建。</li>
</ul>

<p>如果以上方法仍然无法解决问题，可以考虑尝试使用其他的制作启动盘的工具，例如Etcher或Win32DiskImager等。</p>

<p>12.u盘拒绝访问怎么解决？</p>

<p>当U盘拒绝访问时，可能是由于以下原因之一引起的：</p>

<ul>
	<li>1. U盘已经受损。U盘可能受到物理损坏、电路短路或其它原因导致出现故障。在这种情况下，最好更换新的U盘。</li>
	<li>2. U盘被格式化，或存在文件系统错误。在这种情况下，您可以尝试通过格式化U盘来修复。但是，这将清除U盘上的所有数据。如果您没有备份重要的数据，可能会导致数据丢失。您也可以尝试使用数据恢复软件来恢复U盘中的数据。</li>
	<li>3. U盘包含恶意软件。当U盘在受到恶意软件感染时，可能会拒绝访问。这是出于安全考虑。为了解决这个问题，需要在杀毒软件中运行全盘扫描，或使用专门的恶意软件清除工具。</li>
	<li>4. U盘已被写保护。如果您已经启用了U盘的写保护功能，您可能无法将其用作可写存储设备。您可以尝试使用U盘转换工具来去除写保护。</li>
	<li>无论什么原因，以下是一些可能有助于解决U盘拒绝访问问题的常见解决方法：</li>
	<li>1. 尝试在另一台计算机上访问U盘，看看是否可以访问。</li>
	<li>2. 尝试在Windows资源管理器中通过以下方式运行chkdsk命令来检查和修复U盘中的文件系统错误：</li>
	<li>&nbsp;&nbsp; a. 打开资源管理器，并右键单击U盘图标。</li>
	<li>&nbsp;&nbsp; b. 选择&ldquo;属性&rdquo;。</li>
	<li>&nbsp;&nbsp; c. 单击&ldquo;工具&rdquo;选项卡，然后单击&ldquo;检查&rdquo;按钮。</li>
	<li>&nbsp;&nbsp; d. 勾选&ldquo;自动修复文件系统错误&rdquo;和&ldquo;扫描并尝试恢复坏扇区&rdquo;，然后单击&ldquo;开始&rdquo;。</li>
	<li>3. 尝试使用U盘修复工具或U盘格式化工具（如HP格式化工具或DiskGenius等）格式化U盘。</li>
	<li>4. 尝试使用杀毒软件对U盘进行全盘扫描，清除所有恶意软件。</li>
	<li>如果以上方法都不能解决问题，请尝试联系厂家或制造商以获得更多支持。</li>
</ul>

<p>13，使用rufus后不能在使用U盘了吗？</p>

<p>使用Rufus软件将U盘格式化为可引导的盘后，您仍然可像平常一样在计算机上使用U盘。</p>

<p>请注意，Rufus将U盘格式化为引导盘后，将其文件系统更改为FAT32、NTFS或其他格式，这可能导致U盘上的所有数据被删除。因此，在使用Rufus之前，请务必备份U盘上的所有数据。如果您无意丢失U盘上的数据，请不要使用Rufus来格式化您的U盘。</p>

<p>此外，如果您将U盘用于引导目的，则需要牢记该U盘已被分区和格式化，不应再用作普通数据存储设备。</p>

<p>14.rufus分区成功的目录应该是什么？</p>

<p>在使用 Rufus 分区 U 盘时，成功完成分区后，应该可以看到 U 盘根目录下面的所有文件和文件夹，其中包括可引导 U 盘引导文件（通常是 bootmgr 和 bootmgr.efi）。还应该出现一个名为 Rufus 的文件夹，其中包含了一些 Rufus 制作 U 盘时使用的工具和文件。这些工具和文件可能与您的具体操作系统和 Rufus 版本有关。</p>

<p>请注意，这仅适用于您已经使用了 Rufus 来分区 U 盘。如果您在使用 Rufus 之前已经在 U 盘上建立了分区，那么应该会出现与您自己建立的分区相关的目录和文件。</p>

<p>15.怎么安装下载WSL2 Linux</p>

<p>安装 WSL2 Linux 的步骤如下：</p>

<ul>
	<li>1. 确认 Windows 是否支持 WSL2</li>
	<li>首先需要确认系统是否支持 WSL2。可以按下 Windows+R 快捷键打开运行窗口，输入&ldquo;winver&rdquo;查看 Windows 版本信息。只有 Windows 10 1903 版本及其以上的版本才支持 WSL2。</li>
	<li>2. 启用 WSL 功能</li>
	<li>按下 Windows+R 快捷键打开运行窗口，输入&ldquo;optionalfeatures&rdquo;打开 Windows 功能界面。然后找到&ldquo;适用于 Linux 的 Windows 子系统&rdquo;功能，勾选启用，点击确定并等待系统提示重启后，在重启后可以在 Microsoft Store 中下载和安装 Linux 发行版。</li>
	<li>3.&nbsp; 安装 Linux 发行版</li>
	<li>在 Microsoft Store 中搜索并下载安装 Linux 发行版，例如 Ubuntu 或 CentOS。下载和安装过程可能需要一些时间。</li>
	<li>4. 启动 Linux 发行版并设置账户</li>
	<li>完成安装后，在 Windows 10 的搜索框中输入 Linux 发行版名称，选择打开并等待安装完成。第一次打开 Linux 时需要设置账户用户名和密码。</li>
	<li>接下来就可以在安装的 Linux 发行版中使用各种 Linux 命令和软件了，例如在 Linux 中安装和运行 Python、Node.js、Java、MySQL 等。</li>
</ul>

<p>16，Windows 10 18xx应该怎么使用wsl</p>

<p>Windows 10 18xx 操作系统支持 WSL（Windows Subsystem for Linux）功能，使用 WSL 可以在 Windows 操作系统上运行 Linux 应用程序和命令行工具。以下是使用 WSL 的步骤：</p>

<ul>
	<li>1. 启用 WSL 功能：打开 &ldquo;控制面板&rdquo; &gt; &ldquo;程序&rdquo; &gt; &ldquo;启用或关闭 Windows 功能&rdquo; &gt; 勾选 &ldquo;适用于 Linux 的 Windows 子系统&rdquo; &gt; 确定 &gt; 重启。</li>
	<li>2. 安装 Linux 发行版: 在应用商店中下载并安装 Linux 发行版，例如 Ubuntu、Debian、SUSE 或者 Kali Linux。</li>
	<li>3. 打开 Linux 发行版：在开始菜单中搜索已安装的 Linux 发行版，点击打开。</li>
	<li>4. 设置 Linux 用户名和密码：在开始菜单中打开已安装的 Linux 发行版，需要设置 Linux 用户名和密码。</li>
	<li>5. 更新和安装软件：在打开 Linux 发行版后，输入以下命令来更新和安装软件。</li>
	<li>&nbsp;&nbsp; ```</li>
	<li>&nbsp;&nbsp; sudo apt update</li>
	<li>&nbsp;&nbsp; sudo apt upgrade</li>
	<li>&nbsp;&nbsp; ```</li>
	<li>6. 使用 Linux 命令：在 Linux 发行版的终端窗口中，可以使用各种 Linux 命令，例如 ls、cd、mkdir、echo 等。</li>
	<li>7. 打开 Windows 文件夹：在 Linux 发行版中可以通过运行以下命令来打开 Windows 文件夹。</li>
	<li>&nbsp;&nbsp; ```</li>
	<li>&nbsp;&nbsp; explorer.exe .</li>
	<li>&nbsp;&nbsp; ```</li>
	<li>&nbsp;&nbsp; 这将打开当前 Linux 工作目录对应的 Windows 文件夹。</li>
</ul>

<p>通过 WSL，用户可在 Windows 上获得与在 Linux 环境下一样的命令行体验。</p>

<p>17.windows 10没有app store, 在哪里下载linux</p>

<p>如果你的 Windows 10 没有 Microsoft Store（应用商店），你可以在 Microsoft 官方网站下载适用于 Windows 10 的 Linux 子系统。</p>

<ul>
	<li>1. 打开浏览器，访问 Microsoft 官方网站：https://docs.microsoft.com/en-us/windows/wsl/install-manual</li>
	<li>2. 按照网页中的步骤进行操作，下载适用于你的 Windows 10 版本的 Linux 子系统。例如：如果你的 Windows 10 版本为 64 位，可以下载 Ubuntu 18.04 LTS。</li>
	<li>3. 下载完成后，双击运行下载的安装程序，根据向导提示完成安装。</li>
	<li>4. 安装完成后，可以在开始菜单中搜索已安装的 Linux 子系统，打开终端，注册并设置 Linux 用户名和密码，就可以开始使用了。</li>
</ul>

<p>需要注意的是，手动下载安装 Linux 子系统可能需要一些技术操作，对于不太熟悉计算机的用户，推荐使用 Microsoft Store 来获取 Linux 子系统。</p>

<p>18.下载完成后，双击运行下载的安装程序,提示没有关联的应用，怎么办？</p>

<p>如果提示没有关联的应用程序，表示您可能没有正确安装适用于 Windows 10 的 Linux 子系统。请执行以下步骤：</p>

<ul>
	<li>1. 以管理员身份运行 Windows 10。</li>
	<li>2. 打开&ldquo;开始菜单&rdquo;，选择&ldquo;设置&rdquo;。</li>
	<li>3. 在&ldquo;设置&rdquo;菜单中，选择&ldquo;应用&rdquo;。</li>
	<li>4. 在&ldquo;应用&rdquo;下，选择&ldquo;默认应用程序&rdquo;选项。</li>
	<li>5. 找到&ldquo;Linux子系统安装程序&rdquo;文件，单击右侧的&ldquo;选一个默认应用程序&rdquo;。</li>
	<li>6. 在弹出菜单中，选择&ldquo;Windows 命令处理器&rdquo;。</li>
	<li>7. 点击&ldquo;确定&rdquo;按钮。</li>
</ul>

<p>现在，您可以再次双击运行下载的安装程序，它应该会打开并开始安装 Linux 子系统了。</p>

<p>19.没有&lsquo;&ldquo;Linux子系统安装程序&rdquo;&rsquo;，应该怎么？</p>

<p>如果您没有Linux子系统安装程序，可能是因为您的操作系统版本不支持此功能。Linux子系统是从Windows 10版本1607开始引入的，因此如果您的Windows 10版本低于1607，可能无法使用此功能。</p>

<p>另外，也可能是您选择了错误的文件或下载了错误的安装程序。请确保您从官方网站下载了适合您操作系统版本的安装程序，并双击运行。</p>

<p>如果您确定下载的是正确的安装程序，但仍然无法打开它，可以尝试以下步骤：</p>

<ul>
	<li>1. 右键单击下载的安装程序，选择&ldquo;属性&rdquo;。</li>
	<li>2. 在&ldquo;属性&rdquo;窗口中，将光标移到&ldquo;常规&rdquo;选项卡上。</li>
	<li>3. 在下方的&ldquo;安全&rdquo;部分，选择&ldquo;解除锁定&rdquo;选项。</li>
	<li>4. 关闭&ldquo;属性&rdquo;窗口，尝试再次双击安装程序运行。</li>
</ul>

<p>如果仍然无法打开安装程序，请尝试重新下载适合您操作系统版本的安装程序进行安装。</p>

<p>20.没有解除锁定， 怎么办？</p>

<p>如果您没有看到&ldquo;解除锁定&rdquo;选项，请尝试以下步骤：</p>

<ul>
	<li>1. 右键单击下载的安装程序，选择&ldquo;属性&rdquo;。</li>
	<li>2. 在&ldquo;属性&rdquo;窗口中，将光标移到&ldquo;常规&rdquo;选项卡上。</li>
	<li>3. 在下方的&ldquo;安全&rdquo;部分，选择&ldquo;高级&rdquo;选项。</li>
	<li>4. 在&ldquo;高级安全设置&rdquo;窗口中，找到&ldquo;所有者&rdquo;选项卡，并单击&ldquo;更改&rdquo;。</li>
	<li>5. 在&ldquo;选择用户或组&rdquo;窗口中，选择您的用户帐户，并选择&ldquo;确定&rdquo;。</li>
	<li>6. 按照提示完成&ldquo;所有者更改向导&rdquo;，并关闭所有窗口。</li>
	<li>7. 再次右键单击安装程序并选择&ldquo;属性&rdquo;，现在您应该能够看到&ldquo;解除锁定&rdquo;选项。选择该选项进行解锁。</li>
</ul>

<p>请注意，解锁文件可能需要以管理员身份运行您的计算机，否则可能会被阻止。此外，解锁文件可能会破坏安全性，因此请仅在您信任的来源下载文件并在您确定文件安全性的情况下进行解锁。</p>

<p>21.安装 wsl 1</p>

<p>要在 Windows 10 中安装 WSL 1，请按照以下步骤进行操作：</p>

<ul>
	<li>1. 打开 Windows 功能。</li>
	<li>2. 在开始菜单中搜索&ldquo;Windows 功能&rdquo;并单击&ldquo;打开&rdquo;。</li>
	<li>3. 在&ldquo;Windows 功能&rdquo;窗口中，找到&ldquo;适用于 Linux 的 Windows 子系统&rdquo;选项。</li>
	<li>4. 将其选中，然后单击&ldquo;确定&rdquo;。</li>
	<li>5. 等待一段时间，直到功能安装完毕。系统可能需要您重新启动计算机。</li>
	<li>6. 打开 Microsoft Store 应用商店。</li>
	<li>7. 在搜索栏中搜索您想要安装的 Linux 发行版，例如 Ubuntu。</li>
	<li>8. 单击&ldquo;获取&rdquo;按钮以开始下载和安装发行版。</li>
	<li>9. 安装完成后，可通过在开始菜单中搜索&ldquo;Ubuntu&rdquo;或其他 Linux 发行版名称来打开它。</li>
	<li>10. 打开 Linux 终端，开始使用 WSL 1！</li>
</ul>

<p>请注意，需要使用 Windows 10 版本 1903 或更高版本才能使用 WSL 1。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

