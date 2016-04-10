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

得到梯度公式

$$ ▽_{\theta_{j}} J(\theta) = - \frac{1}{m} \sum_{i=1}^{m} \left [  x^{(i)}( 1 \{ y^{(i)}=j \} -p(y^{(i)}=j \| x^{(i)};\theta) ) \right ] $$

$$ ▽_{\theta_{j}} J(\theta) $$是一个向量，它的第 l 个元素 $$ \frac{\partial J(\theta)}{\partial \theta_{jl}} $$是 $$ J(\theta) $$ 对 $$\theta_{j} $$的第 l 个分量的偏导数。

softmax模型中有一个特点，将每一个 $$ \theta_{j} $$减去一个向量 $$\psi $$

$$ p(y^{(i)}=j \| x^{(i)};\theta) = \frac {e^{(\theta_{j}-\psi)^{T} x^{(i)}}}{\sum_{l=1}^{k} e^{(\theta_{l}-\psi)^{T} x^{(i)}}} =\frac {e^{ \theta_{j}^{T} x^{(i)}}} { \sum_{l=1}^{k} e^{\theta_{ l }^{T}x^{(i)}}}$$

从$$\theta_{j} $$中减去$$\psi $$结果不变，表明softmax模型被过度参数化了。如果求得一组解$$(\theta_{1},\theta_{2},...,\theta_{k},) $$，那么$$(\theta_{1}-\psi,\theta_{2}-\psi,...,\theta_{k}-\psi,) $$也是一个解。同时，可以令$$ \psi=\theta_{1} $$ ，则可以去掉向量 $$\theta_{1} $$，而不影响函数。

添加规则化项后，目标函数就变成了严格的凸函数，可以保证得到唯一解。


对于多分类问题，如果类别之间是互斥的，选择softmax回归；如果不是互斥的，选择多个二分类的logistic回归，分别判断样本是否属于各个类别。


{% include references.md %}
