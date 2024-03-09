---
layout: post
title: "rails delayed_job的简单使用"
date: "2023-06-04"
categories: 
---
<p>refer： <a href="https://github.com/collectiveidea/delayed_job">https://github.com/collectiveidea/delayed_job</a>(官网)</p>

<p><a href="https://stackoverflow.com/questions/18563579/how-can-i-see-the-delayed-job-queue">https://stackoverflow.com/questions/18563579/how-can-i-see-the-delayed-job-queue</a>(查看delayed_job任务的数量)</p>

<ol dir="auto">
	<li dir="ltr">修改Gemfile</li>
</ol>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>gem &#39;delayed_job_active_record&#39;
</code></pre>
</div>

<ol dir="auto" start="2">
	<li>创建作业表</li>
</ol>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>rails generate delayed_job:active_record
rake db:migrate
</code></pre>
</div>

<ol dir="auto" start="3">
	<li>修改config/application.rb</li>
</ol>

<p dir="auto">在 Rails 4.2+ 中，在 config/application.rb 中设置queue_adapter</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>config.active_job.queue_adapter = :delayed_job
</code></pre>
</div>

<ol dir="auto" start="4">
	<li>查看bin文件夹</li>
</ol>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>ls bin/
bundle  delayed_job  importmap  rails  rake  setup

</code></pre>
</div>

<p dir="auto">bin/delayed_job 可用于管理后台进程，该进程将 开始工作。 5. 添加 gem &quot;daemons&quot; 到Gemfile</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>gem &quot;daemons&quot;
</code></pre>
</div>

<ol dir="auto" start="6">
	<li>运行脚本</li>
</ol>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>ruby scripts/create_files.rb
</code></pre>
</div>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>{&quot;fast&quot;:530,&quot;fastest&quot;:530,&quot;safeLow&quot;:143,&quot;average&quot;:143,&quot;block_time&quot;:12.694444444444445,&quot;blockNum&quot;:15537392,&quot;speed&quot;:0.7801066667730836,&quot;safeLowWait&quot;:1.5,&quot;avgWait&quot;:1.5,&quot;fastWait&quot;:0.5,&quot;fastestWait&quot;:0.5,&quot;gasPriceRange&quot;:{&quot;4&quot;:211.6,&quot;6&quot;:211.6,&quot;8&quot;:211.6,&quot;10&quot;:211.6,&quot;20&quot;:211.6,&quot;30&quot;:211.6,&quot;40&quot;:211.6,&quot;50&quot;:211.6,&quot;60&quot;:211.6,&quot;70&quot;:211.6,&quot;80&quot;:211.6,&quot;90&quot;:211.6,&quot;100&quot;:211.6,&quot;110&quot;:211.6,&quot;120&quot;:211.6,&quot;130&quot;:211.6,&quot;140&quot;:211.6,&quot;143&quot;:1.5,&quot;150&quot;:1.4,&quot;160&quot;:1.2,&quot;170&quot;:1.2,&quot;180&quot;:1,&quot;190&quot;:0.9,&quot;210&quot;:0.8,&quot;230&quot;:0.8,&quot;250&quot;:0.7,&quot;270&quot;:0.7,&quot;290&quot;:0.7,&quot;310&quot;:0.7,&quot;330&quot;:0.7,&quot;350&quot;:0.6,&quot;370&quot;:0.6,&quot;390&quot;:0.6,&quot;410&quot;:0.6,&quot;430&quot;:0.6,&quot;450&quot;:0.6,&quot;470&quot;:0.6,&quot;490&quot;:0.6,&quot;510&quot;:0.6,&quot;530&quot;:0.5}}
530
143
end
</code></pre>
</div>

<ol dir="auto" start="7">
	<li>查看delayed_job任务的数量</li>
</ol>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>rails c
</code></pre>
</div>

<p dir="auto">查看delayed_job任务的数量</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>Delayed::Job.all
</code></pre>
</div>

