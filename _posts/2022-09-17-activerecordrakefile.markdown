---
layout: post
title: "ActiveRecord rakefile"
date: "2022-09-17"
categories: 
---
<p><a href="https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial">https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial</a></p>

<p>您可以创建 Rakefile 以使常见任务易于运行。&nbsp; 要了解有关使用 rake 的更多信息，请查看我的 Ruby Rake 教程。</p>

<p>&nbsp;这个 Rakefile 示例将演示如何创建任务以在加载模型的情况下运行 IRB 会话，以及如何设置一些基本的迁移任务。&nbsp; 此示例假设您在名为 my_db_connection.rb 的文件中有建立连接调用，在 my_models.rb 中有模型类，在与 Rakefile 位于同一目录的名为 my_migrations.rb 的文件中有迁移。</p>

<p>&nbsp;这是一个让您入门的简单示例。</p>

<pre class="prettyprint">

<code class="ruby"><span class="com"># Rakefile</span><span class="pln">
</span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;active_record&#39;</span><span class="pln">
</span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;./my_db_connection.rb&#39;</span><span class="pln">

</span><span class="com"># Run with: rake shell</span><span class="pln">
task </span><span class="pun">:</span><span class="pln">shell </span><span class="kwd">do</span><span class="pln">
  </span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;./my_models.rb&#39;</span><span class="pln">
  </span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;irb&#39;</span><span class="pln">
  </span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;irb/completion&#39;</span><span class="pln">

  ARGV</span><span class="pun">.</span><span class="pln">clear
  IRB</span><span class="pun">.</span><span class="pln">start
</span><span class="kwd">end</span><span class="pln">

</span><span class="com"># Assuming you have a migration named `CreateUserTable` like</span><span class="pln">
</span><span class="com"># the example from the migrations section above</span><span class="pln">
</span><span class="kwd">namespace</span><span class="pln"> </span><span class="pun">:</span><span class="pln">migrate </span><span class="kwd">do</span><span class="pln">
  task </span><span class="pun">:</span><span class="pln">up </span><span class="kwd">do</span><span class="pln">
    </span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;./my_migrations.rb&#39;</span><span class="pln">
    </span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">up</span><span class="pun">)</span><span class="pln">
  </span><span class="kwd">end</span><span class="pln">

  task </span><span class="pun">:</span><span class="pln">down </span><span class="kwd">do</span><span class="pln">
    </span><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;./my_migrations.rb&#39;</span><span class="pln">
    </span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">down</span><span class="pun">)</span><span class="pln">
  </span><span class="kwd">end</span><span class="pln">
</span><span class="kwd">end</span><span class="pln">

</span><span class="com"># Or try to apply a directory of migrations with migrator</span><span class="pln">
</span><span class="com"># migrator = ActiveRecord::Migrator.open(Dir[&quot;migrations&quot;])</span><span class="pln">
</span><span class="com"># puts &quot;Unapplied migrations: #{migrator.pending_migrations}&quot;</span><span class="pln">
</span><span class="com"># migrator.migrate</span>{% endhighlight %}

<p>Then run the tasks with the following commands:</p>

<pre class="prettyprint">
<code class="bash"><span class="pln">rake migrate</span><span class="pun">:</span><span class="pln">up
rake shell
rake migrate</span><span class="pun">:</span><span class="pln">down</span>{% endhighlight %}

