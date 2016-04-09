---
layout: post
title:  logistic与softmax回归
category: ml
---

### logistic回归 ###

逻辑回归的假设函数为

$$ h_{\theta}(x) =\frac{1}{1+e^{-\theta^{T}x} $$

逻辑回归模型的参数就是$$ \theta $$，然后定义目标函数为

$$ J(\theta) =- \frac{1}{m} \left [  \sum_{i=1}^{m} y^{(i)}log h_{\theta}(x^{(i)}) +(1-y^{(i)})log(1-h_{\theta}(x^{(i)})) \right ] $$

最小化$$ J(\theta) $$ ，一般采用梯度下降算法。

### softmax回归 ###

假设多分类问题总共有k个类别，此时有

$$ h_{\theta}(x^{(i)}) =  \begin{bmatrix} p(y^{(i)}=1 \| x^{(i)};\theta) \ p(y^{(i)}=2 \| x^{(i)};\theta) \ ..\ p(y^{(i)}=k \| x^{(i)};\theta) \end{bmatrix =\frac{1}{\sum_{j=1}^{k} e^{\theta_{j}^{T}x^{(i)}}  }$$


{% include references.md %}
