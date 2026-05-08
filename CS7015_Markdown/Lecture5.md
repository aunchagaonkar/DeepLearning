| CS7015 | (Deep Learning) |     | : Lecture | 5   |
| ------ | --------------- | --- | --------- | --- |
Gradient Descent (GD), Momentum Based GD, Nesterov Accelerated GD,
| Stochastic | GD, AdaGrad, | RMSProp,  |     | Adam |
| ---------- | ------------ | --------- | --- | ---- |
|            | Mitesh       | M. Khapra |     |      |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/94
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | -------------- | --------------------- | --- | -------- |

Acknowledgements
For most of the lecture, I have borrowed ideas from the videos by Ryan Harris
| on “visualize | backpropagation” | (available | on youtube) |     |
| ------------- | ---------------- | ---------- | ----------- | --- |
Some content is based on the course CS231na by Andrej Karpathy and others
ahttp://cs231n.stanford.edu/2016/
2/94
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | -------------- | --------------------- | --- | -------- |

| Module | 5.1: Learning | Parameters | : Infeasible | (Guess |
| ------ | ------------- | ---------- | ------------ | ------ |
Work)
3/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| x   | σ y | = f(x) |           |          |     |     |     |
| --- | --- | ------ | --------- | -------- | --- | --- | --- |
|     |     |        | Input for | training |     |     |     |
}N
| 1   |     |     | {x ,y | →   | N pairs of | (x,y) |     |
| --- | --- | --- | ----- | --- | ---------- | ----- | --- |
i i i=1
| f(x) = | 1   |     |          |           |     |     |     |
| ------ | --- | --- | -------- | --------- | --- | --- | --- |
|        |     |     | Training | objective |     |     |     |
1+e−(w·x+b)
|     |     |     | Find w | and b | such that: |     |     |
| --- | --- | --- | ------ | ----- | ---------- | --- | --- |
N
(cid:88)
|     |     |     | minimizeL(w,b) |     | = (y | −f(x | ))2 |
| --- | --- | --- | -------------- | --- | ---- | ---- | --- |
|     |     |     |                |     |      | i i  |     |
w,b
i=1
|     |     |     | What does | it          | mean to train  | the network? |      |
| --- | --- | --- | --------- | ----------- | -------------- | ------------ | ---- |
|     |     |     | Suppose   |             | we train the   | network      | with |
|     |     |     | (x,y)     | = (0.5,0.2) | and            | (2.5,0.9)    |      |
|     |     |     | At        | the end     | of training    | we expect    | to   |
|     |     |     | find      | w∗, b∗      | such that:     |              |      |
|     |     |     | f(0.5)    | →           | 0.2 and f(2.5) | → 0.9        |      |
4/94
|     |     | MiteshM.Khapra | CInS70o1t5h(DeerepwLoearrdnisn.g.).: |              | Lecture5  |               |          |
| --- | --- | -------------- | ------------------------------------ | ------------ | --------- | ------------- | -------- |
|     |     |                | We                                   | hope         | to find a | sigmoid       | function |
|     |     |                | such                                 | that         | (0.5,0.2) | and (2.5,0.9) | lie      |
|     |     |                | on                                   | this sigmoid |           |               |          |

| x   | σ y | = f(x) |                   |                   |          |
| --- | --- | ------ | ----------------- | ----------------- | -------- |
|     |     |        | In other words... |                   |          |
|     |     |        | We hope           | to find a sigmoid | function |
1
|        |     |     | such that | (0.5,0.2) and | (2.5,0.9) lie |
| ------ | --- | --- | --------- | ------------- | ------------- |
| f(x) = | 1   |     | on this   | sigmoid       |               |
1+e−(w·x+b)
5/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Let us | see this | in more | detail.... |     |
| ------ | -------- | ------- | ---------- | --- |
6/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

|     | Can     | we try     | to find   | such    | a w∗,b∗ manually |         |        |
| --- | ------- | ---------- | --------- | ------- | ---------------- | ------- | ------ |
|     | Let     | us try     | a random  | guess.. | (say, w          | = 0.5,b | = 0)   |
|     | Clearly | not        | good, but | how     | bad is it        | ?       |        |
|     | Let     | us revisit | L(w,b)    | to      | see how bad      | it      | is ... |
N
1 (cid:88)
|     | L(w,b) | =   | ∗ (y | −f(x | ))2 |     |     |
| --- | ------ | --- | ---- | ---- | --- | --- | --- |
|     |        |     | i    |      | i   |     |     |
2
i=1
1
|     |     | =   | ∗((y −f(x | ))2+(y | −f(x |     | ))2) |
| --- | --- | --- | --------- | ------ | ---- | --- | ---- |
|     |     |     | 2 1       | 1      | 2    | 2   |      |
1
= ∗((0.9−f(2.5))2+(0.2−f(0.5))2)
2
= 0.073
|                | We want | L(w,b)                | to be | as close | to 0 as  | possible | 7/94 |
| -------------- | ------- | --------------------- | ----- | -------- | -------- | -------- | ---- |
| MiteshM.Khapra |         | CS7015(DeepLearning): |       |          | Lecture5 |          |      |

| Let us             | try some other   | values  | of w, b    |          |
| ------------------ | ---------------- | ------- | ---------- | -------- |
|                    | w                | b       | L(w,b)     |          |
|                    | 0.50             | 0.00    | 0.0730     |          |
|                    | -0.10            | 0.00    | 0.1481     |          |
|                    | 0.94             | -0.94   | 0.0214     |          |
|                    | 1.42             | -1.73   | 0.0028     |          |
|                    | 1.65             | -2.08   | 0.0003     |          |
|                    | 1.78             | -2.27   | 0.0000     |          |
| Oops!!             | this made things | even    | worse...   |          |
| Perhaps            | it would         | help to | push w and | b in the |
| other direction... |                  |         |            |          |
8/94
| MiteshM.Khapra | CS7015(DeepLearning): |                    | Lecture5 |          |
| -------------- | --------------------- | ------------------ | -------- | -------- |
| Let us         | keep going            | in this direction, | i.e.,    | increase |
| w and          | decrease b            |                    |          |          |
Withsomeguessworkandintuitionwewereable
| to find | the right values | for | w and b |     |
| ------- | ---------------- | --- | ------- | --- |

| Let us | look at | something | better than | our “guess | work” |
| ------ | ------- | --------- | ----------- | ---------- | ----- |
algorithm....
9/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

|     | Since      | we have | only   | 2 points |        | and 2 |
| --- | ---------- | ------- | ------ | -------- | ------ | ----- |
|     | parameters |         | (w, b) | we can   | easily | plot  |
L(w,b)
|     |     | for      | different | values | of     | (w, b) |
| --- | --- | -------- | --------- | ------ | ------ | ------ |
|     | and | pick the | one       | where  | L(w,b) | is     |
minimum
|     | But      | of course   | this     | becomes         | intract- |       |
| --- | -------- | ----------- | -------- | --------------- | -------- | ----- |
|     | able     | once you    | have     | many            | more     | data  |
|     | points   | and         | many     | more parameters |          | !!    |
|     | Further, | even        | here     | we have         | plotted  |       |
|     | the      | error       | surface  | only for        | a        | small |
|     | range    | of (w,      | b) [from | (−6,6)          | and      | not   |
|     | from     | (−inf,inf)] |          |                 |          |       |
10/94
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- | --- |

| Let us | look at | the geometric | interpretation |         | of our        |
| ------ | ------- | ------------- | -------------- | ------- | ------------- |
| “guess | work”   | algorithm     | in terms       | of this | error surface |
11/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

12/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

13/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

14/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

15/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

16/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

17/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

18/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Module | 5.2: Learning | Parameters | : Gradient | Descent |
| ------ | ------------- | ---------- | ---------- | ------- |
19/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Now let’s  | see if | there is a    | more efficient | and |
| ---------- | ------ | ------------- | -------------- | --- |
| principled | way    | of doing this |                |     |
20/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Goal
Find a better way of traversing the error surface so that we can reach the
minimum value quickly without resorting to brute force search!
21/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

vector of parameters,
say, randomly initial-
ized
We moved in the direc-
| θ = [w,b] | θ   | θ   |     |
| --------- | --- | --- | --- |
new
tion of ∆θ
∆θ = [∆w,∆b]
|     | η·∆θ | ∆θ  |     |
| --- | ---- | --- | --- |
Let us be a bit conservat-
change in the
ive: moveonlybyasmall
values of w, b
amount η
θ = θ+η·∆θ
new
|     | Question:What | is the     | right ∆θ to use? |
| --- | ------------- | ---------- | ---------------- |
|     | The answer    | comes from | Taylor series    |
22/94
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| -------------- | --------------------- | --- | -------- |

For ease of notation, let ∆θ = u, then from Taylor series, we have,
|           |                   |                    | η2              |           | η3 η4          |
| --------- | ----------------- | ------------------ | --------------- | --------- | -------------- |
| L(θ+ηu)   | = L(θ)+η∗uT∇L(θ)+ |                    | ∗uT∇2L(θ)u+     |           | ∗...+ ∗...     |
|           |                   |                    | 2!              |           | 3! 4!          |
|           | = L(θ)+η∗uT∇L(θ)  |                    | [η is typically | small, so | η2,η3,... → 0] |
| Note that | the move (ηu)     | would be favorable | only if,        |           |                |
L(θ+ηu)−L(θ) < 0 [i.e., if the new loss is less than the previous loss]
This implies,
| uT∇L(θ) | < 0 |     |     |     |     |
| ------- | --- | --- | --- | --- | --- |
23/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

| Okay, so | we have, |     |     |     |
| -------- | -------- | --- | --- | --- |
uT∇L(θ)
< 0
| But, what | is the range | of uT∇L(θ)     | ? Let’s see.... |               |
| --------- | ------------ | -------------- | --------------- | ------------- |
| Let β be  | the angle    | between uT and | ∇L(θ), then     | we know that, |
uT∇L(θ)
|     |     | −1 ≤ cos(β) | =   | ≤ 1 |
| --- | --- | ----------- | --- | --- |
||u||∗||∇L(θ)||
| Multiply | throughout | by k = ||u||∗||∇L(θ)|| |     |     |
| -------- | ---------- | ---------------------- | --- | --- |
uT∇L(θ)
|     |     | −k ≤ k∗cos(β) | =   | ≤ k |
| --- | --- | ------------- | --- | --- |
Thus, L(θ+ηu)−L(θ) = uT∇L(θ) = k∗cos(β) will be most negative when
| cos(β) | = −1 i.e., when | β is 180◦ |     |     |
| ------ | --------------- | --------- | --- | --- |
24/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Gradient Descent | Rule |     |     |     |
| ---------------- | ---- | --- | --- | --- |
The direction u that we intend to move in should be at 180◦ w.r.t. the gradient
| In other words,  | move in   | a direction | opposite to the gradient |     |
| ---------------- | --------- | ----------- | ------------------------ | --- |
| Parameter Update | Equations |             |                          |     |
w = w −η∇w
|     | t+1 t | t   |     |     |
| --- | ----- | --- | --- | --- |
b = b −η∇b
|     | t+1 t | t   |     |     |
| --- | ----- | --- | --- | --- |
∂L(w,b) ∂L(w,b)
| where,∇w | =   |              | ,∇b = |              |
| -------- | --- | ------------ | ----- | ------------ |
|          | t   |              | t     |              |
|          | ∂w  |              | ∂b    |              |
|          |     | at w=wt,b=bt |       | at w=wt,b=bt |
So we now have a more principled way of moving in the w-b plane than our “guess
work” algorithm
25/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Let’s create | an algorithm | from this | rule ... |     |
| ------------ | ------------ | --------- | -------- | --- |
| Algorithm    | 1: gradient  | descent() |          |     |
t ← 0;
| max iterations | ←                  | 1000; |     |     |
| -------------- | ------------------ | ----- | --- | --- |
| while          | t < max iterations | do    |     |     |
| w              | ← w −η∇w           | ;     |     |     |
| t+1            | t                  | t     |     |     |
| b              | ← b −η∇b           | ;     |     |     |
| t+1            | t                  | t     |     |     |
end
Toseethisalgorithminpracticeletusfirstderive∇w and∇bforourtoyneural
network
26/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| x   | σ y | = f(x) |     |     |     |     |
| --- | --- | ------ | --- | --- | --- | --- |
1
|        |     |     | Let’s assume | there is only | 1 point | to fit |
| ------ | --- | --- | ------------ | ------------- | ------- | ------ |
| f(x) = | 1   |     |              |               |         |        |
(x,y)
1+e−(w·x+b)
1
|     |     |     |     | L(w,b) = | ∗(f(x)−y)2 |     |
| --- | --- | --- | --- | -------- | ---------- | --- |
2
|     |     |     | ∂L(w,b) | ∂     | 1             |     |
| --- | --- | --- | ------- | ----- | ------------- | --- |
|     |     |     | ∇w =    | =     | [ ∗(f(x)−y)2] |     |
|     |     |     |         | ∂w ∂w | 2             |     |
27/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |     |
| --- | --- | -------------- | --------------------- | -------- | --- | --- |

| ∂ 1                |     |           | ∂ (cid:16)    | 1   | (cid:17)    |     |
| ------------------ | --- | --------- | ------------- | --- | ----------- | --- |
| ∇w = [ ∗(f(x)−y)2] |     |           |               |     |             |     |
| ∂w 2               |     |           | ∂w 1+e−(wx+b) |     |             |     |
| 1                  |     | ∂         |               | −1  | ∂           |     |
| = ∗[2∗(f(x)−y)∗    |     | (f(x)−y)] |               |     | (e−(wx+b))) |     |
=
| 2   |     | ∂w  | (1+e−(wx+b))2∂w |     |     |     |
| --- | --- | --- | --------------- | --- | --- | --- |
∂
|             |            |            |               | −1  |             | ∂          |
| ----------- | ---------- | ---------- | ------------- | --- | ----------- | ---------- |
| = (f(x)−y)∗ | (f(x))     |            |               |     | ∗(e−(wx+b)) |            |
|             | ∂w         |            | =             |     |             | (−(wx+b))) |
|             |            |            | (1+e−(wx+b))2 |     |             | ∂w         |
|             | ∂ (cid:16) | 1 (cid:17) |               |     |             |            |
| = (f(x)−y)∗ |            |            |               | −1  | e−(wx+b)    |            |
∂w 1+e−(wx+b)
|     |     |     | =            |     | ∗            | ∗(−x) |
| --- | --- | --- | ------------ | --- | ------------ | ----- |
|     |     |     | (1+e−(wx+b)) |     | (1+e−(wx+b)) |       |
= (f(x)−y)∗f(x)∗(1−f(x))∗x
|     |     |     |              | 1   | e−(wx+b)     |      |
| --- | --- | --- | ------------ | --- | ------------ | ---- |
|     |     |     | =            |     | ∗            | ∗(x) |
|     |     |     | (1+e−(wx+b)) |     | (1+e−(wx+b)) |      |
= f(x)∗(1−f(x))∗x
28/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

