---
layout: post
title: "List＜List＜integer＞ ＞ JAVA java的继承和实现概念"
date: "2022-06-09"
categories: 
---
<blockquote>
<p id="articleContentId">在List1&lt;&gt;中再放一个List2&lt;&gt;，List1中每个List2的长度可以是任意的，而不是像二维数组那样维度固定。<br />
如：</p>
</blockquote>

<blockquote>
<p>List&lt;String&gt; 表示： 该数组中的所有元素都是String<br />
List&lt;Integer&gt; 。。。。都是Integer<br />
List&lt;List&lt;String&gt;&gt; 表示该数组是一个二维数组， 该数组的每个元素都是 List&lt;String&gt;<br />
例如：<br />
[<br />
&nbsp;&nbsp;&nbsp; &nbsp;<br />
[&#39;a&#39;,&#39;b&#39;,&#39;c&#39;], &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; [&#39;d&#39;, &#39;e&#39;, &#39;f&#39;]<br />
]</p>
</blockquote>

{% highlight %}
{% highlight %}    public static void main(String[] args)
    {
        List&lt;List&lt;Integer&gt;&gt; a=new ArrayList&lt;List&lt;Integer&gt;&gt;();
        for(int i=0;i&lt;3:i++)
        {
        List&lt;Integer&gt; b=new ArrayList&lt;Integer&gt;();
        for(int j=0;j&lt;=i;j++)
        {
        b.add(j);
        }
        a.add(b);
        }
        System.out.println(a);

    }
{% endhighlight %}

<p><img alt="" height="86" src="https://img-blog.csdnimg.cn/d90d3b398a6044c08c09f884ce25df4c.png" width="294" /></p>

<p><img alt="" height="660" src="https://img-blog.csdnimg.cn/740b6bd2ffa24084afd67d25510cca68.png" width="824" /></p>

<blockquote>
<p>java的继承和实现概念</p>

<p>继承实际上是子类相同的属性和行为可以定义在父类中，子类特有的属性和行为由自己定义，这样就实现了相同属性和行为的重复利用，从而提高了代码复用。<br />
ArrayList 是 List的具体实现&nbsp;</p>

<p>所以可以写成 List xx = new ArrayList()...</p>
</blockquote>

<p>假如我们要定义如下类：学生类，老师类和工人类，分析如下。</p>

<blockquote>
<p>学生类属性：姓名，年龄行为：吃饭，睡觉</p>

<p>老师类属性：姓名，年龄，薪水行为：吃饭，睡觉，</p>

<p>教书班主任属性：姓名，年龄，薪水行为：吃饭，睡觉，管理</p>

<p>如果我们定义了这三个类去开发一个系统，那么这三个类中就存在大量重复的信息（属性：姓名，年龄。行为：吃饭，睡觉）。这样就导致了相同代码大量重复，代码显得很臃肿和冗余，那么如何解决呢？</p>

{% highlight %}
{% highlight %}案例代码实现

1.父类Human类

public class Human {// 合理隐藏 private String name ; private int age ; // 合理暴露 public String getName() { return name; } public void setName(String name) { this.name = name; } public int getAge() { return age; } public void setAge(int age) { this.age = age; }}

2.子类Teacher类

public class Teacher extends Human {// 工资 private double salary ; // 特有方法 public void teach(){ System.out.println(&quot;老师在认真教技术！&quot;)； } public double getSalary() { return salary; } public void setSalary(double salary) { this.salary = salary; }}

3.子类Student类

public class Student extends Human{}

4.子类BanZhuren类

public class Teacher extends Human {// 工资 private double salary ; // 特有方法 public void admin(){ System.out.println(&quot;班主任强调纪律问题！&quot;)； } public double getSalary() { return salary; } public void setSalary(double salary) { this.salary = salary; }}

5.测试类

public class Test {public static void main(String[] args) { Teacher dlei = new Teacher(); dlei.setName(&quot;播仔&quot;); dlei.setAge(&quot;31&quot;); dlei.setSalary(1000.99); System.out.println(dlei.getName()); System.out.println(dlei.getAge()); System.out.println(dlei.getSalary()); dlei.teach(); BanZhuRen linTao = new BanZhuRen(); linTao.setName(&quot;灵涛&quot;); linTao.setAge(&quot;28&quot;); linTao.setSalary(1000.99); System.out.println(linTao.getName()); System.out.println(linTao.getAge()); System.out.println(linTao.getSalary()); linTao.admin(); Student xugan = new Student(); xugan.setName(&quot;播仔&quot;); xugan.setAge(&quot;31&quot;); //xugan.setSalary(1000.99); // xugan没有薪水属性，报错！ System.out.println(xugan.getName()); System.out.println(xugan.getAge()); } }{% endhighlight %}

<p>&nbsp;</p>
</blockquote>

<p><img alt="" height="326" src="https://img-blog.csdnimg.cn/ebe350eaadf74b519d7b7f7bd07fbb44.png" width="452" /></p>

<p>&nbsp;</p>

<blockquote>
<p>多个类可以称为子类，单独被继承的那一个类称为父类、超类（superclass）或者基类。</p>

<p>继承的含义</p>

<p>继承描述的是事物之间的所属关系，这种关系是：is-a的关系。例如，兔子属于食草动物，食草动物属于动物。可见，父类更通用，子类更具体。我们通过继承，可以使多种事物之间形成一种关系体系。</p>

<p>继承：就是子类继承父类的属性和行为，使得子类对象可以直接具有与父类相同的属性、相同的行为。子类可以直接访问父类中的非私有的属性和行为。</p>

<p>继承的好处</p>

<p>提高代码的复用性（减少代码冗余，相同代码重复利用）。使类与类之间产生了关系。</p>

<p>继承的格式</p>

<p>通过extends关键字，可以声明一个子类继承另外一个父类，定义格式如下：</p>

<p>class 父类 {&hellip;&hellip;}class 子类 extends 父类 {&hellip;&hellip;}</p>

<p>需要注意：Java是单继承的，一个类只能继承一个直接父类，跟现实世界很像，但是Java中的子类是更加强大的</p>
</blockquote>

<blockquote>
<p>子类不能继承父类的构造器，因为子类有自己的构造器。值得注意的是子类可以继承父类的私有成员（成员变量，方法），只是子类无法直接访问而已，可以通过getter/setter方法访问父类的private成员变量。</p>
</blockquote>

