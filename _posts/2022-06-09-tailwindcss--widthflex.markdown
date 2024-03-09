---
layout: post
title: "tailwind css--width，flex"
date: "2022-06-09"
categories: 
---

                    <p>flex是比较难理解的，宽高是用着比较方便的，</p> 
<p>宽度 w-0 w-px w-0.5</p> 
<p>w-screen w-auto</p> 
<p>高度同理，h-0等</p> 
<p>文本位置也是比较方便的  text-center  text-left  text-right text-justify</p> 
{% highlight %}&lt;div class="w-24 md:w-auto"&gt; &lt;/div&gt;自定义宽度
&lt;div class="h-12 w-screen" &gt;&lt;/div&gt;整个页面{% endhighlight %} 
<p>宽度其他会用的样式</p> 
<blockquote> 
 <p>min-w-0    min-width: 0px;<br> min-w-full    min-width: 100%;<br> min-w-min    min-width: min-content;<br> min-w-max    min-width: max-content;</p> 
</blockquote> 
<p>flex 首先要对概念有个认识，方便理解记忆。</p> 
<p>容器默认存在两根轴：水平的主轴（main axis）和垂直的交叉轴（cross axis）。主轴的开始位置（与边框的交叉点）叫做{% highlight %}main start{% endhighlight %}，结束位置叫做{% highlight %}main end{% endhighlight %}；交叉轴的开始位置叫做{% highlight %}cross start{% endhighlight %}，结束位置叫做{% highlight %}cross end{% endhighlight %}</p> 
<p>项目默认沿主轴排列。单个项目占据的主轴空间叫做{% highlight %}main size{% endhighlight %}，占据的交叉轴空间叫做{% highlight %}cross size{% endhighlight %}。</p> 
<p>容器有6个属性：</p> 
<blockquote> 
 <ul>
<li>    flex-direction</li>
<li>    flex-wrap</li>
<li>    flex-flow</li>
<li>    justify-content</li>
<li>    align-items</li>
<li>    align-content</li>
</ul>
</blockquote> 
<p>{% highlight %}flex-direction{% endhighlight %}属性决定主轴的方向（即项目的排列方向）。</p> 
<blockquote> 
 <ul>
<li>
{% highlight %}row{% endhighlight %}（默认值）：主轴为水平方向，起点在左端。</li>
<li>
{% highlight %}row-reverse{% endhighlight %}：主轴为水平方向，起点在右端。</li>
<li>
{% highlight %}column{% endhighlight %}：主轴为垂直方向，起点在上沿。</li>
<li>
{% highlight %}column-reverse{% endhighlight %}：主轴为垂直方向，起点在下沿。</li>
</ul>
</blockquote> 
<p>flex-wrap属性，默认情况下，项目都排在一条线（又称"轴线"）上。{% highlight %}flex-wrap{% endhighlight %}属性定义，如果一条轴线排不下，如何换行。</p> 
<blockquote> 
 <ul>
<li>
{% highlight %}nowrap{% endhighlight %}（默认）：不换行。</li>
<li>
{% highlight %}wrap{% endhighlight %}：换行，第一行在上方。</li>
<li>
{% highlight %}wrap-reverse{% endhighlight %}：换行，第一行在下方。</li>
</ul>
</blockquote> 
<h3>
{% highlight %}flex-flow{% endhighlight %}属性是{% highlight %}flex-direction{% endhighlight %}属性和{% highlight %}flex-wrap{% endhighlight %}属性的简写形式，默认值为{% highlight %}row nowrap{% endhighlight %}。</h3> 
<p>{% highlight %}justify-content{% endhighlight %}属性定义了项目在主轴上的对齐方式。</p> 
<blockquote> 
 <ul>
<li>
{% highlight %}flex-start{% endhighlight %}（默认值）：左对齐</li>
<li>
{% highlight %}flex-end{% endhighlight %}：右对齐</li>
<li>
{% highlight %}center{% endhighlight %}： 居中</li>
<li>
{% highlight %}space-between{% endhighlight %}：两端对齐，项目之间的间隔都相等。</li>
<li>
{% highlight %}space-around{% endhighlight %}：每个项目两侧的间隔相等。所以，项目之间的间隔比项目与边框的间隔大一倍。</li>
</ul>
</blockquote> 
<p>{% highlight %}align-items{% endhighlight %}属性定义项目在交叉轴上如何对齐。</p> 
<blockquote> 
 <ul>
<li>
{% highlight %}flex-start{% endhighlight %}：交叉轴的起点对齐。</li>
<li>
{% highlight %}flex-end{% endhighlight %}：交叉轴的终点对齐。</li>
<li>
{% highlight %}center{% endhighlight %}：交叉轴的中点对齐。</li>
<li>
{% highlight %}baseline{% endhighlight %}: 项目的第一行文字的基线对齐。</li>
<li>
{% highlight %}stretch{% endhighlight %}（默认值）：如果项目未设置高度或设为auto，将占满整个容器的高度。</li>
</ul>
</blockquote> 
<p>{% highlight %}align-content{% endhighlight %}属性定义了多根轴线的对齐方式。如果项目只有一根轴线，该属性不起作用。</p> 
<blockquote> 
 <ul>
<li>
{% highlight %}flex-start{% endhighlight %}：与交叉轴的起点对齐。</li>
<li>
{% highlight %}flex-end{% endhighlight %}：与交叉轴的终点对齐。</li>
<li>
{% highlight %}center{% endhighlight %}：与交叉轴的中点对齐。</li>
<li>
{% highlight %}space-between{% endhighlight %}：与交叉轴两端对齐，轴线之间的间隔平均分布。</li>
<li>
{% highlight %}space-around{% endhighlight %}：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍。</li>
<li>
{% highlight %}stretch{% endhighlight %}（默认值）：轴线占满整个交叉轴。</li>
</ul>
</blockquote>
                
