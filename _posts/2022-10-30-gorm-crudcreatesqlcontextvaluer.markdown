---
layout: post
title: "gorm - CRUD 接口 (create) 使用 SQL 表达式、Context Valuer 创建记录 关联 默认值"
date: "2022-10-30"
categories: 
---
<p><a href="https://learnku.com/docs/gorm/v2/create/9732#46c90b">https://learnku.com/docs/gorm/v2/create/9732#46c90b</a></p>

<p>GORM 允许使用 SQL 表达式插入数据，有两种方法实现这个目标。根据 <code>map[string]interface{}</code> 或 <a href="https://learnku.com/docs/gorm/v2/data_types#gorm_valuer_interface">自定义数据类型</a> 创建，例如：</p>

<pre>
<code>// 通过 map 创建记录

db.Model(User{}).Create(map[string]interface{}{

&nbsp; &quot;Name&quot;: &quot;jinzhu&quot;,

&nbsp; &quot;Location&quot;: clause.Expr{SQL: &quot;ST_PointFromText(?)&quot;, Vars: []interface{}{&quot;POINT(100 100)&quot;}},

})

// INSERT INTO `users` (`name`,`point`) VALUES (&quot;jinzhu&quot;,ST_PointFromText(&quot;POINT(100 100)&quot;));</code></pre>

<p>&nbsp;</p>

<pre><code>// 通过自定义类型创建记录<br />
type Location struct {<br />
&nbsp;&nbsp;&nbsp; X, Y int<br />
} / Scan 方法实现了 sql.Scanner 接口<br />
func (loc *Location) Scan(v interface{}) error {<br />
&nbsp; // Scan a value into struct from database driver<br />
} func (loc Location) GormDataType() string {<br />
&nbsp; return &quot;geometry&quot;<br />
} func (loc Location) GormValue(ctx context.Context, db *gorm.DB) clause.Expr {<br />
&nbsp; return clause.Expr{<br />
&nbsp;&nbsp;&nbsp; SQL:&nbsp; &quot;ST_PointFromText(?)&quot;,<br />
&nbsp;&nbsp;&nbsp; Vars: []interface{}{fmt.Sprintf(&quot;POINT(%d %d)&quot;, loc.X, loc.Y)},<br />
&nbsp; }<br />
} type User struct {<br />
&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp; string<br />
&nbsp; Location Location<br />
} db.Create(&amp;User{<br />
&nbsp; Name:&nbsp;&nbsp;&nbsp;&nbsp; &quot;jinzhu&quot;,<br />
&nbsp; Location: Location{X: 100, Y: 100},<br />
})<br />
// INSERT INTO `users` (`name`,`point`) VALUES (&quot;jinzhu&quot;,ST_PointFromText(&quot;POINT(100 100)&quot;))</code></pre>

<p id="f43bde"><strong>关联创建</strong></p>

<p>创建关联数据时，如果关联值是非零值，这些关联会被 upsert，且它们的 <code>Hook</code> 方法也会被调用</p>

<pre>
<code>type CreditCard struct {

&nbsp; gorm.Model

&nbsp; Number&nbsp;&nbsp; string

&nbsp; UserID&nbsp;&nbsp; uint

}

type User struct {

&nbsp; gorm.Model

&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string

&nbsp; CreditCard CreditCard

}

db.Create(&amp;User{

&nbsp; Name: &quot;jinzhu&quot;,

&nbsp; CreditCard: CreditCard{Number: &quot;411111111111&quot;}

})

// INSERT INTO `users` ...

// INSERT INTO `credit_cards` ...</code></pre>

<p>您也可以通过 <code>Select</code>、 <code>Omit</code> 跳过关联保存，例如：</p>

<pre>
<code>db.Omit(&quot;CreditCard&quot;).Create(&amp;user)

// 跳过所有关联

db.Omit(clause.Associations).Create(&amp;user)</code></pre>

<p id="225f3e"><strong>默认值</strong></p>

<p>您可以通过标签 <code>default</code> 为字段定义默认值，如：</p>

<pre>
<code>type User struct {

&nbsp; ID&nbsp;&nbsp; int64

&nbsp; Name string `gorm:&quot;default:galeone&quot;`

&nbsp; Age&nbsp; int64&nbsp; `gorm:&quot;default:18&quot;`

}</code></pre>

