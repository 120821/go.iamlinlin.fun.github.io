---
layout: post
title: "windows react css和小程序的css的区别"
date: "2023-12-04"
categories: 
---
<p style="margin-left:0px; margin-right:0px; text-align:start">区别：</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">1.语法:</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">react 使用css(层叠样式）</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">小程序使用类似于css的WXSS(微信小程序样式）</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">语法很类似，但是细节上还是会有些不同。</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">2.选择器：</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">react 使用各种选择器，包含： 类选择器，ID选择器，标签选择器</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">小程序使用类似于CSS的选择器，只支持部分选择器，包含类选择器和标签选择器，不包含ID选择器</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">3.样式作用范围：</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">react里px, 百分比，视窗单位（vw, vh）等，</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">小程序还支持额外的单位，如rpx(响应式像素），用于适应不同的屏幕尺寸。</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">4.样式继承</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">react可以进行样式的继承，子组件能继承父组件的样式，并通过覆盖样式来进行修改。</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">但是小程序里没有继承概念，每个组件的样式需要单独定义。</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">相同：</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">React和小程序都支持CSS预处理器（如Sass、Less）和CSS模块化（如CSS Modules），这些工具可以使样式的编写更加灵活和可维护。</p>

