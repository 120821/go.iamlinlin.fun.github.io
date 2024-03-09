---
layout: post
title: "rails delete alert message"
date: "2023-03-10"
categories: 
---
<p><a href="https://stackoverflow.com/questions/72253461/rails-7-i-cant-get-the-confirmation-message-to-show-before-record-is-successful">https://stackoverflow.com/questions/72253461/rails-7-i-cant-get-the-confirmation-message-to-show-before-record-is-successful</a></p>

<p><a href="https://stackoverflow.com/questions/36341245/delete-confirmation-rails">https://stackoverflow.com/questions/36341245/delete-confirmation-rails</a></p>

<p><code>&lt;%= link_to &#39;Delete&#39;, message_path(message),method: :delete, data: {confirm: &#39;Are you sure?&#39; }%&gt;</code></p>

<p>or</p>

<pre>
<code>&lt;%= button_to &#39;Delete&#39;, @friend, method: :delete, form: { data: { turbo_confirm: &#39;Are you sure?&#39; } }, class: &quot;btn btn-danger mx-1&quot; %&gt;</code></pre>

