---
layout: post
title: "Warning:: ReactDOM.render is no longer supported in React 18. Use createRoot instead [duplicate]"
date: "2023-10-21"
categories: 
---
<p><a href="https://stackoverflow.com/questions/71710596/warning-reactdom-render-is-no-longer-supported-in-react-18-use-createroot-ins">https://stackoverflow.com/questions/71710596/warning-reactdom-render-is-no-longer-supported-in-react-18-use-createroot-ins</a></p>

<p>使用yarn启动的时候，yarn start提示: Warning:: ReactDOM.render is no longer supported in React 18. Use createRoot instead [duplicate]</p>

<p>解决，修改index.js为这样的格式（不推荐，可以尝试吧package.json的^的版本都修改为yarn .lock的准确的版本，^都删除）</p>

<pre>
<code>import React from &quot;react&quot;;
import ReactDOM from &quot;react-dom/client&quot;;
import &quot;./index.css&quot;;
import App from &quot;./App&quot;;
import reportWebVitals from &quot;./reportWebVitals&quot;;

const root = ReactDOM.createRoot(document.getElementById(&quot;root&quot;));
root.render(
  &lt;React.StrictMode&gt;
    &lt;App /&gt;
  &lt;/React.StrictMode&gt;
);

reportWebVitals();{% endhighlight %}

