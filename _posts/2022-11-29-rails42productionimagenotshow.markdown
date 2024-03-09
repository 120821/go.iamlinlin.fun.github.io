---
layout: post
title: "rails 4.2 production image not show "
date: "2022-11-29"
categories: 
---
<p><a href="https://github.com/galetahub/ckeditor/issues/307">https://github.com/galetahub/ckeditor/issues/307</a></p>

<p>增加文件：/lib/tasks/ckeditor.rake</p>

<p>内容如下：</p>

<pre><code>require &#39;fileutils&#39;

desc &quot;Create nondigest versions of all ckeditor digest assets&quot;<br />
task &quot;assets:precompile&quot; do<br />
&nbsp; fingerprint = /\-[0-9a-f]{32}\./<br />
&nbsp; for file in Dir[&quot;public/assets/ckeditor/**/*&quot;]<br />
&nbsp;&nbsp;&nbsp; next unless file =~ fingerprint<br />
&nbsp;&nbsp;&nbsp; nondigest = file.sub fingerprint, &#39;.&#39;<br />
&nbsp;&nbsp;&nbsp; FileUtils.cp file, nondigest, verbose: true<br />
&nbsp; end<br />
end</code></pre>

<p>在文件中（config/application.rb）增加</p>

<p>内容：</p>

<pre class="notranslate">
<code>config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
config.assets.precompile += Ckeditor.assets
config.assets.precompile += %w(ckeditor/*)
</code></pre>

<p>重启:</p>

<pre>
<code>bundle exec rails s -e production </code></pre>

<p>图片就显示了</p>

