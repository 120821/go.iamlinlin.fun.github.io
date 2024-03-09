---
layout: post
title: "go Function 返回 []int 和int"
date: "2023-04-25"
categories: 
---
<p>在go语言中，可以定义一个返回类型为 {% highlight %}[]int{% endhighlight %} 和 {% highlight %}int{% endhighlight %} 的函数，示例代码如下：</p>

{% highlight %}
{% highlight %}func returnSliceAndInt() ([]int, int) {
    intVar := 10
    sliceVar := []int{1, 2, 3}
    return sliceVar, intVar
}{% endhighlight %}

<p>在上述代码中，函数名为 {% highlight %}returnSliceAndInt{% endhighlight %}，该函数返回一个 {% highlight %}[]int{% endhighlight %} 类型的切片以及一个 {% highlight %}int{% endhighlight %} 类型的变量。在函数体中，定义了一个名为 {% highlight %}intVar{% endhighlight %} 的变量并初始化为 {% highlight %}10{% endhighlight %}，还定义了一个名为 {% highlight %}sliceVar{% endhighlight %} 的切片并初始化为 {% highlight %}[]int{1,2,3}{% endhighlight %}。最后，使用 {% highlight %}return{% endhighlight %} 关键字返回这两个变量。</p>

<p>在调用 {% highlight %}returnSliceAndInt{% endhighlight %} 函数时，可以同时接收返回的切片和整数变量。示例代码如下：</p>

{% highlight %}
{% highlight %}func main() {
    // 调用返回 []int 和 int 的函数
    mySlice, myInt := returnSliceAndInt()
    fmt.Println(mySlice) // 打印输出 [1 2 3]
    fmt.Println(myInt)   // 打印输出 10
}{% endhighlight %}

<p>在上述代码中，声明了 {% highlight %}mySlice{% endhighlight %} 和 {% highlight %}myInt{% endhighlight %} 两个变量，并在调用 {% highlight %}returnSliceAndInt{% endhighlight %} 函数时同时接收返回的切片和整数变量，然后打印输出。</p>

