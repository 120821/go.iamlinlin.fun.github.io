---
layout: post
title: "rails console 修改用户密码"
date: "2022-06-09"
categories: 
---

                    <h2>选择要修改的用户</h2> 
<p>从以上 rails console 输出中选择要修改的用户，记住其 login, 并将用户对象赋值给一个变量。</p> 
<pre><code>admin = User.find(1)</code></pre> 
<h2>设置用户对象的密码并保存</h2> 
<p>输入以下命令，设置用户对象的密码并保存：</p> 
<pre><code>admin.password = 'Easy Redmine'
admin.save!</code></pre> 
<p>注意设置的密码需要符合系统设置的规则，否则在保存时会出现错误。比如在密码过短时, 执行 admin.save! 会出现异常：</p> 
<pre><code>ActiveRecord::RecordInvalid: Validation failed: Password is too short (minimum is 8 characters)</code></pre> 
<p>只有在 <code>admin.save!</code> 返回 true 时才表示保存成功。</p> 
<h2>验证测试及退出 rails console</h2> 
<p>此时即可启动 Redmine 用查询到的 login 和 新设置的 password 进行测试了。</p> 
<p>如果没有问题，即可在 rails console 中输入执行 <code>quit</code> 退出 rails console 环境。</p>
                
