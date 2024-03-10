---
layout: post
title: "react render 换行 块级元素 Css"
date: "2023-10-31"
categories: 
---
<p>可以使用div p等：</p>
{% highlight html %}render() {
return (
&lt;div&gt;
&lt;div&gt;第一行内容&lt;/div&gt;
&lt;div&gt;第二行内容&lt;/div&gt;
&lt;/div&gt;
);
}{% endhighlight %}
<p>也可以使用css:</p>
<div class="MarkdownCodeBlock_languageName__4_BF8">通过设置 {% highlight html %}whiteSpace{% endhighlight %} 属性为 {% highlight html %}&#39;pre-line&#39;{% endhighlight %} 或 {% highlight html %}&#39;pre-wrap&#39;{% endhighlight %}，可以将换行符和连续空格保留并进行换行。</div>
{% highlight html %}render() {
const styles = {
whiteSpace: &#39;pre-line&#39;
};
return (
&lt;div style={styles}&gt;
第一行内容
第二行内容
&lt;/div&gt;
);
}{% endhighlight %}