| x   | σ y | = f(x) |     |     |     |     |
| --- | --- | ------ | --- | --- | --- | --- |
1
|        |     |     | So if there | is only | 1 point (x,y), we | have, |
| ------ | --- | --- | ----------- | ------- | ----------------- | ----- |
| f(x) = | 1   |     |             |         |                   |       |
1+e−(w·x+b)
∇w = (f(x)−y)∗f(x)∗(1−f(x))∗x
|     |     |     | For two | points, |     |     |
| --- | --- | --- | ------- | ------- | --- | --- |
2
(cid:88)
|     |     |     | ∇w = | (f(x )−y | )∗f(x )∗(1−f(x | ))∗x |
| --- | --- | --- | ---- | -------- | -------------- | ---- |
|     |     |     |      | i        | i i            | i i  |
i=1
2
(cid:88)
|     |     |     | ∇b = | (f(x )−y | )∗f(x )∗(1−f(x | ))  |
| --- | --- | --- | ---- | -------- | -------------- | --- |
|     |     |     |      | i        | i i            | i   |
i=1
29/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

30/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| y   |     |     | When | the | curve is | steep the gradient |
| --- | --- | --- | ---- | --- | -------- | ------------------ |
(∆y1)
| 6   | f(x) | = x2+1 |     | is large |     |     |
| --- | ---- | ------ | --- | -------- | --- | --- |
∆x1
|     |     |     | When | the | curve is gentle | the gradient |
| --- | --- | --- | ---- | --- | --------------- | ------------ |
(∆y2)
| 5   |     |     |     | is small |     |     |
| --- | --- | --- | --- | -------- | --- | --- |
∆x2
|     |     |     | Recall       | that | our weight | updates are     |
| --- | --- | --- | ------------ | ---- | ---------- | --------------- |
| 4   |     |     | proportional |      | to the     | gradient w = w− |
∆y
|     |     | 1   | η∇w |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
3
|     |     |     | Hence  | in  | the areas | where the curve is |
| --- | --- | --- | ------ | --- | --------- | ------------------ |
|     | ∆x  |     | gentle | the | updates   | are small whereas  |
1
| 2   |      |     | in  | the areas | where     | the curve is steep |
| --- | ---- | --- | --- | --------- | --------- | ------------------ |
|     | ∆y 2 |     | the | updates   | are large |                    |
1
∆x
2
0
x
| −1 0 | 1 2 | 3 4 |     |     |     |     |
| ---- | --- | --- | --- | --- | --- | --- |
31/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

