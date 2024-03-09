---
layout: post
title: "创建 setting这样的migration的时候，要加上默认值"
date: "2022-08-24"
categories: 
---
<p>进行rails的环境设置的时候，需要进行设置默认值，不然成员第一次运行就会出现报错。</p>

<p>类似这样：</p>

<p><img alt="" src="http://bug.sweetysoft.com/uploads/2022-08-24-08-58-22.png" /></p>

<pre>
<code>因此需要进行初始化的环境变量的设置
class CreateSettings &lt; ActiveRecord::Migration

&nbsp; def change

&nbsp;&nbsp;&nbsp; create_table :settings do |t|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :value

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :comment

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :default

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps null: false

&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; Setting.create name: &#39;ENABLE_MOBILE_EMAIL&#39;, value: &#39;no&#39;, default: &#39;no&#39;, comment:&nbsp; &#39;&#39; &nbsp;

&nbsp; end

end{% endhighlight %}

<p>&nbsp;</p>

