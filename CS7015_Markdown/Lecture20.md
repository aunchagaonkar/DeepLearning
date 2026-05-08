| CS7015 | (Deep Learning) | : Lecture | 20  |
| ------ | --------------- | --------- | --- |
Markov Chains, Gibbs Sampling for Training RBMs, Contrastive Divergence
|     | for training | RBMs      |     |
| --- | ------------ | --------- | --- |
|     | Mitesh       | M. Khapra |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/61
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | -------------- | --------------------- | --------- |

| Module | 20.1 : | Markov Chains |     |
| ------ | ------ | ------------- | --- |
2/61
| MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture20 |
| -------------- | --- | --------------------- | --------- |

|     |     | Let us | first begin | by  | restating | our goals |     |
| --- | --- | ------ | ----------- | --- | --------- | --------- | --- |
Rn,
|     |     | Goal 1:            | Given      | a random   |       | variable       | X ∈      |
| --- | --- | ------------------ | ---------- | ---------- | ----- | -------------- | -------- |
|     |     | we are             | interested | in drawing |       | samples        | from the |
|     |     | joint distribution |            | P(X)       |       |                |          |
|     |     | Goal 2:            | Given      | a function |       | f(X) defined   | over     |
|     |     | the random         |            | variable   | X, we | are interested | in       |
E
| X ∈R1024 |     | computing | the | expectation |     | [f(X)] |     |
| -------- | --- | --------- | --- | ----------- | --- | ------ | --- |
P(X)
|     |     | We will             | use | Gibbs | Sampling   |     | (class of |
| --- | --- | ------------------- | --- | ----- | ---------- | --- | --------- |
|     |     | Metropolis-Hastings |     |       | algorithm) | to  | achieve   |
these goals
|          |     | We will                               | first | understand |     | the intuition | be- |
| -------- | --- | ------------------------------------- | ----- | ---------- | --- | ------------- | --- |
| E [f(X)] |     | hindGibbsSamplingandthenunderstandthe |       |            |     |               |     |
P(X)
|     |     | math behind |     | it  |     |     |     |
| --- | --- | ----------- | --- | --- | --- | --- | --- |
3/61
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | Suppose | instead | of     | a single | random | variable  |     |
| --- | --- | ------- | ------- | ------ | -------- | ------ | --------- | --- |
|     |     | X ∈ Rn, | we      | have a | chain of | random | variables |     |
Rn
|     |     | X ,X ,...,X  |             | each                      | X ∈ |        |      |     |
| --- | --- | ------------ | ----------- | ------------------------- | --- | ------ | ---- | --- |
|     |     | 1 2          |             | K                         | i   |        |      |     |
|     |     | The i here   | corresponds |                           | to  | a time | step |     |
|     |     | Forexample,X |             | couldbean-dimensionalvec- |     |        |      |     |
i
|     |     | tor containing |      | the number  |     | of customers |     | in a |
| --- | --- | -------------- | ---- | ----------- | --- | ------------ | --- | ---- |
|     |     | given set      | of n | restaurants |     | on day       | i   |      |
X ∈R1024
|     |     | In our | case, | X could | be a | 1024 | dimensional |     |
| --- | --- | ------ | ----- | ------- | ---- | ---- | ----------- | --- |
i
|     |     | image sent | by  | our friend | on  | day | i   |     |
| --- | --- | ---------- | --- | ---------- | --- | --- | --- | --- |
Foreaseofillustrationwewillsticktotheres-
|     |     | taurant       | example | and    | assume     | that | instead   | of  |
| --- | --- | ------------- | ------- | ------ | ---------- | ---- | --------- | --- |
|     |     | actual counts |         | we are | interested | only | in binary |     |
E [f(X)]
| P(X) |     | counts | (high=1, | low=0) |     |     |     |     |
| ---- | --- | ------ | -------- | ------ | --- | --- | --- | --- |
{0,1}n
|     |     | Thus X | i ∈ |     |     |     |     |     |
| --- | --- | ------ | --- | --- | --- | --- | --- | --- |
4/61
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | On day | 1, let X | take on the value | x (x is |
| --- | ------ | -------- | ----------------- | ------- |
|     |        | 1        |                   | 1 1     |
2n
|     | one of | the possible | vectors)          |         |
| --- | ------ | ------------ | ----------------- | ------- |
|     | On day | 2, let X     | take on the value | x (x is |
|     |        | 2            |                   | 2 2     |
2n
|     | again one | of the possible | vectors)        |           |
| --- | --------- | --------------- | --------------- | --------- |
|     | One way   | of looking      | at this is that | the state |
x x x
1 2 3
|     | has transitioned     | from | x 1 to x 2       |     |
| --- | -------------------- | ---- | ---------------- | --- |
|     | Similarly,onday3,ifX |      | takesonthevaluex |     |
|     |                      |      | 3                | 3   |
thenwecansaythatthestatehastransitioned
|     | from x           | to x to x |                 |           |
| --- | ---------------- | --------- | --------------- | --------- |
|     |                  | 1 2       | 3               |           |
|     | Finally,         | on day n, | we can say that | the state |
|     | has transitioned | from      | x to x to       | x to ...x |
|     |                  |           | 1 2             | 3 n       |
5/61
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |
| -------------- | --------------------- | --- | --------- | --- |

Wemaynowbeinterestedinknowingwhatisthemost
|     |     |     | likely | value     | that the | state   | will          | take on | day i given   | the |
| --- | --- | --- | ------ | --------- | -------- | ------- | ------------- | ------- | ------------- | --- |
|     |     |     | states | on day    | 1 to     | day i−1 |               |         |               |     |
|     |     |     | More   | formally, | we       | may     | be interested | in      | the following |     |
distribution
|     |     |     | P(X | =   | x |X | = x ,X | = x | ,...,X | = x     | )   |
| --- | --- | --- | --- | --- | ---- | ------ | --- | ------ | ------- | --- |
|     |     |     |     | i   | i 1  | 1      | 2   | 2      | i−1 i−1 |     |
x x x ··· x Now suppose the chain exhibits the following Markov
| 1 2 | 3   | i   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
property
|     |     |     | P(X         | =          | x |X        | = x ,X    | = x      | ,...,X     | = x         | )        |
| --- | --- | --- | ----------- | ---------- | ----------- | --------- | -------- | ---------- | ----------- | -------- |
|     |     |     |             | i          | i 1         | 1         | 2        | 2          | i−1 i−1     |          |
|     |     |     |             |            |             |           | = P(X    | i = x i |X | i−1 = x i−1 | )        |
|     |     |     | In other    | words,     | given       | the       | previous | state      | X i−1       | , X i is |
|     |     |     | independent |            | of all      | preceding | states   |            |             |          |
|     |     |     | Can         | we draw    | a graphical |           | model    | to encode  | this        | inde-    |
|     |     |     | pendence    | assumption |             | ?         |          |            |             |          |
6/61
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     | In this      | graphical model, | the random         | variables     |
| --- | --- | --- | ------------ | ---------------- | ------------------ | ------------- |
|     |     |     | are X        | ,X ,...,X        |                    |               |
|     |     |     | 1            | 2                | k                  |               |
|     |     |     | We will      | have a node      | corresponding      | to each of    |
| X X | ··· | X   | these random | variables        |                    |               |
| 1 2 |     | k   |              |                  |                    |               |
|     |     |     | What will    | be the           | edges in the graph | ?             |
|     |     |     | Well, each   | node             | only depends       | on its prede- |
|     |     |     | cessor,      | so we will       | just have an       | edge between  |
|     |     |     | successive   | nodes            |                    |               |
7/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     |     | This property | (X  | ⊥⊥ Xi−2|X |     | ) is called | the |
| --- | --- | ------------- | --- | --------- | --- | ----------- | --- |
|     |     |               |     | i 1       | i−1 |             |     |
Markov property
|     |     | And the  | resulting | chain | X   | ,X ,...,X | is  |
| --- | --- | -------- | --------- | ----- | --- | --------- | --- |
|     |     |          |           |       | 1   | 2         | k   |
|     |     | called a | Markov    | chain |     |           |     |
Further,sinceweareconsideringdiscretetime
|         |     | steps, this    | is called | a                          | discrete | time Markov |     |
| ------- | --- | -------------- | --------- | -------------------------- | -------- | ----------- | --- |
| X X ··· | X   |                |           |                            |          |             |     |
| 1 2     | k   | Chain          |           |                            |          |             |     |
|         |     | Further,sinceX |           | ’stakeondiscretevaluesthis |          |             |     |
i
iscalledadiscretetimediscretespaceMarkov
Chain
|     |     | Okay, but | why are  | we                 | interested | in Markov |     |
| --- | --- | --------- | -------- | ------------------ | ---------- | --------- | --- |
|     |     | chains?   | (we will | get there          | soon!      | for now   | let |
|     |     | us just   | focus on | these definitions) |            |           |     |
8/61
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

