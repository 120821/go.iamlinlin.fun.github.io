---
layout: post
title: "rails LoadError: cannot load such file -- sassc"
date: "2023-05-30"
categories: 
---
<div class="md md_doc_content" id="code_1685437146345_1">
<p>这个错误通常是由于缺少 <code>sassc</code> gem 导致的。你可以尝试以下解决方案：</p>

<ol>
	<li>
	<p>确保你的 <code>Gemfile</code> 文件中包含了 <code>sassc</code> gem，并且已经运行了 <code>bundle install</code> 命令。</p>
	</li>
	<li>
	<p>如果你已经安装了 <code>sassc</code> gem，还是无法解决问题，可以尝试重新安装它。可以使用以下命令：（已经安装但是还是会报错）</p>

	<pre>
 <code>gem uninstall sassc
gem install sassc</code></pre>
	</li>
	<li>
	<p>如果你使用的是 Rails 6 或更高版本，可以尝试使用 <code>sass-rails</code> gem 替代 <code>sassc</code> gem。可以使用以下命令：(有效）</p>

	<pre>
 <code>gem &#39;sass-rails&#39;, &#39;~&gt; 6.0.0&#39;</code></pre>

	<p>然后运行 <code>bundle install</code> 命令。</p>
	</li>
	<li>
	<p>如果你使用的是旧版本的 Rails，可以尝试升级 <code>sassc</code> gem 的版本。可以使用以下命令：</p>

	<pre>
 <code>gem update sassc</code></pre>
	</li>
</ol>

<p>如果以上解决方案仍然无法解决问题，你可以尝试在 Rails 官方论坛或者 Stack Overflow 上咨询其他开发者的建议。</p>
</div>

