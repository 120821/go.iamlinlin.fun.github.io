---
layout: post
title: "options_from_collection_for_select"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <h3 id="optionsfromcollectionforselect">options_from_collection_for_select</h3> 
 <p>如果这些options 来自于 数据库, 假设已经存在一个表{% highlight %}books{% endhighlight %}, 有两个列: {% highlight %}id{% endhighlight %}, {% highlight %}title{% endhighlight %},</p> 
 <p>这个表的值是:</p> 
 <table>
<thead><tr>
<th>id</th>
<th>title</th>
</tr></thead>
<tbody>
<tr>
<td>1</td>
<td>三体1</td>
</tr>
<tr>
<td>2</td>
<td>三体2</td>
</tr>
<tr>
<td>3</td>
<td>三体3</td>
</tr>
</tbody>
</table>
 <p>于是,</p> 
 {% highlight %}<code class="language-ruby">&lt;%= options_from_collection_for_select Book.all, :id, :title %&gt;{% endhighlight %} 
 <p>会生成:</p> 
 {% highlight %}&lt;option value="1"&gt;三体1&lt;/option&gt;
&lt;option value="2"&gt;三体2&lt;/option&gt;
&lt;option value="3"&gt;三体3&lt;/option&gt;
{% endhighlight %} 
</blockquote> 
{% highlight %}&lt;%= select_tag "dapp_category_id", options_from_collection_for_select(DappCategory.all, :id, :name), class:'form-control' %&gt;{% endhighlight %} 
<blockquote> 
 <p>在dapp表格中。读取dapp分类的所有数据，进行选择。</p> 
</blockquote> 
<p></p> 
<p></p>
                