| X   | X   | ··· | X   |     |          |       |            |            |             |     |        |
| --- | --- | --- | --- | --- | -------- | ----- | ---------- | ---------- | ----------- | --- | ------ |
| 1   | 2   |     | k   | Let | us delve | a     | bit deeper |            | into Markov |     | Chains |
|     |     |     |     | and | define   | a few | more       | quantities |             |     |        |
2n
|                 |           |      |        | Let          | us assume |           | =    | l (i.e., | X can      | take    | l val- |
| --------------- | --------- | ---- | ------ | ------------ | --------- | --------- | ---- | -------- | ---------- | ------- | ------ |
| RecallthateachX |           | ∈    | {0,1}n |              |           |           |      |          | i          |         |        |
|                 |           | i    |        | ues)         |           |           |      |          |            |         |        |
|                 |           |      |        | How          | many      | values    | do   | we       | need to    | specify | the    |
|                 | Xi−1 Xi−2 | Tab  |        |              |           |           |      |          |            |         |        |
|                 | 1 1       | 0.05 |        | distribution |           |           |      |          |            |         |        |
|                 | 1 2       | 0.06 |        |              |           |           |      |          |            |         |        |
|                 | ... ...   | ...  |        |              |           |           |      |          |            |         |        |
|                 |           |      |        |              | P(X       | =         | x |X | =        | x )?       | (l2)    |        |
|                 |           |      |        |              |           | i         | i    | i−1      | i−1        |         |        |
|                 | 1 l       | 0.02 |        |              |           |           |      |          |            |         |        |
|                 | 2 1       | 0.03 |        |              |           |           |      |          |            |         |        |
|                 |           |      |        | We           | can       | represent | this | as       | a matrix   | T       | ∈ l ×  |
|                 | 2 2       | 0.07 |        |              |           |           |      |          |            |         |        |
|                 | ... ...   | ...  |        |              |           |           |      |          |            |         |        |
|                 |           |      |        | l where      |           | the entry | T    | of       | the matrix | denotes |        |
a,b
|     | 2 l     | 0.01 |     |                                           |          |     |           |     |            |        |     |
| --- | ------- | ---- | --- | ----------------------------------------- | -------- | --- | --------- | --- | ---------- | ------ | --- |
|     | ... ... | ...  |     | theprobabilityoftransitioningtostatebfrom |          |     |           |     |            |        |     |
|     |         |      |     | state                                     | a (i.e., | P(X | =         | b|X | = a))      |        |     |
|     | l 1     | 0.1  |     |                                           |          |     | i         | i−1 |            |        |     |
|     | l 2     | 0.09 |     |                                           |          |     |           |     |            |        |     |
|     | ... ... | ...  |     | The                                       | matrix   | T   | is called | the | transition | matrix |     |
|     | l l     | 0.21 |     |                                           |          |     |           |     |            |        |     |
9/61
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     | We  | need | to define | this transition |     | matrix | T , |
| --- | --- | --- | --- | ---- | --------- | --------------- | --- | ------ | --- |
ab
i.e.,
| X X       | ···  | X   |              |          |                 |               |            |             |       |
| --------- | ---- | --- | ------------ | -------- | --------------- | ------------- | ---------- | ----------- | ----- |
| 1 2       |      | k   |              |          |                 |               |            |             |       |
|           |      |     |              | P(X      | = b|X           | =             | a) ∀a,b    | ∀i          |       |
|           |      |     |              |          | i               | i−1           |            |             |       |
| Xi−1 Xi−2 | Tab  |     |              |          |                 |               |            |             |       |
|           |      |     | Why          | do       | we need         | to define     | this       | ∀i ?        | Well, |
| 1 1       | 0.05 |     |              |          |                 |               |            |             |       |
| 1 2       | 0.06 |     | because      | this     | transition      | probabilities |            | may         | be    |
| ... ...   | ...  |     |              |          |                 |               |            |             |       |
|           |      |     | different    |          | for different   | time          | steps      |             |       |
| 1 l       | 0.02 |     |              |          |                 |               |            |             |       |
| 2 1       | 0.03 |     | For          | example, | the             | transition    | in         | the number  |       |
| 2 2       | 0.07 |     | of customers |          | may             | be different  |            | from Friday |       |
| ... ...   | ...  |     |              |          |                 |               |            |             |       |
|           |      |     | to Saturday  |          | (weekend)       | as            | compared   | to          | from  |
| 2 l       | 0.01 |     |              |          |                 |               |            |             |       |
| ... ...   | ...  |     | Sunday       | to       | Monday(weekday) |               |            |             |       |
| l 1       | 0.1  |     |              |          |                 |               |            |             |       |
|           |      |     | Thus,        | for      | a Markov        | chain         | X          | ,X ,...,X   |       |
| l 2       | 0.09 |     |              |          |                 |               |            | 1 2         | k     |
| ... ...   | ...  |     | we           | will     | have k          | such          | transition | matrices    |       |
| l l       | 0.21 |     |              |          |                 |               |            |             |       |
|           |      |     | T 1 ,T       | 2 ,...,T | k               |               |            |             |       |
10/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

