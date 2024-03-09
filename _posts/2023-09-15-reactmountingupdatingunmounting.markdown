---
layout: post
title: "react 生命周期Mounting Updating Unmounting"
date: "2023-09-15"
categories: 
---
<p><strong>挂载</strong><br />
定义：组件被创建并添加到DOM中的过程称为挂载。</p>

<p>理解：在挂载阶段，组件的构造函数（constructor）被调用，然后依次调用<code>render</code>方法和<code>componentDidMount</code>生命周期钩子函数。</p>

<p>在<code>componentDidMount</code>中，可以执行数据获取、订阅等。</p>

<p><strong>更新</strong></p>

<p>组件在接收props（属性）或state(状态）的时候更新。</p>

<p>具体：先render , 然后使用<code>componentDidUpdate函数。</code></p>

<p><strong>卸载</strong></p>

<p>就是：组件从DOM中移除</p>

<p>卸载的时候调用<code>componentWillUnmount函数（生命周期钩子函数）可以取消订阅，清除数据。</code></p>

<p><strong>挂载，更新，卸载的例子：</strong></p>

<pre>
<code>import React, { Component } from &#39;react&#39;;

class MyComponent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  componentDidMount() {
    console.log(&#39;Component mounted&#39;);
  }

  componentDidUpdate(prevProps, prevState) {
    console.log(&#39;Component updated&#39;);
    if (prevState.count !== this.state.count) {
      console.log(&#39;Count changed&#39;);
    }
  }

  componentWillUnmount() {
    console.log(&#39;Component will unmount&#39;);
  }

  incrementCount = () =&gt; {
    this.setState(prevState =&gt; ({
      count: prevState.count + 1
    }));
  };

  render() {
    return (
      &lt;div&gt;
        &lt;p&gt;Count: {this.state.count}&lt;/p&gt;
        &lt;button onClick={this.incrementCount}&gt;Increment&lt;/button&gt;
      &lt;/div&gt;
    );
  }
}</code></pre>

