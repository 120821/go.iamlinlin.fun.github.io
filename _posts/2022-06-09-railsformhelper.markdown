---
layout: post
title: "rails form helper 的使用"
date: "2022-06-09"
categories: 
---

                    <p>单次使用的表单，rails使用非常方便，多次使用的内容需要绑定在controller文件中常用的表单如下</p> 
<pre><code>&lt;%= form_tag do %&gt;
  Form contents
&lt;% end %&gt;</code></pre> 
<p>执行会在浏览器控制台看到这样的内容</p> 
<pre><code>&lt;form accept-charset="UTF-8" action="/" method="post"&gt;
  &lt;input name="utf8" type="hidden" value="&amp;#x2713;" /&gt;
  &lt;input name="authenticity_token" type="hidden" value="J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts=" /&gt;
  Form contents
&lt;/form&gt;</code></pre> 
<pre><code>&lt;%= form_tag("/search", method: "get") do %&gt;
  &lt;%= label_tag(:q, "Search for:") %&gt;
  &lt;%= text_field_tag(:q) %&gt;
  &lt;%= submit_tag("Search") %&gt;
&lt;% end %&gt;</code></pre> 
<p>多选框和单选框</p> 
<p>这是多选框</p> 
<pre><code>&lt;%= check_box_tag(:pet_dog) %&gt;
&lt;%= label_tag(:pet_dog, "I own a dog") %&gt;
&lt;%= check_box_tag(:pet_cat) %&gt;
&lt;%= label_tag(:pet_cat, "I own a cat") %&gt;</code></pre> 
<p><img alt="" height="37" src="https://img-blog.csdnimg.cn/6fc087b3c9e3472ca7a979c21e326777.png" width="280"></p> 
<p><img alt="" height="57" src="https://img-blog.csdnimg.cn/54d7528d7b264bb2b33ceb839f9bb417.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_9,color_FFFFFF,t_70,g_se,x_16" width="344"> </p> 
<p>这是单选框</p> 
<pre><code>&lt;%= radio_button_tag(:age, "child") %&gt;
&lt;%= label_tag(:age_child, "I am younger than 21") %&gt;
&lt;%= radio_button_tag(:age, "adult") %&gt;
&lt;%= label_tag(:age_adult, "I'm over 21") %&gt;</code></pre> 
<pre><code class="language-ruby">&lt;%= text_area_tag(:message, "Hi, nice site", size: "24x6") %&gt;
&lt;%= password_field_tag(:password) %&gt;
&lt;%= hidden_field_tag(:parent_id, "5") %&gt;
&lt;%= search_field(:user, :name) %&gt;
&lt;%= telephone_field(:user, :phone) %&gt;
&lt;%= date_field(:user, :born_on) %&gt;
&lt;%= datetime_field(:user, :meeting_time) %&gt;
&lt;%= datetime_local_field(:user, :graduation_day) %&gt;
&lt;%= month_field(:user, :birthday_month) %&gt;
&lt;%= week_field(:user, :birthday_week) %&gt;
&lt;%= url_field(:user, :homepage) %&gt;
&lt;%= email_field(:user, :address) %&gt;
&lt;%= color_field(:user, :favorite_color) %&gt;
&lt;%= time_field(:task, :started_at) %&gt;</code></pre> 
<p><img alt="" height="349" src="https://img-blog.csdnimg.cn/e3ad0b64318f46e588e656d4b8f1efb3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_13,color_FFFFFF,t_70,g_se,x_16" width="486"></p> 
<p> <img alt="" height="364" src="https://img-blog.csdnimg.cn/588e9050ff044de9be80a1c105f37862.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
<p> 多次使用的内容可以把表单绑定模型对象，</p> 
<pre><code>app/controllers/articles_controller.rb:
def new
  @article = Article.new
