---
layout: post
title: "gorm -  CRUD 接口 (create) map  beforesave aftersave "
date: "2022-10-30"
categories:
---
<p><a href="https://learnku.com/docs/gorm/v2/create/9732">https://learnku.com/docs/gorm/v2/create/9732</a></p>

<p>create:</p>

<pre><code>user := User{Name: &quot;Jinzhu&quot;, Age: 18, Birthday: time.Now()}

result := db.Create(&amp;user) // 通过数据的指针来创建

user.ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 返回插入数据的主键<br />
result.Error&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 返回 error<br />
result.RowsAffected // 返回插入记录的条数</code></pre>

<p id="7a9a15"><strong>用指定的字段创建记录</strong></p>

<p>创建记录并更新给出的字段。</p>

<pre><code>db.Select(&quot;Name&quot;, &quot;Age&quot;, &quot;CreatedAt&quot;).Create(&amp;user)<br />
// INSERT INTO `users` (`name`,`age`,`created_at`) VALUES (&quot;jinzhu&quot;, 18, &quot;2020-07-04 11:05:21.775&quot;)

<p>创建记录并更新未给出的字段。</p>

<pre><code>db.Omit(&quot;Name&quot;, &quot;Age&quot;, &quot;CreatedAt&quot;).Create(&amp;user)<br />
// INSERT INTO `users` (`birthday`,`updated_at`) VALUES ("2020-01-01 00:00:00.000", "2020-07-04 11:05:21.775")
</code></pre>

<p id="1f7cfd"><strong>批量插入</strong></p>

<p>要有效地插入大量记录，请将一个 slice 传递给 Create 方法。 将切片数据传递给 Create 方法，GORM 将生成一个单一的 SQL 语句来插入所有数据，并回填主键的值，钩子方法也会被调用。</p>

<pre><code>var users = []User{{Name: &quot;jinzhu1&quot;}, {Name: &quot;jinzhu2&quot;}, {Name: &quot;jinzhu3&quot;}}<br />
db.Create(&amp;users)

for _, user := range users {<br />
&nbsp; user.ID // 1,2,3<br />
}</code></pre>

<p>使用 CreateInBatches 创建时，你还可以指定创建的数量，例如</p>

<pre><code>var 用户 = []User{name: &quot;jinzhu_1&quot;}, ...., {Name: &quot;jinzhu_10000&quot;}}

// 数量为 100<br />
db.CreateInBatches(用户, 100)</code></pre>

<p id="e231f7"><strong>创建钩子</strong></p>

<p>GORM 允许用户定义的钩子有 BeforeSave, BeforeCreate, AfterSave, AfterCreate 创建记录时将调用这些钩子方法，</p>

<pre><code>func (u *User) BeforeCreate(tx *gorm.DB) (err error) {<br />
&nbsp; u.UUID = uuid.New()

&nbsp;&nbsp;&nbsp; if u.Role == &quot;admin&quot; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return errors.New(&quot;invalid role&quot;)<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; return<br />
}</code></pre>

<p>如果您想跳过 <code>钩子</code> 方法，您可以使用 <code>SkipHooks</code> 会话模式，例如：</p>

<pre><code>DB.Session(&amp;gorm.Session{SkipHooks: true}).Create(&amp;user)

DB.Session(&amp;gorm.Session{SkipHooks: true}).Create(&amp;users)

DB.Session(&amp;gorm.Session{SkipHooks: true}).CreateInBatches(users, 100)</code></pre>

<p id="e3913c"><strong>根据 Map 创建</strong></p>

<p>GORM 支持根据 <code>map[string]interface{}</code> 和 <code>[]map[string]interface{}{}</code> 创建记录，例如：</p>

<pre><code>db.Model(&amp;User{}).Create(map[string]interface{}{<br />
&nbsp; &quot;Name&quot;: &quot;jinzhu&quot;, &quot;Age&quot;: 18,<br />
})

// batch insert from `[]map[string]interface{}{}`<br />
db.Model(&amp;User{}).Create([]map[string]interface{}{<br />
&nbsp; {&quot;Name&quot;: &quot;jinzhu_1&quot;, &quot;Age&quot;: 18},<br />
&nbsp; {&quot;Name&quot;: &quot;jinzhu_2&quot;, &quot;Age&quot;: 20},<br />
})</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

