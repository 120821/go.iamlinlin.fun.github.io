---
layout: post
title: "order--正序倒序-select"
date: "2022-06-21"
categories: 
---
<p>参考：https://apidock.com/rails/ActiveRecord/QueryMethods/order</p>
<p>视图页面</p>
<p>&lt;%= form_tag &#39;&#39;, method: :get do %&gt;<br />
&nbsp;总数: &lt;%= select_tag :order, options_for_select([[&#39;不排序&#39;, nil],[&#39;升序&#39;, &#39;asc&#39;],[&#39;降序&#39;, &#39;desc&#39;]], params[:order]) %&gt;<br />
&lt;%= submit_tag raw(&quot;&amp;#xf002; 查询&quot;), class: &quot;form_submit&quot;, class: &#39;btn btn-secondary btn-sm fa-input&#39; %&gt;<br />
&nbsp;&lt;%= link_to raw(&#39;&lt;i class=&quot;fa fa-download&quot;&gt;&lt;/i&gt;下载csv&#39;), download_csv_accounts_path, class: &quot;btn btn-primary btn-sm&quot;%&gt;<br />
&lt;% end %&gt;</p>
<p>controller页面增加判断</p>
<p>@accounts = Account<br />
&nbsp;&nbsp;&nbsp;&nbsp; if params[:order] == &#39;asc&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @accounts = @accounts.order(&#39;nft_asset_count ASC&#39;)<br />
&nbsp;&nbsp; elsif params[:order] == &#39;desc&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @accounts = @accounts.order(&#39;nft_asset_count DESC&#39;)<br />
&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp; @accounts = @accounts.order(&#39;id desc&#39;)<br />
&nbsp;&nbsp; end</p>
<p>@accounts = @accounts.page(params[:page]).per(100)</p>
<p>&nbsp;</p>
