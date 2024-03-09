---
layout: post
title: "Mysql2::Error: Column 'project_id' in where clause is ambiguous"
date: "2023-03-10"
categories: 
---
<p>把id进行精确：</p>

{% highlight %}
{% highlight %}WHERE project.id = &#39;3&#39;
{% endhighlight %}

<p>使用joins进行查询：</p>

{% highlight %}
{% highlight %}&nbsp; @emails = @emails.joins(:project).where(&quot;projects.id = ?&quot;, params[:project_id]) if params[:project_id].present?{% endhighlight %}

<p>视图页面：</p>

{% highlight %}
{% highlight %}&lt;%= form_tag emails_path, method: &#39;GET&#39; do |f| %&gt;

&nbsp; &lt;b&gt;search by project:&lt;/b&gt;&lt;br/&gt;

&nbsp; Project：&lt;%= select_tag :project_id, options_from_collection_for_select(Project.all, :id, :name, params[:project_id]), include_blank: &#39;all&#39;, class: &#39;form_select&#39; %&gt;

&nbsp; &lt;br/&gt;

&nbsp; &lt;%= submit_tag &#39;search&#39; %&gt;

&lt;% end %&gt;{% endhighlight %}

<p>&nbsp;</p>