<p dir="auto">详情</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>Loading development environment (Rails 7.0.5)
irb(main):001:0&gt; Delayed::Job.all
  priority: 0,
  attempts: 0,
  handler:
   &quot;--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper\njob_data:\n  job_class: WriteToFileJob\n  job_id: 07ab6ce3-0af6-48af-b626-d69c5649d393\n  provider_job_id:\n  queue_name: default\n  priority:\n  arguments:\n  - Hello, Delayed Job!\n  - delayed_job_demo.txt\n  executions: 0\n  exception_executions: {}\n  locale: en\n  timezone: UTC\n  enqueued_at: &#39;2023-06-04T05:19:19Z&#39;\n&quot;,
  last_error: nil,
  run_at: Sun, 04 Jun 2023 05:19:29.878768000 UTC +00:00,
  locked_at: nil,
  failed_at: nil,
  locked_by: nil,
  queue: &quot;default&quot;,
  created_at: Sun, 04 Jun 2023 05:19:19.918858000 UTC +00:00,
  updated_at: Sun, 04 Jun 2023 05:19:19.918858000 UTC +00:00&gt;,
 #&lt;Delayed::Backend::ActiveRecord::Job:0x00007fc7c1e3add8
  id: 2,
  priority: 0,
  attempts: 0,
  handler:
   &quot;--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper\njob_data:\n  job_class: WriteToFileJob\n  job_id: 826382b6-f2e3-45f1-b670-3ac683da3620\n  provider_job_id:\n  queue_name: default\n  priority:\n  arguments:\n  - fast: 530\n    fastest: 530\n    safeLow: 143\n    average: 143\n    block_time: 12.694444444444445\n    blockNum: 15537392\n    speed: 0.7801066667730836\n    safeLowWait: 1.5\n    avgWait: 1.5\n    fastWait: 0.5\n    fastestWait: 0.5\n    gasPriceRange:\n      &#39;4&#39;: 211.6\n      &#39;6&#39;: 211.6\n      &#39;8&#39;: 211.6\n      &#39;10&#39;: 211.6\n      &#39;20&#39;: 211.6\n      &#39;30&#39;: 211.6\n      &#39;40&#39;: 211.6\n      &#39;50&#39;: 211.6\n      &#39;60&#39;: 211.6\n      &#39;70&#39;: 211.6\n      &#39;80&#39;: 211.6\n      &#39;90&#39;: 211.6\n      &#39;100&#39;: 211.6\n      &#39;110&#39;: 211.6\n      &#39;120&#39;: 211.6\n      &#39;130&#39;: 211.6\n      &#39;140&#39;: 211.6\n      &#39;143&#39;: 1.5\n      &#39;150&#39;: 1.4\n      &#39;160&#39;: 1.2\n      &#39;170&#39;: 1.2\n      &#39;180&#39;: 1\n      &#39;190&#39;: 0.9\n      &#39;210&#39;: 0.8\n      &#39;230&#39;: 0.8\n      &#39;250&#39;: 0.7\n      &#39;270&#39;: 0.7\n      &#39;290&#39;: 0.7\n      &#39;310&#39;: 0.7\n      &#39;330&#39;: 0.7\n      &#39;350&#39;: 0.6\n      &#39;370&#39;: 0.6\n      &#39;390&#39;: 0.6\n      &#39;410&#39;: 0.6\n      &#39;430&#39;: 0.6\n      &#39;450&#39;: 0.6\n      &#39;470&#39;: 0.6\n      &#39;490&#39;: 0.6\n      &#39;510&#39;: 0.6\n      &#39;530&#39;: 0.5\n      _aj_symbol_keys: []\n    _aj_symbol_keys: []\n  - delayed_job_demo2.txt\n  executions: 0\n  exception_executions: {}\n  locale: en\n  timezone: UTC\n  enqueued_at: &#39;2023-06-04T05:19:19Z&#39;\n&quot;,
  last_error: nil,
  run_at: Sun, 04 Jun 2023 05:19:29.929404000 UTC +00:00,
  locked_at: nil,
  failed_at: nil,
  locked_by: nil,
  queue: &quot;default&quot;,
  created_at: Sun, 04 Jun 2023 05:19:19.930420000 UTC +00:00,
  updated_at: Sun, 04 Jun 2023 05:19:19.930420000 UTC +00:00&gt;]
</code></pre>
</div>

<p dir="auto">查看delayed_job任务的数量</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>Delayed::Job.all.count
</code></pre>
</div>

<p dir="auto">详情</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>irb(main):002:0&gt; Delayed::Job.all.count
  Delayed::Backend::ActiveRecord::Job Count (1.5ms)  SELECT COUNT(*) FROM &quot;delayed_jobs&quot;
=&gt; 2
</code></pre>
</div>

<p dir="auto">删除txt文件</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>rm *.txt
</code></pre>
</div>

<ol dir="auto" start="8">
	<li>启动任务</li>
</ol>

<p dir="auto">启动</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>RAILS_ENV=production bin/delayed_job start
</code></pre>
</div>

<p dir="auto">查看delayed_job的数量</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>irb(main):003:0&gt; Delayed::Job.all.count
  Delayed::Backend::ActiveRecord::Job Count (0.6ms)  SELECT COUNT(*) FROM &quot;delayed_jobs&quot;
=&gt; 0
</code></pre>
</div>

<p dir="auto">查看目录，已经生成了文件</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code> ls
app  config     db                     delayed_job_demo.txt  Gemfile       lib  public    readme.md  scripts  test  vendor
bin  config.ru  delayed_job_demo2.txt  dump.rdb              Gemfile.lock  log  Rakefile  README.md  storage  tmp

</code></pre>
</div>

<ol dir="auto" start="9">
	<li>继续测试</li>
</ol>

