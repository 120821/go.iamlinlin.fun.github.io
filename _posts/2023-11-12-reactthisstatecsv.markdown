---
layout: post
title: "react 把this.state的数据可以下载CSV，触发事件才下载"
date: "2023-11-12"
categories: 
---
<p>点击下载的按钮，可以下载原始的数据（未经处理，不会每次刷新就自动下载文件）例如：</p>

<pre>
<code>export default class CalculationViewResult extends Component {
  // 省略其他代码

  exportToCSV(resultData) {
    // 获取params和results的值
    const params = resultData.map((item) =&gt; item.params);
    const results = resultData.map((item) =&gt; item.results);

    // 创建CSV内容
    const csvContent = `Params\n${JSON.stringify(params)}\n\nResults\n${JSON.stringify(results)}`;

    // 创建Blob对象
    const blob = new Blob([csvContent], { type: &#39;text/csv;charset=utf-8;&#39; });

    // 创建URL对象
    const url = URL.createObjectURL(blob);

    // 创建一个隐藏的&lt;a&gt;元素
    const link = document.createElement(&#39;a&#39;);
    link.href = url;
    link.setAttribute(&#39;download&#39;, &#39;data.csv&#39;);
    document.body.appendChild(link);

    // 模拟点击下载链接
    link.click();

    // 清理
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }

  // 省略其他代码

  render() {
    return (
      &lt;div&gt;
        {/* 其他组件内容 */}
        &lt;button onClick={() =&gt; this.exportToCSV(this.getResultData())}&gt;下载&lt;/button&gt;
      &lt;/div&gt;
    );
  }
}</code></pre>

<p>&nbsp;</p>