| Let’s see | what happens | when we | start from | a differ- |
| --------- | ------------ | ------- | ---------- | --------- |
ent point
32/94
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | -------------- | --------------------- | -------- | --- |

| Irrespective  | of where      | we start  | from |     |
| ------------- | ------------- | --------- | ---- | --- |
| once we       | hit a surface | which has | a    |     |
| gentle slope, | the progress  | slows     | down |     |
33/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Module 5.3 : Contours
34/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Visualizing |     | things |     | in 3d | can | sometimes | become | a bit |
| ----------- | --- | ------ | --- | ----- | --- | --------- | ------ | ----- |
cumbersome
| Can we     | do  | a 2d    | visualization |     |           | of this | traversal | along   |
| ---------- | --- | ------- | ------------- | --- | --------- | ------- | --------- | ------- |
| the error  |     | surface |               |     |           |         |           |         |
| Yes, let’s |     | take    | a look        | at  | something |         | known     | as con- |
tours
35/94
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

|     |     |     | Suppose    | I take horizontal  | slices of |
| --- | --- | --- | ---------- | ------------------ | --------- |
|     |     |     | this error | surface at regular | intervals |
|     |     |     | along the  | vertical axis      |           |
|     |     |     | How would  | this look from     | the top-  |
|     |     |     | view ?     |                    |           |
rorre
θ
| Figure: Front | view of a | 3d error surface |     |     |     |
| ------------- | --------- | ---------------- | --- | --- | --- |
36/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| A small distance | between       | the con- |
| ---------------- | ------------- | -------- |
| tours indicates  | a steep slope | along    |
that direction
Alargedistancebetweenthecontours
indicatesagentleslopealongthatdir-
ection
37/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Just to | ensure | that      | we understand | this properly | let |
| ------- | ------ | --------- | ------------- | ------------- | --- |
| us do   | a few  | exercises | ...           |               |     |
38/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

Guess the 3d surface
39/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

Guess the 3d surface
40/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

Guess the 3d surface
41/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Module | 5.4 : Momentum |     | based Gradient | Descent |
| ------ | -------------- | --- | -------------- | ------- |
42/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Some observations | about | gradient | descent |     |     |     |
| ----------------- | ----- | -------- | ------- | --- | --- | --- |
It takes a lot of time to navigate regions having a gentle slope
| This is    | because the  | gradient     | in these | regions | is very  | small    |
| ---------- | ------------ | ------------ | -------- | ------- | -------- | -------- |
| Can we     | do something | better       | ?        |         |          |          |
| Yes, let’s | take a look  | at ‘Momentum |          | based   | gradient | descent’ |
43/94
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

