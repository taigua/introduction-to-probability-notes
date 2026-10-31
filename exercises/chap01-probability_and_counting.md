# Counting

## Problem 1
How many ways are there to permute the letters in the word MISSISSIPPI?

**解答**：

MISSISSIPPI含有1个M，4个I，4个S和2个P，一共11个字符。相同字母彼此是无法区分的，因此，这些字母的排列方式有：

$$
\frac{11!}{1!4!4!2!} = 34650
$$

## Problem 2

**(a)** How many 7-digit phone numbers are possible, assuming that the first digit can't be a 0 or a 1?

**解答**：

第1位有8中可能性（2-9），其他6位有10中可能性，所以有：$8 \times 10^6 = 8\_000\_000$。

**(b)** Re-solve (a), except now assume also that the phone number is not allowed to start
with 911 (since this is reserved for emergency use, and it would not be desirable for the
system to wait to see whether more digits were going to be dialed after someone has
dialed 911).

**解答**：

以911开头的号码一共有$10^4$，因此一共有：$8 \times 10^6 - 10^4$

## Problem 3
Fred is planning to go out to dinner each night of a certain week, Monday through
Friday, with each dinner being at one of his ten favorite restaurants.

**(a)** How many possibilities are there for Fred's schedule of dinners for that Monday
through Friday, if Fred is not willing to eat at the same restaurant more than once?

**解答**：

周一可以选10家餐厅，周二可以选9家，以此类推，总共有：$10 * 9 * 8 * 7 * 6 = 30240$ 种可能性。

**(b)** How many possibilities are there for Fred's schedule of dinners for that Monday
through Friday, if Fred is willing to eat at the same restaurant more than once, but is
not willing to eat at the same place twice in a row (or more)?

**解答**：

周一可以选10家餐厅，周二可以选9家，周三可以选9家，以此类推，总共有：$10 * 9^4 = 65610$ 种可能性。

## Problem 4
A *round-robin tournament* is being held with n tennis players; this means that every
player will play against every other player exactly once.

**(a)** How many possible outcomes are there for the tournament (the outcome lists out
who won and who lost for each game)?

**解答**：

一共有$\binom n 2$场比赛，每个比赛有两种结果（A赢或者A输），所以一共有$2^{\binom n 2}$种结果。

**(b)** How many games are played in total?

**解答**：

每两个人要比赛一场，所以一共有$\binom n 2$场比赛

## Problem 5
A *knock-out tournament* is being held with $2^n$ tennis players. This means that for each
round, the winners move on to the next round and the losers are eliminated, until only
one person remains. For example, if initially there are $2^4 = 16$ players, then there are
8 games in the first round, then the 8 winners move on to round 2, then the 4 winners
move on to round 3, then the 2 winners move on to round 4, the winner of which is
declared the winner of the tournament. (There are various systems for determining who
plays whom within a round, but these do not matter for this problem.)

**(a)** How many rounds are there?

**解答**：

每轮淘汰掉一半人，所以一共有$\log 2^n = n$轮。

**(b)** Count how many games in total are played, by adding up the numbers of games
played in each round.

**解答**：

第一轮$2^{n-1}$场比赛，第二轮$2^{n-2}$场比赛，以此类推，总共有$\sum\limits_{i=0}^{n-1} 2^{i} = 2^n - 1$场比赛。

**(c)** Count how many games in total are played, this time by directly thinking about it
without doing almost any calculation.
Hint: How many players need to be eliminated?

**解答**：

每场比赛淘汰掉一个人，一共需要淘汰至只剩一个人，所以一共$2^n - 1$场比赛。

## Problem 6
There are 20 people at a chess club on a certain day. They each find opponents and
start playing. How many possibilities are there for how they are matched up, assuming
that in each game it does matter who has the white pieces (in a chess game, one player
has the white pieces and the other player has the black pieces)?

**解答**：

(1) 从20个人里面挑10个人执白子，让他们分别挑选自己的对手，因此一共有$\binom{20}{10} \times 10!$种可能。

(2) 把20个人排成一排，相邻的两个组成一组，则有$20!$种可能性，但是组的顺序不重要，所以一共有$\frac{20!}{10!}$种可能。

(3) 从20个人里挑2个人排列，再从18个人里挑2个人排列，以此类推，生成10个组，10个组的顺序不重要，所以一共有
$\frac{(20)_2(18)_2(16)_2...(2)_2}{10!} = \frac{20!}{10!}$种可能。

## Problem 7
Two chess players, A and B, are going to play 7 games. Each game has three possible
outcomes: a win for A (which is a loss for B), a draw (tie), and a loss for A (which is
a win for B). A win is worth 1 point, a draw is worth 0.5 points, and a loss is worth 0
points.

**(a)** How many possible outcomes for the individual games are there, such that overall player A ends up
with 3 wins, 2 draws, and 2 losses?

**解答**：

从7场比赛里选3场作为赢，从4场比赛里选2场作为平，剩下2场作为输：$\binom{7}{3}\binom{4}{2} = 84$。

**(b)** How many possible outcomes for the individual games are there, such that A ends up with 4 points and
B ends up with 3 points?

