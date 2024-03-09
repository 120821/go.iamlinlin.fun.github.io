---
layout: post
title: "一些标签的使用 address article"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong><code>Address</code>元素(&lt;address&gt;)</strong>是用来存放地址信息的，与&lt;article&gt;来提供文章作者的联系信息。注意以下几点：</p> 
 <ul>
<li>如果行文中出现了一些随意的地址，就不使用&lt;address&gt;元素，选择使用普通的<code>&lt;p&gt;</code>元素就行了。</li>
<li>&lt;address&gt;元素里应该只存放地址信息，不要放置其它跟地址不相关的信息，比如出版时间，需要放&lt;time&gt;元素里。</li>
<li>建议把&lt;address&gt;放到&lt;footer&gt;里。</li>
</ul>
 <div>
  &lt;address&gt;元素显示样式和
  <code>&lt;i&gt;</code>和
  <code>&lt;em&gt;</code>等元素的样式相同，但当遇到涉及地址的联系信息时，使用&lt;address&gt;元素更合适，因为它体现了更明确的语义信息
  <br>   
  {% highlight %}&lt;address&gt;
    你可以到&lt;a href="http://know.webhek.com/html5/contact"&gt;www.webhek.com&lt;/a&gt;这个网站和作者取得联系。&lt;br&gt;
    如果你发现了任何bug，请联系&lt;a href="mailto:webmaster@webhek.com"&gt;网站管理员&lt;/a&gt;。&lt;br&gt;
    你也可以访问我们的公司，地址是：&lt;br&gt;
    中国&lt;br&gt;
    北京&lt;br&gt;
    朝阳门外大街101号&lt;br&gt;
    WEB骇客&lt;br&gt;
  &lt;/address&gt;{% endhighlight %} 
  <img alt="" height="132" src="https://img-blog.csdnimg.cn/ea0004eb829c477aaad900ead960df9e.png" width="392">
  <br>
  <br>
  <br>   
  {% highlight %}Article元素(&lt;article&gt;)故名思议，可以表示论坛帖子、杂志或新闻文章、博客、用户提交的评论、交互式组件，或者其他独立的内容项目。它的主要语义为表示自己是一个独立的内容结构。每一个&lt;article&gt;元素内部结构都应该是相似的，比如都应该包含一个头标题(h1-h6元素)等。

&lt;article&gt;元素用法：

    当&lt;article&gt;元素嵌套使用时，则该元素代表与父元素有关的文章。例如，代表博客评论的&lt;article&gt;元素可嵌套在代表博客文章的&lt;article&gt;元素中。
    &lt;article&gt;元素中文章作者的信息可通过&lt;address&gt;元素表示，但是不适用于嵌套的&lt;article&gt;元素。

    &lt;article&gt;元素中文章的发布日期和时间可通过&lt;time&gt;元素的pubdate属性表示。
{% endhighlight %} 
  {% highlight %} &lt;article class="film_review"&gt;
  2   &lt;header&gt;
  3     &lt;h2&gt;侏罗纪公园&lt;/h2&gt;
  4   &lt;/header&gt;
  5   &lt;section class="main_review"&gt;
  6     &lt;p&gt;Dinos were great!&lt;/p&gt;
  7   &lt;/section&gt;
  8   &lt;section class="user_reviews"&gt;
  9     &lt;article class="user_review"&gt;
 10       &lt;p&gt;Way too scary for me.&lt;/p&gt;
 11       &lt;footer&gt;
 12         &lt;p&gt;
 13           Posted on &lt;time datetime="2015-05-16 19:00"&gt;May 16&lt;/time&gt; by Lisa.
 14         &lt;/p&gt;
 15       &lt;/footer&gt;
 16     &lt;/article&gt;
 17     &lt;article class="user_review"&gt;
 18       &lt;p&gt;I agree, dinos are my favorite.&lt;/p&gt;
 19       &lt;footer&gt;
 20         &lt;p&gt;
 21           Posted on &lt;time datetime="2015-05-17 19:00"&gt;May 17&lt;/time&gt; by Tom.
 22         &lt;/p&gt;
 23       &lt;/footer&gt;
 24     &lt;/article&gt;
 25   &lt;/section&gt;
 26   &lt;footer&gt;
 27     &lt;p&gt;
 28       Posted on &lt;time datetime="2015-05-15 19:00"&gt;May 15&lt;/time&gt; by Staff.
 29     &lt;/p&gt;
 30   &lt;/footer&gt;
 31 &lt;/article&gt;
{% endhighlight %} 
  <br>
  <br>
  <img alt="" height="290" src="https://img-blog.csdnimg.cn/8dae8387cd73421991e45d392a9ab849.png" width="239">
  <br>
  <br>  
 </div> 
 <p> aside的使用</p> 
 <p> </p> 
 <p> </p> 
 <p> </p> 
</blockquote>
                
