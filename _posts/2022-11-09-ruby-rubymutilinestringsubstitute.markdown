---
layout: post
title: "ruby - 删除所有空行，删除所有含有特定符号的行(ruby mutiline string substitute)"
date: "2022-11-09"
categories: 
---
<p><a href="https://www.656463.com/wenda/scszRubyztdzfcdxmx_541">https://www.656463.com/wenda/scszRubyztdzfcdxmx_541</a></p>

<p><a href="https://www.coder.work/article/1076973">https://www.coder.work/article/1076973</a></p>

<p>删除空行：</p>

<pre>
<code>result2 = result.gsub /^$\n/, &#39;&#39;</code></pre>

<p>删除含有特定符号（例如 ；）的行</p>

<pre>
<code>result3 = temp_array.map { |a|

&nbsp; a.split(&quot;\n&quot;).reject { |e|

&nbsp;&nbsp;&nbsp; e =~ %r{;}

&nbsp; }

}</code></pre>

<p><code>注意（正则表达式的写法应该统一）：</code></p>

<pre><code>e =~ %r{;}</code></pre>

<p>等同于：</p>

<pre><code>e =~ /;/</code></pre>

<p>测试脚本：</p>

<pre>
<code>command = &quot;dig baidu.com TXT&quot;

puts command

result = `#{command}`

puts result

puts &quot;== result #{result}&quot;

#删除空白行

result2 = result.gsub /^$\n/, &#39;&#39;

puts &quot;== result2 #{result2}&quot;

temp_array = result2.split(&#39;\n&#39;)

#删除含有特定字符的行

result3 = temp_array.map { |a|

&nbsp; a.split(&quot;\n&quot;).reject { |e|
   #风格应该统一
&nbsp;&nbsp;&nbsp;# e =~ %r{;}
  &nbsp;e =~ /;/ 

&nbsp; }

}

puts &quot;== result3 #{result3}&quot;

puts &quot;== result3.to_s #{result3.to_s}&quot;

domain_ip = result3.to_s.split(&#39;\\t&#39;).last.sub(&#39;&quot;]]&#39;, &#39;&#39;)

puts &quot;===== domain_ip #{domain_ip}&quot;</code></pre>

<p><img height="1018" src="/uploads/ckeditor/pictures/702/image-20221109110917-1.png" width="1920" /></p>

<p>&nbsp;</p>

