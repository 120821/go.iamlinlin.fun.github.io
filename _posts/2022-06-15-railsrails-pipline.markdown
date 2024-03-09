---
layout: post
title: "rails 字体 rails-pipline"
date: "2022-06-15"
categories: 
---
<p>参考：https://guides.rubyonrails.org/v6.1/asset_pipeline.html#coding-links-to-assets</p>

<p>字体下载后，放在目录下/app/assets/fonts</p>

<p>在样式里直接URL的形式进行引用</p>

<pre><code>@font-face {<br />
&nbsp;&nbsp;&nbsp; font-family: &#39;Noto Sans&#39;;<br />
&nbsp;&nbsp;&nbsp; src: url(&#39;noto_sans_medium.ttf&#39;);<br />
}</code></pre>

<pre><code>@font-face {<br />
&nbsp;&nbsp;&nbsp; font-family: &#39;Noto Sans Bold&#39;;<br />
&nbsp;&nbsp;&nbsp; src: url(&#39;noto_sans_bold.ttf&#39;);<br />
}</code></pre>

<p>或者字体在该目录下进行单独的文件夹，放多个字体，app/assets/fonts/line</p>

<p>使用的时候增加文件地址即可</p>

<pre><code>@font-face {<br />
&nbsp; font-family: &#39;unicons-line&#39;;<br />
&nbsp; src: url(&#39;line/unicons-0.eot&#39;);<br />
&nbsp; src: url(&#39;line/unicons-0.eot#iefix&#39;) format(&#39;embedded-opentype&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-0.woff2&#39;) format(&#39;woff2&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-0.woff&#39;) format(&#39;woff&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-0.ttf&#39;) format(&#39;truetype&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-0.svg#unicons&#39;) format(&#39;svg&#39;);<br />
&nbsp; font-weight: normal;<br />
&nbsp; font-style: normal;<br />
&nbsp; unicode-range: U+E800-E83B;<br />
}<br />
@font-face {<br />
&nbsp; font-family: &#39;unicons-line&#39;;<br />
&nbsp; src: url(&#39;line/unicons-1.eot&#39;);<br />
&nbsp; src: url(&#39;line/unicons-1.eot#iefix&#39;) format(&#39;embedded-opentype&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-1.woff2&#39;) format(&#39;woff2&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-1.woff&#39;) format(&#39;woff&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-1.ttf&#39;) format(&#39;truetype&#39;),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url(&#39;line/unicons-1.svg#unicons&#39;) format(&#39;svg&#39;);</code></pre>

<p><img height="234" src="/uploads/ckeditor/pictures/31/image-20220615135629-1.png" width="1103" /></p>

<p><img height="853" src="/uploads/ckeditor/pictures/32/image-20220615135642-2.png" width="1685" /></p>