| X   | X    | ···      | X   | However,       | for         | this discussion |         | we          | will assume |
| --- | ---- | -------- | --- | -------------- | ----------- | --------------- | ------- | ----------- | ----------- |
| 1   | 2    |          | k   |                |             |                 |         |             |             |
|     |      |          |     | that the       | Markov      | chain           | is time | homogeneous |             |
|     |      |          |     | What does      | that        | mean?           | It      | means       | that        |
|     | Xi−1 | Xi−2 Tab |     |                |             |                 |         |             |             |
|     | 1    | 1 0.05   |     |                |             |                 |         |             |             |
|     |      |          |     |                | T           | = T =           | ··· =   | T =         | T           |
|     | 1    | 2 0.06   |     |                | 1           | 2               |         | k           |             |
|     | ...  | ... ...  |     |                |             |                 |         |             |             |
|     | 1    | l 0.02   |     | In other       | words       |                 |         |             |             |
|     | 2    | 1 0.03   |     |                |             |                 |         |             |             |
|     | 2    | 2 0.07   |     |                |             |                 |         |             |             |
|     | ...  | ... ...  |     | P(X            | = b|X       | =               | a) =    | T           | ∀a,b ∀i     |
|     |      |          |     |                | i           | i−1             |         | ab          |             |
|     | 2    | l 0.01   |     |                |             |                 |         |             |             |
|     | ...  | ... ...  |     | The transition |             | matrix          | does    | not depend  | on the      |
|     | l    | 1 0.1    |     | time i         | and hence   | such            | a       | Markov      | Chain is    |
|     | l    | 2 0.09   |     |                |             |                 |         |             |             |
|     |      |          |     | called time    | homogeneous |                 |         |             |             |
|     | ...  | ... ...  |     |                |             |                 |         |             |             |
|     | l    | l 0.21   |     |                |             |                 |         |             |             |
11/61
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     |     |     | Now suppose | the | starting | distribution | at time |
| --- | --- | --- | ----------- | --- | -------- | ------------ | ------- |
µ0)
|     |     |     | step 0  | is given by |         |             |        |
| --- | --- | --- | ------- | ----------- | ------- | ----------- | ------ |
|     |     |     | Just to | be clear µ0 | is a 2n | dimensional | vector |
such that
|     |     |     |           | µ0          | = P(X | = a)       |          |
| --- | --- | --- | --------- | ----------- | ----- | ---------- | -------- |
|     |     |     |           | a           | 0     |            |          |
|     |     |     | µ0 is the | probability | that  | the random | variable |
a
| X X | ··· | X   | takes on | the value | a among | all the | possible 2n |
| --- | --- | --- | -------- | --------- | ------- | ------- | ----------- |
| 1 2 |     | k   |          |           |         |         |             |
values
|     |     |     | Given | µ0 and T | how will | you compute | µk  |
| --- | --- | --- | ----- | -------- | -------- | ----------- | --- |
where
µk
|     |     |     |     |     | = P(X k | = a) |     |
| --- | --- | --- | --- | --- | ------- | ---- | --- |
a
|     |     |     | µk                              | 2n            |     |        | ath      |
| --- | --- | --- | ------------------------------- | ------------- | --- | ------ | -------- |
|     |     |     | is again                        | a dimensional |     | vector | whose    |
|     |     |     | entrytellsustheprobabilitythatX |               |     |        | willtake |
k
|     |     |     | onthevalueaamongallthepossible2n |     |     |     | values |
| --- | --- | --- | -------------------------------- | --- | --- | --- | ------ |
12/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | Let us | consider | P(X = | b)  |     |     |
| --- | --- | --- | ------ | -------- | ----- | --- | --- | --- |
1
(cid:88)
|     |     |     | P(X | 1 = b) | = P(X | 0 = | a,X | 1 = b) |
| --- | --- | --- | --- | ------ | ----- | --- | --- | ------ |
| X   | X   |     |     |        |       |     |     |        |
| 0   | 1   |     |     |        |       |     |     |        |
a
1
|     |     |     | The above | sum      | essentially |                  | captures | all the |
| --- | --- | --- | --------- | -------- | ----------- | ---------------- | -------- | ------- |
|     |     |     | paths of  | reaching | X           | = b irrespective |          | of the  |
| 2   | b   |     |           |          | 1           |                  |          |         |
|     |     |     | value of  | X        |             |                  |          |         |
0
(cid:88)
| .   | .   |     | P(X = | b) = | P(X | = a,X | = b) |     |
| --- | --- | --- | ----- | ---- | --- | ----- | ---- | --- |
| .   | .   |     | 1     |      | 0   |       | 1    |     |
| .   | .   |     |       |      |     |       |      |     |
a
(cid:88)
|     |     |     |     | =   | P(X | = a)P(X | =   | b|X = a) |
| --- | --- | --- | --- | --- | --- | ------- | --- | -------- |
| l   |     |     |     |     | 0   |         | 1   | 0        |
a
(cid:88)
= µ0T
|     |     |     |     |     | a ab |     |     |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- |
a
13/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     | X   |     |     | X   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | 0   |     | 1   |     |     |     |     |     |     |     |
|     | 1   |     |     | 1   |     |     |     |     |     |     |     |
0.2
|     | 0.3 | 0.5 |     |     |     | Let us                         | see if     | there is | a more | compact  |     |
| --- | --- | --- | --- | --- | --- | ------------------------------ | ---------- | -------- | ------ | -------- | --- |
|     |     | 0.3 |     |     |     | wayofwritingthedistributionP(X |            |          |        |          | )   |
|     |     | 0.3 |     |     |     |                                |            |          |        |          | 1   |
|     |     |     |     |     |     | (i.e., of                      | specifying | P(X      | 1      | = b) ∀b) |     |
|     | 2   |     |     | 2   |     |                                |            |          |        |          |     |
0.6
|     |         |     |         |          |      | Let us    | consider | a            | simple   | case     | when |
| --- | ------- | --- | ------- | -------- | ---- | --------- | -------- | ------------ | -------- | -------- | ---- |
|     | 0.4     | 0.1 |         |          |      |           |          |              | 2n)      |          |      |
|     |         | 0.4 |         |          |      | l = 3 (as | opposed  | to           |          |          |      |
|     |         | 0.2 |         |          |      | Thus, µ0  | ∈ R3     | and          | T ∈ R3×3 |          |      |
|     | 3       | 0.4 |         | 3        |      | What does | the      | product      | µ0T      | give     | us ? |
|     |         |     |         |          |      | It gives  | us the   | distribution |          | µ !      | (the |
|     | 0.3     |     |         |         |     |           |          |              |          | 1        |      |
|     |         |     |         | 0.2 0.5  | 0.3  |           |          |              |          | (cid:80) |      |
|     |         |     |         |          |      | bth entry | of       | this vector  |          | is µ0T   |      |
| µ0T | (cid:2) |     | (cid:3) |          |      |           |          |              |          | a        | a ab |
| =   | 0.3     | 0.4 | 0.3     | 0.3 0.6 | 0.1 |           |          |              |          |          |      |
|     |         |     |         |          |      | which is  | P(X      | = b))        |          |          |      |
1
|     |         |      |      | 0.4 0.2 | 0.4 |     |     |     |     |     |     |
| --- | ------- | ---- | ---- | ------- | --- | --- | --- | --- | --- | --- | --- |
|     | (cid:2) |      |      | (cid:3) |     |     |     |     |     |     |     |
| =   | 0.3     | 0.45 | 0.25 |         |     |     |     |     |     |     |     |
14/61
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     | Let | us consider | P(X |     | = b) |     |     |
| --- | --- | --- | ----------- | --- | --- | ---- | --- | --- |
2
| X X | X   |     |     |      | (cid:88) |     |       |      |
| --- | --- | --- | --- | ---- | -------- | --- | ----- | ---- |
| 0 1 | 2   |     | P(X | = b) | =        | P(X | = a,X | = b) |
|     |     |     |     | 2    |          |     | 1     | 2    |
a
| 1   |     | The         | above | sum | essentially    |     | captures | all the paths |
| --- | --- | ----------- | ----- | --- | -------------- | --- | -------- | ------------- |
|     |     | of reaching |       | X = | b irrespective |     | of the   | value of X    |
2 1
| 2   | b   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:88)
|     |     | P(X | =   | b) = | P(X | =   | a,X = b) |     |
| --- | --- | --- | --- | ---- | --- | --- | -------- | --- |
|     |     |     | 2   |      |     | 1   | 2        |     |
a
| . . | .   |     |     |          |     |     |         |          |
| --- | --- | --- | --- | -------- | --- | --- | ------- | -------- |
| . . | .   |     |     | (cid:88) |     |     |         |          |
| . . | .   |     |     | =        | P(X | =   | a)P(X = | b|X = a) |
|     |     |     |     |          |     | 1   | 2       | 1        |
a
(cid:88)
| l   |     |     |     |     | µ1T |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | =   |     | ab  |     |     |
a
a
15/61
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | Once | again | we  | can write | P(X | ) compactly |     | as  |
| --- | --- | ---- | ----- | --- | --------- | --- | ----------- | --- | --- |
2
|     |     |     |     |     | µ1T | (µ0T)T |     | µ0T2 |     |
| --- | --- | --- | --- | --- | --- | ------ | --- | ---- | --- |
|     |     |     | P(X | ) = | =   |        | =   |      |     |
2
| X X | X   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 1 | 2   |     |     |     |     |     |     |     |     |
In general,
1
µ0Tk
|     |     |     |     |     | P(X ) | =   |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- |
k
| 2   | b   |          |     |              |        |                 |      |          |     |
| --- | --- | -------- | --- | ------------ | ------ | --------------- | ---- | -------- | --- |
|     |     | Thus     | the | distribution |        | at any          | time | step can | be  |
|     |     | computed |     | by finding   |        | the appropriate |      | element  |     |
| . . | .   | from     | the | following    | series |                 |      |          |     |
| . . | .   |          |     |              |        |                 |      |          |     |
| . . | .   |          |     |              |        |                 |      |          |     |
µ0T1,µ0T2,µ0T3,...,µ0Tk,...
l
Notethatthisisstillcomputationallyexpens-
ivebecauseitinvolvesaproductofµ0(2n)and
|     |     | Tk(2n×2n) |          | (but | later | on we    | will | see that | we  |
| --- | --- | --------- | -------- | ---- | ----- | -------- | ---- | -------- | --- |
|     |     | do        | not need | this | full  | product) |      |          |     |
16/61
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     | If at a certain |                | time step                     | t, µt | reaches      | a    | distri- |
| --- | --- | --------------- | -------------- | ----------------------------- | ----- | ------------ | ---- | ------- |
|     |     | bution π        | such           | that πT                       | = π   |              |      |         |
| X X | X   | Then for        | all subsequent |                               | time  | steps        |      |         |
| 0 1 | 2   |                 |                |                               |       |              |      |         |
| 1   |     |                 |                | µj =                          | π(j ≥ | t)           |      |         |
|     |     | π is then       | called         | the stationary                |       | distribution |      | of      |
| 2   | b   |                 |                |                               |       |              |      |         |
|     |     | the Markov      | chain          |                               |       |              |      |         |
|     |     | X ,X            | ,X             | ,... willallfollowthesamedis- |       |              |      |         |
| . . | .   | t t+1           | t+2            |                               |       |              |      |         |
| . . | .   |                 |                |                               |       |              |      |         |
| . . | .   | tribution       | π              |                               |       |              |      |         |
|     |     | In other        | words,         | if we                         | have  | X =          | x ,X | =       |
|     |     |                 |                |                               |       | t            | t    | t+1     |
l
|     |     | x t+1 ,X t+2      | = x    | t+2 andsoonthenwecanthink |     |           |          |     |
| --- | --- | ----------------- | ------ | ------------------------- | --- | --------- | -------- | --- |
|     |     | of x ,x           | ,x     | as samples                |     | drawn     | from     | the |
|     |     | t t+1             | t+2    |                           |     |           |          |     |
|     |     | same distribution |        | π (this                   | is  | a crucial | property |     |
|     |     | and we will       | return | back                      | to  | it soon)  |          |     |
17/61
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     | Important: |        | If           | we run  | a Markov |       | Chain  | for a   |
| --- | --- | ---------- | ------ | ------------ | ------- | -------- | ----- | ------ | ------- |
|     |     | large      | number | of           | time    | steps    | then  | after  | a point |
|     |     | we         | start  | getting      | samples |          | x ,x  | ,x     | ,...    |
|     |     |            |        |              |         |          | t     | t+1    | t+2     |
| X X | X   |            |        |              |         |          |       |        |         |
| 0 1 | 2   | which      | are    | essentially  |         | being    | drawn | from   | the     |
|     |     | stationary |        | distribution |         | (Spoiler |       | Alert: | one     |
1
|     |     | of      | our goals | was           | to draw | samples |          | from  | a very |
| --- | --- | ------- | --------- | ------------- | ------- | ------- | -------- | ----- | ------ |
|     |     | complex |           | distribution) |         |         |          |       |        |
| 2   | b   |         |           |               |         |         |          |       |        |
|     |     | What    | do        | we mean       | by      | run a   | Markov   | Chain | for    |
|     |     | a       | large     | number        | of time | steps   | ?        |       |        |
| . . | .   |         |           |               |         |         |          |       |        |
| . . | .   |         |           |               |         |         |          |       | µ0     |
| . . | .   | It      | means     | we start      | drawing |         | a sample | X     | 0 ∼    |
|     |     | and     | then      | continue      | drawing |         | samples  |       |        |
l
|     |     |     | X ∼   | µ0T, X | ∼ µ0T2, |       | X ∼  | µ0T3,..., |      |
| --- | --- | --- | ----- | ------ | ------- | ----- | ---- | --------- | ---- |
|     |     |     | 1     |        | 2       |       | 3    |           |      |
|     |     |     | ...,X | t ∼    | π, X    | t+1 ∼ | π, X | t+2 ∼     | π... |
18/61
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

| X X | X   | Is it always | easy | to draw | these | samples? | No  |
| --- | --- | ------------ | ---- | ------- | ----- | -------- | --- |
| 0 1 | 2   |              |      |         |       |          |     |
|µk| 2n
|     |     | =   | which | means | that we | need | to com- |
| --- | --- | --- | ----- | ----- | ------- | ---- | ------- |
1
|     |     | pute the      | probability  | of      | each of       | the possible | 2n       |
| --- | --- | ------------- | ------------ | ------- | ------------- | ------------ | -------- |
|     |     | values that   | Xk can       | take    |               |              |          |
| 2   | b   |               |              |         |               |              |          |
|     |     | In other      | words the    | joint   | distribution  |              | µk has   |
|     |     | 2n parameters | which        | is      | prohibitively |              | large    |
| . . | .   |               |              |         |               |              |          |
| . . | .   | I wonder      | what can     | I do    | to reduce     | the          | number   |
| . . | .   |               |              |         |               |              |          |
|     |     | of parameters | in           | a joint | distribution  |              | (I hope  |
| l   |     | you already   | know         | what    | to do         | but we       | will re- |
|     |     | turn back     | to it later) |         |               |              |          |
19/61
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

