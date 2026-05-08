| CS7015 | (Deep Learning) |     | : Lecture | 7   |
| ------ | --------------- | --- | --------- | --- |
Autoencoders and relation to PCA, Regularization in autoencoders, Denoising
| autoencoders, | Sparse autoencoders, |           | Contractive | autoencoders |
| ------------- | -------------------- | --------- | ----------- | ------------ |
|               | Mitesh               | M. Khapra |             |              |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/55
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |
| --- | -------------- | --------------------- | --- | -------- |

| Module | 7.1: Introduction |     | to Autoencoders |     |
| ------ | ----------------- | --- | --------------- | --- |
2/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     |     | An autoencoder |        | is a special | type  | of  |
| --- | --- | --- | -------------- | ------ | ------------ | ----- | --- |
|     |     | xˆ  | feed forward   | neural | network      | which |     |
i
|     |     |     | does the | following |     |     |     |
| --- | --- | --- | -------- | --------- | --- | --- | --- |
W∗
|     |     |     | Encodes | its input | x into | a hidden |     |
| --- | --- | --- | ------- | --------- | ------ | -------- | --- |
i
|     |     | h   | representation | h         |       |      |      |
| --- | --- | --- | -------------- | --------- | ----- | ---- | ---- |
|     |     |     | Decodes        | the input | again | from | this |
W
|     |     |     | hidden representation |     |     |     |     |
| --- | --- | --- | --------------------- | --- | --- | --- | --- |
x
|     |     | i   | The model | is trained | to  | minimize | a   |
| --- | --- | --- | --------- | ---------- | --- | -------- | --- |
certainlossfunctionwhichwillensure
|     |     |     | thatxˆ i isclosetox |     | i (wewillseesome |     |     |
| --- | --- | --- | ------------------- | --- | ---------------- | --- | --- |
h = g(Wx +b)
| i   |     |     | such loss | functions | soon) |     |     |
| --- | --- | --- | --------- | --------- | ----- | --- | --- |
xˆ = f(W∗h+c)
i
3/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture7 |     |     |     |
| --- | -------------- | --- | --------------------- | -------- | --- | --- | --- |

|     |     |     |     | Let us           | consider |          | the case       | where       |
| --- | --- | --- | --- | ---------------- | -------- | -------- | -------------- | ----------- |
|     |     |     | xˆ  | dim(h)           | < dim(x  | )        |                |             |
|     |     |     | i   |                  |          | i        |                |             |
|     |     |     |     | If we are        | still    | able     | to reconstruct | xˆ          |
|     | W∗  |     |     |                  |          |          |                | i           |
|     |     |     |     | perfectly        | from     | h, then  | what           | does it     |
|     |     |     | h   | say about        | h?       |          |                |             |
|     |     |     |     | h is a loss-free |          | encoding | of             | x . It cap- |
|     | W   |     |     |                  |          |          |                | i           |
turesalltheimportantcharacteristics
|     |              |     | x   | of x   |        |         |      |      |
| --- | ------------ | --- | --- | ------ | ------ | ------- | ---- | ---- |
|     |              |     | i   | i      |        |         |      |      |
|     |              |     |     | Do you | see an | analogy | with | PCA? |
|     | h = g(Wx +b) |     |     |        |        |         |      |      |
i
xˆ = f(W∗h+c)
i
| An autoencoder | where dim(h) | <   | dim(x ) is |     |     |     |     |     |
| -------------- | ------------ | --- | ---------- | --- | --- | --- | --- | --- |
i
| called an under | complete autoencoder |     |     |     |     |     |     |     |
| --------------- | -------------------- | --- | --- | --- | --- | --- | --- | --- |
4/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

|     |     |     |     |     | Let us  | consider |                 | the case | when  |
| --- | --- | --- | --- | --- | ------- | -------- | --------------- | -------- | ----- |
|     |     |     | xˆ  |     | dim(h)  | ≥ dim(x  | )               |          |       |
|     |     |     | i   |     |         |          | i               |          |       |
|     |     |     |     |     | In such | a case   | the autoencoder |          | could |
W∗
|     |     |     |     |     | learn a | trivial | encoding |     | by simply |
| --- | --- | --- | --- | --- | ------- | ------- | -------- | --- | --------- |
h
|     |     |     |     |     | copying | x i into | h and | then | copying |
| --- | --- | --- | --- | --- | ------- | -------- | ----- | ---- | ------- |
h into xˆ
i
W
|     |          |     |     |     | Such an     | identity | encoding |            | is useless |
| --- | -------- | --- | --- | --- | ----------- | -------- | -------- | ---------- | ---------- |
|     |          |     | x i |     | in practice | as       | it does  | not really | tell us    |
|     |          |     |     |     | anything    | about    | the      | important  | char-      |
|     | h = g(Wx | +b) |     |     |             |          |          |            |            |
|     |          | i   |     |     | acteristics | of       | the data |            |            |
f(W∗h+c)
xˆ =
i
| An autoencoder | where | dim(h) | ≥ dim(x | ) is |     |     |     |     |     |
| -------------- | ----- | ------ | ------- | ---- | --- | --- | --- | --- | --- |
i
| called an over | complete | autoencoder |     |     |     |     |     |     |     |
| -------------- | -------- | ----------- | --- | --- | --- | --- | --- | --- | --- |
5/55
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

The Road Ahead
Choice of f(x ) and g(x )
i i
Choice of loss function
6/55
MiteshM.Khapra CS7015(DeepLearning): Lecture7

The Road Ahead
Choice of f(x ) and g(x )
i i
Choice of loss function
7/55
MiteshM.Khapra CS7015(DeepLearning): Lecture7

|     |     |     | Suppose | all our inputs | are binary |
| --- | --- | --- | ------- | -------------- | ---------- |
=f(W∗h+c)
|     |     | xˆ i | (each x | ∈ {0,1}) |     |
| --- | --- | ---- | ------- | -------- | --- |
ij
|     |     |     | Which | of the following | functions |
| --- | --- | --- | ----- | ---------------- | --------- |
W∗
|     |     |            | would be | most apt | for the decoder? |
| --- | --- | ---------- | -------- | -------- | ---------------- |
|     |     | h=g(Wx +b) |          |          |                  |
i
tanh(W∗h+c)
xˆ =
|     | W   |     |     | i   |     |
| --- | --- | --- | --- | --- | --- |
xˆ = W∗h+c
i
x
|     |     | i   | xˆ  | = logistic(W∗h+c) |     |
| --- | --- | --- | --- | ----------------- | --- |
i
0 1 1 0 1(binary inputs) Logistic as it naturally restricts all
|                |           |             | outputs | to be between | 0 and 1 |
| -------------- | --------- | ----------- | ------- | ------------- | ------- |
| g is typically | chosen as | the sigmoid |         |               |         |
function
8/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

