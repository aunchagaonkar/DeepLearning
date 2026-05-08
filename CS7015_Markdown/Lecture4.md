| CS7015      | (Deep Learning): |           | Lecture         | 4   |
| ----------- | ---------------- | --------- | --------------- | --- |
| Feedforward | Neural Networks, |           | Backpropagation |     |
|             | Mitesh           | M. Khapra |                 |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/9
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |
| --- | -------------- | --------------------- | --- | -------- |

References/Acknowledgments
See the excellent videos by Hugo Larochelle on Backpropagation
2/9
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| -------------- | --------------------- | -------- |

| Module       | 4.1: Feedforward |     | Neural   | Networks | (a.k.a. |
| ------------ | ---------------- | --- | -------- | -------- | ------- |
| multilayered | network          | of  | neurons) |          |         |
3/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|     |       |      |     |     | The | input | to the | network | is  | an n-dimensional |     |     |
| --- | ----- | ---- | --- | --- | --- | ----- | ------ | ------- | --- | ---------------- | --- | --- |
| h   | = yˆ= | f(x) |     |     |     |       |        |         |     |                  |     |     |
L
vector
|     |     |     |     |     | The  | network | contains | L−1       | hidden |     | layers | (2, in |
| --- | --- | --- | --- | --- | ---- | ------- | -------- | --------- | ------ | --- | ------ | ------ |
|     | a   |     |     |     | this | case)   | having   | n neurons | each   |     |        |        |
3
|     | W 3 |     |     |     | Finally, | there | is  | one output | layer | containing |     | k   |
| --- | --- | --- | --- | --- | -------- | ----- | --- | ---------- | ----- | ---------- | --- | --- |
b 3
h
|     | 2   |     |     |     | neurons | (say,    | corresponding |           | to    | k classes)     |        |       |
| --- | --- | --- | --- | --- | ------- | -------- | ------------- | --------- | ----- | -------------- | ------ | ----- |
|     |     |     |     |     | Each    | neuron   | in the        | hidden    | layer | and            | output | layer |
| a   |     |     |     |     | can     | be split | into          | two parts | :     | pre-activation |        | and   |
2
W
|     | 2   |     |     | b   | activation |     | (a i and | h i are | vectors) |     |     |     |
| --- | --- | --- | --- | --- | ---------- | --- | -------- | ------- | -------- | --- | --- | --- |
| h   |     |     |     | 2   |            |     |          |         |          |     |     |     |
1
|     |     |     |     |     | The | input  | layer | can be | called     | the 0-th | layer | and |
| --- | --- | --- | --- | --- | --- | ------ | ----- | ------ | ---------- | -------- | ----- | --- |
|     |     |     |     |     | the | output | layer | can be | called the | (L)-th   | layer |     |
a
| 1   |     |     |     |     | W       | ∈ Rn×n | and | b ∈ Rn | are the | weight | and | bias |
| --- | --- | --- | --- | --- | ------- | ------ | --- | ------ | ------- | ------ | --- | ---- |
|     | W   |     |     |     | i       |        |     | i      |         |        |     |      |
|     | 1   |     |     | b   |         |        |     |        |         |        |     |      |
|     |     |     |     | 1   | between | layers | i−1 | and    | i (0 <  | i < L) |     |      |
|     |     |     |     |     | W       | ∈ Rn×k | and | b ∈ Rk | are the | weight | and | bias |
|     | x   | x   | x   |     | L       |        |     | L      |         |        |     |      |
|     | 1   | 2   | n   |     |         |        |     |        |         |        |     |      |
betweenthelasthiddenlayerandtheoutputlayer
|     |     |     |     |     | (L = | 3 in | this case) |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---- | ---- | ---------- | --- | --- | --- | --- | --- |
4/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

| h   | = yˆ= | f(x) |     |     |                |     |       |       |            |     |     |
| --- | ----- | ---- | --- | --- | -------------- | --- | ----- | ----- | ---------- | --- | --- |
|     | L     |      |     | The | pre-activation |     | at    | layer | i is given | by  |     |
|     |       |      |     |     |                | a   | (x) = | b +W  | h          | (x) |     |
|     |       |      |     |     |                | i   |       | i     | i i−1      |     |     |
a
3
|     | W 3 |     |     | The | activation |     | at layer | i is | given | by  |     |
| --- | --- | --- | --- | --- | ---------- | --- | -------- | ---- | ----- | --- | --- |
b 3
h
2
|     |     |     |     |     |     |     | h (x) | = g(a | (x)) |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | ----- | ---- | --- | --- |
|     |     |     |     |     |     |     | i     |       | i    |     |     |
a 2
|     |     |     |     | where | g   | is called | the | activation |     | function | (for |
| --- | --- | --- | --- | ----- | --- | --------- | --- | ---------- | --- | -------- | ---- |
W
|     | 2   |     | b 2 |          |     |           |       |         |       |     |     |
| --- | --- | --- | --- | -------- | --- | --------- | ----- | ------- | ----- | --- | --- |
| h   |     |     |     | example, |     | logistic, | tanh, | linear, | etc.) |     |     |
1
|     |     |     |     | The | activation |     | at the | output | layer | is given | by  |
| --- | --- | --- | --- | --- | ---------- | --- | ------ | ------ | ----- | -------- | --- |
a
| 1   |     |     |     |     |     | f(x) | = h | (x) = | O(a | (x)) |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | ----- | --- | ---- | --- |
|     | W   |     |     |     |     |      |     | L     |     | L    |     |
|     | 1   |     | b   |     |     |      |     |       |     |      |     |
1
|     |     |     |                | where    | O                     | is the   | output  | activation |       | function | (for         |
| --- | --- | --- | -------------- | -------- | --------------------- | -------- | ------- | ---------- | ----- | -------- | ------------ |
| x   | 1   | x 2 | x n            | example, |                       | softmax, | linear, | etc.)      |       |          |              |
|     |     |     |                | To       | simplify              | notation |         | we will    | refer | to a     | i (x) as a i |
|     |     |     |                | and      | h (x)                 | as h     |         |            |       |          |              |
|     |     |     |                |          | i                     | i        |         |            |       |          | 5/9          |
|     |     |     | MiteshM.Khapra |          | CS7015(DeepLearning): |          |         | Lecture4   |       |          |              |

| h   | = yˆ= | f(x) |     |     |                |     |       |               |     |
| --- | ----- | ---- | --- | --- | -------------- | --- | ----- | ------------- | --- |
|     | L     |      |     | The | pre-activation | at  | layer | i is given by |     |
|     |       |      |     |     |                | a = | b +W  | h             |     |
|     |       |      |     |     |                | i   | i     | i i−1         |     |
a
3
|     | W 3 |     |     | The | activation | at layer | i is | given by |     |
| --- | --- | --- | --- | --- | ---------- | -------- | ---- | -------- | --- |
b 3
h
2
|     |     |     |     |     |     | h   | = g(a | )   |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- |
|     |     |     |     |     |     |     | i     | i   |     |
a 2
|     |     |     |     | where | g is | called the | activation | function | (for |
| --- | --- | --- | --- | ----- | ---- | ---------- | ---------- | -------- | ---- |
W
|     | 2   |     | b 2 |          |           |       |         |       |     |
| --- | --- | --- | --- | -------- | --------- | ----- | ------- | ----- | --- |
| h   |     |     |     | example, | logistic, | tanh, | linear, | etc.) |     |
1
|     |     |     |     | The | activation | at the | output | layer is given | by  |
| --- | --- | --- | --- | --- | ---------- | ------ | ------ | -------------- | --- |
a
| 1   |     |     |     |     |     | f(x) = | h = | O(a ) |     |
| --- | --- | --- | --- | --- | --- | ------ | --- | ----- | --- |
|     | W   |     |     |     |     |        | L   | L     |     |
|     | 1   |     | b   |     |     |        |     |       |     |
1
|     |     |     |     | where    | O is     | the output | activation | function | (for |
| --- | --- | --- | --- | -------- | -------- | ---------- | ---------- | -------- | ---- |
| x   | 1   | x 2 | x n | example, | softmax, | linear,    | etc.)      |          |      |
6/9
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

