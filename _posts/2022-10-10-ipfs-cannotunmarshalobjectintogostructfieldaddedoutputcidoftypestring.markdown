---
layout: post
title: "ipfs - cannot unmarshal object into Go struct field AddedOutput.cid of type string"
date: "2022-10-10"
categories: 
---
<p>使用命令：./ipfs-cluster-ctl add cake.JPG</p>

<pre><code>出现报错：error : json: cannot unmarshal object into Go struct field AddedOutput.cid of type string</code></pre>

<p>直接使用命令：</p>

<pre><code>ipfs add cake.JPG</code></pre>

<p>即可</p>

<pre><code>added QmSkFCXoTamt9fJDxdiRU8EEsvBrT3zw8FFL5zvok2VyyB cake.JPG<br />
&nbsp;15.39 KiB / 15.39 KiB [============================================================================================================================================] 100.00%</code></pre>

<p><img height="122" src="/uploads/ckeditor/pictures/552/image-20221010102534-2.png" width="1920" /></p>

