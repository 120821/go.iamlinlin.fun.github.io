---
layout: post
title: "DAPPnode install"
date: "2022-07-26"
categories: 
---
<p>https://docs.dappnode.io/get-started/installation/custom-hardware/installation/script</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">安装：{% highlight %}sudo wget -O - https://prerequisites.dappnode.io | sudo bash{% endhighlight %}</div>

<p>linlin@linlin-i5:/workspace/blockchain$ sudo wget -O - https://prerequisites.dappnode.io | sudo bash<br />
[sudo] password for linlin:<br />
--2022-07-26 14:26:13--&nbsp; https://prerequisites.dappnode.io/<br />
Resolving prerequisites.dappnode.io (prerequisites.dappnode.io)... 217.70.184.56<br />
Connecting to prerequisites.dappnode.io (prerequisites.dappnode.io)|217.70.184.56|:443... connected.<br />
HTTP request sent, awaiting response... 301 Moved Permanently<br />
Location: https://github.com/dappnode/DAppNode/releases/latest/download/dappnode_install_pre.sh [following]<br />
--2022-07-26 14:26:17--&nbsp; https://github.com/dappnode/DAppNode/releases/latest/download/dappnode_install_pre.sh<br />
Resolving github.com (github.com)... 20.205.243.166<br />
Connecting to github.com (github.com)|20.205.243.166|:443... connected.<br />
HTTP request sent, awaiting response... 302 Found<br />
Location: https://github.com/dappnode/DAppNode/releases/download/v0.2.56/dappnode_install_pre.sh [following]<br />
--2022-07-26 14:26:18--&nbsp; https://github.com/dappnode/DAppNode/releases/download/v0.2.56/dappnode_install_pre.sh<br />
Reusing existing connection to github.com:443.<br />
HTTP request sent, awaiting response... 302 Found<br />
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/123174249/ffad484b-a703-4725-b8a6-da2a2ad5fd42?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220726%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20220726T062618Z&amp;X-Amz-Expires=300&amp;X-Amz-Signature=37c12d91e641843510113401f28d22391cfa6ddbc435edcb1e38a929d2a35049&amp;X-Amz-SignedHeaders=host&amp;actor_id=0&amp;key_id=0&amp;repo_id=123174249&amp;response-content-disposition=attachment%3B%20filename%3Ddappnode_install_pre.sh&amp;response-content-type=application%2Foctet-stream [following]<br />
--2022-07-26 14:26:18--&nbsp; https://objects.githubusercontent.com/github-production-release-asset-2e65be/123174249/ffad484b-a703-4725-b8a6-da2a2ad5fd42?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220726%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20220726T062618Z&amp;X-Amz-Expires=300&amp;X-Amz-Signature=37c12d91e641843510113401f28d22391cfa6ddbc435edcb1e38a929d2a35049&amp;X-Amz-SignedHeaders=host&amp;actor_id=0&amp;key_id=0&amp;repo_id=123174249&amp;response-content-disposition=attachment%3B%20filename%3Ddappnode_install_pre.sh&amp;response-content-type=application%2Foctet-stream<br />
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.111.133, 185.199.110.133, 185.199.109.133, ...<br />
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.111.133|:443... connected.<br />
HTTP request sent, awaiting response... 200 OK<br />
Length: 8954 (8.7K) [application/octet-stream]<br />
Saving to: &lsquo;STDOUT&rsquo;</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100%[====================================================================================&gt;]&nbsp;&nbsp; 8.74K&nbsp; --.-KB/s&nbsp;&nbsp;&nbsp; in 0s&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>

<p>2022-07-26 14:26:19 (114 MB/s) - written to stdout [8954/8954]</p>

<p>&nbsp;docker is already installed</p>

<p>&nbsp;docker-compose is already installed</p>

<p>&nbsp;wireguard-dkms is already installed</p>

<p>&nbsp;lsof is already installed<br />
Interfaces not found</p>

<p>{% highlight %}重启：shutdown -r now{% endhighlight %}</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}安装后{% endhighlight %}</div>

<p class="anchor anchorWithStickyNavbar_mojV" id="post-installation">Post-Installation</p>

<p>Once the installation process has finished, DAppNode will try to automatically prepare the first access to your DAppNode on the next order:</p>

<ol>
	<li><a href="https://docs.dappnode.io/user-guide/ui/access/local-proxy">Local Proxy</a></li>
	<li><a href="https://docs.dappnode.io/user-guide/ui/access/wifi">Wifi</a></li>
	<li><a href="https://docs.dappnode.io/user-guide/ui/access/vpn#wireguard">Wireguard</a></li>
	<li><a href="https://docs.dappnode.io/user-guide/ui/access/vpn#openvpn">OpenVPN</a></li>
</ol>

<p class="anchor anchorWithStickyNavbar_mojV" id="linux">Linux</p>

<p>To use wireguard in ubuntu, you will need to use the terminal in the installation process. Firstly, it is needed to install the prerequisites: {% highlight %}sudo apt install openresolv{% endhighlight %}</p>

<p>Then, you can install Wireguard: {% highlight %}sudo apt install wireguard{% endhighlight %}</p>

