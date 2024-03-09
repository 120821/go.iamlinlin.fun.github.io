---
layout: post
title: "Rails的哪些action要使用@变量， 哪些action 不使用 "
date: "2022-06-30"
categories: 
---
<div class="wiki">
<p>@user 作用： 为了在view中使用这个变量。</p>

<p>有对应的view页面的，就使用。 show, index, edit, new</p>

<p>没有对应的view页面的， 就不使用。 update, create destroy</p>

<p>resources :users</p>
</div>

