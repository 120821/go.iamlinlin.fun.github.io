---
layout: post
title: "react handsontable 的简单使用"
date: "2023-08-08"
categories: 
---
<p>refer: <a href="https://handsontable.com/docs/react-data-grid/configuration-options/">https://handsontable.com/docs/react-data-grid/configuration-options/</a></p>

<p>1.安装依赖：<a href="https://handsontable.com/docs/react-data-grid/installation/">https://handsontable.com/docs/react-data-grid/installation/</a></p>

{% highlight %}
{% highlight %}npm install handsontable @handsontable/react{% endhighlight %}

<p>或在public/index.html引入：</p>

{% highlight %}
{% highlight %}&lt;script src=&quot;https://cdn.jsdelivr.net/npm/handsontable@13.0/dist/handsontable.full.min.js&quot;&gt;&lt;/script&gt;

&lt;link type=&quot;text/css&quot; rel=&quot;stylesheet&quot; href=&quot;https://cdn.jsdelivr.net/npm/handsontable@13.0/dist/handsontable.full.min.css&quot; /&gt;

&lt;script src=&quot;https://cdn.jsdelivr.net/npm/react@17/umd/react.production.min.js&quot;&gt;&lt;/script&gt;

&lt;script src=&quot;https://cdn.jsdelivr.net/npm/react-dom@17/umd/react-dom.production.min.js&quot;&gt;&lt;/script&gt;

&lt;script src=&quot;https://cdn.jsdelivr.net/npm/@handsontable/react@13.0/dist/react-handsontable.min.js&quot;&gt;&lt;/script&gt;

&lt;script src=&quot;https://handsontable.com/docs/scripts/fixer.js&quot;&gt;&lt;/script&gt;{% endhighlight %}

<p>2.使用<br />
可以创建组件进行使用：</p>

<p>创建组件：cat src/pages/Table/ExcelHandsonTableDemo/index.jsx</p>

{% highlight %}
{% highlight %}import React, { Component } from &#39;react&#39;

import { Table, Space, Button, message } from &#39;antd&#39;;

import axios from &#39;axios&#39;;

import Config from &#39;@/settings&#39;;

import { getToken, removeToken } from &#39;@/utils/auth&#39;;

import LuckySheet from &#39;@/compontens/LuckySheet&#39;;

export default class ExcelHandsonTableDemo extends Component {

&nbsp; componentDidMount() {

&nbsp; }
&nbsp; render() {

&nbsp;&nbsp;&nbsp; return (

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;LuckySheet/&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/&gt;

&nbsp;&nbsp;&nbsp; )

&nbsp; }

}{% endhighlight %}

<p>然后在页面进行引入：</p>

{% highlight %}
{% highlight %}cat src/pages/Table/Calculation/index.jsx

import React, { Component } from &#39;react&#39;;

import { Table, Divider, Button, message } from &#39;antd&#39;;

import HandsonTable from &quot;@/compontens/HandsonTable&quot;;

import axios from &#39;axios&#39;;

import Config from &#39;@/settings&#39;;

import { getToken, removeToken } from &#39;@/utils/auth&#39;;

