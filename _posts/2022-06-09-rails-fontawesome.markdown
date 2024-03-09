---
layout: post
title: "rails - 使用font awesome 来实现图标"
date: "2022-06-09"
categories: 
---
<p>参考：<a href="http://fontawesome.io/get-started" title=" font awesome  官方网站，">&nbsp;font awesome &nbsp;官方网站，</a>　和rails插件：&nbsp; <a href="https://github.com/bokmann/font-awesome-rails" title="https://github.com/bokmann/font-awesome-rails">https://github.com/bokmann/font-awesome-rails</a>&nbsp;&nbsp;<a href="https://www.runoob.com/font-awesome/fontawesome-tutorial.html">菜鸟教程</a>&nbsp;&nbsp;<br />
<br />
<a href="https://fontawesome.com/search?q=download&amp;s=solid%2Cbrands" title="Search | Font Awesome">Search | Font Awesome</a>中國可以使用的</p>

<p>（比较好用的）国内可以使用的cdn：&nbsp;<a href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css</a></p>

<p>HTML 直接引用链接（在application.html.erb文件增加，或者直接放在assets目录下）</p>

<pre>
<code>&lt;!DOCTYPE html&gt;

&lt;html&gt;

&lt;head&gt;

&lt;link rel=&quot;stylesheet&quot; href=&quot;https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css&quot;&gt;

&lt;/head&gt;

&lt;body&gt;

&nbsp;

&lt;i class=&quot;fa fa-car&quot;&gt;&lt;/i&gt;

&lt;i class=&quot;fa fa-star&quot; style=&quot;font-size:48px;&quot;&gt;&lt;/i&gt;

&lt;i class=&quot;fa fa-star&quot; style=&quot;font-size:60px;color:red;&quot;&gt;&lt;/i&gt;

&nbsp;

&lt;/body&gt;

&lt;/html&gt;</code></pre>

<p><font face="monospace">效果：</font></p>

<p><img height="108" src="/uploads/ckeditor/pictures/729/image-20221117113906-1.png" width="247" /></p>

<blockquote>
<p><code>1. 在Gem</code>file中安装：</p>

<pre>
<code>gem &quot;font-awesome-rails&quot;, </code></pre>

<p>在　application.css 中，增加：</p>

<pre>
<code>*= require font-awesome</code></pre>
</blockquote>

<blockquote>
<p>2. $ bundle install</p>

<p>3. 重启rails 应用</p>

<p>4. 在任意地方，使用下列代码，就可以看到图标了：</p>

<pre>
<code>&lt;%= link_to raw(&quot;&lt;i class=&#39;fa fa-user-circle&#39; aria-hidden=&#39;true&#39;&gt;&lt;/i&gt;欢迎您: #{current_user.try :user_name}&quot;), root_path, :style=&gt;&quot;color:#ffffff;&quot; %&gt;</code></pre>

<p>　或者使用纯HTML:</p>

<pre>
<code>&lt;i class=&quot;fa fa-user-circle&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;</code></pre>

<pre>
<code>&lt;%= submit_tag raw(&quot;&amp;#xf002; 查询&quot;), class: &quot;form_submit&quot;, class: &#39;btn btn-secondary btn-sm fa-input&#39; %&gt;
 11   &lt;%= link_to raw(&#39;&lt;li class=&quot;fa fa-download&quot;&gt;&lt;/li&gt;下载csv&#39;), download_csv_redeem_codes_path, class: &quot;btn btn-primary btn-sm&quot;%&gt;
</code></pre>

<p><img alt="" height="63" src="https://img-blog.csdnimg.cn/6c3afdbe7bd54675adfa7fe523f9abf0.png" width="378" /></p>
</blockquote>

<blockquote>
<p>&nbsp;增加路徑的使用，注意使用的版本，以便於使用可以在頁面顯示的语言</p>

<pre>
<code>&lt;link rel=&quot;stylesheet&quot; href=&quot;https://apps.bdimg.com/libs/fontawesome/4.2.0/css/font-awesome.min.css&quot;&gt;</code></pre>
</blockquote>

<blockquote>
<p>5. 建议：对于下面常见操作的icon: &nbsp;</p>

<p>新增：　fa-plus&nbsp;</p>

<p>编辑：　fa-edit &nbsp;</p>

<p>查看：　fa-info</p>

<p>删除： &nbsp; &nbsp;fa-remove</p>

<p>确定 : &nbsp; &nbsp; &nbsp;fa-check &nbsp;　（用在submit 中的话，就是 &nbsp; &amp;#xf00c; &nbsp; &nbsp; &nbsp;&lt;input type=&#39;submit&#39; value=&#39;&amp;#xf00c;提交&#39; ...&nbsp;</p>

<p>返回 : &nbsp; &nbsp; &nbsp;fa-close &nbsp;&nbsp;</p>

<p>可以使用编辑器的　全局替换．　例如：Vim 的Gsearch/Greplace来实现．非常过瘾．</p>
</blockquote>

<blockquote>
<p>6. 记得要在页面的全局js中，增加这个代码，为所有的fa类，都设置　合适的宽度．(参考：<a href="https://stackoverflow.com/questions/16592849/how-do-i-make-sure-every-glyph-has-the-same-width" title="font awesome - How do I make sure every glyph has the same width? - Stack Overflow">font awesome - How do I make sure every glyph has the same width? - Stack Overflow</a> )</p>

<p>// 让每个font-awesome图标都有固定的宽度．看起来更加美观<br />
$(&#39;.fa&#39;).addClass(&#39;fa-fw&#39;)</p>
</blockquote>

<blockquote>
<p><strong>对于一些特殊情况的使用：</strong></p>

<p>1. &nbsp;在 submit中，添加图标：</p>

<p>参考；&nbsp; <a href="https://stackoverflow.com/a/25561768/445908" title="twitter bootstrap - Font-awesome, input type 'submit' - Stack Overflow">twitter bootstrap - Font-awesome, input type &#39;submit&#39; - Stack Overflow</a>&nbsp; , &nbsp;完整的cheatsheet列表:&nbsp; <a href="http://fontawesome.io/cheatsheet" title="http://fontawesome.io/cheatsheet/">http://fontawesome.io/cheatsheet/</a></p>

<pre>
<code>&lt;%= f.submit raw(&quot;&amp;#xf08b; 登陆&quot;), class: &quot;fa-input btn btn-primary&quot; %&gt;</code></pre>

<p>也可以通过纯jQuery来实现：（貌似方便一些？）</p>

<pre>
   // 让每个　</pre>

<pre>
  都增加class:  fa-input, 这样就可以增加图标了．
   // 记得在　\uf00c 和　确定之间来个空格．看起来舒服些．
   $(&#39;input[value=&quot;确定&quot;]&#39;).addClass(&#39;fa-input&#39;).val(&quot;\uf00c 确定&quot;)
</pre>

<p>然后，记得为　　.fa-input &nbsp;增加样式：</p>

<pre>
<code>.fa-input {
  font-family: FontAwesome, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif !important;
}</code></pre>

<p>&nbsp;</p>
</blockquote>

