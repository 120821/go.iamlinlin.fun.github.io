---
layout: post
title: "go unit test assert 的使用"
date: "2023-11-03"
categories: 
---
<p><a href="https://github.com/stretchr/testify">https://github.com/stretchr/testify</a></p>

<p><a href="https://pkg.go.dev/github.com/stretchr/testify/assert">https://pkg.go.dev/github.com/stretchr/testify/assert</a></p>

<p><a href="https://darjun.github.io/2021/08/11/godailylib/testify/">https://darjun.github.io/2021/08/11/godailylib/testify/</a></p>

<p>1.安装</p>

<pre>
<code>go get github.com/stretchr/testify</code></pre>

<p><code>2. 引入</code></p>

<pre>
<code>
package yours

import (
  &quot;testing&quot;
  &quot;github.com/stretchr/testify/assert&quot;
)

func TestSomething(t *testing.T) {

  assert.True(t, true, &quot;True is true!&quot;)

}</code></pre>

<p>3.测试</p>

<pre>
<code>go test</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