end</code></pre> 
<pre><code>view app/views/articles/new.html.erb
&lt;%= form_for @article, url: {action: "create"}, html: {class: "nifty_form"} do |f| %&gt;
  &lt;%= f.text_field :title %&gt;
  &lt;%= f.text_area :body, size: "60x12" %&gt;
  &lt;%= f.submit "Create" %&gt;
&lt;% end %&gt;</code></pre> 
<p></p> 
<pre><code>&lt;%= form_for @person, url: {action: "create"} do |person_form| %&gt;
  &lt;%= person_form.text_field :name %&gt;
  &lt;%= fields_for @person.contact_detail do |contact_details_form| %&gt;
    &lt;%= contact_details_form.text_field :phone_number %&gt;
  &lt;% end %&gt;
&lt;% end %&gt;</code></pre> 
<pre><code>&lt;form accept-charset="UTF-8" action="/people/create" class="new_person" id="new_person" method="post"&gt;
  &lt;input id="person_name" name="person[name]" type="text" /&gt;
  &lt;input id="contact_detail_phone_number" name="contact_detail[phone_number]" type="text" /&gt;
&lt;/form&gt;</code></pre> 
<p></p> 
<pre><code>&lt;%= form_for @person, url: {action: "create"} do |person_form| %&gt;
  &lt;%= person_form.text_field :name %&gt;
  &lt;%= fields_for @person.contact_detail do |contact_details_form| %&gt;
    &lt;%= contact_details_form.text_field :phone_number %&gt;
  &lt;% end %&gt;
&lt;% end %&gt;</code></pre> 
<pre><code>&lt;form accept-charset="UTF-8" action="/people/create" class="new_person" id="new_person" method="post"&gt;
  &lt;input id="person_name" name="person[name]" type="text" /&gt;
  &lt;input id="contact_detail_phone_number" name="contact_detail[phone_number]" type="text" /&gt;
&lt;/form&gt;</code></pre> 
<pre><code>resources :articles</code></pre> 
<pre><code># Creating a new article
# long-style:
form_for(@article, url: articles_path)
# same thing, short-style (record identification gets used):
form_for(@article)
 
## Editing an existing article
# long-style:
form_for(@article, url: article_path(@article), html: {method: "patch"})
# short-style:
form_for(@article)</code></pre> 
<pre><code>form_for [:admin, @article]</code></pre> 
<pre><code>form_for [:admin, :management, @article]</code></pre> 
<pre><code>form_tag(search_path, method: "patch")</code></pre> 
<pre><code>&lt;form accept-charset="UTF-8" action="/search" method="post"&gt;
  &lt;input name="_method" type="hidden" value="patch" /&gt;
  &lt;input name="utf8" type="hidden" value="&amp;#x2713;" /&gt;
  &lt;input name="authenticity_token" type="hidden" value="f755bb0ed134b76c432144748a6d4b7a7ddf2b71" /&gt;
  ...
&lt;/form&gt;</code></pre> 
<pre><code>&lt;select name="city_id" id="city_id"&gt;
  &lt;option value="1"&gt;Lisbon&lt;/option&gt;
  &lt;option value="2"&gt;Madrid&lt;/option&gt;
  ...
  &lt;option value="12"&gt;Berlin&lt;/option&gt;
&lt;/select&gt;</code></pre> 
<pre><code>&lt;%= select_tag(:city_id, '&lt;option value="1"&gt;Lisbon&lt;/option&gt;...') %&gt;</code></pre> 
<pre><code>&lt;%= options_for_select([['Lisbon', 1], ['Madrid', 2], ...]) %&gt;
 
output:
 
&lt;option value="1"&gt;Lisbon&lt;/option&gt;
&lt;option value="2"&gt;Madrid&lt;/option&gt;
...</code></pre> 
<pre><code>&lt;%= select_tag(:city_id, options_for_select(...)) %&gt;</code></pre> 
<pre><code>&lt;%= options_for_select([['Lisbon', 1], ['Madrid', 2], ...], 2) %&gt;
 
output:
 
