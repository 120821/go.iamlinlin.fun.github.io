---
layout: post
title: "rails --pipline 框架 基本使用"
date: "2022-06-15"
categories: 
---
<p>images, javascripts和stylesheets 子目录都放在 app/assets目录下</p>

<p>比如</p>

<pre>
<code>app/assets/javascripts/home.js

lib/assets/javascripts/moovinator.js

vendor/assets/javascripts/slider.js

vendor/assets/somepackage/phonebox.js</code></pre>

<p>然后，调用是这样的</p>

<pre>
<code>//= require home

//= require moovinator

//= require slider

//= require phonebox</code></pre>

<p><img height="1080" src="/uploads/ckeditor/pictures/38/image-20220615155354-2.png" width="1920" /></p>

<p>调用front_ends.js 需要在app/assets/config/manifest.js文件增加//front_ens.js</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/39/image-20220615155645-3.png" width="1920" /></p>

<p>js文件是这样的</p>

<pre>
<code>app/assets/javascripts/sub/something.js</code></pre>

<p>使用是这样的</p>

<pre>
<code>//= require sub/something</code></pre>

<p>使用js的时候，有两种方式</p>

<pre>
<code>&lt;%= stylesheet_link_tag &quot;application&quot;, media: &quot;all&quot; %&gt;

&lt;%= javascript_include_tag &quot;application&quot; %&gt;</code></pre>

<p>如果某种不生效，那么尝试更换</p>

<p><img height="63" src="/uploads/ckeditor/pictures/40/image-20220615160639-4.png" width="570" /></p>

<p>也可以这样使用</p>

<p>如果使用 Rails 默认包含的 turbolinks gem，则包含&ldquo;data-turbo-track&rdquo;选项，它会导致 Turbo 检查资产是否已更新，如果已更新，则将其加载到页面中：</p>

<pre>
<code>&lt;%= stylesheet_link_tag &quot;application&quot;, media: &quot;all&quot;, &quot;data-turbo-track&quot; =&gt; &quot;reload&quot; %&gt;

&lt;%= javascript_include_tag &quot;application&quot;, &quot;data-turbo-track&quot; =&gt; &quot;reload&quot; %&gt;</code></pre>

<p>图片如果在目录下<code>app/assets/images</code></p>

<pre>
<code>那么可以直接使用</code></pre>

<p>&nbsp;</p>

<pre><code>&lt;%= image_tag &quot;rails.png&quot; %&gt;</code></pre>

<p>image文件夹下就需要增加路径</p>

<pre>
<code>&lt;%= image_tag &quot;icons/rails.png&quot; %&gt;</code></pre>

<p>也可以在css使用</p>

<pre>
<code>.class { background-image: url(&lt;%= asset_path &#39;image.png&#39; %&gt;) }

#logo { background: url(&lt;%= asset_data_uri &#39;logo.png&#39; %&gt;) }</code></pre>

<p>一个文件：app/assets/javascripts/application.js:</p>

<p>在HTML会这样显现</p>

<pre>
<code>&lt;script src=&quot;/assets/application-728742f3b9daa182fe7c831f6a3b8fa87609b4007fdc2f87c134a07b19ad93fb.js&quot;&gt;&lt;/script&gt;</code></pre>

<p><img height="1080" src="/uploads/ckeditor/pictures/37/image-20220615155341-1.png" width="1920" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

