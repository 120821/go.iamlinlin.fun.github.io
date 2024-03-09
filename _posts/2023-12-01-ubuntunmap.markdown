---
layout: post
title: "ubuntu nmap 安装和简单使用"
date: "2023-12-01"
categories: 
---
<p>1.需要已经安装了docker，查询可用的nmap有哪些版本：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
<code><span style="color:#ffd700">docker</span> search nmap
<span style="color:#ffd700">NAME</span>                                                     DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
<span style="color:#ffd700">securecodebox</span>/nmap                                       A Docker image containing the NMAP security &hellip;   <span style="color:#f5ab35">27</span>                   
<span style="color:#ffd700">eclipse</span>/ubuntu_jdk<span style="color:#f5ab35">8</span>                                      Ubuntu, JDK<span style="color:#f5ab35">8</span>, Maven <span style="color:#f5ab35">3</span>, git, curl, nmap, mc, &hellip;   <span style="color:#f5ab35">15</span>                  <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">eclipse</span>/centos_jdk<span style="color:#f5ab35">8</span>                                      CentOS, JDK<span style="color:#f5ab35">8</span>, Maven <span style="color:#f5ab35">3</span>, git, curl, nmap, mc, &hellip;   <span style="color:#f5ab35">5</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">eclipse</span>/debian_jdk<span style="color:#f5ab35">8</span>                                      Debian, JDK<span style="color:#f5ab35">8</span>, Maven <span style="color:#f5ab35">3</span>, git, curl, nmap, mc, &hellip;   <span style="color:#f5ab35">1</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">instrumentisto</span>/nmap                                      Nmap (<span style="color:#abe338">&quot;Network Mapper&quot;</span>) Docker Image            <span style="color:#f5ab35">27</span>                  <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">frapsoft</span>/nmap                                            nmap <span style="color:#f5ab35">on</span> Alpine Linux (<span style="color:#f5ab35">6</span> MB)                     <span style="color:#f5ab35">3</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">uzyexe</span>/nmap                                              nmap container image (size: <span style="color:#f5ab35">14</span>.<span style="color:#f5ab35">93</span>MB)            <span style="color:#f5ab35">32</span>                  <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">nmapxespeo</span>/php_phalcon_couchbase                         PHP with Phalcon framework and Couchbase SDK    <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">networkstatic</span>/nmap                                       Dockerized Nmap Port Scanner <span style="color:#f5ab35">on</span> Debian          <span style="color:#f5ab35">6</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">appsmanager</span>/nmap                                                                                         <span style="color:#f5ab35">1</span>                    
<span style="color:#ffd700">sneakerhax</span>/nmap                                          A Dockerized version of Nmap                    <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">sammascanner</span>/nmap                                        Nmap Scanner  Will run and then save the res&hellip;   <span style="color:#f5ab35">1</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">dockerpinata</span>/nmap-ncat                                                                                   <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">flibustier</span>/nmap                                          NMAP based <span style="color:#f5ab35">on</span> Alpine                            <span style="color:#f5ab35">2</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">ssarioglu</span>/nmap                                           Nmap Scanner                                    <span style="color:#f5ab35">0</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">volterraio</span>/nmap                                                                                          <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">blairy</span>/nmap                                              Lean, source compiled, scratch built, single&hellip;   <span style="color:#f5ab35">1</span>                    
<span style="color:#ffd700">nikhen</span>/nmap                                              This is a docker container including nmap in&hellip;   <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">nmapxespeo</span>/ruby-mysql-phraseapp-nodejs-nginx-passenger                                                   <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">bytesizedalex</span>/nmap                                       Alpine Linux image with nmap network scanner.   <span style="color:#f5ab35">0</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">cyberwatch</span>/nmap                                          Docker Image with Nmap build from source        <span style="color:#f5ab35">5</span>                    
<span style="color:#ffd700">tristanrobert</span>/nmap-docker                                                                                <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">zeronorth</span>/nmap-job-runner                                                                                <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">k0st</span>/nmap                                                Nmap <span style="color:#f5ab35">on</span> minimum, modern and secure Alpine di&hellip;   <span style="color:#f5ab35">4</span>                   <span style="color:#f5ab35"> [OK]</span>
<span style="color:#ffd700">n4n0m4c</span>/nmap                                             docker nmap                                     <span style="color:#f5ab35">1</span>                   <span style="color:#f5ab35"> [OK]</span></code></pre>

