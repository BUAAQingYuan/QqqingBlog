---
layout: post
title:  logistic与softmax回归
category: ml
---

### logistic回归 ###

逻辑回归的假设函数为

$$ h_{\theta}(x) = \frac {1} {1 + e^{- \theta^{T} x}} $$


逻辑回归模型的参数就是$$ \theta $$，然后定义目标函数为

$$ J(\theta) =- \frac{1}{m} \left [  \sum_{i=1}^{m} y^{(i)}log h_{\theta}(x^{(i)}) +(1-y^{(i)})log(1-h_{\theta}(x^{(i)})) \right ] $$

最小化$$ J(\theta) $$ ，一般采用梯度下降算法。

### softmax回归 ###

假设多分类问题总共有k个类别，此时有

$$ h_{\theta}(x^{(i)}) =  \begin{bmatrix} p(y^{(i)}=1 \| x^{(i)};\theta) \\ p(y^{(i)}=2 \| x^{(i)};\theta) \\ ..\\ p(y^{(i)}=k \| x^{(i)};\theta) \end{bmatrix} =\frac{1}{\sum_{j=1}^{k} e^{\theta_{j}^{T}x^{(i)}}} \begin{bmatrix} e^{ \theta_{1}^{T} x^{(i)}}\\ e^{ \theta_{2}^{T} x^{(i)}}\\ ..\\ e^{ \theta_{k}^{T} x^{(i)}} \end{bmatrix} $$

softmax有k个类别， $$  e^{ \theta_{j}^{T} x^{(i)}}  $$ 为第 i 个类别的概率，然后除以它们的累加和，实现归一化，使得k个类别输出的概率和为1 。

参数 $$ \theta $$是一个矩阵，矩阵的每一行对应一个类别的参数。

$$ \theta =  \begin{bmatrix} \theta_{1}^{T} \\ \theta_{2}^{T} \\ ..\\ \theta_{k}^{T} \end{bmatrix} $$

softmax的代价函数为

$$ J(\theta) =- \frac{1}{m} \left [  \sum_{i=1}^{m} \sum_{j=1}^{k} 1 \{ y^{(i)}=j \} log \frac {e^{ \theta_{j}^{T} x^{(i)}}} { \sum_{l=1}^{k} e^{\theta_{ l }^{T}x^{(i)}}} \right ] $$

其中1{...}是一个指示性函数，当括号其中的值为真时，函数结果为1，否则结果为0 。

加上规则化项

$$ J(\theta) =- \frac{1}{m} \left [  \sum_{i=1}^{m} \sum_{j=1}^{k} 1 \{ y^{(i)}=j \} log \frac {e^{ \theta_{j}^{T} x^{(i)}}} { \sum_{l=1}^{k} e^{\theta_{l}^{T}x^{(i)}}} \right ] + \frac{ \lambda }{2} \sum_{i=1}^{k} \sum_{j=0}^{n} \theta_{ij}^{2} $$

在程序实现时，一般采用批量随机梯度下降。每遍历完一个batch的样本才计算梯度和更新参数，一个batch一般由几十到几百个样本。随机梯度下降则是一个样本更新一次。

{% include references.md %}