Intuition
If I am repeatedly being asked to move in the same direction then I should
probably gain some confidence and start taking bigger steps in that direction
| Just        | as a ball gains | momentum | while rolling    | down a     | slope |
| ----------- | --------------- | -------- | ---------------- | ---------- | ----- |
| Update rule | for momentum    | based    | gradient descent |            |       |
|             |                 | update   | t = γ ·update    | t−1 +η∇w t |       |
|             |                 | w        | = w −update      |            |       |
|             |                 | t+1      | t                | t          |       |
In addition to the current update, also look at the history of updates.
44/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|        |     | update | t = γ | ·update | t−1 +η∇w | t   |     |     |     |
| ------ | --- | ------ | ----- | ------- | -------- | --- | --- | --- | --- |
|        |     | w      | = w   | −update |          |     |     |     |     |
|        |     | t+1    |       | t       | t        |     |     |     |     |
| update | = 0 |        |       |         |          |     |     |     |     |
0
| update | = γ ·update | +η∇w | = η∇w |      |      |       |     |     |     |
| ------ | ----------- | ---- | ----- | ---- | ---- | ----- | --- | --- | --- |
|        | 1           | 0    | 1     | 1    |      |       |     |     |     |
| update | = γ ·update | +η∇w | = γ   | ·η∇w | +η∇w |       |     |     |     |
|        | 2           | 1    | 2     |      | 1    | 2     |     |     |     |
| update | = γ ·update | +η∇w | = γ(γ | ·η∇w | +η∇w | )+η∇w |     |     |     |
|        | 3           | 2    | 3     |      | 1    | 2     | 3   |     |     |
γ2·η∇w
|        | = γ ·update | 2 +η∇w | 3 =      |     | 1 +γ ·η∇w | 2 +η∇w |      | 3    |     |
| ------ | ----------- | ------ | -------- | --- | --------- | ------ | ---- | ---- | --- |
| update | = γ ·update | +η∇w   | = γ3·η∇w |     | +γ2·η∇w   | +γ     | ·η∇w | +η∇w |     |
|        | 4           | 3      | 4        |     | 1         | 2      |      | 3    | 4   |
.
.
.
| update | = γ ·update | +η∇w | =   | γt−1·η∇w | +γt−2·η∇w |     |     | +...+η∇w |     |
| ------ | ----------- | ---- | --- | -------- | --------- | --- | --- | -------- | --- |
|        | t           | t−1  | t   |          | 1         |     | 1   |          | t   |
45/94
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture5 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

46/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Some observations | and questions |     |     |     |
| ----------------- | ------------- | --- | --- | --- |
Even in the regions having gentle slopes, momentum based gradient descent is
able to take large steps because the momentum carries it along
Is moving fast always good? Would there be a situation where momentum
| would cause | us to run pass | our goal? |     |     |
| ----------- | -------------- | --------- | --- | --- |
Let us change our input data so that we end up with a different error surface
| and then | see what happens | ... |     |     |
| -------- | ---------------- | --- | --- | --- |
47/94
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture5 |
| --- | -------------- | --- | --------------------- | -------- |

Inthiscase,theerrorishighoneither
| side of the minima  | valley         |     |     |
| ------------------- | -------------- | --- | --- |
| Could momentum      | be detrimental | in  |     |
| such cases... let’s | see....        |     |     |
48/94
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | -------------- | --------------------- | -------- |

| Momentum   | based      | gradient | descent |     |
| ---------- | ---------- | -------- | ------- | --- |
| oscillates | in and out | of the   | minima  |     |
valleyasthemomentumcarriesitout
of the valley
| Takes a | lot of u-turns | before | finally |     |
| ------- | -------------- | ------ | ------- | --- |
converging
| Despite | these u-turns | it still         | con- |     |
| ------- | ------------- | ---------------- | ---- | --- |
| verges  | faster than   | vanilla gradient |      |     |
descent
After100iterationsmomentumbased
| method        | has reached     | an error | of      |     |
| ------------- | --------------- | -------- | ------- | --- |
| 0.00001       | whereas vanilla | gradient | des-    |     |
| cent is still | stuck at        | an error | of 0.36 |     |
49/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Let’s look | at a 3d     | visualization | and a         | different |
| ---------- | ----------- | ------------- | ------------- | --------- |
| geometric  | perspective | of the        | same thing... |           |
50/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

51/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| Module | 5.5 : Nesterov | Accelerated | Gradient | Descent |
| ------ | -------------- | ----------- | -------- | ------- |
52/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Question
| Can we     | do something     | to reduce these | oscillations | ?   |
| ---------- | ---------------- | --------------- | ------------ | --- |
| Yes, let’s | look at Nesterov | accelerated     | gradient     |     |
53/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Intuition
| Look   | before you  | leap |             |     |      |     |
| ------ | ----------- | ---- | ----------- | --- | ---- | --- |
| Recall | that update |      | = γ ·update |     | +η∇w |     |
|        |             | t    |             | t−1 | t    |     |
So we know that we are going to move by at least by γ ·update and then a
t−1
| bit | more by η∇w |     |     |     |     |     |
| --- | ----------- | --- | --- | --- | --- | --- |
t
Why not calculate the gradient (∇w ) at this partially updated value
|     |     |     |     |     | look ahead |     |
| --- | --- | --- | --- | --- | ---------- | --- |
of w (w = w −γ·update ) instead of calculating it using the current
|       | look ahead |     | t   | t−1 |     |     |
| ----- | ---------- | --- | --- | --- | --- | --- |
| value | w          |     |     |     |     |     |
t
| Update | rule for NAG |     |     |      |         |     |
| ------ | ------------ | --- | --- | ---- | ------- | --- |
|        |              | w   | =   | w −γ | ·update |     |
|        |              |     |     | t    | t−1     |     |
lookahead
|     |     | update | =   | γ ·update | +η∇w |     |
| --- | --- | ------ | --- | --------- | ---- | --- |
|     |     |        | t   |           | t−1  |     |
lookahead
|         |              |        | w =  | w −update |     |     |
| ------- | ------------ | ------ | ---- | --------- | --- | --- |
|         |              |        | t+1  | t         | t   |     |
| We will | have similar | update | rule | for b t   |     |     |
54/94
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture5 |
| --- | --- | --- | -------------- | --- | --------------------- | -------- |

55/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

Observations about NAG
Looking ahead helps NAG in correcting its course quicker than momentum
based gradient descent
Hencetheoscillationsaresmallerandthechancesofescapingtheminimavalley
also smaller
56/94
MiteshM.Khapra CS7015(DeepLearning): Lecture5

| Module | 5.6 : Stochastic | And | Mini-Batch | Gradient |
| ------ | ---------------- | --- | ---------- | -------- |
Descent
57/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Let’s   | digress a | bit and       | talk about | the stochastic |     |
| ------- | --------- | ------------- | ---------- | -------------- | --- |
| version | of these  | algorithms... |            |                |     |
58/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|     | Notice           | that the      | algorithm                |      | goes over      | the       | entire |
| --- | ---------------- | ------------- | ------------------------ | ---- | -------------- | --------- | ------ |
|     | data once        | before        | updating                 |      | the parameters |           |        |
|     | Why?             | Because       | this is                  | the  | true gradient  |           | of the |
|     | loss as          | derived       | earlier                  | (sum | of the         | gradients | of     |
|     | the losses       | corresponding |                          | to   | each           | data      | point) |
|     | Noapproximation. |               | Hence,theoreticalguaran- |      |                |           |        |
teeshold(inotherwordseachstepguarantees
|     | that the      | loss          | will decrease) |         |        |       |         |
| --- | ------------- | ------------- | -------------- | ------- | ------ | ----- | ------- |
|     | What’s        | the flipside? |                | Imagine | we     | have  | a mil-  |
|     | lion points   | in            | the training   |         | data.  | To    | make 1  |
|     | update        | to w,b        | the algorithm  |         | makes  | a     | million |
|     | calculations. |               | Obviously      | very    | slow!! |       |         |
|     | Can we        | do something  |                | better  | ? Yes, | let’s | look    |
|     | at stochastic |               | gradient       | descent |        |       |         |
59/94
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture5 |     |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     |     |     | Notice | that the  | algorithm | updates     | the para- |
| --- | --- | --- | ------ | --------- | --------- | ----------- | --------- |
|     |     |     | meters | for every | single    | data point  |           |
|     |     |     | Now if | we have   | a million | data points | we will   |
makeamillionupdatesineachepoch(1epoch
|     |     |     | = 1 pass | over the | data; | 1 step = 1 | update) |
| --- | --- | --- | -------- | -------- | ----- | ---------- | ------- |
Stochastic because we are What is the flipside ? It is an approximate
| estimating | the total | gradi- | (rather | stochastic) | gradient |     |     |
| ---------- | --------- | ------ | ------- | ----------- | -------- | --- | --- |
ent based on a single data No guarantee that each step will decrease the
| point. Almost | like | tossing a |     |     |     |     |     |
| ------------- | ---- | --------- | --- | --- | --- | --- | --- |
loss
| coin only | once and | estimat- |           |      |           |           |         |
| --------- | -------- | -------- | --------- | ---- | --------- | --------- | ------- |
|           |          |          | Let’s see | this | algorithm | in action | when we |
ing P(heads).
|     |     |     | have a | few data | points |     |     |
| --- | --- | --- | ------ | -------- | ------ | --- | --- |
60/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

