---
layout: post
title: "antd react button  alert"
date: "2023-08-21"
categories: 
---
<p>react 中使用Antd,在点击按钮忘记密码的时候会触发alert</p>
{% highlight html %}import React from &#39;react&#39;;
class MyComponent extends React.Component {
handleForgetPassword = () =&gt; {
alert(&#39;忘记密码？&#39;);
};
render() {
return (
&lt;Button onClick={this.handleForgetPassword} size=&quot;small&quot; className=&quot;forget-password-button&quot;&gt;
忘记密码?
&lt;/Button&gt;
);
}
}{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
