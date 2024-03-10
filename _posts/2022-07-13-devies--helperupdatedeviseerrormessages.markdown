---
layout: post
title: "devies--helper  update devise_error_messages!"
date: "2022-07-13"
categories: 
---
<p>&nbsp;</p>
<p>DEPRECATION WARNING: [Devise] `DeviseHelper#devise_error_messages!` is deprecated and will be<br />
removed in the next major version.</p>
<p>Devise now uses a partial under &quot;devise/shared/error_messages&quot; to display<br />
error messages by default, and make them easier to customize. Update your<br />
views changing calls from:</p>
<p>&nbsp;&nbsp;&nbsp; &lt;%= devise_error_messages! %&gt;</p>
<p>to:</p>
<p>&nbsp;&nbsp;&nbsp; &lt;%= render &quot;devise/shared/error_messages&quot;, resource: resource %&gt;</p>
<p>To start customizing how errors are displayed, you can copy the partial<br />
from devise to your `app/views` folder. Alternatively, you can run<br />
`rails g devise:views` which will copy all of them again to your app.</p>
<p>进行替换即可，所有出现的部分都进行替换。</p>
