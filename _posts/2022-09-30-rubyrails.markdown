---
layout: post
title: "Ruby中的单元测试  rails中的单元测试都怎么写的"
date: "2022-09-30"
categories: 
---
<p><a href="https://ruby-china.github.io/rails-guides/testing.html">官网</a></p>

<p>Rails 测试还可以模拟浏览器请求，无需打开浏览器就能测试应用的响应。</p>

<p>可以使用rake实用程序来测试应用程序。以下是几个重要命令。</p>

<pre>
&nbsp;&nbsp;&nbsp; <code>$ rake测试 - 测试所有单元测试和功能测试（如果存在集成测试）。

&nbsp;&nbsp;&nbsp; $ rake test：functionals - 运行所有功能测试。(rake test:functionals)

&nbsp;&nbsp;&nbsp; $ rake test：units - 运行所有单元测试。

&nbsp;&nbsp;&nbsp; $ rake测试：集成 - 运行所有集成测试。

&nbsp;&nbsp;&nbsp; $ rake test：plugins - 运行所有测试./vendor/plugins/**/test。

&nbsp;&nbsp;&nbsp; $ rake test：recent - 运行在过去10分钟内修改的模型和控制器的测试 -

&nbsp;&nbsp;&nbsp; $ rake test：uncommitted - 对于Subversion中的项目，运行自上次提交以来在模型和控制器中发生的更改的测试 -</code></pre>

<p>使用 rails new application_name 命令创建一个 Rails 项目时，Rails 会生成 test 目录。如果列出这个目录里的内容，你会看到下述目录和文件:</p>

<pre>
<code>$ ls -F test

controllers/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; helpers/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mailers/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_helper.rb
fixtures/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; integration/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; models/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; application_system_test_case.rb</code></pre>

<p>创建新的APP：rails new test-rails-单元测试 --database=postgresql</p>

<p>创建model：bin/rails generate model article title:string body:text</p>

<p>进入console：rails console</p>

<p>查看环境：Rails.env</p>

<p>&nbsp;&nbsp;&nbsp; Rails.env.test?</p>

<p>用test环境启动server：rails s -e test</p>

<p>查看test命令：rake -T test</p>

<p>rake test:system</p>

<p>&nbsp;</p>

<div class="container">
<div class="line number3 index2 alt2">
<p><img height="208" src="/uploads/ckeditor/pictures/497/image-20220930105323-3.png" width="1916" /></p>

<p>修改数据库：config/database.yml</p>

<p><code>bundle exec rake db:create</code></p>

<p><code>rake test:db</code></p>

<p><img height="208" src="/uploads/ckeditor/pictures/498/image-20220930105409-4.png" width="1916" /></p>

<p><img height="412" src="/uploads/ckeditor/pictures/496/image-20220930105159-2.png" width="1916" /></p>

<p>&nbsp;</p>

<p>linlin@linlin-i5:/workspace/test-rails-单元测试$ rake test test/models/article_test.rb:6</p>

<p>linlin@linlin-i5:/workspace/test-rails-单元测试$&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bin/rails db:migrate RAILS_ENV=test</p>

<p>linlin@linlin-i5:/workspace/test-rails-单元测试$ rake test test/models/article_test.rb:6</p>

<p><img height="655" src="/uploads/ckeditor/pictures/500/image-20220930112041-2.png" width="1916" /></p>

<p>rake --tasks</p>

<p><img height="655" src="/uploads/ckeditor/pictures/501/image-20220930112437-3.png" width="1916" /></p>

<p>f表示错误</p>

<p><img height="454" src="/uploads/ckeditor/pictures/502/image-20220930112952-4.png" width="1916" /></p>

<p><code>helpers</code> 目录存放视图辅助方法的测试，<code>mailers</code> 目录存放邮件程序的测试，<code>models</code> 目录存放模型的测试，<code>controllers</code> 目录存放控制器的测试，<code>integration</code> 目录存放涉及多个控制器交互的测试。此外，还有一个目录用于存放邮件程序的测试，以及一个目录用于存放辅助方法的测试。</p>

<p><code>system</code> 目录存放系统测试，在浏览器中全面测试应用。系统测试模拟用户的交互，还能测试 JavaScript。系统测试源自 Capybara，在浏览器中测试应用。</p>

<p>测试数据使用固件（fixture）组织，存放在 <code>fixtures</code> 目录中。</p>

<p>如果先期生成了作业测试，还会创建 <code>jobs</code> 目录。</p>

<p><code>test_helper.rb</code> 文件存储测试的默认配置。</p>

<p><code>application_system_test_case.rb</code> 文件存储系统测试的默认配置。</p>

<p>默认情况下，Rails 应用有三个环境：开发环境、测试环境和生产环境。</p>

<p>各个环境的配置通过类似的方式修改。这里，如果想配置测试环境，可以修改 <code>config/environments/test.rb</code> 文件中的选项。</p>

<div class="note">
<p>运行测试时，<code>RAILS_ENV</code> 环境变量的值是 <code>test</code>。</p>

