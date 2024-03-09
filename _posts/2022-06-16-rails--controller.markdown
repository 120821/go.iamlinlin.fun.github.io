---
layout: post
title: "rails --视图页面 路由 controller"
date: "2022-06-16"
categories: 
---
<p>定义方法，在新的页面获取用户的收藏品，在路由增加</p>

<p>resource&nbsp; :xxx do</p>

<p>&nbsp;&nbsp; collection do&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :my_collections</p>

<p>&nbsp;&nbsp; end</p>

<p>end</p>

<p>def my_collections&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;13&nbsp;&nbsp;&nbsp;&nbsp; #@contracts = Contract.where(&#39;address = ?&#39;, current_user.address )<br />
&nbsp;14&nbsp;&nbsp;&nbsp;&nbsp; @contracts = Contract.where(&#39;address = ?&#39;, params[:address] )<br />
&nbsp;15&nbsp;&nbsp; end</p>

<p>后期会增加用户的登录，判断正确的用户，来获取用户的address或者telephone，使用params[:address]也是可以的</p>

<p>&nbsp;</p>