<p>2.安装需要的版本：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
<code>docker pull uzyexe/<span style="color:#dcc6e0">nmap</span>
Using default <span style="color:#dcc6e0">ta</span><span style="color:#ffa07a">g:</span> latest
lates<span style="color:#ffa07a">t:</span> Pulling from uzyexe/<span style="color:#dcc6e0">nmap</span>
b0dc45cd432d: Pull <span style="color:#f5ab35">complete</span> 
<span style="color:#f5ab35">364328</span>af40b6: Pull <span style="color:#f5ab35">complete</span> 
<span style="color:#f5ab35">9</span>c7abf28af64: Pull <span style="color:#f5ab35">complete</span> 
<span style="color:#f5ab35">635</span>bab23d5f1: Pull <span style="color:#f5ab35">complete</span> 
<span style="color:#f5ab35">054</span>e7786c1b6: Pull <span style="color:#f5ab35">complete</span> 
<span style="color:#f5ab35">5100</span>e35a43b2: Pull <span style="color:#f5ab35">complete</span> 
d908e559dfdc: Pull <span style="color:#f5ab35">complete</span> 
aaed4af89abd: Pull <span style="color:#f5ab35">complete</span> 
Diges<span style="color:#ffa07a">t:</span> <span style="color:#f5ab35">sha256</span>:efd58ad449b98ae71ad1e1690af7e2c940117dd61a66c902da9d894fafa92e52
Statu<span style="color:#ffa07a">s:</span> Downloaded newer image <span style="color:#dcc6e0">for</span> uzyexe/<span style="color:#dcc6e0">nmap</span>:latest
docker.io/uzyexe/<span style="color:#dcc6e0">nmap</span>:latest</code></pre>

<p>3.启动（简单使用）</p>

<p>使用 uzyexe/nmap 镜像对 baidu.com 进行了端口1-1000进行扫描:</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
<code><span style="color:#ffd700">docker</span> run --rm uzyexe/nmap -p <span style="color:#f5ab35">1</span>-<span style="color:#f5ab35">1000</span> baidu.com
<span style="color:#ffd700">Starting</span> Nmap <span style="color:#f5ab35">7</span>.<span style="color:#f5ab35">80</span> ( https://nmap.org ) at <span style="color:#f5ab35">2023</span>-<span style="color:#f5ab35">12</span>-<span style="color:#f5ab35">01</span> <span style="color:#f5ab35">01</span>:<span style="color:#f5ab35">09</span> UTC
<span style="color:#ffd700">Nmap</span> scan report for baidu.com (<span style="color:#f5ab35">39.156.66.10</span>)
<span style="color:#ffd700">Host</span> is up (<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">055</span>s latency).
<span style="color:#ffd700">Other</span> addresses for baidu.com (not scanned): <span style="color:#f5ab35">110.242.68.66</span>
<span style="color:#ffd700">Not</span> shown: <span style="color:#f5ab35">998</span> filtered ports
<span style="color:#ffd700">PORT</span>    STATE SERVICE
<span style="color:#ffd700">80</span>/tcp  open  http
<span style="color:#ffd700">443</span>/tcp open  https

<span style="color:#ffd700">Nmap</span> done: <span style="color:#f5ab35">1</span> IP address (<span style="color:#f5ab35">1</span> host up) scanned in <span style="color:#f5ab35">5</span>.<span style="color:#f5ab35">80</span> seconds</code></pre>

<p>理解：</p>

<ul style="margin-left:0px; margin-right:0px">
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>Starting Nmap 7.80</code>：扫描的Nmap的版本信息</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>Nmap scan report for baidu.com (39.156.66.10)</code>：意思是扫描的是baidu.com, baidu.com的ip是<code>39.156.66.10</code>。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>Host is up (0.055s latency)</code>：意思是baidu.com的主机是可以到达的，延迟时间是0.055s。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>Not shown: 998 filtered ports</code>：表示扫描的时候，998个端口没有显示出来。&quot;Filtered&quot; 意味着在扫描期间无法确定这些端口的状态，可能是由于防火墙或其他网络设备的过滤。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>PORT STATE SERVICE</code>：这是扫描结果的标题，标题下是扫描到的各个端口的状态和对应的服务。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>80/tcp open http</code>：这表示端口 80 的状态为 &quot;open&quot;，即端口是开放的，并且服务是 HTTP。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>443/tcp open https</code>：这表示端口 443 的状态为 &quot;open&quot;，即端口是开放的，并且服务是 HTTPS。</p>
	</li>
	<li>
	<p style="margin-left:0px; margin-right:0px"><code>Nmap done: 1 IP address (1 host up) scanned in 5.80 seconds</code>：这表示扫描已完成，总共扫描了 1 个 IP 地址（1 台主机），扫描过程耗时 5.80 秒。</p>
	</li>
</ul>

<p>&nbsp;</p>