<p>这个命令会生成很多内容，其中就包括在 <code>test</code> 目录中创建的测试：</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby plain">$ bin/rails generate model article title</code><code class="ruby color2">:string</code> <code class="ruby plain">body</code><code class="ruby color2">:text</code></div>

			<div class="line number2 index1 alt1"><code class="ruby plain">...</code></div>

			<div class="line number3 index2 alt2"><code class="ruby plain">create&nbsp; app/models/article.rb</code></div>

			<div class="line number4 index3 alt1"><code class="ruby plain">create&nbsp; test/models/article_test.rb</code></div>

			<div class="line number5 index4 alt2"><code class="ruby plain">create&nbsp; test/fixtures/articles.yml</code></div>

			<div class="line number6 index5 alt1"><code class="ruby plain">...</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p><img height="178" src="/uploads/ckeditor/pictures/491/image-20220930102135-1.png" width="1307" /></p>

<p>默认在 <code>test/models/article_test.rb</code> 文件中生成的测试如下：</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby plain">require </code><code class="ruby string">&#39;test_helper&#39;</code></div>

			<div class="line number2 index1 alt1">&nbsp;</div>

			<div class="line number3 index2 alt2"><code class="ruby keyword">class</code> <code class="ruby plain">ArticleTest &lt; ActiveSupport::TestCase</code></div>

			<div class="line number4 index3 alt1"><code class="ruby spaces">&nbsp;&nbsp;</code><code class="ruby comments"># test &quot;the truth&quot; do</code></div>

			<div class="line number5 index4 alt2"><code class="ruby spaces">&nbsp;&nbsp;</code><code class="ruby comments">#&nbsp;&nbsp; assert true</code></div>

			<div class="line number6 index5 alt1"><code class="ruby spaces">&nbsp;&nbsp;</code><code class="ruby comments"># end</code></div>

			<div class="line number7 index6 alt2"><code class="ruby keyword">end</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>下面逐行说明这段代码，让你初步了解 Rails 测试代码和相关的术语。</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby plain">require </code><code class="ruby string">&#39;test_helper&#39;</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>这行代码引入 <code>test_helper.rb</code> 文件，即加载默认的测试配置。我们编写的所有测试都会引入这个文件，因此这个文件中定义的代码在所有测试中都可用。</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby keyword">class</code> <code class="ruby plain">ArticleTest &lt; ActiveSupport::TestCase</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p><code>ArticleTest</code> 类定义一个测试用例（test case），它继承自 <code>ActiveSupport::TestCase</code>，因此继承了后者的全部方法。本文后面会介绍其中几个。</p>

<p>在继承自 <code>Minitest::Test</code>（<code>ActiveSupport::TestCase</code> 的超类）的类中定义的方法，只要名称以 <code>test_</code> 开头（区分大小写），就是一个&ldquo;测试&rdquo;。因此，名为 <code>test_password</code> 和 <code>test_valid_password</code> 的方法是有效的测试，运行测试用例时会自动运行。</p>

<p>此外，Rails 定义了 <code>test</code> 方法，它接受一个测试名称和一个块。<code>test</code> 方法在测试名称前面加上 <code>test_</code>，生成常规的 <code>Minitest::Unit</code> 测试。因此，我们无需费心为方法命名，可以像下面这样写：</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby plain">test </code><code class="ruby string">&quot;the truth&quot;</code> <code class="ruby keyword">do</code></div>

			<div class="line number2 index1 alt1"><code class="ruby spaces">&nbsp;&nbsp;</code><code class="ruby plain">assert </code><code class="ruby keyword">true</code></div>

			<div class="line number3 index2 alt2"><code class="ruby keyword">end</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>这段代码几乎与下述代码一样：</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby keyword">def</code> <code class="ruby plain">test_the_truth</code></div>

			<div class="line number2 index1 alt1"><code class="ruby spaces">&nbsp;&nbsp;</code><code class="ruby plain">assert </code><code class="ruby keyword">true</code></div>

			<div class="line number3 index2 alt2"><code class="ruby keyword">end</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>虽然可以像普通的方法那样定义测试，但是使用 <code>test</code> 宏能指定更易读的测试名称。</p>

<div class="note">
<p>生成方法名时，空格会替换成下划线。不过，结果无需是有效的 Ruby 标识符，名称中可以包含标点符号等。这是因为，严格来说，在 Ruby 中任何字符串都可以作为方法的名称。这样，可能需要使用 <code>define_method</code> 和 <code>send</code> 才能让方法其作用，不过在名称形式上的限制较少。</p>
</div>

<p>接下来是我们遇到的第一个断言（assertion）：</p>

<div class="code_container">
<div>
<div class="syntaxhighlighter nogutter  ruby">
<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class="code">
			<div class="container">
			<div class="line number1 index0 alt2"><code class="ruby plain">assert </code><code class="ruby keyword">true</code></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>断言求值对象（或表达式），然后与预期结果比较。例如，断言可以检查：</p>

<ul>
	<li>
	<p>两个值是否相等</p>
	</li>
	<li>
	<p>对象是否为 <code>nil</code></p>
	</li>
	<li>
	<p>一行代码是否抛出异常</p>
	</li>
	<li>
	<p>用户的密码长度是否超过 5 个字符</p>
	</li>
</ul>

<p>一个测试中可以有一个或多个断言，对断言的数量没有限制。只有全部断言都成功，测试才能通过。</p>
</div>
</div>
</div>

<p>&nbsp;</p>