| The story so far... |     |     |     |     |
| ------------------- | --- | --- | --- | --- |
We have seen what a discrete space, discrete time, time homogeneous Markov
Chain is
µ0
We have also defined (initial distribution), T (transition matrix) and π
| (stationary | distribution) |     |     |     |
| ----------- | ------------- | --- | --- | --- |
So far so good! But why do we care about Markov Chains and their
properties?
| How does | this discussion | tie back | to our goals? |     |
| -------- | --------------- | -------- | ------------- | --- |
We will first see an intuitive explanation for how all this ties back to our goals
| and then | get into a more | formal | discussion |     |
| -------- | --------------- | ------ | ---------- | --- |
20/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | --- | -------------- | --------------------- | --------- |

| Module | 20.2 : Why | do we | care about | Markov Chains? |
| ------ | ---------- | ----- | ---------- | -------------- |
21/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | --- | -------------- | --------------------- | --------- |

Recall our goals
Goal 1: Sample from P(X)
Goal 2: Compute E f(X)
P(X)
Now suppose we set up a Markov Chain
X ,X ,... such that
1 2
It is easy to draw samples from this chain and
This Markov Chain’s stationary distribution
is P(X)
X ∈R1024 Then it would mean that if we run the Markov
Chain for long enough, we will start getting
samples from P(X)
And once we have a large number of such samples
we can empirically estimate E f(X) as
P(X)
E P(X) [f(X)] 1 (cid:88) l+n
f(X )
i
n
i=l
22/61
MiteshM.Khapra CS7015(DeepLearning): Lecture20

We will now get into a formal discussion to concretize the above intuition
23/61
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| -------------- | --------------------- | --------- |

Theorem: If X ,X ,...,X is an irreducible time homogeneous discrete Markov
|       |                 | 0   | 1            | t   |         |     |     |
| ----- | --------------- | --- | ------------ | --- | ------- | --- | --- |
| Chain | with stationary |     | distribution |     | π, then |     |     |
t
|     | 1 (cid:88) |     | c on v er g es | a lm os | t su r e ly |     |     |
| --- | ---------- | --- | -------------- | ------- | ----------- | --- | --- |
f(X ) − − − − − − − − −− − − − − → E [f(X)], where X ∈ X and X ∼ π
|     |     | i   |     |     |     | π   |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     | t   |     |     | t→∞ |     |     |     |
i=1
X
| for | any function | f   | : → | R   |     |     |     |
| --- | ------------ | --- | --- | --- | --- | --- | --- |
If, further the Markov Chain is aperiodic then P(X t = x t |X 0 = x 0 ) → π(X) as
| t → | ∞ ∀x,x | ∈ X |     |     |     |     |     |
| --- | ------ | --- | --- | --- | --- | --- | --- |
0
SoPartAofthetheoremessentiallytellsusthatifwecansetupthechainX ,X ,...,X
0 1 t
such that it is tractable then using samples from this chain we can compute E [f(X)]
π
|     | (which we | know | is otherwise |     | intractable) |     |     |
| --- | --------- | ---- | ------------ | --- | ------------ | --- | --- |
Similarly Part B of the theorem says that if we can set up the chain X ,X ,...,X
0 1 t
suchthatitistractablethenwecanessentiallygetsamplesasiftheyweredrawnfrom
|     | π(X) (which | was  | otherwise  | intractable) |              |     |     |
| --- | ----------- | ---- | ---------- | ------------ | ------------ | --- | --- |
|     | Of course   | Part | A and Part | B            | are related! |     |     |
Further note that it doesn’t matter what the initial state was (the theorem holds for
|     | ∀x,x ∈X) |     |     |     |     |     |     |
| --- | -------- | --- | --- | --- | --- | --- | --- |
0
24/61
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture20 |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- |

| So our task | is cut out      | now       |                 |       |     |
| ----------- | --------------- | --------- | --------------- | ----- | --- |
| Define      | what our Markov | Chain     | is?             |       |     |
| Define      | the transition  | matrix T  | for our Markov  | Chain |     |
| Show how    | it is easy      | to sample | from this chain |       |     |
Show that the stationary distribution of this chain is the distribution P(X)
| (i.e., the | distribution | that we care | about) |     |     |
| ---------- | ------------ | ------------ | ------ | --- | --- |
Show that the chain is irreducible and aperiodic (because the theorem only
| holds for | such chains) |     |     |     |     |
| --------- | ------------ | --- | --- | --- | --- |
For ease of notation instead of X = V ,V ,V ,...,H ,H ,...,H , we will use
|       |           |     | 1 2 | m   | 1 2 n |
| ----- | --------- | --- | --- | --- | ----- |
| X = X | ,X ,...,X |     |     |     |       |
|       | 1 2       | n+m |     |     |       |
25/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |
| --- | --- | -------------- | --------------------- | --- | --------- |

| Module | 20.3 : | Setting up | a Markov | Chain for | RBMs |
| ------ | ------ | ---------- | -------- | --------- | ---- |
26/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | We begin    | by defining | our Markov | Chain       |       |
| --- | --- | --- | ----------- | ----------- | ---------- | ----------- | ----- |
|     |     |     | Recall that | X =         | {V,H}      | ∈ {0,1}n+m, | so at |
V1 V2 ... Vm H1 H2 ... Hn time step 0 we create a random vector X ∈
| X1 X2 X3 | ... ... | Xn+m | {0,1}n+m     |       |            |          |       |
| -------- | ------- | ---- | ------------ | ----- | ---------- | -------- | ----- |
| 0 1 1 0  | ... ... | 1    |              |       |            |          |       |
|          |         |      | At time-step | 1, we | transition | to a new | value |
| 1 1 0 0  | ... ... | 1    |              |       |            |          |       |
of X
2
|     |     |     | What does   | this mean? | How | do we | do this |
| --- | --- | --- | ----------- | ---------- | --- | ----- | ------- |
|     |     |     | transition? | Let us     | see |       |         |
27/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|           |              |     | We need  | to transition   |       | from a | state X = x ∈ |
| --------- | ------------ | --- | -------- | --------------- | ----- | ------ | ------------- |
|           |              |     | {0,1}n+m | to y ∈ {0,1}n+m |       |        |               |
|           |              |     | This is  | how we will     | do    | it     |               |
| V1 V2 ... | Vm H1 H2 ... | Hn  |          |                 |       |        |               |
|           |              |     | Sample   | a value i ∈     | {1 to | n+m}   | using a dis-  |
X1 X2 X3 ... ... Xn+m tribution q(i) (say, uniform distribution)
| 0 1 1 0 | ... ... | 1   |                                            |              |           |          |             |
| ------- | ------- | --- | ------------------------------------------ | ------------ | --------- | -------- | ----------- |
|         |         |     | Fix the                                    | value of all | variables | except   | X           |
| 1 1 0 0 | ... ... | 1   |                                            |              |           |          | i           |
|         |         |     | Sample                                     | a new value  | for       | X (could | be a V or a |
| 2 1 0 1 | ... ... | 1   |                                            |              |           | i        |             |
| 3 1 0 1 | ... ... | 1   | H)usingthefollowingconditionaldistribution |              |           |          |             |
| 4 1 0 1 | ... ... | 0   |                                            |              |           |          |             |
| ... ... |         |     |                                            | P(X i        | = y i |X  | −i = x   | −i )        |
... ...
Repeattheaboveprocessformanymanytime
|     |     |     | steps (each | time step | corresponds |     | to 1 step of |
| --- | --- | --- | ----------- | --------- | ----------- | --- | ------------ |
the chain)
28/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | What | are we doing |     | here? | How is | this related |
| --- | --- | --- | ---- | ------------ | --- | ----- | ------ | ------------ |
to our goals?
| V1 V2 ... | Vm H1 H2 | ... Hn |                |               |                            |                |         |           |
| --------- | -------- | ------ | -------------- | ------------- | -------------------------- | -------------- | ------- | --------- |
|           |          |        | More           | specifically, | we                         | have           | defined | a Markov  |
| X1 X2 X3  | ... ...  | Xn+m   |                |               |                            |                |         |           |
|           |          |        | Chain,         | but where     | is                         | our Transition |         | Matrix T? |
| 0 1 1 0   | ... ...  | 1      |                |               |                            |                |         |           |
|           |          |        | How isiteasyto |               | createthischain(orcreating |                |         |           |
| 1 1 0 0   | ... ...  | 1      |                |               |                            |                |         |           |
|           |          |        | samples        | x ,x ,...x    |                            | ) ?            |         |           |
| 2 1 0 1   | ... ...  | 1      |                | 0 1           | N                          |                |         |           |
3 1 0 1 ... ... 1 How do we show that the stationary distribu-
| 4 1 0 1 | ... ... | 0   | tion is | P(X) (where |     | X = | V,H) [We | haven’t |
| ------- | ------- | --- | ------- | ----------- | --- | --- | -------- | ------- |
... ...
|         |     |     | even defined   | T,     | then         | how       | can we   | talk about |
| ------- | --- | --- | -------------- | ------ | ------------ | --------- | -------- | ---------- |
| ... ... |     |     | the stationary |        | distribution |           | for T] ? |            |
|         |     |     | Let us         | answer | these        | questions | one      | by one     |
29/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|           |          |        | First, let     | us talk      | about   | the    | transition     |             | matrix  |
| --------- | -------- | ------ | -------------- | ------------ | ------- | ------ | -------------- | ----------- | ------- |
|           |          |        | We have        | actually     | defined |        | T although     |             | we did  |
|           |          |        | not explicitly | mention      |         | it     |                |             |         |
| V1 V2 ... | Vm H1 H2 | ... Hn |                |              |         |        |                |             |         |
|           |          |        | What           | would T      | contain | ?      | The            | probability | of      |
| X1 X2 X3  | ... ...  | Xn+m   |                |              |         |        |                |             |         |
|           |          |        | transitioning  | from         | any     | state  | x to           | any         | state y |
| 0 1 1 0   | ... ...  | 1      |                |              |         |        |                |             |         |
|           |          |        | So T ∈         | R2m+n×2m+n   |         | (when  | did            | we define   | such    |
| 1 1 0 0   | ... ...  | 1      |                |              |         |        |                |             |         |
| 2 1 0 1   | ... ...  | 1      | a matrix?)     |              |         |        |                |             |         |
| 3 1 0 1   | ... ...  | 1      | Actually,      | we defined   |         | a very | simple         | T           | which   |
| 4 1 0 1   | ... ...  | 0      | allowed        | only certain |         | types  | of transitions |             |         |
... ...
|     |     |     | Inparticular, | underthisT, |     |     | transitioningfrom |     |     |
| --- | --- | --- | ------------- | ----------- | --- | --- | ----------------- | --- | --- |
... ...
|     |     |     | astatextoastatey |        |       | waspossibleonlyifxand |     |        |     |
| --- | --- | --- | ---------------- | ------ | ----- | --------------------- | --- | ------ | --- |
|     |     |     | y differ         | in the | value | of only               | one | of the | n+m |
variables
30/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

