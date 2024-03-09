---
layout: post
title: "...args try...catch toRefs的使用"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>... 是扩展运算符。</p> 
 <p>扩展语法。对数组和对象而言，就是将运算符后面的变量里东西每一项拆下来。<br> 这个东西可以在函数定义的地方使用，比如使用func(...args)将函数传入的参数都放到args数组里。</p> 
</blockquote> 
<blockquote> 
 <p><strong>javascript triple dot</strong></p> 
 <p>{...this.props} 将 props 中的“自己的”可枚举属性展开为您正在创建的 Modal 元素上的离散属性。  例如，如果 this.props 包含 a: 1 和 b: 2，那么<br> &lt;Modal {...this.props} title='Modal heading' animation={false}&gt;<br> 等同于<br> &lt;Modal a={this.props.a} b={this.props.b} title='Modal heading' animation={false}&gt;</p> 
</blockquote> 
<blockquote> 
 <p><strong>try...catch</strong><br> https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/try...catch    <br> try...catch语句标记要尝试的语句块，并指定一个出现异常时抛出的响应。<br> try语句包含了由一个或者多个语句组成的try块, 和至少一个catch块或者一个finally块的其中一个，或者两个兼有， 下面是三种形式的try声明：</p> 
 <p>    try...catch<br>     try...finally<br>     try...catch...finally</p> 
 <p>catch子句包含try块中抛出异常时要执行的语句。也就是，你想让try语句中的内容成功， 如果没成功，你想控制接下来发生的事情，这时你可以在catch语句中实现。 如果在try块中有任何一个语句（或者从try块中调用的函数）抛出异常，控制立即转向catch子句。如果在try块中没有异常抛出，会跳过catch子句。</p> 
 <p>finally子句在try块和catch块之后执行但是在下一个try声明之前执行。无论是否有异常抛出或捕获它总是执行。</p> 
 <p>你可以嵌套一个或者更多的try语句。如果内部的try语句没有catch子句，那么将会进入包裹它的try语句的catch子句。</p> 
</blockquote> 
<blockquote> 
 <p><br> toRefs</p> 
 <p>https://v3.cn.vuejs.org/api/refs-api.html#torefs    </p> 
 <pre><code>&lt;ComponentCommunicationChildRef ref="child"&gt;&lt;/ComponentCommunicationChildRef&gt;

methods: {
    get_child_value(){
      this.value_in_parent = this.$refs.child.value_in_child
    }
  }
 </code></pre> 
 <p>将响应式对象转换为普通对象，其中结果对象的每个 property 都是指向原始对象相应 property 的 ref。<br> 当从组合式函数返回响应式对象时，toRefs 非常有用，这样消费组件就可以在不丢失响应性的情况下对返回的对象进行解构/展开：<br> toRefs 只会为源对象中包含的 property 生成 ref。<br>  <br>  </p> 
</blockquote> 
<p></p>
                
