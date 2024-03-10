---
layout: post
title: "Promise.prototype.then()的简单使用"
date: "2023-09-13"
categories: 
---
<p>refer: <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then</a></p>
<p>Promise 实例的 then() 方法最多接受两个参数：Promise 的已完成和已拒绝情况的回调函数。</p>
<p>它会立即返回一个等效的 Promise 对象，允许链接对其他 Promise 方法的调用。</p>
<p>经常用于做一些比较耗时的异步操作, 常见的是HTTP中:</p>
<p>例如：new Promise(发送http请求 ).then( 处理返回的response).fail(如果失败了该怎么操作)</p>
<p>有3个状态： resove (正常) , reject （出错) , pending ( 运行中)</p>
<p>demo1: vim promise_then.js</p>
{% highlight html %}const promise1 = new Promise((resolve, reject) =&gt; {
resolve(&#39;Success!&#39;);
});
promise1.then((value) =&gt; {
console.log(value);
// Expected output: &quot;Success!&quot;
});{% endhighlight %}
<p>运行后输出：</p>
{% highlight html %}node promise_then.js{% endhighlight %}
{% highlight html %}&gt; &quot;Success!&quot;{% endhighlight %}
<p><a href="http://siwei.me/blog/posts/es6-promise-new-promise-resolve">http://siwei.me/blog/posts/es6-promise-new-promise-resolve</a></p>
<p>demo2: vim promise_then_2.js</p>
{% highlight html %}let result = new Promise( (resolve, reject ) =&gt; {
let result = 0
setTimeout( () =&gt; {
console.info(&quot;sleep n ms...&quot;)
result = 200
resolve(result)   // 注意，这里的 resolve, 就相当于是返回了。resolve和reject必须返回一个才行。
}, 3000)
})
result.then( (temp) =&gt; {
console.info(&quot;result : &quot;, temp)
}){% endhighlight %}
<p>运行：</p>
{% highlight html %}node promise_then_2.js{% endhighlight %}
<p>&nbsp;&nbsp;&nbsp; 输出：</p>
{% highlight html %}sleep n ms...
result :  200{% endhighlight %}
<p>demo:&nbsp; <a href="https://github.com/120821/react_test_20230724">https://github.com/120821/react_test_20230724</a></p>
