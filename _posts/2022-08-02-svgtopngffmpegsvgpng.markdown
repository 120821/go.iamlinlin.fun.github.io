---
layout: post
title: "SVG to png FFmpeg批量转化SVG 为png"
date: "2022-08-02"
categories: 
---
<p>https://stackoverflow.com/questions/48216871/ffmpeg-support-for-svg-rasterization</p>

<pre class="default s-code-block">
（安装）https://linuxize.com/post/how-to-install-ffmpeg-on-ubuntu-18-04/
</pre>

<pre class="terminal">
<code class="terminal-line" prefix="$">sudo apt update{% endhighlight %}

<pre class="terminal">
<code class="terminal-line" prefix="$">sudo apt install ffmpeg{% endhighlight %}

<pre class="terminal">
<code class="terminal-line" prefix="$">ffmpeg -version{% endhighlight %}

<p>要打印所有可用的 FFmpeg 编码器和解码器，请键入：</p>

<pre class="default s-code-block">
<code class="terminal-line" prefix="$">ffmpeg -encoders</code>
<code class="terminal-line" prefix="$">ffmpeg -decoders</code>
<code class="hljs language-css"><span class="hljs-selector-class">使用：</span>ffmpeg -<span class="hljs-selector-tag">i</span> <span class="hljs-selector-tag">input</span><span class="hljs-selector-class">.svg</span> output<span class="hljs-selector-class">.png</span>{% endhighlight %}

<p>ffmpeg -i 2012.svg 2012.png(保留原来的SVG，生成新的png图片）<br />
批量转化文件夹内的SVG文件为png文件</p>

<p>script/png.rb</p>

<p>Dir.entries(&#39;.&#39;).each do |e|<br />
&nbsp; if e.include? &#39;svg&#39;<br />
&nbsp;&nbsp;&nbsp; command = %Q{ffmpeg -i &quot;#{e}&quot;&nbsp; &quot;#{e.sub(&#39;svg&#39;, &#39;png&#39;)}&quot;}<br />
&nbsp;&nbsp;&nbsp; puts command<br />
&nbsp;&nbsp;&nbsp; `#{command}`<br />
&nbsp; end<br />
end</p>

<p>$bundle exec ruby script/png.rb</p>

<p>生成jpg文件同理</p>

<p>Dir.entries(&#39;.&#39;).each do |e|<br />
&nbsp; if e.include? &#39;svg&#39;<br />
&nbsp;&nbsp;&nbsp; command = %Q{ffmpeg -i &quot;#{e}&quot;&nbsp; &quot;#{e.sub(&#39;svg&#39;, &#39;jpg&#39;)}&quot;}<br />
&nbsp;&nbsp;&nbsp; puts command<br />
&nbsp;&nbsp;&nbsp; `#{command}`<br />
&nbsp; end<br />
end</p>

<p>$bundle exec ruby script/jpg.rb</p>

