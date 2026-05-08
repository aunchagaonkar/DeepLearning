| CS7015         | (Deep  | Learning)     | : Lecture | 22  |
| -------------- | ------ | ------------- | --------- | --- |
| Autoregressive |        | Models (NADE, | MADE)     |     |
|                | Mitesh | M. Khapra     |           |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/24
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture22 |
| --- | -------------- | --------------------- | --- | --------- |

| Module | 22.1: Neural | Autoregressive |     | Density | Estimator |
| ------ | ------------ | -------------- | --- | ------- | --------- |
(NADE)
2/24
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture22 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

H∈{0,1}n
c1 c2 cn So far we have seen a few latent variable
h1 h2 ··· hn generation models such as RBMs and VAEs
w1,1 wm,nW∈Rm×n Latentvariablemodelsmakecertainindependence
assumptions which reduces the number of factors
v1 v2 ··· vm andinturnthenumberofparametersinthemodel
b1 b2 bm
V ∈{0,1}m Forexample,inRBMsweassumedthatthevisible
xˆ variables were independent given the hidden
variables which allowed us to do Block Gibbs
Pφ(x|z)
Sampling
z
+ Similarly in VAEs we assumed P(x|z) = N(0,I)
which effectively means that given the latent
∗ (cid:15)
variables, the x’s are independent of each other
(Since Σ = I)
µ Σ
Qθ(z|x)
x
3/24
MiteshM.Khapra CS7015(DeepLearning): Lecture22

|     | We will | now look | at  | Autoregressive |     | (AR)   |
| --- | ------- | -------- | --- | -------------- | --- | ------ |
|     | Models  | which do | not | contain        | any | latent |
variables
|     | The aim      | of course |     | is to        | learn | a joint |
| --- | ------------ | --------- | --- | ------------ | ----- | ------- |
|     | distribution | over x    |     |              |       |         |
|     | As usual,    | for ease  | of  | illustration |       | we will |
{0,1}n
|     | assume    | x ∈    |      |     |              |     |
| --- | --------- | ------ | ---- | --- | ------------ | --- |
|     | AR models | do not | make | any | independence |     |
x 1 x 2 x 3 x 4
|     | assumption | but use  | the | default | factorization |        |
| --- | ---------- | -------- | --- | ------- | ------------- | ------ |
|     | of p(x)    | given by | the | chain   | rule          | p(x) = |
n
(cid:89)
|     | p(x |x | )   |     |     |     |     |
| --- | ------ | --- | --- | --- | --- | --- |
|     | i      | <k  |     |     |     |     |
i=1
|     | The above  | factorization |          | contains | n       | factors |
| --- | ---------- | ------------- | -------- | -------- | ------- | ------- |
|     | and some   | of these      | factors  |          | contain | many    |
|     | parameters | ( O(2n)       | in total | )        |         |         |
4/24
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture22 |     |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- | --- |

