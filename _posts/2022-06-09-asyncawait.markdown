---
layout: post
title: "Async await的使用"
date: "2022-06-09"
categories: 
---
<p><strong>Async/await：是一个用同步思维解决异步问题的方案</strong></p> 
<blockquote> 
<p><strong>async是</strong>一个加在函数前的修饰符，被async定义的函数会默认返回一个Promise对象resolve的值。因此对async函数可以直接then，返回值就是then方法传入的函数。</p> 
<p><strong>await 也是</strong>一个修饰符，只能放在async定义的函数内。可以理解为等待。</p> 
<p>await 修饰的如果是Promise对象：可以获取Promise中返回的内容（resolve或reject的参数），且取到值后语句才会往下执行；</p> 
<p>如果不是Promise对象：把这个非promise的东西当做await表达式的结果。</p> 
</blockquote> 
<p>1.会自动将常规函数转换成Promise，返回值也是一个Promise对象<br> 2.只有async函数内部的异步操作执行完，才会执行then方法指定的回调函数<br> 3.异步函数内部可以使用await<br> 4.await 放置在Promise调用之前，await 强制后面点代码等待，直到Promise对象resolve，得到resolve的值作为await表达式的运算结果<br> 5.await只能在async函数内部使用,用在普通函数里就会报错</p> 
{% highlight html %}和Promise相比较
相同点：
为了解决异步流程问题，promise是约定，而async更优雅
区别：
1.Promise是ES6，而async是ES7
2.Promise原来有规范的意义，Promise a，b，c，d 等规范，最终确定的是Promise a+ 规范
3.Promise链式操作，自己catch异常。async则要在函数内catch，好在现在catch成本较低
4.Promise有很多并行神器，比如Promise.all\Promise.race等。这些是async没法搞定的
5.Promise是显式的异步，而 Async/await 让你的代码看起来是同步的，你依然需要注意异步
6.Promise即使不支持es6，你依然可以用promise的库或polyfil，而async就很难做，当然也不是不能，成本会高很多
7.async functions 和Array.forEach等结合，很多tc39提案都在路上或者已经实现，处于上升期，而promise也就那样了
总结：Async/awati 简单好用，是大势，肯定得学，而async的使用绕不开Promise，所以Promise是必会的。{% endhighlight %} 
{% highlight html %}// 使用async/await获取成功的结果
// 定义一个异步函数，3秒后才能获取到值(类似操作数据库)
function getSomeThing(){
return new Promise((resolve,reject)=&gt;{
setTimeout(()=&gt;{
resolve('获取成功')
},3000)
})
}
async function test(){
let a = await getSomeThing();
console.log(a)
}
test(); // 3秒后输出：获取成功
{% endhighlight %} 
<p></p>
