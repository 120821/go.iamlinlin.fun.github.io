---
layout: post
title: "go 数据处理，json string 格式转换"
date: "2023-10-17"
categories: 
---
<p>我想得到这样的数据:</p>
{% highlight html %}[{&quot;bank_count&quot;:&quot;2151.39408452&quot;,&quot;emission_all&quot;:&quot;38.77887139&quot;,&quot;emission_discard&quot;:&quot;22.52280019&quot;,&quot;emission_init&quot;:&quot;12.13200000&quot;,&quot;emission_operation&quot;:&quot;4.04400000&quot;,&quot;emission_service&quot;:&quot;0.08007120&quot;,&quot;year&quot;:2022},{&quot;bank_count&quot;:&quot;2152.45807764&quot;,&quot;emission_all&quot;:&quot;65.10216445&quot;,&quot;emission_discard&quot;:&quot;44.98440754&quot;,&quot;emission_init&quot;:&quot;12.13800000&quot;,&quot;emission_operation&quot;:&quot;7.82482537&quot;,&quot;emission_service&quot;:&quot;0.15493154&quot;,&quot;year&quot;:2023},{&quot;bank_count&quot;:&quot;2153.52207075&quot;,&quot;emission_all&quot;:&quot;90.66406302&quot;,&quot;emission_discard&quot;:&quot;66.94947924&quot;,&quot;emission_init&quot;:&quot;12.14400000&quot;,&quot;emission_operation&quot;:&quot;11.34593428&quot;,&quot;emission_service&quot;:&quot;0.22464950&quot;,&quot;year&quot;:2024},{&quot;bank_count&quot;:&quot;2154.58606387&quot;,&quot;emission_all&quot;:&quot;115.19234497&quot;,&quot;emission_discard&quot;:&quot;88.13786276&quot;,&quot;emission_init&quot;:&quot;12.15000000&quot;,&quot;emission_operation&quot;:&quot;14.61510317&quot;,&quot;emission_service&quot;:&quot;0.28937904&quot;,&quot;year&quot;:2025},{&quot;bank_count&quot;:&quot;2155.65005699&quot;,&quot;emission_all&quot;:&quot;138.52316995&quot;,&quot;emission_discard&quot;:&quot;108.37501114&quot;,&quot;emission_init&quot;:&quot;12.15600000&quot;,&quot;emission_operation&quot;:&quot;17.64283076&quot;,&quot;emission_service&quot;:&quot;0.34932805&quot;,&quot;year&quot;:2026},{&quot;bank_count&quot;:&quot;2156.71405011&quot;,&quot;emission_all&quot;:&quot;160.56750484&quot;,&quot;emission_discard&quot;:&quot;127.55951374&quot;,&quot;emission_init&quot;:&quot;12.16200000&quot;,&quot;emission_operation&quot;:&quot;20.44125426&quot;,&quot;emission_service&quot;:&quot;0.40473683&quot;,&quot;year&quot;:2027}]{% endhighlight %}
<p>现在的数据是</p>
{% highlight html %}[[年份 总排放 废弃排放量 初始排放量 运行排放 维修排放] [2022 38.77887139 22.52280019 12.13200000 0.08007120 4.04400000] [2023 65.10216445 44.98440754 12.13800000 0.15493154 7.82482537] [2024 90.66406302 66.94947924 12.14400000 0.22464950 11.34593428] [2025 115.19234497 33 12.15000000 0.28937904 14.61510317] [2026 138.52316995 221 12.15600000 0.34932805 17.64283076] [2027 160.56750484 111 12.16200000 0.40473683 20.44125426]]{% endhighlight %}
<p>可以这样处理：</p>
{% highlight html %}import &quot;encoding/json&quot;
// ...
var targetData []map[string]interface{}
for i, row := range req.ResultData {
// Skip the header row
if i == 0 {
continue
}
item := make(map[string]interface{})
item[&quot;bank_count&quot;] = row[1]
item[&quot;emission_all&quot;] = row[2]
item[&quot;emission_discard&quot;] = row[3]
item[&quot;emission_init&quot;] = row[4]
item[&quot;emission_operation&quot;] = row[5]
item[&quot;emission_service&quot;] = row[6]
year, _ := strconv.Atoi(row[0])
item[&quot;year&quot;] = year
targetData = append(targetData, item)
}
jsonData, err := json.Marshal(targetData)
if err != nil {
// 处理错误
}
fmt.Println(string(jsonData)){% endhighlight %}