| We see        | many oscillations. | Why            | ? Be-       |     |     |     |
| ------------- | ------------------ | -------------- | ----------- | --- | --- | --- |
| cause we      | are making         | greedy         | decisions.  |     |     |     |
| Each point    | is trying          | to push        | the para-   |     |     |     |
| meters        | in a direction     | most favorable | to          |     |     |     |
| it (without   | being              | aware of how   | this af-    |     |     |     |
| fects other   | points)            |                |             |     |     |     |
| A parameter   | update             | which is       | locally fa- |     |     |     |
| vorable       | to one point       | may harm       | other       |     |     |     |
| points (its   | almost             | as if the data | points      |     |     |     |
| are competing | with               | each other)    |             |     |     |     |
Indeedweseethatthereisnoguarantee
| that each | local greedy | move reduces | the |     |     |     |
| --------- | ------------ | ------------ | --- | --- | --- | --- |
global error
| Can we   | reduce the     | oscillations | by im-    |                 |               |        |
| -------- | -------------- | ------------ | --------- | --------------- | ------------- | ------ |
| proving  | our stochastic | estimates    | of the    |                 |               |        |
|          |                |              |           | Yes, let’s look | at mini-batch | gradi- |
| gradient | (currently     | estimated    | from just |                 |               |        |
ent descent
| 1 data | point at a | time) |     |     |     |     |
| ------ | ---------- | ----- | --- | --- | --- | --- |
61/94
Yes, let’s look at mini-bMaittecshhM.gKrahadpireant CS7015(DeepLearning): Lecture5
descent

|     | Notice     | that the    | algorithm | up-     |
| --- | ---------- | ----------- | --------- | ------- |
|     | dates the  | parameters  | after     | it sees |
|     | mini batch | size number | of        | data    |
points
|     | The stochastic | estimates      | are | now    |
| --- | -------------- | -------------- | --- | ------ |
|     | slightly       | better         |     |        |
|     | Let’s see      | this algorithm | in  | action |
|     | when we        | have k = 2     |     |        |
62/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

| Even with   | a batch         | size of k=2   | the oscilla- |     |
| ----------- | --------------- | ------------- | ------------ | --- |
| tions have  | reduced         | slightly. Why | ?            |     |
| Because     | we now have     | slightly      | better es-   |     |
| timates     | of the gradient | [analogy:     | we are       |     |
| now tossing | the coin        | k=2 times     | to estim-    |     |
ate P(heads)]
Thehigherthevalueofkthemoreaccurate
are the estimates
| In practice, | typical | values of k | are 16, 32, |     |
| ------------ | ------- | ----------- | ----------- | --- |
64
| Of course, | there are     | still oscillations | and        |     |
| ---------- | ------------- | ------------------ | ---------- | --- |
| they will  | always be     | there as long      | as we are  |     |
| using an   | approximate   | gradient           | as opposed |     |
| to the     | true gradient |                    |            |     |
63/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Some things | to remember     | ....              |            |            |
| ----------- | --------------- | ----------------- | ---------- | ---------- |
| 1 epoch     | = one pass      | over the entire   | data       |            |
| 1 step      | = one update    | of the parameters |            |            |
| N =         | number of data  | points            |            |            |
| B =         | Mini batch size |                   |            |            |
|             |                 | Algorithm         | # of steps | in 1 epoch |
|             | Vanilla         | (Batch) Gradient  | Descent    | 1          |
|             | Stochastic      | Gradient Descent  |            | N          |
|             | Mini-Batch      | Gradient Descent  |            | N          |
B
64/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Similarly,  | we can | have stochastic |         | versions | of       |
| ----------- | ------ | --------------- | ------- | -------- | -------- |
| Momentum    | based  | gradient        | descent | and      | Nesterov |
| accelerated | based  | gradient        | descent |          |          |
65/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

66/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

67/94
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| -------------- | --------------------- | -------- |

| While  | the stochastic |         | versions |                | of both | Mo-      |     |     |
| ------ | -------------- | ------- | -------- | -------------- | ------- | -------- | --- | --- |
| mentum | [red]          | and NAG |          | [blue] exhibit |         | oscilla- |     |     |
b
| tions the | relative | advantage |            | of NAG | over       | Mo- |     |     |
| --------- | -------- | --------- | ---------- | ------ | ---------- | --- | --- | --- |
| mentum    | still    | holds     | (i.e., NAG | takes  | relatively |     |     |     |
shorter u-turns)
| Further        | both     | of     | them    | are             | faster  | than    |     | w   |
| -------------- | -------- | ------ | ------- | --------------- | ------- | ------- | --- | --- |
| stochastic     | gradient |        | descent | (after          | 60      | steps,  |     |     |
| stochastic     | gradient |        | descent | [black          | - top   | figure] |     |     |
| still exhibits |          | a very | high    | error           | whereas | NAG     |     |     |
| and Momentum   |          | are    | close   | to convergence) |         |         |     |     |
b
w
68/94
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- | --- |

| And,     | of course,  | you | can also | have    | the   | mini | batch |
| -------- | ----------- | --- | -------- | ------- | ----- | ---- | ----- |
| version  | of Momentum |     | and      | NAG...I | leave | that | as an |
| exercise | :-)         |     |          |         |       |      |       |
69/94
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

| Module | 5.7 : Tips | for Adjusting | learning | Rate and |
| ------ | ---------- | ------------- | -------- | -------- |
Momentum
70/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Before      | moving  | on to advanced |             | optimization |          |      |
| ----------- | ------- | -------------- | ----------- | ------------ | -------- | ---- |
| algorithms  | let     | us revisit     | the problem | of           | learning | rate |
| in gradient | descent |                |             |              |          |      |
71/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

