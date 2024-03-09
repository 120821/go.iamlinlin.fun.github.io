---
layout: post
title: "html select 可输入 可编辑"
date: "2022-06-09"
categories: 
---

                    {% highlight %}&lt;div style="position:relative;"&gt;
&lt;span style="margin-left:100px;width:18px;overflow:hidden;"&gt;
&lt;select style="width:118px;margin-left:-100px" onchange="this.parentNode.nextSibling.value=this.value"&gt;
&lt;option value="德国"&gt;德国&lt;/option&gt;
&lt;option value="挪威"&gt;挪威&lt;/option&gt;
&lt;option value="瑞士"&gt; 瑞士&lt;/option&gt;
&lt;/select&gt;&lt;/span&gt;&lt;input name="box" style="width:100px;position:absolute;left:0px;"&gt;
&lt;/div&gt;{% endhighlight %} 
<p>HTML相对与bootstrapt比较方便，不用考虑不能下拉以及样式的问题</p> 
{% highlight %}&lt;div class="dropdown"&gt;
  &lt;button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"&gt;
    Dropdown button
  &lt;/button&gt;
  &lt;ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1"&gt;
    &lt;li&gt;&lt;a class="dropdown-item" href="#"&gt;Action&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a class="dropdown-item" href="#"&gt;Another action&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a class="dropdown-item" href="#"&gt;Something else here&lt;/a&gt;&lt;/li&gt;
  &lt;/ul&gt;
&lt;/div&gt;{% endhighlight %} 
<p></p>
                
