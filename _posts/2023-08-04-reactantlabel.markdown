---
layout: post
title: "react ant 设置表单label的宽度"
date: "2023-08-04"
categories: 
---
<p>使用ant design的labelCol来修改表单的标签的宽度。例如：</p>

<pre>
<code>&lt;Form.Item
  name={&#39;initial_discharge_rate&#39;}
  label=&quot;首次充填环节-初次灌装排放率&quot;
  rules={[
    {
      required: true,
    },
  ]}
  labelCol={{ span: 8 }} // 调整标签宽度
&gt;
  {/* 表单控件 */}
&lt;/Form.Item&gt;</code></pre>

<p>如果设置不同的宽度，可以在每一个form里进行调整(上面的方法），如果设置统一的宽度，可以：</p>

<p>首先定义：</p>

<pre>
<code>const layout = {

&nbsp; labelCol: { span: 10, offset: 1 },

&nbsp; wrapperCol: { span: 16 },

};</code></pre>

<p>然后使用：</p>

<pre>
<code>&nbsp;<code>&nbsp;&nbsp;&nbsp;&nbsp; &lt;Form

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {...layout}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name=&quot;nest-messages&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; onFinish={this.onFinish}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; style={{

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxWidth: 600,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // validateMessages={validateMessages}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initialValues={data.data}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; className=&quot;custom-form&quot;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; &nbsp;</code></code></pre>

<p><code>&nbsp;</code></p>