|     |     |     |     | Suppose |     | all our inputs | are real (each |
| --- | --- | --- | --- | ------- | --- | -------------- | -------------- |
=f(W∗h+c)
|     |     |     | xˆ i | x   | ∈ R) |     |     |
| --- | --- | --- | ---- | --- | ---- | --- | --- |
ij
|     |     |     |     | Which |     | of the following | functions |
| --- | --- | --- | --- | ----- | --- | ---------------- | --------- |
W∗
|     |     |     |            | would | be  | most apt | for the decoder? |
| --- | --- | --- | ---------- | ----- | --- | -------- | ---------------- |
|     |     |     | h=g(Wx +b) |       |     |          |                  |
i
xˆ = tanh(W∗h+c)
|     | W   |     |     |     |     | i   |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
xˆ = W∗h+c
i
x
|     |     |     | i   |     |     | logistic(W∗h+c) |     |
| --- | --- | --- | --- | --- | --- | --------------- | --- |
xˆ i =
| 0.25     | 0.5 1.25     | 3.5     | 4.5    | What | will  | logistic and | tanh do?        |
| -------- | ------------ | ------- | ------ | ---- | ----- | ------------ | --------------- |
| (real    | valued       | inputs) |        | They | will  | restrict     | the reconstruc- |
|          |              |         |        | ted  | xˆ to | lie between  | [0,1] or [-1,1] |
| Again, g | is typically | chosen  | as the |      | i     |              |                 |
Rn
|         |          |     |     | whereas |     | we want xˆ | i ∈ |
| ------- | -------- | --- | --- | ------- | --- | ---------- | --- |
| sigmoid | function |     |     |         |     |            |     |
9/55
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- |

The Road Ahead
Choice of f(x ) and g(x )
i i
Choice of loss function
10/55
MiteshM.Khapra CS7015(DeepLearning): Lecture7

|     |     |     |     |     | Consider | the case | when | the inputs | are real |
| --- | --- | --- | --- | --- | -------- | -------- | ---- | ---------- | -------- |
valued
xˆ i
Theobjectiveoftheautoencoderistorecon-
W∗
|     |     |     |     |     | struct xˆ i | to be as      | close to | x i as    | possible  |
| --- | --- | --- | --- | --- | ----------- | ------------- | -------- | --------- | --------- |
|     |     |     | h   |     | This can    | be formalized |          | using the | following |
|     |     |     |     |     | objective   | function:     |          |           |           |
| W   |     |     |     |     |             |               | m n      |           |           |
1 (cid:88)(cid:88)
|     |     |     |     |     |          | min |     | (xˆ −x | )2  |
| --- | --- | --- | --- | --- | -------- | --- | --- | ------ | --- |
|     |     |     | x   |     | W,W∗,c,b | m   |     | ij     | ij  |
i
i=1j=1
m
1 (cid:88)
| h=g(Wx | +b) |     |     |     | i.e., | min | (xˆ | −x)T(xˆ | −x) |
| ------ | --- | --- | --- | --- | ----- | --- | --- | ------- | --- |
|        | i   |     |     |     |       | m   |     | i i     | i i |
W,W∗,c,b
| xˆ =f(W∗h+c) |     |     |     |     |     |     | i=1 |     |     |
| ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
i
|     |     |     |     |     | We can then | train       | the autoencoder |     | just like   |
| --- | --- | --- | --- | --- | ----------- | ----------- | --------------- | --- | ----------- |
|     |     |     |     |     | a regular   | feedforward | network         |     | using back- |
propagation
|     |     |     |     |     | Allweneedisaformulafor |          |     | ∂L(θ) | and ∂L(θ) |
| --- | --- | --- | --- | --- | ---------------------- | -------- | --- | ----- | --------- |
|     |     |     |     |     |                        |          |     | ∂W∗   | ∂W        |
|     |     |     |     |     | which we               | will see | now |       |           |
11/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

| L(θ)=(xˆ |        | )T(xˆ    | ∂L(θ) ∂L(θ) | ∂h ∂a |     |
| -------- | ------ | -------- | ----------- | ----- | --- |
|          | i −x i | i −x i ) |             | 2 2   |     |
=
|       |     |     | ∂W∗ ∂h | ∂a ∂W∗ |     |
| ----- | --- | --- | ------ | ------ | --- |
| h =xˆ |     |     |        | 2 2    |     |
2 i
a
| 2   |     |     | ∂L(θ) ∂L(θ) | ∂h ∂a | ∂h ∂a |
| --- | --- | --- | ----------- | ----- | ----- |
|     |     |     |             | 2 2   | 1 1   |
=
|     |     | W∗  | ∂W ∂h | ∂a ∂h | ∂a ∂W |
| --- | --- | --- | ----- | ----- | ----- |
|     |     |     |       | 2 2 1 | 1     |
h
1
| a   |     |     | Wehavealreadyseenhowtocalculatetheexpres- |     |     |
| --- | --- | --- | ----------------------------------------- | --- | --- |
1
|     |     |     | sion in the boxes | when we learnt | backpropagation |
| --- | --- | --- | ----------------- | -------------- | --------------- |
W
|     |     |     | ∂L(θ) | ∂L(θ) |     |
| --- | --- | --- | ----- | ----- | --- |
h =x
| 0 i |     |     |     | =   |     |
| --- | --- | --- | --- | --- | --- |
|     |     |     | ∂h  | ∂xˆ |     |
2 i
|     |     |     |     | =∇ {(xˆ −x | )T(xˆ −x )} |
| --- | --- | --- | --- | ---------- | ----------- |
|     |     |     |     | xˆi i      | i i i       |
=2(xˆ −x )
| Note that | the loss | function is |     | i i |     |
| --------- | -------- | ----------- | --- | --- | --- |
| shown for | only one | training    |     |     |     |
example.
12/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

|     |     |              | Consider | the case when | the inputs are |     |
| --- | --- | ------------ | -------- | ------------- | -------------- | --- |
|     |     | xˆ =f(W∗h+c) | binary   |               |                |     |
i
|     | W∗  |            | We use             | a sigmoid decoder | which will     |     |
| --- | --- | ---------- | ------------------ | ----------------- | -------------- | --- |
|     |     |            | produce            | outputs between   | 0 and 1, and   |     |
|     |     | h=g(Wx +b) | can be interpreted | as                | probabilities. |     |
i
|     |     |     | For a single | n-dimensional | ith input we |     |
| --- | --- | --- | ------------ | ------------- | ------------ | --- |
W
|     |     |     | can use | the following | loss function |     |
| --- | --- | --- | ------- | ------------- | ------------- | --- |
|     |     | x i |         | n             |               |     |
(cid:88)
|     |     |     | min{− | (x logxˆ +(1−x | )log(1−xˆ | ))} |
| --- | --- | --- | ----- | -------------- | --------- | --- |
|     |     |     |       | ij ij          | ij        | ij  |
j=1
| 0   | 1 1 0 | 1(binary inputs) |     |     |     |     |
| --- | ----- | ---------------- | --- | --- | --- | --- |
∂L(θ)
|            |                     |      | Again we | need is a formula   | for | and |
| ---------- | ------------------- | ---- | -------- | ------------------- | --- | --- |
| What value | of xˆ will minimize | this |          |                     | ∂W∗ |     |
|            | ij                  |      | ∂L(θ) to | use backpropagation |     |     |
| function?  |                     |      | ∂W       |                     |     |     |
| If         | x =1 ?              |      |          |                     |     |     |
ij
| If  | x =0 ? |     |     |     |     |     |
| --- | ------ | --- | --- | --- | --- | --- |
ij
| Indeed    | the above function | will be        |                       |          |     |       |
| --------- | ------------------ | -------------- | --------------------- | -------- | --- | ----- |
| minimized | when xˆ =x         | !              |                       |          |     |       |
|           | ij                 | ij             |                       |          |     | 13/55 |
|           |                    | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |       |

