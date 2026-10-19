# Counting

**Problem 1**. How many ways are there to permute the letters in the word MISSISSIPPI?

MISSISSIPPI含有1个M，4个I，4个S和2个P，一共11个字符。相同字母彼此是无法区分的，因此，这些字母的排列方式有：

$$
\frac{11!}{1!4!4!2!} = 34650
$$

**Problem 2**.

(a) How many 7-digit phone numbers are possible, assuming that the first digit can't be a 0 or a 1?

第1位有8中可能性（2-9），其他6位有10中可能性，所以有：$8 \times 10^6 = 8\_000\_000$

(b) Re-solve (a), except now assume also that the phone number is not allowed to start
with 911 (since this is reserved for emergency use, and it would not be desirable for the
system to wait to see whether more digits were going to be dialed after someone has
dialed 911).

以911开头的号码一共有$10^4$，因此一共有：$8 \times 10^6 - 10^4$

**Problem 3**. Fred is planning to go out to dinner each night of a certain week, Monday through
Friday, with each dinner being at one of his ten favorite restaurants.

(a) How many possibilities are there for Fred's schedule of dinners for that Monday
through Friday, if Fred is not willing to eat at the same restaurant more than once?

周一可以选10家餐厅，周二可以选9家，以此类推，总共有：$10 * 9 * 8 * 7 * 6 = 30240$ 种可能性。

(b) How many possibilities are there for Fred's schedule of dinners for that Monday
through Friday, if Fred is willing to eat at the same restaurant more than once, but is
not willing to eat at the same place twice in a row (or more)?

周一可以选10家餐厅，周二可以选9家，周三可以选9家，以此类推，总共有：$10 * 9^4 = 65610$ 种可能性。

# Story proofs

**Problem 15**. Give a story proof that $\sum_{k=0}^n \binom{n}{k} = 2^n$.

给定$n$个人，要从中选一些人组成一个队伍（选几个人无所谓，可以一个不选，也可以全选），一共有多少种可能。
那么$\binom{n}{k}$就是从$n$个人里选$k$个人的可能性，加起来就是总共的可能性。
换一种思路，对$n$个人中的每个人来说，有被选中和没被选中两种可能，因此一共是$2^n$种可能性。

# Naive definition of probability

**Problem 2**. Three people get into an empty elevator at the first floor of a building that has 10
floors. Each presses the button for their desired floor (unless one of the others has already pressed that button).
Assume that they are equally likely to want to go to floors 2 through 10 (independently of each other).
What is the probability that the buttons for 3 consecutive floors are pressed?

三个按钮连续被按的情况有：$\{2, 3, 4\}, \{3, 4, 5\}, \{4, 5, 6\}, \{5, 6, 7\}, \{6, 7, 8\}, \{7, 8, 9\}, \{8, 9, 10\}$。
而对于每种情况，三个人有$3!$种方式去按按钮。而三个人按按钮一共有$9^3$种情况，因此三个连续按钮被按的概率为：

$$
\frac{3! * 7}{9^3} \approx 0.0576
$$

# Axioms of probability

**Problem 43**. Show that for any events A and B,
$$
P(A) + P(B) - 1 \le P(A \cap B) \le P(A \cup B) \le P(A) + P(B)
$$

证明：
$$
\because P(A \cup B) = P(A) + P(B) - P(A \cap B) \\
P(A \cap B) \ge 0 \\
\therefore P(A \cup B) \le P(A) + P(B) \\

\because A \cap B \subseteq A \cup B \\
\therefore P(A \cap B) \le P(A \cup B) \\

\because

\begin{align*}
P(A \cap B) &= 1 - P((A \cap B)^C) \\
&= 1 - P(A^C \cup B^C) \\
&= 1 - (P(A^C) + P(B^C) - P(A^C \cap B^C)) \\
&= 1 - (P(A^C) + P(B^C)) + P(A^C \cap B^C) \\
&\ge 1 - (P(A^C) + P(B^C))
\end{align*} \\

P(A^C) = 1 - P(A), P(B^C) = 1 - P(B) \\

\therefore P(A) + P(B) - 1 \le P(A \cap B)
$$

# Inclusion-exclusion

**Problem 49**. A fair die is rolled n times. What is the probability that at least 1 of the 6 values never
appears?

设事件$A_i$表示数字$i$从来不会出现，则问题就是求事件$\bigcup\limits_{i=1}^{6}A_i$的概率，根据包含-排斥法则：

$$
\begin{align*}
P(\bigcup\limits_{i=1}^{6}A_i) &= \sum\limits_{i=1}^6 (-1)^{i+1} \binom{6}{i} \left(\frac{6 - i}{6}\right)^n \\
&= 6\left(\frac 5 6\right)^n - 15\left(\frac 4 6\right)^n + 20\left(\frac 3 6\right)^n - 15\left(\frac 2 6\right)^n + 6\left(\frac 1 6\right)^n
\end{align*}
$$

# Mixed practice

**Problem 56**. For each part, decide whether the blank should be filled in with $=$, $<$, or $>$, and give a clear explanation. In (a) and (b), order doesn't matter.

(a) (number of ways to choose 5 people out of 10) $>$ (number of ways to choose 6 people out of 10)

$\binom {10} {6} = \binom{10}{4} \lt \binom{10}{5}$

(b) (number of ways to break 10 people into 2 teams of 5) $<$ (number of ways to break 10 people into a team of 6 and a team of 4)

把10个人分成6人队和4人队的方式有$\binom{10}{4}$种，把10个人分成两个5人队的方式有$\frac{\binom{10}{5}} 2$种（重点在于2个五人队无法区分，所以要除以2）。

(c) (probability that all 3 people in a group of 3 were born on January 1) $<$ (probability that in a group of 3 people, 1 was born on each of January 1, 2, and 3)

三个人都出身在一月一号的概率为$\frac{1}{365^3}$，但三个人依次出生在一月一号、二号和三号的概率为$\frac{3!}{365^3}$。

Martin and Gale play an exciting game of "toss the coin",  where they toss a fair coin until the pattern *HH* occurs (two consecutive Heads) or the pattern *TH* occurs (Tails
followed immediately by Heads). Martin wins the game if and only if *HH* occurs before *TH* occurs.

(d) (probability that Martin wins) $<$ 1/2

(1) 如果第一次硬币是*T*，那么Martin肯定输。因为后续掷出*T*游戏会继续，掷出*H*他就输。
(2) 如果第一次硬币是*H*，那么看第二次掷硬币结果。如果第二次是*H*，Martin赢；如果第二次是*T*，那么又成了情况(1)，Martin肯定输。

所以综合来看，Martin赢得概率只有$1/4$。