| h   | = yˆ= | f(x) |     |     |       |         |     |     |     |     |
| --- | ----- | ---- | --- | --- | ----- | ------- | --- | --- | --- | --- |
|     | L     |      |     |     |       |         | }N  |     |     |     |
|     |       |      |     |     | Data: | {x i ,y | i   |     |     |     |
i=1
Model:
a
3
|     |     |     |     |     | yˆ = | f(x ) = | O(W g(W | g(W | x+b )+b | )+b ) |
| --- | --- | --- | --- | --- | ---- | ------- | ------- | --- | ------- | ----- |
|     | W 3 |     |     |     | i    | i       | 3       | 2   | 1 1     | 2 3   |
b 3
h
2
Parameters:
|     |     |     |     |     | θ   | = W ,..,W | ,b ,b | ,...,b | (L = 3) |     |
| --- | --- | --- | --- | --- | --- | --------- | ----- | ------ | ------- | --- |
| a 2 |     |     |     |     |     | 1         | L 1   | 2 L    |         |     |
W
|     | 2   |     |     | b 2 | Algorithm: |     | Gradient | Descent | with | Back- |
| --- | --- | --- | --- | --- | ---------- | --- | -------- | ------- | ---- | ----- |
h
| 1   |     |     |     |     | propagation          |     | (we will | see soon) |      |     |
| --- | --- | --- | --- | --- | -------------------- | --- | -------- | --------- | ---- | --- |
|     |     |     |     |     | Objective/Loss/Error |     |          | function: | Say, |     |
a
| 1   |     |     |     |     |     |     |     | N                  | k      |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------------ | ------ | --- |
|     | W   |     |     |     |     |     |     | 1 (cid:88)(cid:88) |        |     |
|     | 1   |     |     | b   |     |     | min |                    | (yˆ −y | )2  |
|     |     |     |     | 1   |     |     |     |                    | ij     | ij  |
N
i=1 j=1
|     | x 1 | x 2 | x n |     |     |             |     |      |     |     |
| --- | --- | --- | --- | --- | --- | ----------- | --- | ---- | --- | --- |
|     |     |     |     |     |     | In general, | min | L(θ) |     |     |
L(θ)
|     |     |     |     |     | where |     | is some function |     | of the parameters |     |
| --- | --- | --- | --- | --- | ----- | --- | ---------------- | --- | ----------------- | --- |
7/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

| Module | 4.2: Learning | Parameters  | of Feedforward |     |
| ------ | ------------- | ----------- | -------------- | --- |
| Neural | Networks      | (Intuition) |                |     |
8/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

The story so far...
| We have introduced | feedforward | neural networks |     |
| ------------------ | ----------- | --------------- | --- |
We are now interested in finding an algorithm for learning the parameters of
this model
9/9
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | -------------- | --------------------- | -------- |

| h   | = yˆ= | f(x) |     |     |            |              |           |           |
| --- | ----- | ---- | --- | --- | ---------- | ------------ | --------- | --------- |
|     | L     |      |     |     | Recall     | our gradient | descent   | algorithm |
|     |       |      |     |     | Algorithm: | gradient     | descent() |           |
a
|     | 3   |     |     |     | t ← 0;         |     |         |     |
| --- | --- | --- | --- | --- | -------------- | --- | ------- | --- |
|     | W 3 |     |     |     | max iterations |     | ← 1000; |     |
b 3
h
|     | 2   |     |     |     | Initialize | w ,b | ;   |     |
| --- | --- | --- | --- | --- | ---------- | ---- | --- | --- |
0 0
|     |     |     |     |     | while | t++ < max | iterations | do  |
| --- | --- | --- | --- | --- | ----- | --------- | ---------- | --- |
|     |     |     |     |     | w     | ← w −η∇w  | ;          |     |
| a 2 |     |     |     |     | t+1   | t         | t          |     |
|     | W   |     |     |     | b     | ← b −η∇b  | ;          |     |
|     | 2   |     |     | b 2 | t+1   | t         | t          |     |
h
| 1   |     |     |     |     | end |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
a
1
W
|     | 1   |     |     | b   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
1
|     | x 1 | x 2 | x n |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
10/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | -------- | --- |

| h   | = yˆ= | f(x) |     |     |            |       |          |           |           |     |
| --- | ----- | ---- | --- | --- | ---------- | ----- | -------- | --------- | --------- | --- |
|     | L     |      |     |     | Recall     | our   | gradient | descent   | algorithm |     |
|     |       |      |     |     | We can     | write | it more  | concisely | as        |     |
|     | a     |      |     |     | Algorithm: |       | gradient | descent() |           |     |
3
|     | W 3 |     |     |     | t ← 0; |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
b 3
h
|     | 2   |     |     |     | max iterations |       | ←   | 1000;      |     |     |
| --- | --- | --- | --- | --- | -------------- | ----- | --- | ---------- | --- | --- |
|     |     |     |     |     | Initialize     |       | θ = | [w ,b ];   |     |     |
|     |     |     |     |     |                |       | 0   | 0 0        |     |     |
|     |     |     |     |     | while          | t++ < | max | iterations | do  |     |
a 2
|     | W   |     |     |     | θ   | ←   | θ −η∇θ | ;   |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- |
|     | 2   |     |     | b 2 | t+1 |     | t      | t   |     |     |
h
| 1   |     |     |     |     | end   |     |              |               |     |     |
| --- | --- | --- | --- | --- | ----- | --- | ------------ | ------------- | --- | --- |
|     |     |     |     |     |       |     | (cid:2)∂L(θ) | ∂L(θ)(cid:3)T |     |     |
|     |     |     |     |     | where | ∇θ  | =            | ,             |     |     |
| a   |     |     |     |     |       | t   | ∂wt          | ∂bt           |     |     |
1
|     | W   |     |     |     | Now, | in this | feedforward |     | neural | network, |
| --- | --- | --- | --- | --- | ---- | ------- | ----------- | --- | ------ | -------- |
|     | 1   |     |     | b   |      |         |             |     |        |          |
1
|     |     |     |     |     | instead  | of      | θ          | = [w,b]      | we have        | θ = |
| --- | --- | --- | --- | --- | -------- | ------- | ---------- | ------------ | -------------- | --- |
|     | x 1 | x 2 | x n |     | [W 1 ,W  | 2 ,..,W | L ,b       | 1 ,b 2 ,..,b | L ]            |     |
|     |     |     |     |     | We can   | still   | use        | the          | same algorithm | for |
|     |     |     |     |     | learning | the     | parameters |              | of our model   |     |
11/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

| h   | = yˆ= | f(x) |     |     |            |       |          |           |           |     |     |
| --- | ----- | ---- | --- | --- | ---------- | ----- | -------- | --------- | --------- | --- | --- |
|     | L     |      |     |     | Recall     | our   | gradient | descent   | algorithm |     |     |
|     |       |      |     |     | We can     | write | it more  | concisely | as        |     |     |
|     | a     |      |     |     | Algorithm: |       | gradient | descent() |           |     |     |
3
|     | W 3 |     |     |     | t ← 0; |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
b 3
h
|     | 2   |     |     |     | max | iterations | ←   | 1000; |     |     |     |
| --- | --- | --- | --- | --- | --- | ---------- | --- | ----- | --- | --- | --- |
[W0,...,W0,b0,...,b0];
|     |     |     |     |     | Initialize |       | θ = |            |     |     |     |
| --- | --- | --- | --- | --- | ---------- | ----- | --- | ---------- | --- | --- | --- |
|     |     |     |     |     |            |       | 0   | 1          | L 1 | L   |     |
|     |     |     |     |     | while      | t++ < | max | iterations | do  |     |     |
a 2
|     | W   |     |     |     | θ   | ←   | θ −η∇θ | ;   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- |
|     | 2   |     |     | b 2 | t+1 |     | t      | t   |     |     |     |
h
| 1   |     |     |     |     | end |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:2)∂L(θ),.,∂L(θ),∂L(θ),.,∂L(θ)(cid:3)T
|     |     |     |     |     | where | ∇θ = |       |       |       |       |     |
| --- | --- | --- | --- | --- | ----- | ---- | ----- | ----- | ----- | ----- | --- |
| a   |     |     |     |     |       | t    | ∂W1,t | ∂WL,t | ∂b1,t | ∂bL,t |     |
1
|     | W   |     |     |     | Now, | in this | feedforward |     | neural | network, |     |
| --- | --- | --- | --- | --- | ---- | ------- | ----------- | --- | ------ | -------- | --- |
|     | 1   |     |     | b   |      |         |             |     |        |          |     |
1
|     |     |     |     |     | instead  | of      | θ          | = [w,b]      | we             | have | θ = |
| --- | --- | --- | --- | --- | -------- | ------- | ---------- | ------------ | -------------- | ---- | --- |
|     | x 1 | x 2 | x n |     | [W 1 ,W  | 2 ,..,W | L ,b       | 1 ,b 2 ,..,b | L ]            |      |     |
|     |     |     |     |     | We can   | still   | use        | the          | same algorithm |      | for |
|     |     |     |     |     | learning | the     | parameters |              | of our model   |      |     |
12/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

Except that now our ∇θ looks much more nasty
 ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) 
... ... ... ... ...
∂W111 ∂W11n ∂W211 ∂W21n ∂WL,11 ∂W
L,1k
∂W
L,1k
∂b11 ∂bL1
 
 
∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ)
 ... ... ... ... ... 
∂W121 ∂W12n ∂W221 ∂W22n ∂WL,21 ∂W L,2k ∂W L,2k ∂b12 ∂bL2 
 . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
 . . . . . . . . . . . . . . 
 
∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ) ∂L(θ)
... ... ... ... ...
∂W1n1 ∂W1nn ∂W2n1 ∂W2nn ∂WL,n1 ∂W
L,nk
∂W
L,nk
∂b1n ∂b
Lk
∇θ is thus composed of
∇W ,∇W ,...∇W ∈ Rn×n,∇W ∈ Rn×k,
1 2 L−1 L
∇b ,∇b ,...,∇b ∈ Rn and ∇b ∈ Rk
1 2 L−1 L
13/9
MiteshM.Khapra CS7015(DeepLearning): Lecture4

| We  | need to | answer | two | questions |     |     |     |
| --- | ------- | ------ | --- | --------- | --- | --- | --- |
L(θ)?
|     | How to | choose  | the | loss function |             |        |     |
| --- | ------ | ------- | --- | ------------- | ----------- | ------ | --- |
|     | How to | compute | ∇θ  | which         | is composed | of     |     |
|     |        |         |     | Rn×n,∇W       |             | Rn×k   |     |
|     | ∇W ,∇W | ,...,∇W |     | ∈             |             | ∈      |     |
|     | 1      | 2       |     | L−1           |             | L      |     |
|     | ∇b ,∇b | ,...,∇b |     | ∈ Rn and      | ∇b          | ∈ Rk ? |     |
|     | 1      | 2       | L−1 |               |             | L      |     |
14/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- |

| Module | 4.3: Output | Functions | and Loss | Functions |
| ------ | ----------- | --------- | -------- | --------- |
15/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| We  | need to | answer | two | questions |     |     |     |
| --- | ------- | ------ | --- | --------- | --- | --- | --- |
L(θ)
|     | How to | choose  | the | loss function |             | ?      |     |
| --- | ------ | ------- | --- | ------------- | ----------- | ------ | --- |
|     | How to | compute | ∇θ  | which         | is composed | of:    |     |
|     |        |         |     | Rn×n,∇W       |             | Rn×k   |     |
|     | ∇W ,∇W | ,...,∇W |     | ∈             |             | ∈      |     |
|     | 1      | 2       |     | L−1           |             | L      |     |
|     | ∇b ,∇b | ,...,∇b |     | ∈ Rn and      | ∇b          | ∈ Rk ? |     |
|     | 1      | 2       | L−1 |               |             | L      |     |
16/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- |

