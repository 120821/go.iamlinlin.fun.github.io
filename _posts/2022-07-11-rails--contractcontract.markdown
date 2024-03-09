---
layout: post
title: "rails--前端使用数据的时候，需要进行处理 @contract Contract是有区别的"
date: "2022-07-11"
categories: 
---
<p>&nbsp;@contracts = Contract.all.order(&#39;id desc&#39;)</p>

<p>使用的时候，不能直接在前端进行Contract.all.each do |contact|</p>

<p>需要进行倒序，然后@contract的处理后进行使用</p>

