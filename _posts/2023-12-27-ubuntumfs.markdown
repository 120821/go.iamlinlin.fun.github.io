---
layout: post
title: "ubuntu 安装MFS以及简单使用"
date: "2023-12-27"
categories: 
---
<p>参考文章：<a href="https://zhuanlan.zhihu.com/p/387455070">https://zhuanlan.zhihu.com/p/387455070</a></p>

<p>1.安装MSF</p>

<p>使用官方的脚本：（推荐）</p>

{% highlight %}
{% highlight %}curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb &gt; msfinstall &amp;&amp; \chmod 755 msfinstall &amp;&amp; \./msfinstall{% endhighlight %}

<p>如果不行，可以使用手动安装，进入参考文章里看。</p>

<p>2.安装并连接数据库postgres</p>

<p>我的本地已经有数据库了，直接连接即可</p>

<p>开启数据库：</p>

<p>pg_ctl start</p>

<p>更新一下MSF：</p>

{% highlight %}
{% highlight %}sudo msfupdate{% endhighlight %}

<p>启动MSF</p>

{% highlight %}
{% highlight %}msfconsole {% endhighlight %}

<p>连接数据库：（自己根据用户名密码数据库进行修改）</p>

{% highlight %}
{% highlight %}db_connect postgres:hehehe@127.0.0.1/test //用户名，密码，地址，自己随意编造的名字。{% endhighlight %}

<p>查看数据库的状态：</p>

{% highlight %}
{% highlight %}db_status //查看数据库连接状态 {% endhighlight %}

{% highlight %}
{% highlight %}msf6 &gt; db_status

[*] Connected to blogs. Connection type: postgresql.{% endhighlight %}

<p>简单使用：</p>

<p>测试是否可以访问目标机器：</p>

{% highlight %}
{% highlight %}ping 192.168.174.129{% endhighlight %}

{% highlight %}
{% highlight %}ping 192.168.174.129

[*] exec: ping 192.168.174.129

PING 192.168.174.129 (192.168.174.129) 56(84) bytes of data.

^C

--- 192.168.174.129 ping statistics ---

19 packets transmitted, 0 received, 100% packet loss, time 18412ms{% endhighlight %}

<p>根据漏洞的编号进行搜索：</p>

{% highlight %}
{% highlight %}search ms17_010

msf6 &gt; search ms17_010

Matching Modules

================

&nbsp;&nbsp; #&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disclosure Date&nbsp; Rank&nbsp;&nbsp;&nbsp;&nbsp; Check&nbsp; Description

&nbsp;&nbsp; -&nbsp; ----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ---------------&nbsp; ----&nbsp;&nbsp;&nbsp;&nbsp; -----&nbsp; -----------

&nbsp;&nbsp; 0&nbsp; exploit/windows/smb/ms17_010_eternalblue&nbsp; 2017-03-14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; average&nbsp; Yes&nbsp;&nbsp;&nbsp; MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption

&nbsp;&nbsp; 1&nbsp; exploit/windows/smb/ms17_010_psexec&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017-03-14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution

&nbsp;&nbsp; 2&nbsp; auxiliary/admin/smb/ms17_010_command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017-03-14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp; MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Command Execution

&nbsp;&nbsp; 3&nbsp; auxiliary/scanner/smb/smb_ms17_010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp; MS17-010 SMB RCE Detection


Interact with a module by name or index. For example info 3, use 3 or use auxiliary/scanner/smb/smb_ms17_010{% endhighlight %}

<p>搜索某年的漏洞：</p>

{% highlight %}
{% highlight %}msf6 &gt; search cve-2023{% endhighlight %}

{% highlight %}
{% highlight %}Matching Modules

================

&nbsp;&nbsp; #&nbsp;&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disclosure Date&nbsp; Rank&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Check&nbsp; Description

&nbsp;&nbsp; -&nbsp;&nbsp; ----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ---------------&nbsp; ----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -----&nbsp; -----------

&nbsp;&nbsp; 0&nbsp;&nbsp; auxiliary/gather/adobe_coldfusion_fileread_cve_2023_26360&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp;&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp; Adobe ColdFusion Unauthenticated Arbitrary File Read

