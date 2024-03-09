---
layout: post
title: "layouts_and_rendering."
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/layouts_and_rendering.html">https://guides.rubyonrails.org/layouts_and_rendering.html</a></p>

<p>controller进行渲染编辑页面</p>

<pre>
<code>render :edit

render action: :edit

render &quot;edit&quot;

render action: &quot;edit&quot;

render &quot;books/edit&quot;

render template: &quot;books/edit&quot;</code></pre>

<p>渲染其他内容：</p>

<pre>
<code>render plain: &quot;OK&quot;

render html: helpers.tag.strong(&#39;Not Found&#39;)

render json: @product</code></pre>

<p>&nbsp;</p>

<p>render xml: @product</p>

<p>&nbsp;</p>

<p>render js: &quot;alert(&#39;Hello Rails&#39;);&quot; render body: &quot;raw&quot;</p>

<p>或者直接报错：</p>

<pre>
<code>render file: &quot;#{Rails.root}/public/404.html&quot;, layout: false

controller进行设置渲染模板</code></pre>

<pre>
<code>class ProductsController &lt; ApplicationController

&nbsp;

&nbsp; def show

&nbsp;&nbsp;&nbsp; @product = Product.find(params[:id])

&nbsp; end

&nbsp; private

&nbsp;&nbsp;&nbsp; def products_layout

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @current_user.special? ? &quot;special&quot; : &quot;products&quot;

&nbsp;&nbsp;&nbsp; end

end</code></pre>

<p>application_controller确认进行渲染的公共样式</p>

<pre>
<code>class ApplicationController &lt; ActionController::Base

&nbsp; layout &quot;main&quot;

end</code></pre>

<p>不渲染：</p>

<pre>
<code>class OldArticlesController &lt; SpecialArticlesController

&nbsp; layout false</code></pre>

<pre>
<code>&nbsp; def show

&nbsp;&nbsp;&nbsp; @article = Article.find(params[:id])

&nbsp; end</code></pre>

<pre>
<code>&nbsp; def index

&nbsp;&nbsp;&nbsp; @old_articles = Article.older

&nbsp;&nbsp;&nbsp; render layout: &quot;old&quot;

&nbsp; end

&nbsp; # ...

end</code></pre>

<p id="structuring-layouts"><a class="anchorlink" href="https://guides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts">3 Structuring Layouts</a></p>

<p>使用yield，等，asset_pipeline</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

