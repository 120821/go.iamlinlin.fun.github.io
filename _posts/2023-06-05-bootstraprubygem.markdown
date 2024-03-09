---
layout: post
title: "Bootstrap Ruby Gem"
date: "2023-06-05"
categories: 
---
<p>refer：<a href="https://github.com/twbs/bootstrap-rubygem/blob/main/README.md">https://github.com/twbs/bootstrap-rubygem/blob/main/README.md</a></p>

<p dir="auto">Please see the appropriate guide for your environment of choice:</p>

<ul dir="auto">
	<li><a href="https://github.com/twbs/bootstrap-rubygem/blob/main/README.md#a-ruby-on-rails">Ruby on Rails 4+</a> or other Sprockets environment.</li>
	<li><a href="https://github.com/twbs/bootstrap-rubygem/blob/main/README.md#b-other-ruby-frameworks">Other Ruby frameworks</a> not on Rails.</li>
</ul>

<p>1.安装</p>

<p dir="auto">a. Ruby on Rails</p>

<p dir="auto">在 Gemfile增加:</p>

<div class="highlight highlight-source-ruby notranslate overflow-auto position-relative" dir="auto">
<pre>
gem &#39;bootstrap&#39;, &#39;~&gt; 5.3.0.alpha3&#39;</pre>

<p dir="auto"><code>确保：sprockets-rails</code> i至少 v2.3.2.</p>

<p dir="auto"><code>bundle install</code> 并且重启server 确保 文件可以通过piepeline使用</p>

<p dir="auto">导入引导程序样式 <code>app/assets/stylesheets/application.scss</code>：</p>

<div class="highlight highlight-source-css-scss notranslate overflow-auto position-relative" dir="auto">
<pre>
// Custom bootstrap variables must be set or imported *before* bootstrap.
@import &quot;bootstrap&quot;;</pre>
</div>

<p dir="auto">可在此处找到可用变量 <a href="https://github.com/twbs/bootstrap-rubygem/blob/main/assets/stylesheets/bootstrap/_variables.scss">here</a>。</p>

<p dir="auto">确保文件具有 <code>.scss</code> 扩展名（或 <code>.sass</code> 对于 Sass 语法）。如果您刚刚生成了一个新的 Rails 应用程序， 它可能带有一个 <code>.css</code> 文件代替。如果此文件存在，则将提供它而不是 Sass，因此请重命名它：</p>

<div class="highlight highlight-text-shell-session notranslate overflow-auto position-relative" dir="auto">
<pre>
<code>$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss</code></pre>
</div>

<p dir="auto">然后，删除所有 <code>*= require</code> 和 <code>*= require_tree</code> 来自 Sass 文件的语句。相反，请使用 <code>@import</code> 以导入 Sass 文件。</p>

<p dir="auto">请勿使用 <code>*= require</code> 或您的其他样式表将无法访问 Bootstrap 混合和变量。</p>

<p dir="auto">Bootstrap JavaScript 可以选择使用 jQuery。 如果您使用的是 Rails 5.1+，则可以添加 <code>jquery-rails</code>宝石到您的宝石文件</p>

<div class="highlight highlight-source-ruby notranslate overflow-auto position-relative" dir="auto">
<pre>
gem &#39;jquery-rails&#39;</pre>
</div>

<p dir="auto">Bootstrap JavaScript 可以选择使用 jQuery。 如果您使用的是 Rails 5.1+，则可以添加 <code>jquery-rails</code>宝石到您的宝石文件：</p>

<h4 dir="auto">Importmaps</h4>

<p dir="auto">您可以固定任一 <code>bootstrap.js</code> 或 <code>bootstrap.min.js</code> 在 <code>config/importmap.rb</code> 以及 <code>popper.js</code>：</p>

<div class="highlight highlight-source-ruby notranslate overflow-auto position-relative" dir="auto">
<pre>
<code>pin &quot;bootstrap&quot;, to: &quot;bootstrap.min.js&quot;, preload: true
pin &quot;@popperjs/core&quot;, to: &quot;popper.js&quot;, preload: true</code></pre>
</div>

<p dir="auto">需要将固定到的任何文件 <code>config.assets.precompile</code>：</p>

<div class="highlight highlight-source-ruby notranslate overflow-auto position-relative" dir="auto">
<pre>
<code># config/initializers/assets.rb
Rails.application.config.assets.precompile += %w(bootstrap.min.js popper.js)</code></pre>

<h4 dir="auto"><code>Sprockets</code></h4>

<p dir="auto">将引导依赖项和引导程序添加到您的 <code>application.js</code>：</p>

<div class="highlight highlight-source-js notranslate overflow-auto position-relative" dir="auto">
<pre>
<code>//= require jquery3
//= require popper
//= require bootstrap-sprockets</code></pre>
</div>

<p dir="auto">而 <code>bootstrap-sprockets</code> 提供单独的引导组件 为了便于调试，您可能需要 串联的 <code>bootstrap</code> 为了更快地编译：</p>

<div class="highlight highlight-source-js notranslate overflow-auto position-relative" dir="auto">
<pre>
<code>//= require jquery3
//= require popper
//= require bootstrap</code></pre>

<p dir="auto">配置</p>

<p dir="auto">Sass：自动前缀</p>

<p dir="auto">引导程序需要使用 <a href="https://github.com/ai/autoprefixer">自动前缀程序 </a>。 <a href="https://github.com/ai/autoprefixer">自动前缀程序 </a>值将供应商前缀添加到 CSS 规则 <a href="http://caniuse.com/" rel="nofollow">使用&ldquo;我可以使用&rdquo;中的 </a>中。</p>

<p dir="auto">如果您将引导程序与 Rails 一起使用，则会自动为您设置自动前缀。 否则，请参阅 <a href="https://github.com/ai/autoprefixer">自动前缀文档 </a>。</p>

<h3 dir="auto">&nbsp;</h3>

<p dir="auto">Sass：单个组件</p>

<p dir="auto">默认情况下，导入所有引导程序。</p>

<p dir="auto">您还可以显式导入组件。从模块的完整列表开始复制 <a href="https://github.com/twbs/bootstrap-rubygem/blob/main/assets/stylesheets/_bootstrap.scss"><code>_bootstrap.scss</code></a> 文件作为 <code>_bootstrap-custom.scss</code>. 然后注释掉您不需要的组件 <code>_bootstrap-custom</code>. 在应用程序 Sass 文件中，替换 <code>@import &#39;bootstrap&#39;</code> 跟</p>

<div class="highlight highlight-source-css-scss notranslate overflow-auto position-relative" dir="auto">
<pre>
<code>@import &#39;bootstrap-custom&#39;;</code></pre>
</div>
</div>
</div>
</div>

