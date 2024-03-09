---
layout: post
title: "rails pluck"
date: "2023-02-15"
categories: 
---
<p><a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">https://apidock.com/rails/ActiveRecord/Calculations/pluck</a></p>

<p>使用#pluck 作为快捷方式来选择一个或多个属性，而无需加载一堆记录来获取您想要的属性。</p>

<pre>
<code><a href="https://apidock.com/rails/Person">Person</a>.<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(:name)</code></pre>

<pre>
<code><a href="https://apidock.com/rails/Person">Person</a>.<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(:name)
# SELECT people.name FROM people
# =&gt; [&#39;David&#39;, &#39;Jeremy&#39;, &#39;Jose&#39;]

<a href="https://apidock.com/rails/Person">Person</a>.<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(:id, :name)
# SELECT people.id, people.name FROM people
# =&gt; [[1, &#39;David&#39;], [2, &#39;Jeremy&#39;], [3, &#39;Jose&#39;]]

<a href="https://apidock.com/rails/Person">Person</a>.distinct.<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(:role)
# SELECT DISTINCT role FROM people
# =&gt; [&#39;admin&#39;, &#39;member&#39;, &#39;guest&#39;]

<a href="https://apidock.com/rails/Person">Person</a>.where(age: 21).limit(5).<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(:id)
# SELECT people.id FROM people WHERE people.age = 21 LIMIT 5
# =&gt; [2, 3]

<a href="https://apidock.com/rails/Person">Person</a>.<a href="https://apidock.com/rails/ActiveRecord/Calculations/pluck">pluck</a>(&#39;DATEDIFF(updated_at, created_at)&#39;)
# SELECT DATEDIFF(updated_at, created_at) FROM people
# =&gt; [&#39;0&#39;, &#39;27761&#39;, &#39;173&#39;]</code></pre>

