---
layout: post
title: "react ant add/change created_at "
date: "2023-08-04"
categories: 
---
<p>1.引入ant的 Table</p>

{% highlight %}
{% highlight %}import { Table, Space, Button, message } from &#39;antd&#39;;{% endhighlight %}

<p>2.获得接口的数据的时候增加上创建时间</p>

{% highlight %}
{% highlight %}&nbsp;const response = await axios.get(`${Config.BASE_URL}/api/v1/calculation_plans?token=${getToken()}`);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (response.data.message === &#39;ok&#39;) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const data = response.data.data.map((item) =&gt; ({

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: item.id,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id: item.id,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name: item.name,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; industry: &#39;-&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start_year: item.start_year,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; created_at: item.created_at, // 增加创建时间

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end_year: item.end_year,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculation_template_name: item.calculation_templates.name,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; year_range: `${item.start_year} - ${item.end_year}`,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }));{% endhighlight %}

<p>3.对接口的数据进行处理</p>

{% highlight %}
{% highlight %}<span style="color:#abe338">95 </span>      {
 <span style="color:#f5ab35">96</span>         title: <span style="color:#d4d0ab">&#39;创建时间&#39;,</span>
 <span style="color:#f5ab35">97</span>         dataIndex: <span style="color:#d4d0ab">&#39;created_at&#39;,</span>
 <span style="color:#f5ab35">98</span>         <span style="color:#dcc6e0">key</span>: <span style="color:#d4d0ab">&#39;created_at&#39;,</span>
 <span style="color:#f5ab35">99</span>       },{% endhighlight %}

<p>这样会显示数据：</p>

{% highlight %}
{% highlight %}2023-07-24T15:10:38.820628+08:00{% endhighlight %}

<p>需要修改为北京时间：</p>

<p>最后做出这样的修改：(显示为北京时间：2023/7/24 15:10:38）</p>

{% highlight %}
{% highlight %}import { Table } from &#39;antd&#39;;

const dataSource = [

&nbsp; // 数据源

];

const columns = [

&nbsp; // 其他列配置

&nbsp; {

&nbsp;&nbsp;&nbsp; title: &#39;创建时间&#39;,

&nbsp;&nbsp;&nbsp; dataIndex: &#39;created_at&#39;,

&nbsp;&nbsp;&nbsp; key: &#39;created_at&#39;,

&nbsp;&nbsp;&nbsp; render: (text) =&gt; moment(text).format(&#39;YYYY-MM-DD HH:mm:ss&#39;),

&nbsp; },

];

const MyTable = () =&gt; {

&nbsp; return &lt;Table dataSource={dataSource} columns={columns} /&gt;;

};{% endhighlight %}

