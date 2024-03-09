---
layout: post
title: "ruby - undefined method `gsub' for nil:NilClass"
date: "2022-11-02"
categories: 
---
<p><a href="https://stackoverflow.com/questions/11498516/undefined-method-gsub-for-nilnilclass">https://stackoverflow.com/questions/11498516/undefined-method-gsub-for-nilnilclass</a></p>

<p>A good practice is doing <code>.to_s</code> when you are using string methods.</p>

<p>有可能是识别不出字符串。保守一点就这样写吧。</p>

