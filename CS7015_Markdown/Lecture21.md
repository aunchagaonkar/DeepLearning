| CS7015 | (Deep Learning) | : Lecture    | 21  |
| ------ | --------------- | ------------ | --- |
|        | Variational     | Autoencoders |     |
|        | Mitesh          | M. Khapra    |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/36
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| --- | -------------- | --------------------- | --------- |

Acknowledgments
Doersch1
| Tutorial | on Variational | Autoencoders | by Carl |     |
| -------- | -------------- | ------------ | ------- | --- |
Altosaar2
| Blog on | Variational | Autoencoders | by Jaan |     |
| ------- | ----------- | ------------ | ------- | --- |
1Tutorial
2Blog
2/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| --- | --- | -------------- | --------------------- | --------- |

3/36
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| -------------- | --------------------- | --------- |

| Module | 21.1: Revisiting | Autoencoders |     |     |
| ------ | ---------------- | ------------ | --- | --- |
4/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Before         | we start | talking      | about | VAEs,      | let us |
| --- | -------------- | -------- | ------------ | ----- | ---------- | ------ |
| Xˆ  | quickly        | revisit  | autoencoders |       |            |        |
|     | An autoencoder |          | contains     |       | an encoder | which  |
W∗
|     | takes the | input | X   | and maps | it to | a hidden |
| --- | --------- | ----- | --- | -------- | ----- | -------- |
h
representation
|     | The decoder |     | then takes | this | hidden | represent- |
| --- | ----------- | --- | ---------- | ---- | ------ | ---------- |
W
|     | ation and    | tries | to reconstruct |       | the           | input from |
| --- | ------------ | ----- | -------------- | ----- | ------------- | ---------- |
| X   | it as Xˆ     |       |                |       |               |            |
|     | The training |       | happens        | using | the following | ob-        |
h = g(WX+b)
jective function
m n
| Xˆ = f(W∗h+c) |     |     | 1   | (cid:88) (cid:88) |     |     |
| ------------- | --- | --- | --- | ----------------- | --- | --- |
|               |     | min |     | (xˆ               | −x  | )2  |
|               |     |     |     |                   | ij  | ij  |
W,W∗,c,b m
i=1j=1
|     | where     | m is the | number   | of       | training  | instances, |
| --- | --------- | -------- | -------- | -------- | --------- | ---------- |
|     | }m        |          |          | Rn       |           |            |
|     | {x        | and each | x        | ∈ (x     | is thus   | the j-th   |
|     | i i=1     |          | i        |          | ij        |            |
|     | dimension | of       | the i-th | training | instance) |            |
5/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | But where’s |     | the fun | in  | this ? |     |     |
| --- | --- | ----------- | --- | ------- | --- | ------ | --- | --- |
Xˆ
|     |     | We are    | taking | an  | input | and | simply | recon- |
| --- | --- | --------- | ------ | --- | ----- | --- | ------ | ------ |
|     |     | structing | it     |     |       |     |        |        |
W∗
|     |     | Of course, | the | fun | lies in | the fact | that | we are |
| --- | --- | ---------- | --- | --- | ------- | -------- | ---- | ------ |
h
|     |     | getting  | a good      | abstraction |         | of the       | input   |         |
| --- | --- | -------- | ----------- | ----------- | ------- | ------------ | ------- | ------- |
| W   |     | But RBMs |             | were        | able to | do something |         | more    |
|     |     | besides  | abstraction |             | (they   | were         | able to | do gen- |
X
eration)
|     |     | Let us | revisit | generation |     | in the | context | of au- |
| --- | --- | ------ | ------- | ---------- | --- | ------ | ------- | ------ |
h = g(WX+b)
toencoders
Xˆ = f(W∗h+c)
6/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | Can we | do generation |     | with | autoencoders |     | ?   |
| --- | ------ | ------------- | --- | ---- | ------------ | --- | --- |
Xˆ
|     | In other | words, |        | once | the autoencoder |        | is   |
| --- | -------- | ------ | ------ | ---- | --------------- | ------ | ---- |
|     | trained  | can I  | remove | the  | encoder,        | feed a | hid- |
W∗
|     | den representation |      |      | h to | the decoder | and   | de-  |
| --- | ------------------ | ---- | ---- | ---- | ----------- | ----- | ---- |
| h   |                    | Xˆ   |      |      |             |       |      |
|     | code a             | from | it ? |      |             |       |      |
|     | In principle,      |      | yes! | But  | in practice | there | is a |
W
|     | problem | with | this | approach |     |     |     |
| --- | ------- | ---- | ---- | -------- | --- | --- | --- |
X
|     | h is a        | very high | dimensional |       | vector         | and | only |
| --- | ------------- | --------- | ----------- | ----- | -------------- | --- | ---- |
|     | a few vectors |           | in this     | space | would actually |     | cor- |
h = g(WX+b)
|     | respond | to meaningful |     | latent | representations |     |     |
| --- | ------- | ------------- | --- | ------ | --------------- | --- | --- |
Xˆ = f(W∗h+c) of our input
|     | So of all | the      | possible | value   | of h which | values |      |
| --- | --------- | -------- | -------- | ------- | ---------- | ------ | ---- |
|     | should    | I feed   | to the   | decoder | (we had    | asked  | a    |
|     | similar   | question | before:  |         | slide 67,  | bullet | 5 of |
lecture 19)
7/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | Ideally, | we           | should        | only feed      | those | values      | of h |
| --- | -------- | ------------ | ------------- | -------------- | ----- | ----------- | ---- |
| Xˆ  | which    | are          | highly likely |                |       |             |      |
|     | In       | other words, | we            | are interested |       | in sampling |      |
W∗
|     | from | P(h|X) | so that | we  | pick only | those | h’s |
| --- | ---- | ------ | ------- | --- | --------- | ----- | --- |
h
|     | which          | have            | a high   | probability    |     |        |      |
| --- | -------------- | --------------- | -------- | -------------- | --- | ------ | ---- |
|     | But            | unlike          | RBMs,    | autoencoders   |     | do not | have |
|     | such           | a probabilistic |          | interpretation |     |        |      |
|     | They           | learn           | a hidden | representation |     | h but  | not  |
|     | a distribution |                 | P(h|X)   |                |     |        |      |
Xˆ f(W∗h+c)
= Similarlythedecoderisalsodeterministicand
|     | does | not | learn a distribution |         | over   | X (given | a   |
| --- | ---- | --- | -------------------- | ------- | ------ | -------- | --- |
|     | h we | can | get a X              | but not | P(X|h) | )        |     |
8/36
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture21 |     |     |     |
| -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

We will now look at variational autoencoders which have the same structure as
autoencoders but they learn a distribution over the hidden variables
9/36
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| -------------- | --------------------- | --------- |

| Module  | 21.2: Variational |     | Autoencoders: | The Neural |
| ------- | ----------------- | --- | ------------- | ---------- |
| Network | Perspective       |     |               |            |
10/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| --- | --- | -------------- | --------------------- | --------- |

}N
|     | Let {X | = x i | be  | the | training | data |     |
| --- | ------ | ----- | --- | --- | -------- | ---- | --- |
i=1
|     | WecanthinkofX |     |              | asarandomvariableinRn |     |        |         |
| --- | ------------- | --- | ------------ | --------------------- | --- | ------ | ------- |
|     | For example,  |     | X could      | be                    | an  | image  | and the |
|     | dimensions    | of  | X correspond |                       | to  | pixels | of the  |
image
|     | We are | interested |     | in learning |     | an abstraction |     |
| --- | ------ | ---------- | --- | ----------- | --- | -------------- | --- |
Figure: Abstraction
|     | (i.e., given | an  | X find | the | hidden | representa- |     |
| --- | ------------ | --- | ------ | --- | ------ | ----------- | --- |
tion z)
|     | We are           | also   | interested     |     | in generation |            | (i.e., |
| --- | ---------------- | ------ | -------------- | --- | ------------- | ---------- | ------ |
|     | given a          | hidden | representation |     |               | generate   | an X)  |
|     | In probabilistic |        | terms          |     | we are        | interested | in     |
P(z|X)andP(X|z)(tobeconsistentwiththe
|     | literation | on  | VAEs | we will | use | z instead | of H |
| --- | ---------- | --- | ---- | ------- | --- | --------- | ---- |
Figure: Generation
|     | and X instead |     | of V) |     |     |     |     |
| --- | ------------- | --- | ----- | --- | --- | --- | --- |
11/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

EarlierwesawRBMswherewelearntP(z|X)
and P(X|z)
| H   | ∈ {0,1}n |     |             |                     |              |                 |            |                 |          |
| --- | -------- | --- | ----------- | ------------------- | ------------ | --------------- | ---------- | --------------- | -------- |
| c   | c        |     | c           | Below we            | list certain | characteristics |            |                 | of RBMs  |
| 1   | 2        |     | n           |                     |              |                 |            |                 |          |
|     |          |     |             | Structural          | assumptions: |                 | We         | assume          | cer-     |
| h   | h        | ··· | h           |                     |              |                 |            |                 |          |
| 1   | 2        |     | n           | tain independencies |              | in              | the Markov |                 | Network  |
|     |          |     |             | Computational:      |              | When            | training   | with            | Gibbs    |
| w   |          |     | w           | Sampling            | we have      | to run          | the        | Markov          | Chain    |
| 1,1 |          |     | m,n W ∈Rm×n |                     |              |                 |            |                 |          |
|     |          |     |             | for many            | time         | steps which     | is         | expensive       |          |
|     |          |     |             | Approximation:      |              | When            | using      | Contrastive     |          |
| v 1 | v 2      | ··· | v m         | Divergence,         | we           | approximate     |            | the expectation |          |
|     |          |     |             | by a point          | estimate     |                 |            |                 |          |
| b   | b        |     | b           |                     |              |                 |            |                 |          |
| 1   | 2        |     | m           |                     |              |                 |            |                 |          |
|     | {0,1}m   |     |             | (Nothing            | wrong        | with            | the above  | but             | we just  |
| V   | ∈        |     |             |                     |              |                 |            |                 |          |
|     |          |     |             | mention             | them         | to make         | the reader |                 | aware of |
these characteristics)
12/36
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |     | We now | return to | our goals |     |     |
| --- | --- | ------ | --------- | --------- | --- | --- |
Reconstruction: Xˆ
|     |     | Goal 1:   | Learn a  | distribution | over the | latent |
| --- | --- | --------- | -------- | ------------ | -------- | ------ |
|     |     | variables | (Q(z|X)) |              |          |        |
Decoder P (X|z)
| φ   |     | Goal 2:   | Learn a  | distribution | over the      | visible |
| --- | --- | --------- | -------- | ------------ | ------------- | ------- |
|     |     | variables | (P(X|z)) |              |               |         |
| z   |     | VAEs use  | a neural | network      | based encoder | for     |
Goal 1
|     |     | and a neural | network | based | decoder | for Goal |
| --- | --- | ------------ | ------- | ----- | ------- | -------- |
Encoder Q (z|X)
| θ   |     | 2       |             |         |       |     |
| --- | --- | ------- | ----------- | ------- | ----- | --- |
|     |     | We will | look at the | encoder | first |     |
Data: X
θ: the parameters of the encoder
neural network
φ: the parameters of the decoder
neural network
13/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | Encoder: | What | do we mean | when we say |
| --- | --- | --- | -------- | ---- | ---------- | ----------- |
z
|     |     |     | we want | to learn | a distribution?      | We mean |
| --- | --- | --- | ------- | -------- | -------------------- | ------- |
|     |     |     | that we | want to  | learn the parameters | of the  |
µ Σ
distribution
|     |     |     | But what | are the | parameters      | of Q(z|X)? |
| --- | --- | --- | -------- | ------- | --------------- | ---------- |
|     |     |     | Well it  | depends | on our modeling | assump-    |
Q (z|X)
θ tion!
InVAEsweassumethatthelatentvariables
|     |     |     | come from | a standard | normal | distribution |
| --- | --- | --- | --------- | ---------- | ------ | ------------ |
X
N(0,I)andthejoboftheencoderistothen
|     |         |      | predict | the parameters | of this | distribution |
| --- | ------- | ---- | ------- | -------------- | ------- | ------------ |
| Rn, | Rm      | Rm×m |         |                |         |              |
| X ∈ | µ ∈ and | Σ ∈  |         |                |         |              |
14/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

Xˆ
| i   |         | Now what           | about  | the         | decoder?   |           |           |     |
| --- | ------- | ------------------ | ------ | ----------- | ---------- | --------- | --------- | --- |
|     | Pφ(X|z) | The job            | of the | decoder     | is to      | predict   | a probab- |     |
|     |         | ility distribution |        | over        | X : P(X|z) |           |           |     |
|     |         | Once again         | we     | will assume |            | a certain | form      | for |
this distribution
z
| Sample |     | For example, |      | if we want | to      | predict    | 28     | x 28   |
| ------ | --- | ------------ | ---- | ---------- | ------- | ---------- | ------ | ------ |
|        |     | pixels and   | each | pixel      | belongs | to R       | (i.e., | X ∈    |
|        |     | R784) then   | what | would      | be      | a suitable |        | family |
µ
|     | Σ       | for P(X|z)?  |        |         |          |     |            |       |
| --- | ------- | ------------ | ------ | ------- | -------- | --- | ---------- | ----- |
|     |         | We could     | assume | that    | P(X|z)   | is  | a Gaussian |       |
|     | Qθ(z|X) | distribution | with   | unit    | variance |     |            |       |
|     |         | The job      | of the | decoder | f would  |     | then       | be to |
Xi
|     |     | predict | the mean | of this | distribution |     | as  | f (z) |
| --- | --- | ------- | -------- | ------- | ------------ | --- | --- | ----- |
φ
15/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

Xˆ
| i   |     | What    | would | be the objective |     | function | of the |
| --- | --- | ------- | ----- | ---------------- | --- | -------- | ------ |
|     |     | decoder | ?     |                  |     |          |        |
Pφ(X|z)
|     |     | For any | given | training | sample | x it | should |
| --- | --- | ------- | ----- | -------- | ------ | ---- | ------ |
i
|     |     | maximize | P(x | ) given | by  |     |     |
| --- | --- | -------- | --- | ------- | --- | --- | --- |
i
ˆ
z
|        |     |     | P(x ) | = P(z)P(x | |z)dz  |         |     |
| ------ | --- | --- | ----- | --------- | ------ | ------- | --- |
| Sample |     |     | i     |           | i      |         |     |
|        |     |     |       | = −E      | [logP  | (x |z)] |     |
|        |     |     |       | z∼Q       | (z|xi) | φ i     |     |
θ
µ
|     | Σ   | (As usual | we  | take log | for numerical | stability) |     |
| --- | --- | --------- | --- | -------- | ------------- | ---------- | --- |
Qθ(z|X)
Xi
16/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

Xˆ
|     | i   |         | This is     | the loss | function  | for | one  | data point   |
| --- | --- | ------- | ----------- | -------- | --------- | --- | ---- | ------------ |
|     |     |         | (l (θ)) and | we       | will just | sum | over | all the data |
|     |     | Pφ(X|z) | i           |          |           |     |      |              |
L(θ)
|     |     |     | points to | get | the total | loss |     |     |
| --- | --- | --- | --------- | --- | --------- | ---- | --- | --- |
m
(cid:88)
|     |     |     |     |     | L(θ) | = l | (θ) |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- |
i
z
i=1
Sample
|     |     |     | In addition,  | we   | also   | want a  | constraint | on the     |
| --- | --- | --- | ------------- | ---- | ------ | ------- | ---------- | ---------- |
|     |     |     | distribution  | over | the    | latent  | variables  |            |
| µ   |     |     | Specifically, |      | we had | assumed |            | P(z) to be |
Σ
|     |     |     | N(0,I)  | and         | we want | Q(z|X) | to  | be as close |
| --- | --- | --- | ------- | ----------- | ------- | ------ | --- | ----------- |
|     |     |     | to P(z) | as possible |         |        |     |             |
Qθ(z|X)
|                |               |     | Thus, we | will | modify | the    | loss function | such |
| -------------- | ------------- | --- | -------- | ---- | ------ | ------ | ------------- | ---- |
|                | Xi            |     | that     |      |        |        |               |      |
| KL divergence  | captures      |     |          |      |        |        |               |      |
|                |               |     | l (θ,φ)  | =    | −E     | [logP  | (x            | |z)] |
| the difference | (or distance) |     | i        |      | z∼Q    | (z|xi) | φ             | i    |
θ
| between 2 | distributions |     |     |     |     |       |      |          |
| --------- | ------------- | --- | --- | --- | --- | ----- | ---- | -------- |
|           |               |     |     |     |     | +KL(Q | (z|x | )||P(z)) |
|           |               |     |     |     |     |       | θ    | i        |
17/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

Xˆ
|     | i   |     | The second | term in the         | loss function | can actually | be  |
| --- | --- | --- | ---------- | ------------------- | ------------- | ------------ | --- |
|     |     |     | thought    | of as a regularizer |               |              |     |
Pφ(X|z)
Itensuresthattheencoderdoesnotcheatbymapping
eachx toadifferentpoint(anormaldistributionwith
i
|     |     |     | very low | variance) in  | the Euclidean | space              |     |
| --- | --- | --- | -------- | ------------- | ------------- | ------------------ | --- |
|     |     |     | In other | words, in the | absence       | of the regularizer | the |
z
|     |     |     | encoder | can learn a | unique mapping | for each | x i and |
| --- | --- | --- | ------- | ----------- | -------------- | -------- | ------- |
Sample
thedecodercanthendecodefromthisuniquemapping
Evenwithhighvarianceinsamplesfromthedistribu-
|     |     |     | tion, we | want the decoder | to be | able to reconstruct |     |
| --- | --- | --- | -------- | ---------------- | ----- | ------------------- | --- |
µ
|     |     | Σ   | the original | data very | well (motivation | similar | to the |
| --- | --- | --- | ------------ | --------- | ---------------- | ------- | ------ |
adding noise)
Tosummarize,foreachdatapointwepredictadistri-
Qθ(z|X)
butionsuchthat,withhighprobabilityasamplefrom
thisdistributionshouldbeabletoreconstructtheori-
Xi
|     |     |     | ginal data | point |     |     |     |
| --- | --- | --- | ---------- | ----- | --- | --- | --- |
l (θ,φ) = −E [logP (x |z)] But why do we choose a normal distribution? Isn’t
| i   | z∼Q θ (z|xi) | φ i |     |     |     |     |     |
| --- | ------------ | --- | --- | --- | --- | --- | --- |
+KL(Q (z|x )||P(z)) it too simplistic to assume that z follows a normal
θ i
distribution
18/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | Isn’t it | a very | strong assumption |     | that | P(z) ∼ |
| --- | --- | --- | -------- | ------ | ----------------- | --- | ---- | ------ |
N(0,I) ?
|     |     |     | For example,    |         | in the 2-dimensional |              |                  | case how |
| --- | --- | --- | --------------- | ------- | -------------------- | ------------ | ---------------- | -------- |
|     |     |     | can we          | be sure | that P(z)            | is           | a normal         | distri-  |
|     |     |     | bution          | and not | any other            | distribution |                  |          |
|     |     |     | The key         | insight | here is              | that         | any distribution |          |
|     |     |     | in d dimensions |         | can be               | generated    | by               | the fol- |
lowing steps
|           |            |                   | Step 1:      | Start       | with a set | of d variables |         | that are  |
| --------- | ---------- | ----------------- | ------------ | ----------- | ---------- | -------------- | ------- | --------- |
|           |            |                   | normally     | distributed | (that’s    | exactly        |         | what we   |
|           |            |                   | are assuming |             | for P(z))  |                |         |           |
|           |            |                   | Step 2:      | Mapping     | these      | variables      |         | through a |
|           |            |                   | sufficiently | complex     | function   |                | (that’s | exactly   |
| l (θ,φ) = | −E [logP   | (x |z)]           |              |             |            |                |         |           |
| i         | z∼Q (z|xi) | φ i               |              |             |            |                |         |           |
|           | θ          |                   | what the     | first       | few layers | of the         | decoder | can       |
|           | +KL(Q      | θ (z|x i )||P(z)) |              |             |            |                |         |           |
do)
19/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     | In particular, | note     | that        | in the           | adjoining | example | if z       |
| --- | -------------- | -------- | ----------- | ---------------- | --------- | ------- | ---------- |
|     | is 2-D and     | normally | distributed |                  | then      | f(z)    | is roughly |
|     | ring shaped    | (giving  | us          | the distribution |           | in the  | bottom     |
figure)
|     |              |          |                | z       | z       |         |        |
| --- | ------------ | -------- | -------------- | ------- | ------- | ------- | ------ |
|     |              |          | f(z)=          | +       |         |         |        |
|     |              |          |                | 10      | ||z||   |         |        |
|     | A non-linear | neural   | network,       |         | such as | the one | we use |
|     | for the      | decoder, | could          | learn a | complex | mapping | from   |
|     | z to f (z)   | using    | its parameters |         | φ       |         |        |
φ
|     | The initial   | layers | of a | non linear | decoder | could | learn |
| --- | ------------- | ------ | ---- | ---------- | ------- | ----- | ----- |
|     | their weights | such   | that | the output | is      | f (z) |       |
φ
Theaboveargumentsuggeststhatevenifwestartwith
|     | normally | distributed | variables |     | the initial | layers | of the |
| --- | -------- | ----------- | --------- | --- | ----------- | ------ | ------ |
decodercouldlearnacomplextransformationofthese
|     | variables | say f φ (z) | if required |     |     |     |     |
| --- | --------- | ----------- | ----------- | --- | --- | --- | --- |
Theobjectivefunctionofthedecoderwillensurethat
l (θ,φ) = −E [logP (x |z)]
i z∼Q (z|xi) φ i an appropriate transformation of z is learnt to recon-
θ
struct X
+KL(Q θ (z|x i )||P(z))
20/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

| Module | 21.3: Variational |     | autoencoders: | (The graphical |
| ------ | ----------------- | --- | ------------- | -------------- |
| model  | perspective)      |     |               |                |
21/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture21 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Here we | can think | of  | z and | X as | random | vari- |
| --- | ------- | --------- | --- | ----- | ---- | ------ | ----- |
ables
z
|     | We are  | then         | interested | in  | the   | joint      | prob- |
| --- | ------- | ------------ | ---------- | --- | ----- | ---------- | ----- |
|     | ability | distribution | P(X,z)     |     | which | factorizes |       |
X
|     | as P(X,z)          | = P(z)P(X|z) |     |         |         |     |        |
| --- | ------------------ | ------------ | --- | ------- | ------- | --- | ------ |
|     | This factorization |              | is  | natural | because |     | we can |
N
imaginethatthelatentvariablesarefixedfirst
andthenthevisiblevariablesaredrawnbased
|     | on the       | latent variables |         |             |      |         |        |
| --- | ------------ | ---------------- | ------- | ----------- | ---- | ------- | ------ |
|     | For example, | if               | we want | to          | draw | a digit | we     |
|     | could first  | fix the          | latent  | variables:  |      | the     | digit, |
|     | size, angle, | thickness,       |         | position    | and  | so      | on and |
|     | then draw    | a digit          | which   | corresponds |      | to      | these  |
latent variables
|     | Andofcourse, |       | unlikeRBMs, |     | thisisadirected |     |     |
| --- | ------------ | ----- | ----------- | --- | --------------- | --- | --- |
|     | graphical    | model |             |     |                 |     |     |
22/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | Now at    | inference | time,  | we are     | given | an X    | (observed |
| --- | --------- | --------- | ------ | ---------- | ----- | ------- | --------- |
|     | variable) | and       | we are | interested | in    | finding | the most  |
z
|     | likely assignments |     | of               | latent | variables | z which | would |
| --- | ------------------ | --- | ---------------- | ------ | --------- | ------- | ----- |
|     | have resulted      | in  | this observation |        |           |         |       |
|     | Mathematically,    |     | we want          | to     | find      |         |       |
X
P(X|z)P(z)
P(z|X)=
N P(X)
|                | This is               | hard to      | compute     | because        |      | the LHS   | contains   |
| -------------- | --------------------- | ------------ | ----------- | -------------- | ---- | --------- | ---------- |
|                | P(X) whˆich           | is           | intractable |                |      |           |            |
|                | P(X)=                 | P(X|z)P(z)dz |             |                |      |           |            |
|                | ˆ ˆ                   | ˆ            |             |                |      |           |            |
|                | =                     | ... P(X|z    | ,z          | ,...,z         | )P(z | ,z ,...,z | )dz ,...dz |
|                |                       |              | 1           | 2              | n 1  | 2         | n 1 n      |
|                | In RBMs,              | we had       | a similar   | integral       |      | which we  | approx-    |
|                | imated using          | Gibbs        | Sampling    |                |      |           |            |
|                | VAEs, on              | the other    | hand,       | cast           | this | into an   | optimiza-  |
|                | tion problem          | and          | learn       | the parameters |      | of the    | optim-     |
|                | ization problem       |              |             |                |      |           | 23/36      |
| MiteshM.Khapra | CS7015(DeepLearning): |              |             | Lecture21      |      |           |            |

|     | Specifically, | in    | VAEs, | we assume    |     | that instead |
| --- | ------------- | ----- | ----- | ------------ | --- | ------------ |
|     | of P(z|X)     | which | is    | intractable, | the | posterior    |
z
|     | distribution | is        | given | by Q θ (z|X) |       |            |
| --- | ------------ | --------- | ----- | ------------ | ----- | ---------- |
|     | Further,     | we assume |       | that Q       | (z|X) | is a Gaus- |
θ
X
|     | sian whose | parameters |      | are     | determined | by a |
| --- | ---------- | ---------- | ---- | ------- | ---------- | ---- |
|     | neural     | network    | µ, Σ | = g (X) |            |      |
θ
N
|     | The parameters |     | of  | the distribution |     | are thus    |
| --- | -------------- | --- | --- | ---------------- | --- | ----------- |
|     | determined     | by  | the | parameters       | θ   | of a neural |
network
Ourjobthenistolearntheparametersofthis
neural network
24/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | But what | is  | the objective |     | function |     | for this |
| --- | -------- | --- | ------------- | --- | -------- | --- | -------- |
neural network
z
|     | Well we | want  | the | proposed |        | distribution |           |
| --- | ------- | ----- | --- | -------- | ------ | ------------ | --------- |
|     | Q (z|X) | to be | as  | close    | to the | true         | distribu- |
θ
X
tion
|     | We can | capture | this | using | the | following | ob- |
| --- | ------ | ------- | ---- | ----- | --- | --------- | --- |
N
jective function
|     | minimize |         | KL(Q       | θ       | (z|X)||P(z|X)) |      |           |
| --- | -------- | ------- | ---------- | ------- | -------------- | ---- | --------- |
|     | What     | are the | parameters |         | of             | the  | objective |
|     | function | ? (they |            | are the | parameters     |      | of the    |
|     | neural   | network | - we       | will    | return         | back | to this   |
again)
25/36
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

| Let | us expand      | the | KL divergence |     | term      |          |                    |
| --- | -------------- | --- | ------------- | --- | --------- | -------- | ------------------ |
|     |                |     |               | ˆ   |           |          | ˆ                  |
| D[Q | (z|X)||P(z|X)] |     | =             | Q   | (z|X)logQ | (z|X)dz− | Q (z|X)logP(z|X)dz |
|     | θ              |     |               | θ   |           | θ        | θ                  |
E
|     |           |     | =        |     |         | [logQ (z|X)−logP(z|X)] |     |
| --- | --------- | --- | -------- | --- | ------- | ---------------------- | --- |
|     |           |     |          | z∼Q | θ (z|X) | θ                      |     |
|     |           |     |          | E   | E       |                        |     |
| For | shorthand | we  | will use | Q   | =       |                        |     |
|     |           |     |          |     | z∼Q     | θ (z|X)                |     |
P(X|z)P(z)
| Substituting |     | P(z|X) | =   |     | ,   | we get |     |
| ------------ | --- | ------ | --- | --- | --- | ------ | --- |
P(X)
D[Q (z|X)||P(z|X)] = E [logQ (z|X)−logP(X|z)−logP(z)+logP(X)]
|     | θ   |     |     | Q     | θ                |     |                     |
| --- | --- | --- | --- | ----- | ---------------- | --- | ------------------- |
|     |     |     | = E | [logQ | (z|X)−logP(z)]−E |     | [logP(X|z)]+logP(X) |
|     |     |     |     | Q     | θ                |     | Q                   |
(z|X)||p(z)]−E
|     |     |     | = D[Q | θ   |     | Q [logP(X|z)]+logP(X) |     |
| --- | --- | --- | ----- | --- | --- | --------------------- | --- |
|     | ∴   |     | E     |     |     |                       |     |
logp(X) = Q [logP(X|z)]−D[Q θ (z|X)||P(z)]+D[Q θ (z|X)||P(z|X)]
26/36
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture21 |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --------- |

So, we have
E
logP(X) = Q [logP(X|z)]−D[Q θ (z|X)||P(z)]+D[Q θ (z|X)||P(z|X)]
Recall that we are interested in maximizing the log likelihood of the data i.e.
P(X)
Since KL divergence (the red term) is always >= 0 we can say that
E
|     | [logP(X|z)]−D[Q |     |     | (z|X)||P(z)] | <=  | logP(X) |     |
| --- | --------------- | --- | --- | ------------ | --- | ------- | --- |
|     | Q               |     |     | θ            |     |         |     |
The quantity on the LHS is thus a lower bound for the quantity that we want
| to maximize | and is | knows | as the Evidence | lower | bound | (ELBO) |     |
| ----------- | ------ | ----- | --------------- | ----- | ----- | ------ | --- |
Maximizing this lower bound is the same as maximizing logP(X) and hence
| our equivalent | objective | now | becomes |     |     |     |     |
| -------------- | --------- | --- | ------- | --- | --- | --- | --- |
E
|     | maximize |     | Q [logP(X|z)]−D[Q |     | θ (z|X)||P(z)] |     |     |
| --- | -------- | --- | ----------------- | --- | -------------- | --- | --- |
And, this method of learning parameters of probability distributions associ-
ated with graphical models using optimization (by maximizing ELBO) is called
| variational | inference |     |     |     |     |     |     |
| ----------- | --------- | --- | --- | --- | --- | --- | --- |
Why is this any easier? It is easy because of certain assumptions that we make
| as discussed | on the | next slide     |     |                       |     |           | 27/36 |
| ------------ | ------ | -------------- | --- | --------------------- | --- | --------- | ----- |
|              |        | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture21 |       |

|     |         | First      | we        | will just | reintroduce     | the        | parameters     | in the       |
| --- | ------- | ---------- | --------- | --------- | --------------- | ---------- | -------------- | ------------ |
|     |         | equation   |           | to make   | things explicit |            |                |              |
| Xˆ  |         |            |           | E         |                 |            |                |              |
| i   |         |            | maximize  | Q [logP   | φ (X|z)]−D[Q    |            | θ (z|X)||P(z)] |              |
|     | Pφ(X|z) | At         | training  | time,     | we are          | interested | in             | learning the |
|     |         | parameters |           | θ which   | maximize        |            | the above      | for every    |
|     |         | training   |           | example   | (x ∈{x          | }N )       |                |              |
|     |         |            |           |           | i               | i i=1      |                |              |
|     |         | So         | our total | objective | function        | is         |                |              |
z
N
| Sample |     |     |          |     | (cid:88) E |      |           |     |
| ------ | --- | --- | -------- | --- | ---------- | ---- | --------- | --- |
|        |     |     | maximize |     | Q [logP    | φ (X | =x i |z)] |     |
θ
i=1
|     |     |     |     |     | −D[Q | (z|X | =x  | )||P(z)] |
| --- | --- | --- | --- | --- | ---- | ---- | --- | -------- |
|     |     |     |     |     |      | θ    | i   |          |
µ Σ
|     |     | We       | will shorthand |         | P(X =x      | ) as | P(x )     |            |
| --- | --- | -------- | -------------- | ------- | ----------- | ---- | --------- | ---------- |
|     |     |          |                |         |             | i    | i         |            |
|     |     | However, |                | we will | assume that | we   | are using | stochastic |
Qθ(z|X)
gradientdescentsoweneedtodealwithonlyoneofthe
|     |     | terms    | in  | the summation | corresponding |     |     | to the current |
| --- | --- | -------- | --- | ------------- | ------------- | --- | --- | -------------- |
| Xi  |     | training |     | example       |               |     |     |                |
28/36
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | So  | our objective | function |     | w.r.t.   | one example | is            |
| --- | --- | --- | ------------- | -------- | --- | -------- | ----------- | ------------- |
|     |     |     | maximize      | E [logP  | (x  | |z)]−D[Q |             | (z|x )||P(z)] |
|     |     |     | θ             | Q        | φ   | i        | θ           | i             |
Xˆ
i
|     |         | Now,  | first | we will | do a forward |      | prop through | the en- |
| --- | ------- | ----- | ----- | ------- | ------------ | ---- | ------------ | ------- |
|     | Pφ(X|z) | coder | using | X and   | compute      | µ(X) | and          | Σ(X)    |
i
|     |     | The          | second         | term | in the  | above | objective | function     |
| --- | --- | ------------ | -------------- | ---- | ------- | ----- | --------- | ------------ |
|     |     | is           | the difference |      | between | two   | normal    | distribution |
|     |     | N(µ(X),Σ(X)) |                | and  | N(0,I)  |       |           |              |
z Withsomesimpletrickeryyoucanshowthatthisterm
Sample
|     |     | reduces | to  | the following |     | expression | (Seep | proof here) |
| --- | --- | ------- | --- | ------------- | --- | ---------- | ----- | ----------- |
D[N(µ(X),Σ(X))||N(0,I)]
1
| µ   | Σ   | =   | (tr(Σ(X))+(µ(X))T[µ(X))−k−logdet(Σ(X))] |     |     |     |     |     |
| --- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --- |
2
|     |     | where | k is | the dimensionality |     | of  | the latent | variables |
| --- | --- | ----- | ---- | ------------------ | --- | --- | ---------- | --------- |
Qθ(z|X)
|     |     | This | term | can be | computed | easily | because | we have |
| --- | --- | ---- | ---- | ------ | -------- | ------ | ------- | ------- |
alreadycomputedµ(X)andΣ(X)intheforwardpass
Xi
29/36
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | Now let | us look at | the other | term | in the ob- |
| --- | --- | ------- | ---------- | --------- | ---- | ---------- |
jective function
Xˆ
i n
(cid:88)
|     |     |     | E   | [logP (X|z)] |     |     |
| --- | --- | --- | --- | ------------ | --- | --- |
|     |     |     |     | Q φ          |     |     |
Pφ(X|z)
i=1
|     |     | This is   | again an  | expectation | and | hence in- |
| --- | --- | --------- | --------- | ----------- | --- | --------- |
|     |     | tractable | (integral | over z)     |     |           |
z
|     |     | In VAEs, | we approximate | this | with | a single z |
| --- | --- | -------- | -------------- | ---- | ---- | ---------- |
Sample
|     |     | sampled    | from N(µ(X),Σ(X)) |               |            |             |
| --- | --- | ---------- | ----------------- | ------------- | ---------- | ----------- |
|     |     | Hence this | term is           | also easy     | to compute | (of         |
| µ   | Σ   | course it  | is a nasty        | approximation |            | but we will |
|     |     | live with  | it!)              |               |            |             |
Qθ(z|X)
Xi
30/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     | Further,     | as   | usual, | we need | to   | assume | some |
| --- | --- | ------------ | ---- | ------ | ------- | ---- | ------ | ---- |
|     |     | parametric   | form | for    | P(X|z)  |      |        |      |
| Xˆ  |     | For example, |      | if we  | assume  | that | P(X|z) | is a |
i
|     |         | Gaussian    | with | mean          | µ(z) | and variance |            | I then |
| --- | ------- | ----------- | ---- | ------------- | ---- | ------------ | ---------- | ------ |
|     | Pφ(X|z) |             |      |               |      | 1            |            |        |
|     |         | logP(X      | =    | X |z)         | = C  | − ||X        | −µ(z)||2   |        |
|     |         |             |      | i             |      | 2            | i          |        |
|     |         | µ(z) in     | turn | is a function |      | of the       | parameters | of     |
|     |         | the decoder |      | and can       | be   | written      | as f       | (z)    |
| z   |         |             |      |               |      |              | φ          |        |
1
| Sample |     |        |     |         |     |       |      | (z)||2 |
| ------ | --- | ------ | --- | ------- | --- | ----- | ---- | ------ |
|        |     | logP(X | =   | X i |z) | = C | − ||X | i −f | φ      |
2
|     |     | Our effective |     | objective | function |     | thus | becomes |
| --- | --- | ------------- | --- | --------- | -------- | --- | ---- | ------- |
µ Σ
N (cid:20) 1
|     |     |          | (cid:88) |         |           |     | ))T[µ(X |        |
| --- | --- | -------- | -------- | ------- | --------- | --- | ------- | ------ |
|     |     | minimize |          | (tr(Σ(X | i ))+(µ(X |     | i       | i ))−k |
|     |     | θ,φ      |          | 2       |           |     |         |        |
n=1
Qθ(z|X)
(cid:21)
|     |     |     | −logdet(Σ(X |     | ))]+||X |     | −f (z)||2 |     |
| --- | --- | --- | ----------- | --- | ------- | --- | --------- | --- |
|     |     |     |             |     | i       | i   | φ         |     |
Xi
31/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

Theabovelosscanbeeasilycomputedandwe
|     |     | can update | the     | parameters |                 | θ of the | encoder |
| --- | --- | ---------- | ------- | ---------- | --------------- | -------- | ------- |
| Xˆ  |     | and φ of   | decoder | using      | backpropagation |          |         |
i
|     |     | However, | there | is a | catch | !   |     |
| --- | --- | -------- | ----- | ---- | ----- | --- | --- |
Pφ(X|z)
|     |     | The network |            | is not | end   | to end differentiable |            |
| --- | --- | ----------- | ---------- | ------ | ----- | --------------------- | ---------- |
|     |     | because     | the output |        | f (z) | is not an             | end to end |
φ
|     |     | differentiable |         | function | of      | the input | X   |
| --- | --- | -------------- | ------- | -------- | ------- | --------- | --- |
| z   |     | Why?           | because | after    | passing | X through | the |
SSaammppllee
|     |     | network  | we simply |     | compute | µ(X)       | and Σ(X) |
| --- | --- | -------- | --------- | --- | ------- | ---------- | -------- |
|     |     | and then | sample    | a   | z to be | fed to the | decoder  |
|     |     | This     | makes     | the | entire  | process    | non-     |
µ Σ
|     |     | deterministic |     | and | hence | f (z) | is not a |
| --- | --- | ------------- | --- | --- | ----- | ----- | -------- |
φ
|     |     | continuous | function |     | of the | input X |     |
| --- | --- | ---------- | -------- | --- | ------ | ------- | --- |
Qθ(z|X)
Xi
32/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

VAEsuseaneattricktogetaroundthisprob-
lem
| Xˆ  |     | This is known |     | as the reparameterization |     | trick |
| --- | --- | ------------- | --- | ------------------------- | --- | ----- |
i
|     |     | wherein | we move | the | process of sampling | to  |
| --- | --- | ------- | ------- | --- | ------------------- | --- |
Pφ(X|z)
|     |     | an input          | layer    |           |                   |            |
| --- | --- | ----------------- | -------- | --------- | ----------------- | ---------- |
|     |     | For 1 dimensional |          | case,     | given µ and       | σ we can   |
|     |     | sample from       |          | N(µ,σ)    | by first sampling | (cid:15) ∼ |
|     |     | N(0,1),           | and then | computing |                   |            |
z
Sample
z = µ+σ∗(cid:15)
|     |     | The adjacent |     | figure | shows the | difference |
| --- | --- | ------------ | --- | ------ | --------- | ---------- |
µ Σ
|     |     | between  | the original | network | and the | repara- |
| --- | --- | -------- | ------------ | ------- | ------- | ------- |
|     |     | mterized | network      |         |         |         |
Qθ(z|X)
|     |     | The randomness |     | in f | (z) is now | associated |
| --- | --- | -------------- | --- | ---- | ---------- | ---------- |
φ
| Xi  |     | with (cid:15) and | not | X or | the parameters | of the |
| --- | --- | ----------------- | --- | ---- | -------------- | ------ |
model
33/36
| Xˆ  | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |
i
Pφ(X|z)
z
+
∗ (cid:15)∼N(0,I)
µ
Σ
Qθ(z|X)
Xi

|     | With that | we are | done with | the process | of  |
| --- | --------- | ------ | --------- | ----------- | --- |
Data: {X }N
i i=1
|     | training | VAEs |     |     |     |
| --- | -------- | ---- | --- | --- | --- |
Model: Xˆ =f (µ(X)+Σ(X)∗(cid:15))
φ
|     | Specifically, | we  | have described | the | data, |
| --- | ------------- | --- | -------------- | --- | ----- |
Parameters: θ,φ
|     | model, | parameters, | objective | function | and |
| --- | ------ | ----------- | --------- | -------- | --- |
Algorithm: Gradient descent
|     | learning | algorithm |     |     |     |
| --- | -------- | --------- | --- | --- | --- |
Objective:
|     | Now what | happens | at test time? | We  | need to |
| --- | -------- | ------- | ------------- | --- | ------- |
(cid:88) N (cid:20) 1
(tr(Σ(X ))+(µ(X ))T[µ(X )) consider both abstraction and generation
i i i
2
n=1 Inotherwordsweareinterestedincomputing
(cid:21)
−k−logdet(Σ(X ))]+||X −f (z)||2 a z given a X as well as in generating a X
i i φ
given a z
|     | Let us | look at each | of these goals |     |     |
| --- | ------ | ------------ | -------------- | --- | --- |
34/36
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture21 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

Abstraction
|     |     |     | After the | model |             | parameters | are | learned | we  |
| --- | --- | --- | --------- | ----- | ----------- | ---------- | --- | ------- | --- |
|     |     |     | feed a    | X to  | the encoder |            |     |         |     |
Xˆ
i
|     |     |         | By doing   | a   | forward | pass  | using      | the learned |      |
| --- | --- | ------- | ---------- | --- | ------- | ----- | ---------- | ----------- | ---- |
|     |     | Pφ(X|z) | parameters |     | of the  | model | we compute |             | µ(X) |
and Σ(X)
z
|     |     |     | We then   | sample |     | a z from | the      | distribution |     |
| --- | --- | --- | --------- | ------ | --- | -------- | -------- | ------------ | --- |
|     | +   |     | µ(X) and  | Σ(X)   | or  | using    | the same | reparamet-   |     |
|     |     |     | erization | trick  |     |          |          |              |     |
∗
(cid:15)∼N(0,I)
|     |     |     | In other     | words, |       | once           | we have | obtained |            |
| --- | --- | --- | ------------ | ------ | ----- | -------------- | ------- | -------- | ---------- |
|     |     |     | µ(X)         | and    | Σ(X), | we             | first   | sample   | (cid:15) ∼ |
| µ   |     | Σ   | N(µ(X),Σ(X)) |        | and   | then           | compute | z        |            |
|     |     |     |              |        | z     | = µ+σ∗(cid:15) |         |          |            |
Qθ(z|X)
Xi
35/36
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

Generation
Afterthemodelparametersarelearnedwere-
|     |     | move the | encoder | and | feed | a z ∼ | N(0,I) | to  |
| --- | --- | -------- | ------- | --- | ---- | ----- | ------ | --- |
Xˆ
| i   |         | the decoder |      |      |         |     |         |     |
| --- | ------- | ----------- | ---- | ---- | ------- | --- | ------- | --- |
|     | Pφ(X|z) | The decoder | will | then | predict | f   | (z) and | we  |
φ
|     |     | can draw | an X | ∼ N(f | (z),I) |     |     |     |
| --- | --- | -------- | ---- | ----- | ------ | --- | --- | --- |
φ
z
|     |     | Why would | this | work | ?   |     |     |     |
| --- | --- | --------- | ---- | ---- | --- | --- | --- | --- |
+
|                 |     | Well, we         | had | trained    | the model |      | to minimize |       |
| --------------- | --- | ---------------- | --- | ---------- | --------- | ---- | ----------- | ----- |
| ∗               |     | D(Q (z|X)||p(z)) |     | where      | p(z)      | was  | N(0,I)      |       |
| (cid:15)∼N(0,I) |     | θ                |     |            |           |      |             |       |
|                 |     | If the model     |     | is trained | well      | then | Q           | (z|X) |
θ
|     |     | should also | become | N(0,I) |     |     |     |     |
| --- | --- | ----------- | ------ | ------ | --- | --- | --- | --- |
µ Σ
|     |     | Hence, if | we feed     | z   | ∼ N(0,I), |         | it is almost |     |
| --- | --- | --------- | ----------- | --- | --------- | ------- | ------------ | --- |
|     |     | as if we  | are feeding | a   | z ∼       | Q (z|X) | and          | the |
θ
Qθ(z|X)
|     |     | decoder was | indeed | trained | to  | produce | a   | good |
| --- | --- | ----------- | ------ | ------- | --- | ------- | --- | ---- |
|     |     | f (z) from  | such   | a z     |     |         |     |      |
φ
Xi
|     |     | Hence this | will | work | !   |     |     |     |
| --- | --- | ---------- | ---- | ---- | --- | --- | --- | --- |
36/36
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture21 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |
