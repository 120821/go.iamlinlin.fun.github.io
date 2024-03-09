---
layout: post
title: "ActiveRecord migration"
date: "2022-09-17"
categories: 
---
<p><a href="https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial">https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial</a></p>

<pre class="prettyprint">
<code class="ruby"><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;active_record&#39;</span><span class="pln">

</span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">establish_connection</span><span class="pun">(</span><span class="pln">adapter</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;sqlite3&#39;</span><span class="pun">,</span><span class="pln"> database</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;test.db&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">CreateUserTable</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Migration</span><span class="pun">[</span><span class="lit">5.2</span><span class="pun">]</span><span class="pln">
  </span><span class="kwd">def</span><span class="pln"> change
    create_table </span><span class="pun">:</span><span class="pln">users </span><span class="kwd">do</span><span class="pln"> </span><span class="pun">|</span><span class="pln">table</span><span class="pun">|</span><span class="pln">
      table</span><span class="pun">.</span><span class="kwd">string</span><span class="pln"> </span><span class="pun">:</span><span class="pln">name
      table</span><span class="pun">.</span><span class="pln">integer </span><span class="pun">:</span><span class="pln">age
      table</span><span class="pun">.</span><span class="pln">timestamps
    </span><span class="kwd">end</span><span class="pln">
  </span><span class="kwd">end</span><span class="pln">
</span><span class="kwd">end</span><span class="pln">

</span><span class="com"># Create the table</span><span class="pln">
</span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">up</span><span class="pun">)</span><span class="pln">

</span><span class="com"># Drop the table</span><span class="pln">
</span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">down</span><span class="pun">)</span>{% endhighlight %}

<p><code>or up and down</code></p>

<pre class="prettyprint">
<code class="ruby"><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;active_record&#39;</span><span class="pln">

</span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">establish_connection</span><span class="pun">(</span><span class="pln">adapter</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;sqlite3&#39;</span><span class="pun">,</span><span class="pln"> database</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;test.db&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">CreateUserTable</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Migration</span><span class="pun">[</span><span class="lit">5.2</span><span class="pun">]</span><span class="pln">
  </span><span class="kwd">def</span><span class="pln"> up
    </span><span class="kwd">unless</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">connection</span><span class="pun">.</span><span class="pln">table_exists</span><span class="pun">?(:</span><span class="pln">users</span><span class="pun">)</span><span class="pln">
      create_table </span><span class="pun">:</span><span class="pln">users </span><span class="kwd">do</span><span class="pln"> </span><span class="pun">|</span><span class="pln">table</span><span class="pun">|</span><span class="pln">
        table</span><span class="pun">.</span><span class="kwd">string</span><span class="pln"> </span><span class="pun">:</span><span class="pln">name
        table</span><span class="pun">.</span><span class="pln">integer </span><span class="pun">:</span><span class="pln">age
        table</span><span class="pun">.</span><span class="pln">timestamps
      </span><span class="kwd">end</span><span class="pln">
    </span><span class="kwd">end</span><span class="pln">
  </span><span class="kwd">end</span><span class="pln">

  </span><span class="kwd">def</span><span class="pln"> down
    </span><span class="kwd">if</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">connection</span><span class="pun">.</span><span class="pln">table_exists</span><span class="pun">?(:</span><span class="pln">users</span><span class="pun">)</span><span class="pln">
      drop_table </span><span class="pun">:</span><span class="pln">users
    </span><span class="kwd">end</span><span class="pln">
  </span><span class="kwd">end</span><span class="pln">
</span><span class="kwd">end</span><span class="pln">

</span><span class="com"># Create the table</span><span class="pln">
</span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">up</span><span class="pun">)</span><span class="pln">

</span><span class="com"># Drop the table</span><span class="pln">
</span><span class="typ">CreateUserTable</span><span class="pun">.</span><span class="pln">migrate</span><span class="pun">(:</span><span class="pln">down</span><span class="pun">)</span>{% endhighlight %}

<p>日志记录</p>

<p>&nbsp;您可以利用标准库记录器将 ActiveRecord 日志信息输出到 STDOUT 或文件。&nbsp; 提供 STDOUT 或类似 log.txt 的文件名。&nbsp; 这将记录所有使用 ANSI 颜色进行的查询。</p>

<pre class="prettyprint">
<code class="ruby"><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;active_record&#39;</span><span class="pln">

</span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">establish_connection</span><span class="pun">(</span><span class="pln">adapter</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;sqlite3&#39;</span><span class="pun">,</span><span class="pln"> database</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;test.db&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="com"># Set up STDOUT or provide a filename like &#39;log.txt&#39;</span><span class="pln">
</span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">logger </span><span class="pun">=</span><span class="pln"> </span><span class="typ">ActiveSupport</span><span class="pun">::</span><span class="typ">Logger</span><span class="pun">.</span><span class="kwd">new</span><span class="pun">(</span><span class="pln">STDOUT</span><span class="pun">)</span><span class="pln">

</span><span class="com"># To disable the ANSI color output:</span><span class="pln">
</span><span class="typ">ActiveSupport</span><span class="pun">::</span><span class="typ">LogSubscriber</span><span class="pun">.</span><span class="pln">colorize_logging </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">false</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">User</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pln">
</span><span class="kwd">end</span><span class="pln">

</span><span class="typ">User</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">name</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;NanoDano&#39;</span><span class="pun">)</span>{% endhighlight %}

