---
layout: post
title: "devise--undefined local variable or method `resource'"
date: "2022-07-13"
categories: 
---
<p>参考：https://stackoverflow.com/questions/4081744/devise-form-within-a-different-controller</p>

<p>增加下面的内容到application helper，因为在除了devise controller中使用，在其他地方使用，需要进行定义。</p>

<p>正如 Andres 所说，表单调用了由 Devise 指定的助手，因此当您从非 Devise 控制器访问 Devise 表单时，这些助手并不存在。 为了解决这个问题，您需要将以下方法添加到您希望在其下显示表单的控制器的帮助器类中。 或者，您可以将它们添加到您的应用程序助手中，以使它们在任何地方都可用。</p>

<p>As Andres says, the form calls helpers which are specified by Devise and so aren&#39;t present when you access a Devise form from a non-Devise controller.</p>

<p>To get around this, you need to add the following methods to the helper class of the controller you wish to display the form under. Alternatively, you can just add them to your application helper to make them available anywhere.</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby"> <span class="hljs-keyword">def</span> <span class="hljs-title function_">resource_name</span>
    <span class="hljs-symbol">:user</span>
  <span class="hljs-keyword">end</span>

  <span class="hljs-keyword">def</span> <span class="hljs-title function_">resource</span>
    <span class="hljs-variable">@resource</span> ||= User.new
  <span class="hljs-keyword">end</span>

  <span class="hljs-keyword">def</span> <span class="hljs-title function_">devise_mapping</span>
    <span class="hljs-variable">@devise_mapping</span> ||= Devise.mappings[<span class="hljs-symbol">:user</span>]
  <span class="hljs-keyword">end</span></code></pre>

