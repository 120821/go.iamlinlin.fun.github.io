---
layout: post
title: "独立的使用ActiveRecord ， 操作数据库"
date: "2022-09-16"
categories: 
---
<p><a href="https://willschenk.com/articles/2022/using_active_record_outside_of_rails/">https://willschenk.com/articles/2022/using_active_record_outside_of_rails/</a></p>

<p>编辑rakefile</p>

{% highlight %}# From https://gist.github.com/Rhoxio/ee9a855088c53d447f2eb888bd9d09a4<br />
require &quot;active_record&quot;<br />
&nbsp; require &quot;fileutils&quot;<br />
&nbsp; begin<br />
&nbsp;&nbsp;&nbsp; require &#39;dotenv/load&#39;<br />
&nbsp; rescue LoadError<br />
&nbsp; end
FileUtils.mkdir_p &quot;db/migrate&quot;
namespace :db do<br />
&nbsp; include ActiveRecord::Tasks

&nbsp; def db_config<br />
&nbsp;&nbsp;&nbsp; connection.db_config<br />
&nbsp; end

&nbsp; def connection<br />
&nbsp;&nbsp;&nbsp; puts &quot;Database url #{ENV[&#39;DATABASE_URL&#39;]}&quot;

&nbsp;&nbsp;&nbsp; @connection ||= ActiveRecord::Base.establish_connection<br />
&nbsp; end
&nbsp; desc &quot;Create the database&quot;<br />
&nbsp; task :create do<br />
&nbsp;&nbsp;&nbsp; ActiveRecord::Tasks::DatabaseTasks.create db_config<br />
&nbsp; end
&nbsp; desc &quot;Migrate the database&quot;<br />
&nbsp; task :migrate =&gt; [:create] do<br />
&nbsp;&nbsp;&nbsp; connection<br />
&nbsp;&nbsp;&nbsp; ActiveRecord::MigrationContext.new( &#39;db/migrate&#39; ).migrate<br />
&nbsp;&nbsp;&nbsp; Rake::Task[&quot;db:schema&quot;].invoke<br />
&nbsp; end
&nbsp; desc &quot;Drop the database&quot;<br />
&nbsp; task :drop do<br />
&nbsp;&nbsp;&nbsp; connection<br />
&nbsp;&nbsp;&nbsp; ActiveRecord::Tasks::DatabaseTasks.drop db_config<br />
&nbsp; end
&nbsp; desc &quot;Reset the database&quot;<br />
&nbsp; task :reset =&gt; [:drop, :create, :migrate]

&nbsp; desc &#39;Create a db/schema.rb file that is portable against any DB supported by AR&#39;<br />
&nbsp; task :schema do<br />
&nbsp;&nbsp;&nbsp; ActiveRecord::Tasks::DatabaseTasks.db_dir = &#39;./db&#39;<br />
&nbsp;&nbsp;&nbsp; ActiveRecord::Tasks::DatabaseTasks.dump_schema( db_config )<br />
&nbsp; end<br />
end
namespace :g do<br />
&nbsp; desc &quot;Generate migration&quot;<br />
&nbsp; task :migration do<br />
&nbsp;&nbsp;&nbsp; name = ARGV[1] || raise(&quot;Specify name: rake g:migration your_migration&quot;)<br />
&nbsp;&nbsp;&nbsp; timestamp = Time.now.strftime(&quot;%Y%m%d%H%M%S&quot;)<br />
&nbsp;&nbsp;&nbsp; path = File.expand_path(&quot;../db/migrate/#{timestamp}_#{name}.rb&quot;, __FILE__)<br />
&nbsp;&nbsp;&nbsp; migration_class = name.split(&quot;_&quot;).map(&amp;:capitalize).join
&nbsp;&nbsp;&nbsp; File.open(path, &#39;w&#39;) do |file|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file.write &lt;&lt;-EOF<br />
&nbsp; class #{migration_class} &lt; ActiveRecord::Migration[6.0]<br />
&nbsp;&nbsp;&nbsp; def self.up<br />
&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; def self.down<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EOF<br />
&nbsp;&nbsp;&nbsp; end
&nbsp;&nbsp;&nbsp; puts &quot;Migration #{path} created&quot;<br />
&nbsp;&nbsp;&nbsp; abort # needed stop other tasks<br />
&nbsp; end<br />
end{% endhighlight %}

<pre class="chroma">
<code class="language-bash" data-lang="bash">rake -T{% endhighlight %}

<p><img height="175" src="/uploads/ckeditor/pictures/408/image-20220916165411-1.png" width="1089" /></p>

<p>创建脚本，连接数据库，并运行</p>

<p><code>require &#39;active_record&#39;</code></p>

{% highlight %}ActiveRecord::Base.establish_connection(adapter: &#39;postgresql&#39;, database: &#39;datasetter_development&#39;)
class User &lt; ActiveRecord::Base<br />
end

# Create a new user object then save it to store in database<br />
new_user = User.new(name: &#39;Dano&#39;)<br />
puts &quot;=== befor save user: &quot;<br />
puts new_user.inspect<br />
new_user.save<br />
puts &quot;=== after save user: &quot;<br />
puts new_user.inspect<br />
puts &quot;=== after save user.all.size: &quot;<br />
puts User.all.size

User.new { |u|<br />
&nbsp;&nbsp;&nbsp; u.name = &#39;NanoDano&#39;<br />
}.save<br />
puts &quot;=== after save user.all.size: &quot;<br />
puts User.all.size<br />
# Create and save in one step with `.create()`<br />
User.create(name: &#39;John Leon&#39;)<br />
puts &quot;=== after save user.all.size: &quot;<br />
puts User.all.size{% endhighlight %}

<p><img height="267" src="/uploads/ckeditor/pictures/409/image-20220916165841-2.png" width="1466" /></p>