<p dir="auto">删除txt文件</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>rm *.txt
</code></pre>
</div>

<p dir="auto">运行脚本</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>ruby scripts/create_files.rb
</code></pre>
</div>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>{&quot;fast&quot;:530,&quot;fastest&quot;:530,&quot;safeLow&quot;:143,&quot;average&quot;:143,&quot;block_time&quot;:12.694444444444445,&quot;blockNum&quot;:15537392,&quot;speed&quot;:0.7801066667730836,&quot;safeLowWait&quot;:1.5,&quot;avgWait&quot;:1.5,&quot;fastWait&quot;:0.5,&quot;fastestWait&quot;:0.5,&quot;gasPriceRange&quot;:{&quot;4&quot;:211.6,&quot;6&quot;:211.6,&quot;8&quot;:211.6,&quot;10&quot;:211.6,&quot;20&quot;:211.6,&quot;30&quot;:211.6,&quot;40&quot;:211.6,&quot;50&quot;:211.6,&quot;60&quot;:211.6,&quot;70&quot;:211.6,&quot;80&quot;:211.6,&quot;90&quot;:211.6,&quot;100&quot;:211.6,&quot;110&quot;:211.6,&quot;120&quot;:211.6,&quot;130&quot;:211.6,&quot;140&quot;:211.6,&quot;143&quot;:1.5,&quot;150&quot;:1.4,&quot;160&quot;:1.2,&quot;170&quot;:1.2,&quot;180&quot;:1,&quot;190&quot;:0.9,&quot;210&quot;:0.8,&quot;230&quot;:0.8,&quot;250&quot;:0.7,&quot;270&quot;:0.7,&quot;290&quot;:0.7,&quot;310&quot;:0.7,&quot;330&quot;:0.7,&quot;350&quot;:0.6,&quot;370&quot;:0.6,&quot;390&quot;:0.6,&quot;410&quot;:0.6,&quot;430&quot;:0.6,&quot;450&quot;:0.6,&quot;470&quot;:0.6,&quot;490&quot;:0.6,&quot;510&quot;:0.6,&quot;530&quot;:0.5}}
530
143
end
</code></pre>
</div>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>ruby scripts/create_files.rb
</code></pre>
</div>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code>{&quot;fast&quot;:530,&quot;fastest&quot;:530,&quot;safeLow&quot;:143,&quot;average&quot;:143,&quot;block_time&quot;:12.694444444444445,&quot;blockNum&quot;:15537392,&quot;speed&quot;:0.7801066667730836,&quot;safeLowWait&quot;:1.5,&quot;avgWait&quot;:1.5,&quot;fastWait&quot;:0.5,&quot;fastestWait&quot;:0.5,&quot;gasPriceRange&quot;:{&quot;4&quot;:211.6,&quot;6&quot;:211.6,&quot;8&quot;:211.6,&quot;10&quot;:211.6,&quot;20&quot;:211.6,&quot;30&quot;:211.6,&quot;40&quot;:211.6,&quot;50&quot;:211.6,&quot;60&quot;:211.6,&quot;70&quot;:211.6,&quot;80&quot;:211.6,&quot;90&quot;:211.6,&quot;100&quot;:211.6,&quot;110&quot;:211.6,&quot;120&quot;:211.6,&quot;130&quot;:211.6,&quot;140&quot;:211.6,&quot;143&quot;:1.5,&quot;150&quot;:1.4,&quot;160&quot;:1.2,&quot;170&quot;:1.2,&quot;180&quot;:1,&quot;190&quot;:0.9,&quot;210&quot;:0.8,&quot;230&quot;:0.8,&quot;250&quot;:0.7,&quot;270&quot;:0.7,&quot;290&quot;:0.7,&quot;310&quot;:0.7,&quot;330&quot;:0.7,&quot;350&quot;:0.6,&quot;370&quot;:0.6,&quot;390&quot;:0.6,&quot;410&quot;:0.6,&quot;430&quot;:0.6,&quot;450&quot;:0.6,&quot;470&quot;:0.6,&quot;490&quot;:0.6,&quot;510&quot;:0.6,&quot;530&quot;:0.5}}
530
143
end
</code></pre>
</div>

<p dir="auto">查看任务数量，可以看到恢复了2</p>

<p dir="auto">稍等几秒，看到任务已经为0 查看目录,可以看到文件已经生成。</p>

<div class="notranslate overflow-auto position-relative snippet-clipboard-content">
<pre>
<code> ls
app  config     db                     delayed_job_demo.txt  Gemfile       lib  public    readme.md  scripts  test  vendor
bin  config.ru  delayed_job_demo2.txt  dump.rdb              Gemfile.lock  log  Rakefile  README.md  storage  tmp
</code></pre>
</div>

<p dir="auto">所以启动<code>RAILS_ENV=production bin/delayed_job start</code>命令后，再次增加任务，可以不用再次start.</p>

