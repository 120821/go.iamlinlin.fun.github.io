---
layout: post
title: "rails 使用 CarrierWave 和 MiniMagick上传图片"
date: "2023-04-20"
categories: 
---
<p><a href="https://github.com/carrierwaveuploader/carrierwave">https://github.com/carrierwaveuploader/carrierwave</a></p>

<p><a href="https://github.com/minimagick/minimagick">https://github.com/minimagick/minimagick</a></p>

<p>要实现在 Rails 中上传并保存图像，您可以使用 CarrierWave 和 MiniMagick 或 Active Storage。以下是使用 CarrierWave 和 MiniMagick 的基本步骤：</p>

<p>1. 安装 `carrierwave` 和 `mini_magick` gem 到 Gemfile:</p>

<pre>
<code>gem &#39;carrierwave&#39;

gem &#39;mini_magick&#39;</code></pre>

<p>2. 创建一个 uploader 类来处理您的上传文件：</p>

<pre>
<code>class ImageUploader &lt; CarrierWave::Uploader::Base

&nbsp; include CarrierWave::MiniMagick

&nbsp; storage :file

&nbsp; def store_dir

&nbsp;&nbsp;&nbsp; &quot;uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}&quot;

&nbsp; end

&nbsp; version :thumb do

&nbsp;&nbsp;&nbsp; process resize_to_fill: [200, 200]

&nbsp; end

&nbsp; def extension_whitelist

&nbsp;&nbsp;&nbsp; %w(jpg jpeg gif png)

&nbsp; end

end</code></pre>

<p>在此 CarrierWave uploader 类中，您可以定制存储位置，版本处理和文件扩展名白名单等设置。</p>

<p>3. 在 model 中 to mount_uploader：</p>

<pre>
<code>class Product &lt; ApplicationRecord

&nbsp; mount_uploader :image, ImageUploader

end</code></pre>

<p>在此代码段中，我们将 uploader 挂载到 Product 模型的 &quot;image&quot; 列中。</p>

<p>4. 在 view 中添加文件表单控件：</p>

<pre>
<code>&lt;%= form_for @product, html: { multipart: true } do |f| %&gt;

&nbsp; &lt;%= f.label :name %&gt;

&nbsp; &lt;%= f.text_field :name %&gt;

&nbsp; &lt;%= f.label :description %&gt;

&nbsp; &lt;%= f.text_area :description %&gt;

&nbsp; &lt;%= f.label :image %&gt;

&nbsp; &lt;%= f.file_field :image %&gt;

&nbsp; &lt;%= f.submit &quot;Create&quot; %&gt;

&lt;% end %&gt;</code></pre>

<p>在此例子中，我们使用 &quot;multipart&quot; 表单类型和 &quot;file_field&quot; 表单助手来处理文件上传。此外，请注意：您将需要使用 &quot;:image&quot; 和 &quot;ImageUploader&quot; 作为参数调用 &quot;mount_uploader&quot;。</p>

<p>5. 在 controller 中的 &quot;create&quot; 方法中处理提交的表单并将图像保存到数据库：</p>

<pre>
<code>class ProductsController &lt; ApplicationController

&nbsp; def create

&nbsp;&nbsp;&nbsp; @product = Product.new(product_params)

&nbsp;&nbsp;&nbsp; @product.image = params[:product][:image]

&nbsp;&nbsp;&nbsp; if @product.save

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redirect_to @product

&nbsp;&nbsp;&nbsp; else

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render :new

&nbsp;&nbsp;&nbsp; end

&nbsp; end

&nbsp; # ...

&nbsp; private

&nbsp; def product_params

&nbsp;&nbsp;&nbsp; params.require(:product).permit(:name, :description, :image)

&nbsp; end

end</code></pre>

<p>对于处理图像上传和保存的代码，最重要的是将其分配给与上传表单控件名称匹配的枚举参数（在这里，我们使用 &quot;image&quot;）。</p>

<p>在这里，我们使用 &quot;params[:product][:image]&quot; 获取从表单提交的图片，并将其分配给在模型中指定的上传列。</p>

<p>希望这可以帮助您在 Rails 应用程序中实现上传和保存图像。</p>