<p>Create the configuration file and paste the configuration you have copied before (The configuration text you have obtained on the wireguard tab on dappnode UI): {% highlight %}sudo nano /etc/wireguard/wg0.conf{% endhighlight %}</p>

<p>Finally, type the following command: {% highlight %}sudo wg-quick up wg0{% endhighlight %}</p>

<p>To check you are connected you can do 2 things:</p>

<ol>
	<li>{% highlight %}ifconfig{% endhighlight %} and check if there is an interface &quot;new&quot;.</li>
	<li>Try to access the dappnode UI, if you can access it&#39;s ok.</li>
</ol>

<p>In case you can, type: {% highlight %}sudo wg show{% endhighlight %}</p>

<p>The output of this command should be something like:</p>

<div class="codeBlockContainer_MPoW theme-code-block" style="--prism-color: #bfc7d5; --prism-background-color: #292d3e;">
<div class="codeBlockContent_B9tL">
<p class="prism-code language-text codeBlock__0OG thin-scrollbar" tabindex="0"><code class="codeBlockLines_gEuF"><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">$ sudo wg show</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">interface: wg0 public key: zFhjLJdXrLl86ayX6JpyfN0/rVH+qxgF/e8HxRP9cxk=</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; private key: (hidden)</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; listening port: 51820</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">peer: OQZWpDPUcNPRZMjncY6BUwsli6HtqgTUn2lAGdXVi2c=</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; endpoint: 173.249.33.176:51820</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; allowed ips: 172.33.0.0/16, 10.20.0.0/24</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; latest handshake: 36 seconds ago</span></span><br />
<span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">&nbsp; transfer: 222.36 KiB received, 81.86 KiB sent</span></span>{% endhighlight %}</p>
</div>
</div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">OpenVPN</div>

<ul>
	<li>Mac os: <a href="https://tunnelblick.net/" rel="noopener noreferrer" target="_blank">Tunnelblick</a></li>
	<li>Ios: <a href="https://itunes.apple.com/us/app/openvpn-connect/id590379981" rel="noopener noreferrer" target="_blank">Open VPN connect</a></li>
	<li>Windows: <a href="https://openvpn.net/community-downloads/" rel="noopener noreferrer" target="_blank">Open VPN (community installer)</a></li>
	<li>Android: <a href="https://play.google.com/store/apps/details?id=de.blinkt.openvpn" rel="noopener noreferrer" target="_blank">Open VPN for Android</a></li>
	<li>Linux: Already included in recent versions.</li>
</ul>

<p>Linux需要进行保证dappnode在运行，需要运行命令</p>

<p class="anchor anchorWithStickyNavbar_mojV" id="linux-1">Linux</p>

<p class="anchor anchorWithStickyNavbar_mojV" id="ubuntu--networkmanager">Ubuntu / NetworkManager</p>

<p>OpenVPN comes installed in Ubuntu recent versions, but to be sure, follow these steps. Run the terminal application:</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu1.png" /></p>

<p>Install OpenVPN and plugin for NetworkManager:</p>

<div class="codeBlockContainer_MPoW theme-code-block" style="--prism-color: #bfc7d5; --prism-background-color: #292d3e;">
<div class="codeBlockContent_B9tL">
<pre class="prism-code language-text codeBlock__0OG thin-scrollbar" tabindex="0">
<code class="codeBlockLines_gEuF"><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">sudo apt-get install network-manager-openvpn-gnome openvpn</span>
</span>{% endhighlight %}
</div>
</div>

<p>Once the installation is complete, restart Network Manager by typing:</p>

<div class="codeBlockContainer_MPoW theme-code-block" style="--prism-color: #bfc7d5; --prism-background-color: #292d3e;">
<div class="codeBlockContent_B9tL">
<pre class="prism-code language-text codeBlock__0OG thin-scrollbar" tabindex="0">
<code class="codeBlockLines_gEuF"><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">sudo service network-manager restart</span>
</span>{% endhighlight %}
</div>
</div>

<p>Go to &quot;Settings -&gt; Network&quot; and click to the &quot;+&quot; button to add a VPN connection:</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu2.png" /></p>

<p>Select &quot;Import from file...&quot;</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu4.png" /></p>

<p>Browse the filesystem to select the downloaded file:</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu3.png" /></p>

<p>Add the profile with the default settings:</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu5.png" /></p>

<p>Now you can connect selecting the profile from the network tray icon:</p>

<p align="center"><img class="img_E7b_" loading="lazy" src="https://github.com/dappnode/DAppNode/raw/master/doc/openvpn/ubuntu6.png" /></p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}卸载：wget -qO - https://uninstaller.dappnode.io | sudo bash{% endhighlight %}</div>

<p class="anchor anchorWithStickyNavbar_mojV" id="restore-to-the-latest-version-from-a-script">Restore to the latest version from a script</p>

<p>If you are experiencing any problem or just want to make sure you are running the latest DAppNode versions, execute this command in the DAppNode terminal. This will update the core packages to the latest versions without erasing any data from your volumes.</p>

<blockquote>
<p>⚠️ Please note that volumes are not deleted, but any EXTRA_OPTS set by the user in the packages config must be set again after using this script to restore the system {% highlight %}sudo wget -O - https://installer.dappnode.io | sudo UPDATE=true bash{% endhighlight %}</p>
</blockquote>

