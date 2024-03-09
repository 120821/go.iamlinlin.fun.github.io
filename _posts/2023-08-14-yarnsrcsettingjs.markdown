---
layout: post
title: "yarn 配置文件 域名等放在src/setting.js中"
date: "2023-08-14"
categories: 
---
<p>yarn 配置文件 域名等放在src/setting.js中</p>

<p>如果想生成不同环境的build文件内容，可以修改base_url。</p>

{% highlight %}
{% highlight %}cat src/setting.js{% endhighlight %}

{% highlight %}
{% highlight %}module.exports = {

&nbsp; /**

&nbsp;&nbsp; * @description 基础url

&nbsp;&nbsp; */

&nbsp; BASE_URL: &quot;http://localhost:8000&quot;,

//&nbsp; BASE_URL: &quot;your_domain&quot;,

&nbsp; // BASE_URL: &quot;http://your_ip:8000&quot;,

&nbsp; BASE_URL_API: process.env.NODE_ENV === &#39;production&#39; ? &#39;/&#39; : &#39;/api/v1/&#39;,&nbsp; // 跨域代理

&nbsp; /**

&nbsp;&nbsp; * @description token在Cookie中存储的天数，默认1天

&nbsp;&nbsp; */

&nbsp; CookieExpires: 1,

&nbsp; /**

&nbsp;&nbsp; * @description token key

&nbsp;&nbsp; */

&nbsp; TokenKey: &#39;TOKEN&#39;,

&nbsp; /**

&nbsp;&nbsp; * @description token key

&nbsp;&nbsp; */

&nbsp; UserKey: &#39;USER&#39;,

&nbsp; LoginKey: &#39;Login&#39;,

&nbsp; IsAdminKey: &#39;IsAdmin&#39;,

&nbsp; AcitveKey: &#39;Active&#39;,

&nbsp; /**

&nbsp;&nbsp; * @description 请求超时时间，毫秒（默认1小时）

&nbsp;&nbsp; */

&nbsp; timeout: 1000*60*60,

&nbsp; /**

&nbsp;&nbsp; * 是否显示菜单

&nbsp;&nbsp; */

&nbsp; ShowMenu: true,

&nbsp; /**

&nbsp;&nbsp; * 是否显示面包屑

&nbsp;&nbsp; */

&nbsp; ShowBreAdcrumb: true,

&nbsp; /**

&nbsp;&nbsp; * 是否显示选项卡

&nbsp;&nbsp; */

&nbsp; ShowTabs: true,

&nbsp;&nbsp; /**

&nbsp;&nbsp; * 是否显示折叠按钮

&nbsp;&nbsp; */

&nbsp; ShowFold: true,

}{% endhighlight %}

<p>&nbsp;</p>

