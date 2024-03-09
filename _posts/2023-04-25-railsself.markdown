---
layout: post
title: "rails self的简单使用"
date: "2023-04-25"
categories: 
---
<p>Rails 中的 self 是一个特殊的关键字，它用来引用当前对象的实例。它可以用在类方法和实例方法中，但它的行为有所不同。</p>

<p>在类方法中，self 指代当前类本身，例如：</p>

<pre>
<code>class Foo
  def self.bar
    puts &quot;Hello, I am #{self}&quot;
  end
end

Foo.bar # 输出 &quot;Hello, I am Foo&quot;</code></pre>

<p>在实例方法中，self 指代这个方法所属的对象实例，例如：</p>

<pre>
<code>class Foo
  def baz
    puts &quot;Hello, I am #{self}&quot;
  end
end

foo = Foo.new
foo.baz # 输出 &quot;Hello, I am #&lt;Foo:0x00007fae4c8d4ad0&gt;&quot;</code></pre>

<p>需要注意的是，在 Rails 中，使用 self 需要遵循一些规范，例如在模型中使用它来引用实例本身，比如：</p>

<pre>
<code>class User &lt; ApplicationRecord
  def full_name
    &quot;#{self.first_name} #{self.last_name}&quot; # 这里的 self 是可以省略的
  end
end</code></pre>

<p>但在控制器中就不能这么写，因为控制器中的实例方法是通过路由来触发的，所以不建议在控制器中使用 self 来引用当前对象实例，应该直接使用实例变量来引用，例如：</p>

<pre>
<code>class UsersController &lt; ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user # 在这里使用 current_user 代替 self
  end

  def update
    @user = current_user # 在这里使用 current_user 代替 self
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end</code></pre>

<p>总之，使用 self 时需要根据上下文语境来判断它的含义以及是否需要使用。</p>

