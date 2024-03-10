---
layout: post
title: "java map clone remove"
date: "2022-06-09"
categories: 
---
<p>java clone</p> 
<p>使用clone 可以复制原来的map，即使在map经过了remove，也可以保证输出map原来的数据。</p> 
{% highlight html %}<code class="language-java">package java_test;
import java.util.HashMap;
public class hashmap {
public static void main(String[] args) {
HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
map.put("hihihi", "hhaha");
map.put("lalala", "liliil");
map.put("didid", "kiiiiiii");
HashMap&lt;String, String&gt; another_map = (HashMap&lt;String, String&gt;) map.clone();
System.out.println(map.remove("lalala"));
System.out.println(map);
System.out.println(another_map);
System.out.println(map.isEmpty());
System.out.println(map.containsKey("hihihi"));
//System.out.println(map.size);
map.clear();
}
}{% endhighlight %} 
<p>在使用getter和setter方法的时候，要保证数据类型完整，需要的person数据要有定义。注意一般使用大写，便于区分。</p> 
{% highlight html %}<code class="language-java">package java_test;
public class Person {
int age;
String name;
int salary;
public int getAge() {
return age;
}
public String getName() {
return name;
}
public int getSalary() {
return salary;
}
public void setAge(int age) {
this.age = age;
}
public void setName(String name) {
this.name = name;
}
public void setSalary(int salary) {
this.salary = salary;
}
}
{% endhighlight %} 
<p>在test页面就可以调用。person数据类型。调用方法是没有顺序之分的，因为在使用方法之前，java会读取所有的class内容，然后再进行编译， 进而调用。</p> 
{% highlight html %}<code class="language-java">package java_test;
public class test {
public static void main(String[]args){
Person person=new Person();
person.age=22;
person.setName("hhh");
person.setSalary(390000);
System.out.println("姓名为:"+person.getName());
System.out.println("年龄为:"+person.age);
System.out.println("年薪为:"+person.getSalary());
}
}{% endhighlight %} 
<p><img alt="" height="606" src="https://img-blog.csdnimg.cn/84d967a0c1ce40c1bf329d460e4eaf77.png" width="760"></p> 
<p>蓝框1和3 的内容也不会按照顺序来进行，因为都是先进行编译class，才开始使用方法的。中间的蓝框是声明的一个方法，看前面，出现了void</p>
