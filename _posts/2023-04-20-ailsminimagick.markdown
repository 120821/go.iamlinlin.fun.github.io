---
layout: post
title: "ails 使用minimagick 上传图片"
date: "2023-04-20"
categories: 
---
<p><a href="https://github.com/minimagick/minimagick">https://github.com/minimagick/minimagick</a></p>

<p>假设您有一个名为 `Product` 的 Rails 模型，它具有一个名为 `image` 的字符串类型的列。以下是使用 MiniMagick 将上传的图像保存到该列的示例代码：</p>

<p>1. 添加 MiniMagick 依赖库。</p>

<p>在 Rails 项目的 Gemfile 文件中添加 MiniMagick 依赖库：</p>

<pre>
<code>gem &#39;mini_magick&#39;{% endhighlight %}

<p>然后运行 `bundle install` 命令来安装它。</p>

<p>2. 在 `Product` 模型中添加对 `image` 列的处理。</p>

<pre>
<code>class Product &lt; ApplicationRecord

&nbsp; mount_uploader :image, ImageUploader # 上传器类名自行替换

&nbsp; # 在保存之前处理图片

&nbsp; before_save :process_image

&nbsp; # 将上传的图像转换为缩略图，并使用 MiniMagick 作为图像处理工具

&nbsp; def process_image

&nbsp;&nbsp;&nbsp; if image.present?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image.thumb(&#39;100x100&#39;) do |thumb|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.image = thumb if thumb.present?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; end

&nbsp; end

end{% endhighlight %}

<p>在上述代码中，我们使用 MiniMagick 提供的 `thumb` 方法来将上传的图像转换为 `100x100` 的缩略图，并使用 `self.image = thumb` 将其保存到 `image` 列中。</p>

<p>注意，以上的示例代码只是提供了一个使用 MiniMagick 处理上传图片的基本框架。如果您需要更复杂的图像处理操作，您可以使用 MiniMagick 提供的其他方法来完成。同样，您可以使用任何一种适合您项目的图像处理工具。</p>

