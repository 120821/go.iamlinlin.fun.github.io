---
layout: post
title: " `save` vs `save!` "
date: "2022-07-14"
categories: 
---
<p>参考：https://stackoverflow.com/questions/5056385/when-to-use-save-vs-save-in-model</p>

<p>https://apidock.com/rails/ActiveRecord/Base/save%21</p>

<p>https://apidock.com/rails/v5.2.3/ActiveRecord/Persistence/save</p>

<p># frozen_string_literal: true</p>

<p>class Accounts::RegistrationsController &lt; Devise::RegistrationsController<br />
&nbsp; layout &#39;front_ends&#39;<br />
&nbsp; # before_action :configure_sign_up_params, only: [:create]<br />
&nbsp; # before_action :configure_account_update_params, only: [:update]</p>

<p>&nbsp; # GET /resource/sign_up<br />
&nbsp; def new<br />
&nbsp;&nbsp;&nbsp; super<br />
&nbsp; end</p>

<p>&nbsp; # POST /resource<br />
&nbsp; def create<br />
&nbsp; #&nbsp; super<br />
&nbsp;&nbsp;&nbsp; #Account.create email: params[:email], mobile: params[:mobile], password: params[:password]<br />
&nbsp;&nbsp;&nbsp; account = Account.new<br />
&nbsp;&nbsp;&nbsp; account.mobile = params[:mobile]<br />
&nbsp;&nbsp;&nbsp; account.email = &quot;need_to_bind_#{account.mobile}@email.com&quot;<br />
&nbsp;&nbsp;&nbsp; account.password= params[:password]<br />
&nbsp;&nbsp;&nbsp; account.save!<br />
&nbsp;&nbsp;&nbsp; redirect_to &#39;/&#39;, notice: &#39;operation success&#39;<br />
&nbsp; end</p>

<p>在devise不能直接使用create，需要进行new+save！</p>

<p><code><strong>save!</strong>()</code> <em>public</em></p>

<div class="description">
<p>Saves the model.</p>

<p>If the model is <a href="https://apidock.com/rails/ActiveRecord/Base/new/class">new</a> a record gets created in the database, otherwise the existing record gets updated.</p>

<p>With <tt><a href="https://apidock.com/rails/ActiveRecord/Base/save%21">save!</a></tt> validations always run. If any of them fail <a href="https://apidock.com/rails/ActiveRecord/RecordInvalid">ActiveRecord::RecordInvalid</a> gets raised. See <a href="https://apidock.com/rails/ActiveRecord/Validations">ActiveRecord::Validations</a> for more information.</p>

<p>There&rsquo;s a series of callbacks associated with <tt><a href="https://apidock.com/rails/ActiveRecord/Base/save%21">save!</a></tt>. If any of the <tt>before_*</tt> callbacks return <tt>false</tt> the action is cancelled and <tt><a href="https://apidock.com/rails/ActiveRecord/Base/save%21">save!</a></tt> raises <a href="https://apidock.com/rails/ActiveRecord/RecordNotSaved">ActiveRecord::RecordNotSaved</a>. See <a href="https://apidock.com/rails/ActiveRecord/Callbacks">ActiveRecord::Callbacks</a> for further details.</p>

<p>&nbsp;</p>

<p><code><strong>save</strong>(*args, &amp;block)</code> <em>public</em></p>

<div class="description">
<p>Saves the model.</p>

<p>If the model is new, a record gets created in the database, otherwise the existing record gets updated.</p>

<p>By default, <a href="https://apidock.com/rails/ActiveRecord/Persistence/save">save</a> always runs validations. If any of them fail the action is cancelled and <a href="https://apidock.com/rails/ActiveRecord/Persistence/save">#save</a> returns <tt>false,</tt> and the record won&rsquo;t be saved. However, if you supply <tt>validate: false,</tt> validations are bypassed altogether. See <a href="https://apidock.com/rails/ActiveRecord/Validations">ActiveRecord::Validations</a> for more information.</p>

<p>By default, <a href="https://apidock.com/rails/ActiveRecord/Persistence/save">#save</a> also sets the <tt>updated_at/updated_on</tt> attributes to the current time. However, if you supply <tt>touch: false,</tt> these timestamps will not be updated.</p>

<p>There&rsquo;s a series of callbacks associated with <a href="https://apidock.com/rails/ActiveRecord/Persistence/save">#save</a>. If any of the <tt>before_*</tt> callbacks throws <tt>:abort</tt> the action is cancelled and <a href="https://apidock.com/rails/ActiveRecord/Persistence/save">#save</a> returns <tt>false</tt>. See <a href="https://apidock.com/rails/ActiveRecord/Callbacks">ActiveRecord::Callbacks</a> for further details.</p>

<p>Attributes marked as readonly are silently ignored if the record is being updated.</p>
</div>
</div>

