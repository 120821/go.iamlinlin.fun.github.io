---
layout: post
title: "ActiveRecord Relationships"
date: "2022-09-17"
categories: 
---
<p><a href="https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial">https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial</a></p>

<p>创建了每个基本关系之一</p>

<pre class="prettyprint">
<code class="ruby"><span class="kwd">require</span><span class="pln"> </span><span class="str">&#39;active_record&#39;</span><span class="pln">

</span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pun">.</span><span class="pln">establish_connection</span><span class="pun">(</span><span class="pln">adapter</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;sqlite3&#39;</span><span class="pun">,</span><span class="pln"> database</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;test.db&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="com"># SQLite3 statements to create needed tables for example:</span><span class="pln">

</span><span class="pun">=</span><span class="kwd">begin</span><span class="pln">
CREATE TABLE users </span><span class="pun">(</span><span class="pln">
    id INTEGER PRIMARY KEY AUTOINCREMENT</span><span class="pun">,</span><span class="pln">
    name TEXT
</span><span class="pun">);</span><span class="pln">
CREATE TABLE profiles </span><span class="pun">(</span><span class="pln">
    id INTEGER PRIMARY KEY AUTOINCREMENT</span><span class="pun">,</span><span class="pln">
    user_id INT</span><span class="pun">,</span><span class="pln">
    bio TEXT
</span><span class="pun">);</span><span class="pln">
CREATE TABLE posts </span><span class="pun">(</span><span class="pln">
    id INTEGER PRIMARY KEY AUTOINCREMENT</span><span class="pun">,</span><span class="pln">
    user_id INT</span><span class="pun">,</span><span class="pln">
    content TEXT
</span><span class="pun">);</span><span class="pln">
CREATE TABLE clans </span><span class="pun">(</span><span class="pln">
    id INTEGER PRIMARY KEY AUTOINCREMENT</span><span class="pun">,</span><span class="pln">
    name TEXT
</span><span class="pun">);</span><span class="pln">
CREATE TABLE clans_users </span><span class="pun">(</span><span class="pln">
    id INTEGER PRIMARY KEY AUTOINCREMENT</span><span class="pun">,</span><span class="pln">
    user_id INT</span><span class="pun">,</span><span class="pln">
    clan_id INT
</span><span class="pun">);</span><span class="pln">
</span><span class="pun">=</span><span class="kwd">end</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">User</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pln">
  has_one </span><span class="pun">:</span><span class="pln">profile
  has_many </span><span class="pun">:</span><span class="pln">posts
  has_and_belongs_to_many </span><span class="pun">:</span><span class="pln">clans
</span><span class="kwd">end</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">Profile</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pln">
  belongs_to </span><span class="pun">:</span><span class="pln">user
</span><span class="kwd">end</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">Post</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pln">
  belongs_to </span><span class="pun">:</span><span class="pln">user
</span><span class="kwd">end</span><span class="pln">

</span><span class="kwd">class</span><span class="pln"> </span><span class="typ">Clan</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln"> </span><span class="typ">ActiveRecord</span><span class="pun">::</span><span class="typ">Base</span><span class="pln">
  has_and_belongs_to_many </span><span class="pun">:</span><span class="pln">users
</span><span class="kwd">end</span><span class="pln">


dano </span><span class="pun">=</span><span class="pln"> </span><span class="typ">User</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">name</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;NanoDano&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="com"># A few ways to create the profile for the user</span><span class="pln">
</span><span class="com"># Since this is a one-to-one relationship,</span><span class="pln">
</span><span class="com"># only one will actually be tied to user,</span><span class="pln">
</span><span class="com"># and the others will end up with user_id = null,</span><span class="pln">
</span><span class="com"># but the different options are provided for reference.</span><span class="pln">
</span><span class="typ">Profile</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">bio</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;A l3t3 haker&#39;</span><span class="pun">,</span><span class="pln"> user</span><span class="pun">:</span><span class="pln"> dano</span><span class="pun">)</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">profile </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Profile</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">bio</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;A l33t haker&#39;</span><span class="pun">)</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">create_profile</span><span class="pun">(</span><span class="pln">bio</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Leet!&#39;</span><span class="pun">)</span><span class="pln">

</span><span class="com"># A few ways to add a post to user (one-to-many relationship)</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">posts</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">content</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Sample post&#39;</span><span class="pun">)</span><span class="pln">
</span><span class="typ">Post</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">content</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Another post&#39;</span><span class="pun">,</span><span class="pln"> user</span><span class="pun">:</span><span class="pln"> dano</span><span class="pun">)</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">posts</span><span class="pun">.</span><span class="pln">append</span><span class="pun">(</span><span class="typ">Post</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">content</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;A third post&#39;</span><span class="pun">))</span><span class="pln">

</span><span class="com"># Create the clans &amp; relationships (many-to-many relationship)</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">clans</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">name</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Belgian ROFLs&#39;</span><span class="pun">)</span><span class="pln">
</span><span class="typ">Clan</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">name</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Hax0rs&#39;</span><span class="pun">,</span><span class="pln"> users</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="pln">dano</span><span class="pun">])</span><span class="pln">
dano</span><span class="pun">.</span><span class="pln">clans</span><span class="pun">.</span><span class="pln">append</span><span class="pun">(</span><span class="typ">Clan</span><span class="pun">.</span><span class="pln">create</span><span class="pun">(</span><span class="pln">name</span><span class="pun">:</span><span class="pln"> </span><span class="str">&#39;Lone Rangers&#39;</span><span class="pun">))</span><span class="pln">

</span><span class="com"># Pulling the related objects</span><span class="pln">
u </span><span class="pun">=</span><span class="pln"> </span><span class="typ">User</span><span class="pun">.</span><span class="pln">find_by_name</span><span class="pun">(</span><span class="str">&#39;NanoDano&#39;</span><span class="pun">)</span><span class="pln">
puts u</span><span class="pun">.</span><span class="pln">inspect
puts u</span><span class="pun">.</span><span class="pln">profile</span><span class="pun">.</span><span class="pln">inspect
puts u</span><span class="pun">.</span><span class="pln">post_ids</span><span class="pun">.</span><span class="pln">inspect
puts u</span><span class="pun">.</span><span class="pln">posts</span><span class="pun">.</span><span class="pln">inspect
puts u</span><span class="pun">.</span><span class="pln">clan_ids</span><span class="pun">.</span><span class="pln">inspect
puts u</span><span class="pun">.</span><span class="pln">clans</span><span class="pun">.</span><span class="pln">inspect</span>{% endhighlight %}

