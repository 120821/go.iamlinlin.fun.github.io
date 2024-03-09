---
layout: post
title: "rails上传图片：DEPRECATION WARNING: #extension_whitelist is deprecated, use #extension_allowlist instead"
date: "2023-04-25"
categories: 
---
<p>这个警告是由于 `Paperclip` 或 `CarrierWave` 等 Ruby 库中使用了 `extension_whitelist` 在验证上传文件类型时被弃用。现在，应该使用 `extension_allowlist` 来替换它。</p>

<p>为了解决这个警告，你需要做以下几步：</p>

<p>1. 找到引起警告的地方。在终端中，如果您使用了 `bundle exec` 命令来运行您的应用程序，则警告信息应该在控制台中显示。</p>

<p>2. 在代码中寻找使用 `extension_whitelist` 的地方，并替换为 `extension_allowlist`。找到这些代码位置后，更新它们以使用新的方法。例如，将以下代码：</p>

<p>&nbsp;&nbsp; ```<br />
&nbsp;&nbsp; class MyModel &lt; ActiveRecord::Base<br />
&nbsp;&nbsp;&nbsp;&nbsp; has_attached_file :image, styles: { medium: &quot;300x300&gt;&quot; },<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; storage: :s3,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s3_credentials: &quot;config/s3.yml&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bucket: &quot;mybucket&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path: &quot;:style/:id/:filename&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extension_whitelist: %w(jpg jpeg gif png)<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp; end<br />
&nbsp;&nbsp; ```</p>

<p>&nbsp;&nbsp; 更改为：</p>

<p>&nbsp;&nbsp; ```<br />
&nbsp;&nbsp; class MyModel &lt; ActiveRecord::Base<br />
&nbsp;&nbsp;&nbsp;&nbsp; has_attached_file :image, styles: { medium: &quot;300x300&gt;&quot; },<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; storage: :s3,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s3_credentials: &quot;config/s3.yml&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bucket: &quot;mybucket&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path: &quot;:style/:id/:filename&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extension_allowlist: %w(jpg jpeg gif png)<br />
&nbsp;&nbsp; end<br />
&nbsp;&nbsp; ```</p>

<p>3. 保存更改并重新运行应用程序，警告应该消失了。</p>

<p>请注意，许多 Ruby 库已经更新了使用新的 `extension_allowlist` 方法，所以问题可能只会在一些较老的软件包中出现。</p>

