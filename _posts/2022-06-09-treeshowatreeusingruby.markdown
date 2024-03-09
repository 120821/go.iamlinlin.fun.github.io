---
layout: post
title: "显示一个 tree ( show a tree using ruby)"
date: "2022-06-09"
categories: 
---

                    <p>这里使用了递归</p> 
<p>一个ruby 的helper, Sort 的结构是：</p> 
<p>name: string, introduction:string, parent_id: integer</p> 
<pre><code class="language-ruby">module ApplicationHelper
  def show_tree members
    result = '&lt;ul&gt;'
    members.each do |member|
      invited_members = member.invited_members
      extra_text = ''
      if invited_members.count &gt; 0 
        extra_text = "(#{invited_members.count})"
      end 
      result += "&lt;li&gt;#{member.email}, #{member.name} #{extra_text}"
      if invited_members.present?
        result += show_tree invited_members
      end 
      result += '&lt;/li&gt;'
    end 
    result += '&lt;/ul&gt;'
    raw result
  end 

end</code></pre> 
<p>增加CSS样式：</p> 
<pre><code class="language-html">&lt;style&gt;
.my_tree ul, .my_tree li{ 
  position: relative;
}

.my_tree ul {
  list-style: none;
  padding-left: 32px;
}

.my_tree li::before, .my_tree li::after {
    content: ""; 
    position: absolute;
    left: -12px;
}

.my_tree li::before {
  border-top: 1px solid #000;
  top: 9px;
  width: 8px;
  height: 0;
}
.my_tree li::after {
    border-left: 1px solid #000;
    height: 100%;
    width: 0px;
    top: 2px;
}

.my_tree ul &gt; li:last-child::after {
    height: 8px;
}
&lt;/style&gt;</code></pre> 
<p>ERB文件：</p> 
<pre><code class="language-html">&lt;div class='my_tree'&gt;
  &lt;%= show_tree @team_leads  %&gt;
&lt;/div&gt;
</code></pre> 
<p></p>
                
