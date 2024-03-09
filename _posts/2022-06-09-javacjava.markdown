---
layout: post
title: "javac和java的区别"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><strong>javac和java的区别</strong></p> 
 <p>1. javac 是编译一个java文件的基本命令，通过不同参数可以完成各种配置，比如导入其他类，指定编译路径等。</p> 
 <p>2. java是执行一个java文件的基本命令，通过参数配置可以以不同方式执行一个java程序或者是一个jar包。</p> 
 <p>3. javap是一个class文件的反编译程序，可以获取class文件的反编译结果，甚至是jvm执行程序的每一步代码实现。</p> 
 <p>总结：<strong>Javac</strong>是编译、<strong>Java</strong>是执行，编写<strong>Java代码</strong>后，使用<strong>Javac进行编译生成 .Class</strong>文件，<strong>.Class</strong>文件使用 Java命令 执行代码；</p> 
</blockquote> 
<blockquote> 
 <p>javac 可以将java源文件编译为class字节码文件<br> 如 javac HelloWorld.java<br><br> 运行javac命令后，如果成功编译没有错误的话，会出现一个HelloWorld.class的文件。<br><br> java 可以运行class字节码文件<br> 如 java HelloWorld<br><br> 注意java命令后面不要加.class<img alt="" height="230" src="https://img-blog.csdnimg.cn/0876be4367224e668633c2bef0d42121.png" width="631"></p> 
 <p> </p> 
 <pre><code class="language-java">
EmployeeTest.java 文件代码：
import java.io.*;
public class EmployeeTest{
 
   public static void main(String[] args){
      /* 使用构造器创建两个对象 */
      Employee empOne = new Employee("RUNOOB1");
      Employee empTwo = new Employee("RUNOOB2");
 
      // 调用这两个对象的成员方法
      empOne.empAge(26);
      empOne.empDesignation("高级程序员");
      empOne.empSalary(1000);
      empOne.printEmployee();
 
      empTwo.empAge(21);
      empTwo.empDesignation("菜鸟程序员");
      empTwo.empSalary(500);
      empTwo.printEmployee();
   }
}
</code></pre> 
 <pre><code class="language-java">
Employee.java 文件代码：
import java.io.*;
 
public class Employee{
   String name;
   int age;
   String designation;
   double salary;
   // Employee 类的构造器
   public Employee(String name){
      this.name = name;
   }
   // 设置age的值
   public void empAge(int empAge){
      age =  empAge;
   }
   /* 设置designation的值*/
   public void empDesignation(String empDesig){
      designation = empDesig;
   }
   /* 设置salary的值*/
   public void empSalary(double empSalary){
      salary = empSalary;
   }
   /* 打印信息 */
   public void printEmployee(){
      System.out.println("名字:"+ name );
      System.out.println("年龄:" + age );
      System.out.println("职位:" + designation );
      System.out.println("薪水:" + salary);
   }
}
</code></pre> 
 <h2>import 语句</h2> 
 <p>在 Java 中，如果给出一个完整的限定名，包括包名、类名，那么 Java 编译器就可以很容易地定位到源代码或者类。import 语句就是用来提供一个合理的路径，使得编译器可以找到某个类。</p> 
 <p>例如，下面的命令行将会命令编译器载入 java_installation/java/io 路径下的所有类</p> 
 <pre><code>import java.io.*;</code></pre> 
 <p></p> 
</blockquote>
                
