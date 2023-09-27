#  CommunicationNetworks-Prediction

## 文件功能介绍
|代码文件     |功能     |
| ------- | ------ |
|prediction.m| 代码一步执行工作区 |
|Gompertz.m| Gompertz预测模型 |
|Logistic.m| Logistic预测模型|
|drawPrediction.m| 绘制各预测模型的曲线及其预测结果 |

## Gompertz预测模型
Gompertz模型是一条渐近曲线，它反映某些经济现象一开始发展较慢，随着时间推移，其增长速度加快，当增长加快达到一定程度后，增长率逐渐减慢，最后达到饱和状态的过程。当预测对象的发展存在极限，并且有相近增长趋势时（例如移动网中的电话普及率预测），可考虑用Gompertz预测模型。
### Gompertz模型表达式如下：
$$ y_t = Se^{-Ae^{-kt}} $$
其中： 
|符号|意义|
|---|---|
|$$y_t$$|第t年的预测值|
|t|预测年数|
|S|渐近线值，一般根据经验估算|
|k,A|模型参数|

对Gompertz表达式两边取对数，可得到变换式：
$$lnln(\frac{S}{y_t})=lnA-kt$$
令:
$$y_t'=lnln(\frac{S}{y_t})$$
$$a=lnA$$
$$b=-k$$
则变换式变为线性关系: 
$$y_t'=a+bt$$
可利用线性模型拟合，计算参数a,b,进而计算模型值
$$k=-b$$
$$A=e^a$$

## Logistic预测模型
Logistic曲线又称为生长理论曲线或推理曲线，它和Gompertz曲线很类似，也是描述某些经济变量由开始增长缓慢，随后增长加快，达到一定程度后，增长率逐渐减慢，最后到达饱和状态的过程。Logistic曲线的形状为一条对称的S形曲线。
### Logistic模型数学表达式如下：
$$y_t=\frac{S}{1+Be^{-At}}$$
其中： 
|符号|意义|
|---|---|
|$$y_t$$|第t年的预测值|
|t|预测年数|
|S|渐近线值，一般根据经验估算|
|A,B|模型参数|

对Logistic表达式两边取对数，可得到变换式：
$$ln(\frac{S}{y_t}-1)=lnB-At$$
令:
$$y_t'=ln(\frac{S}{y_t}-1)$$
$$a=lnB$$
$$b=-A$$
则变换式变为线性关系: 
$$y_t'=a+bt$$
可利用线性模型拟合，计算参数a,b,进而计算模型值
$$A=-b$$
$$B=e^a$$

## 代码运行效果 

<div align=center>代码执行效果图，可看到Gompertz、Logistic、Mean模型的预测曲线</div>  
<div align=center>
<img src="https://gitee.com/qunshanhe/communication-networks-prediction/raw/master/pic/PredictionCurve1.png" width = "600" alt="图1 代码执行效果图"/>
</div> 

<div align=center>代码执行效果图，可看到Gompertz、Logistic、Mean模型的完整预测曲线</div>  
<div align=center>
<img src="https://gitee.com/qunshanhe/communication-networks-prediction/raw/master/pic/PredictionCurve2.png" width = "600" alt="图2 代码执行效果图"/>
</div> 

<div align=center>代码执行效果图，可看到Gompertz、Logistic、Mean模型的完整预测曲线及观测点</div>  
<div align=center>
<img src="https://gitee.com/qunshanhe/communication-networks-prediction/raw/master/pic/CurveWithMeasuredPoints.png" width = "600" alt="图3 代码执行效果图"/>
</div> 
