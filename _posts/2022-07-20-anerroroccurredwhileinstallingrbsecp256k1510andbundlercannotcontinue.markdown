---
layout: post
title: "An error occurred while installing rbsecp256k1 (5.1.0), and Bundler cannot continue."
date: "2022-07-20"
categories: 
---
<p>Using sass-rails 6.0.0<br />
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.</p>
<p>&nbsp;&nbsp;&nbsp; current directory: /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/rbsecp256k1-5.1.0/ext/rbsecp256k1<br />
/home/linlin/.asdf/installs/ruby/3.0.3/bin/ruby -I /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/3.0.0 -r ./siteconf20220720-21650-bujsjh.rb extconf.rb<br />
2 retrie(s) left for libsecp256k1.zip (Net::ReadTimeout with #&lt;TCPSocket:(closed)&gt;)<br />
1 retrie(s) left for libsecp256k1.zip (execution expired)<br />
Downloading libsecp256k1.zip (&nbsp; 0%)<br />
Downloading libsecp256k1.zip (&nbsp; 0%)</p>
<p><strong>An error occurred while installing rbsecp256k1 (5.1.0), and Bundler cannot continue.</strong></p>
<p>In Gemfile:<br />
&nbsp; eth was resolved to 0.5.6, which depends on<br />
&nbsp;&nbsp;&nbsp; rbsecp256k1</p>
<p>直接把eht注释就可以了</p>
<p>&nbsp;</p>
