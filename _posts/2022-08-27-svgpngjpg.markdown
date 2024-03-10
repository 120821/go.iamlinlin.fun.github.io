---
layout: post
title: "批量生成SVG图片，转换为png jpg "
date: "2022-08-27"
categories: 
---
<p>1.找到SVG文件的模板进行替换需要修改的内容，替换模板的需要修改的内容为具有特征的内容，</p>
<p>2.找到需要替换的CSV文件，读取内容，进行生成新的文件：</p>
<p>1-2脚本的书写：</p>
<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight html %}require &#39;csv&#39;{% endhighlight %}</div>
{% highlight html %}a = CSV.read(&quot;nan-ao.csv&quot;)
b = File.read(&quot;nan-ao.svg&quot;)
#puts a.inspect
csv_text = File.read(&#39;nan-ao.csv&#39;)
csv = CSV.parse(csv_text, :headers =&gt; true)
csv.each do |row|
&nbsp; #puts row.to_hash
&nbsp; #puts row[&#39;姓名&#39;]
&nbsp; #puts row[&#39;编号&#39;]
&nbsp; c = b.sub(&quot;###NAME###&quot;, row[&#39;姓名&#39;]).sub(&quot;###NUMBER###&quot;, row[&#39;编号&#39;])
&nbsp; #puts c
&nbsp; current_file_name = &quot;image/2021年9月20日南澳失联老人救援#{row[&#39;姓名&#39;]}-#{row[&#39;编号&#39;]}.svg&quot;
&nbsp; puts current_file_name
&nbsp; File.write(current_file_name, c)
end{% endhighlight %}
<p>{% highlight html %}3.生成png jpg文件{% endhighlight %}</p>
<p>{% highlight html %}脚本：{% endhighlight %}ffmpeg SVG&gt;&gt;jpg</p>
{% highlight html %}Dir.entries(&#39;.&#39;).each do |e|
&nbsp; if e.include? &#39;svg&#39;
&nbsp;&nbsp;&nbsp; command = %Q{ffmpeg -i &quot;#{e}&quot;&nbsp; &quot;#{e.sub(&#39;svg&#39;, &#39;jpg&#39;)}&quot;}
&nbsp;&nbsp;&nbsp; puts command
&nbsp;&nbsp;&nbsp; `#{command}`
&nbsp; end
end{% endhighlight %}
<p>ffmpeg png&gt;&gt;jpg</p>
{% highlight html %}Dir.entries(&#39;.&#39;).each do |e|
&nbsp; if e.include? &#39;png&#39;
&nbsp;&nbsp;&nbsp; command = %Q{ffmpeg -i &quot;#{e}&quot;&nbsp; &quot;#{e.sub(&#39;png&#39;, &#39;jpg&#39;)}&quot;}
&nbsp;&nbsp;&nbsp; puts command
&nbsp;&nbsp;&nbsp; `#{command}`
&nbsp; end
end&nbsp;&nbsp;&nbsp;&nbsp;{% endhighlight %}
<p><br />
&gt;p&gt;脚本：Inkscape svg&gt;&gt;png</p>
<p>&nbsp;</p>
{% highlight html %}Dir.glob(&#39;*.svg&#39;).each do |file|
&nbsp; puts &quot;== processing file: #{file}&quot;
&nbsp; inkscape = &#39;/workspace/coding_tools/inkscape&#39;
&nbsp; command = &quot;#{inkscape} -o #{file.sub(&#39;.svg&#39;, &#39;&#39;)}.png -w 1080 #{file}&quot;
&nbsp; `#{command}`
end{% endhighlight %}
<p>Inkscape png&gt;&gt;jpg</p>
<pre class="hljs ruby">
{% highlight html %}<span class="hljs-constant">Dir</span>.glob(<span class="hljs-string">&#39;*.png&#39;</span>).each <span class="hljs-keyword">do</span> |file|
puts <span class="hljs-string">&quot;== processing file: <span class="hljs-subst">#{file}</span>&quot;</span>
command = <span class="hljs-string">&quot;mogrify -format jpg <span class="hljs-subst">#{file}</span>&quot;</span>
<span class="hljs-string">`<span class="hljs-subst">#{command}</span>`</span>
<span class="hljs-keyword">end</span>{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
