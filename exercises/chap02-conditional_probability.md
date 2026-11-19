# Conditioning on evidence

## Problem 1
设事件$A$表示电子邮件是垃圾邮件，则$A$的先验概率为$P(A)=0.8$，且$P(A^c)= 1-P(A)=0.2$。
设事件$B$表示出现"free money"短语，则$P(B|A)=0.1$，$P(B|A^c)=0.01$。我们想知道的是$P(A|B)$，根据贝叶斯法则和全概公式可知：

$$
\begin{align*}
P(A|B) &= \frac{P(A)P(B|A)}{P(B)} \\
&= \frac{P(A)P(B|A)}{P(A)P(B|A) + P(A^c)P(B|A^c)} \\
&= \frac{0.8*0.1}{0.8*0.1 + 0.2*0.01} \\
&\approx 0.9756
\end{align*}
$$

或者我们用**odds**形式求解：

$$
\begin{align*}
odds(A|B) &= \frac{P(A|B)}{P(A^c|B)} \\
&= \frac{P(A)P(B|A)}{P(A^c)P(B|A^c)} \\
&= \frac{0.8*0.1}{0.2*0.01} \\
&= 40
\end{align*}
$$

因此：$P(A|B) = \frac{odds(A|B)}{1+odds(A|B)} = \frac{40}{41} \approx 0.9756$。

# Independence and conditional independence

# Monty Hall

# First-step analysis and gambler's ruin

# Simpson's paradox

# Mixed practice