| More formally, | we defined | T such | that |     |     |
| -------------- | ---------- | ------ | ---- | --- | --- |
(cid:40)
|     | q(i)P(y         | |x ), if ∃i∈X | so that ∀v ∈X | with v (cid:54)=i,x | =y  |
| --- | --------------- | ------------- | ------------- | ------------------- | --- |
|     |                 | i −i          |               |                     | v v |
| p   | =               |               |               |                     |     |
|     | xy 0, otherwise |               |               |                     |     |
where q(i) is the probability that X i is the random variable whose value trans-
| itions while | the value | of X remains | the same |     |     |
| ------------ | --------- | ------------ | -------- | --- | --- |
−i
The second term P(X i = y i |X −i ) essentially tells us that given the value of the
remaining random variable what is the probability of X taking on a certain
i
value
With that we have answered the first question “What is the transition matrix
T?” (It is a very sparse matrix allowing only certain transitions)
31/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | Wenowlookatthesecondquestion: |             |           |          | Howisit |
| --- | --- | --- | ----------------------------- | ----------- | --------- | -------- | ------- |
|     |     |     | easy to                       | create this | chain (or | creating | samples |
|     |     |     | x ,x ,...x                    | )?          |           |          |         |
|     |     |     | 0 1                           | l           |           |          |         |
V1 V2 ... Vm H1 H2 ... Hn At each step we are changing only one of the
X1 X2 X3 ... ... Xn+m n + m random variables using the following
| 0 1 1 0 | ... ... | 1   | probability |     |     |     |     |
| ------- | ------- | --- | ----------- | --- | --- | --- | --- |
| 1 1 0 0 | ... ... | 1   |             |     |     |     |     |
P(X)
| 2 1 0 1 | ... ... | 1   | P(X | = y |X | = x   | ) = |     |
| ------- | ------- | --- | --- | ------ | ----- | --- | --- |
|         |         |     |     | i i    | −i −i |     |     |
| 3 1 0 1 | ... ... | 1   |     |        |       | P(X | )   |
−i
| 4 1 0 1 | ... ... | 0   |     |     |     |     |     |
| ------- | ------- | --- | --- | --- | --- | --- | --- |
... ...
| ... ... |     |     | But how   | is computing | this         | probability | easy?    |
| ------- | --- | --- | --------- | ------------ | ------------ | ----------- | -------- |
|         |     |     | Doesn’t   | the joint    | distribution | on          | LHS also |
|         |     |     | have 2n+m | parameters   | ?            |             |          |
|         |     |     | Well, not | really !     |              |             |          |
32/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | Consider          | the case      | when i | <= m  | (i.e., we have |     |
| --- | --- | --- | ----------------- | ------------- | ------ | ----- | -------------- | --- |
|     |     |     | decided           | to transition | the    | value | of one of the  |     |
|     |     |     | visible variables | V             | to V   | )     |                |     |
|     |     |     |                   |               | 1 m    |       |                |     |
V1 V2 ... Vm H1 H2 ... Hn Then P(X = y |X = x ) is essentially
|          |         |      |     | i i | −i −i |     |     |     |
| -------- | ------- | ---- | --- | --- | ----- | --- | --- | --- |
| X1 X2 X3 | ... ... | Xn+m |     |     |       |     |     |     |
(cid:40)
| 0 1 1 0 | ... ... | 1   |     |     |     |     | z,if y | = 1 |
| ------- | ------- | --- | --- | --- | --- | --- | ------ | --- |
i
|         |         |     | P(V = | y |V ,H) | = P(V | = y |H) | =      |       |
| ------- | ------- | --- | ----- | -------- | ----- | ------- | ------ | ----- |
| 1 1 0 0 | ... ... | 1   | i     | i −i     | i     | i       | 1−z,if | y = 0 |
i
| 2 1 0 1 | ... ... | 1   |       |           |          |        |     |     |
| ------- | ------- | --- | ----- | --------- | -------- | ------ | --- | --- |
| 3 1 0 1 | ... ... | 1   |       | (cid:80)m |          |        |     |     |
|         |         |     | where | z = σ(    | w ij v j | +c i ) |     |     |
j=1
| 4 1 0 1 | ... ... | 0   |     |     |     |     |     |     |
| ------- | ------- | --- | --- | --- | --- | --- | --- | --- |
Theaboveprobabilityisveryeasytocompute
... ...
| ... ... |     |     | (just a | sigmoid function) |     |     |     |     |
| ------- | --- | --- | ------- | ----------------- | --- | --- | --- | --- |
Onceyoucomputetheaboveprobability,with
|     |     |     | probability | z you       | will set | the value | of V i to 1 |     |
| --- | --- | --- | ----------- | ----------- | -------- | --------- | ----------- | --- |
|     |     |     | and with    | probability | 1−z      | you will  | set it to 0 |     |
33/61
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

| V1 V2 ... | Vm H1 H2 | ... Hn |                  |                      |         |              |          |
| --------- | -------- | ------ | ---------------- | -------------------- | ------- | ------------ | -------- |
|           |          |        | So essentially   | at every             | time    | step you     | sample a |
| X1 X2 X3  | ... ...  | Xn+m   |                  |                      |         |              |          |
|           |          |        | i from a         | uniform distribution |         | (q i )       |          |
| 0 1 1 0   | ... ...  | 1      |                  |                      |         |              |          |
|           |          |        | And then         | sample               | a value | of V ∈ {0,1} | using    |
| 1 1 0 0   | ... ...  | 1      |                  |                      |         | i            |          |
|           |          |        | the distribution | Bernoulli(z)         |         |              |          |
| 2 1 0 1   | ... ...  | 1      |                  |                      |         |              |          |
| 3 1 0 1   | ... ...  | 1      | Both these       | computations         |         | are easy     |          |
4 1 0 1 ... ... 0 Hence it is easy to create this chain starting
... ...
|         |     |     | from any | x   |     |     |     |
| ------- | --- | --- | -------- | --- | --- | --- | --- |
| ... ... |     |     |          | 0   |     |     |     |
34/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Okay,finallylet’slookatthethirdquestion: Howdoweshowthatthestationary
| distribution |         | is P(X)   | (where     | X = V,H)         |          |     |
| ------------ | ------- | --------- | ---------- | ---------------- | -------- | --- |
| To           | prove   | this we   | will refer | to the following | Theorem: |     |
| Detailed     | Balance | Condition |            |                  |          |     |
To show that a distribution π is a stationary distribution for a Markov Chain
described by the transition probabilities p , x,y ∈ Ω, it is sufficient to show that
xy
| ∀x,y ∈ | Ω, the     | following | condition | holds:      |         |     |
| ------ | ---------- | --------- | --------- | ----------- | ------- | --- |
|        |            |           |           | π(x)p       | = π(x)p |     |
|        |            |           |           | xy          | yx      |     |
| Let    | us revisit | what      | p         | is and what | π is    |     |
xy
35/61
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | --- | --- | --- | -------------- | --------------------- | --------- |

| Recall that | p   | is given | by  |     |     |     |     |
| ----------- | --- | -------- | --- | --- | --- | --- | --- |
xy
(cid:40)
q(i)P(X =y |X x ), if ∃i∈{1,2,...,n+m} such that ∀j ∈{1,2,...,n+m}if j (cid:54)=i,x =y
| p = | i   | i   | −i −i |     |     |     | j j |
| --- | --- | --- | ----- | --- | --- | --- | --- |
xy
|     | 0, otherwise |     |     |     |     |     |     |
| --- | ------------ | --- | --- | --- | --- | --- | --- |
For consistency of notation we will denote P(X) i.e., P(V,H) as π(X)
| Further, | as shorthand |     | we will refer | to π(X | = x) as | π(x) |     |
| -------- | ------------ | --- | ------------- | ------ | ------- | ---- | --- |
Thus, to prove that P(X), i.e., π(X) is the stationary distribution for our
| Markov | Chain we | need  | to prove | that |            |     |     |
| ------ | -------- | ----- | -------- | ---- | ---------- | --- | --- |
|        |          | π(x)p | = π(y)p  | ∀x,y | ∈ {0,1}m+n |     |     |
|        |          |       | xy       | yx   |            |     |     |
36/61
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

