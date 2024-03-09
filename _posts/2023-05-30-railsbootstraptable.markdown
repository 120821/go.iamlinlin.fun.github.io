---
layout: post
title: "在rails使用了bootstrap，调节table的行间距"
date: "2023-05-30"
categories: 
---
<div class="md md_doc_content" id="code_1685411763309_1">
<p>在 Rails 中使用 Bootstrap，你可以通过添加自定义 CSS 样式来调整表格的行间距。可以在 <code>app/assets/stylesheets/custom.scss</code> 文件中添加以下样式：</p>

<pre>
<code>.table {
  border-collapse: separate;
  border-spacing: 0 10px; /* 这里的 10px 即为行间距，可以根据需要自行修改 */
}</code></pre>

<p>这样就可以为所有表格设置行间距。如果只想为某个具体的表格设置行间距，可以为该表格添加自定义类，然后在上面的样式中使用该类来设置行间距。</p>

<p>例如，为表格添加类 <code>my-table</code>，则可以在样式中这样写：</p>

<pre>
<code>.my-table {
  border-collapse: separate;
  border-spacing: 0 10px; /* 这里的 10px 即为行间距，可以根据需要自行修改 */
}</code></pre>
</div>

