---
layout: post
title: "go gorm automigrate 创建表datasets"
date: "2023-09-07"
categories: 
---
<p>1.在models/model.go增加atuoMigrate</p>

<pre>
<code>&nbsp;db.AutoMigrate(Datasets{})</code></pre>

<p>完整：</p>

<pre>
<code>package models

import (

&nbsp;&nbsp; &nbsp;&quot;fmt&quot;

&nbsp;&nbsp; &nbsp;&quot;log&quot;

&nbsp;&nbsp; &nbsp;&quot;time&quot;

nbsp;&nbsp; &nbsp;&quot;github.com/jinzhu/gorm&quot;

&nbsp;&nbsp; &nbsp;_ &quot;github.com/jinzhu/gorm/dialects/postgres&quot;

&nbsp;&nbsp; &nbsp;&quot;github.com/your_github_name/dongtaipaifang_2_backend/pkg/setting&quot;

)

var db *gorm.DB

type Model struct {

&nbsp;&nbsp; &nbsp;CreatedAt time.Time `json:&quot;created_at&quot;`

&nbsp;&nbsp; &nbsp;UpdatedAt time.Time `json:&quot;updated_at&quot;`

}

func init() {

&nbsp;&nbsp; &nbsp;var (

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;err&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;dbType, dbName, user, password, host, port, tablePrefix string

&nbsp;&nbsp; &nbsp;)

nbsp;&nbsp; &nbsp;sec, err := setting.Cfg.GetSection(&quot;database&quot;)

&nbsp;&nbsp; &nbsp;if err != nil {

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;log.Fatal(2, &quot;Fail to get section &#39;database&#39;: %v&quot;, err)

&nbsp;&nbsp; &nbsp;}

nbsp;&nbsp; &nbsp;dbType = sec.Key(&quot;TYPE&quot;).String()

&nbsp;&nbsp; &nbsp;dbName = sec.Key(&quot;NAME&quot;).String()

&nbsp;&nbsp; &nbsp;user = sec.Key(&quot;USER&quot;).String()

&nbsp;&nbsp; &nbsp;password = sec.Key(&quot;PASSWORD&quot;).String()

&nbsp;&nbsp; &nbsp;host = sec.Key(&quot;HOST&quot;).String()

&nbsp;&nbsp; &nbsp;port = sec.Key(&quot;PORT&quot;).String()

&nbsp;&nbsp; &nbsp;tablePrefix = sec.Key(&quot;TABLE_PREFIX&quot;).String()

nbsp;&nbsp; &nbsp;db, err = gorm.Open(dbType, fmt.Sprintf(&quot;postgres://%s:%s@%s:%s/%s?sslmode=disable&quot;,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;user,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;password,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;host,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;port,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;dbName))

nbsp;&nbsp; &nbsp;if err != nil {

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;log.Println(err)

&nbsp;&nbsp; &nbsp;}

nbsp;&nbsp; &nbsp;gorm.DefaultTableNameHandler = func(db *gorm.DB, defaultTableName string) string {

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return tablePrefix + defaultTableName

&nbsp;&nbsp; &nbsp;}

nbsp;&nbsp; &nbsp;db.SingularTable(true)

&nbsp;&nbsp; &nbsp;db.LogMode(true)

&nbsp;&nbsp; &nbsp;db.DB().SetMaxIdleConns(10)

&nbsp;&nbsp; &nbsp;db.DB().SetMaxOpenConns(100)

nbsp;&nbsp; &nbsp;// migrate(写所有的表)

&nbsp;&nbsp; &nbsp;db.AutoMigrate(HistoryLoginLogs{})

&nbsp;&nbsp; &nbsp;db.AutoMigrate(Materials{})

&nbsp;&nbsp; &nbsp;db.AutoMigrate(Datasets{})

&nbsp;&nbsp; &nbsp;db.AutoMigrate(Users{})

&nbsp;&nbsp; &nbsp;db.AutoMigrate(VerificationCodes{})

}

func CloseDB() {
  defer db.Close()
}</code></pre>

<p>2.增加models/datasets.go,写增删改查的方法。类似于：</p>

<pre>
<code>package models

type Datasets struct {

&nbsp;&nbsp; &nbsp;ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;primary_key&quot; json:&quot;id&quot;`

&nbsp;&nbsp; &nbsp;UserId&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `json:&quot;user_id&quot;`

&nbsp;&nbsp; &nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `json:&quot;name&quot;`

&nbsp;&nbsp; &nbsp;PercentageData&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;type:text&quot; json:&quot;percentage_data&quot;`

&nbsp;&nbsp; &nbsp;DataSheet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;type:text&quot; json:&quot;data_sheet&quot;`

&nbsp;&nbsp; &nbsp;DataSheetProcessed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;type:text&quot; json:&quot;data_sheet_processed&quot;`

&nbsp;&nbsp; &nbsp;PercentageDataProcessed&nbsp; string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;type:text&quot; json:&quot;percentage_data_processed&quot;`

&nbsp;&nbsp; &nbsp;Model

}

func GetDatasets(pageNum int, pageSize int, maps interface{}) (datasets []Datasets) {

&nbsp;&nbsp; &nbsp;db.Where(maps).Offset(pageNum).Limit(pageSize).Find(&amp;datasets)

&nbsp;&nbsp; &nbsp;return

}

func GetDatasetTotalCount() (count int) {

&nbsp;&nbsp; &nbsp;db.Model(&amp;Datasets{}).Count(&amp;count)

nbsp;&nbsp; &nbsp;return

}

func GetDatasetTotal(maps interface{}) (count int) {

&nbsp;&nbsp; &nbsp;db.Model(&amp;Datasets{}).Where(maps).Count(&amp;count)

nbsp;&nbsp; &nbsp;return

}

func GetDatasetDetail(id int) (dataSheet Datasets) {

&nbsp;&nbsp; &nbsp;db.Where(&quot;id = ?&quot;, id).First(&amp;dataSheet)

nbsp;&nbsp; &nbsp;return

}

func AddDataset(name string, UserId int, percentageData [][]string, dataSheet [][]string, dataSheetProcessed [][]string, percentageDataProcessed [][]string) *Datasets {

&nbsp;&nbsp; &nbsp;plan := &amp;Datasets{

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name,

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PercentageData:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; convertToString(percentageData),

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PercentageDataProcessed:&nbsp; convertToString(percentageDataProcessed),

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;DataSheet:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; convertToString(dataSheet),

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;DataSheetProcessed:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; convertToString(dataSheetProcessed),

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;UserId:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserId,

&nbsp;&nbsp; &nbsp;}

&nbsp;&nbsp; &nbsp;db.Create(plan)

nbsp;&nbsp; &nbsp;return plan

}

func UpdateDataset(id int, data interface{}, UserId int) bool {

&nbsp;&nbsp; &nbsp;db.Model(&amp;Datasets{}).Where(&quot;id = ?&quot;, id).Updates(data).Update(&quot;UserId&quot;, UserId)

nbsp;&nbsp; &nbsp;return true

}

func DeleteDataset(id int) bool {

&nbsp;&nbsp; &nbsp;db.Where(&quot;id = ?&quot;, id).Delete(&amp;Datasets{})

nbsp;&nbsp; &nbsp;return true

}</code></pre>

<p>3.注意我在models/dataset.go使用了convertToString的方法，但是没有声明，是因为在其他model已经写了，在Dataset中可以直接调用，不需要重复声明：</p>

<pre>

<code>func convertToString(data [][]string) string {

&nbsp; var result string

&nbsp; for _, row := range data {

&nbsp;&nbsp;&nbsp; result += strings.Join(row, &quot;,&quot;) + &quot;\n&quot;

&nbsp; }

&nbsp; return result

}</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

