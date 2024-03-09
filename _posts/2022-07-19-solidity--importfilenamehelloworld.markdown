---
layout: post
title: "solidity 语法--import filename helloworld"
date: "2022-07-19"
categories: 
---
<pre>
参考：https://solidity-cn.readthedocs.io/zh/develop/layout-of-source-files.html
Solidity 所支持的导入语句，其语法同 JavaScript（从 ES6 起）非常类似。
<span class="k">pragma</span> <span class="nx">solidity</span> <span class="o">^</span><span class="mf">0.4</span><span class="p">.</span><span class="mi">0</span><span class="p">;</span></pre>

<p><span class="p">进行版本的定义，使用说明，</span>这样，源文件将既不允许低于 0.4.0 版本的编译器编译， 也不允许高于（包含） <code class="docutils literal notranslate"><span class="pre">0.5.0</span></code> 版本的编译器编译（第二个条件因使用 <code class="docutils literal notranslate"><span class="pre">^</span></code> 被添加）。 这种做法的考虑是，编译器在 0.5.0 版本之前不会有重大变更，所以可确保源代码始终按预期被编译。 上面例子中不固定编译器的具体版本号，因此编译器的补丁版也可以使用。</p>

<p>在全局层面上，可使用如下格式的导入语句：</p>

<div class="highlight-Solidity notranslate">
<div class="highlight">
<pre>
<span class="k">import</span> <span class="s2">&quot;filename&quot;</span><span class="p">;</span>
</pre>
</div>
</div>

<p>此语句将从 &ldquo;filename&rdquo; 中导入所有的全局符号到当前全局作用域中（不同于 ES6，Solidity 是向后兼容的）。</p>

<div class="highlight-Solidity notranslate">
<div class="highlight">
<pre>
<span class="k">import</span> <span class="o">*</span> <span class="k">as</span> <span class="nx">symbolName</span> <span class="nx">from</span> <span class="s2">&quot;filename&quot;</span><span class="p">;</span>
</pre>
</div>
</div>

<p>...创建一个新的全局符号 <code class="docutils literal notranslate"><span class="pre">symbolName</span></code>，其成员均来自 <code class="docutils literal notranslate"><span class="pre">&quot;filename&quot;</span></code> 中全局符号。</p>

<div class="highlight-Solidity notranslate">
<div class="highlight">
<pre>
<span class="k">import</span> <span class="p">{</span><span class="nx">symbol1</span> <span class="k">as</span> <span class="nx">alias</span><span class="p">,</span> <span class="nx">symbol2</span><span class="p">}</span> <span class="nx">from</span> <span class="s2">&quot;filename&quot;</span><span class="p">;</span>
</pre>
</div>
</div>

<p>...创建新的全局符号 <code class="docutils literal notranslate"><span class="pre">alias</span></code> 和 <code class="docutils literal notranslate"><span class="pre">symbol2</span></code>，分别从 <code class="docutils literal notranslate"><span class="pre">&quot;filename&quot;</span></code> 引用 <code class="docutils literal notranslate"><span class="pre">symbol1</span></code> 和 <code class="docutils literal notranslate"><span class="pre">symbol2</span></code> 。</p>

<p>另一种语法不属于 ES6，但或许更简便：</p>

<div class="highlight-Solidity notranslate">
<div class="highlight">
<pre>
<span class="k">import</span> <span class="s2">&quot;filename&quot;</span> <span class="k">as</span> <span class="nx">symbolName</span><span class="p">;</span>
</pre>
</div>
</div>

<p>这条语句等同于 <code class="docutils literal notranslate"><span class="pre">import</span> <span class="pre">*</span> <span class="pre">as</span> <span class="pre">symbolName</span> <span class="pre">from</span> <span class="pre">&quot;filename&quot;;</span></code>。</p>

<div>
<div class="buttons">参考：https://solidity-by-example.org/</div>
</div>

<p>Hello World</p>

<div>
<p><code>pragma</code> specifies the compiler version of Solidity.</p>
</div>

<pre>
<code class="language-solidity"><span class="hljs-comment"><strong>helloWord</strong>
// SPDX-License-Identifier: MIT</span>
<span class="hljs-comment">// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0</span>
<span class="hljs-meta"><span class="hljs-keyword">pragma</span> <span class="hljs-keyword">solidity</span> ^0.8.13;</span>

<span class="hljs-class"><span class="hljs-keyword">contract</span> <span class="hljs-title">HelloWorld</span> </span>{
    <span class="hljs-keyword">string</span> <span class="hljs-keyword">public</span> greet <span class="hljs-operator">=</span> <span class="hljs-string">&quot;Hello World!&quot;</span>;
}
{% endhighlight %}

<p><code class="language-solidity">进入remix创建文件Test.sol ,把内容粘贴进文件，进行编译，选择合适的版本号，进行deploy，就可以在区块链看到自己的合约完成了</code></p>

<p>https://testnet.snowtrace.io/tx/0xeb4994e8547a825a520b044bb507fd3248aedafe9f99b82b2c9fd5091addd562<img height="629" src="/uploads/ckeditor/pictures/119/image-20220719161846-1.png" width="882" /></p>

<p><img height="543" src="/uploads/ckeditor/pictures/120/image-20220719161900-2.png" width="374" /></p>

