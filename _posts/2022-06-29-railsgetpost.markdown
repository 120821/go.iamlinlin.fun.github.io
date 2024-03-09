---
layout: post
title: "rails 应用 创建页面 get post 保存文件 创建数据"
date: "2022-06-29"
categories: 
---
<p>1.创建一个页面page1进行page2 的跳转，get方式，点击go按钮跳转到page2</p>

<p>2.page3input进行填写数据，使用post方式进行跳转page4，并创建了一个TXT文件，内容是&ldquo;hi&rdquo;，保存为，/tmp/ok.txt</p>

<p>3.page5按钮batch create 点击创建100条记录，可以是任意表的数据，跳转page6页面，显示数据。</p>

<p>1.1首先增加路由config/routes文件中</p>

<p>&nbsp;resources :pages do<br />
&nbsp;&nbsp;&nbsp; collection do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page4<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page2<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page3<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page5<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :page6<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; post :save_txt<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; post :create_100<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>1.2然后增加controller</p>

<p>class PagesController &lt; ApplicationController</p>

<p>&nbsp; layout :false<br />
&nbsp; def page1<br />
&nbsp; end</p>

<p>&nbsp; def page2<br />
&nbsp; end</p>

<p>&nbsp; def page3<br />
&nbsp; end</p>

<p>&nbsp; def page4<br />
&nbsp; end</p>

<p>&nbsp; def page5<br />
&nbsp; end</p>

<p>&nbsp; def page6<br />
&nbsp; end<br />
&nbsp; def save_txt<br />
&nbsp;&nbsp;&nbsp; tmp = params[:text]<br />
&nbsp;&nbsp;&nbsp; #parameter_file = File.new(&quot;/public/#{params[:text]}.txt&quot;, &quot;w&quot;)<br />
&nbsp;&nbsp;&nbsp; #parameter_file.puts(:parameter)<br />
&nbsp;&nbsp;&nbsp; current_file_name =&nbsp; tmp<br />
&nbsp;&nbsp;&nbsp; uploaded_file = File.join(&quot;public/tmp&quot;, current_file_name)<br />
&nbsp;&nbsp;&nbsp; File.open(uploaded_file, &#39;wb&#39;) do |f|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f.write(&quot;hi&quot;)<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; redirect_to page4_pages_path, notice: &#39;success&#39;<br />
&nbsp; end</p>

<p>&nbsp; def create_100<br />
&nbsp;&nbsp;&nbsp; i = 1<br />
&nbsp;&nbsp;&nbsp; loop do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MyBlog.create title: &quot;hihi&quot;, content: &quot;haha&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i = i + 1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if i &gt; 100<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; redirect_to page6_pages_path, notice: &#39;ok&#39;<br />
&nbsp; end<br />
end</p>

<p>1.3视图页面增加</p>

<p><strong>page1</strong></p>

<p>&lt;%= link_to &quot;go&quot;, &#39;/pages/page2&#39; %&gt;&lt;br/&gt;</p>

<p><strong>page2</strong></p>

<p>page2<br />
ok<br />
<strong>page3</strong></p>

<p>&lt;%= form_tag page7_pages_path do %&gt;<br />
&nbsp; &lt;%= text_field_tag :text %&gt;<br />
&nbsp; &lt;%= submit_tag &#39;save&#39; %&gt;<br />
&lt;% end %&gt;<br />
&lt;%= link_to raw(&quot;save&quot;), page7_pages_path, class: &quot;btn btn-primary btn-sm&quot;%&gt;</p>

<p><strong>page4</strong></p>

<p>ok<br />
<strong>page5</strong></p>

<p>&lt;%= link_to &quot;batch create&quot;, create_100_pages_path %&gt;<br />
&lt;%= form_tag create_100_pages_path do %&gt;<br />
&nbsp; &lt;%= submit_tag &#39;batch create&#39; %&gt;<br />
&lt;% end %&gt;</p>

<p><strong>page6</strong></p>

<p>&lt;% MyBlog.all.each do |my_blog| %&gt;<br />
&nbsp; &lt;p&gt;<br />
&nbsp;&nbsp; id: &lt;%= my_blog.id %&gt;...title: .&lt;%= my_blog.title %&gt;.....content: &lt;%= my_blog.content %&gt;...created_at: .&lt;%= my_blog.created_at.to_s(:db) %&gt;<br />
&nbsp; &lt;/p&gt;<br />
&nbsp; &lt;br/&gt;<br />
&lt;% end %&gt;</p>

