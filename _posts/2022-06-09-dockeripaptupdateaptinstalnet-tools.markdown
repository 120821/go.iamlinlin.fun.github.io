---
layout: post
title: "如何获得docker ip , (安装 过程， apt update, apt instal net-tools ... )"
date: "2022-06-09"
categories: 
---

                    <p><strong>docker ip 的查看</strong></p> 
<blockquote> 
 <p>使用sudo docker-compose up</p> 
 <p>出现了报错</p> 
 <pre><code>WARNING: Found orphan containers (test_rails_crud_db_1, test_rails_crud_web_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Starting postgres14.3 ... 
Starting postgres14.3 ... error

ERROR: for postgres14.3  Cannot start service postgres14.3: driver failed programming external connectivity on endpoint postgres14.3 (1eb701338d09b3f05f36238ba1092b4cdd055aed72b9bae2bcab6c3200569535): Error starting userland proxy: listen tcp4 0.0.0.0:5432: bind: address already in use

ERROR: for postgres14.3  Cannot start service postgres14.3: driver failed programming external connectivity on endpoint postgres14.3 (1eb701338d09b3f05f36238ba1092b4cdd055aed72b9bae2bcab6c3200569535): Error starting userland proxy: listen tcp4 0.0.0.0:5432: bind: address already in use
ERROR: Encountered errors while bringing up the project.
</code></pre> 
 <p>端口被占用，那么进行查看 lsof -i:5432</p> 
 <pre><code>COMMAND     PID   USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
postgres   4373 linlin    3u  IPv4   58407      0t0  TCP *:postgresql (LISTEN)
postgres   4373 linlin    4u  IPv6   58408      0t0  TCP *:postgresql (LISTEN)
python3    6978 linlin   12u  IPv4   83141      0t0  TCP localhost:54620-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   13u  IPv4   83142      0t0  TCP localhost:54622-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   14u  IPv4   86077      0t0  TCP localhost:54624-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   15u  IPv4   82466      0t0  TCP localhost:54626-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   16u  IPv4  796868      0t0  TCP localhost:54656-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   17u  IPv4  791976      0t0  TCP localhost:54658-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   18u  IPv4  786298      0t0  TCP localhost:54644-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   19u  IPv4  793328      0t0  TCP localhost:54660-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   20u  IPv4  786300      0t0  TCP localhost:54650-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   21u  IPv4  793099      0t0  TCP localhost:54654-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   22u  IPv4 1121214      0t0  TCP localhost:54666-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   23u  IPv4 1143824      0t0  TCP localhost:54668-&gt;localhost:postgresql (ESTABLISHED)
python3    6978 linlin   24u  IPv4 1142614      0t0  TCP localhost:54670-&gt;localhost:postgresql (ESTABLISHED)
</code></pre> 
 <p>查看cd /proc/4373</p> 
 <p>/proc/4373$ ll</p> 
 <pre><code>total 0
dr-xr-xr-x   9 linlin linlin 0  5月 31 13:41 ./
dr-xr-xr-x 459 root   root   0  5月 30 08:12 ../
-r--r--r--   1 linlin linlin 0  6月  2 09:53 arch_status
dr-xr-xr-x   2 linlin linlin 0  6月  2 09:53 attr/
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 autogroup
-r--------   1 linlin linlin 0  6月  2 09:53 auxv
-r--r--r--   1 linlin linlin 0  6月  2 09:53 cgroup
--w-------   1 linlin linlin 0  6月  2 09:53 clear_refs
-r--r--r--   1 linlin linlin 0  5月 31 13:41 cmdline
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 comm
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 coredump_filter
-r--r--r--   1 linlin linlin 0  6月  2 09:53 cpu_resctrl_groups
-r--r--r--   1 linlin linlin 0  6月  2 09:53 cpuset
lrwxrwxrwx   1 linlin linlin 0  6月  2 09:51 cwd -&gt; /home/linlin/.asdf/installs/postgres/9.5.25/data/
-r--------   1 linlin linlin 0  6月  2 09:53 environ
lrwxrwxrwx   1 linlin linlin 0  5月 31 13:41 exe -&gt; /home/linlin/.asdf/installs/postgres/9.5.25/bin/postgres*
dr-x------   2 linlin linlin 0  6月  2 09:47 fd/
dr-x------   2 linlin linlin 0  6月  2 09:47 fdinfo/
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 gid_map
-r--------   1 linlin linlin 0  6月  2 09:53 io
-r--r--r--   1 linlin linlin 0  6月  2 09:53 limits
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 loginuid
dr-x------   2 linlin linlin 0  6月  2 09:53 map_files/
-r--r--r--   1 linlin linlin 0  6月  2 09:51 maps
-rw-------   1 linlin linlin 0  6月  2 09:53 mem
-r--r--r--   1 linlin linlin 0  6月  2 09:53 mountinfo
-r--r--r--   1 linlin linlin 0  6月  2 09:53 mounts
-r--------   1 linlin linlin 0  6月  2 09:53 mountstats
dr-xr-xr-x  59 linlin linlin 0  6月  2 09:53 net/
dr-x--x--x   2 linlin linlin 0  6月  2 09:53 ns/
-r--r--r--   1 linlin linlin 0  6月  2 09:53 numa_maps
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 oom_adj
-r--r--r--   1 linlin linlin 0  6月  2 09:53 oom_score
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 oom_score_adj
-r--------   1 linlin linlin 0  6月  2 09:53 pagemap
-r--------   1 linlin linlin 0  6月  2 09:53 patch_state
-r--------   1 linlin linlin 0  6月  2 09:53 personality
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 projid_map
lrwxrwxrwx   1 linlin linlin 0  6月  2 09:51 root -&gt; //
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 sched
-r--r--r--   1 linlin linlin 0  6月  2 09:53 schedstat
-r--r--r--   1 linlin linlin 0  6月  2 09:53 sessionid
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 setgroups
-r--r--r--   1 linlin linlin 0  6月  2 09:53 smaps
-r--r--r--   1 linlin linlin 0  6月  2 09:53 smaps_rollup
-r--------   1 linlin linlin 0  6月  2 09:53 stack
-r--r--r--   1 linlin linlin 0  5月 31 13:41 stat
-r--r--r--   1 linlin linlin 0  6月  2 09:53 statm
-r--r--r--   1 linlin linlin 0  6月  2 09:53 status
-r--------   1 linlin linlin 0  6月  2 09:53 syscall
dr-xr-xr-x   3 linlin linlin 0  6月  2 09:53 task/
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 timens_offsets
-r--r--r--   1 linlin linlin 0  6月  2 09:53 timers
-rw-rw-rw-   1 linlin linlin 0  6月  2 09:53 timerslack_ns
-rw-r--r--   1 linlin linlin 0  6月  2 09:53 uid_map
-r--r--r--   1 linlin linlin 0  6月  2 09:53 wchan
</code></pre> 
 <p>/proc/4373$ ifconfig -a</p> 
 <pre><code>br-1cdb9e69418c: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500
        inet 172.19.0.1  netmask 255.255.0.0  broadcast 172.19.255.255
        ether 02:42:3a:2b:82:df  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br-5c3dad90f52b: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500
        inet 172.21.0.1  netmask 255.255.0.0  broadcast 172.21.255.255
        ether 02:42:9a:5b:d2:0c  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br-5d40ced148b5: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 172.23.0.1  netmask 255.255.0.0  broadcast 172.23.255.255
        inet6 fe80::42:8fff:fe76:38d  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 02:42:8f:76:03:8d  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 54  bytes 6848 (6.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br-75ab2acb8190: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500
        inet 172.22.0.1  netmask 255.255.0.0  broadcast 172.22.255.255
        ether 02:42:c1:43:1c:54  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br-8699ceffea25: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500
        inet 172.18.0.1  netmask 255.255.0.0  broadcast 172.18.255.255
        ether 02:42:82:a9:06:f5  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br-c200ea24cd1a: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500
        inet 172.20.0.1  netmask 255.255.0.0  broadcast 172.20.255.255
        ether 02:42:d3:ec:76:88  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

docker0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet6 fe80::42:5eff:fe1d:4f6b  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 02:42:5e:1d:4f:6b  txqueuelen 0  (Ethernet)
        RX packets 73301  bytes 4399446 (4.3 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 112201  bytes 187994554 (187.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73&lt;UP,LOOPBACK,RUNNING&gt;  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10&lt;host&gt;
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2330194  bytes 1254030331 (1.2 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2330194  bytes 1254030331 (1.2 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vetha6d10df: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet6 fe80::d851:3fff:fe73:f217  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether da:51:3f:73:f2:17  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 31  bytes 4477 (4.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vethc22af7c: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet6 fe80::24f7:d8ff:fe2f:dff8  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 26:f7:d8:2f:df:f8  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 31  bytes 4477 (4.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlo1: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 192.168.0.100  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::d150:4db9:6c63:6bd1  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 14:13:33:af:aa:ed  txqueuelen 1000  (Ethernet)
        RX packets 13862378  bytes 16158002300 (16.1 GB)
        RX errors 0  dropped 623718  overruns 0  frame 0
        TX packets 7227500  bytes 1096232937 (1.0 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0</code></pre> 
 <p>在docker进行查看  sudo docker run -it ubuntu bash</p> 
 <p>root@11f55a91272d:/# ifconfig -a</p> 
 <p>此时会出现报错，<span style="color:#fe2c24;">bash: ifconfig: command not found</span></p> 
 <p><span style="color:#0d0016;">因为每次进入docker都需要重新进行配置安装，docker是一个简单的容器</span></p> 
 <p><span style="color:#0d0016;">使用命令进行更新，</span>root@11f55a91272d:/# apt update</p> 
 <p>然后还需要安装config 进行命令的查询 root@11f55a91272d:/# apt install net-tools</p> 
 <p>安装结束就可以进行查询了root@11f55a91272d:/# ifconfig -a</p> 
 <pre><code>eth0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:02  txqueuelen 0  (Ethernet)
        RX packets 8803  bytes 22039340 (22.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 6971  bytes 500909 (500.9 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73&lt;UP,LOOPBACK,RUNNING&gt;  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

root@11f55a91272d:/# su postgres
su: user postgres does not exist or the user entry does not contain all the required fields
root@11f55a91272d:/# psql
bash: psql: command not found
root@11f55a91272d:/# ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 02:13 pts/0    00:00:00 bash
root         240       1  0 02:17 pts/0    00:00:00 ps -ef
</code></pre> 
 <p></p> 
</blockquote>
                
