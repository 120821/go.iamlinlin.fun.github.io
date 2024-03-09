---
layout: post
title: "git status 忽略某些文件===ruby路由"
date: "2022-06-09"
categories: 
---

                    <pre><code>vim .gitignore
</code></pre> 
<p>在 文件内增加文件的类型即可 比如加一行 *swp</p> 
<p>加一行 *swp</p> 
<blockquote> 
 <h2 id="学习的目标">学习的目标</h2> 
 <p>看到 resources, 能瞬间人肉算出它生成的7中路由， 能瞬间 说出某个路由对应的action</p> 
</blockquote> 
<blockquote> 
 <p>使用不同的请求类型， 来获取各种资源。</p> 
 <pre><code>POST: create,  (创建资源）
PUT/PATCH： update, (更新）
GET:  index, show, new, edit, (只读取数据，不修改数据)
DELETE: destroy (删除)
</code></pre> 
</blockquote> 
<blockquote> 
 <p>config/routes.rb中：</p> 
 <pre><code>resources :users
</code></pre> 
</blockquote> 
<blockquote> 
 <p>(注意： 不是 resource ) 上面一句，就直接定义了7种路由：</p> 
 <pre><code>GET  /users         index     显示 user的列表页
GET  /users/new     new       显示 user的新建页面。
GET  /users/3       show      显示id是3的user
GET  /users/3/edit  edit      显示 user(id =3)的编辑页面。
PUT  /users/3       update    对id = 3的user进行修改 （后面还会紧跟一大串的参数)
POST /users         create    对users进行创建（后面也有一大堆参数)
DELETE  /users/3    destroy   对 id=3的 user 进行删除操作。
</code></pre> 
</blockquote> 
<p>(可以使用 $ rake routes 就可以查看当前项目中所有的路由）</p> 
<p>这就是一种： convention(约定） over configuration (配置)</p> 
<blockquote> 
 <h2 id="rails中的各种-path-url-的来历">Rails中的各种 _path, _url 的来历</h2> 
 <p>下面的代码, 来自某个项目中的命令: <code>$ rake routes</code>:</p> 
 <pre><code>             POST     /travels(.:format)             travels#create
  new_travel GET      /travels/new(.:format)         travels#new
 edit_travel GET      /travels/:id/edit(.:format)    travels#edit
      travel GET      /travels/:id(.:format)         travels#show
             PATCH    /travels/:id(.:format)         travels#update
             PUT      /travels/:id(.:format)         travels#update
             DELETE   /travels/:id(.:format)         travels#destroy
</code></pre> 
</blockquote> 
<table>
<thead><tr>
<th>url 的名字</th>
<th>REST方法</th>
<th>对应的url 的表达式</th>
<th>对应的 controller#action</th>
</tr></thead>
<tbody>
<tr>
<td>travels_path</td>
<td>POST</td>
<td>/travels(.:format)</td>
<td>travels#create</td>
</tr>
<tr>
<td>new_travel_path</td>
<td>GET</td>
<td>/travels/new(.:format)</td>
<td>travels#new</td>
</tr>
<tr>
<td>edit_travel_path</td>
<td>GET</td>
<td>/travels/:id/edit(.:format)</td>
<td>travels#edit</td>
</tr>
<tr>
<td>travel_path</td>
<td>GET</td>
<td>/travels/:id(.:format)</td>
<td>travels#show</td>
</tr>
<tr>
<td>travel_path</td>
<td>PATCH</td>
<td>/travels/:id(.:format)</td>
<td>travels#update</td>
</tr>
<tr>
<td>travel_path</td>
<td>PUT</td>
<td>/travels/:id(.:format)</td>
<td>travels#update</td>
</tr>
<tr>
<td>travel_path</td>
<td>DELETE</td>
<td>/travels/:id(.:format)</td>
<td>travels#destroy</td>
</tr>
</tbody>
</table>
<p><code>xx_path</code>, <code>xx_url</code> 就是从这里来的. 另外, <code>travel_path</code>等同于<code>travel_url</code>.</p> 
<blockquote> 
 <h2 id="edituserpath-user-是什么东东">edit_user_path @user</h2> 
 <p>如何编辑某个user?</p> 
 <p>"/users/1/edit"</p> 
 <p>写成ruby代码:</p> 
 <ol>
<li>"/users/" + user.id + "/edit"</li>
<li>"/users/#{user.id}/edit" # string interpolation 插入插值</li>
</ol>
 <p>实际上上面这两种形式，都是外行的风格（比如，之前做java 的同学， 来写ruby , 就是这个风格）</p> 
 <p>下面是 Rails风格(把可读性发挥到极致）的写法：</p> 
 <p>最初的形式：</p> 
 <pre><code>&lt;%= edit_user_url({:id =&gt; User.first.id}) %&gt;
</code></pre> 
 <p>然后，ruby的最外层的方法调用的 ()可以省略：</p> 
 <pre><code>&lt;%= edit_user_url {:id =&gt; User.first.id} %&gt; &lt;br/&gt;
</code></pre> 
 <p>ruby的最外层的 hash的 {} 可以省略：</p> 
 <pre><code>&lt;%= edit_user_url :id =&gt; User.first.id %&gt; &lt;br/&gt;
</code></pre> 
 <p>对于rails来说，每个数据库的对象，转换成 string interpolation 的时候，都是默认调用 id方法。</p> 
 <p>所以,一个默认的model 当它 to_string的时候, 是要返回 id 的.</p> 
 <p>所以,最终,也就有了这样的写法:</p> 
 <pre><code>&lt;%= edit_user_url User.first %&gt;
</code></pre> 
</blockquote> 
<p>所以，出现报错，</p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p>
                
