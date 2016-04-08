---
layout: post
title: Term Weight
category: nlp
---

## Term Weighting ##

文本分词后，需要对分词后的每一个term计算一个权重。对于文本串的每个term，预测一个[0,1]的得分，得分越大则term重要性越高。Term 

Weighting的打分公式一般由三部分组成:local、global和normalization。

Term Weighting=L_{i,j}G_i N_j

L_{i,j}是term i在document j中的local weight , G_i是term i 的global weight , N_j是document j的归一化因子。

常见的local、global、normalization weight公式有:

![local](http://{{ site.host }}/assets/images/NLP1_local_weight.png "local weight")

![global](http://{{ site.host }}/assets/images/NLP1_global_weight.png "global weight")

![normal](http://{{ site.host }}/assets/images/NLP1_normlization_weight.png "normal weight")

### TF-IDF ###

tf-idf是一种最常见的term weight方法。Tf-Idf的local weight是FREQ，glocal weight是IDFB，normalization是None。tf是词频，表示这个词出现

的次数。df是文档频率，表示这个词在多少个文档中出现。idf则是逆文档频率，idf=log(TD/df)，TD表示总文档数。


{% include references.md %}
