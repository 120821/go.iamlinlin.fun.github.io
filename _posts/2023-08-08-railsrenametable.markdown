---
layout: post
title: "rails rename table"
date: "2023-08-08"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/46940405/rails-5-rename-table-migration">https://stackoverflow.com/questions/46940405/rails-5-rename-table-migration</a></p>

<p>重命名表：</p>

<pre>
<code>$ rails g migration change_[old_table_name]_to_[new_table_name]</code></pre>

<p><code>修改migration的内容：</code></p>

<pre>
<code>def change
  rename_table :[old_table_name], :[new_table_name]
end
</code></pre>

<p>然后db:mgirate即可</p>

