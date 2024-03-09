---
layout: post
title: "安卓逆向-把blog的content进行raw处理"
date: "2023-12-18"
categories: 
---
<p>例如，我在rails可以使用raw(content)在安卓里，可以使用：</p>

<p>1.在blog的类里增加方法：</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">public</span> String <span style="color:#00e0e0">getFormattedContent</span><span style="color:#f5ab35">()</span> {
    <span style="color:#dcc6e0">if</span> (content != <span style="color:#dcc6e0">null</span>) {
        <span style="color:#d4d0ab">// 将内容转换为可显示的HTML格式</span>
        <span style="color:#dcc6e0">if</span> (Build.VERSION.SDK_INT &gt;= Build.VERSION_CODES.N) {
            <span style="color:#dcc6e0">return</span> Html.fromHtml(content, Html.FROM_HTML_MODE_LEGACY).toString();
        } <span style="color:#dcc6e0">else</span> {
            <span style="color:#dcc6e0">return</span> Html.fromHtml(content).toString();
        }
    } <span style="color:#dcc6e0">else</span> {
        <span style="color:#dcc6e0">return</span> <span style="color:#abe338">&quot;&quot;</span>;
    }
}
{% endhighlight %}

<p>2.在渲染html的时候调用：</p>

<p>例如在博客详情页面使用：</p>

{% highlight %}
{% highlight %}<span style="color:#d4d0ab">// 在UI线程更新UI</span>
runOnUiThread(() -&gt; {
    <span style="color:#d4d0ab">// 在TextView中显示博客内容（格式化后的）</span>
    contentTextView.setText(blog.getFormattedContent());
});{% endhighlight %}

