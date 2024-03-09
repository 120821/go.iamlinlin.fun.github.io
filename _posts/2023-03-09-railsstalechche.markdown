---
layout: post
title: "rails stale （chche）"
date: "2023-03-09"
categories: 
---
<p>refer： <a href="https://api.rubyonrails.org/classes/ActionController/ConditionalGet.html#method-i-stale-3F">https://api.rubyonrails.org/classes/ActionController/ConditionalGet.html#method-i-stale-3F</a></p>

<p>在响应上设置 etag 和/或 last_modified 并根据客户端请求检查它。&nbsp; 如果请求与提供的选项不匹配，则该请求被认为是过时的，应该从头开始生成。&nbsp; 否则，它是新鲜的，我们不需要生成任何东西，并发送 304 Not Modified 的回复。<img alt="smiley" src="http://admin.linlin.fun/assets/ckeditor/plugins/smiley/images/regular_smile.png" style="height:23px; width:23px" title="smiley" /></p>

<p>param：</p>

<ol>
	<li>:etag 在响应上设置一个&ldquo;弱&rdquo;ETag 验证器。&nbsp; 请参阅 :weak_etag 选项。</li>
	<li>&nbsp;:weak_etag 在响应上设置一个&ldquo;弱&rdquo;ETag 验证器。&nbsp; 设置 If-None-Match 标头的请求如果与 ETag 完全匹配，可能会返回 304 Not Modified 响应。&nbsp; 弱 ETag 表示语义等价，而不是字节对字节的等价，因此它们适用于在浏览器缓存中缓存 HTML 页面。&nbsp; 它们不能用于必须字节相同的响应，例如在 PDF 文件中提供范围请求。</li>
	<li>&nbsp;:strong_etag 在响应上设置&ldquo;强&rdquo;ETag 验证器。&nbsp; 设置 If-None-Match 标头的请求如果与 ETag 完全匹配，可能会返回 304 Not Modified 响应。&nbsp; 强 ETag 意味着完全相等：响应必须逐字节匹配。&nbsp; 这对于在大型视频或 PDF 文件中执行范围请求是必需的，例如，或者为了与某些不支持弱 ETag 的 CDN 兼容。</li>
	<li>&nbsp;:last_modified 在响应上设置一个&ldquo;弱的&rdquo;最后更新验证器。&nbsp; 如果 last_modified &lt;= If-Modified-Since，则设置 If-Modified-Since 的后续请求可能会返回 304 Not Modified 响应。</li>
	<li>&nbsp;:public 默认情况下，Cache-Control 标头是私有的，如果您希望您的应用程序可以被其他设备（代理缓存）缓存，请将其设置为 true。</li>
	<li>&nbsp;:cache_control 给出时将覆盖现有的 Cache-Control 标头。&nbsp; 有关更多可能性，请参见 www.w3.org/Protocols/rfc2616/rfc2616-sec14.html。</li>
	<li>&nbsp;:template 默认情况下，当前控制器/操作的模板摘要包含在 ETag 中。&nbsp; 如果操作呈现不同的模板，您可以改为包含其摘要。&nbsp; 如果操作根本不呈现模板，您可以传递 template: false 以跳过任何检查模板摘要的尝试。</li>
</ol>

<p>示例：</p>

<p>1.您可以只传递一条记录。&nbsp; 在这种情况下，last_modified 将通过传递对象本身调用 updated_at 和 etag 来设置。</p>

<pre>
<code>def show
  @article = Article.find(params[:id])

  if stale?(etag: @article, last_modified: @article.updated_at)
    @statistics = @article.really_expensive_call
    respond_to do |format|
      # all the supported formats
    end
  end
end
</code></pre>

<p><code>2.</code>您还可以传递响应最大值的对象，例如活动记录的集合。&nbsp; 在这种情况下，last_modified 将通过调用集合上的 maximum(:updated_at) 来设置（最近更新记录的时间戳），并通过传递对象本身来设置 etag。</p>

<pre>
<code>def show
  @article = Article.find(params[:id])

  if stale?(@article)
    @statistics = @article.really_expensive_call
    respond_to do |format|
      # all the supported formats
    end
  end
end
</code></pre>

<pre>
<code>def index
  @articles = Article.all

  if stale?(@articles)
    @statistics = @articles.really_expensive_call
    respond_to do |format|
      # all the supported formats
    end
  end
end
</code></pre>

<p><code>3.</code>传递记录或集合时，您仍然可以设置公共标头：</p>

<pre>
<code>def show
  @article = Article.find(params[:id])

  if stale?(@article, public: true)
    @statistics = @article.really_expensive_call
    respond_to do |format|
      # all the supported formats
    end
  end
end
</code></pre>

<p>4.覆盖 Cache-Control 标头时：（这将在响应中设置 Cache-Control = public, no-cache。）</p>

<pre>
<code>def show
  @article = Article.find(params[:id])

  if stale?(@article, public: true, cache_control: { no_cache: true })
    @statistics = @articles.really_expensive_call
    respond_to do |format|
      # all the supported formats
    end
  end
end
</code></pre>

<p>5.当呈现不同于默认控制器/动作样式的模板时，您可以指示要包含在 ETag 中的摘要：</p>

<pre>
<code>def show
  super if stale? @article, template: &#39;widgets/show&#39;
end
</code></pre>

