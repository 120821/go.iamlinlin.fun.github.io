---
layout: post
title: "go test -run 仅仅测试特定测试方法"
date: "2023-11-04"
categories: 
---
<p><a href="https://www.coder.work/article/195897">www.coder.work/article/195897</a></p>
<p><a href="https://freshman.tech/snippets/go/run-specific-test/">https://freshman.tech/snippets/go/run-specific-test/</a></p>
<p>例如测试A B：</p>
{% highlight html %}package main
import (
&quot;testing&quot;
&quot;github.com/stretchr/testify/assert&quot;
)
func TestA(t *testing.T) {
assert.True(t, true)
}
func TestB(t *testing.T) {
assert.True(t, false)
}{% endhighlight %}
<p>如果都测试使用：</p>
{% highlight html %}go test{% endhighlight %}
<p>如果仅仅测试其中一个：</p>
{% highlight html %}go test -run B{% endhighlight %}
