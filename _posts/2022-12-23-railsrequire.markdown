---
layout: post
title: "rails require的使用"
date: "2022-12-23"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/9750610/ruby-require-error-cannot-load-such-file">https://stackoverflow.com/questions/9750610/ruby-require-error-cannot-load-such-file</a></p>

<p>1.同级目录下，直接使用这样的就可以</p>

<pre>
<code>require &quot;./tokenizer&quot;</code></pre>

<p>2.在子目录下，使用这样的</p>

<pre>
<code>require &quot;./scripts/tokenizer&quot;</code></pre>

<p>3.注意不需要加.rb后缀，并且必须加上./表示当前目录下</p>