|     |        |     |     |      |     | The choice     | of  | loss function |     | depends |
| --- | ------ | --- | --- | ---- | --- | -------------- | --- | ------------- | --- | ------- |
| y   | = {7.5 |     | 8.2 | 7.7} |     | on the problem |     | at hand       |     |         |
i
|     | imdb   | Critics        |     | RT     |     | We will         | illustrate | this   | with       | the help |
| --- | ------ | -------------- | --- | ------ | --- | --------------- | ---------- | ------ | ---------- | -------- |
|     | Rating | Rating         |     | Rating |     | of two examples |            |        |            |          |
|     |        |                |     |        |     | Consider        | our        | movie  | example    | again    |
|     |        |                |     |        |     | but this        | time       | we are | interested | in       |
|     |        |                |     |        |     | predicting      | ratings    |        |            |          |
|     |        | Neural network |     | with   |     |                 |            |        |            |          |
|     |        |                |     |        |     | Here y ∈        | R3         |        |            |          |
i
|     |     | L−1 hidden |     | layers |     |           |          |             |         |            |
| --- | --- | ---------- | --- | ------ | --- | --------- | -------- | ----------- | ------- | ---------- |
|     |     |            |     |        |     | The loss  | function | should      | capture | how        |
|     |     |            |     |        |     | much yˆ   | deviates | from        | y       |            |
|     |     |            |     |        |     | i         |          |             | i       |            |
|     |     |            |     |        |     | If y ∈ Rn | then     | the squared |         | error loss |
i
|         |     |            |     |       |         | can capture | this | deviation         |        |     |
| ------- | --- | ---------- | --- | ----- | ------- | ----------- | ---- | ----------------- | ------ | --- |
| isActor |     | isDirector |     |       |         |             |      | N 3               |        |     |
|         |     | . .        | .   | . . . | . . . . |             | 1    | (cid:88) (cid:88) |        | )2  |
|         |     |            |     |       |         | L(θ)        | =    |                   | (yˆ −y |     |
| Damon   |     | Nolan      |     |       |         |             | N    |                   | ij     | ij  |
|         |     |            | x   |       |         |             |      | i=1 j=1           |        |     |
i
17/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- | --- | --- | --- |

| h = yˆ= | f(x) |     |     |           |           |      |            |
| ------- | ---- | --- | --- | --------- | --------- | ---- | ---------- |
| L       |      |     |     | A related | question: | What | should the |
R?
|     |     |     |     | output | function | ‘O’ be if | y ∈ |
| --- | --- | --- | --- | ------ | -------- | --------- | --- |
i
Morespecifically,canitbethelogistic
a
3
function?
W 3
|     |     |     | b 3 |             |              |         |               |
| --- | --- | --- | --- | ----------- | ------------ | ------- | ------------- |
| h   |     |     |     | No, because | it restricts |         | yˆ to a value |
| 2   |     |     |     |             |              |         | i             |
|     |     |     |     | between     | 0 & 1 but    | we want | yˆ ∈ R        |
i
|     |     |     |     | So, in | such cases | it makes | sense to |
| --- | --- | --- | --- | ------ | ---------- | -------- | -------- |
a 2
| W   |     |     |     | have ‘O’ | as linear | function |     |
| --- | --- | --- | --- | -------- | --------- | -------- | --- |
| 2   |     |     | b 2 |          |           |          |     |
h
1
|     |     |     |     |     | f(x) = | h = O(a | )   |
| --- | --- | --- | --- | --- | ------ | ------- | --- |
|     |     |     |     |     |        | L       | L   |
|     |     |     |     |     | =      | W a +b  |     |
| a   |     |     |     |     |        | O L     | O   |
1
W
| 1   |     |     | b   |         |          |           |         |
| --- | --- | --- | --- | ------- | -------- | --------- | ------- |
|     |     |     | 1   | yˆ =    | f(x ) is | no longer | bounded |
|     |     |     |     | i       | i        |           |         |
|     |     |     |     | between | 0 and 1  |           |         |
| x 1 | x 2 | x n |     |         |          |           |         |
18/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

Intentionallyleftblank 19/9
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| -------------- | --------------------- | -------- |

|       |       |        |     | Now let   | us consider | another problem |
| ----- | ----- | ------ | --- | --------- | ----------- | --------------- |
| y =   | [1 0  | 0      | 0]  | for which | a different | loss function   |
| Apple | Mango | Orange |     | would be  | appropriate |                 |
Banana
|     |            |         |      | Suppose    | we want to | classify an image |
| --- | ---------- | ------- | ---- | ---------- | ---------- | ----------------- |
|     |            |         |      | into 1 of  | k classes  |                   |
|     |            |         |      | Here again | we could   | use the squared   |
|     | Neural     | network | with | error loss | to capture | the deviation     |
|     | L−1 hidden | layers  |      |            |            |                   |
|     |            |         |      | But can    | you think  | of a better       |
function?
20/9
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |     |
| --- | --- | --- | -------------- | --------------------- | -------- | --- |

|     |       |       |        |     | Notice       |     | that      | y is | a probability |      |
| --- | ----- | ----- | ------ | --- | ------------ | --- | --------- | ---- | ------------- | ---- |
| y   | = [1  | 0     | 0      | 0]  | distribution |     |           |      |               |      |
|     | Apple | Mango | Orange |     | Therefore    |     | we should | also | ensure        | that |
Banana
|     |        |        |         |      | yˆ   | is a probability |     | distribution |            |     |
| --- | ------ | ------ | ------- | ---- | ---- | ---------------- | --- | ------------ | ---------- | --- |
|     |        |        |         |      | What | choice           | of  | the output   | activation |     |
|     |        |        |         |      | ‘O’  | will ensure      |     | this ?       |            |     |
|     | Neural |        | network | with |      | a =              | W   | h +b         |            |     |
|     |        |        |         |      |      | L                | L   | L−1          | L          |     |
|     | L−1    | hidden | layers  |      |      |                  |     |              |            |     |
eaL,j
|     |     |     |     |     |     | yˆ = | O(a | ) =           |     |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | ------------- | --- | --- |
|     |     |     |     |     |     | j    |     | L j (cid:80)k |     |     |
eaL,i
i=1
isthejth
|     |     |     |     |     | O(a | )       |         | elementofyˆanda |        |     |
| --- | --- | --- | --- | --- | --- | ------- | ------- | --------------- | ------ | --- |
|     |     |     |     |     |     | L j     |         |                 |        | L,j |
|     |     |     |     |     | is  | the jth | element | of the          | vector | a . |
L
|     |     |     |     |     | This | function |     | is called | the | softmax |
| --- | --- | --- | --- | --- | ---- | -------- | --- | --------- | --- | ------- |
function
21/9
|     |     |          |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | -------- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |
|     | h = | yˆ= f(x) |     |                |                       |     |          |     |     |     |
L
a
3
W
|     |     | 3   |     | b   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | h   |     |     | 3   |     |     |     |     |     |     |
2
a
2
|     | W   | 2   |     | b   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
2
h 1
a
1
W
|     |     | 1   |     | b   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1
|     | x   |     | x   | x   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | 1   |     | 2   | n   |     |     |     |     |     |     |

|       |     |       |        |     |     | Now that | we have         | ensured |               | that both |
| ----- | --- | ----- | ------ | --- | --- | -------- | --------------- | ------- | ------------- | --------- |
| y =   | [1  | 0     | 0      | 0]  |     | y & yˆ   | are probability |         | distributions |           |
| Apple |     | Mango | Orange |     |     | can you  | think           | of a    | function      | which     |
Banana
|     |     |     |     |     |     | captures | the | difference |     | between |
| --- | --- | --- | --- | --- | --- | -------- | --- | ---------- | --- | ------- |
them?
Cross-entropy
|     | Neural |     | network | with |     |     |     |     |     |     |
| --- | ------ | --- | ------- | ---- | --- | --- | --- | --- | --- | --- |
k
|     | L−1 | hidden | layers |     |     |     |        | (cid:88) |         |     |
| --- | --- | ------ | ------ | --- | --- | --- | ------ | -------- | ------- | --- |
|     |     |        |        |     |     |     | L(θ) = | −        | y logyˆ |     |
|     |     |        |        |     |     |     |        |          | c       | c   |
c=1
|     |     |     |     |     |     | Notice | that |                 |      |              |
| --- | --- | --- | --- | --- | --- | ------ | ---- | --------------- | ---- | ------------ |
|     |     |     |     |     |     | y = 1  | if c | = (cid:96) (the | true | class label) |
c
|     |     |     |     |     |     | = 0    | otherwise |     |     |     |
| --- | --- | --- | --- | --- | --- | ------ | --------- | --- | --- | --- |
|     |     |     |     |     |     | ∴ L(θ) | = −logyˆ  |     |     |     |
(cid:96)
22/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

|     |       |      |     |     | So, | for classification |      |             | problem | (where | you have      |
| --- | ----- | ---- | --- | --- | --- | ------------------ | ---- | ----------- | ------- | ------ | ------------- |
| h   | = yˆ= | f(x) |     |     | to  | choose             | 1 of | K classes), |         | we use | the following |
L
|     |     |     |     |     | objective |     | function |     |     |     |     |
| --- | --- | --- | --- | --- | --------- | --- | -------- | --- | --- | --- | --- |
L(θ)
|     | a   |     |     |     |     |     | minimize |     |     | =   | −logyˆ (cid:96) |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --------------- |
3
|     | W   |     |     |     |     |     |          | θ   |       |     |          |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | ----- | --- | -------- |
|     | 3   |     |     | b   |     |     |          |     |       |     |          |
| h   |     |     |     | 3   |     | or  | maximize |     | −L(θ) | =   | logyˆ    |
|     | 2   |     |     |     |     |     |          |     |       |     | (cid:96) |
θ
|     |     |     |     |     | But | wait! |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
a
| 2   |     |     |     |     | Is  | yˆ a function |     | of θ = | [W ,W | ,.,W | ,b ,b ,.,b ]? |
| --- | --- | --- | --- | --- | --- | ------------- | --- | ------ | ----- | ---- | ------------- |
|     | W   |     |     |     |     | (cid:96)      |     |        | 1     | 2    | L 1 2 L       |
|     | 2   |     |     | b   |     |               |     |        |       |      |               |
2
| h 1 |     |     |     |     | Yes,   | it is              | indeed     | a function     |     | of θ    |              |
| --- | --- | --- | --- | --- | ------ | ------------------ | ---------- | -------------- | --- | ------- | ------------ |
|     |     |     |     |     |        | yˆ = [O(W          | g(W        | g(W            | x+b | )+b     | )+b )]       |
|     |     |     |     |     |        | (cid:96)           | 3          | 2              | 1   | 1       | 2 3 (cid:96) |
|     |     |     |     |     | What   | does               | yˆ encode? |                |     |         |              |
| a 1 |     |     |     |     |        |                    | (cid:96)   |                |     |         |              |
|     | W   |     |     |     |        |                    |            |                |     |         | (cid:96)th   |
|     | 1   |     |     | b 1 | It is  | the probability    |            | that           | x   | belongs | to the class |
|     |     |     |     |     | (bring | it as              | close      | to 1).         |     |         |              |
|     | x   | x   | x   |     |        |                    |            |                |     |         |              |
|     | 1   | 2   | n   |     |        |                    |            |                |     |         |              |
|     |     |     |     |     | logyˆ  | (cid:96) is called | the        | log-likelihood |     | of      | the data.    |
23/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

Outputs
|     |                   |     | Real    | Values | Probabilities |         |
| --- | ----------------- | --- | ------- | ------ | ------------- | ------- |
|     | Output Activation |     |         | Linear | Softmax       |         |
|     | Loss Function     |     | Squared | Error  | Cross         | Entropy |
Ofcourse,therecouldbeotherlossfunctionsdependingontheproblemathand
but the two loss functions that we just saw are encountered very often
For the rest of this lecture we will focus on the case where the output activation
| is a softmax | function | and the | loss function | is  | cross entropy |     |
| ------------ | -------- | ------- | ------------- | --- | ------------- | --- |
24/9
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

| Module | 4.4: Backpropagation |     | (Intuition) |     |
| ------ | -------------------- | --- | ----------- | --- |
25/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| We  | need to | answer | two | questions |     |     |     |
| --- | ------- | ------ | --- | --------- | --- | --- | --- |
L(θ)
|     | How to | choose  | the | loss function |             | ?      |     |
| --- | ------ | ------- | --- | ------------- | ----------- | ------ | --- |
|     | How to | compute | ∇θ  | which         | is composed | of:    |     |
|     |        |         |     | Rn×n,∇W       |             | Rn×k   |     |
|     | ∇W ,∇W | ,...,∇W |     | ∈             |             | ∈      |     |
|     | 1      | 2       |     | L−1           |             | L      |     |
|     | ∇b ,∇b | ,...,∇b |     | ∈ Rn and      | ∇b          | ∈ Rk ? |     |
|     | 1      | 2       | L−1 |               |             | L      |     |
26/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | -------- |

yˆ=f(x)
| Letusfocusonthisone |     |     |     |     |     | Algorithm: |     | gradient |
| ------------------- | --- | --- | --- | --- | --- | ---------- | --- | -------- |
descent()
| weight | (W ). |     |     |     |     |     |     |     |
| ------ | ----- | --- | --- | --- | --- | --- | --- | --- |
112
a31
| T o lea | r n th is | w e i gh | t W311 |     |     | t ← 0; |     |     |
| ------- | --------- | -------- | ------ | --- | --- | ------ | --- | --- |
b3
|          |       |           | h21   |     |     | max iterations |     | ← 1000; |
| -------- | ----- | --------- | ----- | --- | --- | -------------- | --- | ------- |
| us ing S | G D w | e n e e d | a     |     |     |                |     |         |
|          | ∂L(θ) |           |       |     |     | Initialize     | θ ; |         |
| formula  | for   | .         |       |     |     |                | 0   |         |
|          | ∂ W1  |           | a 2 1 |     |     |                |     |         |
|          |       | 1 2       | W211  |     |     | w h ile        |     |         |
| We will  | se e  | h o w to  |       |     | b2  |                |     |         |
h 1 1
|           |       |     |     |     |     | t ++ < max | iterations | do  |
| --------- | ----- | --- | --- | --- | --- | ---------- | ---------- | --- |
| calculate | this. |     |     |     |     |            |            |     |
|           |       |     |     |     |     | θ          | ← θ −η∇θ   | ;   |
|           |       |     |     |     |     | t+1        | t          | t   |
a11
|     |     |     | W111 W112 |     |     | end |     |     |
| --- | --- | --- | --------- | --- | --- | --- | --- | --- |
b1
|     |     |     | x1 x2 | xd  |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- |
27/9
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

L(θ)
|     | First let | us  | take the | simple | case | when |     |     |     |
| --- | --------- | --- | -------- | ------ | ---- | ---- | --- | --- | --- |
yˆ=f(x)
|     | we have    | a deep | but   | thin network. |         |     |     |     |     |
| --- | ---------- | ------ | ----- | ------------- | ------- | --- | --- | --- | --- |
|     | In this    | case   | it is | easy          | to find | the |     |     |     |
|     | derivative | by     | chain | rule.         |         |     |     | a   |     |
L1
W
L11
h 21
| ∂L(θ) | ∂L(θ) |     |     |        |             |       |       |     |     |
| ----- | ----- | --- | --- | ------ | ----------- | ----- | ----- | --- | --- |
|       |       |     | ∂yˆ | ∂a L11 | ∂h 21 ∂a 21 | ∂h 11 | ∂a 11 |     |     |
=
| ∂W  | 111 | ∂yˆ | ∂a L11 | ∂h 21 | ∂a 21 ∂h 11 | ∂a 11 | ∂W 111 |     |     |
| --- | --- | --- | ------ | ----- | ----------- | ----- | ------ | --- | --- |
a
| ∂L(θ) | ∂L(θ) |     | ∂h  |       |             |     |                 | 21  |     |
| ----- | ----- | --- | --- | ----- | ----------- | --- | --------------- | --- | --- |
|       |       |     | 11  |       |             |     |                 |     | W   |
|       | =     |     |     | (just | compressing |     | the chain rule) |     | 211 |
| ∂W    |       | ∂h  | ∂W  |       |             |     |                 | h   |     |
|       | 111   | 11  | 111 |       |             |     |                 | 11  |     |
| ∂L(θ) | ∂L(θ) |     | ∂h  |       |             |     |                 |     |     |
21
=
| ∂W    |       | ∂h  | ∂W  |     |     |     |     | a   |     |
| ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
|       | 211   | 21  | 211 |     |     |     |     | 11  |     |
| ∂L(θ) | ∂L(θ) |     |     |     |     |     |     |     | W   |
|       |       |     | ∂a  |     |     |     |     |     | 111 |
|       | =     |     | L1  |     |     |     |     |     |     |
| ∂W    |       | ∂a  | ∂W  |     |     |     |     |     |     |
|       | L11   | L1  | L11 |     |     |     |     |     | x   |
1
28/9
|     |     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture4 |     |
| --- | --- | --- | --- | -------------- | --- | --- | --------------------- | -------- | --- |

Let us see an intuitive explanation of backpropagation before we get into the
mathematical details
29/9
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| -------------- | --------------------- | -------- |

| We get | a certain | loss at | the output | and | we try to |     |     | −logyˆ |     |
| ------ | --------- | ------- | ---------- | --- | --------- | --- | --- | ------ | --- |
(cid:96)
| figure                               | out who   | is responsible | for             | this loss |      |     |     |     |     |
| ------------------------------------ | --------- | -------------- | --------------- | --------- | ---- | --- | --- | --- | --- |
| So,wetalktotheoutputlayerandsay“Hey! |           |                |                 |           | You  |     |     |     |     |
| are not                              | producing | the            | desired output, | better    | take |     |     |     |     |
responsibility”.
a
3
| The output | layer    | says   | “Well, I   | take responsibility |         |     | W   |     |     |
| ---------- | -------- | ------ | ---------- | ------------------- | ------- | --- | --- | --- | --- |
|            |          |        |            |                     |         |     | 3   |     | b   |
|            |          |        |            |                     |         | h   |     |     | 3   |
| for my     | part but | please | understand | that I              | am only |     | 2   |     |     |
asthegoodasthehiddenlayerandweightsbelow
| me”. | After all | ... |     |     |     |     |     |     |     |
| ---- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
a
2
|     |             |     |       |      |     |     | W   |     | b   |
| --- | ----------- | --- | ----- | ---- | --- | --- | --- | --- | --- |
|     |             |     |       |      |     |     | 2   |     | 2   |
|     | f(x)=yˆ=O(W |     | h     | +b ) |     | h   |     |     |     |
|     |             |     | L L−1 | L    |     | 1   |     |     |     |
a
1
W
|     |     |     |     |     |     |     | 1   |     | b 1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | x   |     | x   | x   |
|     |     |     |     |     |     |     | 1   | 2   | n   |
30/9
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

| So, | we talk | to  | W L ,b L | and h | L and ask | them | “What is |     |     | −logyˆ |     |     |
| --- | ------- | --- | -------- | ----- | --------- | ---- | -------- | --- | --- | ------ | --- | --- |
(cid:96)
| wrong                                         | with       | you?”  |      |                |         |      |             |     |     |     |     |     |
| --------------------------------------------- | ---------- | ------ | ---- | -------------- | ------- | ---- | ----------- | --- | --- | --- | --- | --- |
| W                                             | and        | b take | full | responsibility | but     | h    | says “Well, |     |     |     |     |     |
|                                               | L          | L      |      |                |         | L    |             |     |     |     |     |     |
| please                                        | understand |        | that | I am           | only as | good | as the pre- |     |     |     |     |     |
| activation                                    |            | layer” |      |                |         |      |             |     |     |     |     |     |
| Thepre-activationlayerinturnsaysthatIamonlyas |            |        |      |                |         |      |             |     | a   |     |     |     |
3
| good           | as             | the hidden | layer     | and        | weights | below   | me.          |     | W   |     |     |     |
| -------------- | -------------- | ---------- | --------- | ---------- | ------- | ------- | ------------ | --- | --- | --- | --- | --- |
|                |                |            |           |            |         |         |              |     | 3   |     |     | b   |
|                |                |            |           |            |         |         |              | h   |     |     |     | 3   |
| We             | continue       |            | in this   | manner     | and     | realize | that the     |     | 2   |     |     |     |
| responsibility |                |            | lies with | all the    | weights | and     | biases (i.e. |     |     |     |     |     |
| all            | the parameters |            | of        | the model) |         |         |              | a   |     |     |     |     |
2
|     |         |     |         |         |           |     |              |     | W   |     |     | b   |
| --- | ------- | --- | ------- | ------- | --------- | --- | ------------ | --- | --- | --- | --- | --- |
| But | instead | of  | talking | to them | directly, | it  | is easier to |     | 2   |     |     | 2   |
h
| talk   | to     | them | through    | the hidden |     | layers and | output      | 1   |     |     |     |     |
| ------ | ------ | ---- | ---------- | ---------- | --- | ---------- | ----------- | --- | --- | --- | --- | --- |
| layers | (and   | this | is exactly | what       | the | chain      | rule allows |     |     |     |     |     |
| us     | to do) |      |            |            |     |            |             | a   |     |     |     |     |
1
W
|     |       |     |       |     |       |     |         |     | 1   |     |     | b 1 |
| --- | ----- | --- | ----- | --- | ----- | --- | ------- | --- | --- | --- | --- | --- |
|     | ∂L(θ) |     | ∂L(θ) | ∂yˆ | ∂a ∂h | ∂a  | ∂h ∂a   |     |     |     |     |     |
|     |       | =   |       |     | 3     | 2   | 2 1 1   |     |     |     |     |     |
|     | ∂W    |     | ∂yˆ   | ∂a  | ∂h ∂a | ∂h  | ∂a ∂W   |     |     |     |     |     |
|     | 111   |     |       | 3   | 2     | 2   | 1 1 111 |     | x   | x   | x   |     |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) 1 2 n
|                | Talktothe |     | Talktothe   |                | Talktothe      | Talktothe   | andnow                |     |          |     |     |      |
| -------------- | --------- | --- | ----------- | -------------- | -------------- | ----------- | --------------------- | --- | -------- | --- | --- | ---- |
| weightdirectly |           |     |             | previoushidden |                | previous    | talkto                |     |          |     |     |      |
|                |           |     | outputlayer |                |                |             | the                   |     |          |     |     |      |
|                |           |     |             |                | layer          | hiddenlayer |                       |     |          |     |     |      |
|                |           |     |             |                |                |             | weights               |     |          |     |     | 31/9 |
|                |           |     |             |                | MiteshM.Khapra |             | CS7015(DeepLearning): |     | Lecture4 |     |     |      |