&nbsp;&nbsp; 1&nbsp;&nbsp; exploit/multi/http/adobe_coldfusion_rce_cve_2023_26360&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-03-14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Adobe ColdFusion Unauthenticated Remote Code Execution

&nbsp;&nbsp; 2&nbsp;&nbsp; exploit/windows/local/cve_2023_21768_afd_lpe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-01-10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Ancillary Function Driver (AFD) for WinSock Elevation of Privilege

&nbsp;&nbsp; 3&nbsp;&nbsp; exploit/multi/misc/apache_activemq_rce_cve_2023_46604&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-10-27&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Apache ActiveMQ Unauthenticated Remote Code Execution

&nbsp;&nbsp; 4&nbsp;&nbsp; exploit/multi/http/apache_druid_cve_2023_25194&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-02-07&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Apache Druid JNDI Injection RCE

&nbsp;&nbsp; 5&nbsp;&nbsp; exploit/linux/http/apache_nifi_h2_rce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-06-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Apache NiFi H2 Connection String Remote Code Execution

...

&nbsp;&nbsp; 61&nbsp; exploit/linux/http/vmware_vrni_rce_cve_2023_20887&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-06-07&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; VMWare Aria Operations for Networks (vRealize Network Insight) pre-authenticated RCE

&nbsp;&nbsp; 62&nbsp; exploit/windows/fileformat/winrar_cve_2023_38831&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-08-23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp; WinRAR CVE-2023-38831 Exploit

&nbsp;&nbsp; 63&nbsp; exploit/windows/local/cve_2023_28252_clfs_driver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-04-11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; Windows Common Log File System Driver (clfs.sys) Elevation of Privilege Vulnerability

&nbsp;&nbsp; 64&nbsp; exploit/multi/http/wp_royal_elementor_addons_rce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-11-23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; WordPress Royal Elementor Addons RCE

&nbsp;&nbsp; 65&nbsp; exploit/multi/http/wp_plugin_fma_shortcode_unauth_rce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-05-31&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Wordpress File Manager Advanced Shortcode 2.3.2 - Unauthenticated Remote Code Execution through shortcode

&nbsp;&nbsp; 66&nbsp; auxiliary/scanner/http/wp_paid_membership_pro_code_sqli&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-01-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp;&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; Wordpress Paid Membership Pro code Unauthenticated SQLi

&nbsp;&nbsp; 67&nbsp; auxiliary/scanner/http/wp_woocommerce_payments_add_user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-03-22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp;&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; Wordpress Plugin WooCommerce Payments Unauthenticated Admin Creation

&nbsp;&nbsp; 68&nbsp; exploit/unix/webapp/zoneminder_snapshots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-02-24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; ZoneMinder Snapshots Command Injection

&nbsp;&nbsp; 69&nbsp; exploit/linux/misc/zyxel_ike_decoder_rce_cve_2023_28771&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-03-31&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; great&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; Zyxel IKE Packet Decoder Unauthenticated Remote Code Execution

&nbsp;&nbsp; 70&nbsp; exploit/linux/misc/zyxel_multiple_devices_zhttp_lan_rce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2022-02-01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yes&nbsp;&nbsp;&nbsp; Zyxel Unauthenticated LAN Remote Code Execution

&nbsp;&nbsp; 71&nbsp; exploit/linux/http/zyxel_lfi_unauth_ssh_rce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2022-02-01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; Zyxel chained RCE using LFI and weak password derivation algorithm

&nbsp;&nbsp; 72&nbsp; exploit/aix/local/invscout_rpm_priv_esc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-04-24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; invscout RPM Privilege Escalation

&nbsp;&nbsp; 73&nbsp; auxiliary/gather/owncloud_phpinfo_reader&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-11-21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; normal&nbsp;&nbsp;&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp; ownCloud Phpinfo Reader

&nbsp;&nbsp; 74&nbsp; exploit/unix/http/pfsense_config_data_exec&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-03-18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; pfSense Restore RRD Data Command Injection

&nbsp;&nbsp; 75&nbsp; exploit/linux/http/pyload_js2py_exec&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2023-01-13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; excellent&nbsp; Yes&nbsp;&nbsp;&nbsp; pyLoad js2py Python Execution

Interact with a module by name or index. For example info 75, use 75 or use exploit/linux/http/pyload_js2py_exec{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

