---
layout: post
title: "JavaScript入门算法：动态创建一个二维Array"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>数组通常被描述为“像列表一样的对象”; 简单来说，数组是一个包含了多个值的对象。数组对象可以存储在变量中，并且能用和其他任何类型的值完全相同的方式处理，区别在于我们可以单独访问列表中的每个值，并使用列表执行一些有用和高效的操作，如循环 - 它对数组中的每个元素都执行相同的操作。 也许我们有一系列产品和价格存储在一个数组中，我们想循环遍历所有这些产品，并将它们打印在发票上，同时将所有产品的价格统计在一起，然后将总价格打印在底部。</p> 
 <p>可以通过使用 <a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/length" title="length">length</a> 属性获取数组的长度（数组中有多少项元素），这与查找字符串的长度（以字符为单位）完全相同 。 尝试以下代码：</p> 
 {% highlight %}<code class="language-javascript">sequence.length;
// should return 7{% endhighlight %} 
 <p>虽然 length 属性也有其他用途，但最常用于循环（循环遍历数组中的所有项）。 例如：</p> 
 {% highlight %}<code class="language-javascript">let sequence = [1, 1, 2, 3, 5, 8, 13];
for (let i = 0; i &lt; sequence.length; i++) {
  console.log(sequence[i]);
}{% endhighlight %} 
 <p>实现这样的方法： 可以动态创建一个二维Array, 内容如下</p> 
 {% highlight %}generate_array(4) 

获得：

[
  [1],
  [2,2],
  [3,3,3],
  [4,4,4,4]
]

再如：

generate_array(5) 

获得：

[
  [1],
  [2,2],
  [3,3,3],
  [4,4,4,4],
  [5,5,5,5,5]
]

{% endhighlight %} 
</blockquote> 
{% highlight %}<code class="language-html">&lt;body&gt;
  &lt;script&gt;
    var myarr=new Array(); //先声明一维
      for(var i=0;i&lt;2;i++){ //一维长度为2
        myarr[i]=new Array(); //再声明二维
          for(var j=0;j&lt;3;j++){ //二维长度为3
            myarr[i][j]=i+j; // 赋值，每个数组元素的值为i+j
          }
      }
    console.log(myarr)
    const d = 4
    var arr = new Array();// 创建一维数组
    for(var i = 0; i&lt;d; i++) { // 元素数量为i
       arr[i]= new Array(); // 创建二维数组
        for(var j=0;j&lt;(i+1);j++) { //二维数组的数量为j
          arr[i][j] = new Array(i).push(j);
        }
    }
    console.log(arr)
    const c = 7
    var arr = new Array();
    for(var i=0; i&lt;c; i++) {
      arr[i] = new Array();
        for(var j=0;j&lt;(i+1);j++) {
          arr[i][j] = new Array(j).push(j);
        }
    }
    console.log(arr)

  &lt;/script&gt;
&lt;/body&gt;
~        {% endhighlight %} 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/c20cecabc7bd4c68b65fec3bce20e807.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> </p>
                
