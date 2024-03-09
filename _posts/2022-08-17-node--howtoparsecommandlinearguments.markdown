---
layout: post
title: "node --How to parse command line arguments "
date: "2022-08-17"
categories: 
---
<p><a href="https://nodejs.org/en/knowledge/command-line/how-to-parse-command-line-arguments/">https://nodejs.org/en/knowledge/command-line/how-to-parse-command-line-arguments/</a></p>

{% highlight %}node mint_by_server.js &lt;rpc_server&gt; &lt;contract_address&gt; &lt;abi_file&gt; &lt;to&gt; &lt;uri&gt;{% endhighlight %}

<p>通过命令行传递参数是一项非常基本的编程任务，对于任何尝试编写简单命令行界面 (CLI) 的人来说都是必需的。&nbsp; 在 Node.js 中，与在 C 和许多相关环境中一样，shell 接收到的所有命令行参数都以名为 argv（&ldquo;参数值&rdquo;的缩写）的数组的形式提供给进程。</p>

<p>&nbsp;Node.js 以 process.argv 的形式为每个正在运行的进程公开这个数组&mdash;&mdash;让我们看一个例子。&nbsp; 创建一个名为 argv.js 的文件并添加以下行：</p>

<pre>
<code class="language-js hljs language-javascript"><span class="hljs-variable language_">console</span>.<span class="hljs-title function_">log</span>(process.<span class="hljs-property">argv</span>);{% endhighlight %}

<pre>
<code class="language-bash hljs">$ node argv.js one two three four five
[ <span class="hljs-string">&#39;node&#39;</span>,
  <span class="hljs-string">&#39;/home/avian/argvdemo/argv.js&#39;</span>,
  <span class="hljs-string">&#39;one&#39;</span>,
  <span class="hljs-string">&#39;two&#39;</span>,
  <span class="hljs-string">&#39;three&#39;</span>,
  <span class="hljs-string">&#39;four&#39;</span>,
  <span class="hljs-string">&#39;five&#39;</span> ]{% endhighlight %}

<p>使用方法实例：</p>

<pre>
<code>const myArgs = process.argv.slice(2);

&nbsp; let rpc_server = myArgs[0]

&nbsp; let contract_address = myArgs[1]

&nbsp; let abi_file = myArgs[2]

&nbsp; let abi = JSON.parse(fs.readFileSync(abi_file))

&nbsp; let uri = myArgs[3]{% endhighlight %}

<p>运行的时候就是node xxx.js rpc_server(such as fuji http:...) 0x...abcd xxx.abi uri(such as http://baidu.com)</p>

<p>&nbsp;</p>