| To prove: | π(x)p |       | = π(y)p |      |           |         |               |           |           |          |
| --------- | ----- | ----- | ------- | ---- | --------- | ------- | ------------- | --------- | --------- | -------- |
|           |       | xy    |         | yx   |           |         |               |           |           |          |
|           |       |       |         |      | There are | 3 cases |               | that we   | need to   | consider |
|           |       |       |         |      | Case 1:   | x and   | y             | differ in | the state | of more  |
| V1 V2     | ...   | Vm H1 | H2 ...  | Hn   |           |         |               |           |           |          |
|           |       |       |         |      | than one  | random  | variable      |           |           |          |
| X1 X2     | X3    | ...   | ...     | Xn+m |           |         |               |           |           |          |
|           |       |       |         |      | In this   | case,   | by definition |           |           |          |
| 0 1 1     | 0     | ...   | ...     | 1    |           |         |               |           |           |          |
| 1 1 0     | 0     | ...   | ...     | 1    |           |         |               |           |           |          |
|           |       |       |         |      |           | π(x)p   |               | = π(x)∗0  | = 0       |          |
xy
| 2 1 0 | 1   | ... | ... | 1   |     |       |     |          |     |     |
| ----- | --- | --- | --- | --- | --- | ----- | --- | -------- | --- | --- |
|       |     |     |     |     |     | π(y)p |     | = π(y)∗0 | = 0 |     |
| 3 1 0 | 1   | ... | ... | 1   |     |       | yx  |          |     |     |
| 4 1 0 | 1   | ... | ... | 0   |     |       |     |          |     |     |
... ...
... ...
|     |     |     |     |     | Hence | the detailed |     | balance | condition | holds |
| --- | --- | --- | --- | --- | ----- | ------------ | --- | ------- | --------- | ----- |
trivially
37/61
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| To prove: | π(x)p     | = π(y)p |      |               |           |            |              |             |        |
| --------- | --------- | ------- | ---- | ------------- | --------- | ---------- | ------------ | ----------- | ------ |
|           | xy        |         | yx   |               |           |            |              |             |        |
|           |           |         |      | There are     | 3 cases   | that       | we need      | to consider |        |
|           |           |         |      | Case 2:       | x and     | y are      | equal (i.e., | they        | do not |
| V1 V2     | ... Vm H1 | H2 ...  | Hn   |               |           |            |              |             |        |
|           |           |         |      | differ in     | the state | of any     | random       | variable)   |        |
| X1 X2     | X3 ...    | ...     | Xn+m |               |           |            |              |             |        |
|           |           |         |      | In this case, | by        | definition |              |             |        |
| 0 1 1     | 0 ...     | ...     | 1    |               |           |            |              |             |        |
| 1 1 0     | 0 ...     | ...     | 1    |               |           |            |              |             |        |
|           |           |         |      |               | π(x)p     |            | = π(x)p      |             |        |
|           |           |         |      |               |           | xy         |              | xx          |        |
| 2 1 0     | 1 ...     | ...     | 1    |               |           |            |              |             |        |
|           |           |         |      |               | π(y)p     |            | = π(x)p      |             |        |
| 3 1 0     | 1 ...     | ...     | 1    |               |           | yx         |              | xx          |        |
| 4 1 0     | 1 ...     | ...     | 0    |               |           |            |              |             |        |
... ...
... ...
|     |     |     |     | Hence the | detailed | balance |     | condition | holds |
| --- | --- | --- | --- | --------- | -------- | ------- | --- | --------- | ----- |
trivially
38/61
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

There are 3 cases that we need to consider
To prove: π(x)p = π(y)p
xy yx Case 3: x and y differ in the state of only
one random variable
In this case, by definition
V1 V2 ... Vm H1 H2 ... Hn
X1 X2 X3 ... ... Xn+m
π(x)p = π(x)q(i)π(y |x )
0 1 1 0 ... ... 1 xy i −i
1 1 0 0 ... ... 1 π(y i ,x −i )
= q(i)π(x ,x )
i −i
2 1 0 1 ... ... 1 π(x )
−i
3 1 0 1 ... ... 1 π(x ,x )
i −i
= π(y ,x )q(i)
4 1 0 1 ... ... 0 i −i
π(x )
... ... −i
= π(y)q(i)π(x |x )
... ... i −i
= π(y)p
yx
Hence the detailed balance condition holds
39/61
MiteshM.Khapra CS7015(DeepLearning): Lecture20

| To prove: | π(x)p | = π(y)p |     |     |     |     |     |     |
| --------- | ----- | ------- | --- | --- | --- | --- | --- | --- |
|           | xy    |         | yx  |     |     |     |     |     |
Thuswehaveprovedthatthedetailedbalance
| V1 V2 | ... Vm H1 | H2 ... | Hn   |           |          |         |         |     |
| ----- | --------- | ------ | ---- | --------- | -------- | ------- | ------- | --- |
|       |           |        |      | condition | holds in | all the | 3 cases |     |
| X1 X2 | X3 ...    | ...    | Xn+m |           |          |         |         |     |
0 1 1 0 ... ... 1 Case 1: x and y differ in the state of more
| 1 1 0 | 0 ... | ... | 1   | than one | random | variable |     |     |
| ----- | ----- | --- | --- | -------- | ------ | -------- | --- | --- |
2 1 0 1 ... ... 1 Case 2: x and y are equal (i.e., they do not
| 3 1 0 | 1 ... | ... | 1   |           |           |        |                  |         |
| ----- | ----- | --- | --- | --------- | --------- | ------ | ---------------- | ------- |
|       |       |     |     | differ in | the state | of any | random variable) |         |
| 4 1 0 | 1 ... | ... | 0   |           |           |        |                  |         |
|       |       |     |     | Case 3:   | x and y   | differ | in the state     | of only |
... ...
| ... ... |     |     |     | one random | variable |     |     |     |
| ------- | --- | --- | --- | ---------- | -------- | --- | --- | --- |
40/61
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| So our task | is cut out      | now       |                 |        |        |
| ----------- | --------------- | --------- | --------------- | ------ | ------ |
| Define      | what our Markov | Chain     | is? (done)      |        |        |
| Define      | the transition  | matrix T  | for our Markov  | Chain  | (done) |
| Show how    | it is easy      | to sample | from this chain | (done) |        |
Show that the stationary distribution of this chain is the distribution P(X)
| (i.e., the | distribution | that we care | about) (done) |     |     |
| ---------- | ------------ | ------------ | ------------- | --- | --- |
Show that the chain is irreducible and aperiodic (let us see)
41/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |
| --- | --- | -------------- | --------------------- | --- | --------- |

|           |          |        | A Markov | chain          | is     | irreducible | if one        | can get  |
| --------- | -------- | ------ | -------- | -------------- | ------ | ----------- | ------------- | -------- |
|           |          |        | from any | state          | in     | Ω to any    | other in      | a finite |
|           |          |        | number   | of transitions |        | or          | more formally |          |
| V1 V2 ... | Vm H1 H2 | ... Hn |          |                |        |             |               |          |
|           |          |        |          |                | ∀i,j ∈ | Ω ∃k        | > 0 with      |          |
| X1 X2 X3  | ... ...  | Xn+m   |          |                |        |             |               |          |
| 0 1 1 0   | ... ...  | 1      |          | P(X(k)         |        | j|X(0)      |               |          |
|           |          |        |          |                | =      |             | = i) > 0      |          |
| 1 1 0 0   | ... ...  | 1      |          |                |        |             |               |          |
2 1 0 1 ... ... 1 Intuitively, we can see that our chain is irre-
| 3 1 0 1 | ... ... | 1   | ducible      |     |        |      |              |      |
| ------- | ------- | --- | ------------ | --- | ------ | ---- | ------------ | ---- |
| 4 1 0 1 | ... ... | 0   | For example, |     | notice | that | we can reach | from |
... ...
thestatecontainingall0’stoall1’saftersome
... ...
|     |     |     | finite  | time steps |         |               |     |         |
| --- | --- | --- | ------- | ---------- | ------- | ------------- | --- | ------- |
|     |     |     | We can  | prove      | this    | more formally | but | for now |
|     |     |     | we will | just       | rely on | the intuition |     |         |
42/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     |     |     | A chain   | is called | aperiodic |        | if ∀i | ∈     | Ω the  |
| --- | --- | --- | --------- | --------- | --------- | ------ | ----- | ----- | ------ |
|     |     |     | greatest  | common    | divisor   |        | of    |       |        |
|     |     |     | {k|P(X(k) | =         | i|X(0)    | = i) > | 0 ∧   | k ∈ N | } is 1 |
0
Thesetwehavedefinedabovecontainsallthe
|           |          |        | timesteps | at which | we  | can | reach | state | i start- |
| --------- | -------- | ------ | --------- | -------- | --- | --- | ----- | ----- | -------- |
| V1 V2 ... | Vm H1 H2 | ... Hn |           |          |     |     |       |       |          |
| X1 X2 X3  | ... ...  | Xn+m   | ing from  | step     | i   |     |       |       |          |
0 1 1 0 ... ... 1 Suppose the chain was periodic then this set
1 1 0 0 ... ... 1 would contain multiples of a certain number
| 2 1 0 1 | ... ... | 1   |                                       |        |                |       |     |        |     |
| ------- | ------- | --- | ------------------------------------- | ------ | -------------- | ----- | --- | ------ | --- |
|         |         |     | For example,                          |        | {3,6,9,12,...} |       | and | hence  | the |
| 3 1 0 1 | ... ... | 1   |                                       |        |                |       |     |        |     |
|         |         |     | greater                               | common | divisor        | would | be  | 3 (and | the |
| 4 1 0 1 | ... ... | 0   |                                       |        |                |       |     |        |     |
| ... ... |         |     | MarkovChainwouldbeperiodicwithaperiod |        |                |       |     |        |     |
of 3)
... ...
|     |     |     | However | if the | chain | is not | periodic | then | the |
| --- | --- | --- | ------- | ------ | ----- | ------ | -------- | ---- | --- |
setwouldcontainarbitrarynumbersandtheir
|     |     |     | GCD would | just | be  | 1 (hence | the | above | defin- |
| --- | --- | --- | --------- | ---- | --- | -------- | --- | ----- | ------ |
ition)
43/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture20 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

