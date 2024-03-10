---
layout: post
title: "How to create and deploy an ERC20 token "
date: "2022-07-19"
categories: 
---
<p>参考：https://www.quicknode.com/guides/solidity/how-to-create-and-deploy-an-erc20-token</p>
<p>首先进入编译页面进行编译合约：https://remix.ethereum.org/</p>
<p>参考模板：</p>
{% highlight html %}
<span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">pragma solidity ^0.4.24;
//Safe Math Interface
contract SafeMath {
function safeAdd(uint a, uint b) public pure returns (uint c) {
c = a + b;
require(c &gt;= a);
}
function safeSub(uint a, uint b) public pure returns (uint c) {
require(b &lt;= a);
c = a - b;
}
function safeMul(uint a, uint b) public pure returns (uint c) {
c = a * b;
require(a == 0 || c / a == b);
}
function safeDiv(uint a, uint b) public pure returns (uint c) {
require(b &gt; 0);
c = a / b;
}
}
//ERC Token Standard #20 Interface
contract ERC20Interface {
function totalSupply() public constant returns (uint);
function balanceOf(address tokenOwner) public constant returns (uint balance);
function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
function transfer(address to, uint tokens) public returns (bool success);
function approve(address spender, uint tokens) public returns (bool success);
function transferFrom(address from, address to, uint tokens) public returns (bool success);
event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
//Contract function to receive approval and execute function in one call
contract ApproveAndCallFallBack {
function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}
//Actual token contract
contract QKCToken is ERC20Interface, SafeMath {
string public symbol;
string public  name;
uint8 public decimals;
uint public _totalSupply;
mapping(address =&gt; uint) balances;
mapping(address =&gt; mapping(address =&gt; uint)) allowed;
constructor() public {
symbol = &quot;QKC&quot;;
name = &quot;QuikNode Coin&quot;;
decimals = 2;
_totalSupply = 100000;
balances[YOUR_METAMASK_WALLET_ADDRESS] = _totalSupply;
emit Transfer(address(0), YOUR_METAMASK_WALLET_ADDRESS, _totalSupply);
}
function totalSupply() public constant returns (uint) {
return _totalSupply  - balances[address(0)];
}
function balanceOf(address tokenOwner) public constant returns (uint balance) {
return balances[tokenOwner];
}
function transfer(address to, uint tokens) public returns (bool success) {
balances[msg.sender] = safeSub(balances[msg.sender], tokens);
balances[to] = safeAdd(balances[to], tokens);
emit Transfer(msg.sender, to, tokens);
return true;
}
function approve(address spender, uint tokens) public returns (bool success) {
allowed[msg.sender][spender] = tokens;
emit Approval(msg.sender, spender, tokens);
return true;
}
function transferFrom(address from, address to, uint tokens) public returns (bool success) {
balances[from] = safeSub(balances[from], tokens);
allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
balances[to] = safeAdd(balances[to], tokens);
emit Transfer(from, to, tokens);
return true;
}
function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
return allowed[tokenOwner][spender];
}
function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
allowed[msg.sender][spender] = tokens;
emit Approval(msg.sender, spender, tokens);
ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
return true;
}
function () public payable {
revert();
}
}</span>{% endhighlight %}
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">进行替换内容：</span><img height="167" src="/uploads/ckeditor/pictures/106/image-20220719094529-1.png" width="896" /></p>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">Replace the symbol and name with your own:<br />
62 symbol = &quot;<strong class="font-bold">QKC</strong>&quot;;</span></p>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">63 name = &quot;<strong class="font-bold">QuikNode Coin</strong>&quot;;</span></p>
<p><br />
<span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">set the decimal (value in which tokens can be divided, 0to8 decimal units can be used) and establish a total supply value as you wish:</span></p>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">64 decimals = <strong class="font-bold">2</strong>;<br />
65 _totalSupply = <strong class="font-bold">100000</strong>;</span></p>
<div><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">&nbsp;</span></div>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">Please change YOUR_METAMASK_WALLET_ADDRESS to your own wallet address (same wallet you specified to obtain test currency):</span></p>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">66 balances[<strong class="font-bold">YOUR_METAMASK_WALLET_ADDRESS</strong>] = _totalSupply;</span></p>
<p><span class="guide-left-side__coin-guide-content__text text-grey-700" style="max-width: 100vw; overflow-x: hidden;">67 emit Transfer(address(0), <strong class="font-bold">YOUR_METAMASK_WALLET_ADDRESS</strong>, _totalSupply);</span></p>
<p>上面代码的解释：</p>
<p>第 1 行：声明solidity 版本 第 3-4 行：调用 Safe Math 接口以在我们的合约中使用数学函数。 第 29-41 行：调用 ERC-20 接口来实现其功能。 第 44-48 行：一个 Contract 函数，用于接收批准并在一次调用中执行一个函数。 第 52-56 行：启动我们的 QKCToken 合约，创建一个字符串类型的变量符号来保存我们的代币符号，一个字符串类型的变量名称来保存我们的代币名称，无符号整数类型的变量小数来保存代币划分的十进制值. 第 58-59 行：创建两个映射函数，授予用户使用这些代币的能力。 第 61-68 行：初始化构造函数，为我们的代币设置符号、名称、小数和总供应量。 声明代币的总供应量等于您钱包中该代币的余额。 第 70-72 行：函数 totalSupply 将控制我们代币的总供应量。 第 74-76 行：函数 balanceOf 将检查钱包地址的余额。 第 78-83 行：函数 transfer 将执行从总供应量到用户的代币转移。 第 85-89 行：函数批准，它将检查总供应量是否具有需要分配给用户的代币数量。 第 91-97 行：函数 transferFrom 将促进用户之间的代币转移。 第 99-101 行：功能津贴，将检查用户是否有足够的余额来执行转移给另一个用户。 第 103-108 行：函数approvalAndCall，执行代币购买和消费交易。 第 110-112 行：防止账户直接向合约发送 ETH 的后备功能，这可以防止用户在忘记提及函数名称的交易上花费 gas。</p>
<div><img height="782" src="/uploads/ckeditor/pictures/107/image-20220719094809-2.png" width="960" /></div>
<div>然后在账户点击导入代币，填写自己合约的信息，即可进行导入</div>
<div><img height="591" src="https://lh6.googleusercontent.com/S_gpl2PmozVUs7C8lKSqDxIY6BF_T7Q2MTbemxga2aAg56XVBh3lrqZbLtFIkBvrKQYGIliWY5xuThCEtYe9JLzRRLsENb6kTM3yjNoggss32bOlzk5ApSgqImXVFTsxceUL3G4h" width="352" /><img height="496" src="/uploads/ckeditor/pictures/109/image-20220719095252-5.png" width="1056" /></div>
<div>编译的时候进行选择匹配的版本，才可以正常进行编译。</div>
<div><img height="831" src="/uploads/ckeditor/pictures/108/image-20220719095052-4.png" width="1113" /></div>
