---
layout: post
title: "GraphQL的基本使用 Queries 和 Mutations"
date: "2022-06-09"
categories: 
---

                    <h1>GraphQL</h1> 
<p><a class="has-card" href="https://graphql.org/" title="GraphQL | A query language for your API"><span class="link-card-box"><span class="link-title">GraphQL | A query language for your API</span><span class="link-link"><img class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD" alt="icon-default.png?t=M4AD">https://graphql.org/</span></span></a>GraphQL 是一种用于 API 的查询语言，也是一种服务器端运行时，用于使用您为自己定义的类型系统执行查询 数据。 GraphQL 不依赖于任何特定的数据库或存储引擎，而是由您现有的代码和数据支持。</p> 
{% highlight %}type Query {
  me: User
}

type User {
  id: ID
  name: String
}{% endhighlight %} 
<p>以及每种类型的每个字段的功能：</p> 
{% highlight %}function Query_me(request) {
  return request.auth.user;
}

function User_name(user) {
  return user.getName();
}{% endhighlight %} 
<p>GraphQL 服务运行后（通常在 Web 服务上的 URL 处），它可以接收 GraphQL 查询以进行验证和执行。 该服务首先检查查询以确保它仅引用定义的类型和字段，然后运行提供的函数 产生一个结果。</p> 
<p>例如，查询：</p> 
{% highlight %}{
  me {
    name
  }
}{% endhighlight %} 
<p>可以产生以下 JSON 结果：</p> 
{% highlight %}{
  "me": {
    "name": "Luke Skywalker"
  }
}{% endhighlight %} 
<p>字段</p> 
<p>最简单的，GraphQL 是关于询问对象的特定字段。 让我们从一个非常简单的查询和运行它时得到的结果开始： <img alt="" height="129" src="https://img-blog.csdnimg.cn/f4a18d11d6ee48cba5b8e417a5f5abef.png" width="649"></p> 
<p>The field {% highlight %}name{% endhighlight %} returns a {% highlight %}String{% endhighlight %} type, in this case the name of the main hero of Star Wars, {% highlight %}"R2-D2"{% endhighlight %}.</p> 
<p>在前面的示例中，我们只询问了返回 String 的英雄的名字，但字段也可以引用 Objects。 在这种情况下，您可以 <em>子选择 </em>为该对象进行字段 GraphQL 查询可以遍历相关对象及其字段，让客户端在一个请求中获取大量相关数据，而不是像经典 REST 架构中那样进行多次往返。<img alt="" height="187" src="https://img-blog.csdnimg.cn/630df1dd7c4a4b0f98d07ccf78304959.png" width="650"> </p> 
<p>参数</p> 
<p>如果我们唯一能做的就是遍历对象及其字段，那么 GraphQL 已经是一种非常有用的数据获取语言。 但是，当您添加将参数传递给字段的功能时，事情会变得更加有趣。<img alt="" height="155" src="https://img-blog.csdnimg.cn/48a14cf5ca5941dea43efdc79d334ad9.png" width="738"></p> 
<p>在像 REST 这样的系统中，您只能传递一组参数——请求中的查询参数和 URL 段。 但是在 GraphQL 中，每个字段和嵌套对象都可以获取自己的一组参数，这使得 GraphQL 完全替代了进行多个 API 获取。 您甚至可以将参数传递给标量字段，以便在服务器上实现一次数据转换，而不是分别在每个客户端上实现。 <img alt="" height="148" src="https://img-blog.csdnimg.cn/af164ab6eeab45f399c86c174bd2a3ed.png" width="691"> </p> 
<p>参数可以有许多不同的类型。 在上面的示例中，我们使用了 Enumeration 类型，它表示一组有限的选项之一（在这种情况下，长度单位，或者 {% highlight %}METER{% endhighlight %}或者 {% highlight %}FOOT{% endhighlight %}）。 GraphQL 带有一组默认类型，但 GraphQL 服务器也可以声明自己的自定义类型，只要它们可以序列化为您的传输格式。 <a href="https://graphql.org/learn/schema" title="Schemas and Types | GraphQL">Schemas and Types | GraphQL</a> </p> 
<p>Aliases</p> 
<p>如果你有敏锐的眼光，你可能已经注意到，由于结果对象字段与查询中的字段名称匹配但不包含参数，因此不能直接查询具有不同参数的同一字段。 这就是您需要 <em>别名 </em>- 它们让您可以将字段的结果重命名为您想要的任何内容。</p> 
<p><img alt="" height="173" src="https://img-blog.csdnimg.cn/394a24e9d04644f0aca9060f68b951b9.png" width="682"></p> 
<p>假设我们的应用中有一个相对复杂的页面，可以让我们并排查看两个英雄以及他们的朋友。 您可以想象这样的查询很快就会变得复杂，因为我们需要至少重复一次字段 - 比较的每一侧都有一个。</p> 
<p></p> 
<p>fragment</p> 
<p>这就是 GraphQL 包含称为 <em>片段 </em>。 片段让您可以构建字段集，然后将它们包含在您需要的查询中。 这是一个如何使用片段解决上述情况的示例：</p> 
<p> 查询结果：您可以看到如果重复字段，上述查询将如何重复。 片段的概念经常用于将复杂的应用程序数据需求拆分为更小的块，尤其是当您需要将许多具有不同片段的 UI 组件组合到一个初始数据提取中时。</p> 
{% highlight %}{
  "data": {
    "leftComparison": {
      "name": "Luke Skywalker",
      "appearsIn": [
        "NEWHOPE",
        "EMPIRE",
        "JEDI"
      ],
      "friends": [
        {
          "name": "Han Solo"
        },
        {
          "name": "Leia Organa"
        },
        {
          "name": "C-3PO"
        },
        {
          "name": "R2-D2"
        }
      ]
    },
    "rightComparison": {
      "name": "R2-D2",
      "appearsIn": [
        "NEWHOPE",
        "EMPIRE",
        "JEDI"
      ],
      "friends": [
        {
          "name": "Luke Skywalker"
        },
        {
          "name": "Han Solo"
        },
        {
          "name": "Leia Organa"
        }
      ]
    }
  }
}
{% endhighlight %} 
<p>片段可以访问查询或突变中声明的变量<img alt="" height="416" src="https://img-blog.csdnimg.cn/9d3b6b5a0e464c199b61daefb0fa9377.png" width="696"></p> 
{% highlight %}{
  "data": {
    "leftComparison": {
      "name": "Luke Skywalker",
      "friendsConnection": {
        "totalCount": 4,
        "edges": [
          {
            "node": {
              "name": "Han Solo"
            }
          },
          {
            "node": {
              "name": "Leia Organa"
            }
          },
          {
            "node": {
              "name": "C-3PO"
            }
          }
        ]
      }
    },
    "rightComparison": {
      "name": "R2-D2",
      "friendsConnection": {
        "totalCount": 3,
        "edges": [
          {
            "node": {
              "name": "Luke Skywalker"
            }
          },
          {
            "node": {
              "name": "Han Solo"
            }
          },
          {
            "node": {
              "name": "Leia Organa"
            }
          }
        ]
      }
    }
  }
}{% endhighlight %} 
<p> </p> 
<p>到目前为止，我们一直在使用简写语法，我们省略了 {% highlight %}query{% endhighlight %}关键字和查询名称，但在生产应用程序中，使用它们可以使我们的代码不那么模棱两可。</p> 
<p>这是一个包含关键字的示例 {% highlight %}query{% endhighlight %}作为 <em>操作类型 </em>和 {% highlight %}HeroNameAndFriends{% endhighlight %}作为 <em>操作名称 </em>： </p> 
<p>GraphQL 有一种一流的方式将动态值从查询中分解出来，并将它们作为单独的字典传递。 这些值称为 <em>变量 </em>。</p> 
<p>当我们开始使用变量时，我们需要做三件事：</p> 
<ol>
<li>将查询中的静态值替换为 {% highlight %}$variableName{% endhighlight %}
</li>
<li>宣布 {% highlight %}$variableName{% endhighlight %}作为查询接受的变量之一</li>
<li>经过 {% highlight %}variableName: value{% endhighlight %}在单独的、特定于传输的（通常是 JSON）变量字典中</li>
</ol>
<p>这是它的样子： </p>
                
