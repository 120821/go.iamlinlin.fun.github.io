---
layout: post
title: "react searchParams的使用"
date: "2023-10-20"
categories: 
---
<p>searchParams 用于解析和操作URL的查询参数。可以使用searchParams来获取、添加、删除和修改URL中的查询参数。</p>
<p>例如：</p>
{% highlight html %}import React, { useEffect } from &#39;react&#39;;
const MyComponent = () =&gt; {
useEffect(() =&gt; {
// 获取当前URL的查询参数
const searchParams = new URLSearchParams(window.location.search);
// 获取特定查询参数的值
const paramValue = searchParams.get(&#39;paramName&#39;);
console.log(paramValue);
// 添加查询参数
searchParams.append(&#39;newParam&#39;, &#39;value&#39;);
// 修改查询参数的值
searchParams.set(&#39;paramName&#39;, &#39;updatedValue&#39;);
// 删除查询参数
searchParams.delete(&#39;paramName&#39;);
// 更新URL的查询参数
const newUrl = `${window.location.pathname}?${searchParams.toString()}`;
window.history.replaceState(null, &#39;&#39;, newUrl);
}, []);
return &lt;div&gt;My Component&lt;/div&gt;;
};
export default MyComponent;{% endhighlight %}
<p>{% highlight html %}对于{% endhighlight %}<a href="http://localhost:3000/show_result_as_map/1446?calculation_result_id=1175&amp;material_id=18" target="_blank">http://localhost:3000/show_result_as_map/1446?calculation_result_id=1175&amp;material_id=18</a></p>
{% highlight html %}import React, { useEffect } from &#39;react&#39;;
const MyComponent = () =&gt; {
useEffect(() =&gt; {
// 获取当前URL的查询参数
const searchParams = new URLSearchParams(window.location.search);
// 获取特定查询参数的值
const calculationResultId = searchParams.get(&#39;calculation_result_id&#39;);
const materialId = searchParams.get(&#39;material_id&#39;);
console.log(calculationResultId); // 输出：1175
console.log(materialId); // 输出：18
// 添加查询参数
searchParams.append(&#39;newParam&#39;, &#39;value&#39;);
// 修改查询参数的值
searchParams.set(&#39;calculation_result_id&#39;, &#39;updatedValue&#39;);
// 删除查询参数
searchParams.delete(&#39;material_id&#39;);
// 更新URL的查询参数
const newUrl = `${window.location.pathname}?${searchParams.toString()}`;
window.history.replaceState(null, &#39;&#39;, newUrl);
}, []);
return &lt;div&gt;My Component&lt;/div&gt;;
};
export default MyComponent;{% endhighlight %}
<p>上面的代码中使用了React的{% highlight html %}useEffect{% endhighlight %}钩子，并将其依赖数组设置为空数组{% highlight html %}[]{% endhighlight %}，以确保只在组件加载时执行一次。这样可以在组件加载时对URL的查询参数进行处理。</p>
