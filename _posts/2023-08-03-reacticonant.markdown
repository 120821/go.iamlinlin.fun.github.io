---
layout: post
title: "react icon ant 的简单使用"
date: "2023-08-03"
categories: 
---
<p>refer: <a href="https://ant.design/docs/react/getting-started-cn">https://ant.design/docs/react/getting-started-cn</a></p>

<p>1.引入ant</p>

<pre>
<code>npm install antd --save{% endhighlight %}

<p>2.在页面引用：</p>

<pre>
<code>import { StarOutlined } from &#39;@ant-design/icons&#39;;{% endhighlight %}

<p>如果想要引入多个icon，可以这样书写：</p>

<pre>
<code>import { UserOutlined, MailOutlined, PieChartOutlined } from &#39;@ant-design/icons&#39;;{% endhighlight %}

<p>上面这行代码就是在页面引入了ant的icon StarOutlined,在页面显示的是一个空心的星星</p>

<p>3.在需要的位置使用这个icon</p>

<pre>
<code>&lt;Button type=&quot;primary&quot; onClick={() =&gt; this.handleViewClick(record.id)}&gt;

&nbsp; &lt;StarOutlined /&gt;

&nbsp; 查看

&lt;/Button&gt;{% endhighlight %}

<p>上面这段代码是在查看这个button左侧增加了这个星星icon，如果你想设置css，例如居右8px等，可以使用：</p>

<pre>
<code>&lt;StarOutlined style={{ marginRight: 8 }} /&gt;{% endhighlight %}

<p>如果是在&#39;&#39;中引用，可以这样书写：</p>

<pre>
<code>{
    title: (
      &lt;span&gt;
        &lt;StarOutlined style={{ marginRight: 8 }} /&gt;
        所属计算方案名称
      &lt;/span&gt;
    ),
    dataIndex: &#39;calculation_plan_name&#39;,
    key: &#39;calculation_plan_name&#39;,
  },{% endhighlight %}

