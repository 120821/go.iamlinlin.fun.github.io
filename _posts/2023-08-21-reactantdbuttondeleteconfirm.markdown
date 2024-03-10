---
layout: post
title: "react antd button delete confirm "
date: "2023-08-21"
categories: 
---
<p>在react中使用antd删除按钮，需要确认是否删除：(使用onclick事件进行绑定)</p>
<p>引入antd的model.confirm :</p>
{% highlight html %}import { Button, Modal, message } from &#39;antd&#39;;{% endhighlight %}
<p>{% highlight html %}完整的示例：{% endhighlight %}</p>
{% highlight html %}import React from &#39;react&#39;;
import { Button, Modal, message } from &#39;antd&#39;;
import { DeleteOutlined } from &#39;@ant-design/icons&#39;;
class MyComponent extends React.Component {
handleDeleteClick = async (id) =&gt; {
try {
Modal.confirm({
title: &#39;确认删除&#39;,
content: &#39;确定要删除吗？&#39;,
onOk: async () =&gt; {
await axios.delete(`${Config.BASE_URL}/api/v1/materials/${id}?token=${getToken()}`);
// 更新状态中的数据
const newData = this.state.data.filter(item =&gt; item.id !== id);
this.setState({ data: newData });
message.success(&#39;删除成功！&#39;);
},
onCancel: () =&gt; {
// 取消删除
},
});
} catch (error) {
console.error(error);
message.error(&#39;删除失败，请重试！&#39;);
}
};
render() {
return (
&lt;Button type=&quot;primary&quot; danger onClick={() =&gt; this.handleDeleteClick(record.id)}&gt;
&lt;DeleteOutlined /&gt;
删除
&lt;/Button&gt;
);
}
}{% endhighlight %}
<p>&nbsp;</p>
