---
layout: post
title: "scss--Undefined variable: '$primary'."
date: "2022-08-10"
categories:
---
<p>https://stackoverflow.com/questions/68988793/scss-variable-not-applying-globally<br />
https://stackoverflow.com/questions/17598996/sass-use-variables-across-multiple-files</p>

<pre class="lang-css s-code-block">
<code class="hljs language-css"><span class="hljs-keyword">@use</span> <span class="hljs-string">&#39;variables&#39;</span>;
<span class="hljs-keyword">@use</span> <span class="hljs-string">&#39;gallery&#39;</span>;
{% endhighlight %}

<p>{% highlight %}_variables.scss{% endhighlight %}:</p>

<pre class="lang-css s-code-block">
<code class="hljs language-css">$primary: <span class="hljs-number">#ffffff</span>;
{% endhighlight %}

<p>{% highlight %}_gallery.scss{% endhighlight %}:</p>

<pre class="default s-code-block">
<code class="hljs language-php"><span class="hljs-comment">#gallery {</span>
    background-color: <span class="hljs-variable">$primary</span> <span class="hljs-comment">// &lt;--- Throws error of undefined variable</span>
}
{% endhighlight %}

<p>$primary 是一个颜色，报错的时候，直接替换颜色即可使用，或者先定义一下就可以使用，$primary: blue.这样的</p>

<p><img height="544" src="/uploads/ckeditor/pictures/195/image-20220810223910-1.png" width="674" /></p>

<p>linlin@linlin-i5:/workspace/chatroom-rails$ cat app/assets/stylesheets/rails-chat-tutorial.scss<br />
.avatar {<br />
&nbsp; max-height:30px;<br />
&nbsp; border-radius: 15px;<br />
&nbsp; width:auto;<br />
&nbsp; vertical-align:middle;<br />
}</p>

<p>.room-nav-link {<br />
&nbsp; border: 1px solid lighten(blue, 40%);<br />
&nbsp; background: lighten(blue, 45%);</p>

<p>&nbsp; &amp; + .room-nav-link {<br />
&nbsp;&nbsp;&nbsp; border-top: 0 none;<br />
&nbsp; }<br />
}</p>

<p><img height="319" src="/uploads/ckeditor/pictures/196/image-20220810224055-2.png" width="833" /></p>

