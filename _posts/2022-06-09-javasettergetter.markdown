---
layout: post
title: "java 封装 setter getter"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <h3>封装的优点</h3> 
 <ul>
<li> <p>1. 良好的封装能够减少耦合。</p> </li>
<li> <p>2. 类内部的结构可以自由修改。</p> </li>
<li> <p>3. 可以对成员变量进行更精确的控制。</p> </li>
<li> <p>4. 隐藏信息，实现细节。</p> </li>
</ul>
</blockquote> 
<blockquote> 
 <h2>实现Java封装的步骤</h2> 
 <p>1. 修改属性的可见性来限制对属性的访问（一般限制为private），例如：</p> 
 <pre><code>
public class Person {
    private String name;
    private int age;
}
</code></pre> 
 <p>这段代码中，将 <strong>name</strong> 和 <strong>age</strong> 属性设置为私有的，只能本类才能访问，其他类都访问不了，如此就对信息进行了隐藏。</p> 
 <p>2. 对每个值属性提供对外的公共方法访问，也就是创建一对赋取值方法，用于对私有属性的访问，例如：</p> 
 <pre><code>
public class Person{
    private String name;
    private int age;
​
    public int getAge(){
      return age;
    }
​
    public String getName(){
      return name;
    }
​
    public void setAge(int age){
      this.age = age;
    }
​
    public void setName(String name){
      this.name = name;
    }
}
</code></pre> 
 <p>采用 <strong>this</strong> 关键字是为了解决实例变量（private String name）和局部变量（setName(String name)中的name变量）之间发生的同名的冲突。</p> 
 <hr>
 <h2>实例</h2> 
 <p>让我们来看一个java封装类的例子：</p> 
 <h2>EncapTest.java 文件代码：</h2> 
 <p>/* 文件名: EncapTest.java */</p> 
 <img alt="" height="71" src="https://img-blog.csdnimg.cn/72bfc88c72674210b9f7c51a5b0965c4.png" width="595">
 <p></p> 
 <p>以上实例中public方法是外部类访问该类成员变量的入口。</p> 
 <p>通常情况下，<strong>这些方法被称为getter和setter方法。</strong></p> 
 <p>因此，任何要访问类中私有成员变量的类都要通过这些getter和setter方法。</p> 
 <p>通过如下的例子说明EncapTest类的变量怎样被访问：</p> 
 <h2>RunEncap.java 文件代码：</h2> 
 <p>/* F文件名 : RunEncap.java */</p> 
 <pre><code>public class RunEncap{
   public static void main(String args[]){
      EncapTest encap = new EncapTest();
      encap.setName("James");
      encap.setAge(20);
      encap.setIdNum("12343ms");
 
      System.out.print("Name : " + encap.getName()+ 
                             " Age : "+ encap.getAge());
    }
}</code></pre> 
 <p></p> 
</blockquote> 
<p><img alt="" height="71" src="https://img-blog.csdnimg.cn/e8460fff4b3f4a64a0b307ebf9904901.png" width="595"> </p> 
<p> </p>
                
