---
layout: post
title: "Using a Local Node本地运行节点"
date: "2022-07-26"
categories: 
---
<p class="lt-article__title lt-mb-4 lt-fs-3 lt-fs-md-1" itemprop="name">首先安装APP--ganache,使用命令 chmod +x ganache...进行安装，使用./gana..进行运行</p>
<p>linlin@linlin-i5:~/Downloads$ ll |grep ganache<br />
-rw-rw-r--&nbsp; 1 linlin linlin 153130048&nbsp; 7月 25 14:57 ganache-2.5.4-linux-x86_64.AppImage<br />
linlin@linlin-i5:~/Downloads$ chmod +x ganache-2.5.4-linux-x86_64.AppImage ^C<br />
linlin@linlin-i5:~/Downloads$ chmod +x ganache-2.5.4-linux-x86_64.AppImage<br />
linlin@linlin-i5:~/Downloads$ ll |grep ganache<br />
-rwxrwxr-x&nbsp; 1 linlin linlin 153130048&nbsp; 7月 25 14:57 ganache-2.5.4-linux-x86_64.AppImage*<br />
linlin@linlin-i5:~/Downloads$ ./ganache-2.5.4-linux-x86_64.AppImage<br />
09:30:56.509 &rsaquo; Checking for update<br />
09:30:56.522 &rsaquo; Generated new staging user ID: d6d80e14-56c1-52c8-82e0-ad8a734e3e6e<br />
listen to truffle</p>
<p>&nbsp;</p>
<p class="lt-article__title lt-mb-4 lt-fs-3 lt-fs-md-1" itemprop="name">======================（以下不用看了）</p>
<p class="lt-article__title lt-mb-4 lt-fs-3 lt-fs-md-1" itemprop="name">Using a Local Node</p>
<div class="lt-article__body" itemprop="articleBody">
<p>For greater security, privacy, and read speeds, you may choose to run a local blockchain client, and connect MetaMask to it. A local blockchain client takes a while to &quot;synchronize&quot; with the network, but once it has, it&#39;s easy to connect MetaMask to it.</p>
<p>There are a <a href="https://ethernodes.org/">number of clients out there</a>, including <a href="https://besu.hyperledger.org/en/stable/">Besu</a>, which ConsenSys helps maintain. <a href="https://greg.jeanmart.me/2020/02/23/running-an-ethereum-full-node-on-a-raspberrypi-4-/">Here&#39;s</a> a helpful guide on setting up a node. Once you have your local client set up, you can connect to it with the network menu in the top left corner of MetaMask:</p>
<p><img alt="" src="https://hf-files-oregon.s3.amazonaws.com/hdpconsensyssupport_kb_attachments/2017/07-04/6f19e017-a20f-48d8-b6cf-05454d356497/local-network.png" /></p>
<h3>Geth</h3>
<p>Geth needs to have a special CORS setting enabled to allow MetaMask to connect to it by default, so try starting it with this command:</p>
<p>{% highlight html %}geth --rpc --rpccorsdomain=&quot;chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn&quot;{% endhighlight %}</p>
<p>{% highlight html %}本地没有运行，切换网络后，进行命令的执行。{% endhighlight %}</p>
<p>geth --rpc --rpccorsdomain=&quot;chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn&quot;<br />
Incorrect Usage. flag provided but not defined: -rpc</p>
<p>NAME:<br />
&nbsp;&nbsp; geth - the go-ethereum command line interface</p>
<p>USAGE:<br />
&nbsp;&nbsp; geth [global options] command [command options] [arguments...]</p>
<p>COMMANDS:<br />
&nbsp;&nbsp; account&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manage accounts<br />
&nbsp;&nbsp; attach&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start an interactive JavaScript environment (connect to node)<br />
&nbsp;&nbsp; console&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start an interactive JavaScript environment<br />
&nbsp;&nbsp; db&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Low level database operations<br />
&nbsp;&nbsp; dump&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dump a specific block from storage<br />
&nbsp;&nbsp; dumpconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show configuration values<br />
&nbsp;&nbsp; dumpgenesis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dumps genesis block JSON configuration to stdout<br />
&nbsp;&nbsp; export&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Export blockchain into file<br />
&nbsp;&nbsp; export-preimages&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Export the preimage database into an RLP stream<br />
&nbsp;&nbsp; import&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Import a blockchain file<br />
&nbsp;&nbsp; import-preimages&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Import the preimage database from an RLP stream<br />
&nbsp;&nbsp; init&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bootstrap and initialize a new genesis block<br />
&nbsp;&nbsp; js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DEPRECATED) Execute the specified JavaScript files<br />
&nbsp;&nbsp; license&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Display license information<br />
&nbsp;&nbsp; makecache&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generate ethash verification cache (for testing)<br />
&nbsp;&nbsp; makedag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generate ethash mining DAG (for testing)<br />
&nbsp;&nbsp; removedb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Remove blockchain and state databases<br />
&nbsp;&nbsp; show-deprecated-flags&nbsp; Show flags that have been deprecated<br />
&nbsp;&nbsp; snapshot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A set of commands based on the snapshot<br />
&nbsp;&nbsp; version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Print version numbers<br />
&nbsp;&nbsp; version-check&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Checks (online) for known Geth security vulnerabilities<br />
&nbsp;&nbsp; wallet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manage Ethereum presale wallets<br />
&nbsp;&nbsp; help, h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shows a list of commands or help for one command</p>
<p>GLOBAL OPTIONS:<br />
&nbsp;&nbsp; ACCOUNT<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --allow-insecure-unlock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Allow insecure account unlocking when account-related RPCs are exposed by http<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --keystore value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Directory for the keystore (default = inside the datadir)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --lightkdf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reduce key-derivation RAM &amp; CPU usage at some expense of KDF strength<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --password value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password file to use for non-interactive password input<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pcscdpath value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;/run/pcscd/pcscd.comm&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path to the smartcard daemon (pcscd) socket file<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --signer value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; External signer (url or path to ipc file)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --unlock value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of accounts to unlock<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --usb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable monitoring and management of USB hardware wallets<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; ALIASED (deprecated)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.gastarget value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Target gas floor for mined blocks (deprecated)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nousb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disables monitoring for and managing USB hardware wallets (deprecated)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --whitelist value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated block number-to-hash mappings to enforce (&lt;number&gt;=&lt;hash&gt;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (deprecated in favor of --eth.requiredblocks)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; API AND CONSOLE<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --authrpc.addr value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Listening address for authenticated APIs<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --authrpc.jwtsecret value&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path to a JWT secret to use for authenticated RPC endpoints<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --authrpc.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 8551)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Listening port for authenticated APIs<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --authrpc.vhosts value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of virtual hostnames from which to accept requests (server<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enforced). Accepts &#39;*&#39; wildcard.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --exec value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Execute JavaScript statement<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --graphql&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable GraphQL on the HTTP-RPC server. Note that GraphQL can only be started if<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; an HTTP server is started as well.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --graphql.corsdomain value&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of domains from which to accept cross origin requests<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (browser enforced)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --graphql.vhosts value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of virtual hostnames from which to accept requests (server<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enforced). Accepts &#39;*&#39; wildcard.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable the HTTP-RPC server<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.addr value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HTTP-RPC server listening interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.api value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; API&#39;s offered over the HTTP-RPC interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.corsdomain value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of domains from which to accept cross origin requests<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (browser enforced)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 8545)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HTTP-RPC server listening port<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.rpcprefix value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HTTP path path prefix on which JSON-RPC is served. Use &#39;/&#39; to serve on all<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; paths.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --http.vhosts value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of virtual hostnames from which to accept requests (server<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enforced). Accepts &#39;*&#39; wildcard.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ipcdisable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disable the IPC-RPC server<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ipcpath value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Filename for IPC socket/pipe within the datadir (explicit paths escape it)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --jspath value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: .)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JavaScript root path for `loadScript`<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --preload value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated list of JavaScript files to preload into the console<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --rpc.allow-unprotected-txs&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Allow for unprotected (non EIP155 signed) transactions to be submitted via RPC<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --rpc.evmtimeout value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 5s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sets a timeout used for eth_call (0=infinite)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --rpc.gascap value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 50000000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sets a cap on gas that can be used in eth_call/estimateGas (0=infinite)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --rpc.txfeecap value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sets a cap on transaction fee (in ether) that can be sent via the RPC APIs (0 =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no cap)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable the WS-RPC server<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws.addr value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WS-RPC server listening interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws.api value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; API&#39;s offered over the WS-RPC interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws.origins value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Origins from which to accept websockets requests<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 8546)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WS-RPC server listening port<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ws.rpcprefix value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HTTP path prefix on which JSON-RPC is served. Use &#39;/&#39; to serve on all paths.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; DEVELOPER CHAIN<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --dev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ephemeral proof-of-authority network with a pre-funded developer account, mining<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --dev.gaslimit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 11500000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Initial block gas limit<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --dev.period value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Block period to use in developer mode (0 = mine only if transaction pending)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; ETHASH<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.cachedir value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Directory to store the ethash verification caches (default = inside the datadir)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.cachesinmem value&nbsp;&nbsp;&nbsp;&nbsp; (default: 2)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent ethash caches to keep in memory (16MB each)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.cacheslockmmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lock memory maps of recent ethash caches<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.cachesondisk value&nbsp;&nbsp;&nbsp; (default: 3)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent ethash caches to keep on disk (16MB each)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.dagdir value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: /home/linlin/.ethash)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Directory to store the ethash mining DAGs<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.dagsinmem value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent ethash mining DAGs to keep in memory (1+GB each)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.dagslockmmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lock memory maps for recent ethash mining DAGs<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethash.dagsondisk value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 2)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent ethash mining DAGs to keep on disk (1+GB each)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; ETHEREUM<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --bloomfilter.size value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 2048)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Megabytes of memory allocated to bloom-filter for pruning<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --config value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOML configuration file<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --datadir value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: /home/linlin/.ethereum)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data directory for the databases and keystore<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --datadir.ancient value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data directory for ancient chain segments (default = inside chaindata)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --datadir.minfreedisk value&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minimum free disk space in MB, once reached triggers auto shut down (default =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --cache.gc converted to MB, 0 = disabled)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --eth.requiredblocks value&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated block number-to-hash mappings to require for peering<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&lt;number&gt;=&lt;hash&gt;)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --exitwhensynced&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Exits after block synchronisation completes<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --gcmode value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;full&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blockchain garbage collection mode (&quot;full&quot;, &quot;archive&quot;)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --goerli&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G&ouml;rli network: pre-configured proof-of-authority test network<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --kiln&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kiln network: pre-configured proof-of-work to proof-of-stake test network<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --mainnet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ethereum mainnet<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --networkid value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Explicitly set network id (integer)(For testnets: use --ropsten, --rinkeby,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --goerli instead)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --override.grayglacier value&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manually specify Gray Glacier fork-block, overriding the bundled setting<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --override.terminaltotaldifficulty value (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manually specify TerminalTotalDifficulty, overriding the bundled setting<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --rinkeby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rinkeby network: pre-configured proof-of-authority test network<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ropsten&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ropsten network: pre-configured proof-of-stake test network<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --sepolia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sepolia network: pre-configured proof-of-work test network<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --snapshot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: true)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enables snapshot-database mode (default = enable)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --syncmode value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: snap)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blockchain sync mode (&quot;snap&quot;, &quot;full&quot; or &quot;light&quot;)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txlookuplimit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 2350000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent blocks to maintain transactions index for (default = about one<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; year, 0 = entire chain)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; GAS PRICE ORACLE<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --gpo.blocks value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 20)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of recent blocks to check for gas prices<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --gpo.ignoreprice value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 2)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gas price below which gpo will ignore transactions<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --gpo.maxprice value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 500000000000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum transaction priority fee (or gasprice before London fork) to be<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recommended by gpo<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --gpo.percentile value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 60)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Suggested gas price is the given percentile of a set of recent transaction gas<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prices<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; LIGHT CLIENT<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.egress value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outgoing bandwidth limit for serving light clients (kilobytes/sec, 0 =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unlimited)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.ingress value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Incoming bandwidth limit for serving light clients (kilobytes/sec, 0 =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unlimited)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.maxpeers value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 100)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of light clients to serve, or light servers to attach to<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.nopruning&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disable ancient light chain data pruning<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.nosyncserve&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enables serving light clients before syncing<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --light.serve value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum percentage of time allowed for serving LES requests (multi-threaded<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; processing allows values over 100)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ulc.fraction value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 75)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minimum % of trusted ultra-light servers required to announce a new head<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ulc.onlyannounce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ultra light server sends announcements only<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ulc.servers value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List of trusted ultra-light servers<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; LOGGING AND DEBUGGING<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --fakepow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disables proof-of-work verification<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --log.backtrace value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Request a stack trace at a specific logging statement (e.g. &quot;block.go:271&quot;)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --log.debug&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prepends log messages with call-site location (file and line number)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --log.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Format logs with JSON<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nocompaction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disables db compaction after import<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable the pprof HTTP server<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof.addr value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;127.0.0.1&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pprof HTTP server listening interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof.blockprofilerate value (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turn on block profiling with the given rate<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof.cpuprofile value&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Write CPU profile to the given file<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof.memprofilerate value&nbsp;&nbsp; (default: 524288)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turn on memory profiling with the given rate<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --pprof.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 6060)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pprof HTTP server listening port<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --remotedb value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; URL for remote database<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --trace value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Write execution trace to the given file<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --verbosity value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 3)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Logging verbosity: 0=silent, 1=error, 2=warn, 3=info, 4=debug, 5=detail<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --vmodule value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Per-module verbosity: comma-separated list of &lt;pattern&gt;=&lt;level&gt; (e.g.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth/*=5,p2p=4)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; METRICS AND STATS<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ethstats value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reporting URL of a ethstats service (nodename:secret@host:port)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable metrics collection and reporting<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.addr value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;127.0.0.1&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable stand-alone metrics HTTP server listening interface<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.expensive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable expensive metrics collection and reporting<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable metrics export/push to an external InfluxDB database<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.bucket value (default: &quot;geth&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InfluxDB bucket name to push reported metrics to (v2 only)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.database value (default: &quot;geth&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InfluxDB database name to push reported metrics to<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.endpoint value (default: &quot;http://localhost:8086&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InfluxDB API endpoint to report metrics to<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.organization value (default: &quot;geth&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InfluxDB organization name (v2 only)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.password value (default: &quot;test&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password to authorize access to the database<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.tags value&nbsp; (default: &quot;host=localhost&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma-separated InfluxDB tags (key/values) attached to all measurements<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.token value (default: &quot;test&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Token to authorize access to the database (v2 only)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdb.username value (default: &quot;test&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Username to authorize access to the database<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.influxdbv2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable metrics export/push to an external InfluxDB v2 database<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --metrics.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 6060)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Metrics HTTP server listening port<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; MINER<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --mine&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable mining<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.etherbase value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;0&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Public address for block mining rewards (default = first account)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.extradata value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Block extra data set by the miner (default = client version)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.gaslimit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 30000000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Target gas ceiling for mined blocks<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.gasprice value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minimum gas price for mining a transaction<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.notify value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated HTTP URL list to notify of new work packages<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.notify.full&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Notify with pending block headers instead of work packages<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.noverify&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disable remote sealing verification<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.recommit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 3s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time interval to recreate the block being mined<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --miner.threads value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of CPU threads to use for mining<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; MISC<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --help, -h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; show help<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --ignore-legacy-receipts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Geth will start up even if there are legacy receipts in freezer<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; NETWORKING<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --bootnodes value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated enode URLs for P2P discovery bootstrap<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --discovery.dns value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sets DNS discovery entry points (use &quot;&quot; to disable DNS)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --discovery.port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 30303)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Use a custom UDP port for P2P discovery<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --identity value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Custom node name<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --maxpeers value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 50)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of network peers (network disabled if set to 0)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --maxpendpeers value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of pending connection attempts (defaults used if set to 0)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nat value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;any&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAT port mapping mechanism (any|none|upnp|pmp|extip:&lt;IP&gt;)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --netrestrict value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Restricts network communication to the given IP networks (CIDR masks)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nodekey value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P2P node key file<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nodekeyhex value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P2P node key as hex (for testing)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --nodiscover&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disables the peer discovery mechanism (manual peer addition)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --port value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 30303)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Network listening port<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --v5disc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enables the experimental RLPx V5 (Topic Discovery) mechanism<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; PERFORMANCE TUNING<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1024)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Megabytes of memory allocated to internal caching (default = 4096 mainnet full<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node, 128 light mode)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.database value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 50)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Percentage of cache memory allowance to use for database io<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.gc value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 25)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Percentage of cache memory allowance to use for trie pruning (default = 25% full<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode, 0% archive mode)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.noprefetch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disable heuristic state prefetch during block import (less CPU and disk IO, more<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time waiting for data)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.preimages&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable recording the SHA3/keccak preimages of trie keys<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.snapshot value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 10)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Percentage of cache memory allowance to use for snapshot caching (default = 10%<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full mode, 20% archive mode)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.trie value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 15)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Percentage of cache memory allowance to use for trie caching (default = 15% full<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode, 30% archive mode)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.trie.journal value&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;triecache&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disk journal directory for trie cache to survive node restarts<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --cache.trie.rejournal value&nbsp;&nbsp; (default: 1h0m0s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time interval to regenerate the trie cache journal<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --fdlimit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Raise the open file descriptor resource limit (default = system fd limit)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; TRANSACTION POOL<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.accountqueue value&nbsp;&nbsp;&nbsp; (default: 64)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of non-executable transaction slots permitted per account<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.accountslots value&nbsp;&nbsp;&nbsp; (default: 16)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minimum number of executable transaction slots guaranteed per account<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.globalqueue value&nbsp;&nbsp;&nbsp;&nbsp; (default: 1024)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of non-executable transaction slots for all accounts<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.globalslots value&nbsp;&nbsp;&nbsp;&nbsp; (default: 5120)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum number of executable transaction slots for all accounts<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.journal value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: &quot;transactions.rlp&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disk journal for local transaction to survive node restarts<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.lifetime value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 3h0m0s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maximum amount of time non-executable transaction are queued<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.locals value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comma separated accounts to treat as locals (no flush, priority inclusion)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.nolocals&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disables price exemptions for locally submitted transactions<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.pricebump value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 10)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price bump percentage to replace an already existing transaction<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.pricelimit value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minimum gas price limit to enforce for acceptance into the pool<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --txpool.rejournal value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1h0m0s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time interval to regenerate the local transaction journal<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; VIRTUAL MACHINE<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --vmdebug&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: false)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Record information useful for VM and contract debugging<br />
&nbsp; &nbsp;</p>
<p>COPYRIGHT:<br />
&nbsp;&nbsp; Copyright 2013-2022 The go-ethereum Authors<br />
flag provided but not defined: -rpc</p>
<p>linlin@linlin-i5:/workspace/blockchain/contract_on_goerli_using_infura$ ls<br />
build&nbsp; call.js&nbsp; compile.js&nbsp; contracts&nbsp; Demo.json&nbsp; Demo.sol&nbsp; deploy.js&nbsp; migrations&nbsp; node_modules&nbsp; package.json&nbsp; package-lock.json&nbsp; test&nbsp; truffle-config.js</p>
<p>linlin@linlin-i5:/workspace/blockchain/contract_on_goerli_using_infura$ ls build/contracts/<br />
Migrations.json</p>
<h3>Parity</h3>
<p>Parity has installers for Mac and Windows, and seems to work with MetaMask pretty easily out of the box, once synchronized.</p>
</div>
