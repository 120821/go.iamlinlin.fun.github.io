---
layout: post
title: "Docker daemon socket at unix:///var/run/docker.sock: Get 'http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json': dial unix /var/run/docker.sock: connect: permission denied"
date: "2022-09-30"
categories:
---
<p><a href="https://newbedev.com/got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket-at-unix-var-run-docker-sock-get-http-2fvar-2frun-2fdocker-sock-v1-24-containers-json-dial-unix-var-run-docker-sock-connect-permission-denied-docker-code-example">docker </a></p>

<p>安装docker后，docker ps 出现报错：</p>

<p>Docker daemon socket at unix:///var/run/docker.sock: Get &quot;http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json&quot;: dial unix /var/run/docker.sock: connect: permission denied</p>

<p><img height="482" src="/uploads/ckeditor/pictures/504/image-20220930160145-1.png" width="1920" /></p>

<p>使用命令：</p>

<p>ubuntu@ddns:~/ddns_ruby$ sudo chmod 666 /var/run/docker.sock</p>

<p>ubuntu@ddns:~/ddns_ruby$ docker ps</p>

<p>CONTAINER ID&nbsp;&nbsp; IMAGE&nbsp;&nbsp;&nbsp;&nbsp; COMMAND&nbsp;&nbsp; CREATED&nbsp;&nbsp; STATUS&nbsp;&nbsp;&nbsp; PORTS&nbsp;&nbsp;&nbsp;&nbsp; NAMES</p>

<p>就可以看了</p>