| V1 V2 ... | Vm H1 H2 | ... Hn |     |     |     |
| --------- | -------- | ------ | --- | --- | --- |
| X1 X2 X3  | ... ...  | Xn+m   |     |     |     |
0 1 1 0 ... ... 1 Again intuitively it should be clear that our
| 1 1 0 0 | ... ... | 1   | chain is   | aperiodic                   |         |
| ------- | ------- | --- | ---------- | --------------------------- | ------- |
| 2 1 0 1 | ... ... | 1   | Onceagain, | wecanformallyprovethisbutwe |         |
| 3 1 0 1 | ... ... | 1   |            |                             |         |
|         |         |     | will just  | rely on the intuition       | for now |
| 4 1 0 1 | ... ... | 0   |            |                             |         |
... ...
... ...
44/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| So our task | is cut out      | now       |                 |        |        |
| ----------- | --------------- | --------- | --------------- | ------ | ------ |
| Define      | what our Markov | Chain     | is? (done)      |        |        |
| Define      | the transition  | matrix T  | for our Markov  | Chain  | (done) |
| Show how    | it is easy      | to sample | from this chain | (done) |        |
Show that the stationary distribution of this chain is the distribution P(X)
| (i.e., the | distribution | that we care   | about) (done) |        |     |
| ---------- | ------------ | -------------- | ------------- | ------ | --- |
| Show that  | the chain    | is irreducible | and aperiodic | (done) |     |
45/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |
| --- | --- | -------------- | --------------------- | --- | --------- |

| Module | 20.4 : | Training RBMs | using Gibbs | Sampling |
| ------ | ------ | ------------- | ----------- | -------- |
46/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | --- | -------------- | --------------------- | --------- |

Okay, so we are now ready to write the full algorithm for training RBMs using
Gibbs Sampling
We will first quickly revisit the expectations that we wanted to compute and
| write a simplified | expression | for them |     |
| ------------------ | ---------- | -------- | --- |
47/61
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | -------------- | --------------------- | --------- |

∂L(θ)
H ∈ {0,1}n
∂w
c c c ij
1 2 n
(cid:88) ∂E(V,H) (cid:88) ∂E(V,H)
h h ··· h = − p(H|V) + p(V,H)
1 2 n ∂w ∂w
ij ij
H V,H
(cid:88) (cid:88)
= p(H|V)h v − p(V,H)h v
i j i j
w w
1,1 m,n W ∈Rm×n H V,H
= E [v h ]−E [v h ]
p(H|V) i j p(V,H) i j
v v ··· v
1 2 m We were interested in computing the partial
derivative of the log likehood w.r.t. one of the
b b b
1 2 m
V ∈ {0,1}m parameters (w ij )
(cid:80) (cid:80) We saw that this partial derivative is actually
E(V,H) = − w v h −
(cid:80) i (cid:80) j ij i j the sum of two expectations
b v − c h
i i i j j j
We will now simplify the expression for these
two expectations 48/61
MiteshM.Khapra CS7015(DeepLearning): Lecture20

∂L(θ)
| =E   | [vjhi]−E                                 | [vjhi] |
| ---- | ---------------------------------------- | ------ |
| ∂wij | p(H|V) p(V,H)                            |        |
| =    | (cid:88) p(h|v)hivj− (cid:88) p(v,h)hivj |        |
h v,h
|     | (cid:88) (cid:88) | (cid:88)   |
| --- | ----------------- | ---------- |
| =   | p(h|v)hivj− p(v)  | p(h|v)hivj |
v
|     | h   | h   |
| --- | --- | --- |
(cid:88)
Wewillfirstfocuson p(h|v)hivj
h
| (cid:88)     | (cid:88)(cid:88)      |     |
| ------------ | --------------------- | --- |
| p(h|v)hivj = | p(hi|v)p(h −i |v)hivj |     |
| h            | hi h−i                |     |
(cid:88) (cid:88)
| =   | p(hi|v)hivj p(h−i|v) |     |
| --- | -------------------- | --- |
hi h−i
=p(Hi=1|v)vj
m
=σ( (cid:88) wijvj+ci)vj
j=1
| ∂L(θ) | (cid:88) m (cid:88) | (cid:88) m         |
| ----- | ------------------- | ------------------ |
| =σ(   | wijvj+ci)vj−        | p(v)σ( wijvj+ci)vj |
∂wij
v
|     | j=1 | j=1 |
| --- | --- | --- |
49/61
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| -------------- | --------------------- | --------- |

|       |     | h        |      | h ···   | h        |          |           |
| ----- | --- | -------- | ---- | ------- | -------- | -------- | --------- |
|       |     |          | 1    | 2       |          | n        |           |
|       |     | v        |      | v ···   | v        |          |           |
|       |     |          | 1    | 2       |          | m        |           |
| ∂L(θ) |     | m        |      |         |          | m        |           |
|       |     | (cid:88) |      |         | (cid:88) | (cid:88) |           |
|       | =   | σ(       | w v  | +c )v − | p(v)σ(   |          | w v +c )v |
| ∂w    |     |          | ij j | i j     |          |          | ij j i j  |
ij
|     |     | j=1 |     |     | v   | j=1 |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
(cid:88)
|     | =   | σ(w v+c |     | )v − p(v)σ(w |     | v+c | )v  |
| --- | --- | ------- | --- | ------------ | --- | --- | --- |
|     |     | i       | i   | j            |     | i   | i j |
v
(cid:88)
| ∇ L(θ) | =   | σ(Wv+c)vT |     | − p(v)σ(Wv+c)vT |     |     |     |
| ------ | --- | --------- | --- | --------------- | --- | --- | --- |
W
v
|     |     | σ(Wv+c)vT |     | −E [σ(Wv+c)vT] |     |     |     |
| --- | --- | --------- | --- | -------------- | --- | --- | --- |
|     | =   |           |     | v              |     |     |     |
50/61
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- |

∂L(θ)
| = E    | [v ]−E   | [v ] |     |
| ------ | -------- | ---- | --- |
| p(H|V) | j p(V,H) | j    |     |
∂b j
| (cid:88)  | (cid:88) |          |           |
| --------- | -------- | -------- | --------- |
| = p(h|v)v | −        | p(v,h)v  |           |
|           | j        |          | j         |
| h         | v,h      |          |           |
| (cid:88)  | (cid:88) | (cid:88) |           |
| = p(h|v)v | j −      | p(v)     | p(h|v)v j |
| h         | v        | h        |           |
| (cid:88)  | (cid:88) | (cid:88) |           |
| = v j     | p(h|v)−  | p(v)v j  | p(h|v)    |
v
| h   |     |     | h   |
| --- | --- | --- | --- |
(cid:88)
| = v − | p(v)v |     |     |
| ----- | ----- | --- | --- |
| j     | j     |     |     |
v
(cid:88)
| ∇ L(θ) = v− | p(v)v |     |     |
| ----------- | ----- | --- | --- |
b
v
v−E
| =   | [v] |     |     |
| --- | --- | --- | --- |
v
51/61
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |
| -------------- | --------------------- | --- | --------- |