| Quantities | of interest |         | (roadmap |        | for the  | remaining | part): |      |
| ---------- | ----------- | ------- | -------- | ------ | -------- | --------- | ------ | ---- |
| Gradient   | w.r.t.      | output  | units    |        |          |           |        |      |
| Gradient   | w.r.t.      | hidden  | units    |        |          |           |        |      |
| Gradient   | w.r.t.      | weights | and      | biases |          |           |        |      |
|            | ∂L(θ)       |         | ∂L(θ)    |        |          |           |        |      |
|            |             |         |          |        | ∂yˆ ∂a 3 | ∂h 2 ∂a   | 2 ∂h 1 | ∂a 1 |
=
|     |     | ∂W 111 |     | ∂yˆ | ∂a 3 ∂h | 2 ∂a 2 ∂h | 1 ∂a 1 | ∂W 111 |
| --- | --- | ------ | --- | --- | ------- | --------- | ------ | ------ |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     | Talktothe      |     |     | Talktothe   | Talktothe      | Talktothe   |          | andnow |
| --- | -------------- | --- | --- | ----------- | -------------- | ----------- | -------- | ------ |
|     | weightdirectly |     |     | outputlayer | previoushidden |             | previous | talkto |
|     |                |     |     |             | layer          | hiddenlayer |          | the    |
weights
| Our | focus is | on Cross | entropy | loss | and Softmax | output. |     |     |
| --- | -------- | -------- | ------- | ---- | ----------- | ------- | --- | --- |
32/9
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

