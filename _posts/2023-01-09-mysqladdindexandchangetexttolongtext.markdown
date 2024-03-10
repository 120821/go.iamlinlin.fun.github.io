---
layout: post
title: "mysql add index and change  text to longtext"
date: "2023-01-09"
categories: 
---
<p>refer:<a href="http://https://stackoverflow.com/questions/3002605/how-do-i-add-indexes-to-mysql-tables">http://https://stackoverflow.com/questions/3002605/how-do-i-add-indexes-to-mysql-tables</a></p>
<p>1.add index (数据特别多的时候，可以使用）</p>
<p>和postgres相似，进入命令行，然后进入对应的数据库，增加即可</p>
<p>{% highlight html %}sudo docker exexc -it 1305 bash{% endhighlight %}</p>
<p>{% highlight html %}mysql -uroot -pxxxxx{% endhighlight %}</p>
<p>{% highlight html %}或者 mysql -uroot -pxxx{% endhighlight %}</p>
{% highlight html %}ALTER TABLE `table` ADD INDEX `product_id_index` (`product_id`){% endhighlight %}
<p>2.使用mysql进行保存文章，当文章太长的时候，就会出现报错，进行数据类型的修改即可：<a href="https://stackoverflow.com/questions/1827063/mysql-error-key-specification-without-a-key-length">https://stackoverflow.com/questions/1827063/mysql-error-key-specification-without-a-key-length</a></p>
<p>{% highlight html %}alter table DataToolongDemo change Name Name longtext;{% endhighlight %}</p>
<p>{% highlight html %}alter table blogs change Content Content longtext;{% endhighlight %}</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
