---
layout: post
title: "rails parameter permit"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>公共许可证（*过滤器）<br> 返回一个新的ActionController:：Parameters实例，该实例只包含给定的筛选器，并将对象的允许属性设置为true。这有助于限制应允许哪些属性进行大规模更新。</p> 
 <pre><code>params.permit(:name)</code></pre> 
 <p><img alt="" src="https://img-blog.csdnimg.cn/537d243cb51a4a15bbb3ced809ce69b9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p>如果你想使用其他参数，需要在controller进行增加，否则不能使用。</p> 
</blockquote> 
<blockquote> 
 <p>：name 如果是参数的键，其关联值的类型为String、Symbol、NilClass、Numeric、TrueClass、FalseClass、Date、Time、StringIO、IO、+ActionDispatch:：Http:：UploadedFile+或+Rack:：Test:：UploadedFile+。否则，键：name将被过滤掉。<br> 通过将参数映射到空数组，可以声明该参数应该是允许的标量数组：</p> 
 <pre><code>params = ActionController::Parameters.new(tags: ["rails", "parameters"])
params.permit(tags: [])</code></pre> 
 <p><br> 有时，声明散列参数或其内部结构的有效密钥是不可能或不方便的。只需映射到一个空哈希：</p> 
 <pre><code>params.permit(preferences: {})</code></pre> 
 <p><a href="https://apidock.com/rails/ActionController/Parameters/permit" title="permit (ActionController::Parameters) - APIdock">permit (ActionController::Parameters) - APIdock</a></p> 
 <p>要小心，因为这会打开任意输入的大门。在这种情况下，permit确保返回的结构中的值是允许的标量，并过滤掉任何其他内容。<br> 也可以对嵌套参数使用permit，例如：</p> 
 <pre><code>params = ActionController::Parameters.new({
  person: {
    name: "Francesco",
    age:  22,
    pets: [{
      name: "Purplish",
      category: "dogs"
    }]
  }
})

permitted = params.permit(person: [ :name, { pets: :name } ])
permitted.permitted?                    # =&gt; true
permitted[:person][:name]               # =&gt; "Francesco"
permitted[:person][:age]                # =&gt; nil
permitted[:person][:pets][0][:name]     # =&gt; "Purplish"
permitted[:person][:pets][0][:category] # =&gt; nil</code></pre> 
 <p></p> 
</blockquote>
                
