---
layout: post
title: "Can't verify CSRF token authenticity rails"
date: "2022-08-11"
categories: 
---
<p><a href="https://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails">https://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails</a></p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript">$.<span class="hljs-title function_">ajax</span>({ <span class="hljs-attr">url</span>: <span class="hljs-string">&#39;YOUR URL HERE&#39;</span>,
  <span class="hljs-attr">type</span>: <span class="hljs-string">&#39;POST&#39;</span>,
  <span class="hljs-attr">beforeSend</span>: <span class="hljs-keyword">function</span>(<span class="hljs-params">xhr</span>) {xhr.<span class="hljs-title function_">setRequestHeader</span>(<span class="hljs-string">&#39;X-CSRF-Token&#39;</span>, $(<span class="hljs-string">&#39;meta[name=&quot;csrf-token&quot;]&#39;</span>).<span class="hljs-title function_">attr</span>(<span class="hljs-string">&#39;content&#39;</span>))},
  <span class="hljs-attr">data</span>: <span class="hljs-string">&#39;someData=&#39;</span> + someData,
  <span class="hljs-attr">success</span>: <span class="hljs-keyword">function</span>(<span class="hljs-params">response</span>) {
    $(<span class="hljs-string">&#39;#someDiv&#39;</span>).<span class="hljs-title function_">html</span>(response);
  }
});</code></pre>

<p>&nbsp;</p>

