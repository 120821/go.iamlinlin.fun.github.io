---
layout: post
title: "React --hello world 安装 创建新项目"
date: "2022-08-18"
categories: 
---
<p>官网：<a href="https://reactjs.org/">https://reactjs.org/</a></p>

<p><a href="https://www.runoob.com/react/react-tutorial.html">https://www.runoob.com/react/react-tutorial.html</a></p>

<p>React 是一个用于构建用户界面的 JAVASCRIPT 库。</p>

<p>React 主要用于构建 UI，很多人认为 React 是 MVC 中的 V（视图）。</p>

<p>React 起源于 Facebook 的内部项目，用来架设 Instagram 的网站，并于 2013 年 5 月开源。</p>

<p>React 拥有较高的性能，代码逻辑非常简单，越来越多的人已开始关注和使用它。</p>

<p>在开始学习 React 之前，您需要具备以下基础知识：</p>

<ul>
	<li><a href="https://www.runoob.com/html/html-tutorial.html" rel="noopener" target="_blank">HTML 教程</a></li>
	<li><a href="https://www.runoob.com/css/css-tutorial.html" rel="noopener" target="_blank">CSS 教程</a></li>
	<li><a href="https://www.runoob.com/js/js-tutorial.html" rel="noopener" target="_blank">JavaScript 教程</a></li>
	<li><a href="https://www.runoob.com/w3cnote/es6-tutorial.html" rel="noopener" target="_blank">ES6 教程</a></li>
</ul>

<p>在线使用：官方提供的 CDN 地址：</p>

<div class="example">
<div class="example_code">
<pre class="hl-main">
<code><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://unpkg.com/react@16/umd/react.development.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://unpkg.com/react-dom@16/umd/react-dom.development.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-comment">&lt;!--</span><span class="hl-comment"> 生产环境中不建议使用 </span><span class="hl-comment">--&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://unpkg.com/babel-standalone@6.15.0/babel.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span>{% endhighlight %}

<div class="hl-main">也可以直接使用 Staticfile CDN 的 React CDN 库，地址如下</div>

<div class="hl-main">
<div class="example">
<div class="example_code">
<pre class="hl-main">
<code><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://cdn.staticfile.org/react/16.4.0/umd/react.development.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://cdn.staticfile.org/react-dom/16.4.0/umd/react-dom.development.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span><span class="hl-code"> </span><span class="hl-comment">&lt;!--</span><span class="hl-comment"> 生产环境中不建议使用 </span><span class="hl-comment">--&gt;</span><span class="hl-code"> </span><span class="hl-brackets">&lt;</span><span class="hl-reserved">script</span><span class="hl-code"> </span><span class="hl-var">src</span><span class="hl-code">=</span><span class="hl-quotes">&quot;</span><span class="hl-string">https://cdn.staticfile.org/babel-standalone/6.26.0/babel.min.js</span><span class="hl-quotes">&quot;</span><span class="hl-brackets">&gt;</span><span class="hl-brackets">&lt;/</span><span class="hl-reserved">script</span><span class="hl-brackets">&gt;</span>{% endhighlight %}
</div>
</div>
</div>
</div>
</div>

<p>vim hello_world.html</p>

