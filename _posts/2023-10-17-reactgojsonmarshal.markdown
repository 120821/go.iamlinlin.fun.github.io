---
layout: post
title: "react go json.Marshal 的使用"
date: "2023-10-17"
categories: 
---
<p>我在go有这样的update代码:</p>

<pre>
<code>type UpdateCalculationTemplateRequest struct {
  Name string `json:&quot;name&quot;`
  FoamParamsData [][]string `json:&quot;foamParamsData&quot;`
  RefrigerationParamsData [][]string `json:&quot;refrigerationParamsData&quot;`
}

func UpdateCalculationTemplate(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param(&quot;id&quot;))

  var req UpdateCalculationTemplateRequest
  if err := c.ShouldBindJSON(&amp;req); err != nil {
    c.JSON(http.StatusBadRequest, gin.H{&quot;error&quot;: err.Error()})
    fmt.Println(&quot;   == got error&quot;, err.Error())
    return
  }

  fmt.Println(&quot;======= UpdateCalculationTemplate, req &quot;, req)
	data := make(map[string]interface{})
	if req.Name != &quot;&quot; {
		data[&quot;name&quot;] = req.Name
	}

	if len(req.FoamParamsData) != 0 {
    foamParamsData := req.FoamParamsData
		data[&quot;foam_params_data&quot;] = foamParamsData
	}

	if len(req.RefrigerationParamsData) != 0 {
    refrigerationParamsData := req.RefrigerationParamsData
		data[&quot;refrigeration_params_data&quot;] = refrigerationParamsData
	}

  fmt.Println(&quot;== id: &quot;, id)
	models.UpdateCalculationTemplate(id, data)

	c.JSON(http.StatusOK, gin.H{
		&quot;message&quot;: &quot;ok&quot;,
	})
}{% endhighlight %}

<p>在前端已经可以看到发送了请求，数据格式也是正确的，在go也可以打印出数据，但是不能udpate：</p>

<pre>
<code>== data:  map[foam_params_data:[[第n年 生产排放因子(factor_production) 年度排放因子(factor_by_year) 退役排放因子(factor_tui_yi)] [1 0.02 0.01 0.01] [2 0.02 0.01 0.01] [3 0.02 0.01 0.01] [4 0.02 0.01 0.01] [5 0.02 0.01 0.01] [6 0.02 0.01 0.01] [7 0.02 0.01 0.01] [8 0.02 0.01 0.01] [9 0.02 0.01 0.01] [10 0.02 0.01 0.01] [11 0.02 0.01 0.01] [12 0.02 0.01 0.01] [13 0.02 0.01 0.01] [14 0.02 0.01 0.01] [15 0.02 0.01 0.01] [16 0.2 0.2 0.2] [17 0.2 0.2 0.2] [18 0.2 0.2 0.2] [19 0.2 0.2 0.2] [20 0.2 0.2 0.2]]]

(/workspace/dongtaipaifang_2_backend/models/calculation_templates.go:82) 
[2023-10-17 14:43:26]  [0.49ms]  UPDATE &quot;calculation_templates&quot; SET &quot;foam_params_data&quot; = &#39;&#39;, &quot;updated_at&quot; = &#39;2023-10-17 14:43:26&#39;  WHERE (id = 22)  
[1 rows affected or returned ] {% endhighlight %}

<p>可以使用json.Marshal对数据处理：</p>

<p>目的是：</p>

<p><code><span style="font-family:sans-serif, Arial, Verdana, Trebuchet MS">把</span>[][]string</code>保存到PostgreSQL数据库中的<code>text</code>字段，数据转换为JSON格式进行存储。</p>

<p>（在Go语言中，可以使用<code>encoding/json</code>包来实现JSON序列化和反序列化。）</p>

<pre>
<code>package main

import (
	&quot;database/sql&quot;
	&quot;encoding/json&quot;
	&quot;fmt&quot;

	_ &quot;github.com/lib/pq&quot;
)

type Data struct {
	RefrigerationParamsData [][]string `json:&quot;refrigeration_params_data&quot;`
	FoamParamsData          [][]string `json:&quot;foam_params_data&quot;`
}

func main() {
	// 示例的二维切片
	refrigerationParamsData := [][]string{
		{&quot;1&quot;, &quot;2&quot;, &quot;3&quot;},
		{&quot;4&quot;, &quot;5&quot;, &quot;6&quot;},
		{&quot;7&quot;, &quot;8&quot;, &quot;9&quot;},
	}
	foamParamsData := [][]string{
		{&quot;A&quot;, &quot;B&quot;, &quot;C&quot;},
		{&quot;D&quot;, &quot;E&quot;, &quot;F&quot;},
		{&quot;G&quot;, &quot;H&quot;, &quot;I&quot;},
	}

	// 创建数据结构
	data := Data{
		RefrigerationParamsData: refrigerationParamsData,
		FoamParamsData:          foamParamsData,
	}

	// 将数据结构转换为JSON字符串
	jsonData, err := json.Marshal(data)
	if err != nil {
		panic(err)
	}
	jsonStr := string(jsonData)

	// 连接到PostgreSQL数据库
	db, err := sql.Open(&quot;postgres&quot;, &quot;host=localhost port=5432 user=your_username dbname=your_dbname password=your_password sslmode=disable&quot;)
	if err != nil {
		panic(err)
	}
	defer db.Close()

	// 执行数据库插入操作
	_, err = db.Exec(&quot;INSERT INTO your_table_name (refrigeration_params_data, foam_params_data) VALUES ($1, $2)&quot;, jsonStr, jsonStr)
	if err != nil {
		panic(err)
	}

	fmt.Println(&quot;Data inserted successfully!&quot;)
}
{% endhighlight %}

<p>&nbsp;</p>