**解答**：

A拿到4分的方法有：赢4场，赢3场平2场，赢2场平4场，赢1场平6场。

结果数量：$\binom{7}{4} + \binom{7}{3}\binom{4}{2} + \binom{7}{2}\binom{5}{4} + \binom{7}{1}\binom{6}{6} = 357$

**(c)** Now assume that they are playing a best-of-7 match, where the match will end when either player has 4 points
or when 7 games have been played, whichever is first. For example, if after 6 games the score is 4 to 2 in favor
of A, then A wins the match and they don't play a 7th game. How many possible outcomes for the individual games
are there, such that the match lasts for 7 games and A wins by a score of 4 to 3?

**解答**：

从(b)的思路中我们得知，A拿到4分的方法有：赢4场，赢3场平2场，赢2场平4场，赢1场平6场。要想让比赛持续7场，那么针对以上4中情况，
A必须在最后一场赢或者平。

对于赢4场，有：$\binom{6}{3}$

对于赢3场平2场，有：$\binom{6}{3}\binom{3}{1} + \binom{6}{2}\binom{4}{2}$

对于赢2场平4场， 有：$\binom{6}{1}\binom{5}{4} + \binom{6}{3}\binom{3}{2}$

对于赢1场平6场， 有：$\binom{7}{1}$

结果数量：$\binom{6}{3} + \binom{6}{3}\binom{3}{1} + \binom{6}{2}\binom{4}{2} + \binom{6}{1}\binom{5}{4} + 
\binom{6}{3}\binom{3}{2} + \binom{7}{1} = 267$

## Problem 8

**(a)** How many ways are there to split a dozen people into 3 teams, where one team
has 2 people, and the other two teams have 5 people each?

**解答**：

从12个人中选2个：$\binom{12}{2}$，从剩下的10个人里面选5个：$\binom{10}{5}$，剩下5个人组成第三队。
但因为两个5人队无法区分，因此一共有：$\binom{12}{2}\binom{10}{5}/2! = 8316$

或者直接套用分组公式：$\frac{12!}{2!5!5!2!}$

**(b)** How many ways are there to split a dozen people into 3 teams, where each team has 4 people?

**解答**：

从12个人中选4个：$\binom{12}{4}$，从剩下的8个人里面选4个：$\binom{8}{4}$，剩下4个人组成第三队。
但因为三个4人队无法区分，因此一共有：$\binom{12}{4}\binom{8}{4}/3! = 5775$

或者直接套用分组公式：$\frac{12!}{4!4!4!3!}$

## Problem 9
**(a)** How many paths are there from the point (0, 0) to the point (110, 111) in the plane such that each
step either consists of going one unit up or one unit to the right?

**解答**：

从(0, 0)到达(110, 111)需要总共走221步，其中110步向右，剩下的111步向上，所以一共有$\binom{221}{110}$种路径。

**(b)** How many paths are there from (0, 0) to (210, 211), where each step consists of going one unit up
or one unit to the right, and the path has to go through (110, 111)?

**解答**：

到达(110, 111)有$\binom{221}{110}$种路径，同理，从(110, 111)到达(210, 211)有$\binom{200}{100}$种路径，
一共有$\binom{221}{110}\binom{200}{100}$种路径。

## Problem 10
To fulfill the requirements for a certain degree, a student can choose to take any 7 out of
a list of 20 courses, with the constraint that at least 1 of the 7 courses must be a statistics course. 
Suppose that 5 of the 20 courses are statistics courses.

**(a)** How many choices are there for which 7 courses to take?

**解答**：

从20门课程里选7门一共有$\binom{20}{7}$种方式，7门课不包含统计课一共有$\binom{15}{7}$种方式，所以要拿到学位，
一共有$\binom{20}{7} - \binom{15}{7}$种方式。

**(b)** Explain intuitively why the answer to (a) is *not* $\binom{5}{1}\cdot\binom{19}{6}$.

**解答**：

这种算法会导致重复计数，比如：

- 从5门统计课中选了Stat110，从剩余19门课中选了Stat210, C1, C2, C3, C4, C5，选课结果为：Stat110, Stat210, C1-C5。
- 从5门统计课中选了Stat210，从剩余19门课中选了Stat110, C1, C2,
C3, C4, C5，选课结果为：Stat210, Stat110, C1-C5。

这两种情况是重复的，而(b)的计算方式无法排除这种重复。

## Problem 11
Let $A$ and $B$ be sets with $|A| = n, |B| = m$.

**(a)** How many functions are there from $A$ to $B$ (i.e., functions with domain $A$, assigning
an element of $B$ to each element of $A$)?

**解答**：

对于$A$中的每个值，都有$m$种选择，所以一共有$m^n$个函数。

**(b)** How many one-to-one functions are there from $A$ to $B$? (See Section A.2.1 of the
math appendix for information about one-to-one functions.)

**解答**：

如果$n > m$，至少两个$A$中的值要映射到同一个$B$中的值，则不存在一对一函数。

如果$n \le m$，则意味着从$m$中取$n$个值进行排列，有$(m)_n$个函数。

