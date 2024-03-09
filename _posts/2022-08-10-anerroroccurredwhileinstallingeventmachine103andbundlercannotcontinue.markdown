---
layout: post
title: "An error occurred while installing eventmachine (1.0.3), and Bundler cannot continue."
date: "2022-08-10"
categories: 
---
<p>参考：https://stackoverflow.com/questions/31880676/an-error-occurred-while-installing-eventmachine-1-0-3-and-bundler-cannot-cont</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">gem install eventmachine -v <span class="hljs-string">&#39;1.0.4&#39;</span>{% endhighlight %}

<p>gem install eventmachine -v &#39;1.0.4&#39;<br />
Fetching eventmachine-1.0.4.gem<br />
Building native extensions. This could take a while...<br />
Successfully installed eventmachine-1.0.4<br />
Parsing documentation for eventmachine-1.0.4<br />
Installing ri documentation for eventmachine-1.0.4<br />
Done installing documentation for eventmachine after 2 seconds<br />
1 gem installed</p>

<p>修改Gemfile</p>

<p>cat Gemfile<br />
#source &#39;https://rubygems.org&#39;<br />
source &#39;https://gems.ruby-china.com&#39;</p>

<p>gem &#39;thin&#39;<br />
gem &#39;sinatra&#39;<br />
gem &#39;eventmachine&#39;, &#39;~&gt;1.0.4&#39;<br />
gem &#39;em-websocket&#39;</p>

<p>然后在install就没有问题了</p>

<p>bundle<br />
Fetching gem metadata from https://gems.ruby-china.com/....<br />
Resolving dependencies...<br />
Using bundler 2.3.19<br />
Using daemons 1.1.9<br />
Using rack 1.5.2<br />
Using tilt 1.4.1<br />
Using rack-protection 1.5.0<br />
Fetching eventmachine 1.0.9.1 (was 1.0.3)<br />
Using sinatra 1.4.3<br />
Installing eventmachine 1.0.9.1 (was 1.0.3) with native extensions<br />
Fetching thin 1.5.1<br />
Installing thin 1.5.1 with native extensions<br />
Bundle complete! 3 Gemfile dependencies, 8 gems now installed.<br />
Use `bundle info [gemname]` to see where a bundled gem is installed.</p>

<p>&nbsp;</p>

