---
layout: post
title: "ruby 基本概念 作用域 方法的caller 和method"
date: "2022-06-09"
categories: 
---

                    <pre><code class="language-ruby"># 1. 作用域


while true do
end

while do ... end,   scope
def ... end   scope
class .. end   scope

在并列作用于的不同方法中，可以定义同样的变量名称

def say_hi1
  a = 1 
  puts a
end

def say_hi2
  a = 3 
  puts a
end

# 在嵌套的作用域中， 变量是无法定义同名的
#
def say_3

  name = "lilei"   # 定义了一个变量name

  for i in (1..10)
    name = "lili"  # 对 外层的作用于的变量，做修改。而不是定义了一个新的变量
    puts name
  end 

  puts name   #  这里显示的是被修改后的变量的内容
end

#
# 2.方法的caller 和method
#

任何方法的调用，都有一个caller 和一个method.

a = "string"
a.reverse()   # a 就是caller,  reverse()就是method
a = "string"
a.reverse()   # a 就是caller,  reverse()就是method

class Apple
  def color
    return "red"
  end
end

apple = Apple.new    #  Apple 就是 callker,   new 就是method

apple.color # =&gt; 'red'  apple 就是caller, color 就是method

a = 1
b = 2
a + b    a.+(b)  #  caller: a,  method: + , b : argument / parameter 参数
c = 3     # caller:  c ,  method:  = , 3 : argument

puts "aaaa"  # caller: 是当前环境的主线程， main , 是隐藏的。 puts: method,  "aaaa" : argument</code></pre> 
<p></p>
                
