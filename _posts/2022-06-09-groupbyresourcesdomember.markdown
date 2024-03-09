---
layout: post
title: "group by 语句的使用 resources do member的使用"
date: "2022-06-09"
categories: 
---
<p style="margin-left:.0001pt">group by 语句</p>

<p style="margin-left:.0001pt; text-align:left"><span style="background-color:#c0c0c0">select city ,count(*) as num from staff group by city;</span></p>

<p style="margin-left:.0001pt"><img alt="" src="https://img-blog.csdnimg.cn/f20871d01db245ca986f849eeac324a4.png" style="height:392px; width:554px" /></p>

<p style="margin-left:.0001pt">&nbsp;</p>

<blockquote>
<p style="margin-left:.0001pt">resources :photos do</p>

<p style="margin-left:.0001pt">&nbsp;&nbsp;member do</p>

<p style="margin-left:.0001pt">&nbsp;&nbsp;&nbsp;&nbsp;get &#39;preview&#39;</p>

<p style="margin-left:.0001pt">&nbsp;&nbsp;end</p>

<p style="margin-left:.0001pt">end</p>

<p style="margin-left:.0001pt">定义preview</p>

<p style="margin-left:.0001pt">def preview</p>

<p style="margin-left:.0001pt">end</p>

<p style="margin-left:.0001pt">但是不能根据id查看,所以直接使用show即可</p>
</blockquote>

<p style="margin-left:.0001pt">用于查找id</p>

<p style="margin-left:.0001pt">在controller文件可以增加</p>

<p style="margin-left:.0001pt">def show</p>

<p style="margin-left:.0001pt">end</p>

<p style="margin-left:.0001pt">这样也是可以的。那么上边的内容就可以直接换掉</p>

<pre>
<code>def show
 16       render json: {
 17         image: &quot;ipfs://QmQMJX4azuY2yREjprkwEUvX9caSAbPHE8MnwzpzLJungk&quot;,
 18         external_url: &quot;https://www.lueluelue.link/&quot;,
 19         desscription: &quot;Congratulations on being the first users of LUELUELUE. you are a true Web3 supporter and builder with unwavering pioneering spirit and extraordina
 20         animation_url: &quot;ipfs://QmRuTwaZdZ65aEAz5NPwz8N6QskQsTQwkX4X98ior9GaNN&quot;,
 21         name: &quot;LUELUELUE Pioneer Medal #{params[:id]}&quot;,
 22         arrtributes: &#39;[]&#39;,
 23       }
 24     end
{% endhighlight %}

<pre>
<code>resources :nft_assets, only: [:show] do
102       collection do
103         post :update_nft_assets
104       end
105     end
{% endhighlight %}

<p style="margin-left:.0001pt">#{params[:id]}</p>

<p style="margin-left:.0001pt"><a href="https://guides.rubyonrails.org/v6.1/routing.html#routing-concerns" title="Rails Routing from the Outside In — Ruby on Rails Guides">Rails Routing from the Outside In &mdash; Ruby on Rails Guides</a></p>

<p>&nbsp;</p>

<p style="margin-left:.0001pt">&nbsp;</p>

<p style="margin-left:.0001pt">&nbsp;</p>

<p style="margin-left:.0001pt">&nbsp;</p>

