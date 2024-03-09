---
layout: post
title: "Action View Form Helpers"
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/form_helpers.html">https://guides.rubyonrails.org/form_helpers.html</a></p>

<p id="uploading-files"><a class="anchorlink" href="https://guides.rubyonrails.org/form_helpers.html#uploading-files">6 Uploading Files</a></p>

<p>一个常见的任务是上传某种文件，无论是人的照片还是包含要处理的数据的 CSV 文件。&nbsp; 文件上传字段可以使用 file_field 帮助器呈现。</p>

<p>前端进行表单的书写：</p>

{% highlight %}
{% highlight %}&lt;%= form_with model: @person do |form| %&gt;

&nbsp; &lt;%= form.file_field :picture %&gt;

&lt;% end %&gt;{% endhighlight %}

{% highlight %}
{% highlight %}&lt;%= form_with url: &quot;/uploads&quot;, multipart: true do |form| %&gt;

&nbsp; &lt;%= file_field_tag :picture %&gt;

&lt;% end %&gt;{% endhighlight %}

<p>后端进行方法的实现：</p>

{% highlight %}
{% highlight %}def upload

&nbsp; uploaded_file = params[:picture]

&nbsp; File.open(Rails.root.join(&#39;public&#39;, &#39;uploads&#39;, uploaded_file.original_filename), &#39;wb&#39;) do |file|

&nbsp;&nbsp;&nbsp; file.write(uploaded_file.read)

&nbsp; end

end{% endhighlight %}

<p>您会注意到 HTML 包含一个类型为 hidden 的 input 元素。&nbsp; 这个输入很重要，因为没有它就无法成功提交非 GET 表单。&nbsp; 名为authenticity_token 的隐藏输入元素是Rails 的一项安全功能，称为跨站点请求伪造保护，表单助手会为每个非GET 表单生成它（前提是启用了此安全功能）。&nbsp; 您可以在 Securing Rails Applications 指南中阅读更多相关信息。</p>

{% highlight %}
{% highlight %}&lt;%= form_with do |form| %&gt;
&nbsp; Form contents
&lt;% end %&gt;{% endhighlight %}

<p>浏览器结果：</p>

{% highlight %}
{% highlight %}&lt;form accept-charset=&quot;UTF-8&quot; action=&quot;/&quot; method=&quot;post&quot;&gt;
&nbsp; &lt;input name=&quot;authenticity_token&quot; type=&quot;hidden&quot; value=&quot;J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts=&quot; /&gt;
&nbsp; Form contents
&lt;/form&gt;{% endhighlight %}

<p>复选框是表单控件，为用户提供了一组可以启用或禁用的选项：</p>

{% highlight %}
{% highlight %}&lt;%= form.check_box :pet_dog %&gt;
&lt;%= form.label :pet_dog, &quot;I own a dog&quot; %&gt;
&lt;%= form.check_box :pet_cat %&gt;
&lt;%= form.label :pet_cat, &quot;I own a cat&quot; %&gt;{% endhighlight %}

<p>generates:</p>

{% highlight %}
{% highlight %}&lt;input type=&quot;checkbox&quot; id=&quot;pet_dog&quot; name=&quot;pet_dog&quot; value=&quot;1&quot; /&gt;
&lt;label for=&quot;pet_dog&quot;&gt;I own a dog&lt;/label&gt;
&lt;input type=&quot;checkbox&quot; id=&quot;pet_cat&quot; name=&quot;pet_cat&quot; value=&quot;1&quot; /&gt;
&lt;label for=&quot;pet_cat&quot;&gt;I own a cat&lt;/label&gt;{% endhighlight %}

<p>单选按钮:</p>

{% highlight %}
{% highlight %}&lt;%= form.radio_button :age, &quot;child&quot; %&gt;
&lt;%= form.label :age_child, &quot;I am younger than 21&quot; %&gt;
&lt;%= form.radio_button :age, &quot;adult&quot; %&gt;
&lt;%= form.label :age_adult, &quot;I am over 21&quot; %&gt;{% endhighlight %}

<p>output:</p>

{% highlight %}
{% highlight %}&lt;input type=&quot;radio&quot; id=&quot;age_child&quot; name=&quot;age&quot; value=&quot;child&quot; /&gt;
&lt;label for=&quot;age_child&quot;&gt;I am younger than 21&lt;/label&gt;
&lt;input type=&quot;radio&quot; id=&quot;age_adult&quot; name=&quot;age&quot; value=&quot;adult&quot; /&gt;
&lt;label for=&quot;age_adult&quot;&gt;I am over 21&lt;/label&gt;{% endhighlight %}

<p>others:</p>

{% highlight %}
<p43>{% highlight %}&lt;%= form.text_area :message, size: &quot;70x5&quot; %&gt;

&lt;%= form.hidden_field :parent_id, value: &quot;foo&quot; %&gt;

&lt;%= form.password_field :password %&gt;

&lt;%= form.number_field :price, in: 1.0..20.0, step: 0.5 %&gt;

&lt;%= form.range_field :discount, in: 1..100 %&gt;

&lt;%= form.date_field :born_on %&gt;

&lt;%= form.time_field :started_at %&gt;

&lt;%= form.datetime_local_field :graduation_day %&gt;

&lt;%= form.month_field :birthday_month %&gt;

&lt;%= form.week_field :birthday_week %&gt;

&lt;%= form.search_field :name %&gt;

&lt;%= form.email_field :address %&gt;

&lt;%= form.telephone_field :phone %&gt;

&lt;%= form.url_field :homepage %&gt;{% endhighlight %}</p43><p43>

{% highlight %}&lt;%= form.color_field :favorite_color %&gt;{% endhighlight %}</p43>{% endhighlight %}

{% highlight %}
<code class="highlight erb">area： <span class="cp">&lt;%=</span> <span class="n">form</span><span class="p">.</span><span class="nf">text_area</span> <span class="ss">:body</span><span class="p">,</span> <span class="ss">size: </span><span class="s2">&quot;60x10&quot;</span> <span class="cp">%&gt;</span>{% endhighlight %}

<p>select：&lt;%= form.select :city, [&quot;Berlin&quot;, &quot;Chicago&quot;, &quot;Madrid&quot;] %&gt;</p>

<p>我们还可以指定与标签不同的 &lt;option&gt; 值：</p>

<p>&lt;%= form.select :city, [[&quot;Berlin&quot;, &quot;BE&quot;], [&quot;Chicago&quot;, &quot;CHI&quot;], [&quot;Madrid&quot;, &quot;MD&quot;]] %&gt;</p>

<p>output：</p>

{% highlight %}&lt;select name=&quot;city&quot; id=&quot;city&quot;&gt;<br />
&nbsp; &lt;option value=&quot;BE&quot;&gt;Berlin&lt;/option&gt;<br />
&nbsp; &lt;option value=&quot;CHI&quot;&gt;Chicago&lt;/option&gt;<br />
&nbsp; &lt;option value=&quot;MD&quot;&gt;Madrid&lt;/option&gt;<br />
&lt;/select&gt;{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