| One could | argue | that | we  | could | have | solved |     |
| --------- | ----- | ---- | --- | ----- | ---- | ------ | --- |
includegraphics[scale=0.38]images/module7/ss7.png
| the problem |              | of navigating |                | gentle      | slopes | by     |     |
| ----------- | ------------ | ------------- | -------------- | ----------- | ------ | ------ | --- |
| setting     | the learning |               | rate           | high (i.e., | blow   | up     |     |
| the small   | gradient     |               | by multiplying |             | it     | with a |     |
large η)
Letusseewhathappensifwesetthelearn-
| ing rate    | to 10   |          |            |              |            |        |     |
| ----------- | ------- | -------- | ---------- | ------------ | ---------- | ------ | --- |
| On the      | regions | which    | have       | a            | steep      | slope, |     |
| the already | large   | gradient |            | blows        | up further |        |     |
| It would    | be      | good     | to have    | a learning   |            | rate   |     |
| which       | could   | adjust   | to         | the gradient |            | ... we |     |
| will see    | a few   | such     | algorithms |              | soon       |        |     |
72/94
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture5 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- |

| Tips for initial | learning | rate ? |     |     |
| ---------------- | -------- | ------ | --- | --- |
Tune learning rate [Try different values on a log scale: 0.0001, 0.001, 0.01, 0.1.
1.0]
Run a few epochs with each of these and figure out a learning rate which works
best
Now do a finer search around this value [for example, if the best learning rate
| was 0.1 | then now try | some values around | it: 0.05, 0.2, | 0.3] |
| ------- | ------------ | ------------------ | -------------- | ---- |
Disclaimer: these are just heuristics ... no clear winner strategy
73/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Tips for annealing learning | rate |     |     |
| --------------------------- | ---- | --- | --- |
Step Decay:
| Halve the learning | rate after | every 5 epochs or |     |
| ------------------ | ---------- | ----------------- | --- |
Halve the learning rate after an epoch if the validation error is more than what it
| was at the | end of the previous | epoch |     |
| ---------- | ------------------- | ----- | --- |
Exponential Decay: η = η−kt where η and k are hyperparameters and t is
0 0
the step number
1/t Decay: η = η0 where η and k are hyperparameters and t is the step
0
1+kt
number
74/94
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | -------------- | --------------------- | -------- |

Tips for momentum
The following schedule was suggested by Sutskever et. al., 2013
|          | γ          | = min(1−2−1−log2((cid:98)t/250(cid:99)+1),γ |              | )       |
| -------- | ---------- | ------------------------------------------- | ------------ | ------- |
|          |            | t                                           |              | max     |
| where, γ | was chosen | from {0.999,                                | 0.995, 0.99, | 0.9, 0} |
max
75/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 5.8 : Line | Search |     |     |
| ------ | ---------- | ------ | --- | --- |
76/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Just one   | last thing | before | we move on | to some | other |
| ---------- | ---------- | ------ | ---------- | ------- | ----- |
| algorithms | ...        |        |            |         |       |
77/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Inpractice,   | oftenalinesearchisdone |              |        |     |
| ------------- | ---------------------- | ------------ | ------ | --- |
| to find       | a relatively           | better value | of η   |     |
| Update        | w using different      | values       | of η   |     |
| Now retain    | that updated           | value        | of w   |     |
| which         | gives the lowest       | loss         |        |     |
| Esentially    | at each step           | we are       | trying |     |
| tousethebestη | valuefromtheavail-     |              |        |     |
able choices
| What’s | the flipside? | We are | doing |     |
| ------ | ------------- | ------ | ----- | --- |
manymorecomputationsineachstep
| We will    | come back    | to this      | when we |     |
| ---------- | ------------ | ------------ | ------- | --- |
| talk about | second order | optimization |         |     |
methods
78/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Let us      | see line search | in action             |     |     |
| ----------- | --------------- | --------------------- | --- | --- |
| Convergence | is faster       | than vanilla gradient |     |     |
descent
| We see | some oscillations, | but note | that |     |
| ------ | ------------------ | -------- | ---- | --- |
theseoscillationsaredifferentfromwhatwe
| see in momentum |     | and NAG |     |     |
| --------------- | --- | ------- | --- | --- |
79/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 5.9 : Gradient | Descent | with Adaptive | Learning |
| ------ | -------------- | ------- | ------------- | -------- |
Rate
80/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

x1
|     |     | Given this   | network, | it should | be  | easy | to see | that | given a |
| --- | --- | ------------ | -------- | --------- | --- | ---- | ------ | ---- | ------- |
|     |     | single point | (x,y)... |           |     |      |        |      |         |
x2
∇w1 = (f(x)−y)∗f(x)∗(1−f(x))∗x1
∇w2 (f(x)−y)∗f(x)∗(1−f(x))∗x2
| x3         | σ y | =            |                 |         |          |          | ...     | so on     |        |
| ---------- | --- | ------------ | --------------- | ------- | -------- | -------- | ------- | --------- | ------ |
|            |     | If there     | are n points,   | we      | can just | sum      | the     | gradients | over   |
| x4         |     | all the      | n points to get | the     | total    | gradient |         |           |        |
|            |     | What happens | if the          | feature | x2       | is very  | sparse? | (i.e.,    | if its |
| 1          |     | value is     | 0 for most      | inputs) |          |          |         |           |        |
|            |     | ∇w2 will     | be 0 for most   | inputs  | (see     | formula) |         | and hence | w2     |
| y = f(x) = | 1   |              |                 |         |          |          |         |           |        |
|            |     | will not     | get enough      | updates |          |          |         |           |        |
1+e−(w·x+b)
|                   |     | If x2 happens | to be            | sparse | as well  | as important   |          | we        | would |
| ----------------- | --- | ------------- | ---------------- | ------ | -------- | -------------- | -------- | --------- | ----- |
| x = {x1,x2,x3,x4} |     |               |                  |        | w2       |                |          |           |       |
|                   |     | want to       | take the updates |        | to       | more seriously |          |           |       |
|                   |     | Can we        | have a different |        | learning | rate           | for each | parameter |       |
w = {w1,w2,w3,w4}
|     |     | which takes | care of | the frequency |     | of features |     | ?   |     |
| --- | --- | ----------- | ------- | ------------- | --- | ----------- | --- | --- | --- |
81/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture5 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

Intuition
Decay the learning rate for parameters in proportion to their update history
| (more updates | means       | more decay) |        |     |     |
| ------------- | ----------- | ----------- | ------ | --- | --- |
| Update rule   | for Adagrad |             |        |     |     |
|               |             | v =         | v +(∇w | )2  |     |
|               |             | t           | t−1    | t   |     |
η
|     |     | w = | w − √ | ∗∇w |     |
| --- | --- | --- | ----- | --- | --- |
|     |     | t+1 | t     | t   |     |
v t +(cid:15)
| ... and a similar | set of equations | for | b t |     |     |
| ----------------- | ---------------- | --- | --- | --- | --- |
82/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --------------------- | --- | -------- |

