---
layout: post
title: "动态创建并提交表单Dynamically create and submit form"
date: "2022-08-17"
categories: 
---
<p><a href="https://stackoverflow.com/questions/8003089/dynamically-create-and-submit-form">https://stackoverflow.com/questions/8003089/dynamically-create-and-submit-form</a></p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript">$(<span class="hljs-variable language_">document</span>).<span class="hljs-title function_">ready</span>(<span class="hljs-keyword">function</span>(){
    $(<span class="hljs-string">&#39;&lt;form action=&quot;form2.html&quot;&gt;&lt;/form&gt;&#39;</span>).<span class="hljs-title function_">appendTo</span>(<span class="hljs-string">&#39;body&#39;</span>).<span class="hljs-title function_">submit</span>();
});{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><tt><code class="hljs language-javascript">使用.appendTo(&#39;body&#39;)才可以提交</code></tt></div>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript"><span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;#fire&#39;</span>).<span class="hljs-title function_">click</span>(<span class="hljs-keyword">function</span>(<span class="hljs-params">event</span>){
    event.<span class="hljs-title function_">preventDefault</span>();
    <span class="hljs-keyword">var</span> newForm = <span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;&lt;form&gt;&#39;</span>, {
        <span class="hljs-string">&#39;action&#39;</span>: <span class="hljs-string">&#39;http://www.google.com/search&#39;</span>,
        <span class="hljs-string">&#39;target&#39;</span>: <span class="hljs-string">&#39;_top&#39;</span>
    })
  .<span class="hljs-title function_">append</span>(<span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;&lt;input&gt;&#39;</span>, {
        <span class="hljs-string">&#39;name&#39;</span>: <span class="hljs-string">&#39;q&#39;</span>,
        <span class="hljs-string">&#39;value&#39;</span>: <span class="hljs-string">&#39;stack overflow&#39;</span>,
        <span class="hljs-string">&#39;type&#39;</span>: <span class="hljs-string">&#39;hidden&#39;</span>
    }));
    newForm.<span class="hljs-title function_">submit</span>();
});{% endhighlight %}

<pre>
<code class="hljs language-javascript">修改为：newForm.<span class="hljs-title function_">appendTo(&#39;body&#39;).submit</span>();{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="hljs language-javascript">需要提交多个数据，就多个input即可</code></div>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript"><span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;#fire&#39;</span>).<span class="hljs-title function_">click</span>(<span class="hljs-keyword">function</span>(<span class="hljs-params">event</span>){
    event.<span class="hljs-title function_">preventDefault</span>();
    <span class="hljs-keyword">var</span> newForm = <span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;&lt;form&gt;&#39;</span>, {
        <span class="hljs-string">&#39;action&#39;</span>: <span class="hljs-string">&#39;http://www.google.com/search&#39;</span>,
        <span class="hljs-string">&#39;target&#39;</span>: <span class="hljs-string">&#39;_top&#39;</span>
    })
.<span class="hljs-title function_">append</span>(<span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;&lt;input&gt;&#39;</span>, {
        <span class="hljs-string">&#39;name&#39;</span>: <span class="hljs-string">&#39;11&#39;</span>,
        <span class="hljs-string">&#39;value&#39;</span>: <span class="hljs-string">&#39;stack overflow11&#39;</span>,
        <span class="hljs-string">&#39;type&#39;</span>: <span class="hljs-string">&#39;hidden&#39;</span>
    }));
.<span class="hljs-title function_">append</span>(<span class="hljs-title function_">jQuery</span>(<span class="hljs-string">&#39;&lt;input&gt;&#39;</span>, {
        <span class="hljs-string">&#39;name&#39;</span>: <span class="hljs-string">&#39;22&#39;</span>,
<span class="hljs-string">        &#39;value&#39;</span>: <span class="hljs-string">&#39;stack overflow22&#39;</span>,
<span class="hljs-string">        &#39;type&#39;</span>: <span class="hljs-string">&#39;hidden&#39;</span>
}));
    newForm.<span class="hljs-title function_">appendTo(&#39;body&#39;).submit</span>();
});{% endhighlight %}

<p>然后增加csrf保护：</p>

<pre>
<code>let newForm = jQuery(&#39;&lt;form id=&quot;my_form&quot; action=&quot;/contracts/save_deploy_information&quot; method=&quot;POST&quot;&gt;&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(jQuery(&#39;&lt;input&gt;&#39;, {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;name&#39;: &#39;tx&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;value&#39;: receipt.transactionHash,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;type&#39;: &#39;hidden&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(jQuery(&#39;&lt;input&gt;&#39;, {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;name&#39;: &#39;contract_address&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;value&#39;: receipt.contractAddress,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;type&#39;: &#39;hidden&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(jQuery(&#39;&lt;input&gt;&#39;, {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;name&#39;: &#39;contract_root_address&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;value&#39;: receipt.from,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;type&#39;: &#39;hidden&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(jQuery(&#39;&lt;input&gt;&#39;, {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;name&#39;: &#39;id&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;value&#39;: &lt;%= @contract.id %&gt;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;type&#39;: &#39;hidden&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(jQuery(&#39;&lt;input&gt;&#39;, {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;name&#39;: &#39;authenticity_token&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;value&#39;: &#39;&lt;%= form_authenticity_token %&gt;&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;type&#39;: &#39;hidden&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newForm.appendTo(&#39;body&#39;).submit();

 }&nbsp; &nbsp;{% endhighlight %}

