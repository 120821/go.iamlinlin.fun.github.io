---
layout: post
title: "react useHistory() 返回上一页"
date: "2023-10-26"
categories: 
---
<p>react 使用useHistroy()可以返回上一页：</p>

<p>需要引入：</p>

<p><code>import { withRouter } from &#39;react-router-dom&#39;;</code></p>

<p>然后定义：</p>

<p><code>goBack = () =&gt; { this.props.history.goBack(); }</code></p>

<p>最后使用：</p>

<p><code>&lt;button onClick={this.goBack}&gt;返回上一页&lt;/button&gt;</code></p>

<p>完整的组件示例：</p>

<pre>
<code>import React from &#39;react&#39;;
import { withRouter } from &#39;react-router-dom&#39;;

class MyComponent extends React.Component {
  goBack = () =&gt; {
    this.props.history.goBack();
  }

  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;MyComponent&lt;/h1&gt;
        &lt;button onClick={this.goBack}&gt;返回上一页&lt;/button&gt;
      &lt;/div&gt;
    );
  }
}

export default withRouter(MyComponent);</code></pre>

