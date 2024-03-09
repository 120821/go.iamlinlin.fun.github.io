---
layout: post
title: "react handsontable 组件的双向绑定"
date: "2023-10-17"
categories: 
---
<p>handsontable组件在使用的时候，由于生命周期的原因，在初次渲染的时候，数据可能还没有从接口得到，所以需要增加判断，如果数据已经得到了，就渲染，不然就渲染空。</p>

<p>例如：</p>

{% highlight %}
{% highlight %}render() {
  const { tableData } = this.state;

  // 如果 tableData 长度小于等于 1，则不渲染 HandsonTable 组件
  if (tableData.length &lt;= 1) {
    return null;
  }

  const tableStyle = {
    width: &#39;500px&#39;,
    height: &#39;auto&#39;,
    margin: &#39;20px 0&#39;,
    border: &#39;1px solid #ccc&#39;,
    borderRadius: &#39;4px&#39;,
    overflow: &#39;auto&#39;
  };

  return (
    &lt;div style={tableStyle} id={this.props.id}&gt;&lt;/div&gt;
  );
}{% endhighlight %}

<p>handsontable的组件可以这样写（普通的，没有使用双向绑定）：<br />
&nbsp;</p>

{% highlight %}
{% highlight %}import React from &#39;react&#39;;
import Handsontable from &#39;handsontable&#39;;
import &#39;handsontable/dist/handsontable.full.min.css&#39;;

class HandsonTable extends React.Component {
  container = null;
  hot = null;

  componentDidMount() {
    this.container = document.querySelector(`#${this.props.id}`);
    this.hot = new Handsontable(this.container, {
      data: this.props.data,
      rowHeaders: false,
      colHeaders: false,
      licenseKey: &#39;non-commercial-and-evaluation&#39;
    });
  }

  render() {

    const tableStyle = {
      width: &#39;500px&#39;,
      height: &#39;auto&#39;,
      margin: &#39;20px 0&#39;,
      border: &#39;1px solid #ccc&#39;,
      borderRadius: &#39;4px&#39;,
      overflow: &#39;auto&#39;
    };
    return (
      &lt;div style={tableStyle} id={this.props.id}&gt;&lt;/div&gt;
    )
  }
}

export default HandsonTable;{% endhighlight %}
{% endhighlight %}

<p>可以在引用的时候增加双向绑定：</p>

{% highlight %}
{% highlight %}import React, { useState } from &#39;react&#39;;
import HandsonTable from &#39;./HandsonTable&#39;;

function App() {
  const [tableData, setTableData] = useState([
    [&#39;Cell 1&#39;, &#39;Cell 2&#39;, &#39;Cell 3&#39;],
    [&#39;Cell 4&#39;, &#39;Cell 5&#39;, &#39;Cell 6&#39;],
    [&#39;Cell 7&#39;, &#39;Cell 8&#39;, &#39;Cell 9&#39;]
  ]);

  const handleDataChange = newData =&gt; {
    setTableData(newData);
  };

  return (
    &lt;div&gt;
      &lt;HandsonTable
        id=&quot;exampleTable&quot;
        data={tableData}
        onDataChange={handleDataChange}
      /&gt;
    &lt;/div&gt;
  );
}

export default App;{% endhighlight %}