| To see    | this in | action   | we need           | to         | first   | create  |     |
| --------- | ------- | -------- | ----------------- | ---------- | ------- | ------- | --- |
| some data | where   | one      | of the            | features   | is      | sparse  |     |
| How would | we      | do this  | in                | our toy    | network | ?       |     |
| Take some | time    | to think | about             | it         |         |         |     |
| Well, our | network | has      | just two          | parameters |         | (w      |     |
| and b).   | Of      | these,   | the input/feature |            |         | corres- |     |
pondingtobisalwayson(socan’treallymake
it sparse)
| The only  | option                       | is to | make | x sparse |     |     |     |
| --------- | ---------------------------- | ----- | ---- | -------- | --- | --- | --- |
| Solution: | Wecreated100random(x,y)pairs |       |      |          |     |     |     |
andthenforroughly80%ofthesepairsweset
xto0thereby,makingthefeatureforwsparse
83/94
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture5 |
| --- | --- | --- | -------------- | --- | --- | --------------------- | -------- |

| GD (black), | momentum     |           | (red)       | and      | NAG        | (blue)   |     |
| ----------- | ------------ | --------- | ----------- | -------- | ---------- | -------- | --- |
| There       | is something |           | interesting |          | that these | 3 al-    |     |
| gorithms    | are          | doing for | this        | dataset. | Can        | you spot |     |
it?
| Initially, | all      | three algorithms |            | are       | moving  | mainly      |     |
| ---------- | -------- | ---------------- | ---------- | --------- | ------- | ----------- | --- |
| along the  | vertical | (b)              | axis       | and there | is      | very little |     |
| movement   | along    | the              | horizontal | (w)       | axis    |             |     |
| Why?       | Because  | in our           | data,      | the       | feature | corres-     |     |
Let’s see what Adagrad
| ponding | to w | is sparse | and | hence | w   | undergoes |     |
| ------- | ---- | --------- | --- | ----- | --- | --------- | --- |
does....
| very few      | updates    | ...on      | the    | other    | hand     | b is very |     |
| ------------- | ---------- | ---------- | ------ | -------- | -------- | --------- | --- |
| dense and     | undergoes  |            | many   | updates  |          |           |     |
| Such sparsity |            | is very    | common |          | in large | neural    |     |
| networks      | containing |            | 1000s  | of input | features | and       |     |
| hence we      | need       | to address | it     |          |          |           |     |
84/94
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture5 |
| --- | --- | --- | -------------- | --- | --- | --------------------- | -------- |

| By using       | a parameter     | specific    | learning       |             | rate it   |     |
| -------------- | --------------- | ----------- | -------------- | ----------- | --------- | --- |
| ensures        | that despite    | sparsity    | w              | gets        | a higher  |     |
| learning       | rate and hence  |             | larger updates |             |           |     |
| Further,       | it also ensures |             | that if        | b undergoes | a         |     |
| lot of updates | its             | effective   | learning       |             | rate de-  |     |
| creases        | because of      | the growing | denominator    |             |           |     |
| In practice,   | this does       | not         | work           | so well     | if we     |     |
| remove         | the square      | root        | from the       | denominator |           |     |
| (something     | to ponder       | about)      |                |             |           |     |
| What’s         | the flipside?   | over        | time           | the         | effective |     |
| learning       | ratefor bwill   | decay       | toan           | extent      | that      |     |
| there will     | be no further   |             | updates        | to b        |           |     |
| Can we         | avoid this?     |             |                |             |           |     |
85/94
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture5 |
| --- | --- | --- | -------------- | --- | --------------------- | -------- |

Intuition
Adagrad decays the learning rate very aggressively (as the denominator grows)
As a result after a while the frequent parameters will start receiving very small
| updates | because | of the decayed | learning |     | rate |     |     |
| ------- | ------- | -------------- | -------- | --- | ---- | --- | --- |
To avoid this why not decay the denominator and prevent its rapid growth
| Update rule | for RMSProp |     |       |           |     |     |     |
| ----------- | ----------- | --- | ----- | --------- | --- | --- | --- |
|             |             | v   | = β∗v | +(1−β)(∇w |     | )2  |     |
|             |             |     | t     | t−1       |     | t   |     |
η
|                   |        | w         | = w − | √   | ∗∇w       |     |     |
| ----------------- | ------ | --------- | ----- | --- | --------- | --- | --- |
|                   |        | t+1       | t     |     |           | t   |     |
|                   |        |           |       | v t | +(cid:15) |     |     |
| ... and a similar | set of | equations | for b | t   |           |     |     |
86/94
|     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture5 |
| --- | --- | -------------- | --- | --- | --------------------- | --- | -------- |

