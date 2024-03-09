---
layout: post
title: "f.select 与select_tag 的区别"
date: "2022-06-09"
categories: 
---

                    {% highlight %}select_tag(name, option_tags = nil, options = {}) public{% endhighlight %} 
<p>创建一个下拉选择框，或者如果：multiple选项设置为true，则创建一个多选选择框。<br> Helpers:：FormOptions可用于创建常见的选择框，例如国家、时区或相关记录。option_tags是一个字符串，包含选择框的选项标记。</p> 
<blockquote> 
 {% highlight %}select_tag  'user_id', options_for_select(@users.collect{ |u| [u.name, u.id] }){% endhighlight %} 
 <p>相当于</p> 
 {% highlight %}&lt;select id="user_id" name="user_id"&gt;
  &lt;option value="1"&gt;Brad&lt;/option&gt;
  &lt;option value="2"&gt;Angie&lt;/option&gt;
  &lt;option value="3"&gt;Jenny&lt;/option&gt;
&lt;/select&gt;
{% endhighlight %} 
 {% highlight %}&lt;%= select_tag 'sex', options_for_select(['男', '女']) %&gt;{% endhighlight %} 
 <p>相当于</p> 
 {% highlight %}&lt;select id="sex" name="sex"&gt;
    &lt;option value="male"&gt;男&lt;/option&gt;
    &lt;option value="female"&gt;女&lt;/option&gt;
&lt;/select&gt;
{% endhighlight %} 
 <p>也可以这么写</p> 
 <p>&lt;%= select_tag :sex, options_for_select(['男, '女 ']) %&gt;</p> 
 {% highlight %}&lt;%= f.select :area, 
    options_for_select([['a','a'],['b','b'],['c','c']], params[:area]),
    {}, { :class =&gt; 'span3 controls controls-row' } %&gt;{% endhighlight %} 
 <p>&lt;%= form.select :sex,options_for_select(['男','女']) %&gt;</p> 
</blockquote> 
<blockquote> 
 {% highlight %}select_tag "people", options_from_collection_for_select(@people, "id", "name")
# &lt;select id="people" name="people"&gt;&lt;option value="1"&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "people", options_from_collection_for_select(@people, "id", "name", "1")
# &lt;select id="people" name="people"&gt;&lt;option value="1" selected="selected"&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "people", raw("&lt;option&gt;David&lt;/option&gt;")
# =&gt; &lt;select id="people" name="people"&gt;&lt;option&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "count", raw("&lt;option&gt;1&lt;/option&gt;&lt;option&gt;2&lt;/option&gt;&lt;option&gt;3&lt;/option&gt;&lt;option&gt;4&lt;/option&gt;")
# =&gt; &lt;select id="count" name="count"&gt;&lt;option&gt;1&lt;/option&gt;&lt;option&gt;2&lt;/option&gt;
#    &lt;option&gt;3&lt;/option&gt;&lt;option&gt;4&lt;/option&gt;&lt;/select&gt;

select_tag "colors", raw("&lt;option&gt;Red&lt;/option&gt;&lt;option&gt;Green&lt;/option&gt;&lt;option&gt;Blue&lt;/option&gt;"), multiple: true
# =&gt; &lt;select id="colors" multiple="multiple" name="colors[]"&gt;&lt;option&gt;Red&lt;/option&gt;
#    &lt;option&gt;Green&lt;/option&gt;&lt;option&gt;Blue&lt;/option&gt;&lt;/select&gt;

select_tag "locations", raw("&lt;option&gt;Home&lt;/option&gt;&lt;option selected='selected'&gt;Work&lt;/option&gt;&lt;option&gt;Out&lt;/option&gt;")
# =&gt; &lt;select id="locations" name="locations"&gt;&lt;option&gt;Home&lt;/option&gt;&lt;option selected='selected'&gt;Work&lt;/option&gt;
#    &lt;option&gt;Out&lt;/option&gt;&lt;/select&gt;

select_tag "access", raw("&lt;option&gt;Read&lt;/option&gt;&lt;option&gt;Write&lt;/option&gt;"), multiple: true, class: 'form_input', id: 'unique_id'
# =&gt; &lt;select class="form_input" id="unique_id" multiple="multiple" name="access[]"&gt;&lt;option&gt;Read&lt;/option&gt;
#    &lt;option&gt;Write&lt;/option&gt;&lt;/select&gt;

select_tag "people", options_from_collection_for_select(@people, "id", "name"), include_blank: true
# =&gt; &lt;select id="people" name="people"&gt;&lt;option value="" label=" "&gt;&lt;/option&gt;&lt;option value="1"&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "people", options_from_collection_for_select(@people, "id", "name"), include_blank: "All"
# =&gt; &lt;select id="people" name="people"&gt;&lt;option value=""&gt;All&lt;/option&gt;&lt;option value="1"&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "people", options_from_collection_for_select(@people, "id", "name"), prompt: "Select something"
# =&gt; &lt;select id="people" name="people"&gt;&lt;option value=""&gt;Select something&lt;/option&gt;&lt;option value="1"&gt;David&lt;/option&gt;&lt;/select&gt;

select_tag "destination", raw("&lt;option&gt;NYC&lt;/option&gt;&lt;option&gt;Paris&lt;/option&gt;&lt;option&gt;Rome&lt;/option&gt;"), disabled: true
# =&gt; &lt;select disabled="disabled" id="destination" name="destination"&gt;&lt;option&gt;NYC&lt;/option&gt;
#    &lt;option&gt;Paris&lt;/option&gt;&lt;option&gt;Rome&lt;/option&gt;&lt;/select&gt;

select_tag "credit_card", options_for_select([ "VISA", "MasterCard" ], "MasterCard")
# =&gt; &lt;select id="credit_card" name="credit_card"&gt;&lt;option&gt;VISA&lt;/option&gt;
#    &lt;option selected="selected"&gt;MasterCard&lt;/option&gt;&lt;/select&gt;{% endhighlight %} 
</blockquote>
                
