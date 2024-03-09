---
layout: post
title: "react button to link"
date: "2023-08-11"
categories: 
---
<p>1.使用link</p>

<p>引入link</p>

<pre>
<code>&nbsp;&nbsp; import { Link } from &#39;react-router-dom&#39;;</code></pre>

<p>然后在button处增加link</p>

<pre>
<code>&lt;Link to={`/view_calculation_results/`}&gt;

&nbsp; &lt;Button type=&quot;primary&quot; style={{ marginRight: &#39;15px&#39; }}&gt;

&nbsp;&nbsp;&nbsp;&nbsp; 查看参数

&nbsp; &lt;/Button&gt;

&lt;/Link&gt;</code></pre>

<p>2.使用方法</p>

<p>首先写方法：类似这样：</p>

<pre>
<code>export default class CalculationViewResult extends Component {

&nbsp; constructor(props) {

&nbsp;&nbsp;&nbsp; super(props);

nbsp;&nbsp;&nbsp; this.state = {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data: props.location.state.data || {},

&nbsp;&nbsp;&nbsp; };

&nbsp; }

// 定义在这里

&nbsp; handleViewClick = (id) =&gt; { &nbsp;&nbsp;

&nbsp;&nbsp;&nbsp; // 处理其他的逻辑，如果需要的话</code></pre>

<p><code>&nbsp;&nbsp;&nbsp; // 导航到参数详情页<br />
&nbsp;&nbsp;&nbsp; this.props.history.push(`/view_calculation_results/`);<br />
&nbsp; }</code></p>

<p>然后在button里调用：</p>

<p><code>&nbsp;&lt;Button type=&quot;primary&quot; onClick={() =&gt; this.handleViewClick(data.data.id)}&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp; 查看参数<br />
&lt;/Button&gt;</code></p>

<p>&nbsp;</p>