<p>插入记录到数据库时，默认值 <em>会被用于</em> 填充值为 <a href="https://tour.golang.org/basics/12" rel="nofollow noopener noreferrer">零值</a> 的字段</p>

<p>像 <code>0</code>、<code>&#39;&#39;</code>、<code>false</code> 等零值，不会将这些字段定义的默认值保存到数据库。您需要使用指针类型或 Scanner/Valuer 来避免这个问题，例如：</p>

<pre>
<code>type User struct {

&nbsp; gorm.Model

&nbsp; Name string

&nbsp; Age&nbsp; *int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `gorm:&quot;default:18&quot;`

&nbsp; Active sql.NullBool `gorm:&quot;default:true&quot;`

}</code></pre>

<p>若要数据库有默认、虚拟 / 生成的值，你必须为字段设置 <code>default</code> 标签。若要在迁移时跳过默认值定义，你可以使用 <code>default:(-)</code>，例如：</p>
<rep><code>type User struct {<br />
&nbsp; ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string `gorm:&quot;default:uuid_generate_v3()&quot;` // 数据库函数<br />
&nbsp; FirstName string<br />
&nbsp; LastName&nbsp; string<br />
&nbsp; Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8<br />
&nbsp; FullName&nbsp; string `gorm:&quot;-&gt;;type:GENERATED ALWAYS AS (concat(firstname,&#39; &#39;,lastname));default:(-);`<br />
}</code>

<p>使用虚拟 / 生成的值时，你可能需要禁用它的创建、更新权限，查看 <a href="https://learnku.com/docs/gorm/v2/models#field_permission">字段级权限</a> 获取详情</p>

<p id="3b5fac">Upsert 及冲突</p>

<p>GORM 为不同数据库提供了兼容的 Upsert 支持</p>

<pre>
<code>import &quot;gorm.io/gorm/clause&quot;

// 有冲突时什么都不做

db.Clauses(clause.OnConflict{DoNothing: true}).Create(&amp;user)

// 当 `id` 有冲突时，更新指定列为默认值

db.Clauses(clause.OnConflict{

&nbsp; Columns:&nbsp;&nbsp; []clause.Column{{Name: &quot;id&quot;}},

&nbsp; DoUpdates: clause.Assignments(map[string]interface{}{&quot;role&quot;: &quot;user&quot;}),

}).Create(&amp;users)

// MERGE INTO &quot;users&quot; USING *** WHEN NOT MATCHED THEN INSERT *** WHEN MATCHED THEN UPDATE SET ***; SQL Server

// INSERT INTO `users` *** ON DUPLICATE KEY UPDATE ***; MySQL

// 当 `id` 有冲突时，更新指定列为新值

db.Clauses(clause.OnConflict{

&nbsp; Columns:&nbsp;&nbsp; []clause.Column{{Name: &quot;id&quot;}},

&nbsp; DoUpdates: clause.AssignmentColumns([]string{&quot;name&quot;, &quot;age&quot;}),

}).Create(&amp;users)

// MERGE INTO &quot;users&quot; USING *** WHEN NOT MATCHED THEN INSERT *** WHEN MATCHED THEN UPDATE SET &quot;name&quot;=&quot;excluded&quot;.&quot;name&quot;; SQL Server

// INSERT INTO &quot;users&quot; *** ON CONFLICT (&quot;id&quot;) DO UPDATE SET &quot;name&quot;=&quot;excluded&quot;.&quot;name&quot;, &quot;age&quot;=&quot;excluded&quot;.&quot;age&quot;; PostgreSQL

// INSERT INTO `users` *** ON DUPLICATE KEY UPDATE `name`=VALUES(name),`age=VALUES(age); MySQL

// Update all columns expects primary keys to new value on conflict

db.Clauses(clause.OnConflict{

&nbsp; UpdateAll: true

}).Create(&amp;users)

// INSERT INTO &quot;users&quot; *** ON CONFLICT (&quot;id&quot;) DO UPDATE SET &quot;name&quot;=&quot;excluded&quot;.&quot;name&quot;, &quot;age&quot;=&quot;excluded&quot;.&quot;age&quot;, ...;</code></pre>

<p>&nbsp;</p>
</rep>
