---
layout: post
title: "react string convert to int"
date: "2023-09-20"
categories: 
---
<p>语法：</p>

{% highlight %}
{% highlight %}const intValue = parseInt(this.state.inputValue, 10);{% endhighlight %}

<p>完整的示例：</p>

{% highlight %}
{% highlight %}import React from &#39;react&#39;;

class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputValue: &#39;&#39;,
      intValue: 0
    };
  }

  handleChange = (event) =&gt; {
    this.setState({
      inputValue: event.target.value
    });
  }

  convertToInt = () =&gt; {
    const intValue = parseInt(this.state.inputValue, 10);
    if (!isNaN(intValue)) {
      this.setState({
        intValue: intValue
      });
    }
  }

  render() {
    return (
      &lt;div&gt;
        &lt;input type=&quot;text&quot; value={this.state.inputValue} onChange={this.handleChange} /&gt;
        &lt;button onClick={this.convertToInt}&gt;Convert to Int&lt;/button&gt;
        &lt;p&gt;Integer value: {this.state.intValue}&lt;/p&gt;
      &lt;/div&gt;
    );
  }
}

export default MyComponent;{% endhighlight %}