## Problem 12
Four players, named A, B, C, and D, are playing a card game. A standard, well-shuffled
deck of cards is dealt to the players (so each player receives a 13-card hand).

**(a)** How many possibilities are there for the hand that player A will get? (Within a
hand, the order in which cards were received doesn't matter.)

**解答**：

从52张牌中选13张：$\binom{52}{13}$

**(b)** How many possibilities are there overall for what hands everyone will get, assuming
that it matters which player gets which hand, but not the order of cards within a hand?

**解答**：

这就是把52张牌分成4个可区分的组：$\frac{52!}{13!13!13!13!}$。

或者从52张牌中抽13张给A，从剩余39张牌中抽13张给B，以此类推：$\binom{52}{13}\binom{39}{13}\binom{26}{13}\binom{13}{13}$。

**(c)** Explain intuitively why the answer to Part (b) is not the fourth power of the answer
to Part (a).

**解答**：

因为这是无替代抽样，如果是$\binom{52}{13}^4$，则是有替代抽样。

## Problem 13
A certain casino uses 10 standard decks of cards mixed together into one big deck, which
we will call a *superdeck*. Thus, the superdeck has $52 \cdot 10 = 520$ cards, with $10$ copies
of each card. How many different $10$-card hands can be dealt from the superdeck? The
order of the cards does not matter, nor does it matter which of the original 10 decks
the cards came from. Express your answer as a binomial coefficient.

*Hint: Bose-Einstein.*

**解答**：

每张牌都有10张替代，而取10张卡，因此可视作52张牌的有替代无序抽样，
根据*Bose-Einstein*有：$\binom{52 + 10 - 1}{10}=\binom{61}{10}$。

## Problem 14
You are ordering two pizzas. A pizza can be small, medium, large, or extra large, with
any combination of 8 possible toppings (getting no toppings is allowed, as is getting all
8). How many possibilities are there for your two pizzas?

**解答**：

披萨大小有4种，馅料有$2^8$种，因此一共有$4*2^8=1024$种披萨。题目相当于从$1024$种披萨里有替代地
选两个，根据*Bose-Einstein*有：$\binom{1024+2-1}{2}=\binom{1025}{2}$。

# Story proofs

## Problem 15
Give a story proof that $\sum_{k=0}^n \binom{n}{k} = 2^n$.

**解答**：

给定$n$个人，要从中选一些人组成一个队伍（选几个人无所谓，可以一个不选，也可以全选），一共有多少种可能。
那么$\binom{n}{k}$就是从$n$个人里选$k$个人的可能性，加起来就是总共的可能性。
换一种思路，对$n$个人中的每个人来说，有被选中和没被选中两种可能，因此一共是$2^n$种可能性。

## Problem 16
Show that for all positive integers $n$ and $k$ with $n \ge k$,

$$
\binom{n}{k} + \binom{n}{k - 1} = \binom{n + 1}{k},
$$

doing this in two ways: (a) algebraically and (b) with a story, giving an interpretation
for why both sides count the same thing.

Hint for the story proof: Imagine an organization consisting of $n + 1$ people, with one
of them pre-designated as the president of the organization.

**解答**：

**(a)** algebraically

$$
\begin{align*}
\binom{n}{k} + \binom{n}{k - 1} &= \frac{n!}{k!(n-k)!} + \frac{n!}{(k-1)!(n-k+1)!}\\
&= \frac{(n-k+1)n! + k*n!}{k!(n-k+1)!}\\
&= \frac{(n+1)n!-k*n!+k*n!}{k!(n-k+1)!}\\
&= \frac{(n+1)!}{k!(n-k+1)!}\\
&= \binom{n+1}{k}
\end{align*}
$$

**(b)** with a story

假设有$n+1$个人的委员会，其中1个人是委员会主席，现在要从这$n+1$个人种选择$k$个人组成一个小组，有多少种方式？
这相当于从$n+1$个人种选择$k$个人，即$\binom{n+1}{k}$种方式。再换一种思路，选$k$个人有种方式，一种是选了主席，
有$\binom{n}{k-1}$种方式；另一种是没有选主席，有$\binom{n}{k}$种方式。所以$\binom{n+1}{k} = \binom{n}{k} + \binom{n}{k-1}$

## Problem 17

Give a story proof that

$$
\sum\limits_{k=0}^n \binom{n}{k}^2 = \binom{2n}{n}
$$

for all positive integers n.

**解答**：

因为$\binom{n}{k} = \binom{n}{n-k}$，因此原式可写作：$\sum\limits_{k=0}^n \binom{n}{k}\binom{n}{n-k} = \binom{2n}{n}$。

这就相当于从两个各有$n$个人的部门中选$n$个人组成一个团队，问一共有多少种方式。
等式左边相当于从部门A种选$k$个人，再从部门B中选剩下的$n-k$个人，$k$取值范围从$0$到$n$。
等式右边相当于把两个部门的人混在一起，从$2n$个人中选$n$个人。

## Problem 18
Give a story proof that

$$
\sum\limits_{k=1}^{n}k\binom{n}{k}^2 = n \binom{2n-1}{n-1}
$$

for all positive integers n.

*Hint:* Consider choosing a committee of size $n$ from two groups of size $n$ each, where
only one of the two groups has people eligible to become the chair of the committee.

**解答**：

上式可写作：$\sum\limits_{k=1}^{n}\binom{k}{1}\binom{n}{k}\binom{n}{n-k} = \binom{n}{1}\binom{2n-1}{n-1}$。

这就相当于从两个各有$n$个人的部门A和B中选$n$个人组成一个团队，且必须从部门A中选一个人做团队主席，问一共有多少种方式。
等式左边相当于从部门A种选$k$个人，再从$k$个人中选一人做主席，然后从部门B中选剩下的$n-k$个人，$k$取值范围从$1$到$n$。
等式右边相当于把两个部门的人混在一起，先从部门A的$n$个人中选一个当主席，再从剩下的$2n-1$个人中选$n-1$个人。

## Problem 19
Give a story proof that

$$
\sum\limits_{k=2}^n \binom{k}{2}\binom{n-k+2}{2} = \binom{n+3}{5}
$$

for all integers $n \ge 2$.

*Hint*: Consider the middle number in a subset of $\{1, 2, ..., n + 3\}$ for size 5.

**解答**：

假设我们要从$1$到$n+3$中选取5个数（$n \ge 2$），我们可以从$2$到$n$中选一个数$k$，然后从小于等于$k$的数中选$2$个，从大于$k$的数中选$3$个。
上述等式的左边就是这种选法的体现，右边是直接从$n+3$中选$5$个数。得证。

## Problem 20

**(a)** Show using a story proof that

$$
\binom{k}{k} + \binom{k+1}{k} + \binom{k+2}{k} + ... + \binom{n}{k} = \binom{n+1}{k+1},
$$

where $n$ and $k$ are positive integers with $n \ge k$. This is called the *hockey stick identity*.

*Hint*: Imagine arranging a group of people by age, and then think about the oldest person in a chosen subgroup.

**解答**：

我们从$n+1$个人中抽$k+1$个人组成小组，假设小组中年纪最大的人是X。
如果X也是全体中年纪最大的，那么组成小组有$\binom{n}{k}$种选择；
如果X是全体中年级第二大的，那么组成小组有$\binom{n-1}{k}$种选择（因为全体中年纪最大的显然不能在小组中），
以此类推，如果全体中有$j$个人年纪比X小，那么组成小组有$\binom{j}{k}$种可能性。所以

$$
\sum\limits_{j=k}^{n}\binom{j}{k} = \binom{n+1}{k+1}
$$

**(b)** Suppose that a large pack of Haribo gummi bears can have anywhere between $30$
and $50$ gummi bears. There are $5$ delicious avors: pineapple (clear), raspberry (red),
orange (orange), strawberry (green, mysteriously), and lemon (yellow). There are $0$ nondelicious
avors. How many possibilities are there for the composition of such a pack of
gummi bears? You can leave your answer in terms of a couple binomial coefficients, but
not a sum of lots of binomial coefficients.

**解答**：

这是一个有替代无序抽样问题，根据`Bose-Einstein`，我们知道，对于有$5$种口味的软糖，组成一包$i$个软糖的方式有
$\binom{i + 5 - 1}{i}=\binom{i+4}{i}=\binom{i+4}{4}$。

因此组成一包含有$30$到$50$个软糖的可能性有：

$$
\begin{align*}
\sum\limits_{i=30}^{50} \binom{i+4}{4} &= \sum\limits_{j=34}^{54} \binom{j}{4}\\
&= \sum\limits_{j=4}^{54} \binom{j}{4} - \sum\limits_{j=4}^{33} \binom{j}{4}\\
&= \binom{55}{5} - \binom{34}{5}\\
&= 3200505
\end{align*}
$$

## Problem 21

Define $\genfrac{\{}{\}}{0pt}{0}{n}{k}$ as the number of ways to partition $\{1,2,...,n\}$
into $k$ nonempty subsets, or the number of ways to have n students split up into $k$ groups
such that each group has at least one student. For example, $\genfrac{\{}{\}}{0pt}{0}{4}{2} = 7$
because we have the following possibilities.

$$
\{1\}, \{2,3,4\}\\
\{2\}, \{1,3,4\}\\
\{3\}, \{1,2,4\}\\
\{4\}, \{1,2,3\}\\
\{1,2\}, \{3,4\}\\
\{1,3\}, \{2,4\}\\
\{1,4\}, \{2,3\}
$$

Prove the following identities:

**(a)**
$$
\genfrac{\{}{\}}{0pt}{0}{n+1}{k} = \genfrac{\{}{\}}{0pt}{0}{n}{k-1} + k\genfrac{\{}{\}}{0pt}{0}{n}{k}.
$$

*Hint*: I'm either in a group by myself or I'm not.

**解答**：

假设要把$n+1$个人分成$k$个小组：

如果我在由我自己一个人组成的小组里，那么需要将剩下的$n$个人分成$k-1$个小组，有$\genfrac{\{}{\}}{0pt}{0}{n}{k-1}$种方式；

如果我不在有我自己一个人组成的小组里，那么需要将剩下的$n$个人分成$k$个小组，我再从$k$个小组中选一个加入，有$k\genfrac{\{}{\}}{0pt}{0}{n}{k}$种方式。

所以，$\genfrac{\{}{\}}{0pt}{0}{n+1}{k} = \genfrac{\{}{\}}{0pt}{0}{n}{k-1} + k\genfrac{\{}{\}}{0pt}{0}{n}{k}$。


**(b)**
$$
\sum\limits_{j=k}^{n}\binom{n}{j}\genfrac{\{}{\}}{0pt}{0}{j}{k} = \genfrac{\{}{\}}{0pt}{0}{n+1}{k+1}.
$$

*Hint*: First decide how many people are not going to be in my group.

**解答**：

假设要把$n+1$个人分成$k+1$个小组：

我在其中一个小组，那么不在我小组的人数可以从$k$到$n$，左边等式相等于从$n$个人中选择$j$个人不在我的小组里，$j \in [k, n]$，
其总和就像等于把$n+1$个人分成$k+1$个小组的可能性。

所以，$\sum\limits_{j=k}^{n}\binom{n}{j}\genfrac{\{}{\}}{0pt}{0}{j}{k} = \genfrac{\{}{\}}{0pt}{0}{n+1}{k+1}$。

## Problem 22

The Dutch mathematician R.J. Stroeker remarked:

> Every beginning student of number theory surely must have marveled at the miraculous
  fact that for each natural number n the sum of the first n positive consecutive cubes is
  a perfect square. [26]

Furthermore, it is the square of the sum of the first $n$ positive integers! That is,

$$
1^3 + 2^3 + ... + n^3 = (1 + 2 + ... + n)^2.
$$

Usually this identity is proven by induction, but that does not give much insight into
why the result is true, nor does it help much if we wanted to compute the left-hand side
but didn't already know this result. In this problem, you will give a story proof of the
identity.

**(a)** Give a story proof of the identity

$$
1 + 2 + ... + n = \binom{n+1}{2}.
$$

*Hint*: Consider a round-robin tournament (see Exercise 4).

**解答**：

假设$n+1$个人要循环比赛，每个人都需要和其他所有人比赛一次。我们把$n+1$个人从左往右排成一排，
第一个人要和右边的$n$个人比赛，第二个人要和右边的$n-1$个人比赛，以此类推，第n个人要和最后一个人比赛，
因此一共要进行$n + n - 1 + ... + 2 + 1$场比赛。因此$1 + 2 + ... + n = \binom{n+1}{2}$。

**(b)** Give a story proof of the identity

$$
1^3 + 2^3 + ... + n^3 = 6\binom{n+1}{4} + 6\binom{n+1}{3} + \binom{n+1}{2}.
$$

It is then just basic algebra (not required for this problem) to check that the square of
the right-hand side in (a) is the right-hand side in (b).

*Hint*: Imagine choosing a number between 1 and n and then choosing 3 numbers between
0 and n smaller than the original number, with replacement. Then consider cases based
on how many distinct numbers were chosen.

**解答**：

假设选了数字$i\ (1 \le i \le n)$，我们将从数字$0$到$i-1$中有替代抽取三个数字，因此一共有$i^3$种可能性。
等式左边就是从$1$到$n$种抽一个数字，再从$0$到$n$中抽三个选中数字小的数字的全部可能性。

我们选中3个数字一共有三种情况：

- 三个数字都不相同
- 三个数字都相同
- 三个数字有两个相同

对于三个数字都相同的情况，相当于从$n+1$个数字中抽$4$个数字，最大的数字作为第一次抽取的数字，其他$3$个
数字进行排列，因此一共有$3!\binom{n+1}{4}=6\binom{n+1}{4}$种可能性。

对于三个数字都相同的情况，相当于从$n+1$个数字种抽$2$个数字，最大的数字作为第一次抽取的数字，剩下的数字
使用三次，因此一共有$\binom{n+1}{2}$种可能性。

对于三个数字有两个相同的情况，相当于从$n+1$个数字中抽$3$个数字，最大的数字作为第一次抽取的数字，其他$2$个
数字中每个数字都可以使用两次，因此一共有$2\frac{3!}{2!} = 3!$种排列，也就有$6\binom{n+1}{3}$种可能性。

因此，$1^3 + 2^3 + ... + n^3 = 6\binom{n+1}{4} + 6\binom{n+1}{3} + \binom{n+1}{2}$。


# Naive definition of probability

## Problem 23
Three people get into an empty elevator at the first floor of a building that has 10
floors. Each presses the button for their desired floor (unless one of the others has already pressed that button).
Assume that they are equally likely to want to go to floors 2 through 10 (independently of each other).
What is the probability that the buttons for 3 consecutive floors are pressed?

**解答**：

三个按钮连续被按的情况有：$\{2, 3, 4\}, \{3, 4, 5\}, \{4, 5, 6\}, \{5, 6, 7\}, \{6, 7, 8\}, \{7, 8, 9\}, \{8, 9, 10\}$。
而对于每种情况，三个人有$3!$种方式去按按钮。而三个人按按钮一共有$9^3$种情况，因此三个连续按钮被按的概率为：

$$
\frac{3! * 7}{9^3} \approx 0.0576
$$

## Problem 24
A certain family has 6 children, consisting of 3 boys and 3 girls. Assuming that all
birth orders are equally likely, what is the probability that the 3 eldest children are the 3 girls?

**解答**：

6个孩子的出生顺序一共有$6!$种可能，3个年长的孩子是女孩一共有$3!3!$种可能，所以三个年长孩子是女孩的概率为$\frac{3!3!}{6!} = 0.05$

## Problem 25
A city with 6 districts has 6 robberies in a particular week. Assume the robberies are
located randomly, with all possibilities for which robbery occurred where equally likely.
What is the probability that some district had more than 1 robbery?

**解答**：

设事件$A$为：有某个社区发生一起以上抢劫案，事件$A$的逆事件$A^C$为：每个社区发生且只发生了一起抢劫案。
$6$起抢劫案发生地点总共有$6^6$种可能，而每个社区发生且只发生一起抢劫案总共$6!$种可能性。

因此$P(A^C) = \frac{6!}{6^6}$，则$P(A) = 1-P(A^C) = 1-\frac{6!}{6^6} \approx 0.9846$。

## Problem 26
A survey is being conducted in a city with 1 million residents. It would be far too
expensive to survey all of the residents, so a random sample of size 1000 is chosen
(in practice, there are many challenges with sampling, such as obtaining a complete
list of everyone in the city, and dealing with people who refuse to participate). The
survey is conducted by choosing people one at a time, with replacement and with equal
probabilities.

**(a)** Explain how sampling with vs. without replacement here relates to the birthday
problem.

**解答**：

该问题和生日问题是同构的。

对于有替代抽样，每个人就相当于生日问题中的日期（拓展为带年份的生日，这样不到三千年能涵盖一百万个不同的生日），
抽样数就相当于生日问题中的人数。从一百万人中抽$1000$人，就相当于在有一百万个日期的情况下，问$1000$个人他们的生日。
抽样的可能性为$1\_000\_000^{1000}$。

对于无替代抽样，就相当于抽取的$1000$个人当中，没有两个人生日匹配。
抽样的可能性为$(1\_000\_000)_{1000}$。

**(b)** Find the probability that at least one person will get chosen more than once.

类似于生日问题，设事件$A$为至少有个人没选中了一次以上。那么：
$P(A) = 1 - P(A^C) = 1 - \frac{(1\_000\_000)_{1000}}{1\_000\_000^{1000}}$。

## Problem 27
A *hash table* is a commonly used data structure in computer science, allowing for fast
information retrieval. For example, suppose we want to store some people's phone numbers.
Assume that no two of the people have the same name. For each name *x*, a *hash
function h* is used, letting *h(x)* be the location that will be used to store *x*'s phone
number. After such a table has been computed, to look up *x*'s phone number one just
recomputes *h(x)* and then looks up what is stored in that location.

The hash function *h* is deterministic, since we don't want to get different results every
time we compute *h(x)*. But *h* is often chosen to be *pseudorandom*. For this problem,
assume that true randomness is used. Let there be *k* people, with each person's phone
number stored in a random location (with equal probabilities for each location, independently
of where the other people's numbers are stored), represented by an integer
between *1* and *n*. Find the probability that at least one location has more than one
phone number stored there.

**解答**：

如果$k > n$，则至少有个位置有多于一个电话号码的概率为$1$。

如果$k \le n$，则至少有个位置有多于一个电话号码的概率为：$1 - \frac{(n)_k}{n^k}$。

## Problem 28
A college has 10 time slots for its courses, and blithely assigns courses to completely
random time slots, independently. The college offers exactly 3 statistics courses. What
is the probability that 2 or more of the statistics courses are in the same time slot?

**解答**：

设事件$A$为2个或者更多的统计课位于同一时间槽，则$A^C$为所有统计课程位于不同时间槽。

$$
P(A) = 1 - P(A^C) = 1 - \frac{(10)_3}{10^3} = 0.28
$$

## Problem 29
For each part, decide whether the blank should be filled in with $=$, $<$, or $>$, and give
a clear explanation.

**(a)** (probability that the total after rolling 4 fair dice is 21) $>$ (probability that the
total after rolling 4 fair dice is 22).

**解答**：

掷出$21$有4，5，6，6（12种可能性），3，6，6，6（4种可能性）和5，5，5，6（4种可能性）。

掷出$22$有5，5，6，6（6种可能性）和4，6，6，6（4种可能性）。

**(b)** (probability that a random 2-letter word is a palindrome) $=$ (probability that a
random 3-letter word is a palindrome).

**解答**：

2个字母的单词和三个字母的单词是回文的要求是一样的：都是第一个字母和最后一个字母相同。因此概率相同。

## Problem 30
With definitions as in the previous problem, find the probability that a random n-letter
word is a palindrome for $n = 7$ and for $n = 8$.

**解答**：

假设是26个小写字母组成的单词，$n = 7$和$n = 8$是回文的情况是一样的，都是前4个字母可以任意取。
当$n=7$时，$P = \frac{26^4}{26^7} = \frac{1}{26^3}$；当$n=8$时，$P = \frac{26^4}{26^8}=\frac{1}{26^4}$。

## Problem 31
Elk dwell in a certain forest. There are $N$ elk, of which a simple random sample of
size $n$ are captured and tagged ("simple random sample" means that all $\binom{N}{n}$ sets of
$n$ elk are equally likely). The captured elk are returned to the population, and then a new
sample is drawn, this time with size $m$. This is an important method that is widely used
in ecology, known as *capture-recapture*. What is the probability that exactly $k$ of the $m$
elk in the new sample were previously tagged? (Assume that an elk that was captured
before doesn't become more or less likely to be captured again.)

**解答**：

从$N$头驼鹿种选择$m$头，一共有$\binom{N}{m}$种可能。要保证其种有$k$头被二次选中，我们需要从$n$头已
标记驼鹿种选择$k$头，再从剩余$N-n$头未被标记的驼鹿种选择$m-k$头，因此概率为：

$$
\frac{\binom{n}{k}\binom{N-n}{m-k}}{\binom{N}{m}}
$$

其中$\ 0\le k \le n$。

# Axioms of probability

## Problem 43
Show that for any events A and B,
$$
P(A) + P(B) - 1 \le P(A \cap B) \le P(A \cup B) \le P(A) + P(B)
$$

**解答**：

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

## Problem 44
Let $A$ and $B$ be events. The *difference* $B - A$ is defined to be the set of all elements of
$B$ that are not in $A$. Show that if $A \subseteq B$, then

$$
P(B - A) = P(B) - P(A)
$$

directly using the axioms of probability.

**解答**：

$$
\begin{align*}
P(B-A) &= P(B\cap A^C)\\
&= 1 - P(B^C\cup A)\\
&= 1 - (P(B^C) + P(A) - P(A\cap B^C))\\
&= 1 - (1-P(B) + P(A) - P(\emptyset))\\
&= 1 - 1 + P(B) - P(A) + P(\emptyset)\\
&= P(B) - P(A)
\end{align*}
$$

## Problem 45
Let $A$ and $B$ be events. The *symmetric difference* $A \triangle B$ is defined to be the set of all
elements that are in $A$ or $B$ but not both. In logic and engineering, this event is also
called the $XOR$ (*exclusive or*) of $A$ and $B$. Show that

$$
P(A \triangle B) = P(A) + P(B) - 2(P \cap B)
$$

directly using the axioms of probability.

**解答**：

$$
\because A \triangle B = A \cup B - A \cap B, \text{ and } A \cap B \subseteq A \cup B\\
\begin{align*}
\therefore P(A \triangle B) &= P(A \cup B) - P(A \cap B) \text { (according to Problem 44)}\\
&= P(A) + P(B) - P(A \cap B) - P(A \cap B)\\
&= P(A) + P(B) - 2P(A \cap B)
\end{align*}
$$

## Problem 46
Let $A_1, A_2, ... , A_n$ be events. Let $B_k$ be the event exactly $k$ of the $A_i$ occur, and $C_k$ be
the event that at least $k$ of the $A_i$ occur, for $0 \le k \le n$. Find a simple expression for
$P(B_k)$ in terms of $P(C_k)$ and $P(C_{k+1})$.

**解答**：

**(1)**
$B_k$的逆事件为：$A_i$发生个数小于$k$，或大于$k$。而$A_i$发生个数小于$k$的概率为：$1 - P(C_k)$，
而$A_i$发生个数大于$k$的概率为：$P(C_{k+1})$，且这两个事件互斥。因此：

$$
P(B_k) = 1 - P(B_k^C) = 1 - (1 - P(C_k) + P(C_{k+1})) = P(C_k) - P(C_{k+1})
$$

**(2)**
$B_k = C_k - C_{k+1}$，且$C_{k+1} \subseteq C_{k}$，因此：

$$
P(B_k) = P(C_k - C_{k+1}) = P(C_k) - P(C_{k+1})
$$

# Inclusion-exclusion

## Problem 49
A fair die is rolled n times. What is the probability that at least 1 of the 6 values never
appears?

**解答**：

设事件$A_i$表示数字$i$从来不会出现，则问题就是求事件$\bigcup\limits_{i=1}^{6}A_i$的概率，根据包含-排斥法则：

$$
\begin{align*}
P(\bigcup\limits_{i=1}^{6}A_i) &= \sum\limits_{i=1}^6 (-1)^{i+1} \binom{6}{i} \left(\frac{6 - i}{6}\right)^n \\
&= 6\left(\frac 5 6\right)^n - 15\left(\frac 4 6\right)^n + 20\left(\frac 3 6\right)^n - 15\left(\frac 2 6\right)^n + 6\left(\frac 1 6\right)^n
\end{align*}
$$

## Problem 50
A card player is dealt a 13-card hand from a well-shuffled, standard deck of cards.
What is the probability that the hand is void in at least one suit ("void in a suit" means
having no cards of that suit)?

**解答**：

设事件$A_i$代表缺一种花色，则至少缺一种花色的概率为：

$$
\begin{align*}
P(\bigcup\limits_{i=1}^{4} A_i) &= \sum\limits_{i}P(A_i) - 
\sum\limits_{i < j}P(A_i \cap A_j) +
\sum\limits_{i < j < k}P(A_i \cap A_j \cap A_k) -
\sum P(A_1 \cap A_2 \cap A_3 \cap A_4)\\
&= 4 \times \frac{\binom{39}{13}}{\binom{52}{13}} -
\binom{4}{2} \times \frac{\binom{26}{13}}{\binom{52}{13}} +
\binom{4}{3} \times \frac{\binom{13}{13}}{\binom{52}{13}} - 0\\
&\approx 0.0511
\end{align*}
$$

# Mixed practice

## Problem 56
For each part, decide whether the blank should be filled in with $=$, $<$, or $>$, and give a clear explanation. 
In (a) and (b), order doesn't matter.

**(a)** (number of ways to choose 5 people out of 10) $>$ (number of ways to choose 6 people out of 10)

**解答**：

$\binom {10} {6} = \binom{10}{4} \lt \binom{10}{5}$

**(b)** (number of ways to break 10 people into 2 teams of 5) $<$ (number of ways to break 10 people into a team
of 6 and a team of 4)

**解答**：

把10个人分成6人队和4人队的方式有$\binom{10}{4}$种，把10个人分成两个5人队的方式有$\frac{\binom{10}{5}} 2$种（重点在于2个五人队无法区分，所以要除以2）。

**(c)** (probability that all 3 people in a group of 3 were born on January 1) $<$ (probability that in a group of 3 people, 1 was born on each of January 1, 2, and 3)

**解答**：

三个人都出身在一月一号的概率为$\frac{1}{365^3}$，但三个人依次出生在一月一号、二号和三号的概率为$\frac{3!}{365^3}$。

Martin and Gale play an exciting game of "toss the coin",  where they toss a fair coin until the pattern *HH* occurs 
(two consecutive Heads) or the pattern *TH* occurs (Tails followed immediately by Heads). Martin wins the game if and
only if *HH* occurs before *TH* occurs.

**(d)** (probability that Martin wins) $<$ 1/2

**解答**：

(1) 如果第一次硬币是*T*，那么Martin肯定输。因为后续掷出*T*游戏会继续，掷出*H*他就输。
(2) 如果第一次硬币是*H*，那么看第二次掷硬币结果。如果第二次是*H*，Martin赢；如果第二次是*T*，那么又成了情况(1)，Martin肯定输。

所以综合来看，Martin赢得概率只有$1/4$。

## Problem 57
Take a deep breath before attempting this problem. In the book *Innumeracy*, John
Allen Paulos writes:

> Now for better news of a kind of immortal persistence. First, take a deep
  breath. Assume Shakespeare's account is accurate and Julius Caesar gasped
  ["Et tu, Brute!"] before breathing his last. What are the chances you just
  inhaled a molecule which Caesar exhaled in his dying breath?

Assume that one breath of air contains $10^22$ molecules, and that there are $10^44$ molecules
in the atmosphere. (These are slightly simpler numbers than the estimates that Paulos
gives; for the purposes of this problem, assume that these are exact. Of course, in reality
there are many complications such as different types of molecules in the atmosphere,
chemical reactions, variation in lung capacities, etc.)

Suppose that the molecules in the atmosphere now are the same as those in the atmosphere
when Caesar was alive, and that in the $2000$ years or so since Caesar, these
molecules have been scattered completely randomly through the atmosphere. Also assume
that Caesar's last breath was sampled *without* replacement but that your breathing
is sampled *with* replacement (without replacement makes more sense but with replacement
is easier to work with, and is a good approximation since the number of molecules
in the atmosphere is so much larger than the number of molecules in one breath).

Find the probability that at least one molecule in the breath you just took was shared
with Caesar's last breath, and give a simple approximation in terms of $\mathit{e}$

*Hint*: As discussed in the math appendix, $(1 + \frac{x}{n})^n \approx \mathit{e}^x$ for $n$ large.

**解答**：

令事件$A$为一次呼吸包含至少一个凯撒分子。则事件$A^C$为一次呼吸不包含任何凯撒分子。

因为假设每次呼吸是有替代采样，因此一次呼吸中某个分子是凯撒分子的概率为$\frac{10^{22}}{10^{44}} = \frac{1}{10^{22}}$，不是凯撒分子的概率为$1-\frac{1}{10^{22}}$。因而，一次呼吸中不包含任何凯撒分子的
概率为$(1-\frac{1}{10^{22}})^{10^{22}}$，令$x=-1$，有$(1-\frac{1}{10^{22}})^{10^{22}} \approx \mathit{e}^{-1}$。

所以：$P(A) = 1-P(A^C) \approx 1 - \mathit{e}^{-1} \approx 0.6321$。