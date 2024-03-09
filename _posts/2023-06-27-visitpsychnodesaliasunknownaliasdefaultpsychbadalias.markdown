---
layout: post
title: "visit_Psych_Nodes_Alias: Unknown alias: default (Psych::BadAlias)"
date: "2023-06-27"
categories: 
---
<p>refer: <a href="https://ruby-china.org/topics/42027">https://ruby-china.org/topics/42027</a></p>

<p><a href="https://www.redmine.org/issues/35435">https://www.redmine.org/issues/35435</a></p>

<p><a href="https://stackoverflow.com/questions/71191685/visit-psych-nodes-alias-unknown-alias-default-psychbadalias">https://stackoverflow.com/questions/71191685/visit-psych-nodes-alias-unknown-alias-default-psychbadalias</a></p>

<p>更新ruby后，出现了visit_Psych_Nodes_Alias: Unknown alias: default (Psych::BadAlias)</p>

<p>/home/ubuntu/.asdf/installs/ruby/3.2.2/lib/ruby/3.2.0/psych/visitors/to_ruby.rb:432:in `visit_Psych_Nodes_Alias&#39;: Cannot load `Rails.application.database_configuration`: (Psych::AliasesNotEnabled)<br />
Alias parsing was not enabled. To enable it, pass `aliases: true` to `Psych::load` or `Psych::safe_load`.</p>

<p>解决：</p>

<pre>
<code>gem &#39;psych&#39;, &#39;&lt; 4</code></pre>

