---
layout: post
title: "How to Call a Function inside a Render in React/Jsx "
date: "2023-08-16"
categories: 
---
<p>refer <a href="https://stackoverflow.com/questions/40298136/how-to-call-a-function-inside-a-render-in-react-jsx">https://stackoverflow.com/questions/40298136/how-to-call-a-function-inside-a-render-in-react-jsx</a></p>

<p>在某个页面想要根据不同的条件进行渲染，可以使用函数调用，例如：（根据情况，在renderIcon中自行增加判断）</p>

<pre>
<code>import React, { Component, PropTypes } from &#39;react&#39;;

export default class PatientTable extends Component {
      constructor(props) {
        super(props);
        this.renderIcon = this.renderIcon.bind(this);  // 增加这一行
        this.state = { 
        checking:false
      };
        
  }
  // 增加这一段
  renderIcon(){
    console.log(&quot;came here&quot;)
    return(
      &lt;div&gt;Function called&lt;/div&gt;
    )
  }

  render() {

   return (
       &lt;div className=&quot;patient-container&quot;&gt;
       {this.renderIcon()}     // 增加这一行 
      &lt;/div&gt;
   );
 }
}
{% endhighlight %}

