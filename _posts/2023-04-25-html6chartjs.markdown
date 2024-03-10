---
layout: post
title: "一个html页面可以显示6个Chart.js 环形图吗"
date: "2023-04-25"
categories: 
---
<p>可以在一个 HTML 页面中显示多个 Chart.js 环形图。这里是一个例子，展示了如何在一个 HTML 页面中显示 6 个简单的环形图。</p>
<p>首先，在 {% highlight html %}&lt;head&gt;{% endhighlight %} 中引入 Chart.js 库：</p>
{% highlight html %}&lt;head&gt;
&lt;title&gt;My Charts&lt;/title&gt;
&lt;script src=&quot;https://cdn.jsdelivr.net/npm/chart.js&quot;&gt;&lt;/script&gt;
&lt;/head&gt;{% endhighlight %}
<p>然后，在 {% highlight html %}&lt;body&gt;{% endhighlight %} 中添加 6 个 {% highlight html %}&lt;canvas&gt;{% endhighlight %} 元素，用于显示 6 个环形图。这里的例子中，每个 {% highlight html %}&lt;canvas&gt;{% endhighlight %} 元素都有一个唯一的 {% highlight html %}id{% endhighlight %} 属性，方便在 JavaScript 代码中选中并对其进行设定。</p>
{% highlight html %}&lt;body&gt;
&lt;canvas id=&quot;chart1&quot;&gt;&lt;/canvas&gt;
&lt;canvas id=&quot;chart2&quot;&gt;&lt;/canvas&gt;
&lt;canvas id=&quot;chart3&quot;&gt;&lt;/canvas&gt;
&lt;canvas id=&quot;chart4&quot;&gt;&lt;/canvas&gt;
&lt;canvas id=&quot;chart5&quot;&gt;&lt;/canvas&gt;
&lt;canvas id=&quot;chart6&quot;&gt;&lt;/canvas&gt;
&lt;/body&gt;{% endhighlight %}
<p>编写 JavaScript 代码，在每个 {% highlight html %}&lt;canvas&gt;{% endhighlight %} 上绘制环形图。这里的例子中，我们使用 {% highlight html %}Chart{% endhighlight %} 构造函数来创建并绘制环形图。每个环形图都有一个唯一的 {% highlight html %}id{% endhighlight %}，指定了它所在的 HTML 元素。在每个环形图的选项中，我们设置了 {% highlight html %}data{% endhighlight %}（用于绘制的数据数组）和 {% highlight html %}backgroundColor{% endhighlight %}（环形图的背景色）。此外，还可以设置其他选项，例如 {% highlight html %}cutoutPercentage{% endhighlight %}（环形图的中心空洞占比）、{% highlight html %}rotation{% endhighlight %}（环形图的旋转角度）等等。</p>
{% highlight html %}&lt;script&gt;
// 环形图1
var ctx1 = document.getElementById(&#39;chart1&#39;).getContext(&#39;2d&#39;);
var chart1 = new Chart(ctx1, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;Red&#39;, &#39;Blue&#39;, &#39;Yellow&#39;],
datasets: [{
data: [30, 40, 20],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: -0.5 * Math.PI
}
});
// 环形图2
var ctx2 = document.getElementById(&#39;chart2&#39;).getContext(&#39;2d&#39;);
var chart2 = new Chart(ctx2, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;A&#39;, &#39;B&#39;, &#39;C&#39;],
datasets: [{
data: [10, 30, 60],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: 0.5 * Math.PI
}
});
// 环形图3
var ctx3 = document.getElementById(&#39;chart3&#39;).getContext(&#39;2d&#39;);
var chart3 = new Chart(ctx3, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;One&#39;, &#39;Two&#39;, &#39;Three&#39;],
datasets: [{
data: [40, 20, 40],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: -0.25 * Math.PI
}
});
// 环形图4
var ctx4 = document.getElementById(&#39;chart4&#39;).getContext(&#39;2d&#39;);
var chart4 = new Chart(ctx4, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;First&#39;, &#39;Second&#39;, &#39;Third&#39;],
datasets: [{
data: [25, 45, 30],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: 0.75 * Math.PI
}
});
// 环形图5
var ctx5 = document.getElementById(&#39;chart5&#39;).getContext(&#39;2d&#39;);
var chart5 = new Chart(ctx5, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;X&#39;, &#39;Y&#39;, &#39;Z&#39;],
datasets: [{
data: [15, 55, 30],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: -0.75 * Math.PI
}
});
// 环形图6
var ctx6 = document.getElementById(&#39;chart6&#39;).getContext(&#39;2d&#39;);
var chart6 = new Chart(ctx6, {
type: &#39;doughnut&#39;,
data: {
labels: [&#39;Good&#39;, &#39;Better&#39;, &#39;Best&#39;],
datasets: [{
data: [50, 25, 25],
backgroundColor: [&#39;#ff6384&#39;, &#39;#36a2eb&#39;, &#39;#ffce56&#39;]
}]
},
options: {
cutoutPercentage: 60,
rotation: 0.25 * Math.PI
}
});
&lt;/script&gt;{% endhighlight %}
