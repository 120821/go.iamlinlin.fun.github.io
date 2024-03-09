---
layout: post
title: "react render 换行 块级元素 Css"
date: "2023-10-31"
categories: 
---
<p>可以使用div p等：</p>

<pre>
<code>render() {
  return (
    &lt;div&gt;
      &lt;div&gt;第一行内容&lt;/div&gt;
      &lt;div&gt;第二行内容&lt;/div&gt;
    &lt;/div&gt;
  );
}</code></pre>

<p>也可以使用css:</p>

<div class="MarkdownCodeBlock_languageName__4_BF8">通过设置 <code>whiteSpace</code> 属性为 <code>&#39;pre-line&#39;</code> 或 <code>&#39;pre-wrap&#39;</code>，可以将换行符和连续空格保留并进行换行。</div>

<pre>
<code>render() {
  const styles = {
    whiteSpace: &#39;pre-line&#39;
  };

  return (
    &lt;div style={styles}&gt;
      第一行内容
      第二行内容
    &lt;/div&gt;
  );
}</code></pre>

