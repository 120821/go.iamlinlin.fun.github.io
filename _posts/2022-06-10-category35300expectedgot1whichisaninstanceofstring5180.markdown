---
layout: post
title: "Category(#35300) expected, got "1" which is an instance of String(#5180)"
date: "2022-06-10"
categories: 
---
<p>在创建关联关系的时候，出现了报错，类似这样的，<a class="question-hyperlink" href="https://stackoverflow.com/questions/62825423/category35300-expected-got-1-which-is-an-instance-of-string5180">Category(#35300) expected, got &quot;1&quot; which is an instance of String(#5180)</a></p>

<p>{% highlight %}class Network &lt; ApplicationRecord {% endhighlight %}</p>

<p>{% highlight %}&nbsp; has_many :contracts {% endhighlight %}</p>

<p>{% highlight %}end {% endhighlight %} {% highlight %} {% endhighlight %}</p>

<p>{% highlight %}class Contract &lt; ApplicationRecord {% endhighlight %}</p>

<p>{% highlight %}&nbsp; belongs_to networks, optional: true{% endhighlight %}</p>

<p>{% highlight %}end {% endhighlight %}</p>

<p>原因，在创建表 contract 的时候，与network属于1：n的关系，使用了belongs_to :networks,以及has_many: contracts,</p>

<p>由于版本的原因，在存在关联关系的时候，如果想要单独创建contract，那么需要使用belongs_to: networks, optional: true.</p>

<p><img height="305" src="/uploads/ckeditor/pictures/1/image-20220610151731-1.png" width="314" /></p>

<p>那么在使用了optional的时候，依旧不能单独保存数据，是因为创建表的时候，有了一列名称为network,而关联关系的列是network_id, 如果存在id列，就不需要network，不然不能识别。</p>

