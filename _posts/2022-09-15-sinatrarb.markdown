---
layout: post
title: "sinatrarb的使用 创建表单 页面跳转 提交表单 保存数据"
date: "2022-09-15"
categories: 
---
<p><a href="https://guides.railsgirls.com/sinatra-app">https://guides.railsgirls.com/sinatra-app</a></p>

<p>1.安装sinatra， 创建rb文件</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">在新的文件夹：<code class="language-plaintext highlighter-rouge">gem install sinatra{% endhighlight %}</div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="language-plaintext highlighter-rouge">创建一个rb文件：suffragist.rb{% endhighlight %}</div>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="nb">require</span> <span class="s1">&#39;sinatra&#39;</span>{% endhighlight %}</p>

<p><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="s1">&#39;Hello, voter!&#39;</span><br />
<span class="k">end</span></p>
</figure>

<p><code class="language-plaintext highlighter-rouge">运行：ruby suffragist.rb{% endhighlight %}.</p>

<p>打开视图： <a href="localhost:4567" target="_blank">localhost:4567</a>.</p>

<p>2.新建视图页面 内容：<code class="language-plaintext highlighter-rouge">index.erb{% endhighlight %}</p>

<p><code class="language-erb" data-lang="erb"><span class="nt">&lt;html&gt;</span><br />
&nbsp; <span class="nt">&lt;head&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">&#39;UTF-8&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;title&gt;</span>Suffragist<span class="nt">&lt;/title&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;link</span> <span class="na">href=</span><span class="s">&#39;//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css&#39;</span> <span class="na">rel=</span><span class="s">&#39;stylesheet&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp; <span class="nt">&lt;/head&gt;</span><br />
&nbsp; <span class="nt">&lt;body</span> <span class="na">class=</span><span class="s">&#39;container&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;p&gt;</span>What&#39;s for dinner?<span class="nt">&lt;/p&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;form</span> <span class="na">action=</span><span class="s">&#39;cast&#39;</span> <span class="na">method=</span><span class="s">&#39;post&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">&#39;unstyled&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="cp">&lt;%</span> <span class="no">Choices</span><span class="p">.</span><span class="nf">each</span> <span class="k">do</span> <span class="o">|</span><span class="nb">id</span><span class="p">,</span> <span class="n">text</span><span class="o">|</span> <span class="cp">%&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;li&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">&#39;radio&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">&#39;radio&#39;</span> <span class="na">name=</span><span class="s">&#39;vote&#39;</span> <span class="na">value=</span><span class="s">&#39;</span><span class="cp">&lt;%=</span> <span class="nb">id</span> <span class="cp">%&gt;</span><span class="s">&#39;</span> <span class="na">id=</span><span class="s">&#39;vote_</span><span class="cp">&lt;%=</span> <span class="nb">id</span> <span class="cp">%&gt;</span><span class="s">&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="cp">&lt;%=</span> <span class="n">text</span> <span class="cp">%&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;/label&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;/li&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;/ul&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">&#39;submit&#39;</span> <span class="na">class=</span><span class="s">&#39;btn btn-primary&#39;</span><span class="nt">&gt;</span>Cast this vote!<span class="nt">&lt;/button&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;/form&gt;</span><br />
&nbsp; <span class="nt">&lt;/body&gt;</span><br />
<span class="nt">&lt;/html&gt;</span>{% endhighlight %}</p>

<p>在rb文件增加一些可供选择的数据<code class="language-plaintext highlighter-rouge">&nbsp; suffragist.rb{% endhighlight %}:</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="no">Choices</span> <span class="o">=</span> <span class="p">{</span><br />
&nbsp; <span class="s1">&#39;HAM&#39;</span> <span class="o">=&gt;</span> <span class="s1">&#39;Hamburger&#39;</span><span class="p">,</span><br />
&nbsp; <span class="s1">&#39;PIZ&#39;</span> <span class="o">=&gt;</span> <span class="s1">&#39;Pizza&#39;</span><span class="p">,</span><br />
&nbsp; <span class="s1">&#39;CUR&#39;</span> <span class="o">=&gt;</span> <span class="s1">&#39;Curry&#39;</span><span class="p">,</span><br />
&nbsp; <span class="s1">&#39;NOO&#39;</span> <span class="o">=&gt;</span> <span class="s1">&#39;Noodles&#39;</span><span class="p">,</span><br />
<span class="p">}</span>{% endhighlight %}</p>
</figure>

<p>使用get请求</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:index</span><br />
<span class="k">end</span>{% endhighlight %}</p>
</figure>

<p>重启ruby：<code class="language-plaintext highlighter-rouge">ruby suffragist.rb{% endhighlight %}</p>