&lt;option value="1"&gt;Lisbon&lt;/option&gt;
&lt;option value="2" selected="selected"&gt;Madrid&lt;/option&gt;
...</code></pre> 
<pre><code>&lt;%= options_for_select(
  [
    ['Lisbon', 1, { 'data-size' =&gt; '2.8 million' }],
    ['Madrid', 2, { 'data-size' =&gt; '3.2 million' }]
  ], 2
) %&gt;
 
output:
 
&lt;option value="1" data-size="2.8 million"&gt;Lisbon&lt;/option&gt;
&lt;option value="2" selected="selected" data-size="3.2 million"&gt;Madrid&lt;/option&gt;
...</code></pre> 
<p>select 删除后缀，为了与其他表单保持一致</p> 
<pre><code># controller:
@person = Person.new(city_id: 2)
# view:
&lt;%= select(:person, :city_id, [['Lisbon', 1], ['Madrid', 2], ...]) %&gt;</code></pre> 
<pre><code># select on a form builder
&lt;%= f.select(:city_id, ...) %&gt;</code></pre> 
<pre><code>&lt;%= f.select(:city_id) do %&gt;
  &lt;% [['Lisbon', 1], ['Madrid', 2]].each do |c| -%&gt;
    &lt;%= content_tag(:option, c.first, value: c.last) %&gt;
  &lt;% end %&gt;
&lt;% end %&gt;</code></pre> 
<pre><code>&lt;% cities_array = City.all.map { |city| [city.name, city.id] } %&gt;
&lt;%= options_for_select(cities_array) %&gt;</code></pre> 
<pre><code>&lt;%= options_from_collection_for_select(City.all, :id, :name) %&gt;</code></pre> 
<pre><code>&lt;%= f.collection_select(:city_id, City.all, :id, :name) %&gt;</code></pre> 
<pre><code>&lt;%= time_zone_select(:person, :time_zone) %&gt;</code></pre> 
<pre><code>&lt;%= select_date Date.today, prefix: :start_date %&gt;</code></pre> 
<pre><code>&lt;select id="start_date_year" name="start_date[year]"&gt; ... &lt;/select&gt;
&lt;select id="start_date_month" name="start_date[month]"&gt; ... &lt;/select&gt;
&lt;select id="start_date_day" name="start_date[day]"&gt; ... &lt;/select&gt;</code></pre> 
<pre><code>&lt;%= select_year(2009) %&gt;
&lt;%= select_year(Time.now) %&gt;</code></pre> 
<pre><code>&lt;%= date_select :person, :birth_date %&gt;</code></pre> 
<pre><code>&lt;select id="person_birth_date_1i" name="person[birth_date(1i)]"&gt; ... &lt;/select&gt;
&lt;select id="person_birth_date_2i" name="person[birth_date(2i)]"&gt; ... &lt;/select&gt;
&lt;select id="person_birth_date_3i" name="person[birth_date(3i)]"&gt; ... &lt;/select&gt;</code></pre> 
<pre><code>{'person' =&gt; {'birth_date(1i)' =&gt; '2008', 'birth_date(2i)' =&gt; '11', 'birth_date(3i)' =&gt; '22'}}</code></pre> 
<pre><code>&lt;%= select_date Date.today, prefix: :start_date %&gt;</code></pre> 
<pre><code>&lt;%= form_tag({action: :upload}, multipart: true) do %&gt;
  &lt;%= file_field_tag 'picture' %&gt;
&lt;% end %&gt;
 
&lt;%= form_for @person do |f| %&gt;
  &lt;%= f.file_field :picture %&gt;
&lt;% end %&gt;</code></pre> 
<pre><code>def upload
  uploaded_io = params[:person][:picture]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
end</code></pre> 
<pre><code>&lt;%= form_for @person do |f| %&gt;
  &lt;%= text_field_with_label f, :first_name %&gt;
&lt;% end %&gt;</code></pre> 
<p></p>
                
