---
layout: post
title: "react 实现登录功能 提交表单等--todo"
date: "2022-08-18"
categories: 
---
<p><a href="https://house.blog.csdn.net/article/details/104774212?spm=1001.2101.3001.6661.1&amp;utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-104774212-blog-107407027.pc_relevant_multi_platform_whitelistv3&amp;depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-104774212-blog-107407027.pc_relevant_multi_platform_whitelistv3&amp;utm_relevant_index=1">换一个看吧</a></p>

<p>首先创建新的APP，进入项目文件夹的src目录下，清空文件。</p>

<pre class="prettyprint prettyprinted" style="">
<code><span class="pln">create</span><span class="pun">-</span><span class="pln">react</span><span class="pun">-</span><span class="pln">app </span>crud
cd src
<span class="hljs-built_in">rm</span> -f *</code></pre>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code><code class="gatsby-code-bash hljs language-bash">创建目录store</code></code></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code><code class="gatsby-code-bash hljs language-bash">vim index.js（/src/store/index.js）</code></code></div>

<pre>
<code>import {createStore, combineReducers} from &#39;redux&#39;;
import {userReducer} from &quot;./userReducer&quot;;
const store = createStore(combineReducers({user: userReducer}))
export default store;</code></pre>

<p>vim userReducer.js</p>

<p>这里的操作很简单，只需要用户登录成功后，通过store.dispatch 将 isLogin 状态更改为 true</p>

<pre>
<code>// 定义修改规则 登录
const initalUserInfo = {
&nbsp; isLogin: false, //判断是否登录
};
export function userReducer(
&nbsp; state = {...initalUserInfo}, action) {
&nbsp; switch (action.type) {
&nbsp;&nbsp;&nbsp; case &quot;LOGIN_SUCCESS&quot;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isLogin: true
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };
&nbsp;&nbsp;&nbsp; default:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return state;
&nbsp; }
}</code></pre>

<p>vim src/index.js</p>

<pre>
<code>import React from &#39;react&#39;;
import store from &quot;./store&quot;;
import ReactDom from &#39;react-dom&#39;;
import App from &#39;./App&#39;;
import {Provider} from &quot;react-redux&quot;;
ReactDom.render(
&lt;Provider store={store}&gt;
&lt;App/&gt;
&lt;/Provider&gt;
, document.getElementById(&#39;root&#39;))</code></pre>

<p>这样 store 就注册好了，接下来改造文章开头的路由: src/App.js</p>

<p>// 我们把之前的路由菜单改一下，非登录状态进入 /login,登录状态显示菜单<br /></pre>
<pre><code>
function App(){<br />
&nbsp; return (<br />
&nbsp;&nbsp;&nbsp; &lt;BrowserRouter&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route path=&#39;/login&#39; component={LoginPage} /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;PrivateRoute path=&#39;/&#39;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;ul&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;li&gt;&lt;Link to=&#39;/&#39;&gt;主页&lt;/Link&gt;&lt;/li&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;li&gt;&lt;Link to=&#39;/message&#39;&gt;消息&lt;/Link&gt;&lt;/li&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;li&gt;&lt;Link to=&#39;/search&#39;&gt;发现&lt;/Link&gt;&lt;/li&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;li&gt;&lt;Link to=&#39;/my&#39;&gt;我的&lt;/Link&gt;&lt;/li&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/ul&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Switch&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route exact path=&#39;/&#39; component={HomePage} /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route path=&#39;/message&#39; component={MessagePage}/&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route path=&#39;/search&#39; component={SearchPage}/&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route path=&#39;/my&#39; component={MyPage}/&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/Switch&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/PrivateRoute&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/BrowserRouter&gt;<br />
&nbsp; )<br />
}</code></pre>
<p>src/route/privateRoute.js</p>
<p>privateRoute 在这里起到路由守卫的作用，即进入页面之前先判断登录状态</p>
<pre>
<code>mport React from &#39;react&#39;;
import {Redirect, Route} from &#39;react-router-dom&#39;;
import {connect} from &#39;react-redux&#39;</code>
</pre>

<pre><code>export default connect(<br />
&nbsp; ({user}) =&gt; ({<br />
&nbsp;&nbsp;&nbsp; isLogin: user.isLogin<br />
&nbsp; })<br />
)(<br />
&nbsp; function PrivateRoute({children, isLogin, ...rest}) {<br />
&nbsp;&nbsp;&nbsp; return (<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Route<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {...rest}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render={({location}) =&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isLogin ? (<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; children<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ) : (&lt;Redirect<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to={{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pathname: &quot;/login&quot;, state:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {redirect: location.pathname}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&gt;<br />
&nbsp;&nbsp;&nbsp; );<br />
&nbsp; });</code></pre>

<p>src/pages/loginPage.js</p>

<p>登录页面的逻辑主要在登录成功之后的处理</p>

<pre>
<code>// 表单提交
submit = ()=&gt;{
&nbsp; const {username, password} = this.state;
&nbsp; // 这里保留一个成功的用户名和密码
&nbsp; if (username === &#39;admin&#39; &amp;&amp; password === &#39;admin&#39;){
&nbsp;&nbsp;&nbsp; store.dispatch({type: &#39;LOGIN_SUCCESS&#39;})
&nbsp;&nbsp;&nbsp; this.props.history.push(&#39;/&#39;)
&nbsp; } else {
&nbsp;&nbsp;&nbsp; store.dispatch({type: &#39;LOGIN_FAILURE&#39;})
&nbsp; }
}</code></pre>

<p>运行：<span class="pln">npm start </span></p>

<p>出现了报错：</p>

<pre>
<code>Can&#39;t resolve &#39;react-redux&#39; in &#39;/workspace/react_test/crud/src</code></pre>

<p>解决：<a href="https://bobbyhadz.com/blog/react-module-not-found-cant-resolve-redux">https://bobbyhadz.com/blog/react-module-not-found-cant-resolve-redux</a></p>

<pre class="language-bash code-snippet focus:outline-none">
<code class="language-bash"><span class="token function">npm</span> <span class="token function">install</span> redux react-redux</code></pre>

<p>还有一个没有解决：</p>

<pre>
<code>export &#39;default&#39; (imported as &#39;App&#39;) was not found in &#39;./App&#39; (module has no exports)</code></pre>

