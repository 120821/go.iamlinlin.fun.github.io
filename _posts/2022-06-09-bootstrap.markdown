---
layout: post
title: "bootstrap表格的认识"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>不安装bootstrap的话，可以用链接，效果是一样的，使用的时候记住标签即可，记不住可以多熟悉一下，链接放在head即可</p> 
 <pre><code class="language-html">&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>基本表格：</strong></p> 
 <pre><code class="language-html">&lt;table class="table"&gt;
  ...
&lt;/table&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>条纹表格：</strong></p> 
 <pre><code class="language-html">&lt;table class="table table-striped"&gt;
  ...
&lt;/table&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>边框表格</strong></p> 
 <pre><code class="language-html">&lt;table class="table table-bordered"&gt;
  ...
&lt;/table&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>鼠标悬停</strong></p> 
 <pre><code class="language-html">&lt;table class="table table-hover"&gt;
  ...
&lt;/table&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>颜色表格或者状态表格</strong></p> 
 <p>不同的版本可能颜色不同，或者不显示颜色，影响不大，自己调试</p> 
 <pre><code class="language-html">&lt;!-- On rows --&gt;
&lt;tr class="active"&gt;...&lt;/tr&gt;
&lt;tr class="success"&gt;...&lt;/tr&gt;
&lt;tr class="warning"&gt;...&lt;/tr&gt;
&lt;tr class="danger"&gt;...&lt;/tr&gt;
&lt;tr class="info"&gt;...&lt;/tr&gt;

&lt;!-- On cells (`td` or `th`) --&gt;
&lt;tr&gt;
  &lt;td class="active"&gt;...&lt;/td&gt;
  &lt;td class="success"&gt;...&lt;/td&gt;
  &lt;td class="warning"&gt;...&lt;/td&gt;
  &lt;td class="danger"&gt;...&lt;/td&gt;
  &lt;td class="info"&gt;...&lt;/td&gt;
&lt;/tr&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>紧缩表格</strong></p> 
 <p>其实也不算缩进太多，还是非常美观的</p> 
 <pre><code class="language-html">&lt;table class="table table-condensed"&gt;
  ...
&lt;/table&gt;</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>表单</strong></p> 
 <p>同样记住标签即可，不要将表单组直接和<a href="https://v3.bootcss.com/components/#input-groups" title="输入框组">输入框组</a>混合使用，可以嵌套</p> 
 <pre><code class="language-html">&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputEmail1"&gt;Email address&lt;/label&gt;
    &lt;input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputPassword1"&gt;Password&lt;/label&gt;
    &lt;input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputFile"&gt;File input&lt;/label&gt;
    &lt;input type="file" id="exampleInputFile"&gt;
    &lt;p class="help-block"&gt;Example block-level help text here.&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class="checkbox"&gt;
    &lt;label&gt;
      &lt;input type="checkbox"&gt; Check me out
    &lt;/label&gt;
  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-default"&gt;Submit&lt;/button&gt;
&lt;/form&gt;</code></pre> 
</blockquote> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<blockquote></blockquote>
                
