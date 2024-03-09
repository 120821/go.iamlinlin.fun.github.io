---
layout: post
title: "antd pagination 不显示每页几条的筛选"
date: "2023-11-04"
categories: 
---
<p>在使用antd的时候，因为不需要使用每页进行筛选的功能，所以可以进行隐藏：</p>

<pre>
<code> &lt;Pagination
  current={currentPage}
  total={totalCount}
  onChange={this.handlePaginationChange}
  showSizeChanger={false} // 隐藏每页筛选几条的按钮
/&gt;</code></pre>

