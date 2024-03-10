---
layout: post
title: "vue3 Carousel轮播图的使用，控制每页显示图片的数量"
date: "2023-11-15"
categories: 
---
<p>refer:&nbsp; <a href="https://ismail9k.github.io/vue3-carousel/getting-started.html">https://ismail9k.github.io/vue3-carousel/getting-started.html</a></p>
<p>使用轮播图：</p>
{% highlight html %}<span style="color:#ffcb6b">npm</span><span style="color:#a6accd"> </span><span style="color:#c3e88d">install</span><span style="color:#a6accd"> </span><span style="color:#c3e88d">vue3-carousel</span>
<em># or use yarn</em>
<span style="color:#ffcb6b">yarn</span><span style="color:#a6accd"> </span><span style="color:#c3e88d">add</span><span style="color:#a6accd"> </span><span style="color:#c3e88d">vue3-carousel</span>{% endhighlight %}
<p>选择每页显示3个图：（把第二行的2.5修改为3即可，这里控制的是每页显示数据的多少）</p>
{% highlight html %}<span style="color:#89ddff">&lt;</span><span style="color:#f07178">template</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">  </span><span style="color:#89ddff">&lt;</span><span style="color:#f07178">Carousel</span><span style="color:#89ddff"> </span><span style="color:#c792ea">:items-to-show</span><span style="color:#89ddff">=</span><span style="color:#89ddff">&quot;</span><span style="color:#c3e88d">2.5</span><span style="color:#89ddff">&quot;</span><span style="color:#89ddff"> </span><span style="color:#c792ea">:wrap-around</span><span style="color:#89ddff">=</span><span style="color:#89ddff">&quot;</span><span style="color:#c3e88d">true</span><span style="color:#89ddff">&quot;</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">    </span><span style="color:#89ddff">&lt;</span><span style="color:#f07178">Slide</span><span style="color:#89ddff"> </span><span style="color:#c792ea">v-for</span><span style="color:#89ddff">=</span><span style="color:#89ddff">&quot;</span><span style="color:#c3e88d">slide in 10</span><span style="color:#89ddff">&quot;</span><span style="color:#89ddff"> </span><span style="color:#c792ea">:key</span><span style="color:#89ddff">=</span><span style="color:#89ddff">&quot;</span><span style="color:#c3e88d">slide</span><span style="color:#89ddff">&quot;</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">      </span><span style="color:#89ddff">&lt;</span><span style="color:#f07178">div</span><span style="color:#89ddff"> </span><span style="color:#c792ea">class</span><span style="color:#89ddff">=</span><span style="color:#89ddff">&quot;</span><span style="color:#c3e88d">carousel__item</span><span style="color:#89ddff">&quot;</span><span style="color:#89ddff">&gt;</span><span style="color:#a6accd">{{ slide }}</span><span style="color:#89ddff">&lt;/</span><span style="color:#f07178">div</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">    </span><span style="color:#89ddff">&lt;/</span><span style="color:#f07178">Slide</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">    </span><span style="color:#89ddff">&lt;</span><span style="color:#f07178">template</span><span style="color:#a6accd"> </span><span style="color:#89ddff">#</span><span style="color:#c792ea">addons</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">      </span><span style="color:#89ddff">&lt;</span><span style="color:#f07178">Navigation</span><span style="color:#89ddff"> /&gt;</span>
<span style="color:#a6accd">    </span><span style="color:#89ddff">&lt;/</span><span style="color:#f07178">template</span><span style="color:#89ddff">&gt;</span>
<span style="color:#a6accd">  </span><span style="color:#89ddff">&lt;/</span><span style="color:#f07178">Carousel</span><span style="color:#89ddff">&gt;</span>
<span style="color:#89ddff">&lt;/</span><span style="color:#f07178">template</span><span style="color:#89ddff">&gt;</span>
<span style="color:#89ddff">&lt;</span><span style="color:#f07178">script</span><span style="color:#89ddff">&gt;</span>
<em>import</em><span style="color:#a6accd"> </span><span style="color:#89ddff">{</span><span style="color:#f07178"> </span><span style="color:#a6accd">defineComponent</span><span style="color:#f07178"> </span><span style="color:#89ddff">}</span><span style="color:#a6accd"> </span><em>from</em><span style="color:#a6accd"> </span><span style="color:#89ddff">&#39;</span><span style="color:#c3e88d">vue</span><span style="color:#89ddff">&#39;</span>
<em>import</em><span style="color:#a6accd"> </span><span style="color:#89ddff">{</span><span style="color:#f07178"> </span><span style="color:#a6accd">Carousel</span><span style="color:#89ddff">,</span><span style="color:#f07178"> </span><span style="color:#a6accd">Navigation</span><span style="color:#89ddff">,</span><span style="color:#f07178"> </span><span style="color:#a6accd">Slide</span><span style="color:#f07178"> </span><span style="color:#89ddff">}</span><span style="color:#a6accd"> </span><em>from</em><span style="color:#a6accd"> </span><span style="color:#89ddff">&#39;</span><span style="color:#c3e88d">vue3-carousel</span><span style="color:#89ddff">&#39;</span>
<em>import</em><span style="color:#a6accd"> </span><span style="color:#89ddff">&#39;</span><span style="color:#c3e88d">vue3-carousel/dist/carousel.css</span><span style="color:#89ddff">&#39;</span>
<em>export</em><span style="color:#a6accd"> </span><em>default</em><span style="color:#a6accd"> </span><span style="color:#82aaff">defineComponent</span><span style="color:#a6accd">(</span><span style="color:#89ddff">{</span>
<span style="color:#a6accd">  </span><span style="color:#f07178">name</span><span style="color:#89ddff">:</span><span style="color:#a6accd"> </span><span style="color:#89ddff">&#39;</span><span style="color:#c3e88d">WrapAround</span><span style="color:#89ddff">&#39;</span><span style="color:#89ddff">,</span>
<span style="color:#a6accd">  </span><span style="color:#f07178">components</span><span style="color:#89ddff">:</span><span style="color:#a6accd"> </span><span style="color:#89ddff">{</span>
<span style="color:#a6accd">    Carousel</span><span style="color:#89ddff">,</span>
<span style="color:#a6accd">    Slide</span><span style="color:#89ddff">,</span>
<span style="color:#a6accd">    Navigation</span><span style="color:#89ddff">,</span>
<span style="color:#a6accd">  </span><span style="color:#89ddff">},</span>
<span style="color:#89ddff">}</span><span style="color:#a6accd">)</span>
<span style="color:#89ddff">&lt;/</span><span style="color:#f07178">script</span><span style="color:#89ddff">&gt;</span>{% endhighlight %}
