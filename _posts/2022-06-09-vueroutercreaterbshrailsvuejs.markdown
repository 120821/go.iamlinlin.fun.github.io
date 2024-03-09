---
layout: post
title: "vue router create rb文件 sh文件 rails集成vuejs"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>create_file.rb</p> 
 <pre><code> `touch 111.txt`
  2 `touch 222.txt`
  3 `touch 333.txt`
  4
  5 now = Time.now
  6 puts now</code></pre> 
</blockquote> 
<blockquote> 
 <pre><code>touch hihi.txt
  2 touch hihi2.txt
  3 touch hihi3.txt
  4 date=$date
  5 echo $date</code></pre> 
 <p>creata_file.sh</p> 
</blockquote> 
<blockquote> 
 <p>https://ruby-china.org/topics/30051<br>  JavaScript (转载) 在 <strong>Rails 中集成 Vuejs </strong>的四种方法<br>  <br>  rails5+vue2+webpaker环境搭建多页面和单页面混合应用<br>  https://www.jianshu.com/p/b6a97018679f<br>  <br>   Rails Ruby On Rails + Vue 前后端分离初尝试<br>   https://ruby-china.org/topics/31660<br>  <br><strong>  vue router</strong><br>  <br> 在 Vue 后面加载 vue-router，它会自动安装的：</p> 
 <pre><code>&lt;script src="/path/to/vue.js"&gt;&lt;/script&gt;
&lt;script src="/path/to/vue-router.js"&gt;&lt;/script&gt;</code></pre> 
 <p>NPM</p> 
 <pre><code>npm install vue-router</code></pre> 
 <p>如果在一个模块化工程中使用它，必须要通过 Vue.use() 明确地安装路由功能：</p> 
 <pre><code>import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)</code></pre> 
 <p>如果使用全局的 script 标签，则无须如此 (手动安装)</p> 
</blockquote>
                
