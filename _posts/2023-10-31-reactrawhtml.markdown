---
layout: post
title: "react rawHtml的使用"
date: "2023-10-31"
categories: 
---
<p>已知，在rails里可以使用raw：</p>

<pre>
<code>&lt;%= raw <span style="color:#ffa07a">@raw_html_content</span> %&gt;{% endhighlight %}

<p>在react 里可以使用rawHtml：</p>

<p>组件：</p>

<pre>
<code>import React from &#39;react&#39;;

class RawHtmlComponent extends React.Component {
  render() {
    const rawHtml = this.props.rawHtml;
    return (
      &lt;div dangerouslySetInnerHTML={{ __html: rawHtml }} /&gt;
    );
  }
}

export default RawHtmlComponent;{% endhighlight %}

<p>引用：</p>

<pre>
<code>import React from &#39;react&#39;;
import RawHtmlComponent from &#39;./RawHtmlComponent&#39;;

class App extends React.Component {
  render() {
    const rawHtmlContent = &quot;&lt;strong&gt;This is raw HTML content&lt;/strong&gt;&quot;;
    return (
      &lt;div&gt;
        &lt;h1&gt;My App&lt;/h1&gt;
        &lt;RawHtmlComponent rawHtml={rawHtmlContent} /&gt;
      &lt;/div&gt;
    );
  }
}

export default App;{% endhighlight %}

