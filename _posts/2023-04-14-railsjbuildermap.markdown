---
layout: post
title: "rails jbuilder map"
date: "2023-04-14"
categories: 
---
<p><a href="https://aiweb.douguguo.com/?type=faq">https://aiweb.douguguo.com/?type=faq</a></p>

<p><a href="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=2ahUKEwiF8f7yl6j-AhVusVYBHaVbBtUQFnoECAwQAQ&amp;url=https%3A%2F%2Fgithub.com%2Frails%2Fjbuilder&amp;usg=AOvVaw3JBo-3m1xUEuWFQE-vrTpJ">https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=2ahUKEwiF8f7yl6j-AhVusVYBHaVbBtUQFnoECAwQAQ&amp;url=https%3A%2F%2Fgithub.com%2Frails%2Fjbuilder&amp;usg=AOvVaw3JBo-3m1xUEuWFQE-vrTpJ</a></p>

<p>1.在 Rails 中，`map do` 和 `map {}` 都可以用于遍历集合（如数组或哈希表）。它们的作用是相同的，都会将集合中的每个元素进行转换，并生成一个新的集合。可以认为 `map {}` 是 `map do` 的简写形式。</p>

<p>在使用时，两者的区别仅仅在于语法上的差异。`map {}` 使用花括号 `{}` 包裹块内的代码，而 `map do` 使用关键字 `do` 和 `end` 来包裹块内的代码。如下例所示：</p>

<p>使用 `map do`：</p>

<pre>
<code>arr = [1, 2, 3]

new_arr = arr.map do |num|

&nbsp; num * 2

end

puts new_arr #=&gt; [2, 4, 6]</code></pre>

<p>使用 `map {}`：</p>

<pre>
<code>arr = [1, 2, 3]

new_arr = arr.map { |num| num * 2 }

puts new_arr #=&gt; [2, 4, 6]</code></pre>

<p>需要注意的是，在使用 `map {}` 时，如果块内部包含多行代码，则需要使用分号`;` 将每行代码分隔开：</p>

<pre>
<code>arr = [1, 2, 3]

new_arr = arr.map { |num|

&nbsp; if num &gt; 2

&nbsp;&nbsp;&nbsp; num * 2;&nbsp; # 需要加分号将每行代码分隔开

&nbsp; else

&nbsp;&nbsp;&nbsp; num;

&nbsp; end

}

puts ew_arr #=&gt; [1, 2, 6]</code></pre>

<p>无论是使用 `map do` 还是 `map {}`，最终都会返回一个新的集合，原始集合不会受到影响。</p>

<p>2.如果在jbuilder中使用map，连同渲染@contract.transactions的amount属性，可以这样写：</p>

<pre>
<code>json.transactions @contract.transactions.map do |tx|

&nbsp; json.id tx.id

&nbsp; json.amount tx.amount

end</code></pre>

<p>在 Rails 中使用 Jbuilder，`.each` 和 `.map` 在 Jbuilder 模板中都可以使用，但是它们的作用是不同的。</p>

<p>`.each` 方法用于遍历一个数组，并且不会把遍历结果以数组形式返回。在 `.each` 方法中，你不能直接在 json 块里使用循环变量。如果你想要访问循环变量，你需要在 `.each` 块外层先定义一个 Jbuilder 局部变量，然后在 `.each` 块内部访问。</p>

<p>`map` 方法用于遍历一个数组，并可把遍历结果以数组形式返回。在 `.map` 块中，你可以使用循环变量，并直接在 json 块里使用，比如：`json.name deployed_cell.name`。</p>

<p>&nbsp;`- json.deployed_cells @deployed_cells.each do |deployed_cell|` 和 `json.deployed_cells @deployed_cells.map do |deployed_cell|` 都可以正常渲染 @deployed_cells 中的属性，但是，推荐使用 `.map` 方法遍历数组，因为它提供了更多的灵活性。</p>

<p>3.在 Rails 中使用 Jbuilder，`map do` 和 `map {}` 的作用是相同的，都可以用于遍历集合并生成 JSON 数据。</p>

<p>在 Jbuilder 中，`map` 用于循环遍历集合，`key!` 用于设置JSON中的键，`value!` 用于设置JSON中的值。 `map {}` 的使用与 Ruby 中的使用方式相同，只是语法稍有不同。</p>

<p>以下示例展示 Jbuilder 中使用 `map do` 和 `map {}` 的用法：</p>

<pre>
<code># 使用 map do

json.products @products do |product|

&nbsp; json.id product.id

&nbsp; json.name product.name

&nbsp; json.price product.price

end</code></pre>

<pre>
<code># 使用 map {}

json.products @products.map { |product|

&nbsp; {

&nbsp;&nbsp;&nbsp; id: product.id,

&nbsp;&nbsp;&nbsp; name: product.name,

&nbsp;&nbsp;&nbsp; price: product.price

&nbsp; }

}</code></pre>

<p>如上所示，在使用 `map` 时，可以选择使用 `do ... end` 或 `{ ... }` 的语法。</p>

<p>&nbsp;</p>

<p>需要注意的是，Jbuilder 中的 `map` 和 `map!` 是不同的方法，分别对应 Ruby 中的 `map` 和 `map!` 方法。`map!` 会遍历并修改集合中的元素，可能会对原始数据造成影响，需要谨慎使用。</p>

