---
layout: post
title: "The specified object could not be found. psql------click---清空---接口"
date: "2022-06-09"
categories: 
---

                    <p><span style="color:#fe2c24;">The specified object could not be found. psql</span></p> 
<p>直接刷新一下，或者直接新建一些数据就可以了。</p> 
<p>点击清空输入框的内容，预设的内容在鼠标点击后就会消失</p> 
<p><img alt="" height="76" src="https://img-blog.csdnimg.cn/006ead0abdbf4036b27339f4439b332f.png" width="280"></p> 
<h1 id="接口">接口</h1> 
<p>注： 接口(interface) 有若干概念：</p> 
<ol>
<li>移动开发时， app 向服务器端请求数据， 服务器端需要有接口。我们讲的就是这个。</li>
<li>编程语言的特性。例如：在java中， 需要有interface. 每个interface都要有implementation. 不仅仅在java, object c 里面，也是一样。</li>
</ol>
<p>这里说的接口，就是：设计模式中的接口。 我们不讲它。 也不建议使用java/oc 这样的语言。 编程语言中的interface, 虽然比继承( extend, inherit ）功能高级， 但是，不如mix-in好用。</p> 
<p></p> 
<pre><code>通常将接口文件写在项目的：./controllers/interface/目录下。
注：在我们的项目中，android/ios访问同一个接口，pc端直接读取后台数据库。
</code></pre> 
<h3 id="2接口的实现">2.接口的实现</h3> 
<pre><code>class Interface::CasesController &lt; ActionController::Base
  def all_cases
    all_cases = Case.all.map  do |the_case|
    { :id =&gt; the_case.id,
      :name =&gt; the_case.name,
      :desc =&gt; the_case.desc,
      :site =&gt; the_case.site,
      :layout_name =&gt; the_case.layout_name,
      :total_area =&gt; the_case.total_area,
      :package_name =&gt; the_case.package_name,
      :cover =&gt; SERVER + the_case.cover_url,
      :style =&gt; the_case.style,
      :layout =&gt; SERVER + the_case.layout.to_s,
    }
  end
    render :json =&gt; { :success =&gt;true, :result =&gt; all_cases}
  end
end
</code></pre> 
<h3 id="3接口路由的配置">3.接口路由的配置</h3> 
<pre><code>namespace :interface do
  resources :init, :only =&gt; [] do
    collection do
      get :index
      get :home_sliders
    end
  end

  resources :cases, :only =&gt; [] do
    collection do
      get :all_cases
      get :all_styles
      get :select_cases_by_style
      get :select_details_by_id
    end
  end
end
</code></pre> 
<h3 id="4最终接口的调用">4.最终接口的调用</h3> 
<pre><code>http://域名/interface/cases/all_cases
</code></pre> 
<h3 id="5返回的结果">5.返回的结果</h3> 
<pre><code>{
  success: true,
    result: [
      {
        id: 19,
        name: "混搭风，见你所见的情怀",
        desc: "世界那么大，也走过很多东方，领略过地中海长长的海岸线，抚摸过仿佛被水冲刷过的白墙，浅尝过爬藤散发出的阳光芬芳；记忆中亦或是梦里，铺满着家乡的味道。 ",
        site: "北京",
        layout_name: "二室一厅一卫一厨",
        total_area: "110",
        package_name: "老房新装包",
        cover: "http://____2_.jpg",
        style: "混搭",
        layout: "http://__.jpg"
      },
      {
        id: 20,
        name: "时尚是经典的轮回",
        desc: "17世纪爱丽舍宫在巴黎香榭丽舍大街落成，同时期一种思潮古典主义从巴黎席卷欧洲；18世纪许多新材料和工艺的问世，新古典也应运而生， 无论是古典主义还是新古典，都是向古代希腊罗马艺术的高度认同。今天古典主义、新古典依旧散发它特有光环，演绎着当下的时尚。时尚其实就是一场经典的轮回。",
        site: "北京",
        layout_name: "二室一厅二卫一厨",
        total_area: "106",
        package_name: "老房新装包",
        cover: "http://__PS.jpg",
        style: "简欧",
        layout: "http://20/05.jpg"
      }
   ]
}
</code></pre> 
<p></p> 
<p></p> 
<p></p> 
<pre><code class="language-html">&lt;script&gt;
function OnEnter( field ) { if( field.value == field.defaultValue ) { field.value = ""; } }
function OnExit( field ) { if( field.value == "" ) { field.value = field.defaultValue; } }
&lt;/script&gt;
&lt;input type=text value="你的名字" onFocus=OnEnter(this) onBlur=OnExit(this)&gt;</code></pre>
                