|         |     |     | Obviously,     | it is infeasible | to learn such        | an     |
| ------- | --- | --- | -------------- | ---------------- | -------------------- | ------ |
| x 1 x 2 | x 3 | x 4 | exponential    | number           | of parameters        |        |
|         |     |     | AR models      | work             | around this by using | a      |
|         |     |     | neural network | to parameterize  | these factors        |        |
|         |     |     | and then       | learn the        | parameters of this   | neural |
network
|     |     |     | What does | this mean? | Let us see! |     |
| --- | --- | --- | --------- | ---------- | ----------- | --- |
5/24
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture22 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     | At the | output | layer |     | we want | to  | predict |
| --- | ------ | ------ | ----- | --- | ------- | --- | ------- |
))
xx33
xx22 )) xx22 ,, n conditional probability distributions (each
)) ,, ,,
)) ||xx11 ||xx11 ||xx11
pp((xx11 pp((xx22 pp((xx33 pp((xx44 correspondingtooneofthefactorsinourjoint
distribution)
|     | At the | input | layer | we are | given | the | n input |
| --- | ------ | ----- | ----- | ------ | ----- | --- | ------- |
VV
variables
33
nth
|     | Now the        | catch     | is that  | the     |          | output    | should   |
| --- | -------------- | --------- | -------- | ------- | -------- | --------- | -------- |
|     | only be        | connected |          | to the  | previous | n-1       | inputs   |
|     | In particular, |           | when     |         | we are   | computing |          |
|     | p(x |x         | ,x )      | the only | inputs  | that     | we        | should   |
|     | 3 2            | 1         |          |         |          |           |          |
|     | consider       | are       | x , x    | because | these    | are       | the only |
1 2
|     | variables | given | to  | us  | while computing |     | the |
| --- | --------- | ----- | --- | --- | --------------- | --- | --- |
WW
..,,<<kk conditional
xx xx xx xx
11 22 33 44
6/24
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     | The | Neural | Autoregressive |     | Density | Estimator |     |
| --- | --- | --- | --- | ------ | -------------- | --- | ------- | --------- | --- |
)
x3
|       | x2  | ) x2 , | (NADE) | proposes |     | a simple | solution | for | this |
| ----- | --- | ------ | ------ | -------- | --- | -------- | -------- | --- | ---- |
| )     | ,   | ,      |        |          |     |          |          |     |      |
| ) |x1 | |x1 | |x1    |        |          |     |          |          |     |      |
p(x1 p(x2 p(x3 p(x4 First, for every output unit, we compute a
|     |     |     | hidden | representation |     | using | only | the | relevant |
| --- | --- | --- | ------ | -------------- | --- | ----- | ---- | --- | -------- |
input units
V
|     |     |     | For | example, | for | the | kth output | unit, | the |
| --- | --- | --- | --- | -------- | --- | --- | ---------- | ----- | --- |
hiddenrepresentationwillbecomputedusing:
| h h | h   | h   |           |             |           |            |      |            |           |
| --- | --- | --- | --------- | ----------- | --------- | ---------- | ---- | ---------- | --------- |
| 1 2 | 3   | 4   |           |             |           |            |      |            |           |
|     |     |     |           |             | h k = σ(W | .,<k       | x <k | +b)        |           |
|     |     |     | where     | h ∈         | Rd,W      | ∈ Rd×n,W   |      | are        | the first |
|     |     |     |           | k           |           |            |      | .,<k       |           |
|     |     |     | k columns |             | of W      |            |      |            |           |
|     |     |     | We        | now compute |           | the output |      | p(x |xk−1) | as:       |
| W   |     |     |           |             |           |            |      | k          |           |
1
| x x | x   | x   |     | y = | p(x |xk−1) |     | = σ(V | h +c  | )   |
| --- | --- | --- | --- | --- | ---------- | --- | ----- | ----- | --- |
| 1 2 | 3   | 4   |     | k   | k          | 1   |       | k k k |     |
7/24
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture22 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     | Let | us look | at  | the equations |     | carefully |     |     |
| --- | --- | --- | --- | ------- | --- | ------------- | --- | --------- | --- | --- |
)
x3
|           | x2      | ) x2 , |     |      |            |        |      |       |       |        |
| --------- | ------- | ------ | --- | ---- | ---------- | ------ | ---- | ----- | ----- | ------ |
|           | ) ,     | ,      |     |      |            |        |      |       |       |        |
| )         | |x1 |x1 | |x1    |     |      | h          | = σ(W  |      | x +b) |       |        |
| p(x1 p(x2 | p(x3    | p(x4   |     |      | k          |        | .,<k | <k    |       |        |
|           |         |        |     | y    | = p(x      | |xk−1) | =    | σ(V h | +c )  |        |
|           |         |        |     | k    |            | k 1    |      | k k   | k     |        |
|           | V       |        | How | many | parameters |        | does | this  | model | have ? |
3
|     |     |     | Note       | that | W ∈ | Rd×n    | and  | b ∈ Rd×1  | are      | shared |
| --- | --- | --- | ---------- | ---- | --- | ------- | ---- | --------- | -------- | ------ |
| h h | h   | h   |            |      |     |         |      |           |          |        |
| 1 2 | 3   | 4   | parameters |      | and | the     | same | W,b       | are used | for    |
|     |     |     | computing  |      | h   | for all | the  | n factors | (of      | course |
k
|     |     |     | only        | the  | relevant  | columns   |           | of W       | are used   | for  |
| --- | --- | --- | ----------- | ---- | --------- | --------- | --------- | ---------- | ---------- | ---- |
|     |     |     | each        | k)   | resulting | in        | nd+d      | parameters |            |      |
|     |     |     | Inaddition, |      | wehaveV   |           | ∈         | Rd×1 andc  | ∈          | Rd×1 |
|     |     |     |             |      |           |           | k         |            | k          |      |
| W   |     |     | for         | each | of the    | n factors | resulting |            | in a total | of   |
.,<3
nd+n parameters
| x   | x x | x   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 2 3 | 4   |     |     |     |     |     |     |     |     |
8/24
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

Rd
|     |     |     | )   | Thereisalsoanadditionalparameterh |     |     |     |     |     | 1 ∈ |
| --- | --- | --- | --- | --------------------------------- | --- | --- | --- | --- | --- | --- |
x3
|           |      | x2  | ) x2 , | (similar | to           | the initial | state         | in   | LSTMs, | RNNs)     |
| --------- | ---- | --- | ------ | -------- | ------------ | ----------- | ------------- | ---- | ------ | --------- |
|           | )    | ,   | ,      |          |              |             |               |      |        |           |
| )         | |x1  | |x1 | |x1    |          |              |             |               |      |        |           |
| p(x1 p(x2 | p(x3 |     | p(x4   |          |              |             |               |      |        |           |
|           |      |     |        | The      | total number |             | of parameters |      | in     | the model |
|           |      |     |        | is thus  | 2nd+n+2d     |             | which         | is   | linear | in n      |
|           |      |     |        | In other | words,       | the         | model         | does | not    | have an   |
V
|     | 3   |     |     | exponential |     | number | of      | parameters |               | which is |
| --- | --- | --- | --- | ----------- | --- | ------ | ------- | ---------- | ------------- | -------- |
|     |     |     |     | typically   | the | case   | for the | default    | factorization |          |
| h h | h   |     | h   |             |     |        |         |            |               |          |
| 1 2 | 3   |     | 4   |             | n   |        |         |            |               |          |
(cid:89)
|     |     |     |     | p(x) | = p(x | |x  | )   |     |     |     |
| --- | --- | --- | --- | ---- | ----- | --- | --- | --- | --- | --- |
i <k
i=1
|     |     |     |     | Why?   | Because     | we         | are sharing |     | the     | parameters |
| --- | --- | --- | --- | ------ | ----------- | ---------- | ----------- | --- | ------- | ---------- |
|     |     |     |     | across | the factors |            |             |     |         |            |
|     |     |     |     | The    | same W,b    | contribute |             | to  | all the | factors    |
W
.,<3
| x x |     | x   | x   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 2   | 3   | 4   |     |     |     |     |     |     |     |
9/24
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | How will | you | train | such | a network? |     |     |
| --- | --- | --- | --- | -------- | --- | ----- | ---- | ---------- | --- | --- |
)
x3
|           |      | x2  | ) x2 , | backpropagation:                        |              | itsaneuralnetworkafterall |      |         |     |      |
| --------- | ---- | --- | ------ | --------------------------------------- | ------------ | ------------------------- | ---- | ------- | --- | ---- |
|           | )    | ,   | ,      |                                         |              |                           |      |         |     |      |
| ) |x1     |      | |x1 | |x1    |                                         |              |                           |      |         |     |      |
| p(x1 p(x2 | p(x3 |     | p(x4   | Whatisthelossfunctionthatyouwillchoose? |              |                           |      |         |     |      |
|           |      |     |        | For every                               | output       |                           | node | we know | the | true |
|           |      |     |        | probability                             | distribution |                           |      |         |     |      |
V
3
|     |     |     |     | For example, |           | for a        | given       | training  | instance,    | if        |
| --- | --- | --- | --- | ------------ | --------- | ------------ | ----------- | --------- | ------------ | --------- |
|     |     |     |     | X = 1        | then      | the true     | probability |           | distribution |           |
| h h | h   |     | h   | 3            |           |              |             |           |              |           |
| 1 2 | 3   |     | 4   |              |           |              |             |           |              |           |
|     |     |     |     | is given     | by        | p(x =        | 1|x         | ,x )      | = 1,p(x      | =         |
|     |     |     |     |              |           | 3            |             | 2 1       |              | 3         |
|     |     |     |     | 0|x 2 ,x 1   | ) = 0     | or p =       | [0,1]       |           |              |           |
|     |     |     |     | If the       | predicted | distribution |             | is        | q =          | [0.7,0.3] |
|     |     |     |     | then we      | can       | just         | take        | the cross |              | entropy   |
|     |     |     |     | between      | p and     | q as         | the loss    | function  |              |           |
W
.,<3
|     |     |     |     | The total | loss | will    | be the | sum    | of this | cross |
| --- | --- | --- | --- | --------- | ---- | ------- | ------ | ------ | ------- | ----- |
| x x |     | x   | x   | entropy   | loss | for all | the n  | output | nodes   |       |
| 1   | 2   | 3   | 4   |           |      |         |        |        |         |       |
10/24
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     |     | Now let’s | ask | a couple | of  | questions | about | the |
| --- | --- | --- | --- | --- | --------- | --- | -------- | --- | --------- | ----- | --- |
)
x3
|     |     |     | x2  | ) x2 , | model | (assume | training |     | is done) |     |     |
| --- | --- | --- | --- | ------ | ----- | ------- | -------- | --- | -------- | --- | --- |
|     |     | )   | ,   | ,      |       |         |          |     |          |     |     |
|     | )   | |x1 | |x1 | |x1    |       |         |          |     |          |     |     |
p(x1 p(x2 p(x3 p(x4 Can the model be used for abstraction? i.e.,
|     |     |     |     |     | if we give | it       | a test   | instance | x, can         | the | model |
| --- | --- | --- | --- | --- | ---------- | -------- | -------- | -------- | -------------- | --- | ----- |
|     |     |     |     |     | give us    | a hidden | abstract |          | representation |     | for x |
V
|     |     | 3   |     |     | Well,           | you will       | get                        | a        | sequence        | of hidden |     |
| --- | --- | --- | --- | --- | --------------- | -------------- | -------------------------- | -------- | --------------- | --------- | --- |
|     |     |     |     |     | representations |                | h 1 ,h                     | 2 ,...,h | n but these     | are       | not |
| h   | h   | h   |     | h   |                 |                |                            |          |                 |           |     |
| 1   | 2   | 3   |     | 4   | really          | the kind       | of                         | abstract | representations |           |     |
|     |     |     |     |     | that we         | are interested |                            | in       |                 |           |     |
|     |     |     |     |     | Forexample,h    |                | onlycapturestheinformation |          |                 |           |     |
n
|     |     |     |     |     | required | to reconstruct |      |     | x given     | x to    | x   |
| --- | --- | --- | --- | --- | -------- | -------------- | ---- | --- | ----------- | ------- | --- |
|     |     |     |     |     |          |                |      |     | n           | 1       | n−1 |
|     |     |     |     |     | (compare | this           | with | an  | autoencoder | wherein |     |
W
|     | .,<3 |     |     |     | the hidden | representation |        |          | can reconstruct |     | all  |
| --- | ---- | --- | --- | --- | ---------- | -------------- | ------ | -------- | --------------- | --- | ---- |
|     |      |     |     |     | of x ,x    | ,...,x         | )      |          |                 |     |      |
| x   | x    |     | x   | x   | 1          | 2              | n      |          |                 |     |      |
|     | 1    | 2   | 3   | 4   |            |                |        |          |                 |     |      |
|     |      |     |     |     | These are  | not            | latent | variable | models          | and | are, |
|     |      |     |     |     | by design, | not            | meant  | for      | abstraction     |     |      |
11/24
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     | Can the | model do | generation? | How? |     |
| --- | --- | --- | ------- | -------- | ----------- | ---- | --- |
)
x3
|           | x2 )    | x2 , |           |               |            |            |          |
| --------- | ------- | ---- | --------- | ------------- | ---------- | ---------- | -------- |
|           | ) ,     | ,    | Well, we  | first compute | p(x        | 1 = 1)     | as y 1 = |
| )         | |x1 |x1 | |x1  |           |               |            |            |          |
| p(x1 p(x2 | p(x3    | p(x4 | σ(V h     | +c )          |            |            |          |
|           |         |      | 1 1       | 1             |            |            |          |
|           |         |      | Note that | V 1 ,h 1 ,c   | 1 are all  | parameters | of the   |
|           |         |      | model     | which will    | be learned | during     | training |
V
1
|     |     |     | We will      | then sample | a value | for x 1 | from the |
| --- | --- | --- | ------------ | ----------- | ------- | ------- | -------- |
|     |     |     | distribution | Bernoulli(y | )       |         |          |
| h h | h h |     |              |             | 1       |         |          |
| 1   | 2 3 | 4   |              |             |         |         |          |
W
| x   | x x | x   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 2 3 | 4   |     |     |     |     |     |
12/24
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture22 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     | We  | will now | use the | sampled | value | of x | and |
| --- | --- | --- | --- | --- | -------- | ------- | ------- | ----- | ---- | --- |
|     |     |     | )   |     |          |         |         |       |      | 1   |
x3
|           |      | x2 ) | x2 , | compute |     | h as  |     |     |     |     |
| --------- | ---- | ---- | ---- | ------- | --- | ----- | --- | --- | --- | --- |
|           | )    | ,    | ,    |         |     | 2     |     |     |     |     |
| )         | |x1  | |x1  | |x1  |         |     |       |     |     |     |     |
| p(x1 p(x2 | p(x3 |      | p(x4 | h 2 =   | σ(W | x +b) |     |     |     |     |
.,<2 <2
|     |     |     |     | Using | h         | we will compute |         | P(x = | 1|x    | = x ) |
| --- | --- | --- | --- | ----- | --------- | --------------- | ------- | ----- | ------ | ----- |
|     |     |     |     |       | 2         |                 |         | 2     | 1      | 1     |
|     |     |     |     | as y  | 2 = σ(V   | 2 h 2 +c        | 2 )     |       |        |       |
| V   |     | V   |     |       |           |                 |         |       |        |       |
| 1   |     | 4   |     | We    | will then | sample          | a value | for   | x from | the   |
2
|     |     |     |     | distribution |      | Bernoulli(y   | 2 )  |         |     |        |
| --- | --- | --- | --- | ------------ | ---- | ------------- | ---- | ------- | --- | ------ |
| h h | h   | h   |     |              |      |               |      |         |     |        |
| 1   | 2 3 |     | 4   |              |      |               |      |         |     |        |
|     |     |     |     | We           | will | then continue | this | process |     | till x |
n
|     |     |     |     | generating |     | the value | of one | random | variable |     |
| --- | --- | --- | --- | ---------- | --- | --------- | ------ | ------ | -------- | --- |
at a time
|     |     |     |     | If x | is an | image | then this | is equivalent |     | to  |
| --- | --- | --- | --- | ---- | ----- | ----- | --------- | ------------- | --- | --- |
generatingtheimageonepixelatatime(very
W W
|     | .,<4 |     |     | slow) |     |     |     |     |     |     |
| --- | ---- | --- | --- | ----- | --- | --- | --- | --- | --- | --- |
| x   | x    | x   | x   |       |     |     |     |     |     |     |
| 1   | 2    | 3   | 4   |       |     |     |     |     |     |     |
13/24
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

Of course, the model requires a lot of computations because for generating
| each pixel | we need | to  | compute |     |       |     |     |
| ---------- | ------- | --- | ------- | --- | ----- | --- | --- |
|            |         |     | h k =   | σ(W | x +b) |     |     |
.,<k <k
|         |        |      | y =         | p(x |xk−1) | =    | σ(V h +c | )     |
| ------- | ------ | ---- | ----------- | ---------- | ---- | -------- | ----- |
|         |        |      | k           | k          | 1    | k k      | k     |
| However | notice | that |             |            |      |          |       |
|         |        | W    | x           | +b         | = W  | x +b+W   | x     |
|         |        |      | .,<k+1 <k+1 |            | .,<k | <k       | .,k k |
Thus we can reuse some of the computations done for pixel k while predicting
| the pixel | k+1 | (this | can be | done even | at training | time) |     |
| --------- | --- | ----- | ------ | --------- | ----------- | ----- | --- |
14/24
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture22 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- |

Things to remember about NADE
n
(cid:81)
Uses the explicit representation of the joint distribution p(x) = p(x |x )
i
<k
i=1
Each node in the output layer corresponds to one factor in this explicit
representation
Reduces the number of parameters by sharing weights in the neural network
Not designed for abstraction
Generation is slow because the model generates one pixel (or one random
variable) at a time
Possible to speed up the computation by reusing some previous computations
15/24
MiteshM.Khapra CS7015(DeepLearning): Lecture22

| Module | 22.2: Masked | Autoencoder | Density | Estimator |
| ------ | ------------ | ----------- | ------- | --------- |
(MADE)
16/24
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture22 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | Suppose | the input | x ∈ | {0,1}n, | then the |
| --- | --- | --- | ------- | --------- | --- | ------- | -------- |
)
x3
|     |       | ) ,   | output       | layer of an | autoencoder   | also      | contains  |
| --- | ----- | ----- | ------------ | ----------- | ------------- | --------- | --------- |
|     |       | x2 x2 |              |             |               |           |           |
|     | )     | , ,   |              |             |               |           |           |
|     | x1    | x1 x1 | n units      |             |               |           |           |
| )   | |     | | |   |              |             |               |           |           |
| x1  | x2 x3 | x4    |              |             |               |           |           |
| p(  | p( p( | p(    | Notice the   | explicit    | factorization | of        | the joint |
|     |       |       | distribution | p(x)        | also contains | n factors |           |
n
| V   |     |     |     |        | (cid:89) |      |     |
| --- | --- | --- | --- | ------ | -------- | ---- | --- |
|     |     |     |     | p(x) = | p(x      | |x ) |     |
k
<k
k=1
|     |     |     | Question: | Can we | tweak | an autoencoder | so  |
| --- | --- | --- | --------- | ------ | ----- | -------------- | --- |
W2
|     |     |     | that its      | output units | predict | the n conditional |       |
| --- | --- | --- | ------------- | ------------ | ------- | ----------------- | ----- |
|     |     |     | distributions | instead      | of      | reconstructing    | the n |
inputs?
W1
| x 1 | x 2 x 3 | x 4 |     |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- | --- |
17/24
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture22 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     | Note that | this | is not | straightforward |     | because |
| --- | --- | --- | --- | --------- | ---- | ------ | --------------- | --- | ------- |
)
x3
|     |     |       | ) ,   | we need                               | to make  | sure        | that  | the k-th | output    |
| --- | --- | ----- | ----- | ------------------------------------- | -------- | ----------- | ----- | -------- | --------- |
|     |     |       | x2 x2 |                                       |          |             |       |          |           |
|     |     | )     | , ,   |                                       |          |             |       |          |           |
|     |     | x1    | x1 x1 | unitonlydependsonthepreviousk−1inputs |          |             |       |          |           |
|     | )   | |     | | |   |                                       |          |             |       |          |           |
|     | x1  | x2 x3 | x4    |                                       |          |             |       |          |           |
|     | p(  | p( p( | p(    | In a                                  | standard | autoencoder |       | with     | fully     |
|     |     |       |       | connected                             | layers   | the         | k-th  | unit     | obviously |
|     |     |       |       | depends                               | on all   | the input   | units |          |           |
V
|     |     |     |     | In simple | words, | there   | is a path | from   | each of |
| --- | --- | --- | --- | --------- | ------ | ------- | --------- | ------ | ------- |
|     |     |     |     | the input | units  | to each | of the    | output | units   |
Wecannotallowthisifwewanttopredictthe
| W2  |     |     |     | conditional | distributions |     | p(x | |x ) | (we need |
| --- | --- | --- | --- | ----------- | ------------- | --- | --- | ---- | -------- |
k
<k
|     |     |     |     | to ensure | that | we          | are only | seeing | the given |
| --- | --- | --- | --- | --------- | ---- | ----------- | -------- | ------ | --------- |
|     |     |     |     | variables | x    | and nothing | else)    |        |           |
<k
W1
|     | x 1 | x 2 x 3 | x 4 |     |     |     |     |     |     |
| --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
18/24
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

)
|         |         |       | )                | , x3 We could | ensure this        | by masking |        |
| ------- | ------- | ----- | ---------------- | ------------- | ------------------ | ---------- | ------ |
|         |         |       | ) x2             | x2            |                    |            |        |
|         |         |       | |x1 |x1 ,        | |x1 , some    | of the connections |            | in the |
|         |         | p(x1  | ) p(x2 p(x3 p(x4 |               |                    |            |        |
| xˆ1 xˆ2 | xˆ3 xˆ4 | Masks |                  |               |                    |            |        |
|         |         |       |                  | network       | to ensure          | that y     | only   |
|         |         | 1     | 2 3 4            |               |                    |            | k      |
|         |         |       |                  | depends       | on x               |            |        |
=MV
| V   |     |     |       |          | <k            |          |      |
| --- | --- | --- | ----- | -------- | ------------- | -------- | ---- |
|     |     |     |       | We will  | start by      | assuming | some |
|     |     | 1   | 1 2 1 | 3        |               |          |      |
|     |     |     |       | ordering | on the inputs | and      | just |
=MW2
W2
|     |     |     |       | number | them from 1   | to n   |      |
| --- | --- | --- | ----- | ------ | ------------- | ------ | ---- |
|     |     | 1   | 2 1 2 | 3      |               |        |      |
|     |     |     |       | Now we | will randomly | assign | each |
W1
|       |       | =MW1 |          | hidden       | unit a number        | between    | 1 to |
| ----- | ----- | ---- | -------- | ------------ | -------------------- | ---------- | ---- |
|       |       | 1    | 2 3 4    |              |                      |            |      |
|       |       |      |          | n-1 which    | indicates            | the number | of   |
| x1 x2 | x3 x4 | x1   | x2 x3 x4 |              |                      |            |      |
|       |       |      |          | inputs       | it will be connected | to         |      |
|       |       |      |          | For example, | if we assign         | a node     | the  |
number2thenitwillbeconnectedto
|     |     |     |     | the first | two inputs    |            |     |
| --- | --- | --- | --- | --------- | ------------- | ---------- | --- |
|     |     |     |     | We will   | do a similar  | assignment | for |
|     |     |     |     | all the   | hidden layers |            |     |
19/24
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture22 |     |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

)
|         |         |       | )                | , x3 Let us   | see what this | means      |        |
| ------- | ------- | ----- | ---------------- | ------------- | ------------- | ---------- | ------ |
|         |         |       | ) x2             | x2            |               |            |        |
|         |         |       | |x1 |x1 ,        | |x1 , For the | first hidden  | layer      | this   |
|         |         | p(x1  | ) p(x2 p(x3 p(x4 |               |               |            |        |
| xˆ1 xˆ2 | xˆ3 xˆ4 | Masks |                  |               |               |            |        |
|         |         |       |                  | numbering     | is clear      | - it       | simply |
|         |         | 1     | 2 3 4            |               |               |            |        |
|         |         |       |                  | indicates     | the number    | of ordered |        |
=MV
V
|     |     |     |        | inputs | to which this | node will | be  |
| --- | --- | --- | ------ | ------ | ------------- | --------- | --- |
|     |     | 1   | 1 22 1 | 3      |               |           |     |
connected
=MW2
W2
|     |     |     |          | Let us  | now focus on | the highlighted |     |
| --- | --- | --- | -------- | ------- | ------------ | --------------- | --- |
|     |     | 11  | 22 11 22 | 3       |              |                 |     |
|     |     |     |          | node in | the second   | layer which     | has |
W1
|       |       | =MW1 |             | the number | 2               |           |        |
| ----- | ----- | ---- | ----------- | ---------- | --------------- | --------- | ------ |
|       |       | 111  | 222 333 444 |            |                 |           |        |
|       |       |      |             | This node  | is only allowed | to depend |        |
| x1 x2 | x3 x4 | x1   | x2 x3 x4    |            |                 |           |        |
|       |       |      |             | on inputs  | x and           | x (since  | it is  |
|       |       |      |             |            | 1               | 2         |        |
|       |       |      |             | numbered   | 2)              |           |        |
|       |       |      |             | This means | that it         | should be | only   |
|       |       |      |             | connected  | to those        | nodes     | in the |
previoushiddenlayerwhichhaveseen
|     |     |     |     | only x      | 1 and x 2       |           |       |
| --- | --- | --- | --- | ----------- | --------------- | --------- | ----- |
|     |     |     |     | In other    | words it should | only      | have  |
|     |     |     |     | connections | from those      | nodes,    | which |
|     |     |     |     | have been   | assigned a      | number ≤2 |       |
20/24
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture22 |     |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

)
|         |         |       |             | )         | , x3  | Now consider | the     | node    | labeled     | 3 in |
| ------- | ------- | ----- | ----------- | --------- | ----- | ------------ | ------- | ------- | ----------- | ---- |
|         |         |       |             | ) x2      | x2    |              |         |         |             |      |
|         |         |       |             | |x1 |x1 , | |x1 , | the output   | layer   |         |             |      |
|         |         |       | p(x1 ) p(x2 | p(x3 p(x4 |       |              |         |         |             |      |
| xˆ1 xˆ2 | xˆ3 xˆ4 | Masks |             |           |       |              |         |         |             |      |
|         |         |       |             |           |       | This node    | is only | allowed | to          | see  |
|         |         |       | 1 2         | 3 4       |       |              |         |         |             |      |
|         |         |       |             |           |       | inputs       | x and x | because | it predicts |      |
|         |         | =MV   |             |           |       |              | 1 2     |         |             |      |
V
|     |     |      |       |       |     | p(x |x    | ,x ) (and | hence   | the   | given |
| --- | --- | ---- | ----- | ----- | --- | --------- | --------- | ------- | ----- | ----- |
|     |     |      | 11 11 | 22 11 | 3   | 3         | 2 1       |         |       |       |
|     |     |      |       |       |     | variables | should    | only be | x and | x )   |
|     |     | =MW2 |       |       |     |           |           |         | 1     | 2     |
W2
|     |     |     |     |     |     | By the | same argument | that | we  | made |
| --- | --- | --- | --- | --- | --- | ------ | ------------- | ---- | --- | ---- |
|     |     |     | 1 2 | 1 2 | 3   |        |               |      |     |      |
onthepreviousslide,thismeansthat
W1
|       |       | =MW1 |       |       |     | it should    | be only         | connected   | to         | those  |
| ----- | ----- | ---- | ----- | ----- | --- | ------------ | --------------- | ----------- | ---------- | ------ |
|       |       |      | 1 2   | 3 4   |     |              |                 |             |            |        |
|       |       |      |       |       |     | nodes        | in the previous |             | hidden     | layer  |
| x1 x2 | x3 x4 |      | x1 x2 | x3 x4 |     |              |                 |             |            |        |
|       |       |      |       |       |     | which        | have seen       | only x      | and x      |        |
|       |       |      |       |       |     |              |                 | 1           |            | 2      |
|       |       |      |       |       |     | We can       | implement       | this        | by         | taking |
|       |       |      |       |       |     | the weight   | matrices        | W1,         | W2 and     | V      |
|       |       |      |       |       |     | and applying | an              | appropriate |            | mask   |
|       |       |      |       |       |     | to them      | so that         | the         | disallowed |        |
|       |       |      |       |       |     | connections  | are dropped     |             |            |        |
21/24
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture22 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

)
x3
x2 ) x2 ,
) , ,
|     |     |         |           | )         | |x1 |x1 |x1 |     |
| --- | --- | ------- | --------- | --------- | ----------- | --- |
|     |     |         |           | p(x1 p(x2 | p(x3 p(x4   |     |
|     | xˆ1 | xˆ2 xˆ3 | xˆ4 Masks |           |             |     |
|     |     |         |           | 1 2       | 3 4         |     |
=MV
V
|     |     |     |     | 1 1  | 2 1 3 |     |
| --- | --- | --- | --- | ---- | ----- | --- |
|     | W2  |     |     | =MW2 |       |     |
|     |     |     |     | 1 2  | 1 2 3 |     |
W1
=MW1
|             |        |       |               | 1 2            | 3 4     |     |
| ----------- | ------ | ----- | ------------- | -------------- | ------- | --- |
|             | x1     | x2 x3 | x4            | x1 x2          | x3 x4   |     |
| For example | we can | apply | the following | mask at        | layer 2 |     |
|             |  W2   | W2    | W2 W2         | W2           |         |    |
|             |        |       |               |                | 1 0 1 0 | 0   |
|             | 11     | 12    | 13            | 14 15          |         |     |
|             | W2    | W2    | W2 W2         | W2 1          | 0 1 0   | 0  |
|             | 21     | 22    | 23            | 24 25         |         |     |
|             |       |       |               |              |         |    |
|             | W2    | W2    | W2 W2         | W2 (cid:12)1 | 1 1 1   | 0  |
|             | 31     | 32    | 33            | 34 35         |         |     |
|             |  W2  | W2    | W2 W2         | W2            |         |    |
|             |        |       |               |  1           | 0 1 0   | 0  |
|             | 41     | 42    | 43            | 44 45          |         |     |
|             | W2     | W2    | W2 W2         | W2             | 1 1 1 1 | 1   |
|             | 51     | 52    | 53            | 54 55          |         |     |
22/24
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture22 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

|     |     |     |     |     | x3 ) | The | objective | function | for this |
| --- | --- | --- | --- | --- | ---- | --- | --------- | -------- | -------- |
) ,
|         |         |       |           | ) , x2    | , x2 |         |       |       |             |
| ------- | ------- | ----- | --------- | --------- | ---- | ------- | ----- | ----- | ----------- |
|         |         |       | )         | |x1 |x1   | |x1  | network | would | again | be a sum of |
|         |         |       | p(x1 p(x2 | p(x3 p(x4 |      |         |       |       |             |
| xˆ1 xˆ2 | xˆ3 xˆ4 | Masks |           |           |      |         |       |       |             |
cross entropies
|     |     |     | 1 2 | 3 4 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
=MV
| V   |     |      |     |     |     | Thenetworkcanbetrainedusing |      |         |            |
| --- | --- | ---- | --- | --- | --- | --------------------------- | ---- | ------- | ---------- |
|     |     |      | 1 1 | 2 1 | 3   | backpropagation             |      | such    | that the   |
| W2  |     | =MW2 |     |     |     | errors                      | will | only be | propagated |
|     |     |      | 1 2 | 1 2 | 3   | along                       | the  | active  | (unmasked) |
W1
|     |     |     |     |     |     | connections |     | (similar | to what |
| --- | --- | --- | --- | --- | --- | ----------- | --- | -------- | ------- |
=MW1
|       |       |     | 1 2   | 3 4   |     | happens | in  | dropout) |     |
| ----- | ----- | --- | ----- | ----- | --- | ------- | --- | -------- | --- |
| x1 x2 | x3 x4 |     | x1 x2 | x3 x4 |     |         |     |          |     |
23/24
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture22 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     | xx33 )) | Similar | to NADE, |     | this | model is |
| --- | --- | --- | ------- | ------- | -------- | --- | ---- | -------- |
)) ,,
|     |                   | )) ,, xx22        | ,, xx22 |              |     |                 |     |         |
| --- | ----------------- | ----------------- | ------- | ------------ | --- | --------------- | --- | ------- |
|     | ))                | ||xx11 ||xx11     | ||xx11  | not designed |     | for abstraction |     | but for |
|     | pp((xx11 pp((xx22 | pp((xx33 pp((xx44 |         |              |     |                 |     |         |
Masks
generation
|     | 11 22 | 33 44 |     |     |     |     |     |     |
| --- | ----- | ----- | --- | --- | --- | --- | --- | --- |
=MV
|      |           |          |     | How will     | you           | do generation |           | in this   |
| ---- | --------- | -------- | --- | ------------ | ------------- | ------------- | --------- | --------- |
|      | 1111 1111 | 222 1111 | 33  | model?       | Using         | the           | same      | iterative |
| =MW2 |           |          |     | process      | that we       | used          | with      | NADE      |
|      | 1111 222  | 1111 222 | 33  |              |               |               |           |           |
|      |           |          |     | First sample | a             | value         | of x      | 1         |
| =MW1 |           |          |     | Now feed     | this          | value         | of        | x to the  |
|      | 11 22     | 33 4     |     |              |               |               |           | 1         |
|      | x1 x2     | x3 x4    |     |              |               |               |           |           |
|      |           |          |     | network      | and compute   |               | y 2       |           |
|      |           |          |     | Now sample   |               | x from        | Bernoulli | (y )      |
|      |           |          |     |              |               | 2             |           | 2         |
|      |           |          |     | and repeat   |               | the           | process   | till you  |
|      |           |          |     | generate     | all variables |               | upto      | x         |
n
24/24
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture22 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- |