Adagrad got stuck when it was close RMSProp overcomes this problem by
to convergence (it was no longer able being less aggressive on the decay
| to move | in the vertical | (b) direction  |     |     |
| ------- | --------------- | -------------- | --- | --- |
| because | of the decayed  | learning rate) |     |     |
87/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Intuition
Do everything that RMSProp does to solve the decay problem of Adagrad
| Plus use     | a cumulative | history of    | the gradients |     |
| ------------ | ------------ | ------------- | ------------- | --- |
| In practice, | β = 0.9      | and β = 0.999 |               |     |
|              | 1            | 2             |               |     |
| Update rule  | for Adam     |               |               |     |
|              | m            | = β ∗m        | +(1−β )∗∇w    |     |
|              |              | t 1 t−1       | 1             | t   |
)2
|     | v   | = β ∗v +(1−β | )∗(∇w  |     |
| --- | --- | ------------ | ------ | --- |
|     |     | t 2 t−1      | 2 t    |     |
|     |     | m            | v      |     |
|     |     | t            | t      |     |
|     | mˆ  | =            | vˆ =   |     |
|     |     | t 1−βt       | t 1−βt |     |
|     |     | 1            | 2      |     |
η
|     | w   | = w − √ | ∗mˆ       |     |
| --- | --- | ------- | --------- | --- |
|     | t+1 | t       | t         |     |
|     |     | vˆ      | +(cid:15) |     |
t
|     |     | ... and a similar | set of equations | for b |
| --- | --- | ----------------- | ---------------- | ----- |
t
88/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Asexpected, | takingacumulativehis- |        |     |     |
| ----------- | --------------------- | ------ | --- | --- |
| tory gives  | a speed               | up ... |     |     |
89/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Million dollar | question: | Which algorithm | to use in practice |     |
| -------------- | --------- | --------------- | ------------------ | --- |
Adam seems to be more or less the default choice now (β 1 = 0.9, β 2 = 0.999
| and (cid:15) | = 1e−8 ) |     |     |     |
| ------------ | -------- | --- | --- | --- |
Although it is supposed to be robust to initial learning rates, we have observed
that for sequence generation problems η = 0.001,0.0001 works best
Having said that, many papers report that SGD with momentum (Nesterov
or classical) with a simple annealing learning rate schedule also works well
in practice (typically, starting with η = 0.001,0.0001 for sequence generation
problems)
| Adam | might just be | the best choice | overall!! |     |
| ---- | ------------- | --------------- | --------- | --- |
Some recent work suggest that there is a problem with Adam and it will not
| converge | in some cases |     |     |     |
| -------- | ------------- | --- | --- | --- |
90/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

| Explanation | for why | we need bias correction | in Adam |     |
| ----------- | ------- | ----------------------- | ------- | --- |
91/94
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture5 |
| --- | --- | -------------- | --------------------- | -------- |

Notethatwearetakingarunningaverage
| Update | rule | for Adam |     |     |                  |     |      |     |     |     |
| ------ | ---- | -------- | --- | --- | ---------------- | --- | ---- | --- | --- | --- |
|        |      |          |     |     | of the gradients |     | as m |     |     |     |
t
|     |       |       |      |     | The reason | we  | are  | doing    | this is | that we  |
| --- | ----- | ----- | ---- | --- | ---------- | --- | ---- | -------- | ------- | -------- |
| m   | =β ∗m | +(1−β | )∗∇w |     | don’t want | to  | rely | too much | on      | the cur- |
| t   | 1     | t−1   | 1    | t   |            |     |      |          |         |          |
rentgradientandinsteadrelyontheover-
| v   | =β ∗v | +(1−β | )∗(∇w | )2  |               |     |        |           |      |      |
| --- | ----- | ----- | ----- | --- | ------------- | --- | ------ | --------- | ---- | ---- |
| t   | 2     | t−1   | 2     | t   |               |     |        |           |      |      |
|     | m     |       |       |     | all behaviour |     | of the | gradients | over | many |
t
| mˆ t | =   |     |     |     | timesteps |     |     |     |     |     |
| ---- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- |
1−βt
1
|     | v   |     |     |     | One way        | of  | looking | at       | this is | that we |
| --- | --- | --- | --- | --- | -------------- | --- | ------- | -------- | ------- | ------- |
| vˆ  | = t |     |     |     |                |     |         |          |         |         |
| t   |     |     |     |     | are interested |     | in the  | expected | value   | of the  |
1−βt
|     |     | 2   |     |     | gradients | and | not on | a single | point | estim- |
| --- | --- | --- | --- | --- | --------- | --- | ------ | -------- | ----- | ------ |
η
| w   | =w − | √   | ∗mˆ |     |              |     |         |     |     |     |
| --- | ---- | --- | --- | --- | ------------ | --- | ------- | --- | --- | --- |
| t+1 | t    |     | t   |     | ate computed |     | at time | t   |     |     |
vˆ t +(cid:15)
|     |     |     |     |     | However,insteadofcomputingE[∇w |     |     |     |     | ]we |
| --- | --- | --- | --- | --- | ------------------------------ | --- | --- | --- | --- | --- |
t
|     |     |     |     |     | are computing |     | m   | as the | exponentially |     |
| --- | --- | --- | --- | --- | ------------- | --- | --- | ------ | ------------- | --- |
t
|     |     |     |     |     | moving  | average  |      |     |        |          |
| --- | --- | --- | --- | --- | ------- | -------- | ---- | --- | ------ | -------- |
|     |     |     |     |     | Ideally | we would | want | E[m | t ] to | be equal |
|     |     |     |     |     | to E[∇w | ]        |      |     |        |          |
t
|     |     |     |     |     | Let us see | if that | is  | the case |     |     |
| --- | --- | --- | --- | --- | ---------- | ------- | --- | -------- | --- | --- |
92/94
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture5 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

| Forconveniencewewilldenote∇w | t asg t      | andβ 1 asβ |     |     |
| ---------------------------- | ------------ | ---------- | --- | --- |
|                              | m t =β∗m t−1 | +(1−β)∗g   | t   |     |
m =0
0
m =βm +(1−β)g
|     | 1 0     | 1   |     |     |
| --- | ------- | --- | --- | --- |
|     | =(1−β)g | 1   |     |     |
m =βm +(1−β)g
|     | 2 1      | 2       |     |     |
| --- | -------- | ------- | --- | --- |
|     | =β(1−β)g | +(1−β)g |     |     |
1 2
|     | m 3 =βm 2 +(1−β)g | 3        |          |     |
| --- | ----------------- | -------- | -------- | --- |
|     | =β(β(1−β)g        | +(1−β)g  | )+(1−β)g |     |
|     |                   | 1        | 2        | 3   |
|     | =β2(1−β)g         | +β(1−β)g | +(1−β)g  |     |
|     |                   | 1        | 2        | 3   |
3
(cid:88) β3−ig
|     | =(1−β) | i   |     |     |
| --- | ------ | --- | --- | --- |
i=1
Ingeneral,
(cid:88) t
|     | m   | =(1−β) | βt−ig |     |
| --- | --- | ------ | ----- | --- |
|     | t   |        | i     |     |
i=1
93/94
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture5 |
| --- | -------------- | --------------------- | --- | -------- |

| Sowehave,m                   |     | =(1−β) | (cid:80)t | βt−ig |     |            | (cid:88) t |            |
| ---------------------------- | --- | ------ | --------- | ----- | --- | ---------- | ---------- | ---------- |
|                              |     | t      | i=1       | i     |     | E[m]=(1−β) |            | (β)t−iE[g] |
| TakingExpectationonbothsides |     |        |           |       |     | t          |            | i          |
i=1
|     |              |     | t        |        |     |                              |     | (cid:88) t |
| --- | ------------ | --- | -------- | ------ | --- | ---------------------------- | --- | ---------- |
|     |              |     | (cid:88) | βt−ig] |     | =E[g](1−β)                   |     | (β)t−i     |
|     | E[m]=E[(1−β) | t   |          | i      |     |                              |     |            |
|     |              |     | i=1      |        |     |                              |     | i=1        |
|     |              |     | t        |        |     | =E[g](1−β)(βt−1+βt−2+···+β0) |     |            |
(cid:88) βt−ig
|     | E[m | t ]=(1−β)E[ |     | i ] |     |            |     | 1−βt |
| --- | --- | ----------- | --- | --- | --- | ---------- | --- | ---- |
|     |     |             | i=1 |     |     | =E[g](1−β) |     |      |
1−β
t
(cid:88)
|     | E[m | ]=(1−β) | E[βt−ig | ]   | thelastfractionisthesumofaGPwithcommon |     |     |     |
| --- | --- | ------- | ------- | --- | -------------------------------------- | --- | --- | --- |
|     |     | t       |         | i   |                                        |     |     |     |
i=1
ratio=β
t
(cid:88)
|     |     | =(1−β) | βt−iE[g | ]   |     |     | ]=E[g](1−βt) |     |
| --- | --- | ------ | ------- | --- | --- | --- | ------------ | --- |
|     |     |        |         | i   |     |     | E[m t        |     |
i=1
m t
|     |     |     |     |     |     | E[  | ]=E[g] |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | --- |
1−βt
| A s s u | m p t i o | n: A ll g ’s c | om e fr o m | thesame |     |     |     |     |
| ------- | --------- | -------------- | ----------- | ------- | --- | --- | --- | --- |
|         |           | i              |             |         |     |     |     | m t |
di s t ri bu t i o n i. e. E [ g ] = E [g ] ∀ i E[mˆ t ]=E[g](∵ =mˆ t )
|     |     | i   |     |     |     |     |     | 1− βt |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- |
Henceweapplythebiascorrectionbecausethen
|     |     |     |     |     | theexpectedvalueofmˆ |     |     | t isthesameasthe |
| --- | --- | --- | --- | --- | -------------------- | --- | --- | ---------------- |
|     |     |     |     |     | expectedvalueofg     |     | t   |                  |
94/94
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture5 |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- |
