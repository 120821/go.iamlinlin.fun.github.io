---
layout: post
title: "rails  CarrierWave error: DEPRECATION WARNING: #extension_whitelist is deprecated, use #extension_allowlist instead"
date: "2023-04-20"
categories: 
---
<p>您收到此DEPRECATION WARNING是因为您正在使用旧版的 CarrierWave 上传组件，并使用了不推荐使用的 `extension_whitelist` 属性。从 CarrierWave 1.0 版本开始，`extension_whitelist` 已被弃用，取而代之的是 `extension_allowlist`。</p>

<p>要解决此警告，请将代码中的 `extension_whitelist` 替换为 `extension_allowlist`。例如，您可以将以下代码：</p>

<pre>
<code>class MyUploader &lt; CarrierWave::Uploader::Base

&nbsp; def extension_whitelist

&nbsp;&nbsp;&nbsp; %w(jpg jpeg gif png)

&nbsp; end

end</code></pre>

<p>替换为：</p>

<pre>
<code>class MyUploader &lt; CarrierWave::Uploader::Base

&nbsp; def extension_allowlist

&nbsp;&nbsp;&nbsp; %w(jpg jpeg gif png)

&nbsp; end

end</code></pre>

<p>这样就可以避免 DEPRECATION WARNING 警告了。</p>