| Module | 4.5: Backpropagation: |       | Computing | Gradients |
| ------ | --------------------- | ----- | --------- | --------- |
| w.r.t. | the Output            | Units |           |           |
33/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| Quantities | of     | interest | (roadmap |       | for | the | remaining | part): |       |
| ---------- | ------ | -------- | -------- | ----- | --- | --- | --------- | ------ | ----- |
| Gradient   | w.r.t. | output   |          | units |     |     |           |        |       |
| Gradient   | w.r.t. | hidden   |          | units |     |     |           |        |       |
| Gradient   | w.r.t. | weights  |          |       |     |     |           |        |       |
|            |        | ∂L(θ)    |          | ∂L(θ) | ∂yˆ | ∂a  | ∂h        | ∂a ∂h  | ∂a    |
|            |        |          | =        |       |     |     | 3 2       | 2      | 1 1   |
|            |        | ∂W       |          | ∂yˆ   | ∂a  | ∂h  | ∂a        | ∂h ∂a  | ∂W    |
|            |        | 111      |          |       | 3   |     | 2 2       | 1      | 1 111 |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     | Talktothe      |     |     | Talktothe   |     | Talktothe      |     | Talktothe | andnow |
| --- | -------------- | --- | --- | ----------- | --- | -------------- | --- | --------- | ------ |
|     | weightdirectly |     |     | outputlayer |     | previoushidden |     | previous  | talkto |
the
|     |     |     |     |     |     | layer |     | hiddenlayer |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | ----------- | --- |
weights
| Our | focus is | on Cross |     | entropy | loss | and Softmax |     | output. |     |
| --- | -------- | -------- | --- | ------- | ---- | ----------- | --- | ------- | --- |
34/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture4 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- |

| Let | us first | consider |     | the partial | derivative |     |     |     | −logyˆ |     |     |
| --- | -------- | -------- | --- | ----------- | ---------- | --- | --- | --- | ------ | --- | --- |
(cid:96)
| w.r.t. | i-th | output |     |        |                                 |        |     |     |     |     |     |
| ------ | ---- | ------ | --- | ------ | ------------------------------- | ------ | --- | --- | --- | --- | --- |
|        |      | L(θ)   | =   | −logyˆ |                                 |        |     |     |     |     |     |
|        |      |        |     |        | (cid:96) ((cid:96) = true class | label) |     |     |     |     |     |
|        | ∂    |        |     | ∂      |                                 |        |     |     |     |     |     |
(L(θ))
|     |     |     | =   | (−logyˆ | )        |     |     | a   |     |     |     |
| --- | --- | --- | --- | ------- | -------- | --- | --- | --- | --- | --- | --- |
|     | ∂yˆ |     |     | ∂yˆ     | (cid:96) |     |     | 3   |     |     |     |
|     |     | i   |     | i       |          |     |     | W   |     |     |     |
|     |     |     |     |         |          |     |     | 3   |     |     | b   |
|     |     |     |     | 1       |          |     | h   |     |     |     | 3   |
2
|     |     |     | =   | −   | if i = (cid:96) |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --------------- | --- | --- | --- | --- | --- | --- |
yˆ
(cid:96)
|     |     |     | =   | 0   | otherwise |     | a   |     |     |     |     |
| --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- | --- |
2
|      |            |     |     |     |     |     |     | W   |     |     | b   |
| ---- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| More | compactly, |     |     |     |     |     |     | 2   |     |     | 2   |
h
1
1
|     | ∂   |        |     | (i=(cid:96)) |     |     |     |     |     |     |     |
| --- | --- | ------ | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
|     |     | (L(θ)) | =   | −            |     |     |     |     |     |     |     |
a
|     | ∂yˆ | i   |     | yˆ (cid:96) |     |     | 1   |     |     |     |     |
| --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- |
W
|     |     |     |     |     |     |     |     | 1   |     |     | b 1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     | x   |     | x   | x   |     |
|     |     |     |     |     |     |     |     | 1   | 2   | n   |     |
35/9
|     |     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture4 |     |     |
| --- | --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

−logyˆ
(cid:96)
1
|     | ∂     |        |     | ((cid:96)=i) |     |     |     |     |     |     |     |
| --- | ----- | ------ | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
|     |       | (L(θ)) | = − |              |     |     |     |     |     |     |     |
|     | ∂yˆ i |        |     | yˆ           |     |     |     |     |     |     |     |
(cid:96)
| We can | now talk | about | the | gradient |     |     |     |     |     |     |     |
| ------ | -------- | ----- | --- | -------- | --- | --- | --- | --- | --- | --- | --- |
a
3
| w.r.t. the | vector | yˆ  |     |     |     |     |     | W   |     |     |     |
| ---------- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|            |        |     |     |     |     |     |     |     | 3   |     | b   |
|            |        |     |     |     |     |     | h   |     |     |     | 3   |
2
|        |     |         |      |          | 1            |     |     |     |     |     |     |
| ------ | --- | ------- | ---- | -------- | -------------- | --- | --- | --- | --- | --- | --- |
|        |     |  ∂L(θ) |     |          |                |     |     |     |     |     |     |
|        |     |         |      |          | (cid:96)=1     |     | a   |     |     |     |     |
|        |     | ∂y ˆ    |      |          | 1              |     | 2   |     |     |     |     |
|        |     |  .     | 1   | 1        |  (cid:96) =2 |     |     | W   |     |     | b   |
| ∇ L(θ) | =   | .       |      | = −      |              |     |     | 2   |     |     | 2   |
| yˆ     |     |  .     |     |          |  . .         |     | h   |     |     |     |     |
|        |     |        |     | yˆ       | .              |     | 1   |     |     |     |     |
|        |     | ∂L      | ( θ) | (cid:96) |              |     |     |     |     |     |     |
|        |     | ∂yˆ     |      |          | 1              |     |     |     |     |     |     |
|        |     |         | k    |          | (cid:96)=k     |     | a   |     |     |     |     |
1
|     |     | 1   |     |     |     |     |     | W   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | =   | − e |     |     |     |     |     | 1   |     |     | b 1 |
(cid:96)
yˆ
(cid:96)
|                   |         |                 |       |                |       |                       |     | x   | x        | x   |      |
| ----------------- | ------- | --------------- | ----- | -------------- | ----- | --------------------- | --- | --- | -------- | --- | ---- |
|                   |         |                 |       |                |       |                       |     | 1   | 2        | n   |      |
| where e((cid:96)) | is      | a k-dimensional |       | vector         |       |                       |     |     |          |     |      |
| whose (cid:96)-th | element | is              | 1 and | all            | other |                       |     |     |          |     |      |
| elements          | are     | 0.              |       |                |       |                       |     |     |          |     | 36/9 |
|                   |         |                 |       | MiteshM.Khapra |       | CS7015(DeepLearning): |     |     | Lecture4 |     |      |

| What we | are | actually | interested | in is |     |     | −logyˆ |     |     |
| ------- | --- | -------- | ---------- | ----- | --- | --- | ------ | --- | --- |
(cid:96)
|     | ∂L(θ) | ∂(−logyˆ | )   |     |     |     |     |     |     |
| --- | ----- | -------- | --- | --- | --- | --- | --- | --- | --- |
(cid:96)
=
|     | ∂a  | ∂a       |          |          |     |     |     |     |     |
| --- | --- | -------- | -------- | -------- | --- | --- | --- | --- | --- |
|     | Li  |          | Li       |          |     |     |     |     |     |
|     |     | ∂(−logyˆ | )        | ∂yˆ      |     |     |     |     |     |
|     |     | =        | (cid:96) | (cid:96) |     |     |     |     |     |
a
|         |          |                   | ∂yˆ         | ∂a       |     | 3   |     |     |     |
| ------- | -------- | ----------------- | ----------- | -------- | --- | --- | --- | --- | --- |
|         |          |                   | (cid:96)    | Li       |     | W   |     |     |     |
|         |          |                   |             |          |     |     | 3   |     | b   |
|         |          |                   |             |          |     | h   |     |     | 3   |
| Does yˆ | depend   | on a              | ? Indeed,   | it does. |     | 2   |     |     |     |
|         | (cid:96) | Li                |             |          |     |     |     |     |     |
|         |          | exp(a             | L(cid:96) ) |          |     | a   |     |     |     |
|         |          | yˆ =              |             |          |     | 2   |     |     |     |
|         |          | (cid:96) (cid:80) |             |          |     | W   |     |     | b   |
|         |          | exp(a             | Li )        |          |     | 2   |     |     | 2   |
|         |          | i                 |             |          |     | h   |     |     |     |
1
| Having | established | this, | we  | will now |     |     |     |     |     |
| ------ | ----------- | ----- | --- | -------- | --- | --- | --- | --- | --- |
a
| derive | the full | expression | on  | the next |     | 1   |     |     |     |
| ------ | -------- | ---------- | --- | -------- | --- | --- | --- | --- | --- |
W
|     |     |     |     |     |     | 1   |     |     | b 1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
slide
|     |     |     |     |     |     | x   | x   | x   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | 1   | 2   | n   |     |
37/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

