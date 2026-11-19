# Conditioning on evidence

## Problem 1
设事件$A$表示电子邮件是垃圾邮件，则$A$的先验概率为$P(A)=0.8$，
且$P(A^c)= 1-P(A)=0.2$。设事件$B$表示出现"free money"短语，
则$P(B|A)=0.1$，$P(B|A^c)=0.01$。我们想知道的是$P(A|B)$，根据贝
叶斯法则和全概公式可知：

$$
\begin{align*}
P(A|B) &= \frac{P(A)P(B|A)}{P(B)} \\
&= \frac{P(A)P(B|A)}{P(A)P(B|A) + P(A^c)P(B|A^c)} \\
&= \frac{0.8*0.1}{0.8*0.1 + 0.2*0.01} \\
&\approx 0.9756
\end{align*}
$$

或者我们用**Odds**形式求解：

$$
\begin{align*}
odds(A|B) &= \frac{P(A|B)}{P(A^c|B)} \\
&= \frac{P(A)P(B|A)}{P(A^c)P(B|A^c)} \\
&= \frac{0.8*0.1}{0.2*0.01} \\
&= 40
\end{align*}
$$

因此：$P(A|B) = \frac{odds(A|B)}{1+odds(A|B)} = \frac{40}{41} \approx 0.9756$。

## Problem 2
设事件$I$表示同卵双胞胎，概率为$P(I)=1/3$；事件$F$表示异卵双胞胎，
概率为$P(F)=2/3$。设事件$B$表示两个孩子是男孩，则有题设可知：
$P(B|I)=1/2$，$P(B|F)=1/2 \times 1/2=1/4$。我们想知道的是$P(I|B)$，
根据贝叶斯法则和全概公式：

$$
\begin{align*}
P(I|B) &= \frac{P(I)P(B|I)}{P(B)} \\
&= \frac{P(I)P(B|I)}{P(I)P(B|I) + P(F)P(B|F)} \\
&= \frac{1/3 \times 1/2}{1/3 \times 1/2 + 2/3 \times 1/4} \\
&= \frac{1}{2}
\end{align*}
$$

或者我们用**Odds**形式求解：

$$
\begin{align*}
odds(I|B) &= \frac{P(I|B)}{P(F|B)} \\
&= \frac{P(I)P(B|I)}{P(F)P(B|F)} \\
&= \frac{1/3 \times 1/2}{2/3 \times 1/4} \\
&= 1
\end{align*}
$$

因此：$P(I|B) = \frac{odds(I|B)}{1+odds(I|B)}=\frac{1}{2}$。

## Problem 3

设事件$S$表示男子吸烟，事件$C$表示男子患有肺癌。由题设可知$P(S)=0.216$，
$P(S^c)=0.784$，$\frac{P(C|S)}{P(C|S^c)}=23$。

我们计算$odds(S|C)$：

$$
\begin{align*}
odds(S|C) &= \frac{P(S)}{P(S^c)} \frac{P(C|S)}{P(C|S^c)}  \\
&= \frac{0.216}{0.784} \cdot 23 \\
&\approx 6.3367
\end{align*}
$$

所以，已知男子得了肺癌，其吸烟的概率为：$P(C|S) \approx \frac{6.3367}{1+6.3367} = 0.8637$。

## Problem 4
**(a)**

通过题设我们知道：$P(K)=p$，$P(R|K)=1$，$P(R|K^c)=1/n$。

我们求$odds(K|R)$：

$$
\begin{align*}
odds(K|R) &= \frac{P(K)P(R|K)}{P(K^c)P(R|K^c)} \\
&= \frac{p \cdot 1}{(1-p)(1/n)} \\
&= \frac{np}{1-p}
\end{align*}
$$

则$P(K|R) = \frac{\frac{np}{1-p}}{1+\frac{np}{1-p}} = \frac{np}{1-p+np}$。

**(b)**

我们比较$P(K|R)$和$P(K)$：

$$
\begin{align*}
P(K|R) - P(K) &= \frac{np}{1-p+np} - p \\
&= \frac{np - p(1-p+np)}{1-p+np} \\
&= \frac{np-p+p^2-np^2}{1-p+np} \\
&= \frac{(n-1)p - (n-1)p^2}{1-p+np} \\
&= \frac{(n-1)(p-p^2)}{1-p+np}
\end{align*}
$$

我们知道$p \le 1$且$n \ge 1$，所以$1-p+np > 0$，$n-1 \ge 0$且
$p-p^2 \ge 0$，因此$P(K|R) - P(K) \ge 0$，故$P(K|R) \ge p$。
这符合直觉，因为如果Fred选对了答案，显然他更有可能知道答案（而不是蒙对）。

当$p=1$（即Fred百分百知道答案）或者$n=1$（只有一个选项）时，$P(K|R)=p$。

## Problem 5
**使用条件概率**：

设事件$B$为第一张牌是黑桃A，事件$C$为第二张牌是梅花8，事件$A$为第三张牌是A。则我们要求的是$P(A|C,B)$，根据条件概率下的贝叶斯法则：

$$
\begin{align*}
P(A|C,B) &= \frac{P(C|A,B)P(A|B)}{P(C|B)} \\
&= \frac{1/50 \times 3/51}{1/51} \\
&= \frac{3}{50}
\end{align*}
$$


**使用对称性**：

根据对称性，对于第三张牌，所有剩下的$50$张牌都是等概率出现的，因此有
$50$种可能性，其中有$3$张是A，因此第三张牌是A的概率为$\frac{3}{50}$。


# Independence and conditional independence

# Monty Hall

# First-step analysis and gambler's ruin

# Simpson's paradox

# Mixed practice

