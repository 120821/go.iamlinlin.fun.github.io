---
layout: post
title: "react  antd 正则表达式 match"
date: "2023-08-24"
categories: 
---
<p>在react 中使用js的正则表达式match()来匹配字符串， 示例：</p>

<p>（regex是用来匹配数字\d+,然后使用match()，传入正则表达式regex进行匹配。结果赋值给matches)</p>

<p>(条件运算&amp;&amp;可以进行确定只有不是&lsquo;&rsquo;而且不是null才会渲染匹配结果）</p>

{% highlight %}
{% highlight %}mport React from &#39;react&#39;;

function MyComponent() {
  const string = &#39;Hello, 12345 World!&#39;;
  const regex = /\d+/g; // 匹配数字的正则表达式

  const matches = string.match(regex);

  return (
    &lt;div&gt;
      &lt;p&gt;原始字符串: {string}&lt;/p&gt;
      &lt;p&gt;匹配结果: {matches &amp;&amp; matches.join(&#39;, &#39;)}&lt;/p&gt;
    &lt;/div&gt;
  );
}{% endhighlight %}

<p>在使用antd进行顶部标签的显示的时候，出现一些空标签，这时候就需要把空标签删除，或者给/edit/:id这样的path增加匹配，这就需要使用正则表达式：</p>

<p>例如， 在router中有这样的路由：</p>

{% highlight %}
{% highlight %}{&nbsp; &nbsp;

&nbsp; path: &#39;/edit_users/:id&#39;,

&nbsp; component: lazy(()=&gt;import(&#39;@/pages/User/edit&#39;)),

&nbsp; exact: false

}, {% endhighlight %}

<p>在配置Antd标签的时候，就可以这样：</p>

{% highlight %}
{% highlight %}&nbsp; {

&nbsp;&nbsp;&nbsp; id: &quot;/edit_users/:id&quot;,

&nbsp;&nbsp;&nbsp; name: &quot;编辑用户&quot;,

&nbsp;&nbsp;&nbsp; path: &quot;/Users&quot;,

&nbsp;&nbsp;&nbsp; children: [],

&nbsp; },&nbsp; {% endhighlight %}

<p>然后在匹配标签的时候修改一下匹配的条件判断：</p>

{% highlight %}
{% highlight %}const returnName = (data, value)=&gt;{

&nbsp; let name = &#39;&#39;

&nbsp; for(var i in data){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 对于普通的路由

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data[i].id == value){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name = data[i].name

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 对于 路由中包含 :id 的情况

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!name &amp;&amp; (data[i].id.match(&quot;:id&quot;)) ) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let temp_string = data[i].id.replace(&quot;:id&quot;, &quot;\\d+&quot;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let my_regexp = new RegExp(temp_string)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let temp_string_for_id = value.split(&#39;/&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let id = temp_string_for_id[temp_string_for_id.length -1]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( value.match(my_regexp) ) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name = data[i].name + &#39;-&#39; + id

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!name &amp;&amp; data[i].children.length &gt; 0){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name = returnName(data[i].children, value)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(name) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp; }

&nbsp; return name

}{% endhighlight %}

