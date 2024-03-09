---
layout: post
title: "rails find_or_create_by"
date: "2023-01-29"
categories: 
---
<p><a href="https://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_create_by">https://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_create_by</a></p>

<p>Finds the first record with the given attributes, or creates a record with the attributes if one is not found:</p>

<pre>
# Find the first user named &quot;Pen&Atilde;&copy;lope&quot; or create a new one.
<a href="https://apidock.com/rails/User">User</a>.<a href="https://apidock.com/rails/ActiveRecord/Relation/find_or_create_by">find_or_create_by</a>(first_name: &#39;Pen&Atilde;&copy;lope&#39;)
# =&gt; #&lt;User id: 1, first_name: &quot;Pen&Atilde;&copy;lope&quot;, last_name: nil&gt;

# Find the first user named &quot;Pen&Atilde;&copy;lope&quot; or create a new one.
# We already have one so the existing record will be returned.
<a href="https://apidock.com/rails/User">User</a>.<a href="https://apidock.com/rails/ActiveRecord/Relation/find_or_create_by">find_or_create_by</a>(first_name: &#39;Pen&Atilde;&copy;lope&#39;)
# =&gt; #&lt;User id: 1, first_name: &quot;Pen&Atilde;&copy;lope&quot;, last_name: nil&gt;

# Find the first user named &quot;Scarlett&quot; or create a new one with
# a particular last name.
<a href="https://apidock.com/rails/User">User</a>.create_with(last_name: &#39;Johansson&#39;).<a href="https://apidock.com/rails/ActiveRecord/Relation/find_or_create_by">find_or_create_by</a>(first_name: &#39;Scarlett&#39;)
# =&gt; #&lt;User id: 2, first_name: &quot;Scarlett&quot;, last_name: &quot;Johansson&quot;&gt;
</pre>

