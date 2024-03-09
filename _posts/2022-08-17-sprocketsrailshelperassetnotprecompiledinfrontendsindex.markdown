---
layout: post
title: "Sprockets::Rails::Helper::AssetNotPrecompiled in FrontEnds#index"
date: "2022-08-17"
categories: 
---
<p><a href="https://stackoverflow.com/questions/35683185/rails-sprocketsrailshelperassetnotprecompiled-in-development">https://stackoverflow.com/questions/35683185/rails-sprocketsrailshelperassetnotprecompiled-in-development</a></p>

<p>config/application.rb</p>

<pre class="default s-code-block">
<code class="hljs language-ini"><span class="hljs-attr">add :
config.assets.check_precompiled_asset</span> = <span class="hljs-literal">false</span>
</code></pre>