| ∂      |          | −1             | ∂         |       |            |     |     |     |        |            |       |
| ------ | -------- | -------------- | --------- | ----- | ---------- | --- | --- | --- | ------ | ---------- | ----- |
| −logyˆ |          | =              | yˆ        |       |            |     |     |     |        |            |       |
| ∂a     | (cid:96) | yˆ ∂a          | (cid:96)  |       |            |     |     |     |        |            |       |
| Li     |          | (cid:96)       | Li        |       |            |     |     | ∂   | g(x)   |            |       |
|        |          |                |           |       |            |     |     |     | ∂g(x)  | 1 g(x)     | ∂h(x) |
|        |          | −1             | ∂         |       |            |     |     |     | h(x) = | −          |       |
|        |          | =              | softmax(a |       | )          |     |     |     |        |            |       |
|        |          |                |           |       | L (cid:96) |     |     |     | ∂x ∂x  | h(x) h(x)2 | ∂x    |
|        |          | yˆ (cid:96) ∂a | Li        |       |            |     |     |     |        |            |       |
|        |          | −1             | ∂         | exp(a | )          |     |     |     |        |            |       |
L (cid:96)
|     |     | =           | (cid:80)     |           |            |              |             |             |               |          |     |
| --- | --- | ----------- | ------------ | --------- | ---------- | ------------ | ----------- | ----------- | ------------- | -------- | --- |
|     |     | yˆ ∂a       |              | exp(a     | )          |              |             |             |               |          |     |
|     |     | (cid:96)    | Li           | i(cid:48) | L (cid:96) |              |             |             |               |          |     |
|     |     |             |              |           |            |              | (cid:16)    |             | (cid:17)      |          |     |
|     |     | (cid:32)    |              |           |            |              | ∂           | (cid:80)    | (cid:33)      |          |     |
|     |     | −1          | ∂ exp(a      |           | ) exp(a    | L ) (cid:96) |             | exp(a       | L ) i(cid:48) |          |     |
|     |     |             | ∂a           | L         | (cid:96)   |              | ∂a Li       | i(cid:48)   |               |          |     |
|     |     | =           | (cid:80) Li  |           | −          | (cid:80)     |             |             |               |          |     |
|     |     | yˆ          | exp(a        |           | )          | (            | (exp(a      | )           | )2            |          |     |
|     |     | (cid:96)    | i(cid:48)    | L         | i(cid:48)  |              | i(cid:48)   | L i(cid:48) |               |          |     |
|     |     | (cid:32)    |              |           |            |              |             |             | (cid:33)      |          |     |
|     |     | −1          | 1            | exp(a     | )          | exp(a        | )           | exp(a       | )             |          |     |
|     |     |             | ((cid:96)=i) |           | L (cid:96) |              | L (cid:96)  |             | L i           |          |     |
|     |     | =           | (cid:80)     |           | − (cid:80) |              |             | (cid:80)    |               |          |     |
|     |     | yˆ          | exp(a        |           | )          | exp(a        | )           | exp(a       | )             |          |     |
|     |     | (cid:96)    | i(cid:48)    | L         | i(cid:48)  | i(cid:48)    | L i(cid:48) | i(cid:48)   | L i(cid:48)   |          |     |
|     |     | −1 (cid:18) |              |           |            |              |             |             |               | (cid:19) |     |
1
= softmax(a L ) (cid:96) −softmax(a L ) (cid:96) softmax(a L ) i
|     |     | yˆ  | ((cid:96)=i) |     |     |     |     |     |     |     |     |
| --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:96)
|     |     | −1(cid:0)1 |              |                   | (cid:1) |     |     |     |     |     |     |
| --- | --- | ---------- | ------------ | ----------------- | ------- | --- | --- | --- | --- | --- | --- |
|     |     | =          | yˆ           | −yˆ               | yˆ      |     |     |     |     |     |     |
|     |     | yˆ         | ((cid:96)=i) | (cid:96) (cid:96) | i       |     |     |     |     |     |     |
(cid:96)
|     |     | (cid:0)1     |     | (cid:1) |     |     |     |     |     |     |     |
| --- | --- | ------------ | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
|     |     | =−           | −yˆ |         |     |     |     |     |     |     |     |
|     |     | ((cid:96)=i) |     | i       |     |     |     |     |     |     |     |
38/9
|     |     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --- | --- | --------------------- | --- | -------- | --- | --- |

| So  | far we | have | derived | the partial | derivative | w.r.t. |     |     |     | −logyˆ |     |     |
| --- | ------ | ---- | ------- | ----------- | ---------- | ------ | --- | --- | --- | ------ | --- | --- |
(cid:96)
| the | i-th element |     | of a |     |     |     |     |     |     |     |     |     |
| --- | ------------ | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
L
∂L(θ)
|     |     |     | = −(1      | −yˆ) |     |     |     |     |     |     |     |     |
| --- | --- | --- | ---------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | (cid:96)=i | i    |     |     |     |     |     |     |     |     |
∂a
L,i
a
3
| We  | can now | write | the gradient | w.r.t. | the | vector | a   |     | W   |     |     |     |
| --- | ------- | ----- | ------------ | ------ | --- | ------ | --- | --- | --- | --- | --- | --- |
|     |         |       |              |        |     |        | L   |     | 3   |     |     | b   |
|     |         |       |              |        |     |        |     | h   |     |     |     | 3   |
2
|     |     |     |      |   −(1 | −yˆ        | )  |     |     |     |     |     |     |
| --- | --- | --- | ----- | ------- | ---------- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | ∂L(θ) |         | (cid:96)=1 | 1   |     |     |     |     |     |     |
a
|     |     |        | ∂ a L 1 |  −(1 | −yˆ         | )  |     | 2   |     |     |     |     |
| --- | --- | ------ | ------- | ----- | ----------- | --- | --- | --- | --- | --- | --- | --- |
|     |     |        |  .     |      | (cid:96)= 2 | 2   |     |     | W   |     |     | b   |
|     | ∇   | L(θ) = |  .     |  =  | .           |    |     |     | 2   |     |     | 2   |
|     | aL  |        | .       |      | .           |    |     | h   |     |     |     |     |
|     |     |        |        |     | .           |    |     | 1   |     |     |     |     |
|     |     |        | ∂ L (θ  | )     |             |     |     |     |     |     |     |     |
−(1
|     |     |     | ∂a Lk |     | (cid:96)=k −yˆ | k ) |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- |
a
1
|     |     | = −(e((cid:96))−yˆ) |     |     |     |     |     |     | W   |     |     |     |
| --- | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |                     |     |     |     |     |     |     | 1   |     |     | b 1 |
|     |     |                     |     |     |     |     |     |     | x   | x   | x   |     |
|     |     |                     |     |     |     |     |     |     | 1   | 2   | n   |     |
39/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

| Module | 4.6: Backpropagation: |     | Computing | Gradients |
| ------ | --------------------- | --- | --------- | --------- |
| w.r.t. | Hidden Units          |     |           |           |
40/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| Quantities | of     | interest | (roadmap |        | for | the remaining |     | part): |     |
| ---------- | ------ | -------- | -------- | ------ | --- | ------------- | --- | ------ | --- |
| Gradient   | w.r.t. | output   | units    |        |     |               |     |        |     |
| Gradient   | w.r.t. | hidden   | units    |        |     |               |     |        |     |
| Gradient   | w.r.t. | weights  | and      | biases |     |               |     |        |     |
|            |        | ∂L(θ)    | ∂L(θ)    |        | ∂yˆ | ∂a ∂h         | ∂a  | ∂h     | ∂a  |
|            |        |          | =        |        |     | 3             | 2   | 2 1    | 1   |
|            |        | ∂W       |          | ∂yˆ    | ∂a  | ∂h ∂a         | ∂h  | ∂a     | ∂W  |
|            |        | 111      |          |        | 3   | 2             | 2   | 1 1    | 111 |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     | Talktothe      |     |     | Talktothe   |                | Talktothe | Talktothe |     | andnow |
| --- | -------------- | --- | --- | ----------- | -------------- | --------- | --------- | --- | ------ |
|     | weightdirectly |     |     | outputlayer | previoushidden |           | previous  |     | talkto |
the
|     |     |     |     |     |     | layer | hiddenlayer |     |     |
| --- | --- | --- | --- | --- | --- | ----- | ----------- | --- | --- |
weights
| Our | focus is | on Cross | entropy | loss | and | Softmax | output. |     |     |
| --- | -------- | -------- | ------- | ---- | --- | ------- | ------- | --- | --- |
41/9
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture4 |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | -------- | --- |

| Chain | rule | along | multiple | paths: |     | If a |     |     | −logyˆ |     |     |
| ----- | ---- | ----- | -------- | ------ | --- | ---- | --- | --- | ------ | --- | --- |
(cid:96)
| function     | p(z) | can     | be written | as a function |     | of  |     |     |     |     |     |
| ------------ | ---- | ------- | ---------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
| intermediate |      | results | q (z)      | then we have  | :   |     |     |     |     |     |     |
i
|     | ∂p(z) |     | (cid:88) ∂p(z) | ∂q (z) |     |     | a   |     |     |     |     |
| --- | ----- | --- | -------------- | ------ | --- | --- | --- | --- | --- | --- | --- |
|     |       | =   |                | m      |     |     |     | 3   |     |     |     |
W
|     | ∂z  |     | ∂q  | (z) ∂z |     |     |     | 3   |     |     | b   |
| --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | m   |        |     |     | h   |     |     |     | 3   |
|     |     |     | m   |        |     |     | 2   |     |     |     |     |
In our case:
a
2
|      |     |          |          | L(θ) |     |     | W   |     |     |     | b   |
| ---- | --- | -------- | -------- | ---- | --- | --- | --- | --- | --- | --- | --- |
| p(z) | is  | the loss | function |      |     |     |     | 2   |     |     | 2   |
h
1
| z   | = h |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ij
| q   | (z) = | a   |     |     |     |     | a   |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | m     | Lm  |     |     |     |     | 1   |     |     |     |     |
W
|     |     |     |     |     |     |     |     | 1   |     |     | b 1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     | x   |     | x   | x   |     |
|     |     |     |     |     |     |     | 1   |     | 2   | n   |     |
42/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

Intentionallyleftblank 43/9
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| -------------- | --------------------- | -------- |

−logyˆ
|     |       |     | k              |         |     |     |     |     |     | (cid:96) |     |     |
| --- | ----- | --- | -------------- | ------- | --- | --- | --- | --- | --- | -------- | --- | --- |
|     | ∂L(θ) |     | (cid:88) ∂L(θ) | ∂ai+1,m |     |     |     |     |     |          |     |     |
=
|     | ∂hij |     | ∂ai+1,m |     | ∂hij |     |     |     |     |     |     |     |
| --- | ---- | --- | ------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
m=1
k
|     |          |     | (cid:88) ∂L(θ) |              |         |           |       |     |     |     |     |     |
| --- | -------- | --- | -------------- | ------------ | ------- | --------- | ----- | --- | --- | --- | --- | --- |
|     |          | =   |                | W            |         |           |       |     |     |     |     |     |
|     |          |     |                |              | i+1,m,j |           |       |     | a   |     |     |     |
|     |          |     | ∂ai+1,m        |              |         |           |       |     | 3   |     |     |     |
|     |          |     | m=1            |              |         |           |       |     | W   |     |     |     |
|     |          |     |                |              |         |           |       |     | 3   |     |     | b   |
|     |          |     |                |              |         |           |       | h   |     |     |     | 3   |
| Now | consider |     | these          | two vectors, |         |           |       |     | 2   |     |     |     |
|     |          |     |  ∂L(θ)        |             |         |           |       |     |     |     |     |     |
|     |          |     |                |              |         |          |      | a   |     |     |     |     |
|     |          |     | ∂ai+1,1        |              |         | W i+1,1,j |       | 2   |     |     |     |     |
|     |          |     |                |              |         |           |       |     | W   |     |     | b   |
|     | L(θ)     |     |  .            |             |         |           | .     |     | 2   |     |     | 2   |
| ∇   |          | =   |  . .          |  ;W         |         | =        | . .  | h   |     |     |     |     |
|     | ai+1     |     |                |              | i+1,·,j |          |      | 1   |     |     |     |     |
|     |          |     |               |             |         |           |       |     |     |     |     |     |
|     |          |     | ∂L(θ)          |              |         | W         |       |     |     |     |     |     |
i+1,k,j
|     |     |     | ∂a i+1,k |     |     |     |     | a   |     |     |     |     |
| --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1
W
|     |         |        |      |        |      |             |     |     | 1   |     |     | b 1 |
| --- | ------- | ------ | ---- | ------ | ---- | ----------- | --- | --- | --- | --- | --- | --- |
| W   |         | is the | j-th | column | of W | ; see that, |     |     |     |     |     |     |
|     | i+1,·,j |        |      |        |      | i+1         |     |     |     |     |     |     |
|     |         |        |      |        |      |             |     |     | x   | x   | x   |     |
|     |         |        |      |        |      |             |     |     | 1   | 2   | n   |     |
k ∂L(θ)
(cid:88)
| (W  |         | )T∇ | L(θ) | =   |     | W       |     |     |     |     |     |     |
| --- | ------- | --- | ---- | --- | --- | ------- | --- | --- | --- | --- | --- | --- |
|     | i+1,·,j |     | ai+1 |     |     | i+1,m,j |     |     |     |     |     |     |
∂a i+1,m
|     |     |     |     |     | m=1 |     |     |     | a i+1 = | W i+1 h ij +b | i+1 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | ------------- | --- | --- |
44/9
|     |     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture4 |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

