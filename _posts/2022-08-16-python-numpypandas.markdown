---
layout: post
title: "Python 练习-NumPy&Pandas"
date: "2022-08-16"
categories: 
---
<p><a href="https://www.highcharts.com.cn/demo/highcharts">官网 highcharts</a></p>

<p>1、问答题&nbsp;（5分）&nbsp;导入numpy库并取别名为np<br />
import numpy as np #导入numpy库并取别名为np<br />
array=np.array([[1,2,3],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [4,5,6],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [7,8,9]])#新建一个数组</p>

<p>print(array)#输出数组<br />
[[1 2 3]<br />
&nbsp;[4 5 6]<br />
&nbsp;[7 8 9]]</p>

<p>2、问答题&nbsp;（5分）&nbsp;创建数组的常用方法举例，特殊数组和普通数组的创建方法各举两例<br />
c=np.array([1,2,3])#创建一维数组<br />
print(c)<br />
[1 2 3]<br />
d=np.array([[1,2,3],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [4,5,6]])#创建二维数组（矩阵）**[[[1,2,3]]]三维数组<br />
print(d)<br />
[[1 2 3]<br />
&nbsp;[4 5 6]]<br />
h=np.arange(8).reshape((2,4))#reshape方法可以指定生成数组的维度，（行，列）<br />
print(h)<br />
[[0 1 2 3]<br />
&nbsp;[4 5 6 7]]<br />
empty=np.empty((3,2))#创建指定行列数量的数值全接近于0数组（但不等于0）<br />
print(empty)<br />
[[2.33e-321 2.33e-321]<br />
&nbsp;[5.89e-321 5.89e-321]<br />
&nbsp;[6.03e-321 6.03e-321]]<br />
3、问答题&nbsp;（5分）&nbsp;查看数组属性的几种常用方法，如查看维度、形状、长度与数据类型<br />
import numpy as np &nbsp;<br />
a1 = np.array([1,2,3,4],dtype=np.complex128) &nbsp;<br />
print(a1) &nbsp;<br />
print(&quot;数据类型&quot;,type(a1))&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #打印数组数据类型 &nbsp;<br />
print(&quot;数组元素数据类型：&quot;,a1.dtype) #打印数组元素数据类型 &nbsp;<br />
print(&quot;数组元素总数：&quot;,a1.size)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #打印数组尺寸，即数组元素总数 &nbsp;<br />
print(&quot;数组形状：&quot;,a1.shape)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #打印数组形状 &nbsp;<br />
print(&quot;数组的维度数目&quot;,a1.ndim)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #打印数组的维度数目 &nbsp;</p>

<p>[1.+0.j 2.+0.j 3.+0.j 4.+0.j]<br />
数据类型 &lt;class &#39;numpy.ndarray&#39;&gt;<br />
数组元素数据类型： complex128<br />
数组元素总数： 4<br />
数组形状： (4,)<br />
数组的维度数目 1</p>

<p>4、问答题&nbsp;（5分）&nbsp;创建长度为10的零向量 注：向量指具有大小和方向的量<br />
Z = np.zeros(10)<br />
print (Z)<br />
5、问答题&nbsp;（5分）&nbsp;创建一个值域为10到49的向量<br />
Z = np.arange(10, 50)<br />
print (Z)<br />
6、问答题&nbsp;（5分）&nbsp;创建一个向量后将其反转(第一个元素变为最后一个)<br />
Z = np.arange(50)<br />
Z = Z[::-1]<br />
print (Z)<br />
7、问答题&nbsp;（5分）&nbsp;创建一个3x3的单位矩阵 注：矩阵是一个按照长方阵列排列的复数或实数集合<br />
Z = np.arange(9).reshape(3, 3)<br />
print (Z)<br />
8、问答题&nbsp;（5分）&nbsp;创建一个长度为30的随机向量，并求它的平均值<br />
Z = np.random.random(30)<br />
mean = Z.mean()<br />
print (mean)<br />
9、问答题&nbsp;（5分）&nbsp;试实现对5x5随机矩阵的归一化<br />
Z = np.random.random((5, 5))<br />
Zmax, Zmin = Z.max(), Z.min()<br />
Z = (Z-Zmin)/(Zmax-Zmin)<br />
print (Z)<br />
10、问答题&nbsp;（5分）&nbsp;从命令行得到numpy中add函数的说明文档<br />
np.info(np.add)<br />
11、问答题&nbsp;（5分）&nbsp;导入 Pandas 库并简写为 pd<br />
import pandas as pd<br />
pd.__version__</p>

<p>12、问答题&nbsp;（5分）&nbsp;从列表创建Series<br />
import numpy as np<br />
import pandas as pd</p>

<p>temp = np.arange(0, 6)<br />
data = pd.Series(temp)<br />
print(data)</p>

<p><br />
13、问答题&nbsp;（5分）&nbsp;从字典创建Series<br />
import numpy as np<br />
import pandas as pd</p>

