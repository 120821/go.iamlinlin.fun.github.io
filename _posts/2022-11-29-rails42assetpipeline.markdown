---
layout: post
title: "rails 4.2 asset pipeline"
date: "2022-11-29"
categories: 
---
<p><a href="https://guides.rubyonrails.org/v4.2/asset_pipeline.html">https://guides.rubyonrails.org/v4.2/asset_pipeline.html</a></p>

<p>简介：一个框架来连接和缩小或压缩 JavaScript 和 CSS 资源。 它还增加了将这些资产写入的能力 其他语言和预处理器，例如 CoffeeScript、Sass 和 ERB。</p>

<p><strong>禁用：</strong>在创建新应用程序时禁用 通过 --skip-sprockets选项</p>

<pre><code>rails new appname --skip-sprockets</code></pre>

<p><strong>默认不禁用</strong>：Rails 4 自动添加 sass-rails, coffee-rails和 uglifier gems 到你的 Gemfile，链轮使用它们进行assets压缩：</p><br />
<pre><code>gem &#39;sass-rails&#39;<br />
gem &#39;uglifier&#39;<br />
gem &#39;coffee-rails&#39;</code></pre><br />
<p>使用 --skip-sprockets选项将阻止 Rails 4 添加 sass-rails和 uglifier到 Gemfile,创建一个应用程序 --skip-sprockets选项将生成 略有不同 config/application.rb文件，带有 require 语句 对于被注释掉的链轮导轨。 你将不得不删除 该行上的注释运算符稍后启用资产管道：</p>
<pre><code># require &quot;sprockets/railtie&quot;</code></pre>

<p>要设置资产压缩方法，请设置适当的配置选项 在 production.rb - config.assets.css_compressor为你的 CSS 和 config.assets.js_compressor对于你的 JavaScript：</p>
<pre><code>config.assets.css_compressor = :yui<br />
config.assets.js_compressor = :uglifier</code></pre>
<p><strong>如何使用</strong></p>

<p>在以前的 Rails 版本中，所有资源都位于 public如 images, javascripts和 stylesheets. 随着资产 管道，这些资产的首选位置现在是 app/assets目录。 此目录中的文件由 Sprockets 中间件提供。</p>

<p>您还可以选择包含特定于控制器的样式表和 JavaScript 文件 仅在各自的控制器中使用以下内容：</p>

<pre><code>&lt;%= javascript_include_tag params[:controller] %&gt;或者 &lt;%= stylesheet_link_tag params[:controller] %&gt;</code></pre>

<p>执行此操作时，确保您没有使用 require_tree指令，因为 将导致您的资产被多次包含在内。</p>

<p>如果需要使用：</p>
<pre><code>app/assets/javascripts/home.js<br />
lib/assets/javascripts/moovinator.js<br />
vendor/assets/javascripts/slider.js<br />
vendor/assets/somepackage/phonebox.js</code></pre>
<p>那么使用：</p>
<pre><code>//= require home<br />
//= require moovinator<br />
//= require slider<br />
//= require phonebox</code></pre>
<p>就可以在APP中引用了<br />
如果是子目录的文件：</p>
<pre><code>app/assets/javascripts/sub/something.js</code></pre>
<p>那么使用：</p>
<pre><code>//= require sub/something</code></pre>

<p>可以通过检查来查看搜索路径 Rails.application.config.assets.paths在 Rails 控制台中。</p>

<p>除了标准 assets/*路径，额外的（完全合格的）路径可以是 添加到管道中 config/application.rb. 例如：</p>
<pre><code>config.assets.paths &lt;&lt; Rails.root.join(&quot;lib&quot;, &quot;videoplayer&quot;, &quot;flash&quot;)</code></pre>

<p>路径按照它们在搜索路径中出现的顺序遍历。 默认， 这意味着文件在 app/assets优先，并将掩盖 中的相应路径 lib和 vendor.</p>

<p>图片的使用：</p>

<pre><code>.class { background-image: url(&lt;%= asset_path &#39;image.png&#39; %&gt;) }</code></pre>

<p>这会将路径写入被引用的特定资产。 在这个例子中， 在资产加载路径之一中放置图像是有意义的，例如 app/assets/images/image.png，将在此处引用。 如果这个图像是 已经可用 public/assets作为指纹文件，那么该路径是 参考。</p>

<p>Rails 还创建了一个默认值 app/assets/stylesheets/application.css文件 其中包含这些行：</p>
<pre><code>/* ...<br />
*= require_self<br />
*= require_tree .<br />
*/</code></pre>

<p><strong>压缩 CSS</strong> 的选项之一是 YUI。 YUI CSS 压缩机 提供 缩小。</p>

<p>以下行启用 YUI 压缩，并需要 yui-compressor 宝石。</p>
<pre><code>config.assets.css_compressor = :yui</code></pre>

<p>如果安装了 sass-rails gem，另一个压缩 CSS 的选项是</p>
<pre><code>config.assets.css_compressor = :sass</code></pre>

<p><strong>JavaScript 压缩</strong>的可能选项是 :closure, :uglifier和 :yui. 这些需要使用 closure-compiler, uglifier或者 yui-compressor宝石，分别。</p>

<p>默认的 Gemfile 包括 uglifier 。 这个 gem 包装 了UglifyJS （为 NodeJS) 在 Ruby 中。 它通过删除空格和注释来压缩您的代码， 缩短局部变量名，并执行其他微优化，例如 作为改变 if和 else尽可能使用三元运算符的语句。</p>

<p>下面一行调用 uglifier用于 JavaScript 压缩。</p>
<pre><code>config.assets.js_compressor = :uglifier</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

