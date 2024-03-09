---
layout: post
title: "bootstrap--表单的认识--输入框下拉框等"
date: "2022-06-09"
categories: 
---

                    <blockquote>
 表格和表单是不同的，表单就是
</blockquote> 
<blockquote>
 首先，粘贴链接 
 <pre><code class="language-html">&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;{% endhighlight %} 
</blockquote> 
<blockquote>
 下拉表单 
 <pre><code class="language-html">&lt;select class="form-control"&gt;
  &lt;option&gt;1&lt;/option&gt;
  &lt;option&gt;2&lt;/option&gt;
  &lt;option&gt;3&lt;/option&gt;
  &lt;option&gt;4&lt;/option&gt;
  &lt;option&gt;5&lt;/option&gt;
&lt;/select&gt;{% endhighlight %} 
 <pre><code class="language-html">&lt;select multiple class="form-control"&gt;
  &lt;option&gt;1&lt;/option&gt;
  &lt;option&gt;2&lt;/option&gt;
  &lt;option&gt;3&lt;/option&gt;
  &lt;option&gt;4&lt;/option&gt;
  &lt;option&gt;5&lt;/option&gt;
&lt;/select&gt;{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>按钮</p> 
 <pre><code class="language-html">&lt;a class="btn btn-default" href="#" role="button"&gt;Link&lt;/a&gt;
&lt;button class="btn btn-default" type="submit"&gt;Button&lt;/button&gt;
&lt;input class="btn btn-default" type="button" value="Input"&gt;
&lt;input class="btn btn-default" type="submit" value="Submit"&gt;+{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>文本颜色：</p> 
 <pre><code class="language-html">&lt;p class="text-muted"&gt;...&lt;/p&gt;
&lt;p class="text-primary"&gt;...&lt;/p&gt;
&lt;p class="text-success"&gt;...&lt;/p&gt;
&lt;p class="text-info"&gt;...&lt;/p&gt;
&lt;p class="text-warning"&gt;...&lt;/p&gt;
&lt;p class="text-danger"&gt;...&lt;/p&gt;{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>背景颜色：</p> 
 <pre><code class="language-html">&lt;p class="bg-primary"&gt;...&lt;/p&gt;
&lt;p class="bg-success"&gt;...&lt;/p&gt;
&lt;p class="bg-info"&gt;...&lt;/p&gt;
&lt;p class="bg-warning"&gt;...&lt;/p&gt;
&lt;p class="bg-danger"&gt;...&lt;/p&gt;{% endhighlight %} 
</blockquote> 
<blockquote>
 基本表单： 
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
&lt;/form&gt;{% endhighlight %} 
</blockquote> 
<blockquote>
 内联表单 
 <pre><code class="language-html">&lt;form class="form-inline"&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputName2"&gt;Name&lt;/label&gt;
    &lt;input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputEmail2"&gt;Email&lt;/label&gt;
    &lt;input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com"&gt;
  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-default"&gt;Send invitation&lt;/button&gt;{% endhighlight %} 
 <pre><code class="language-html">&lt;form class="form-inline"&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputName2"&gt;Name&lt;/label&gt;
    &lt;input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleInputEmail2"&gt;Email&lt;/label&gt;
    &lt;input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com"&gt;
  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-default"&gt;Send invitation&lt;/button&gt;
&lt;/form&gt;{% endhighlight %} 
 <pre><code class="language-html">&lt;form class="form-inline"&gt;
  &lt;div class="form-group"&gt;
    &lt;label class="sr-only" for="exampleInputAmount"&gt;Amount (in dollars)&lt;/label&gt;
    &lt;div class="input-group"&gt;
      &lt;div class="input-group-addon"&gt;$&lt;/div&gt;
      &lt;input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount"&gt;
      &lt;div class="input-group-addon"&gt;.00&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-primary"&gt;Transfer cash&lt;/button&gt;
&lt;/form&gt;{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p><strong>调整宽高：</strong> 通过 <code>.input-lg</code> 类似的类可以为控件设置高度，通过 <code>.col-lg-*</code> 类似的类可以为控件设置宽度。</p> 
 <pre><code class="language-html">&lt;input class="form-control input-lg" type="text" placeholder=".input-lg"&gt;
&lt;input class="form-control" type="text" placeholder="Default input"&gt;
&lt;input class="form-control input-sm" type="text" placeholder=".input-sm"&gt;

&lt;select class="form-control input-lg"&gt;...&lt;/select&gt;
&lt;select class="form-control"&gt;...&lt;/select&gt;
&lt;select class="form-control input-sm"&gt;...&lt;/select&gt;{% endhighlight %} 
</blockquote> 
<blockquote>
 水平表单 
 <pre><code class="language-html">&lt;form class="form-horizontal"&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="inputEmail3" class="col-sm-2 control-label"&gt;Email&lt;/label&gt;
    &lt;div class="col-sm-10"&gt;
      &lt;input type="email" class="form-control" id="inputEmail3" placeholder="Email"&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="inputPassword3" class="col-sm-2 control-label"&gt;Password&lt;/label&gt;
    &lt;div class="col-sm-10"&gt;
      &lt;input type="password" class="form-control" id="inputPassword3" placeholder="Password"&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;div class="col-sm-offset-2 col-sm-10"&gt;
      &lt;div class="checkbox"&gt;
        &lt;label&gt;
          &lt;input type="checkbox"&gt; Remember me
        &lt;/label&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;div class="col-sm-offset-2 col-sm-10"&gt;
      &lt;button type="submit" class="btn btn-default"&gt;Sign in&lt;/button&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/form&gt;{% endhighlight %} 
 <p></p> 
</blockquote> 
<blockquote>
 输入框 
 <pre><code class="language-html">&lt;input type="text" class="form-control" placeholder="Text input"&gt;{% endhighlight %} 
 <p>文本框</p> 
 <pre><code class="language-html">&lt;textarea class="form-control" rows="3"&gt;&lt;/textarea&gt;{% endhighlight %} 
</blockquote> 
<blockquote> 
 <p>单选多选</p> 
 <pre><code class="language-html">&lt;div class="checkbox"&gt;
  &lt;label&gt;
    &lt;input type="checkbox" value=""&gt;
    Option one is this and that&amp;mdash;be sure to include why it's great
  &lt;/label&gt;
&lt;/div&gt;
&lt;div class="checkbox disabled"&gt;
  &lt;label&gt;
    &lt;input type="checkbox" value="" disabled&gt;
    Option two is disabled
  &lt;/label&gt;
&lt;/div&gt;

&lt;div class="radio"&gt;
  &lt;label&gt;
    &lt;input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked&gt;
    Option one is this and that&amp;mdash;be sure to include why it's great
  &lt;/label&gt;
&lt;/div&gt;
&lt;div class="radio"&gt;
  &lt;label&gt;
    &lt;input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"&gt;
    Option two can be something else and selecting it will deselect option one
  &lt;/label&gt;
&lt;/div&gt;
&lt;div class="radio disabled"&gt;
  &lt;label&gt;
    &lt;input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled&gt;
    Option three is disabled
  &lt;/label&gt;
&lt;/div&gt;{% endhighlight %} 
 <p></p> 
</blockquote>
                