class Calculation extends Component {

&nbsp; constructor(props) {

&nbsp;&nbsp;&nbsp; super(props);

&nbsp;&nbsp;&nbsp; this.tableRefs = {};

&nbsp;&nbsp;&nbsp; this.state = {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data: props.location.state.data,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name: props.location.state.name,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; templateId: props.location.state.templateId,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; startYear: props.location.state.startYear,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endYear: props.location.state.endYear,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; materialIds: props.location.state.materialIds,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; materialName: props.location.state.materialName,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plan_id: props.location.state.plan_id,

&nbsp;&nbsp;&nbsp; }

&nbsp; }

&nbsp; state = {

&nbsp;&nbsp;&nbsp; data: [],

&nbsp;&nbsp;&nbsp; loading: true,

&nbsp; }

&nbsp; handleNext = async() =&gt; {

&nbsp;&nbsp;&nbsp; const { plan_id, name, templateId, materialIds, startYear, endYear, materialName } = this.state;

&nbsp;&nbsp;&nbsp; const sales = this.tableRefs[&#39;Sales&#39;].hot.getData();

&nbsp;&nbsp;&nbsp; const deviceSales = this.tableRefs[&#39;deviceSales&#39;].hot.getData();

&nbsp;&nbsp;&nbsp; const requestSalesData = {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sales: sales.map(row =&gt; row.map(cell =&gt; String(cell))),

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deviceSales: deviceSales.map(row =&gt; row.map(cell =&gt; String(cell))),

&nbsp;&nbsp;&nbsp; };

&nbsp;&nbsp;&nbsp; try {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const response = await axios.post(`${Config.BASE_URL}/api/v1/calculation_plan_fetch_excel_data?token=${getToken()}`, requestSalesData);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (response.data.message === &#39;ok&#39;) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message.success(&#39;数据发送成功&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message.error(&#39;数据发送失败&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; } catch (error) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.error(&#39;Error:&#39;, error);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //removeToken();

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //window.location.href = &#39;/&#39;;

&nbsp;&nbsp;&nbsp; }

render() {

&nbsp;&nbsp;&nbsp; const { data, name, templateId, startYear, endYear, materialName } = this.state;

nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const showColumns = [

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title: &#39;起止年份&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dataIndex: &#39;year&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: &#39;year&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...materialName.map((name) =&gt; ({

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title: name,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dataIndex: &#39;materialNames&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: &#39;materialNames&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })),

&nbsp;&nbsp;&nbsp; ]

nbsp;&nbsp;&nbsp; const tableData1 = [

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&#39;&#39;, ...materialName],

&nbsp;&nbsp;&nbsp; ];

&nbsp;&nbsp;&nbsp; for (let i = 0; i &lt;= (endYear - startYear); i++) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const year = startYear + i;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const rowData = [year];

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (let j = 1; j &lt; 5; j++) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rowData.push(null);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tableData1.push(rowData);

&nbsp;&nbsp;&nbsp; }

nbsp;&nbsp;&nbsp; const tableData2 = tableData1;

&nbsp;&nbsp;&nbsp; return (

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div style={{ display: &#39;flex&#39; }}&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h2&gt;handsontable 1&lt;/h2&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;HandsonTable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref={(ref) =&gt; { this.tableRefs[&#39;Sales&#39;] = ref; }} // 存储 Ref 到 tableRefs 对象中

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id=&quot;Sales&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data={tableData1}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div style={{ marginLeft: &#39;50px&#39; }}&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h2&gt;handsontable 2&lt;/h2&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;HandsonTable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref={(ref) =&gt; { this.tableRefs[&#39;deviceSales&#39;] = ref; }} // 存储 Ref 到 tableRefs 对象中

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id=&quot;deviceSales&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data={tableData2}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Button type=&quot;primary&quot; onClick={this.handleNext}&gt;下一步&lt;/Button&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/&gt;

&nbsp;&nbsp;&nbsp; )

&nbsp; }

}

export default Calculation;{% endhighlight %}

<p>在前端就完成了，注意这里对数据的处理与后端应该保持一致，例如数据的类型，以及传递参数使用json对handsontable的数据应该做一个处理：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deviceSales: deviceSales.map(row =&gt; row.map(cell =&gt; String(cell))),</p>

<p>如果是数据已经一致就不需要进行处理。</p>

<p>后端go是这样：</p>

{% highlight %}
{% highlight %}type CalculationPlanRequest struct {

&nbsp; Sales [][]string `json:&quot;sales&quot;`

&nbsp; deviceSales [][]string `json:&quot;deviceSales&quot;`

}

func FetchExcelData(c *gin.Context) {

&nbsp; var req CalculationPlanRequest

&nbsp; if err := c.ShouldBindJSON(&amp;req); err != nil {

&nbsp;&nbsp;&nbsp; c.JSON(http.StatusBadRequest, gin.H{&quot;error&quot;: err.Error()})

&nbsp;&nbsp;&nbsp; return

&nbsp; }

nbsp; fmt.Println(&quot;==req=========&quot;, req)

&nbsp; sales := req.Sales

&nbsp; fmt.Println(&quot;======sales=====&quot;, sales)

&nbsp; token := c.Query(&quot;token&quot;)

&nbsp; data, _ := util.ParseToken(token)

&nbsp; user := models.GetUserByLogin(data.Login)

&nbsp; fmt.Println(&quot;======user=====&quot;, user)

nbsp; c.JSON(http.StatusOK, gin.H{

&nbsp;&nbsp;&nbsp; &quot;message&quot;: &quot;ok&quot;,

&nbsp; })

}{% endhighlight %}