<pre>
<code>&lt;title&gt;Hello React!&lt;/title&gt;
&lt;script src=&quot;https://cdn.staticfile.org/react/16.4.0/umd/react.development.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;https://cdn.staticfile.org/react-dom/16.4.0/umd/react-dom.development.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;https://cdn.staticfile.org/babel-standalone/6.26.0/babel.min.js&quot;&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id=&quot;example&quot;&gt;&lt;/div&gt;
&lt;script type=&quot;text/babel&quot;&gt;
ReactDOM.render(
&nbsp;&nbsp; &nbsp;&lt;h1&gt;Hello, world!&lt;/h1&gt;,
&nbsp;&nbsp; &nbsp;document.getElementById(&#39;example&#39;)
);
&lt;/script&gt;{% endhighlight %}

<div class="example">
<div class="example_code">
<div class="hl-main">
<div class="example">
<div class="example_code">
<p>实例中我们引入了三个库： react.development.min.js 、react-dom.development.min.js 和 babel.min.js：</p>

<ul>
	<li><strong>react.min.js</strong> - React 的核心库</li>
	<li><strong>react-dom.min.js</strong> - 提供与 DOM 相关的功能</li>
	<li><strong>babel.min.js</strong> - Babel 可以将 ES6 代码转为 ES5 代码，这样我们就能在目前不支持 ES6 浏览器上执行 React 代码。Babel 内嵌了对 JSX 的支持。通过将 Babel 和 babel-sublime 包（package）一同使用可以让源码的语法渲染上升到一个全新的水平。</li>
</ul>
</div>
</div>
</div>
</div>
</div>

<p>安装：</p>

<pre class="hljs coffeescript">
<span class="hljs-comment"># 安装npm源</span>
<span class="hljs-built_in">npm</span> config set registry <span class="hljs-attribute">https</span>:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org --<span class="hljs-built_in">global</span>
<span class="hljs-built_in">npm</span> config set disturl <span class="hljs-attribute">https</span>:<span class="hljs-regexp">//</span><span class="hljs-built_in">npm</span>.taobao.org/dist --<span class="hljs-built_in">global</span>

<span class="hljs-comment"># 安装 react native 命令行工具</span>
<span class="hljs-built_in">npm</span> install -g yarn react-<span class="hljs-reserved">native</span>-cli

<span class="hljs-comment"># 设置yarn的源</span>
yarn config set registry <span class="hljs-attribute">https</span>:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org --<span class="hljs-built_in">global</span>
yarn config set disturl <span class="hljs-attribute">https</span>:<span class="hljs-regexp">//</span><span class="hljs-built_in">npm</span>.taobao.org/dist --<span class="hljs-built_in">global</span></pre>

<pre class="hljs coffeescript">
创建新项目
react-<span class="hljs-reserved">native</span> init hello
<span class="hljs-comment"># 然后会看到一堆生成项目文件的消息。  很有意思。 </span></pre>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>出现了错误：</code></div>

<pre>
<code>TypeError: cli.init is not a function{% endhighlight %}

<p>解决：<a href="https://stackoverflow.com/questions/72768245/typeerror-cli-init-is-not-a-function-for-react-native">https://stackoverflow.com/questions/72768245/typeerror-cli-init-is-not-a-function-for-react-native</a></p>

<pre>
<code>npx react-native init ProjectName --version 0.68.2{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>可以看到出现了两个项目，一个是有报错的的，一个是第二次生成的，内容不同。</code></div>

<p><img height="220" src="/uploads/ckeditor/pictures/272/image-20220818115802-1.png" width="1836" /></p>

<p>react-native run-android</p>

<p>会出现报错不能使用。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">创建新的APP
create</span><span class="pun">-</span><span class="pln">react</span><span class="pun">-</span><span class="pln">app </span><span class="kwd">my</span><span class="pun">-</span><span class="pln">app</span></pre>

<p><span class="pln">cd my-app</span></p>

<p><span class="pln">npm start </span></p>

<p><span class="pln">直接回车就可以跳转到浏览器看到：</span></p>

<p><img height="826" src="/uploads/ckeditor/pictures/273/image-20220818120404-1.png" width="1408" />项目的目录结构如下</p>

<pre class="prettyprint prettyprinted" style="">
<span class="kwd">my</span><span class="pun">-</span><span class="pln">app</span><span class="pun">/</span><span class="pln">
  README</span><span class="pun">.</span><span class="pln">md
  node_modules</span><span class="pun">/</span><span class="pln">
  </span><span class="kwd">package</span><span class="pun">.</span><span class="pln">json
  </span><span class="pun">.</span><span class="pln">gitignore
  </span><span class="kwd">public</span><span class="pun">/</span><span class="pln">
    favicon</span><span class="pun">.</span><span class="pln">ico
    index</span><span class="pun">.</span><span class="pln">html
    manifest</span><span class="pun">.</span><span class="pln">json
  src</span><span class="pun">/</span><span class="pln">
    </span><span class="typ">App</span><span class="pun">.</span><span class="pln">css
    </span><span class="typ">App</span><span class="pun">.</span><span class="pln">js
    </span><span class="typ">App</span><span class="pun">.</span><span class="pln">test</span><span class="pun">.</span><span class="pln">js
    index</span><span class="pun">.</span><span class="pln">css
    index</span><span class="pun">.</span><span class="pln">js
    logo</span><span class="pun">.</span><span class="pln">svg</span></pre>

<p><img height="430" src="/uploads/ckeditor/pictures/274/image-20220818121019-2.png" width="387" /></p>

<p>manifest.json 指定了开始页面 index.html，一切的开始都从这里开始，所以这个是代码执行的源头。</p>

<pre>
<code>尝试修改 src/App.js 文件代码：
import logo from &#39;./logo.svg&#39;;
import &#39;./App.css&#39;;
function App() {
&nbsp; return (
&nbsp;&nbsp;&nbsp; &lt;div className=&quot;App&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div className=&quot;App-header&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;img src={logo} className=&quot;App-logo&quot; alt=&quot;logo&quot; /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h2&gt;Hello World&lt;/h2&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;p className=&quot;App-intro&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 你可以在 &lt;code&gt;src/App.js&lt;/code&gt; 文件中修改。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/p&gt;
&nbsp;&nbsp;&nbsp; &lt;/div&gt;
&nbsp; ); &nbsp;
}
export default App;{% endhighlight %}

<p><img height="338" src="/uploads/ckeditor/pictures/275/image-20220818122929-1.png" width="964" /></p>

<p>&nbsp;</p>

