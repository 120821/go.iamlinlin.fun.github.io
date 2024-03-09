---
layout: post
title: "go  assert equal 的使用"
date: "2023-11-03"
categories: 
---
<p><a href="https://pkg.go.dev/github.com/stretchr/testify/assert">https://pkg.go.dev/github.com/stretchr/testify/assert</a></p>

<p>如果结果和预期结果不同，那么会返回err, 并显示两个结果的区别</p>

<pre>
<code>
import (
  &quot;testing&quot;
  &quot;github.com/stretchr/testify/assert&quot;
)

func TestSomething(t *testing.T) {

  var a string = &quot;Hello&quot;
  var b string = &quot;Hello&quot;

  assert.Equal(t, a, b, &quot;The two words should be the same.&quot;)

}</code></pre>