∂L(θ)
|     | E        | ]−E  |        |        |     |     |
| --- | -------- | ---- | ------ | ------ | --- | --- |
|     | = p(H|V) | [h i | p(V,H) | [h i ] |     |     |
∂c
i
|     | (cid:88)  |     | (cid:88)  |          |         |     |
| --- | --------- | --- | --------- | -------- | ------- | --- |
|     | = p(h|v)h |     | − p(v,h)h |          |         |     |
|     |           | i   |           |          | i       |     |
|     | h         |     | v,h       |          |         |     |
|     | (cid:88)  |     | (cid:88)  | (cid:88) |         |     |
|     | = p(h|v)h |     | − p(v)    |          | p(h|v)h |     |
|     |           | i   |           |          |         | i   |
|     | h         |     | v         | h        |         |     |
(cid:88)
|     | = p(H i | = 1|v)− | p(v)p(H |     | i = 1|v) |     |
| --- | ------- | ------- | ------- | --- | -------- | --- |
v
|     | m        |        |     |          | m        |          |
| --- | -------- | ------ | --- | -------- | -------- | -------- |
|     | (cid:88) |        |     | (cid:88) | (cid:88) |          |
|     | = σ(     | w v +c | )−  | p(v)σ(   |          | w v +c ) |
|     |          | ij j   | i   |          |          | ij j i   |
|     | j=1      |        |     | v        | j=1      |          |
(cid:88)
| ∇ L(θ) | = σ(Wv+c)− |     | p(v)σ(Wv+c) |     |     |     |
| ------ | ---------- | --- | ----------- | --- | --- | --- |
c
v
|     | = σ(Wv+c)−E |     | [σ(Wv+c)] |     |     |     |
| --- | ----------- | --- | --------- | --- | --- | --- |
v
52/61
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture20 |
| --- | -------------- | --- | --------------------- | --- | --- | --------- |

|               |     |          |                 | Notice that | all the | 3 gradient  |
| ------------- | --- | -------- | --------------- | ----------- | ------- | ----------- |
|               |     | 1 k      |                 | expressions | have an | expectation |
| E [σ(Wv+c)vT] |     | (cid:88) | σ(Wv(k)+c)v(k)T |             |         |             |
≈
| v   |     | k   |     | term |     |     |
| --- | --- | --- | --- | ---- | --- | --- |
i=1
|     |     |     |     | These expectations |     | are intractable. |
| --- | --- | --- | --- | ------------------ | --- | ---------------- |
k
1 (cid:88)
|     | E [v] | ≈   | v(k) | Solution? | Estimation | with the help |
| --- | ----- | --- | ---- | --------- | ---------- | ------------- |
v
k
of sampling
i=1
|     |     | k   |     | Specifically, | we will | use Gibbs |
| --- | --- | --- | --- | ------------- | ------- | --------- |
1 (cid:88)
| E [σ(Wv+c)] |     | ≈   | σ(Wv(k)+c) |          |             |     |
| ----------- | --- | --- | ---------- | -------- | ----------- | --- |
| v           |     |     |            | Sampling | to estimate | the |
k
i=1
expectation
53/61
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- |

| Algorithm  | 0: RBM Training    |           | with Block  | Gibbs | Sampling |     |
| ---------- | ------------------ | --------- | ----------- | ----- | -------- | --- |
| Input: RBM | (V ,...,V          | ,H ,...,H | ), training | batch | D        |     |
|            | 1 m                | 1         | n           |       |          |     |
| Output:    | Learned Parameters | W,b,c     |             |       |          |     |
init W,b,c
| forall v ∈D               | do           |        |     |     |     |     |
| ------------------------- | ------------ | ------ | --- | --- | --- | --- |
| Randomly                  | initialize   | v(0)   |     |     |     |     |
| for t=0,...,k,k+1,...,k+r |              |        | do  |     |     |     |
| for                       | i=1,...,n do |        |     |     |     |     |
|                           | h(t)         | |v(t)) |     |     |     |     |
|                           | sample ∼     | p(h    |     |     |     |     |
|                           | i            | i      |     |     |     |     |
end
| for | j =1,...,m do |              |     |     |     |     |
| --- | ------------- | ------------ | --- | --- | --- | --- |
|     | sample v(t+1) | ∼ p(v |h(t)) |     |     |     |     |
|     | j             | j            |     |     |     |     |
end
end
|        | L(θ)[σ(Wv |                | +c)vT | 1(cid:80)k+r | σ(Wv(t)+c)v(t)T] |     |
| ------ | --------- | -------------- | ----- | ------------ | ---------------- | --- |
| W←W+η∇ | W         | d              |       | −            |                  |     |
|        |           |                | d     | r t=k+1      |                  |     |
| b←b+η∇ | L(θ)[v    | − 1(cid:80)k+r | v(t)] |              |                  |     |
|        | b         | d              |       |              |                  |     |
r t=k+1
| c←c+η∇ | L(θ)[σ(Wv | +c)− | 1(cid:80)k+r | σ(Wv(t)+c)] |     |     |
| ------ | --------- | ---- | ------------ | ----------- | --- | --- |
|        | c         | d    |              | t=k+1       |     |     |
r
end
54/61
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |
| --- | --- | -------------- | --- | --------------------- | --- | --------- |

| Module | 20.5 : Training | RBMs | using Contrastive |
| ------ | --------------- | ---- | ----------------- |
Divergence
55/61
MiteshM.Khapra CS7015(DeepLearning): Lecture20

In practice, Gibbs Sampling can be very inefficient because for every step of
stochastic gradient descent we need to run the Markov chain for many many
steps and then compute the expectation using the samples drawn from this
chain
We will now see a more efficient algorithm called k-contrastive divergence
| which is used | in practice | for training | RBMs |     |
| ------------- | ----------- | ------------ | ---- | --- |
56/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |
| --- | --- | -------------- | --------------------- | --------- |

|           |                     |        | Just to      | reiterate,   | our          | goal is   | to compute  |
| --------- | ------------------- | ------ | ------------ | ------------ | ------------ | --------- | ----------- |
|           |                     |        | the two      | expectations | efficiently  |           |             |
|           |                     |        | We already   | have         | a simplified |           | formula for |
|           |                     |        | the first    | expectation  |              |           |             |
|           |                     |        | Furthermore, | note         | that         | the first |             |
|           |                     |        | expectation  | depends      | only         | on        | the seen    |
| E         |                     |        | training     | example      | (v)          |           |             |
| p(H|V) [v | j h i ] = σ(w i v+c | i )v j |              |              |              |           |             |
|           | (cid:88)            |        | The second   | expectation  |              | depends   | on the      |
| E [v      | h ] = p(v)σ(w       | v+c )v |              |              |              |           |             |
| p(V,H)    | j i                 | i i j  | samples      | drawn        | from the     | Markov    | chain       |
v
|     |     |     | (v ,v ,...,v       | )           |           |              |             |
| --- | --- | --- | ------------------ | ----------- | --------- | ------------ | ----------- |
|     |     |     | 1 2                | n           |           |              |             |
|     |     |     | The first          | expectation |           | thus depends | on          |
|     |     |     | the empirical      | samples,    |           | whereas      | the         |
|     |     |     | second expectation |             | depends   | on           | the         |
|     |     |     | model samples      |             | (because  | the          | samples are |
|     |     |     | generated          | based       | on P(V|H) |              | and         |
|     |     |     | P(H|V)             | output      | by the    | model)       |             |
57/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture20 |     |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

...
|     | ∼p(h|v) |     | ∼p(v|h) |     |      | ∼p(h|v) |     |     | ∼p(v|h)  |
| --- | ------- | --- | ------- | --- | ---- | ------- | --- | --- | -------- |
|     | V       |     |         |     | V(1) |         |     |     | V(k) =V˜ |
s
| Contrastive |     | divergence |     | uses the | following | idea |     |     |     |
| ----------- | --- | ---------- | --- | -------- | --------- | ---- | --- | --- | --- |
Instead of starting the Markov Chain at a random point (V = v0), start from
| v(t) |       | v(t) |        |                  |     |          |     |     |     |
| ---- | ----- | ---- | ------ | ---------------- | --- | -------- | --- | --- | --- |
|      | where |      | is the | current training |     | instance |     |     |     |
Run Gibbs Sampling for k steps and denote the sample at the kth step by v˜
| Replace |     | the expectation |     | by a | point estimate |     |     |     |     |
| ------- | --- | --------------- | --- | ---- | -------------- | --- | --- | --- | --- |
(cid:88)
|     |     | E      | [v h | ] = p(v)σ(w |     | v+c )v | ≈ σ(w | v˜+c | )v˜ |
| --- | --- | ------ | ---- | ----------- | --- | ------ | ----- | ---- | --- |
|     |     | p(V,H) | j    | i           |     | i i    | j     | i    | i j |
v
58/61
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture20 |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

Over time as our model becomes better and better v˜ should start looking
| more and | more like | our | training | (empirical) |     | samples |     |
| -------- | --------- | --- | -------- | ----------- | --- | ------- | --- |
Once that starts happening what will happen to the gradient ?
| We consider | the derivative |     | w.r.t | w   | again |     |     |
| ----------- | -------------- | --- | ----- | --- | ----- | --- | --- |
ij
|     | ∂L(θ) |     |         |     |          |        | m        |
| --- | ----- | --- | ------- | --- | -------- | ------ | -------- |
|     |       |     |         |     | (cid:88) |        | (cid:88) |
|     |       | =   | σ(w v+c | )v  | −        | p(v)σ( | w v+c )v |
|     | ∂w    |     | i       | i   | j        |        | i i j    |
ij
|         |                |     |      |     |     | v   | j=1 |
| ------- | -------------- | --- | ---- | --- | --- | --- | --- |
| We have | two summations |     | here |     |     |     |     |
The first term can be thought of as summation over a single point v from
| training example |     |     |     |     |     |     |     |
| ---------------- | --- | --- | --- | --- | --- | --- | --- |
Similarly, for the second term, the summation over v˜ is being replaced by a
| point estimate | computed |     | from | the | model | sample |     |
| -------------- | -------- | --- | ---- | --- | ----- | ------ | --- |
As training progresses and v˜ (model sample) starts looking more and more
like our training (empirical) samples, the difference between the two terms will
be small and the parameters of the model will stabilize (convergence)
59/61
|     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture20 |
| --- | --- | -------------- | --- | --- | --------------------- | --- | --------- |

| Algorithm  | 0: k-step          | Contrastive | Divergence    |         |     |
| ---------- | ------------------ | ----------- | ------------- | ------- | --- |
| Input: RBM | (V 1 ,...,V m      | ,H 1 ,...,H | n ), training | batch D |     |
| Output:    | Learned Parameters | W,b,c       |               |         |     |
init W=b=c=0
| forall v ∈D   | do           |     |     |     |     |
| ------------- | ------------ | --- | --- | --- | --- |
| Initialize    | v(0) ←v      |     |     |     |     |
| for t=0,...,k | do           |     |     |     |     |
| for           | i=1,...,n do |     |     |     |     |
h(t)
|     | sample | ∼ p(h |v(t)) |     |     |     |
| --- | ------ | ------------ | --- | --- | --- |
|     | i      | i            |     |     |     |
end
| for | j =1,...,m | do      |     |     |     |
| --- | ---------- | ------- | --- | --- | --- |
|     | v(t+1)     | |h(t))  |     |     |     |
|     | sample     | ∼ p(v j |     |     |     |
j
end
end
| W←W+η∇ | L(θ)[σ(Wv |     | +c)vT −σ(Wv˜+c)v˜] |     |     |
| ------ | --------- | --- | ------------------ | --- | --- |
|        | W         |     | d d                |     |     |
L(θ)[v−v˜]
b←b+η∇
b
| c←c+η∇ | L(θ)[σ(Wv+c)−σ(Wv˜+c)] |     |     |     |     |
| ------ | ---------------------- | --- | --- | --- | --- |
c
end
60/61
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture20 |
| --- | --- | -------------- | --- | --------------------- | --------- |

...
|     | ∼ p(h|v) | ∼ p(v|h) |     | ∼ p(h|v) |     | ∼ p(v|h) |
| --- | -------- | -------- | --- | -------- | --- | -------- |
V V˜
|              | s   |                   | V(1) |     |     | V(k) = |
| ------------ | --- | ----------------- | ---- | --- | --- | ------ |
| In practice, | k = | 1 also works well |      |     |     |        |
The higher the value of k, the less biased the estimate of the gradient will be.
61/61
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture20 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |
