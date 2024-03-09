---
layout: post
title: "selenium 的使用（3） elements"
date: "2022-12-13"
categories: 
---
<div class="pattern-example-brief">参考：<a href="https://www.selenium.dev/documentation/webdriver/elements/finders/">https://www.selenium.dev/documentation/webdriver/elements/finders/</a></div>

<div class="pattern-example-brief">例如：有一端html：</div>

<div class="pattern-example-brief">
{% highlight %}
{% highlight %}&lt;ol id=&quot;vegetables&quot;&gt;
 &lt;li class=&quot;potatoes&quot;&gt;&hellip;
 &lt;li class=&quot;onions&quot;&gt;&hellip;
 &lt;li class=&quot;tomatoes&quot;&gt;&lt;span&gt;Tomato is a Vegetable&lt;/span&gt;&hellip;
&lt;/ol&gt;
&lt;ul id=&quot;fruits&quot;&gt;
  &lt;li class=&quot;bananas&quot;&gt;&hellip;
  &lt;li class=&quot;apples&quot;&gt;&hellip;
  &lt;li class=&quot;tomatoes&quot;&gt;&lt;span&gt;Tomato is a Fruit&lt;/span&gt;&hellip;
&lt;/ul&gt;
{% endhighlight %}

<p>为了获取其中的内容，可以使用class</p>

{% highlight %}vegetable = driver.find_element(class: &#39;tomatoes&#39;){% endhighlight %}

<p>或者使用：id + class</p>

{% highlight %}fruits = driver.find_element(id: &#39;fruits&#39;)<br />
fruit = fruits.find_element(class: &#39;tomatoes&#39;){% endhighlight %}

<p>或者使用：</p>

{% highlight %}fruit = driver.find_element(css: &#39;#fruits .tomatoes&#39;){% endhighlight %}
<p>&nbsp; 有几个用例需要获取对与定位器匹配的所有元素的引用，而不仅仅是第一个元素。&nbsp; 复数查找元素方法返回元素引用的集合。&nbsp; 如果没有匹配项，则返回一个空列表。&nbsp; 在这种情况下，将在一个集合中返回对所有水果和蔬菜列表项的引用。</p>

{% highlight %}plants = driver.find_elements(tag_name: &#39;li&#39;){% endhighlight %}
<p>获取元素</p>

{% highlight %}require &#39;selenium-webdriver&#39;<br />
driver = Selenium::WebDriver.for :firefox<br />
begin<br />
&nbsp;&nbsp;&nbsp;&nbsp; # Navigate to URL<br />
&nbsp; driver.get &#39;https://www.example.com&#39;{% endhighlight %}</p>

<p>{% highlight %}&nbsp;&nbsp;&nbsp;&nbsp; # Get all the elements available with tag name &#39;p&#39;<br />
&nbsp; elements = driver.find_elements(:tag_name,&#39;p&#39;){% endhighlight %}</p>

<p>{% highlight %}&nbsp; elements.each { |e|<br />
&nbsp;&nbsp;&nbsp; puts e.text<br />
&nbsp; }<br />
ensure<br />
&nbsp; driver.quit<br />
end{% endhighlight %}
<p>从元素中查找元素</p>

{% highlight %}&nbsp; {% highlight %}require &#39;selenium-webdriver&#39;<br />
&nbsp; driver = Selenium::WebDriver.for :chrome<br />
&nbsp; begin<br />
&nbsp;&nbsp;&nbsp; # Navigate to URL<br />
&nbsp;&nbsp;&nbsp; driver.get &#39;https://www.example.com&#39;

&nbsp;&nbsp;&nbsp; # Get element with tag name &#39;div&#39;<br />
&nbsp;&nbsp;&nbsp; element = driver.find_element(:tag_name,&#39;div&#39;)

&nbsp;&nbsp;&nbsp; # Get all the elements available with tag name &#39;p&#39;<br />
&nbsp;&nbsp;&nbsp; elements = element.find_elements(:tag_name,&#39;p&#39;)

&nbsp;&nbsp;&nbsp; elements.each { |e|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts e.text<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; ensure<br />
&nbsp;&nbsp;&nbsp; driver.quit<br />
&nbsp; end{% endhighlight %}
<p>获取活动元素</p>

{% highlight %}&nbsp;{% highlight %} require &#39;selenium-webdriver&#39;<br />
&nbsp; driver = Selenium::WebDriver.for :chrome<br />
&nbsp; begin<br />
&nbsp;&nbsp;&nbsp; driver.get &#39;https://www.google.com&#39;<br />
&nbsp;&nbsp;&nbsp; driver.find_element(css: &#39;[name=&quot;q&quot;]&#39;).send_keys(&#39;webElement&#39;)

&nbsp;&nbsp;&nbsp; # Get attribute of current active element<br />
&nbsp;&nbsp;&nbsp; attr = driver.switch_to.active_element.attribute(&#39;title&#39;)<br />
&nbsp;&nbsp;&nbsp; puts attr<br />
&nbsp; ensure<br />
&nbsp;&nbsp;&nbsp; driver.quit<br />
&nbsp; end{% endhighlight %}<br />
&nbsp;{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>