−logyˆ
(cid:96)
∂L(θ)
| We  | have, | = (W |         | )T∇ | L(θ) |     |     |     |     |     |     |
| --- | ----- | ---- | ------- | --- | ---- | --- | --- | --- | --- | --- | --- |
|     |       |      | i+1,.,j |     | ai+1 |     |     |     |     |     |     |
∂h ij
| We can now | write | the gradient |     | w.r.t. | h   |     |     |     |     |     |     |
| ---------- | ----- | ------------ | --- | ------ | --- | --- | --- | --- | --- | --- | --- |
|            |       |              |     |        | i   |     |     | a   |     |     |     |
3
W
|        |  L   |        |         |           |         |       |     | 3   |     |     | b   |
| ------ | ----- | ------- | ------- | --------- | ------- | ----- | --- | --- | --- | --- | --- |
|        | ∂     | ( θ )  |         | T         | L       |      | h   |     |     |     | 3   |
|        |       |         | ( W     | )         | ∇       | ( θ ) | 2   |     |     |     |     |
|        | ∂ h   | i 1     | i +     | 1 , · , 1 | a i + 1 |       |     |     |     |     |     |
|        |  ∂ L | ( θ )  | ( W     | ) T       | ∇ L     | ( θ ) |     |     |     |     |     |
|        |      |       | i +     | 1 , · , 2 | a       |      |     |     |     |     |     |
| ∇ L(θ) | = ∂ h | i 2 =  |         |           | i + 1   |      |     |     |     |     |     |
| h      |  .   |       |         |           | .       |      | a   |     |     |     |     |
| i      |  .   |        |         |           | . .     |       | 2   |     |     |     |     |
|        |  .   |       |         |           |         |      |     | W   |     |     | b   |
|        |       |         |         |           |         |       |     | 2   |     |     | 2   |
|        | ∂ L   | ( θ)    | (W      | )T∇       | L(θ)    |       | h   |     |     |     |     |
|        |       |         | i+1,·,n |           | ai+1    |       | 1   |     |     |     |     |
∂ hi n
|     | = (W | )T(∇ | L(θ)) |     |     |     |     |     |     |     |     |
| --- | ---- | ---- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | i+1  | ai+1 |       |     |     |     | a   |     |     |     |     |
1
W
|                     |            |      |        |          |     |        |     | 1   |     |     | b 1 |
| ------------------- | ---------- | ---- | ------ | -------- | --- | ------ | --- | --- | --- | --- | --- |
| We                  | are almost | done | except | that     | we  | do not |     |     |     |     |     |
|                     |            |      |        |          |     |        | x   |     | x   | x   |     |
| knowhowtocalculate∇ |            |      |        | L(θ)fori |     | < L−1  | 1   |     | 2   | n   |     |
ai+1
| We  | will see how | to compute |     | that |     |     |     |     |     |     |     |
| --- | ------------ | ---------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
45/9
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | -------- | --- | --- | --- |

−logyˆ
(cid:96)
|     |     |    |    |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
∂L(θ)
∂ai1
| L(θ) |     |  .   |    |     |     |     |     |     |     |     |
| ---- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
| ∇    | =   |  . . |    |     |     |     |     |     |     |     |
a i
|     |     |    |    |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
∂L(θ)
a
|     |     | ∂ain |     |     |     |     | 3   |     |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
W
| ∂L(θ) |     | ∂L(θ)∂h |     |     |     |     |     | 3   |     | b   |
| ----- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
|       | =   |         | ij  |     |     | h   |     |     |     | 3   |
2
| ∂a  |     | ∂h  | ∂a  |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | ij  | ij  | ij  |     |     |     |     |     |     |     |
∂L(θ)
|     |     |       | (cid:48)    | [∵            |     | a   |     |     |     |     |
| --- | --- | ----- | ----------- | ------------- | --- | --- | --- | --- | --- | --- |
|     | =   |       | g (a ij )   | h ij = g(a ij | )]  | 2   |     |     |     |     |
|     |     | ∂h    |             |               |     |     | W   |     |     | b   |
|     |     | ij    |             |               |     |     | 2   |     |     | 2   |
|     |     |      |             |              |     | h   |     |     |     |     |
|     |     | ∂L(θ) | g(cid:48)(a |               |     | 1   |     |     |     |     |
)
|        |     | ∂hi1               | i1         |           |     |     |     |     |     |     |
| ------ | --- | ------------------ | ---------- | --------- | --- | --- | --- | --- | --- | --- |
|        |     |                   | .          |          |     |     |     |     |     |     |
| ∇ L(θ) | =   |                    | .          |           |     | a   |     |     |     |     |
| a      |     |                   | .          |          |     | 1   |     |     |     |     |
| i      |     |                   |            |          |     |     | W   |     |     |     |
|        |     | ∂L(θ)              | (cid:48)(a |           |     |     | 1   |     |     | b 1 |
|        |     |                    | g )        |           |     |     |     |     |     |     |
|        |     | ∂hin               | in         |           |     |     |     |     |     |     |
|        |     | L(θ)(cid:12)[...,g |            | (cid:48)  |     |     | x   | x   | x   |     |
|        | =   | ∇                  |            | (a ),...] |     |     | 1   | 2   | n   |     |
|        |     | hi                 |            | ik        |     |     |     |     |     |     |
46/9
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture4 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

| Module | 4.7: Backpropagation: |     | Computing | Gradients |
| ------ | --------------------- | --- | --------- | --------- |
| w.r.t. | Parameters            |     |           |           |
47/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| Quantities | of interest |         | (roadmap |        | for | the remaining |     | part): |       |
| ---------- | ----------- | ------- | -------- | ------ | --- | ------------- | --- | ------ | ----- |
| Gradient   | w.r.t.      | output  | units    |        |     |               |     |        |       |
| Gradient   | w.r.t.      | hidden  | units    |        |     |               |     |        |       |
| Gradient   | w.r.t.      | weights | and      | biases |     |               |     |        |       |
|            |             | ∂L(θ)   | ∂L(θ)    |        | ∂yˆ | ∂a ∂h         | ∂a  | ∂h     | ∂a    |
|            |             |         | =        |        |     | 3             | 2   | 2      | 1 1   |
|            |             | ∂W      |          | ∂yˆ    | ∂a  | ∂h ∂a         | ∂h  | ∂a     | ∂W    |
|            |             | 111     |          |        | 3   | 2             | 2   | 1      | 1 111 |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     | Talktothe      |     |     | Talktothe   |                | Talktothe | Talktothe |     | andnow |
| --- | -------------- | --- | --- | ----------- | -------------- | --------- | --------- | --- | ------ |
|     | weightdirectly |     |     | outputlayer | previoushidden |           | previous  |     | talkto |
the
|     |     |     |     |     |     | layer | hiddenlayer |     |     |
| --- | --- | --- | --- | --- | --- | ----- | ----------- | --- | --- |
weights
| Our | focus is | on Cross | entropy |     | loss and | Softmax | output. |     |     |
| --- | -------- | -------- | ------- | --- | -------- | ------- | ------- | --- | --- |
48/9
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     |     | Lecture4 |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --- | -------- |

| Recall that, |     |     |     |     |     |     |     |     | −logyˆ |     |     |
| ------------ | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- |
(cid:96)
|     | a k = | b k +W | k h k−1 |     |     |     |     |     |     |     |     |
| --- | ----- | ------ | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
∂a
|     | ki = | h   |     |     |     |     |     |     |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
k−1,j
∂W
|       | kij |       |     |     |     |     |     | a   |     |     |     |
| ----- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ∂L(θ) |     | ∂L(θ) |     |     |     |     |     | 3   |     |     |     |
|       |     |       | ∂a  |     |     |     |     | W   |     |     |     |
|       | =   |       | ki  |     |     |     |     | 3   |     |     | b   |
|       |     |       |     |     |     |     | h   |     |     |     | 3   |
| ∂W    |     | ∂a    | ∂W  |     |     |     |     | 2   |     |     |     |
|       | kij | ki    | kij |     |     |     |     |     |     |     |     |
∂L(θ)
|        | =   |         | h     |         |       |     |     |     |     |     |     |
| ------ | --- | ------- | ----- | ------- | ----- | --- | --- | --- | --- | --- | --- |
|        |     |         | k−1,j |         |       |     | a   |     |     |     |     |
|        |     | ∂a      |       |         |       |     | 2   |     |     |     |     |
|        |     | ki      |       |         |       |     |     | W   |     |     | b   |
|        |     |  ∂L(θ) | ∂L(θ) |         | ∂L(θ) |    |     | 2   |     |     | 2   |
|        |     |         |       | ... ... |       |     | h   |     |     |     |     |
|        |     | ∂W      | ∂W    |         | ∂W    |     | 1   |     |     |     |     |
|        |     | k11     | k12   |         |       | k1n |     |     |     |     |     |
|        |     |  ...   | ...   | ... ... | ...   |    |     |     |     |     |     |
|        |     |        |       |         |       |    |     |     |     |     |     |
| ∇ L(θ) | =   |  .     | .     | .       | .     | .  | a   |     |     |     |     |
| W      |     | .       | .     | .       | .     | .   | 1   |     |     |     |     |
| k      |     |  .     | .     | .       | .     | .  |     | W   |     |     |     |
|        |     |        |       |         |       |    |     | 1   |     |     | b 1 |
∂L(θ)
|     |     | ... | ... | ... ... |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
∂W
|     |     |     |     |     |     | knn |     | x   | x   | x   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | 1   | 2   | n   |     |
49/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

Intentionallyleftblank 50/9
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| -------------- | --------------------- | -------- |