<p>temp = {&#39;a&#39;: 1,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;b&#39;: 3}<br />
data = pd.Series(temp)<br />
print(data)</p>

<p>14、问答题&nbsp;（5分）&nbsp;从numpy数组创建DataFrame<br />
import numpy as np<br />
import pandas as pd</p>

<p>temp = np.arange(0,6)<br />
data = pd.DataFrame(temp, index=[&#39;a&#39;, &#39;b&#39;, &#39;c&#39;, &#39;d&#39;, &#39;e&#39;, &#39;f&#39;],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; columns=[&#39;temp&#39;])<br />
print(data)</p>

<p>15、问答题&nbsp;（5分）&nbsp;如何发现、剔除和填充缺失值？<br />
发现：<br />
&nbsp;&nbsp; df.info()<br />
&nbsp;&nbsp; df[&#39;col_name&#39;].isnull()&nbsp;&nbsp; #但数据量多时用这条看不清楚...<br />
剔除：<br />
df.dropna(thresh=len(df)*0.8, axis=1)<br />
#thresh参数含义，某行或某列起码有thresh个非NA数。<br />
#以上表示如某列缺失值超过20%,则删除</p>

<p>df.dropna(how=&#39;all&#39;)<br />
#删除空行，默认为df.dropna(how=&#39;any&#39;), 只要行中有NA，就会删除整行。<br />
填充：<br />
&nbsp;&nbsp;&nbsp; df.fillna({&#39;colA&#39;:&#39;fill_value1&#39;, &#39;colB&#39;:&#39;fill_value2&#39;})<br />
&nbsp;&nbsp;&nbsp; #对不同的列填充不同的值<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; df.fillna(method=&#39;ffill&#39;, inplace=True)<br />
&nbsp;&nbsp;&nbsp; #用前一行填充<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; df.fillna({&#39;colA&#39;:df[&#39;colA&#39;].mode(), &#39;colB&#39;:test[&#39;colB&#39;].mean()})<br />
&nbsp;&nbsp;&nbsp; #用众数，平均数分别填充</p>

<p>章节五练习-Python可视化<br />
1.问答题&nbsp;（33分）&nbsp;【人事管理数据工资水平可视化】题目要求：1、导入数据和工具包，绘制不同性别、不同部门、不同学历、不同职称的平均薪资水平数据<br />
import pandas as pd<br />
df = pd.read_excel(&#39;pandas120.xlsx&#39;)<br />
print(df.groupby(&#39;学历&#39;).mean())<br />
print(df.groupby(&#39;性别&#39;).mean())<br />
print(df.groupby(&#39;职称&#39;).mean())<br />
print(df.groupby(&#39;部门&#39;).mean())</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>2、绘制工资水平频率分布直方图</p>

<p>3、绘制工资水平密度曲线</p>

<p>附件：人事管理数据.xlsx<br />
2.问答题&nbsp;（33分）&nbsp;【餐厅小费情况可视化分析（利用Seaborn包实现）】题目要求：<br />
1、导入seaborn工具包并加载其自带的&quot;tip&quot;数据集，查看前几行的数据情况<br />
import seaborn as sb<br />
df = sb.load_dataset(&#39;tips&#39;)<br />
print df.head()</p>

<p>2、小费与总消费关系可视化分析&mdash;&mdash;绘制小费与总消费数据的散点图，并附有回归线</p>

<p>3、小费与性别、抽烟与否关系可视化分析&mdash;&mdash;绘制不同性别、抽烟与否人群所付小费情况的箱线图<br />
4、小费与就餐时间、就餐人数关系可视化分析&mdash;&mdash;绘制不同就餐时间、不同就餐人数所付小 费情况的小提琴图提示：<br />
1、使用load_dataset( )方法加载数据集数据字段说明：total_bill&mdash;总消费tip&mdash;消费sex&mdash;性别smoker&mdash;吸烟与否day&mdash;就餐星期time&mdash;就餐时间size&mdash;就餐人数<br />
2、lmplot( )方法<br />
3、boxplot( )方法<br />
4、小提琴图既保留了箱线图的优势，又可以显示出每个y轴数据的概率。提示：violinplot方法5、x轴为性别，y轴为小费，抽烟与否为分组变量；使用barplot( )方法，分组用参数hue实现。<br />
3.问答题&nbsp;（34分）&nbsp;【航班乘客变化可视化分析】题目要求：<br />
1、导入：matplotlib包中的pyplot工具、seaborn工具包、numpy库、pandas库加载数据：seaborn工具包中自带的&quot;fl ights&quot;数据集查看前几行数据数据字段说明：year&mdash;年份month&mdash;月份passengers&mdash;乘客数量<br />
2、航班乘客数量年度变化可视化分析&mdash;&mdash;绘制不同年份乘客数量变化的折线图，要求为坐标轴加标签说明以及为图表加上标题。提示：要先整理数据，对不同年份的乘客数量进行分类汇总。<br />
3、航班乘客数量月度差异可视化分析&mdash;&mdash;绘制任一年份各月份的乘客数量分布直方图，同样要加标签和标题。另外，为横坐标添加数据标签，格式为原月份数据的前三个字母，如1月为Jan，2月为Feb,...</p>