|     |     |     |     |     |     | ∂L(θ) |     | ∂L(θ)∂h |     |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | ------- | --- | --- |
∂a
| L(θ)=− |     | (cid:80) n  |          |              |       |     | =   |     | 2   | 2   |
| ------ | --- | ----------- | -------- | ------------ | ----- | --- | --- | --- | --- | --- |
|        |     | (x ij logxˆ | ij +(1−x | ij )log(1−xˆ | ij )) |     |     |     |     |     |
|        |     |             |          |              |       | ∂W∗ |     | ∂h  | ∂a  | ∂W∗ |
|        |     | j=1         |          |              |       |     |     | 2   | 2   |     |
h = xˆ
|     | 2   | i   |     |     |     | ∂L(θ) |     | ∂L(θ)∂h |      |                |
| --- | --- | --- | --- | --- | --- | ----- | --- | ------- | ---- | -------------- |
|     | a   |     |     |     |     |       |     |         | 2    | ∂a 2 ∂h 1 ∂a 1 |
|     | 2   |     |     |     |     |       | =   |         |      |                |
|     |     |     |     |     |     | ∂W    |     | ∂h 2    | ∂a 2 | ∂h 1 ∂a 1 ∂W   |
W∗
|     |     |     |     |     |     | We  | have | already | seen how | to  |
| --- | --- | --- | --- | --- | --- | --- | ---- | ------- | -------- | --- |
h
1
|     |     | a   |     |     |     | calculate |     | the expressions |     | in the |
| --- | --- | --- | --- | --- | --- | --------- | --- | --------------- | --- | ------ |
1
|     |     |     |     |     |     | square | boxes | when | we  | learnt BP |
| --- | --- | --- | --- | --- | --- | ------ | ----- | ---- | --- | --------- |
W
| h   | = x |     |     |     |     | The      | first | two terms | on  | RHS can be |
| --- | --- | --- | --- | --- | --- | -------- | ----- | --------- | --- | ---------- |
|     | 0   | i   |     |     |     |          |       |           |     |            |
|     |     |     |     |     |     | computed |       | as:       |     |            |
∂L(θ)
|     |     |     |         |     |     |     |     | x ij | 1−x  | ij  |
| --- | --- | --- | ------- | --- | --- | --- | --- | ---- | ---- | --- |
|     |     |     |         |     |     |     | =   | − +  |      |     |
|     |     |     | ∂L(θ) |     |     | ∂h  |     | xˆ   | 1−xˆ |     |
|     |     |     |         |     |     |     | 2j  | ij   |      | ij  |
∂ h2
|     |     |       |     | 1     |     | ∂h  |     |             |     |     |
| --- | --- | ----- | --- | ----- | --- | --- | --- | ----------- | --- | --- |
|     |     |       |  L | )    |     |     | 2j  |             |     |     |
|     |     | ∂L(θ) |  ∂ | (θ   |     |     | =   | σ(a )(1−σ(a |     | ))  |
|     |     |       | ∂h  |       |     | ∂a  |     | 2j          |     | 2j  |
|     |     |       | =  | 22   |     |     | 2j  |             |     |     |
|     |     | ∂h    |    | . .  |     |     |     |             |     |     |
|     |     | 2     |    | .    |     |     |     |             |     |     |
|     |     |       |    |      |     |     |     |             |     |     |
∂L(θ)
∂h2n
14/55
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

| Module | 7.2: Link | between | PCA and | Autoencoders |
| ------ | --------- | ------- | ------- | ------------ |
15/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

Wewillnowseethattheencoderpart
xˆ
| i   | y   | PCA | of  | an autoencoder |        | is         | equivalent | to  |
| --- | --- | --- | --- | -------------- | ------ | ---------- | ---------- | --- |
|     |     |     | PCA | if we          |        |            |            |     |
|     |     |     |     | use a          | linear | encoder    |            |     |
|     |     |     |     | use a          | linear | decoder    |            |     |
| h ≡ | u 1 | u 2 |     |                |        |            |            |     |
|     |     |     |     | use squared    |        | error loss | function   |     |
|     |     |     |     | normalize      | the    | inputs     | to         |     |
x
| x   | PTXTXP |     |     |     |     | (cid:32) | m          | (cid:33) |
| --- | ------ | --- | --- | --- | --- | -------- | ---------- | -------- |
| i   |        | = D |     |     | 1   |          | 1 (cid:88) |          |
|     |        |     |     | xˆ  | = √ | x −      |            | x        |
|     |        |     |     | ij  |     | ij       |            | kj       |
|     |        |     |     |     | m   |          | m          |          |
k=1
16/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     |     |     | First let | us consider |     | the implication |     |
| --- | --- | --- | --------- | ----------- | --- | --------------- | --- |
xˆ
| i   | y   | PCA | of normalizing |     | the inputs | to         |          |
| --- | --- | --- | -------------- | --- | ---------- | ---------- | -------- |
|     |     |     |                |     | (cid:32)   | m          | (cid:33) |
|     |     |     |                | 1   |            | 1 (cid:88) |          |
√
|     |     |     | xˆ ij | =   | x ij − |     | x kj |
| --- | --- | --- | ----- | --- | ------ | --- | ---- |
| h ≡ | u 1 | u 2 |       | m   |        | m   |      |
k=1
|     |     |     | The operation |     | in the | bracket | ensures |
| --- | --- | --- | ------------- | --- | ------ | ------- | ------- |
x
|     |        |     | that the       | data | now has | 0 mean          | along |
| --- | ------ | --- | -------------- | ---- | ------- | --------------- | ----- |
| x   | PTXTXP |     |                |      |         |                 |       |
| i   |        | = D |                |      |         |                 |       |
|     |        |     | each dimension |      | j (we   | are subtracting |       |
the mean)
X(cid:48)
|     |     |     | Let        | be this | zero      | mean         | data mat-  |
| --- | --- | --- | ---------- | ------- | --------- | ------------ | ---------- |
|     |     |     | rix then   | what    | the above |              | normaliza- |
|     |     |     | tion gives | us is   | X =       | √1 X(cid:48) |            |
m
|     |     |     | Now (X)TX |     | = 1(X(cid:48))TX(cid:48) |     | is the co- |
| --- | --- | --- | --------- | --- | ------------------------ | --- | ---------- |
m
|     |     |     | variance    | matrix | (recall | that      | covari- |
| --- | --- | --- | ----------- | ------ | ------- | --------- | ------- |
|     |     |     | ance matrix | plays  | an      | important | role    |
in PCA)
17/55
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |
| --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     |     |     | First | we will show that | if we use lin- |
| --- | --- | --- | ----- | ----------------- | -------------- |
xˆ
| i   | y   | PCA | ear decoder | and a squared    | error loss       |
| --- | --- | --- | ----------- | ---------------- | ---------------- |
|     |     |     | function    | then             |                  |
|     |     |     | The         | optimal solution | to the following |
| h ≡ | u 1 | u 2 |             |                  |                  |
|     |     |     | objective   | function         |                  |
|     |     |     | x           | m n              |                  |
1 (cid:88)(cid:88)
(x −xˆ )2
| x   | PTXTXP |     |     |     | ij ij |
| --- | ------ | --- | --- | --- | ----- |
| i   |        | = D |     | m   |       |
i=1 j=1
|     |     |     | is obtained | when we | use a linear en- |
| --- | --- | --- | ----------- | ------- | ---------------- |
coder.
18/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture7 |     |
| --- | -------------- | --- | --------------------- | -------- | --- |

m n
(cid:88)(cid:88)
|     |     | min |     | (x  | −xˆ )2 |     | (1) |
| --- | --- | --- | --- | --- | ------ | --- | --- |
|     |     |     |     | ij  | ij     |     |     |
θ
i=1j=1
| This is equivalent | to  |     |     |     |     |     |     |
| ------------------ | --- | --- | --- | --- | --- | --- | --- |
(cid:118)
|     |                             |     |     |     |                       | (cid:117) m n              |     |
| --- | --------------------------- | --- | --- | --- | --------------------- | -------------------------- | --- |
|     |                             |     |     |     |                       | (cid:117) (cid:88)(cid:88) |     |
|     | min((cid:107)X−HW∗(cid:107) |     | )2  |     | (cid:107)A(cid:107) = | a2                         |     |
|     |                             |     | F   |     | F                     | (cid:116) ij               |     |
W∗H
i=1j=1
(just writing the expression (1) in matrix form and using the definition of ||A|| F ) (we
| are ignoring | the biases) |     |     |     |     |     |     |
| ------------ | ----------- | --- | --- | --- | --- | --- | --- |
From SVD we know that optimal solution to the above problem is given by
|             |           |              | HW∗ =U   |      | Σ VT     |     |     |
| ----------- | --------- | ------------ | -------- | ---- | -------- | --- | --- |
|             |           |              |          | .,≤k | k,k .,≤k |     |     |
| By matching | variables | one possible | solution | is   |          |     |     |
|             |           |              | H        | =U   | Σ        |     |     |
|             |           |              |          | .,≤k | k,k      |     |     |
W∗ =VT
.,≤k
19/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

We will now show that H is a linear encoding and find an expression for the encoder
weights W
| H =U           | Σ   |     |     |                  |     |              |     |     |
| -------------- | --- | --- | --- | ---------------- | --- | ------------ | --- | --- |
| .,≤k           | k,k |     |     |                  |     |              |     |     |
| =(XXT)(XXT)−1U |     | Σ   |     | (pre-multiplying |     | (XXT)(XXT)−1 |     | =I) |
.,≤K k,k
| =(XVΣTUT)(UΣVTVΣTUT)−1U |     |     | Σ   |     |     | (using | X =UΣVT) |     |
| ----------------------- | --- | --- | --- | --- | --- | ------ | -------- | --- |
.,≤k k,k
| =XVΣTUT(UΣΣTUT)−1U |     |            |     |     |          |             | (VTV |     |
| ------------------ | --- | ---------- | --- | --- | -------- | ----------- | ---- | --- |
|                    |     | .,≤k Σ k,k |     |     |          |             |      | =I) |
| =XVΣTUTU(ΣΣT)−1UTU |     | Σ          |     |     | ((ABC)−1 | =C−1B−1A−1) |      |     |
.,≤k k,k
| =XVΣT(ΣΣT)−1UTU |     | Σ   |     |     |     |     | (UTU | =I) |
| --------------- | --- | --- | --- | --- | --- | --- | ---- | --- |
.,≤k k,k
| =XVΣTΣT−1 | Σ−1UTU |     |     |     |     | ((AB)−1 | =B−1A−1) |     |
| --------- | ------ | --- | --- | --- | --- | ------- | -------- | --- |
Σ
.,≤k k,k
| =XVΣ−1I | Σ        |     |     |     |     | (UTU  | =I    | )    |
| ------- | -------- | --- | --- | --- | --- | ----- | ----- | ---- |
|         | .,≤k k,k |     |     |     |     |       | .,≤k  | .,≤k |
| =XVI    |          |     |     |     |     | (Σ−1I | =Σ−1) |      |
|         | .,≤k     |     |     |     |     |       | .,≤k  | k,k  |
H =XV
.,≤k
| Thus H | is a linear transformation | of X | and W | =V  |     |     |     |     |
| ------ | -------------------------- | ---- | ----- | --- | --- | --- | --- | --- |
.,≤k
20/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

| We  | have encoder | W   | = V |     |     |     |     |
| --- | ------------ | --- | --- | --- | --- | --- | --- |
.,≤k
XTX
| From | SVD, | we know | that | V is the | matrix | of eigen | vectors of |
| ---- | ---- | ------- | ---- | -------- | ------ | -------- | ---------- |
From PCA, we know that P is the matrix of the eigen vectors of the covariance
matrix
| We  | saw earlier | that, | if entries | of X     | are normalized |          | by       |
| --- | ----------- | ----- | ---------- | -------- | -------------- | -------- | -------- |
|     |             |       |            | (cid:32) |                | m        | (cid:33) |
|     |             |       |            | 1        | 1              | (cid:88) |          |
|     |             |       | xˆ ij =    | √ x      | ij −           | x        |          |
|     |             |       |            | m        | m              | kj       |          |
k=1
| then XTX | is indeed | the | covariance | matrix |     |     |     |
| -------- | --------- | --- | ---------- | ------ | --- | --- | --- |
Thus, the encoder matrix for linear autoencoder(W) and the projection
| matrix(P) | for | PCA | could | indeed be | the same. | Hence | proved |
| --------- | --- | --- | ----- | --------- | --------- | ----- | ------ |
21/55
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- |

Remember
The encoder of a linear autoencoder is equivalent to PCA if we
| use a linear  | encoder    |               |          |            |     |
| ------------- | ---------- | ------------- | -------- | ---------- | --- |
| use a linear  | decoder    |               |          |            |     |
| use a squared | error      | loss function |          |            |     |
| and normalize | the inputs | to            |          |            |     |
|               |            |               | (cid:32) | m (cid:33) |     |
|               |            | 1             | 1        | (cid:88)   |     |
|               |            | xˆ = √        | x −      | x          |     |
|               |            | ij            | ij       | kj         |     |
|               |            |               | m m      |            |     |
k=1
22/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |
| --- | --- | -------------- | --------------------- | --- | -------- |

| Module | 7.3: Regularization |     | in autoencoders |     |
| ------ | ------------------- | --- | --------------- | --- |
(Motivation)
23/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     | While    | poor generalization | could hap- |
| --- | --- | -------- | ------------------- | ---------- |
| xˆ  |     | pen even | in undercomplete    | autoen-    |
i
codersitisanevenmoreseriousprob-
W∗
|     |     | lem for    | overcomplete        | auto encoders |
| --- | --- | ---------- | ------------------- | ------------- |
|     | h   | Here,      | (as stated earlier) | the model     |
|     |     | can simply | learn to copy       | x to h and    |
i
W
|     |     | then h | to xˆ |     |
| --- | --- | ------ | ----- | --- |
i
| x   |     | Toavoidpoorgeneralization,weneed |     |     |
| --- | --- | -------------------------------- | --- | --- |
i
|     |     | to introduce | regularization |     |
| --- | --- | ------------ | -------------- | --- |
24/55
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |     |
| -------------- | --------------------- | --- | -------- | --- |

|     |     |     | The simplest | solution |     | is to add | a L - |
| --- | --- | --- | ------------ | -------- | --- | --------- | ----- |
2
| xˆ  |     |     | regularization |     | term | to the objective |     |
| --- | --- | --- | -------------- | --- | ---- | ---------------- | --- |
i
function
W∗
m n
|     |     |     |     | 1 (cid:88)(cid:88) |     |     |     |
| --- | --- | --- | --- | ------------------ | --- | --- | --- |
)2+λ(cid:107)θ(cid:107)2
|     | h   |     | min        |     | (xˆ | ij −x ij |     |
| --- | --- | --- | ---------- | --- | --- | -------- | --- |
|     |     |     | θ,w,w∗,b,c | m   |     |          |     |
i=1 j=1
W
|     |     |     | This is | very easy | to  | implement | and |
| --- | --- | --- | ------- | --------- | --- | --------- | --- |
x
| i   |     |     | just adds | a term | λW  | to the gradient |     |
| --- | --- | --- | --------- | ------ | --- | --------------- | --- |
∂L(θ)
|     |     |     | (and | similarly |     | for other | para- |
| --- | --- | --- | ---- | --------- | --- | --------- | ----- |
∂W
meters)
25/55
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |     |
| -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     |     | Another     | trick is to tie | the weights of |
| --- | --- | ----------- | --------------- | -------------- |
| xˆ  |     | the encoder | and decoder     | i.e., W∗ =     |
i
WT
W∗
|     |     | This effectively | reduces  | the capacity  |
| --- | --- | ---------------- | -------- | ------------- |
|     | h   | of Autoencoder   | and acts | as a regular- |
izer
W
x
i
26/55
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |     |
| -------------- | --------------------- | --- | -------- | --- |

| Module | 7.4: Denoising | Autoencoders |     |     |
| ------ | -------------- | ------------ | --- | --- |
27/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

|     | A denoising | encoder    | simply corrupts |     |
| --- | ----------- | ---------- | --------------- | --- |
|     | the input   | data using | a probabilistic |     |
xˆ
i
|     | process  | (P(x (cid:101)ij |x ij )) | before feeding     | it  |
| --- | -------- | ------------------------- | ------------------ | --- |
|     | to the   | network                   |                    |     |
|     | A simple | P(x (cid:101)ij |x ij     | ) used in practice |     |
h
|     | is the following |             |       |     |
| --- | ---------------- | ----------- | ----- | --- |
|     |                  | P(x = 0|x   | ) = q |     |
|     |                  | (cid:101)ij | ij    |     |
x˜
i
|     |     | P(x (cid:101)ij = x ij |x | ij ) = 1−q |     |
| --- | --- | ------------------------- | ---------- | --- |
P(x |x )
(cid:101)ij ij
|     | Inotherwords, | withprobabilityq |     | the |
| --- | ------------- | ---------------- | --- | --- |
x
| i   | inputisflippedto0andwithprobab- |                |       |     |
| --- | ------------------------------- | -------------- | ----- | --- |
|     | ility (1−q)                     | it is retained | as it | is  |
28/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

|     |     |     |     | How does   | this help | ?   |           |     |
| --- | --- | --- | --- | ---------- | --------- | --- | --------- | --- |
|     |     |     | xˆ  | This helps | because   | the | objective | is  |
i
|     |     |     |     | still to   | reconstruct | the | original | (un- |
| --- | --- | --- | --- | ---------- | ----------- | --- | -------- | ---- |
|     |     |     |     | corrupted) | x           |     |          |      |
i
m n
|     |     |     | h   |        | 1 (cid:88)(cid:88) |     |       |     |
| --- | --- | --- | --- | ------ | ------------------ | --- | ----- | --- |
|     |     |     |     | argmin |                    | (xˆ | −x )2 |     |
|     |     |     |     |        |                    | ij  | ij    |     |
θ m
i=1 j=1
Itnolongermakessenseforthemodel
x˜
i
|     |     |     |     | to copy | the corrupted | x   | into h(x   | )          |
| --- | --- | --- | --- | ------- | ------------- | --- | ---------- | ---------- |
|     |     |     |     |         |               |     | (cid:101)i | (cid:101)i |
P(x |x )
|     |     | (cid:101)ij | ij  | and then  | into xˆ i | (the objective |          | func- |
| --- | --- | ----------- | --- | --------- | --------- | -------------- | -------- | ----- |
|     |     |             |     | tion will | not be    | minimized      | by doing |       |
x
i
so)
For example, it will have to learn to Instead the model will now have to
reconstruct a corrupted x correctly by capturethecharacteristicsofthedata
ij
| relying  | on its interactions |     | with other | correctly. |     |     |     |     |
| -------- | ------------------- | --- | ---------- | ---------- | --- | --- | --- | --- |
| elements | of x                |     |            |            |     |     |     |     |
i
29/55
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | -------- | --- | --- | --- |

We will now see a practical application in which AEs are used and then compare
| Denoising | Autoencoders | with regular | autoencoders |     |
| --------- | ------------ | ------------ | ------------ | --- |
30/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

|                    |       |     | 0 1 | 2 3 | 9   |
| ------------------ | ----- | --- | --- | --- | --- |
| Task: Hand-written | digit |     |     |     |     |
recognition
|     |     |     | |x  | i | = 784 = 28×28 |     |
| --- | --- | --- | --- | ----------------- | --- |
28*28
|               |      | Figure:   | Basic approach(we | use raw data | as input |
| ------------- | ---- | --------- | ----------------- | ------------ | -------- |
| Figure: MNIST | Data | features) |                   |              |          |
31/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture7 |     |
| --- | -------------- | --- | --------------------- | -------- | --- |

R784
xˆ i ∈
Task: Hand-written digit
recognition
h ∈ Rd
|     | |x | = 784 = | 28×28 |
| --- | ------------ | ----- |
i
Figure: MNIST Data
| Figure:         | AE approach (first | learn important |
| --------------- | ------------------ | --------------- |
| characteristics | of data)           |                 |
32/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| -------------- | --------------------- | -------- |

Task: Hand-written digit
|     | 0 1 | 2 3 | 9   |
| --- | --- | --- | --- |
recognition
Rd
h ∈
|     | |x i | | = 784 = 28×28 |     |
| --- | ---- | --------------- | --- |
Figure: MNIST Data
| Figure: | AE approach    | (and then train | a classifier on |
| ------- | -------------- | --------------- | --------------- |
| top     | of this hidden | representation) |                 |
33/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |
| -------------- | --------------------- | -------- | --- |

We will now see a way of visualizing AEs and use this visualization to compare
different AEs
34/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| -------------- | --------------------- | -------- |

|     |     | We  | can | think of | each | neuron | as a filter which |
| --- | --- | --- | --- | -------- | ---- | ------ | ----------------- |
xˆ
|     | i   | willfire(orgetmaximally)activatedforacer- |       |               |     |     |     |
| --- | --- | ----------------------------------------- | ----- | ------------- | --- | --- | --- |
|     |     | tain                                      | input | configuration |     | x i |     |
For example,
h
|     |     |        | h   | = σ(WTx                         | )   | [ignoring | bias b] |
| --- | --- | ------ | --- | ------------------------------- | --- | --------- | ------- |
|     |     |        |     | 1                               | 1 i |           |         |
|     |     | WhereW |     | isthetrainedvectorofweightscon- |     |           |         |
|     | x   |        |     | 1                               |     |           |         |
i
|      |     | necting |        | the input | to the     | first | hidden neuron   |
| ---- | --- | ------- | ------ | --------- | ---------- | ----- | --------------- |
|      |     | What    | values | of        | x will     | cause | h to be max-    |
|      |     |         |        |           | i          |       | 1               |
|      |     | imum    | (or    | maximally | activated) |       |                 |
| {WTx |     | Suppose |        | we assume | that       | our   | inputs are nor- |
max i }
xi 1
|          |     | malized |     | so that (cid:107)x | (cid:107) = | 1   |     |
| -------- | --- | ------- | --- | ------------------ | ----------- | --- | --- |
| ||2 =xTx |     |         |     |                    | i           |     |     |
s.t. ||x i i =1
i
W
1
Solution: x i = (cid:112)
WTW
| 1   | 1   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
35/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture7 |     |
| --- | -------------- | --- | --------------------- | --- | --- | -------- | --- |

|     |     |     |     | Thus the | inputs |     |     |     |     |     |
| --- | --- | --- | --- | -------- | ------ | --- | --- | --- | --- | --- |
xˆ
i
|     |     |     |     |                   | W         |       | W         |        | W         |        |
| --- | --- | --- | --- | ----------------- | --------- | ----- | --------- | ------ | --------- | ------ |
|     |     |     |     | x =               |           | 1     | ,         | 2 ,... |           | n      |
|     |     |     |     | i                 | (cid:113) |       | (cid:113) |        | (cid:112) |        |
|     |     |     |     |                   |           |       |           |        | W         | TW     |
|     |     |     | h   |                   | W         | TW    | W TW      |        |           | n n    |
|     |     |     |     |                   |           | 1 1   | 2         | 2      |           |        |
|     |     |     |     | will respectively |           | cause | hidden    |        | neurons   | 1 to n |
|     |     |     | x   | to maximally      |           | fire  |           |        |           |        |
i
|     |     |     |     | Let us | plot these |     | images | (x ’s) | which | maxim- |
| --- | --- | --- | --- | ------ | ---------- | --- | ------ | ------ | ----- | ------ |
i
|          |          |      |     | ally activate   |                                | the first | k neurons |              | of the    | hidden  |
| -------- | -------- | ---- | --- | --------------- | ------------------------------ | --------- | --------- | ------------ | --------- | ------- |
|          |          |      |     | representations |                                | learned   |           | by a vanilla |           | autoen- |
|          | {WTx     |      |     | coder and       | different                      |           | denoising | autoencoders |           |         |
| max      |          | i }  |     |                 |                                |           |           |              |           |         |
|          | xi       | 1    |     |                 |                                |           |           |              |           |         |
|          |          |      |     | Thesex          | ’sarecomputedbytheaboveformula |           |           |              |           |         |
|          | ||2 =xTx |      |     |                 | i                              |           |           |              |           |         |
| s.t. ||x | i        | i =1 |     |                 |                                |           |           |              |           |         |
|          |          | i    |     | using the       | weights                        |           | (W ,W     | ...W         | ) learned | by      |
|          |          | W    |     |                 |                                |           | 1         | 2            | k         |         |
1
| Solution: | x i = | (cid:112) |     | the respective |     | autoencoders |     |     |     |     |
| --------- | ----- | --------- | --- | -------------- | --- | ------------ | --- | --- | --- | --- |
WTW
|     |     | 1   | 1   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
36/55
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

Figure: Vanilla AE Figure: 25% Denoising Figure: 50% Denoising
| (No noise)  |         | AE (q=0.25)    |            |          | AE (q=0.5) |
| ----------- | ------- | -------------- | ---------- | -------- | ---------- |
| The vanilla | AE does | not learn many | meaningful | patterns |            |
The hidden neurons of the denoising AEs seem to act like pen-stroke detectors
(for example, in the highlighted neuron the black region is a stroke that you
| would expect | in a ’0’ | or a ’2’ or a | ’3’ or a ’8’ | or a ’9’) |     |
| ------------ | -------- | ------------- | ------------ | --------- | --- |
As the noise increases the filters become more wide because the neuron has to
rely on more adjacent pixels to feel confident about a stroke
37/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|     | We saw | one | form | of P(x | |x ) which | flips a |
| --- | ------ | --- | ---- | ------ | ---------- | ------- |
(cid:101)ij ij
xˆ
| i   | fraction | q   | of the inputs |     | to zero |     |
| --- | -------- | --- | ------------- | --- | ------- | --- |
Anotherwayofcorruptingtheinputsistoadd
|     | a Gaussian |     | noise to | the | input |     |
| --- | ---------- | --- | -------- | --- | ----- | --- |
h
|     |         |     | x =         | x +N | (0,1)       |         |
| --- | ------- | --- | ----------- | ---- | ----------- | ------- |
|     |         |     | (cid:101)ij | ij   |             |         |
|     | We will | now | use         | such | a denoising | AE on a |
x˜
i
|     | different | dataset | and | see | their performance |     |
| --- | --------- | ------- | --- | --- | ----------------- | --- |
P(x (cid:101)ij |x ij )
x i
38/55
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- |

Figure: Weight decay
|            |          | Figure:             | AE filters          |         |
| ---------- | -------- | ------------------- | ------------------- | ------- |
| Figure:    | Data     |                     |                     | filters |
| The hidden | neurons  | essentially behave  | like edge detectors |         |
| PCA does   | not give | such edge detectors |                     |         |
39/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 7.5: Sparse | Autoencoders |     |     |
| ------ | ----------- | ------------ | --- | --- |
40/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

|     | A hidden | neuron | with | sigmoid | activation | will |
| --- | -------- | ------ | ---- | ------- | ---------- | ---- |
xˆ
i
|     | have values | between  |        | 0 and   | 1         |          |
| --- | ----------- | -------- | ------ | ------- | --------- | -------- |
|     | We say      | that the | neuron | is      | activated | when its |
|     | output      | is close | to 1   | and not | activated | when     |
h
|     | its output | is close    | to   | 0.    |            |            |
| --- | ---------- | ----------- | ---- | ----- | ---------- | ---------- |
|     | A sparse   | autoencoder |      | tries | to         | ensure the |
| x   | neuron     | is inactive | most | of    | the times. |            |
i
41/55
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     |     |     |     | If the neuron | l   | is sparse | (i.e. mostly | inactive) |
| --- | --- | --- | --- | ------------- | --- | --------- | ------------ | --------- |
xˆ
i
|     |     |     |     | then ρˆ | → 0 |     |     |     |
| --- | --- | --- | --- | ------- | --- | --- | --- | --- |
l
|     |     |     |     | A sparse | autoencoder |      | uses a   | sparsity para- |
| --- | --- | --- | --- | -------- | ----------- | ---- | -------- | -------------- |
|     |     |     |     | meter ρ  | (typically  | very | close to | 0, say, 0.005) |
h
|     |     |     |     | and tries | to enforce | the | constraint | ρˆ = ρ |
| --- | --- | --- | --- | --------- | ---------- | --- | ---------- | ------ |
l
|     |     |     |     | One way  | of ensuring |           | this is to add | the follow- |
| --- | --- | --- | --- | -------- | ----------- | --------- | -------------- | ----------- |
|     |     |     | x   | ing term | to the      | objective | function       |             |
i
|             |             |        |       |      | k        |      | ρ         | 1−ρ  |
| ----------- | ----------- | ------ | ----- | ---- | -------- | ---- | --------- | ---- |
| The average | value       | of the |       |      | (cid:88) |      |           |      |
|             |             |        |       | Ω(θ) | =        | ρlog | +(1−ρ)log |      |
| activation  | of a neuron | l is   | given |      |          | ρˆ   |           | 1−ρˆ |
|             |             |        |       |      |          |      | l         | l    |
l=1
by
m
|     | 1 (cid:88) |       |     | When will | this   | term    | reach its minimum | value       |
| --- | ---------- | ----- | --- | --------- | ------ | ------- | ----------------- | ----------- |
|     | ρˆ =       | h(x ) |     |           |        |         |                   |             |
|     | l          | i l   |     | and what  | is the | minimum | value?            | Let us plot |
m
i=1
it and check.
42/55
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- |

ρ = 0.2
Ω(θ)
|              |            | 0.2         | ρˆ l             |      |
| ------------ | ---------- | ----------- | ---------------- | ---- |
| The function | will reach | its minimum | value(s) when ρˆ | = ρ. |
l
43/55
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture7 |
| --- | -------------- | --- | --------------------- | -------- |

|     |       | k        | ρ    |           | 1−ρ    |     | Now, |                 |     |     |
| --- | ----- | -------- | ---- | --------- | ------ | --- | ---- | --------------- | --- | --- |
|     | Ω(θ)= | (cid:88) | ρlog | +(1−ρ)log |        |     |      |                 |     |     |
|     |       |          | ρˆ l |           | 1−ρˆ l |     |      | Lˆ(θ)=L(θ)+Ω(θ) |     |     |
l=1
| Can | be re-written | as  |     |     |     |     |      |     |             |               |
| --- | ------------- | --- | --- | --- | --- | --- | ---- | --- | ----------- | ------------- |
|     | k             |     |     |     |     |     | L(θ) | is  | the squared | error loss or |
(cid:88)
Ω(θ)= ρlogρ−ρlogρˆ +(1−ρ)log(1−ρ)−(1−ρ)log(1−ρˆ ) cross entropy loss and Ω(θ) is the
|     |     |     | l   |     |     | l   |          |     |             |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | ----------- | --- |
|     | l=1 |     |     |     |     |     | sparsity |     | constraint. |     |
By Chain rule:
|     |     |     |     |     |     |     | We  | already | know how | to calculate |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | -------- | ------------ |
∂L(θ)
|     |     | ∂Ω(θ) |     | ∂Ω(θ) ∂ρˆ |     |     |     |        |                  |        |
| --- | --- | ----- | --- | --------- | --- | --- | --- | ------ | ---------------- | ------ |
|     |     |       | =   | .         |     |     | ∂W  |        |                  |        |
|     |     | ∂W    |     | ∂ρˆ ∂W    |     |     |     |        |                  |        |
|     |     |       |     |           |     |     | Let | us see | how to calculate | ∂Ω(θ). |
∂W
|     | ∂Ω(θ) |     | (cid:104) |     | (cid:105)T |     |     |     |     |     |
| --- | ----- | --- | --------- | --- | ---------- | --- | --- | --- | --- | --- |
∂Ω(θ),∂Ω(θ),...∂Ω(θ)
|     |       | =              |         |           |                |     | Finally, |        |       |       |
| --- | ----- | -------------- | ------- | --------- | -------------- | --- | -------- | ------ | ----- | ----- |
|     |       | ∂ρˆ            | ∂ρˆ1    | ∂ρˆ2      | ∂ρˆk           |     |          |        |       |       |
| For | each  | neuron l∈1...k |         | in hidden | layer, we have |     |          |        |       |       |
|     |       |                |         |           |                |     |          | ∂Lˆ(θ) | ∂L(θ) | ∂Ω(θ) |
|     | ∂Ω(θ) |                | ρ (1−ρ) |           |                |     |          |        | =     | +     |
|     |       | =−             | +       |           |                |     |          | ∂W     | ∂W    | ∂W    |
|     | ∂ρˆ   |                | ρˆ 1−ρˆ |           |                |     |          |        |       |       |
|     |       | l              | l       | l         |                |     |          |        |       |       |
∂ρˆ l (g(cid:48)(WTx +b))T(see (and we know how to calculate both
| and |     | =x   |     |     | next slide) |     |       |     |        |     |
| --- | --- | ---- | --- | --- | ----------- | --- | ----- | --- | ------ | --- |
|     |     | ∂W i |     | i   |             |     | terms | on  | R.H.S) |     |
44/55
|     |     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture7 |     |
| --- | --- | --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- |

Derivation
∂ρˆ
|     |     |     | = (cid:2)∂ρˆ1 ∂ρˆ2 ...∂ρˆk | (cid:3) |
| --- | --- | --- | -------------------------- | ------- |
|     |     | ∂W  | ∂W ∂W                      | ∂W      |
For each element in the above equation we can calculate ∂ρˆl (which is the partial
∂W
derivative of a scalar w.r.t. a matrix = matrix). For a single element of a matrix W :-
jl
|     |     |     | (cid:104)               | (cid:1)(cid:105) |
| --- | --- | --- | ----------------------- | ---------------- |
|     |     |     | 1 (cid:80)m (cid:0) WTx |                  |
|     |     | ∂ρˆ | ∂ g                     | i +b l           |
|     |     | l   | m i=1 :,l               |                  |
=
|     |     | ∂W  | ∂W        |                  |
| --- | --- | --- | --------- | ---------------- |
|     |     | jl  | jl        |                  |
|     |     |     | (cid:104) | (cid:1)(cid:105) |
(cid:0) WTx
|     |     |     | 1 m ∂ g      | i +b l |
| --- | --- | --- | ------------ | ------ |
|     |     |     | (cid:88) :,l |        |
=
|     |     |     | m ∂W |     |
| --- | --- | --- | ---- | --- |
jl
i=1
m
1 (cid:88)
|     |     |     | = g(cid:48)(cid:0) WTx +b | (cid:1) x |
| --- | --- | --- | ------------------------- | --------- |
:,l i l ij
m
i=1
| So in matrix | notation | we can write | it as : |     |
| ------------ | -------- | ------------ | ------- | --- |
∂ρˆ
|     |     |     | l (g(cid:48)(WTx +b))T |     |
| --- | --- | --- | ---------------------- | --- |
=x
|     |     | ∂W  | i i |     |
| --- | --- | --- | --- | --- |
45/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 7.6: Contractive | Autoencoders |     |     |
| ------ | ---------------- | ------------ | --- | --- |
46/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

| A contractive | autoencoder     | also tries |     |     |
| ------------- | --------------- | ---------- | --- | --- |
| to prevent    | an overcomplete | autoen-    |     |     |
xˆ
coderfromlearningtheidentityfunc-
tion.
Itdoessobyaddingthefollowingreg-
h
| ularization | term to | the loss function |     |     |
| ----------- | ------- | ----------------- | --- | --- |
(h)(cid:107)2
Ω(θ) = (cid:107)J
x F
x
| whereJ | (h)istheJacobianoftheen- |     |     |     |
| ------ | ------------------------ | --- | --- | --- |
x
coder.
| Let us | see what it looks | like. |     |     |
| ------ | ----------------- | ----- | --- | --- |
47/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | --- | -------------- | --------------------- | -------- |

| If the input                      | has n dimensions  |       | and the |            |               |          |                 |           |
| --------------------------------- | ----------------- | ----- | ------- | ---------- | ------------- | -------- | --------------- | --------- |
|                                   |                   |       |         |            |              |          |                 |          |
| hidden layer                      | has k dimensions  |       | then    |            | ∂h1           | ...      | ... ...         | ∂h1       |
|                                   |                   |       |         |            | ∂x1           |          |                 | ∂xn       |
| In other                          | words, the (l,j)  | entry | of the  |            | ∂h2          | ...      | ... ...         | ∂h2      |
|                                   |                   |       |         |            |  ∂x          |          |                 | ∂x       |
|                                   |                   |       |         | J (h)      | =             | 1        |                 | n         |
| Jacobiancapturesthevariationinthe |                   |       |         | x          |              | . .      | ...             | . .      |
|                                   |                   |       |         |            |              | .        |                 | .        |
|                                   | lth               |       |         |            |              |          |                 |          |
| output of                         | the neuron        | with  | a small |            |               |          |                 |           |
|                                   |                   |       |         |            | ∂h            | k ...    | ... ...         | ∂h k      |
| variation                         | in the jth input. |       |         |            | ∂x1           |          |                 | ∂xn       |
|                                   |                   |       |         |            |               |          | n k (cid:18) ∂h | (cid:19)2 |
|                                   |                   |       |         |            | (h)(cid:107)2 | (cid:88) | (cid:88)        | l         |
|                                   |                   |       |         | (cid:107)J |               | =        |                 |           |
|                                   |                   |       |         |            | x             | F        | ∂x              |           |
j
|     |     |     |     |     |     | j=1 | l=1 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
48/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

| What is | the intuition | behind | this ? |     |     |     |
| ------- | ------------- | ------ | ------ | --- | --- | --- |
(cid:88)(cid:88)(cid:16) n k ∂ h (cid:17)2
(h)(cid:107)2 l
| Consider | ∂ h 1, what | does | it mean if |     | (cid:107)J | =   |
| -------- | ----------- | ---- | ---------- | --- | ---------- | --- |
x F ∂ x
∂ x1 j
| ∂h1 |     |     |     |     |     | j=1 l=1 |
| --- | --- | --- | --- | --- | --- | ------- |
= 0
∂x1
| It means                         | that this | neuron | is not very |     |     |     |
| -------------------------------- | --------- | ------ | ----------- | --- | --- | --- |
| sensitivetovariationsintheinputx |           |        | 1 .         |     |     |     |
xˆ
| But doesn’t | this contradict |            | our other |     |     |     |
| ----------- | --------------- | ---------- | --------- | --- | --- | --- |
| goal of     | minimizing      | L(θ)       | which re- |     |     |     |
| quires h    | to capture      | variations | in the    |     |     |     |
h
input.
x
49/55
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture7 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

| Indeed     | it does and | that’s the idea   |     |               |                                  |           |
| ---------- | ----------- | ----------------- | --- | ------------- | -------------------------------- | --------- |
|            |             |                   |     |               | (cid:88)(cid:88)(cid:16) n k ∂ h | (cid:17)2 |
|            |             |                   |     | (h)(cid:107)2 | l                                |           |
| By putting | these       | two contradicting |     | (cid:107)J    | =                                |           |
|            |             |                   |     | x             | F ∂ x                            |           |
j
| objectives   | against           | each other we | en-  |     | j=1 l=1 |     |
| ------------ | ----------------- | ------------- | ---- | --- | ------- | --- |
| sure that    | h is sensitive    | to only       | very |     |         |     |
| important    | variations        | as observed   | in   |     |         |     |
| the training | data.             |               |      |     |         | xˆ  |
| L(θ) -       | capture important | variations    |      |     |         |     |
in data
h
| Ω(θ) - | do not capture | variations | in  |     |     |     |
| ------ | -------------- | ---------- | --- | --- | --- | --- |
data
| Tradeoff       | - capture | only very import- |     |     |     | x   |
| -------------- | --------- | ----------------- | --- | --- | --- | --- |
| ant variations | in the    | data              |     |     |     |     |
50/55
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture7 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

Let us try to understand this with the help of an illustration.
51/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| -------------- | --------------------- | -------- |

y
|     |     | Consider         | the variations    | in the data |
| --- | --- | ---------------- | ----------------- | ----------- |
|     |     | along directions | u                 | and u       |
|     |     |                  | 1                 | 2           |
|     |     | It makes         | sense to maximize | a neuron    |
u
1
|     |     | to be sensitive | to variations | along u |
| --- | --- | --------------- | ------------- | ------- |
1
u
| 2   |     | At the             | same time it  | makes sense to  |
| --- | --- | ------------------ | ------------- | --------------- |
|     |     | inhibit            | a neuron from | being sensitive |
|     |     | tovariationsalongu |               | 2 (asthereseems |
tobesmallnoiseandunimportantfor
|     | x   | reconstruction) |           |                 |
| --- | --- | --------------- | --------- | --------------- |
|     |     | By doing        | so we can | balance between |
thecontradictinggoalsofgoodrecon-
|     |     | struction | and low sensitivity. |          |
| --- | --- | --------- | -------------------- | -------- |
|     |     | What does | this remind          | you of ? |
52/55
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |
| --- | -------------- | --------------------- | -------- | --- |

Module 7.7 : Summary
53/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| -------------- | --------------------- | -------- |

| xˆ  | y   | PCA |     |
| --- | --- | --- | --- |
| h ≡ | u 1 | u 2 |     |
x
| x   | PTXTXP |                   | −HW∗(cid:107)2 |
| --- | ------ | ----------------- | -------------- |
|     |        | = D min(cid:107)X |                |
θ (cid:124) (cid:123)(cid:122) (cid:125) F
UΣVT
(SVD)
54/55
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |
| --- | -------------- | --------------------- | -------- |

xˆ
i
Regularization
Ω(θ)=λ(cid:107)θ(cid:107)2
| h   |     | Weight decaying |     |
| --- | --- | --------------- | --- |
k
|     | (cid:88)   | ρ 1−ρ     |        |
| --- | ---------- | --------- | ------ |
|     | Ω(θ)= ρlog | +(1−ρ)log | Sparse |
|     |            | ρˆ 1−ρˆ   |        |
|     | l=1        | l         | l      |
x˜
| i              | n k               |                      |     |
| -------------- | ----------------- | -------------------- | --- |
|                | (cid:88) (cid:88) | (cid:16)∂h (cid:17)2 |     |
|                | Ω(θ)=             | l Contractive        |     |
| P(x |x )       |                   | ∂x                   |     |
| (cid:101)ij ij |                   | j                    |     |
j=1l=1
x
i
55/55
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture7 |     |
| -------------- | --------------------- | -------- | --- |