R3×3
Lets take a simple example of a W k ∈ and see what each entry looks like
|      | ∂L(θ) |       | ∂L(θ) | ∂L(θ) |       |        |           |        |     |
| ---- | ------ | ----- | ----- | ------ | ----- | ------ | --------- | ------ | --- |
|      |        | ∂W    | ∂W    | ∂W     |       |        |           |        |     |
|      |        | k11   | k12   | k13    |       |        |           |        |     |
|      |       |       |       |        |      |        |           |        |     |
|      |       |       |       |        |      |        |           |        |     |
| L(θ) | ∂L(θ) |       | ∂L(θ) | ∂L(θ) | ∂L(θ) | ∂L(θ)  | ∂a        |        |     |
| ∇ W  | =      |       |       |        |       | =      | ki        |        |     |
| k    |       | ∂W    | ∂W    | ∂W     |  ∂W  | kij ∂a | ki ∂W kij |        |     |
|      |       | k21   | k22   | k23    |      |        |           |        |     |
|      |       |       |       |        |      |        |           |        |     |
|      |        | ∂L(θ) | ∂L(θ) | ∂L(θ)  |       |        |           |        |     |
|      |        | ∂W    | ∂W    | ∂W     |       |        |           |        |     |
|      |        | k31   | k32   | k33    |       |        |           |        |     |
|      | ∂L(θ) |       |       | ∂L(θ)  |       | ∂L(θ)  |          |        |     |
|      |        | h     |       |        | h     | h      |           |        |     |
|      |        | ∂a    | k−1,1 | ∂a     | k−1,2 | ∂a     | k−1,3     |        |     |
|      |        | k1    |       | k1     |       | k1     |           |        |     |
|      |       |       |       |        |       |        |          |        |     |
|      |       |       |       |        |       |        |          |        |     |
| L(θ) | ∂L(θ) |       |       | ∂L(θ)  |       | ∂L(θ)  |           | L(θ)·h | T   |
| ∇    | =      | h     |       |        | h     | h      |  =       | ∇      |     |
| W k  |       | ∂a    | k−1,1 | ∂a     | k−1,2 | ∂a     | k−1,3    | a k    | k−1 |
|      |       | k2    |       | k2     |       | k2     |          |        |     |
|      |       |       |       |        |       |        |          |        |     |
|      |        | ∂L(θ) |       | ∂L(θ)  |       | ∂L(θ)  |           |        |     |
|      |        | h     |       |        | h     | h      |           |        |     |
|      |        | ∂a    | k−1,1 | ∂a     | k−1,2 | ∂a     | k−1,3     |        |     |
|      |        | k3    |       | k3     |       | k3     |           |        |     |
51/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

| Finally, | coming | to  | the biases |     |     |     |     |     | −logyˆ |     |     |
| -------- | ------ | --- | ---------- | --- | --- | --- | --- | --- | ------ | --- | --- |
(cid:96)
(cid:88)
|     |     | a   | = b + | W   | h         |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --------- | --- | --- | --- | --- | --- | --- |
|     |     | ki  | ki    |     | kij k−1,j |     |     |     |     |     |     |
j
|     |     | ∂L(θ) | ∂L(θ)∂a |     |     |     |     |     |     |     |     |
| --- | --- | ----- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
ki
|     |     |     | =     |       |     |     |     | a   |     |     |     |
| --- | --- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- | --- |
|     |     | ∂b  | ∂a    | ∂b    |     |     |     | 3   |     |     |     |
|     |     | ki  |       | ki ki |     |     |     | W   |     |     |     |
|     |     |     |       |       |     |     |     | 3   |     |     | b   |
|     |     |     | ∂L(θ) |       |     |     | h   |     |     |     | 3   |
2
=
∂a
ki
a
| We  | can now | write | the gradient |     | w.r.t. the | vector | 2   |     |     |     |     |
| --- | ------- | ----- | ------------ | --- | ---------- | ------ | --- | --- | --- | --- | --- |
|     |         |       |              |     |            |        |     | W   |     |     | b   |
|     |         |       |              |     |            |        |     | 2   |     |     | 2   |
| b   |         |       |              |     |            |        | h   |     |     |     |     |
| k   |         |       |              |     |            |        | 1   |     |     |     |     |
∂L(θ)
a
|     |     |      | a    |       |        |     | 1   |     |     |     |     |
| --- | --- | ---- | ---- | ----- | ------ | --- | --- | --- | --- | --- | --- |
|     |     |      | ∂Lk | 1     |        |     |     | W   |     |     |     |
|     |     |      |      | ( θ) |        |     |     | 1   |     |     | b 1 |
|     |     |      |     |      |        |     |     |     |     |     |     |
|     | ∇   | L(θ) | = a  | k 2 = | ∇ L(θ) |     |     |     |     |     |     |
|     |     | b    |     | .    | a      |     |     |     |     |     |     |
|     |     | k    |     | . .  | k      |     | x   |     | x   | x   |     |
|     |     |      |     |      |        |     |     | 1   | 2   | n   |     |
∂L(θ)
a kn
52/9
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture4 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

| Module | 4.8: Backpropagation: |     | Pseudo | code |
| ------ | --------------------- | --- | ------ | ---- |
53/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

| Finally, | we have | all the | pieces of | the puzzle |               |     |
| -------- | ------- | ------- | --------- | ---------- | ------------- | --- |
|          |         | ∇ L(θ)  | (gradient | w.r.t.     | output layer) |     |
aL
|     | L(θ),∇ | L(θ) |           |        |                |            |
| --- | ------ | ---- | --------- | ------ | -------------- | ---------- |
|     | ∇      |      | (gradient | w.r.t. | hidden layers, | 1 ≤ k < L) |
|     | h k    | a k  |           |        |                |            |
∇ L(θ),∇ L(θ) (gradient w.r.t. weights and biases, 1 ≤ k ≤ L)
|     | W             | b   |               |           |     |     |
| --- | ------------- | --- | ------------- | --------- | --- | --- |
|     | k             | k   |               |           |     |     |
| We  | can now write | the | full learning | algorithm |     |     |
54/9
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | -------------- | --- | --------------------- | -------- |

| Algorithm: | gradient | descent() |     |     |     |
| ---------- | -------- | --------- | --- | --- | --- |
t ← 0;
| max iterations |           | ← 1000;                  |                     |               |     |
| -------------- | --------- | ------------------------ | ------------------- | ------------- | --- |
| Initialize     | θ         | = [W0,...,W0,b0,...,b0]; |                     |               |     |
|                | 0         | 1                        | 1                   |               |     |
|                |           |                          | L L                 |               |     |
| while          | t++ < max | iterations               | do                  |               |     |
| h ,h           | ,...,h    | ,a ,a                    | ,...,a ,yˆ= forward | propagation(θ | );  |
| 1              | 2         | L−1 1                    | 2 L                 |               | t   |
∇θ t = backward propagation(h 1 ,h 2 ,...,h L−1 ,a 1 ,a 2 ,...,a L ,y,yˆ);
| θ   | ← θ −η∇θ | ;   |     |     |     |
| --- | -------- | --- | --- | --- | --- |
| t+1 | t        | t   |     |     |     |
end
55/9
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | -------------- | --------------------- | -------- |

Algorithm: forward propagation(θ)
for k = 1 to L−1 do
a = b +W h ;
k k k k−1
h = g(a );
k k
end
a = b +W h ;
L L L L−1
yˆ= O(a );
L
56/9
MiteshM.Khapra CS7015(DeepLearning): Lecture4

Just do a forward propagation and compute all h i ’s, a i ’s, and yˆ
| Algorithm: |      | back         | propagation(h |     | ,h  | ,...,h | ,a ,a ,...,a | ,y,yˆ) |
| ---------- | ---- | ------------ | ------------- | --- | --- | ------ | ------------ | ------ |
|            |      |              |               |     | 1 2 |        | L−1 1 2      | L      |
| //Compute  |      | output       | gradient      |     | ;   |        |              |        |
| ∇          | L(θ) | = −(e(y)−yˆ) |               | ;   |     |        |              |        |
aL
| for | k =        | L to 1 do |           |                              |            |       |                   |     |
| --- | ---------- | --------- | --------- | ---------------------------- | ---------- | ----- | ----------------- | --- |
|     | // Compute |           | gradients | w.r.t.                       | parameters |       | ;                 |     |
|     | ∇          | L(θ) =    | ∇ L(θ)hT  |                              | ;          |       |                   |     |
|     | W          |           | a         | k−1                          |            |       |                   |     |
|     | k          |           | k         |                              |            |       |                   |     |
|     | ∇ L(θ)     | =         | ∇ L(θ)    | ;                            |            |       |                   |     |
|     | b          |           | a         |                              |            |       |                   |     |
|     | k          |           | k         |                              |            |       |                   |     |
|     | // Compute |           | gradients | w.r.t.                       | layer      | below | ;                 |     |
|     |            | L(θ)      | WT(∇      | L(θ))                        |            |       |                   |     |
|     | ∇          | =         |           | a                            | ;          |       |                   |     |
|     | h k−1      |           | k         | k                            |            |       |                   |     |
|     | // Compute |           | gradients | w.r.t.                       | layer      | below | (pre-activation); |     |
|     | ∇          | L(θ) =    | ∇         | L(θ)(cid:12)[...,g(cid:48)(a |            |       | ),...] ;          |     |
|     | a          |           | h         |                              |            | k−1,j |                   |     |
|     | k−1        |           | k−1       |                              |            |       |                   |     |
end
57/9
|     |     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture4 |
| --- | --- | --- | --- | -------------- | --- | --- | --------------------- | -------- |

| Module | 4.9: Derivative | of  | the activation | function |
| ------ | --------------- | --- | -------------- | -------- |
58/9
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture4 |
| --- | --- | -------------- | --------------------- | -------- |

Now, the only thing we need to figure out is how to compute g(cid:48)
| Logistic function   | tanh    |               |           |             |          |
| ------------------- | ------- | ------------- | --------- | ----------- | -------- |
| g(z) = σ(z)         |         | g(z) =tanh(z) |           |             |          |
| 1                   |         | ez            | −e−z      |             |          |
| =                   |         | =             |           |             |          |
| 1+e−z               |         | ez            | +e−z      |             |          |
| 1                   | d       | (cid:32)      | (ez +e−z) | d (ez −e−z) | (cid:33) |
| g(cid:48)(z) = (−1) | (1+e−z) |               |           |             |          |
dz
| (1+e−z)2dz |        |                | −(ez | −e−z) d (ez +e−z) |     |
| ---------- | ------ | -------------- | ---- | ----------------- | --- |
| 1          |        |                |      | dz                |     |
|            | (−e−z) | g(cid:48)(z) = |      |                   |     |
| = (−1)     |        |                |      | (ez +e− z)2       |     |
(1+e−z)2
|                |          | (ez | +e−z)2−(ez | −e−z)2 |     |
| -------------- | -------- | --- | ---------- | ------ | --- |
| (cid:18) 1+e−z | (cid:19) |     |            |        |     |
| 1              | −1       | =   |            |        |     |
| =              |          |     | (ez        | +e−z)2 |     |
| 1+e−z 1+e−z    |          |     |            |        |     |
(ez −e−z)2
| = g(z)(1−g(z)) |     | =1− |     |     |     |
| -------------- | --- | --- | --- | --- | --- |
(ez +e−z)2
=1−(g(z))2
59/9
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture4 |     |
| --- | -------------- | --------------------- | --- | -------- | --- |
