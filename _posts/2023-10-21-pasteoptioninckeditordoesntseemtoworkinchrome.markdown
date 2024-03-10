---
layout: post
title: "Paste option in CKeditor doesnt seem to work in Chrome"
date: "2023-10-21"
categories: 
---
<p><a href="https://github.com/ckeditor/ckeditor4/issues/469#issuecomment-524185244">https://github.com/ckeditor/ckeditor4/issues/469#issuecomment-524185244</a></p>
<p><a href="https://stackoverflow.com/questions/44646968/paste-option-in-ckeditor-doesnt-seem-to-work-in-chrome-and-firefox">https://stackoverflow.com/questions/44646968/paste-option-in-ckeditor-doesnt-seem-to-work-in-chrome-and-firefox</a></p>
<p>ck-editor不能在谷歌浏览器粘贴图片，但是在火狐可以，修改config.js</p>
{% highlight html %}
CKEDITOR.on(&quot;instanceReady&quot;, function(event) {
event.editor.on(&quot;beforeCommandExec&quot;, function(event) {
// Show the paste dialog for the paste buttons and right-click paste
if (event.data.name == &quot;paste&quot;) {
event.editor._.forcePasteDialog = true;
}
// Don&#39;t show the paste dialog for Ctrl+Shift+V
if (event.data.name == &quot;pastetext&quot; &amp;&amp; event.data.commandData.from == &quot;keystrokeHandler&quot;) {
event.cancel();
}
})
});{% endhighlight %}
<p>&nbsp;</p>