<p>3.在视图页面增加title，在后台增加变量</p>

<p><code class="language-erb" data-lang="erb">&nbsp; <span class="nt">&lt;body</span> <span class="na">class=</span><span class="s">&#39;container&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;h1&gt;</span><span class="cp">&lt;%=</span> <span class="vi">@title</span> <span class="cp">%&gt;</span><span class="nt">&lt;/h1&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;p&gt;</span>What&#39;s for dinner?<span class="nt">&lt;/p&gt;</span>{% endhighlight %}</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="vi">@title</span> <span class="o">=</span> <span class="s1">&#39;Welcome to the Suffragist!&#39;</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:index</span><br />
<span class="k">end</span>{% endhighlight %}</p>
</figure>

<p>4.增加post请求：</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="n">post</span> <span class="s1">&#39;/cast&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="vi">@title</span> <span class="o">=</span> <span class="s1">&#39;Thanks for casting your vote!&#39;</span><br />
&nbsp; <span class="vi">@vote</span>&nbsp; <span class="o">=</span> <span class="n">params</span><span class="p">[</span><span class="s1">&#39;vote&#39;</span><span class="p">]</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:cast</span><br />
<span class="k">end</span>{% endhighlight %}</p>
</figure>

<p>4.2增加cast.erb</p>

<p><code class="language-erb" data-lang="erb"><span class="nt">&lt;html&gt;</span><br />
&nbsp; <span class="nt">&lt;head&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">&#39;UTF-8&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;title&gt;</span>Suffragist<span class="nt">&lt;/title&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;link</span> <span class="na">href=</span><span class="s">&#39;//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css&#39;</span> <span class="na">rel=</span><span class="s">&#39;stylesheet&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp; <span class="nt">&lt;/head&gt;</span><br />
&nbsp; <span class="nt">&lt;body</span> <span class="na">class=</span><span class="s">&#39;container&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;h1&gt;</span><span class="cp">&lt;%=</span> <span class="vi">@title</span> <span class="cp">%&gt;</span><span class="nt">&lt;/h1&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;p&gt;</span>You cast: <span class="cp">&lt;%=</span> <span class="no">Choices</span><span class="p">[</span><span class="vi">@vote</span><span class="p">]</span> <span class="cp">%&gt;</span><span class="nt">&lt;/p&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;p&gt;&lt;a</span> <span class="na">href=</span><span class="s">&#39;/results&#39;</span><span class="nt">&gt;</span>See the results!<span class="nt">&lt;/a&gt;&lt;/p&gt;</span><br />
&nbsp; <span class="nt">&lt;/body&gt;</span><br />
<span class="nt">&lt;/html&gt;</span>{% endhighlight %}</p>

<p>4.3增加layout页面<code class="language-plaintext highlighter-rouge"> layout.erb{% endhighlight %}</p>

<p><code class="language-erb" data-lang="erb"><span class="nt">&lt;html&gt;</span><br />
&nbsp; <span class="nt">&lt;head&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">&#39;UTF-8&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;title&gt;</span>Suffragist<span class="nt">&lt;/title&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;link</span> <span class="na">href=</span><span class="s">&#39;//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css&#39;</span> <span class="na">rel=</span><span class="s">&#39;stylesheet&#39;</span> <span class="nt">/&gt;</span><br />
&nbsp; <span class="nt">&lt;/head&gt;</span><br />
&nbsp; <span class="nt">&lt;body</span> <span class="na">class=</span><span class="s">&#39;container&#39;</span><span class="nt">&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;h1&gt;</span><span class="cp">&lt;%=</span> <span class="vi">@title</span> <span class="cp">%&gt;</span><span class="nt">&lt;/h1&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="cp">&lt;%=</span> <span class="k">yield</span> <span class="cp">%&gt;</span><br />
&nbsp; <span class="nt">&lt;/body&gt;</span><br />
<span class="nt">&lt;/html&gt;</span>{% endhighlight %}</p>

<p>4.4增加结果页面，并新增一些假数据</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="n">get</span> <span class="s1">&#39;/results&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="vi">@votes</span> <span class="o">=</span> <span class="p">{</span> <span class="s1">&#39;HAM&#39;</span> <span class="o">=&gt;</span> <span class="mi">7</span><span class="p">,</span> <span class="s1">&#39;PIZ&#39;</span> <span class="o">=&gt;</span> <span class="mi">5</span><span class="p">,</span> <span class="s1">&#39;CUR&#39;</span> <span class="o">=&gt;</span> <span class="mi">3</span> <span class="p">}</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:results</span><br />
<span class="k">end</span>{% endhighlight %}</p>
</figure>

<figure class="highlight">
<p><code class="language-erb" data-lang="erb"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">&#39;table table-hover table-striped&#39;</span><span class="nt">&gt;</span><br />
&nbsp; <span class="cp">&lt;%</span> <span class="no">Choices</span><span class="p">.</span><span class="nf">each</span> <span class="k">do</span> <span class="o">|</span><span class="nb">id</span><span class="p">,</span> <span class="n">text</span><span class="o">|</span> <span class="cp">%&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;tr&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;th&gt;</span><span class="cp">&lt;%=</span> <span class="n">text</span> <span class="cp">%&gt;</span><span class="nt">&lt;/th&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;td&gt;</span><span class="cp">&lt;%=</span> <span class="vi">@votes</span><span class="p">[</span><span class="nb">id</span><span class="p">]</span> <span class="o">||</span> <span class="mi">0</span> <span class="cp">%&gt;</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="nt">&lt;td&gt;</span><span class="cp">&lt;%=</span> <span class="s1">&#39;#&#39;</span> <span class="o">*</span> <span class="p">(</span><span class="vi">@votes</span><span class="p">[</span><span class="nb">id</span><span class="p">]</span> <span class="o">||</span> <span class="mi">0</span><span class="p">)</span> <span class="cp">%&gt;</span><span class="nt">&lt;/td&gt;</span><br />
&nbsp;&nbsp;&nbsp; <span class="nt">&lt;/tr&gt;</span><br />
&nbsp; <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span><br />
<span class="nt">&lt;/table&gt;</span><br />
<span class="nt">&lt;p&gt;&lt;a</span> <span class="na">href=</span><span class="s">&#39;/&#39;</span><span class="nt">&gt;</span>Cast more votes!<span class="nt">&lt;/a&gt;&lt;/p&gt;</span>{% endhighlight %}</p>
</figure>

<p>5.替换假数据，进行数据保存</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="nb">require</span> <span class="s1">&#39;yaml/store&#39;</span>{% endhighlight %}</p>
</figure>

<p>修改action</p>

<figure class="highlight">
<p><code class="language-ruby" data-lang="ruby"><span class="n">post</span> <span class="s1">&#39;/cast&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="vi">@title</span> <span class="o">=</span> <span class="s1">&#39;Thanks for casting your vote!&#39;</span><br />
&nbsp; <span class="vi">@vote</span>&nbsp; <span class="o">=</span> <span class="n">params</span><span class="p">[</span><span class="s1">&#39;vote&#39;</span><span class="p">]</span><br />
&nbsp; <span class="vi">@store</span> <span class="o">=</span> <span class="no">YAML</span><span class="o">::</span><span class="no">Store</span><span class="p">.</span><span class="nf">new</span> <span class="s1">&#39;votes.yml&#39;</span><br />
&nbsp; <span class="vi">@store</span><span class="p">.</span><span class="nf">transaction</span> <span class="k">do</span><br />
&nbsp;&nbsp;&nbsp; <span class="vi">@store</span><span class="p">[</span><span class="s1">&#39;votes&#39;</span><span class="p">]</span> <span class="o">||=</span> <span class="p">{}</span><br />
&nbsp;&nbsp;&nbsp; <span class="vi">@store</span><span class="p">[</span><span class="s1">&#39;votes&#39;</span><span class="p">][</span><span class="vi">@vote</span><span class="p">]</span> <span class="o">||=</span> <span class="mi">0</span><br />
&nbsp;&nbsp;&nbsp; <span class="vi">@store</span><span class="p">[</span><span class="s1">&#39;votes&#39;</span><span class="p">][</span><span class="vi">@vote</span><span class="p">]</span> <span class="o">+=</span> <span class="mi">1</span><br />
&nbsp; <span class="k">end</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:cast</span><br />
<span class="k">end</span>{% endhighlight %}</p>

<p><span class="n">get</span> <span class="s1">&#39;/results&#39;</span> <span class="k">do</span><br />
&nbsp; <span class="vi">@title</span> <span class="o">=</span> <span class="s1">&#39;Results so far:&#39;</span><br />
&nbsp; <span class="vi">@store</span> <span class="o">=</span> <span class="no">YAML</span><span class="o">::</span><span class="no">Store</span><span class="p">.</span><span class="nf">new</span> <span class="s1">&#39;votes.yml&#39;</span><br />
&nbsp; <span class="vi">@votes</span> <span class="o">=</span> <span class="vi">@store</span><span class="p">.</span><span class="nf">transaction</span> <span class="p">{</span> <span class="vi">@store</span><span class="p">[</span><span class="s1">&#39;votes&#39;</span><span class="p">]</span> <span class="p">}</span><br />
&nbsp; <span class="n">erb</span> <span class="ss">:results</span><br />
<span class="k">end</span></p>
</figure>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

