| CS7015 | (Deep Learning) | : Lecture | 9   |
| ------ | --------------- | --------- | --- |
Greedy Layerwise Pre-training, Better activation functions, Better weight
| initialization | methods, | Batch Normalization |     |
| -------------- | -------- | ------------------- | --- |
|                | Mitesh   | M. Khapra           |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

| Module | 9.1 : | A quick recap | of training | deep neural |
| ------ | ----- | ------------- | ----------- | ----------- |
networks
2/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | --- | -------------- | --------------------- | -------- |

y
|     | We  | already saw how | to train this network |     |
| --- | --- | --------------- | --------------------- | --- |
| σ   |     | w = w−η∇w       | where,                |     |
∂L(w)
w
∇w =
| x   |     | ∂w  |     |     |
| --- | --- | --- | --- | --- |
= (f(x)−y)∗f(x)∗(1−f(x))∗x
y
|       | What | about a wider  | network with more | inputs: |
| ----- | ---- | -------------- | ----------------- | ------- |
| σ     |      | w 1 = w 1 −η∇w | 1                 |         |
|       |      | w = w −η∇w     |                   |         |
| w w w |      | 2 2            | 2                 |         |
1 2 3
|     |     | w = w −η∇w |     |     |
| --- | --- | ---------- | --- | --- |
|     |     | 3 3        | 3   |     |
x 2 x 1 x 3
where,∇w = (f(x)−y)∗f(x)∗(1−f(x))∗x
|     |     | i   |     | i   |
| --- | --- | --- | --- | --- |
3/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | -------------- | --------------------- | -------- | --- |

y
|     |     | What  | if we   | have      | a deeper | network    |       | ?       |        |
| --- | --- | ----- | ------- | --------- | -------- | ---------- | ----- | ------- | ------ |
|     |     | We    | can now | calculate |          | ∇w 1 using | chain | rule:   |        |
|     |     | ∂L(w) |         | ∂L(w)     |          |            |       |         |        |
| σ   |     |       |         |           | ∂y       | ∂a 3       | ∂h 2  | ∂a 2 ∂h | 1 ∂a 1 |
|     |     |       | =       |           | .        | .          | . .   | .       | .      |
a
| 3   |     | ∂w  | 1   | ∂y  | ∂a  | 3 ∂h 2 | ∂a 2 | ∂h 1 ∂a | 1 ∂w 1 |
| --- | --- | --- | --- | --- | --- | ------ | ---- | ------- | ------ |
∂L(w)
w 3 h
| 2   |     |     | =   |     | ∗...............∗h |     |     |     |     |
| --- | --- | --- | --- | --- | ------------------ | --- | --- | --- | --- |
|     |     |     |     | ∂y  |                    |     |     | 0   |     |
σ
a
2
| w   |     | In general, |     |     |     |     |     |     |     |
| --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- |
2
h
1
| σ   |     |     |     | ∂L(w) |     |                    |     |     |     |
| --- | --- | --- | --- | ----- | --- | ------------------ | --- | --- | --- |
| a   |     |     | ∇w  | i =   |     | ∗...............∗h |     | i−1 |     |
| 1   |     |     |     |       | ∂y  |                    |     |     |     |
w
1
|     |     | Noticethat∇w |     |     | isproportionaltothecorrespond- |     |     |     |     |
| --- | --- | ------------ | --- | --- | ------------------------------ | --- | --- | --- | --- |
i
x = h
| 0   |     | ing | input h | (we | will | use this | fact | later) |     |
| --- | --- | --- | ------- | --- | ---- | -------- | ---- | ------ | --- |
i−1
| a = w h ;h = σ(a | )   |     |     |     |     |     |     |     |     |
| ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| i i i−1 i i      |     |     |     |     |     |     |     |     |     |
a = w ∗x = w ∗h
| 1 1 1 0 |     |     |     |     |     |     |     |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
4/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture9 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

y
|     | What | happens if we have | a network which | is deep |
| --- | ---- | ------------------ | --------------- | ------- |
|     | and  | wide?              |                 |         |
σ
|     | How | do you calculate | ∇w =? |     |
| --- | --- | ---------------- | ----- | --- |
2
| σ   | It will | be given by chain | rule applied across | mul- |
| --- | ------- | ----------------- | ------------------- | ---- |
tiplepaths(Wesawthisindetailwhenwestudied
|     | back | propagation) |     |     |
| --- | ---- | ------------ | --- | --- |
σ σ σ
σ σ σ
w w w
1 2 3
x x x
1 2 3
5/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | -------------- | --------------------- | -------- | --- |

Things to remember
Training Neural Networks is a Game of Gradients (played using any of the
| existing gradient | based approaches | that we discussed) |     |
| ----------------- | ---------------- | ------------------ | --- |
The gradient tells us the responsibility of a parameter towards the loss
The gradient w.r.t. a parameter is proportional to the input to the parameters
(recall the “.....∗x” term or the “....∗h i ” term in the formula for ∇w i )
6/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

y
σ
σ
|         |     | Backpropagation |      |          | was made | popular    |      |
| ------- | --- | --------------- | ---- | -------- | -------- | ---------- | ---- |
|         |     | by Rumelhart    |      | et.al    | in 1986  |            |      |
| σ       | σ σ |                 |      |          |          |            |      |
|         |     | However         | when | used     | for      | really     | deep |
|         |     | networks        | it   | was not  | very     | successful |      |
| σ       | σ σ |                 |      |          |          |            |      |
| w 1 w 2 | w 3 | In fact,        | till | 2006 it  | was very | hard       | to   |
| x       | x x | train very      | deep | networks |          |            |      |
| 1       | 2 3 |                 |      |          |          |            |      |
|         |     | Typically,      | even | after    | a large  | number     |      |
|         |     | of epochs       | the  | training | did      | not        | con- |
verge
7/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

| Module | 9.2 : Unsupervised | pre-training |     |
| ------ | ------------------ | ------------ | --- |
8/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

What has changed now? How did Deep Learning become so popular despite
| this problem | with training | large networks?   |     |     |     |
| ------------ | ------------- | ----------------- | --- | --- | --- |
| Well, until  | 2006 it       | wasn’t so popular |     |     |     |
The field got revived after the seminal work of Hinton and Salakhutdinov in
2006
1G.
E. Hinton and R. R. Salakhutdinov. Reducing the dimensionality of data with neural
| networks. Science, | 313(5786):504–507, | July 2006.     |                       |          | 9/1 |
| ------------------ | ------------------ | -------------- | --------------------- | -------- | --- |
|                    |                    | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |

Let’s look at the idea of unsupervised pre-training introduced in this paper ...
(note that in this paper they introduced the idea in the context of RBMs but we
| will discuss | it in the | context of Autoencoders) |     |
| ------------ | --------- | ------------------------ | --- |
10/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

|             |     |     | Consider    | the      | deep      | neural | network   |
| ----------- | --- | --- | ----------- | -------- | --------- | ------ | --------- |
|             |     |     | shown       | in this  | figure    |        |           |
| reconstruct | x   |     | Let us      | focus on | the first | two    | layers of |
|             |     |     | the network | (x       | and h     | )      |           |
1
|     |     | xˆ  | We will | first | train | the | weights |
| --- | --- | --- | ------- | ----- | ----- | --- | ------- |
betweenthesetwolayersusinganun-
|     |     | h   | supervised | objective |     |     |     |
| --- | --- | --- | ---------- | --------- | --- | --- | --- |
1
Notethatwearetryingtoreconstruct
|     |     | x   | the input | (x)  | from the | hidden | repres- |
| --- | --- | --- | --------- | ---- | -------- | ------ | ------- |
|     |     |     | entation  | (h ) |          |        |         |
1
1 m n
| (cid:88)(cid:88) |        | )2  | We refer  | to this | as  | an unsupervised |         |
| ---------------- | ------ | --- | --------- | ------- | --- | --------------- | ------- |
| min              | (xˆ −x |     |           |         |     |                 |         |
| m                | ij     | ij  |           |         |     |                 |         |
|                  |        |     | objective | because | it  | does not        | involve |
i=1 j=1
theoutputlabel(y)andonlyusesthe
|     |     |     | input | data (x) |     |     |     |
| --- | --- | --- | ----- | -------- | --- | --- | --- |
11/1
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     |     |     |     | At the   | end of | this     | step, the      | weights  |
| --- | --- | --- | --- | -------- | ------ | -------- | -------------- | -------- |
|     |     |     |     | in layer | 1 are  | trained  | such           | that h 1 |
|     |     |     |     | captures | an     | abstract | representation |          |
hˆ
1
|     |     |     |     | of the | input x |         |          |       |
| --- | --- | --- | --- | ------ | ------- | ------- | -------- | ----- |
|     |     |     |     | We now | fix the | weights | in layer | 1 and |
h 2
|     |     |     |     | repeat              | the same | process | with         | layer 2 |
| --- | --- | --- | --- | ------------------- | -------- | ------- | ------------ | ------- |
|     |     |     | h   | Attheendofthisstep, |          |         | theweightsin |         |
1
|     |     |     |     | layer | 2 are trained |     | such that | h cap- |
| --- | --- | --- | --- | ----- | ------------- | --- | --------- | ------ |
2
|     |     |     | x   | tures | anabstract | representation |     | ofh |
| --- | --- | --- | --- | ----- | ---------- | -------------- | --- | --- |
1
|     |                    |        |     | We continue                        |                 | this process | till            | the last |
| --- | ------------------ | ------ | --- | ---------------------------------- | --------------- | ------------ | --------------- | -------- |
|     | m                  | n      |     |                                    |                 |              |                 |          |
|     | 1 (cid:88)(cid:88) |        |     | hiddenlayer(i.e.,thelayerbeforethe |                 |              |                 |          |
| min |                    | (hˆ −h | )2  |                                    |                 |              |                 |          |
|     |                    | 1ij    | 1ij |                                    |                 |              |                 |          |
|     | m                  |        |     | output                             | layer)          | so that      | each successive |          |
|     | i=1                | j=1    |     |                                    |                 |              |                 |          |
|     |                    |        |     | layer                              | captures        | an abstract  | represent-      |          |
|     |                    |        |     | ation                              | of the previous |              | layer           |          |
12/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     |     | After this    | layerwise |       | pre-training, | we        |
| --- | --- | ------------- | --------- | ----- | ------------- | --------- |
|     |     | add the       | output    | layer | and           | train the |
|     |     | whole network |           | using | the task      | specific  |
objective
|     |     | Note that, | in      | effect | we have     | initial- |
| --- | --- | ---------- | ------- | ------ | ----------- | -------- |
|     |     | ized the   | weights | of     | the network | us-      |
ingthegreedyunsupervisedobjective
|     |     | andare    | now finetuning |     | theseweights |     |
| --- | --- | --------- | -------------- | --- | ------------ | --- |
| x x | x   |           |                |     |              |     |
| 1 2 | 3   | using the | supervised     |     | objective    |     |
m
1 (cid:88)
| min (y | −f(x ))2 |     |     |     |     |     |
| ------ | -------- | --- | --- | --- | --- | --- |
| i      | i        |     |     |     |     |     |
θ m
i=1
13/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |
| --- | -------------- | --------------------- | --- | -------- | --- | --- |

Why does this work better?
Is it because of better optimization?
Is it because of better regularization?
Let’s see what these two questions mean and try to answer them based on some
(among many) existing studies1,2
1The difficulty of training deep architectures and effect of unsupervised pre-training - Erhan et
al,2009
2Exploring Strategies for Training Deep Neural Networks, Larocelle et al,2009 14/1
MiteshM.Khapra CS7015(DeepLearning): Lecture9

Why does this work better?
Is it because of better optimization?
Is it because of better regularization?
15/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

What is the optimization problem that we are trying to solve?
m
1
|     |     |          | L(θ) | (cid:88) |         | ))2 |
| --- | --- | -------- | ---- | -------- | ------- | --- |
|     |     | minimize |      | =        | (y −f(x |     |
|     |     |          |      | m        | i       | i   |
i=1
Is it the case that in the absence of unsupervised pre-training we are not able
to drive L(θ) to 0 even for the training data (hence poor optimization) ?
| Let us | see this in | more detail | ... |     |     |     |
| ------ | ----------- | ----------- | --- | --- | --- | --- |
16/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

|     | The       | error | surface    | of          | the supervised |         |
| --- | --------- | ----- | ---------- | ----------- | -------------- | ------- |
|     | objective |       | of a       | Deep Neural |                | Network |
|     | is highly |       | non-convex |             |                |         |
Withmanyhillsandplateausandval-
leys
|     | Given    | that       | large     | capacity | of       | DNNs it |
| --- | -------- | ---------- | --------- | -------- | -------- | ------- |
|     | is still | easy       | to        | land in  | one of   | these 0 |
|     | error    | regions    |           |          |          |         |
|     | Indeed   | Larochelle |           | et.al.1  | show     | that if |
|     | the      | last       | layer has | large    | capacity | then    |
L(θ)
|     |     | goes | to  | 0 even | without | pre- |
| --- | --- | ---- | --- | ------ | ------- | ---- |
training
|     | However, |     | if the | capacity     | of  | the net- |
| --- | -------- | --- | ------ | ------------ | --- | -------- |
|     | work     | is  | small, | unsupervised |     | pre-     |
|     | training |     | helps  |              |     |          |
1Exploring Strategies for Training Deep Neural Networks, Larocelle et al,2009 17/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- | --- |

Why does this work better?
Is it because of better optimization?
Is it because of better regularization?
18/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

|     | What does           | regularization | do?          | It con- |
| --- | ------------------- | -------------- | ------------ | ------- |
|     | strains             | the weights    | to certain   | regions |
|     | of the parameter    |                | space        |         |
|     | L-1 regularization: |                | constrains   | most    |
|     | weights             | to be 0        |              |         |
|     | L-2 regularization: |                | prevents     | most    |
|     | weights             | from taking    | large values |         |
1Image
Source:The Elements of Statistical Learning-T. Hastie, R. Tibshirani, and J. Friedman,
Pg 71 19/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

| Unsupervised | objective: |     |     | Indeed,          | pre-training |         | constrains | the     |
| ------------ | ---------- | --- | --- | ---------------- | ------------ | ------- | ---------- | ------- |
|              |            |     |     | weights          | to lie       | in only | certain    | regions |
|              |            |     |     | of the parameter |              | space   |            |         |
1 m n
(cid:88)(cid:88)
| Ω(θ) | =   | (x −xˆ | )2  | Specifically, |         | it constrains | the | weights    |
| ---- | --- | ------ | --- | ------------- | ------- | ------------- | --- | ---------- |
|      | m   | ij ij  |     |               |         |               |     |            |
|      | i=1 | j=1    |     | to lie in     | regions | where         | the | character- |
isticsofthedataarecapturedwell(as
Wecanthinkofthisunsupervisedob-
|            |               |            |     | governed | by  | the unsupervised |     | object- |
| ---------- | ------------- | ---------- | --- | -------- | --- | ---------------- | --- | ------- |
| jective as | an additional | constraint | on  |          |     |                  |     |         |
ive)
| the optimization | problem    |     |     |                                     |                |          |           |            |
| ---------------- | ---------- | --- | --- | ----------------------------------- | -------------- | -------- | --------- | ---------- |
|                  |            |     |     | This unsupervised                   |                |          | objective | ensures    |
| Supervised       | objective: |     |     |                                     |                |          |           |            |
|                  |            |     |     | that that                           | the            | learning | is        | not greedy |
|                  |            |     |     | w.r.t.                              | the supervised |          | objective | (and       |
|                  | m          |     |     | alsosatisfiestheunsupervisedobject- |                |          |           |            |
1 (cid:88)
| L(θ) | =   | (y −f(x ))2 |     |      |     |     |     |     |
| ---- | --- | ----------- | --- | ---- | --- | --- | --- | --- |
|      |     | i i         |     | ive) |     |     |     |     |
m
i=1
20/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

|     | Some other     | experiments     | have also       |
| --- | -------------- | --------------- | --------------- |
|     | shown that     | pre-training    | is more ro-     |
|     | bust to random | initializations |                 |
|     | One accepted   | hypothesis      | is that pre-    |
|     | training       | leads to better | weight ini-     |
|     | tializations   | (so that        | the layers cap- |
turetheinternalcharacteristicsofthe
data)
1The
difficulty of training deep architectures and effect of unsupervised pre-training - Erhan et
al,2009 21/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

| So what | has happened since | 2006-2009? |     |
| ------- | ------------------ | ---------- | --- |
22/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |
| -------------- | --------------------- | --- | -------- |

| Deep Learning         | has evolved    |            |     |     |
| --------------------- | -------------- | ---------- | --- | --- |
| Better optimization   | algorithms     |            |     |     |
| Better regularization | methods        |            |     |     |
| Better activation     | functions      |            |     |     |
| Better weight         | initialization | strategies |     |     |
23/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --- | --------------------- | -------- |

| Module | 9.3 : Better | activation | functions |
| ------ | ------------ | ---------- | --------- |
24/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

| Deep Learning         | has evolved    |            |     |     |
| --------------------- | -------------- | ---------- | --- | --- |
| Better optimization   | algorithms     |            |     |     |
| Better regularization | methods        |            |     |     |
| Better activation     | functions      |            |     |     |
| Better weight         | initialization | strategies |     |     |
25/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --- | --------------------- | -------- |

Beforewelookatactivationfunctions,let’strytoanswerthefollowingquestion:
| “What makes | Deep Neural | Networks | powerful ?” |     |
| ----------- | ----------- | -------- | ----------- | --- |
26/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --- | --------------------- | -------- |

| y   |     |     | Consider   | this  | deep neural | network     |        |
| --- | --- | --- | ---------- | ----- | ----------- | ----------- | ------ |
|     |     |     | Imagine    | if we | replace     | the sigmoid | in     |
| σ   |     |     | each layer | by    | a simple    | linear      | trans- |
a
w 3
| 3   |     |     | formation |     |     |     |     |
| --- | --- | --- | --------- | --- | --- | --- | --- |
h
σ 2
a
2
| w   |     |     | y = | (w ∗(w | ∗(w | ∗(w x)))) |     |
| --- | --- | --- | --- | ------ | --- | --------- | --- |
| 2   |     |     |     | 4      | 3   | 2 1       |     |
h
σ 1
a
1
w
1
|     |     |     | Then we        | will | just learn | y as a | linear |
| --- | --- | --- | -------------- | ---- | ---------- | ------ | ------ |
|     |     |     | transformation |      | of x       |        |        |
h = x
0
|     |     |     | In other    | words  | we will   | be constrained |     |
| --- | --- | --- | ----------- | ------ | --------- | -------------- | --- |
|     |     |     | to learning | linear | decision  | boundaries     |     |
|     |     |     | We cannot   | learn  | arbitrary | decision       |     |
boundaries
27/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

|     | In particular, | a deep       | linear neural |
| --- | -------------- | ------------ | ------------- |
|     | network        | cannot learn | such boundar- |
ies
|     | But a    | deep non linear | neural net- |
| --- | -------- | --------------- | ----------- |
|     | work can | indeed learn    | such bound- |
aries(recallUniversalApproximation
Theorem)
28/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

Now let’s look at some non-linear activation functions that are typically used in
deep neural networks (Much of this material is taken from Andrej Karpathy’s
lecture notes 1)
1http://cs231n.github.io 29/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

1
|     | σ(x) = |     |     |     |     |
| --- | ------ | --- | --- | --- | --- |
1+e−x
|     | As is obvious, | the     | sigmoid | function |       |
| --- | -------------- | ------- | ------- | -------- | ----- |
|     | compresses     | all its | inputs  | to the   | range |
[0,1]
|     | Since         | we are always | interested |          | in  |
| --- | ------------- | ------------- | ---------- | -------- | --- |
|     | gradients,    | let us find   | the        | gradient | of  |
|     | this function |               |            |          |     |
Sigmoid
∂σ(x)
= σ(x)(1−σ(x))
∂x
|     | (you can | easily derive | it) |     |     |
| --- | -------- | ------------- | --- | --- | --- |
Letusseewhathappensifweusesig-
|     | moid in | a deep network |     |     |     |
| --- | ------- | -------------- | --- | --- | --- |
30/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |     |
| -------------- | --------------------- | -------- | --- | --- | --- |

| h 4 |     |     | While calculating |     | ∇w  | at some | point |
| --- | --- | --- | ----------------- | --- | --- | ------- | ----- |
| σ   |     |     |                   |     |     | 2       |       |
a 4
|     |     |     | in the chain | rule | we will | encounter |     |
| --- | --- | --- | ------------ | ---- | ------- | --------- | --- |
h
σ 3
| a   |               |     | ∂h 3 | ∂σ(a 3 | )     |         |     |
| --- | ------------- | --- | ---- | ------ | ----- | ------- | --- |
| 3   |               |     | =    |        | = σ(a | )(1−σ(a | ))  |
|     | a 3 = w 2 h 2 |     |      |        |       | 3       | 3   |
|     |               |     | ∂a 3 | ∂a 3   |       |         |     |
| h   | h = σ(a )     |     |      |        |       |         |     |
| σ 2 | 3 3           |     |      |        |       |         |     |
a
| 2   |     |     | What is   | the consequence |          | of  | this ?   |
| --- | --- | --- | --------- | --------------- | -------- | --- | -------- |
| h 1 |     |     | To answer | this            | question | let | us first |
σ
a 1
|     |     |     | understand | the | concept | of saturated |     |
| --- | --- | --- | ---------- | --- | ------- | ------------ | --- |
|     |     |     | neuron     | ?   |         |              |     |
h = x
0
31/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

y
1
0.8
|     |     |     | A sigmoid | neuron is said | to have sat- |
| --- | --- | --- | --------- | -------------- | ------------ |
0.6
|     |     |     | urated     | when σ(x) = 1 | or σ(x) = 0  |
| --- | --- | --- | ---------- | ------------- | ------------ |
|     |     |     | What would | the gradient  | be at satur- |
0.4
ation?
Wellitwouldbe0(youcanseeitfrom
0.2
|     |     |     | the plot | or from the formula | that we |
| --- | --- | --- | -------- | ------------------- | ------- |
x derived)
| −2        | −1           | 1 2       |     |     |     |
| --------- | ------------ | --------- | --- | --- | --- |
| Saturated | neurons thus | cause the |     |     |     |
| gradient  | to vanish.   |           |     |     |     |
32/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Saturated | neurons    | thus cause | the |          |            |         |          |
| --------- | ---------- | ---------- | --- | -------- | ---------- | ------- | -------- |
| gradient  | to vanish. |            |     |          |            |         |          |
|           |            |            |     | But why  | would the  | neurons | saturate |
|           | w          | w w w      |     | ?        |            |         |          |
|           | 1          | 2 3        | 4   |          |            |         |          |
|           |            |            |     | Consider | what would | happen  | if we    |
usesigmoidneuronsandinitializethe
|     |     |     |     | weights | to very high | values ? |     |
| --- | --- | --- | --- | ------- | ------------ | -------- | --- |
(cid:80)4
|     | σ(  | w i x | i ) |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- |
i=1
|     |     |     |     | The neurons | will | saturate | very |
| --- | --- | --- | --- | ----------- | ---- | -------- | ---- |
quickly
1 y
|     |     | 0.8 |     | The gradients | will             | vanish  | and the |
| --- | --- | --- | --- | ------------- | ---------------- | ------- | ------- |
|     |     |     |     | training      | will stall (more | on this | later)  |
0.6
0.4
0.2
(cid:80)4
i=1wixi
|     | −2  | −1 1 | 2   |     |     |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- |
33/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| --- | --- | --- | -------------- | --------------------- | -------- | --- | --- |

| Saturated |     | neurons | cause the | gradient |     | Why is | this a problem?? |     |
| --------- | --- | ------- | --------- | -------- | --- | ------ | ---------------- | --- |
to vanish
y
| Sigmoids | are | not zero | centered |     |     |     |     |     |
| -------- | --- | -------- | -------- | --- | --- | --- | --- | --- |
Consider the gradient w.r.t. w and a 3 = w 1 ∗h 21 +w 2 ∗h 22
1
|     |     |           |     |     |     | w   | w   |     |
| --- | --- | --------- | --- | --- | --- | --- | --- | --- |
| w   |     |           |     |     |     | 1   | 2   |     |
| 2   |     | ∂L(w)∂y∂h |     |     |     |     |     |     |
∂a
|     | ∇w = |     | 3    | 3 h |     |     |     |     |
| --- | ---- | --- | ---- | --- | --- | --- | --- | --- |
|     | 1    |     |      | 21  |     | h 2 |     |     |
|     |      | ∂y  | h ∂a | ∂w  |     |     |     |     |
|     |      |     | 3 3  | 1   |     |     |     |     |
∂L(w)∂y∂h
∂a
|       | ∇w =         |            | 3          | 3 h       |     | h                                  |            |                  |
| ----- | ------------ | ---------- | ---------- | --------- | --- | ---------------------------------- | ---------- | ---------------- |
|       | 2            |            |            | 22        |     | 1                                  |            |                  |
|       |              | ∂y         | h 3 ∂a 3   | ∂w 2      |     |                                    |            |                  |
| Note  | that         | h and      | h are      | between   | h   | = x                                |            |                  |
|       |              | 21         | 22         |           |     | 0                                  |            |                  |
| [0,1] | (i.e.,       | they are   | both       | positive) |     |                                    |            |                  |
| So    | if the first | common     | term       | (in red)  |     |                                    |            |                  |
|       |              |            |            |           |     | Essentially,                       | either all | the gradients at |
| is    | positive     | (negative) | then       | both ∇w   |     |                                    |            |                  |
|       |              |            |            | 1         |     | alayerarepositiveorallthegradients |            |                  |
| and   | ∇w are       | positive   | (negative) |           |     |                                    |            |                  |
2
|     |     |     |     |     |     | at a layer | are negative |     |
| --- | --- | --- | --- | --- | --- | ---------- | ------------ | --- |
34/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

Saturated neurons cause the gradient Thisrestrictsthepossibleupdatedir-
| to vanish |              |          | ections |     |     |
| --------- | ------------ | -------- | ------- | --- | --- |
| Sigmoids  | are not zero | centered |         | ∇w  |     |
2
|     |     |     | (Not possible) | Quadrant      | in which |
| --- | --- | --- | -------------- | ------------- | -------- |
|     |     |     |                | all gradients | are      |
+ve
(Allowed)
∇w
1
Now imagine:
|     |     |     | Quadrant in | which |     |
| --- | --- | --- | ----------- | ----- | --- |
this is the
|     |     |     | all gradients | are |     |
| --- | --- | --- | ------------- | --- | --- |
optimal w
-ve
(Allowed)
|     |     |     |     | (Not possible) |     |
| --- | --- | --- | --- | -------------- | --- |
35/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Saturated | neurons cause | the gradient |     |     |
| --------- | ------------- | ------------ | --- | --- |
to vanish
| Sigmoids    | are not zero | centered   |     | ∇w 2 |
| ----------- | ------------ | ---------- | --- | ---- |
| And lastly, | sigmoids     | are compu- |     |      |
starting from this
| tationally | expensive | (because | of  | initial position |
| ---------- | --------- | -------- | --- | ---------------- |
only way to reach it
exp(x))
is by taking a zigzag path
∇w
1
36/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | --- | -------------- | --------------------- | -------- |

tanh(x) Compressesallitsinputstotherange
[-1,1]
1
| y   | Zero centered |                |               |
| --- | ------------- | -------------- | ------------- |
|     | What is       | the derivative | of this func- |
tion?
0.5
∂tanh(x)
(1−tanh2(x))
=
| x   | ∂x  |     |     |
| --- | --- | --- | --- |
0
−4 −2 2 4
|     | The gradient | still vanishes | at satura- |
| --- | ------------ | -------------- | ---------- |
−0.5 tion
|     | Also computationally |     | expensive |
| --- | -------------------- | --- | --------- |
−1
f(x) = tanh(x)
37/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

ReLU
|     | Is this a   | non-linear function? |            |
| --- | ----------- | -------------------- | ---------- |
|     | Indeed it   | is!                  |            |
|     | In fact     | we can combine       | two ReLU   |
|     | units to    | recover a piecewise  | linear ap- |
|     | proximation | of the sigmoid       | function   |
f(x) = max(0,x)
f(x) = max(0,x+1)−max(0,x−1)
38/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

ReLU
|     |     | Advantages of | ReLU        |              |     |
| --- | --- | ------------- | ----------- | ------------ | --- |
|     |     | Does not      | saturate in | the positive | re- |
gion
|     |     | Computationally    | efficient |             |     |
| --- | --- | ------------------ | --------- | ----------- | --- |
|     |     | In practice        | converges | much faster |     |
|     |     | than sigmoid/tanh1 |           |             |     |
f(x) = max(0,x)
1ImageNet
Classification with Deep Convolutional Neural Networks- Alex Krizhevsky Ilya
| Sutskever, Geoffrey | E. Hinton, 2012 |                       |          |     | 39/1 |
| ------------------- | --------------- | --------------------- | -------- | --- | ---- |
|                     | MiteshM.Khapra  | CS7015(DeepLearning): | Lecture9 |     |      |

|     |     |     |     | In practice | there    | is a caveat    |     |     |         |
| --- | --- | --- | --- | ----------- | -------- | -------------- | --- | --- | ------- |
|     | y   |     |     | Let’s see   | what is  | the derivative |     | of  | ReLU(x) |
|     | a   |     |     |             | ∂ReLU(x) |                |     |     |         |
2
|     |     | w 3 |     |     |     | =   | 0 if | x < | 0   |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- |
∂x
h 1
|     | a 1 |     |     |     |     | =   | 1 if | x > | 0   |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- |
w w
| 1   |     | 2 b |     | Now consider    | the    | given | network |            |         |
| --- | --- | --- | --- | --------------- | ------ | ----- | ------- | ---------- | ------- |
|     |     |     |     | What would      | happen | if    | at some | point      | a large |
| x   | x   | 1   |     |                 |        |       |         |            |         |
| 1   | 2   |     |     | gradient causes | the    | bias  | b to    | be updated | to a    |
|     |     |     |     | large negative  | value? |       |         |            |         |
40/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

|     |     |     |     | w x +w | x +b | <   | 0 [if | b << 0] |     |
| --- | --- | --- | --- | ------ | ---- | --- | ----- | ------- | --- |
|     |     |     |     | 1 1    | 2 2  |     |       |         |     |
y
|     |     |     | The | neuron | would | output     | 0 [dead | neuron] |        |
| --- | --- | --- | --- | ------ | ----- | ---------- | ------- | ------- | ------ |
|     |     |     | Not | only   | would | the output | be      | 0 but   | during |
∂h1
| a 2 |     |     | backpropagation |      |     | even | the gradient |     | would |
| --- | --- | --- | --------------- | ---- | --- | ---- | ------------ | --- | ----- |
| w   |     |     |                 |      |     |      |              | ∂a1 |       |
|     | 3   |     | be              | zero |     |      |              |     |       |
h
1
a
| 1       |     |     | Theweightsw |        | 1 ,w      | 2 andbwillnotgetupdated |         |           |       |
| ------- | --- | --- | ----------- | ------ | --------- | ----------------------- | ------- | --------- | ----- |
|         |     |     | [∵          | there  | will be a | zero                    | term in | the chain | rule] |
| w w     | b   |     |             |        |           |                         |         |           |       |
| 1       | 2   |     |             |        |           |                         |         |           |       |
|         |     |     |             |        | ∂L(θ)     | ∂y                      | ∂a      | ∂h ∂a     |       |
| x 1 x 2 | 1   |     |             |        |           |                         | 2       | 1         | 1     |
|         |     |     |             | ∇w     | 1 =       | .                       | . .     | .         |       |
|         |     |     |             |        | ∂y        | ∂a                      | ∂h      | ∂a ∂w     |       |
|         |     |     |             |        |           |                         | 2 1     | 1         | 1     |
|         |     |     | The         | neuron | will      | now stay                | dead    | forever!! |       |
41/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

y
|     |     | In practice | a large | fraction of | ReLU |
| --- | --- | ----------- | ------- | ----------- | ---- |
unitscandieifthelearningrateisset
a
2
|     | w   | too high |     |     |     |
| --- | --- | -------- | --- | --- | --- |
3
h
| 1   |     | It is advised | to initialize | the bias | to a |
| --- | --- | ------------- | ------------- | -------- | ---- |
a
1
|       |     | positive  | value (0.01) |         |        |
| ----- | --- | --------- | ------------ | ------- | ------ |
| w 1 w | 2 b | Use other | variants     | of ReLU | (as we |
|       |     | will soon | see)         |         |        |
x x
| 1 2 | 1   |     |     |     |     |
| --- | --- | --- | --- | --- | --- |
42/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| --- | -------------- | --------------------- | -------- | --- | --- |

No saturation
Leaky ReLU
|     | Will | not die (0.01x         | ensures that |
| --- | ---- | ---------------------- | ------------ |
|     | at   | least a small gradient | will flow    |
y
through)
|     | Computationally | efficient        |        |
| --- | --------------- | ---------------- | ------ |
|     | Close           | to zero centered | ouputs |
x
Parametric ReLU
f(x) = max(αx,x)
|     |        | α is a parameter   | of the model    |
| --- | ------ | ------------------ | --------------- |
|     | α will | get updated during | backpropagation |
f(x) = max(0.01x,x)
43/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

Exponential Linear Unit
y
|     | All benefits | of ReLU |     |
| --- | ------------ | ------- | --- |
x
|     | aex −1    | ensures that at least | a small |
| --- | --------- | --------------------- | ------- |
|     | gradient  | will flow through     |         |
|     | Close to  | zero centered outputs |         |
|     | Expensive | (requires computation | of      |
exp(x))
f(x) = x if x > 0
aex−1
= if x ≤ 0
44/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

Maxout Neuron
|           |        | Generalizes    | ReLU and | Leaky ReLU |
| --------- | ------ | -------------- | -------- | ---------- |
| max(wTx+b | ,wTx+b | No saturation! | No       | death!     |
)
| 1   | 1 2 2 |         |            |               |
| --- | ----- | ------- | ---------- | ------------- |
|     |       | Doubles | the number | of parameters |
45/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | -------------- | --------------------- | -------- | --- |

Things to Remember
Sigmoids are bad
ReLU is more or less the standard unit for Convolutional Neural Networks
Can explore Leaky ReLU/Maxout/ELU
tanh sigmoids are still used in LSTMs/RNNs (we will see more on this later)
46/1
MiteshM.Khapra CS7015(DeepLearning): Lecture9

| Module | 9.4 : Better | initialization | strategies |
| ------ | ------------ | -------------- | ---------- |
47/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

| Deep Learning         | has evolved    |            |     |     |
| --------------------- | -------------- | ---------- | --- | --- |
| Better optimization   | algorithms     |            |     |     |
| Better regularization | methods        |            |     |     |
| Better activation     | functions      |            |     |     |
| Better weight         | initialization | strategies |     |     |
48/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --- | --------------------- | -------- |

y
|     |     |     | What    |     | happens | if  | we initialize | all |
| --- | --- | --- | ------- | --- | ------- | --- | ------------- | --- |
|     | h21 |     | weights |     | to 0?   |     |               |     |
σ
|         | a21 |     | All  | neurons    |      | in layer | 1 will | get the |
| ------- | --- | --- | ---- | ---------- | ---- | -------- | ------ | ------- |
| h11 h12 |     | h13 | same | activation |      |          |        |         |
| σ       | σ   | σ   |      |            |      |          |        |         |
| a11 a12 |     | a13 |      |            |      |          |        |         |
|         |     |     | Now  | what       | will | happen   | during | back    |
propagation?
| x   | x   |     |     |     |     |       |     |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- |
| 1   | 2   |     |     |     |     |       |     |     |
|     |     |     |     |     |     | ∂L(w) | ∂y  | ∂h  |
11
|       |      |      |     | ∇w   | =      |       | .   | . .x |
| ----- | ---- | ---- | --- | ---- | ------ | ----- | --- | ---- |
| a =   | w x  | +w x |     |      | 11     | ∂y    | ∂h  | ∂a 1 |
| 11    | 11 1 | 12 2 |     |      |        |       | 11  | 11   |
|       |      |      |     |      |        | ∂L(w) | ∂y  | ∂h   |
| a =   | w x  | +w x |     |      |        |       |     | 12   |
| 12    | 21 1 | 22 2 |     | ∇w   | =      |       | .   | . .x |
|       |      |      |     |      | 21     | ∂y    | ∂h  | ∂a 1 |
| ∴ a = | a =  | 0    |     |      |        |       | 12  | 12   |
| 11    | 12   |      |     |      |        |       |     |      |
|       |      |      |     | but  | h =    | h     |     |      |
| ∴ h = | h    |      |     |      | 11     | 12    |     |      |
| 11    | 12   |      |     |      |        |       |     |      |
|       |      |      |     | and  | a 12 = | a 12  |     |      |
|       |      |      |     | ∴ ∇w | =      | ∇w    |     |      |
|       |      |      |     |      | 11     | 21    |     |      |
49/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |        |          | Lecture9   |       |         |
| --- | --- | -------------- | --------------------- | ------ | -------- | ---------- | ----- | ------- |
|     |     |                | Hence                 |        | both the | weights    | will  | get the |
|     |     |                | same                  | update |          | and remain | equal |         |
Infactthissymmetrywillneverbreak
|     |     |     | during |      | training    |     |          |            |
| --- | --- | --- | ------ | ---- | ----------- | --- | -------- | ---------- |
|     |     |     | The    | same | is true     | for | w and    | w          |
|     |     |     |        |      |             |     | 12       | 22         |
|     |     |     | And    | for  | all weights |     | in layer | 2 (infact, |
workoutthemathandconvinceyour-
|     |     |     | self     | that    | all the | weights     | in           | this layer |
| --- | --- | --- | -------- | ------- | ------- | ----------- | ------------ | ---------- |
|     |     |     | will     | remain  | equal   | )           |              |            |
|     |     |     | This     | is      | known   | as          | the symmetry |            |
|     |     |     | breaking |         | problem |             |              |            |
|     |     |     | This     | will    | happen  | if          | all the      | weights in |
|     |     |     | a        | network | are     | initialized | to           | the same   |
value

|     | We will now   | consider      | a feedforward |       |
| --- | ------------- | ------------- | ------------- | ----- |
|     | network with: |               |               |       |
|     | input:        | 1000 points,  | each ∈ R500   |       |
|     | input         | data is drawn | from unit     | Gaus- |
sian
0.4
0.3
0.2
0.1
|     | −3 −2       | −1 0 1 2      | 3           |     |
| --- | ----------- | ------------- | ----------- | --- |
|     | the network | has           | 5 layers    |     |
|     | each        | layer has 500 | neurons     |     |
|     | we will     | run forward   | propagation | on  |
thisnetworkwithdifferentweightini-
tializations
50/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

|     | Let’s try    | to initialize    | the weights to |
| --- | ------------ | ---------------- | -------------- |
|     | small random | numbers          |                |
|     | We will      | see what happens | to the ac-     |
|     | tivation     | across different | layers         |
tanh activation functions
51/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |
sigmoid activation functions

|     | What | will happen | during | back |
| --- | ---- | ----------- | ------ | ---- |
propagation?
|     | Recall | that ∇w | is proportional | to  |
| --- | ------ | ------- | --------------- | --- |
1
|     | the activation | passing      | through         | it        |
| --- | -------------- | ------------ | --------------- | --------- |
|     | If all the     | activations  | in a            | layer are |
|     | very close     | to 0, what   | will happen     | to        |
|     | the gradient   | of the       | weights         | connect-  |
|     | ing this       | layer to the | next layer?     |           |
|     | They will      | all be close | to 0 (vanishing |           |
|     | gradient       | problem)     |                 |           |
52/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

|     | Let us           | try to initialize | the weights | to  |
| --- | ---------------- | ----------------- | ----------- | --- |
|     | large random     | numbers           |             |     |
|     | Most activations | have              | saturated   |     |
Whathappenstothegradientsatsat-
uration?
|     | They will | all be close | to 0 (vanishing |     |
| --- | --------- | ------------ | --------------- | --- |
|     | gradient  | problem)     |                 |     |
sigmoid activations with large weights
53/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| -------------- | --------------------- | -------- | --- | --- |
tanh activation with large weights

|     |     |     |     |     |     | Let | us  | try to       | arrive  | at a more | principled |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | ------- | --------- | ---------- |
|     |     |     |     |     |     | way | of  | initializing | weights |           |            |
n
(cid:88)
| s 11 |     |     |     |     | s 1n |     | s = | w   | x   |     |     |
| ---- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
|      |     |     |     |     |      |     | 11  | 1i  | i   |     |     |
i=1
|     |     |     |     |     |     |       |     |          | n   | n           |      |
| --- | --- | --- | --- | --- | --- | ----- | --- | -------- | --- | ----------- | ---- |
|     |     |     |     |     |     |       |     | (cid:88) |     | (cid:88)    |      |
|     |     |     |     |     |     | Var(s | ) = | Var(     | w   | x ) = Var(w | x )  |
|     | x   | x x |     | x   |     |       | 11  |          | 1i  | i           | 1i i |
|     | 1   | 2 3 |     |     | n   |       |     |          |     |             |      |
|     |     |     |     |     |     |       |     | i=1      |     | i=1         |      |
n
(cid:88)(cid:2)
|     |     |     |     |     |     |     | =   | (E[w | ])2Var(x | )   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | -------- | --- | --- |
|     |     |     |     |     |     |     |     |      | 1i       | i   |     |
i=1
(cid:3)
|     |           |        |        |     |     |     | +(E[x | ])2Var(w |     | )+Var(x | )Var(w ) |
| --- | --------- | ------ | ------ | --- | --- | --- | ----- | -------- | --- | ------- | -------- |
|     | [Assuming | 0 Mean | inputs | and |     |     |       | i        |     | 1i      | i 1i     |
n
|     | weights]  |               |              |     |     |     |     | (cid:88)          |        |     |     |
| --- | --------- | ------------- | ------------ | --- | --- | --- | --- | ----------------- | ------ | --- | --- |
|     |           |               |              |     |     |     | =   | Var(x             | )Var(w | )   |     |
|     |           |               |              |     |     |     |     |                   | i      | 1i  |     |
|     | [Assuming | Var(x i       | ) = Var(x)∀i |     | ]   |     |     | i=1               |        |     |     |
|     | [Assuming |               |              |     |     |     | =   | (nVar(w))(Var(x)) |        |     |     |
|     | Var(w 1i  | ) = Var(w)∀i] |              |     |     |     |     |                   |        |     |     |
54/1
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     |     | Lecture9 |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --- | -------- | --- | --- |

In general,
| s 11 |     | s 1n |       |                       |     |
| ---- | --- | ---- | ----- | --------------------- | --- |
|      |     |      | Var(S | ) = (nVar(w))(Var(x)) |     |
1i
|     |     |     | What would   | happen    | if nVar(w) (cid:29) 1 |
| --- | --- | --- | ------------ | --------- | --------------------- |
| x x | x   | x   | ?            |           |                       |
| 1 2 | 3   | n   |              |           |                       |
|     |     |     | The variance | of S will | be large              |
1i
|     |     |     | WhatwouldhappenifnVar(w) |           | → 0?     |
| --- | --- | --- | ------------------------ | --------- | -------- |
|     |     |     | The variance             | of S will | be small |
1i
55/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

Letusseewhathappensifweaddone
|     |     |     |     |     |     |     | more  | layer |      |           |          |
| --- | --- | --- | --- | --- | --- | --- | ----- | ----- | ---- | --------- | -------- |
|     |     |     |     |     |     |     | Using | the   | same | procedure | as above |
s 21
|     |     |     |     |     |     |     | we    | will | arrive   | at           |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | ---- | -------- | ------------ | --- |
| s   |     |     |     |     |     | s   |       |      | n        |              |     |
| 11  |     |     |     |     |     | 1n  |       |      | (cid:88) |              |     |
|     |     |     |     |     |     |     | Var(s |      | ) =      | Var(s )Var(w | )   |
|     |     |     |     |     |     |     |       | 21   |          | 1i           | 2i  |
i=1
|     | x     | x   | x        |         | x   |     |       | =   | nVar(s  | )Var(w    | )        |
| --- | ----- | --- | -------- | ------- | --- | --- | ----- | --- | ------- | --------- | -------- |
|     | 1     | 2   | 3        |         |     | n   |       |     |         | 1i        | 2        |
|     | Var(S | )   | = nVar(w | )Var(x) |     |     |       |     |         |           |          |
|     |       | i1  |          | 1       |     |     | Var(s | ) ∝ | [nVar(w | )][nVar(w | )]Var(x) |
|     |       |     |          |         |     |     | 21    |     |         | 2         | 1        |
∝ [nVar(w)]2Var(x)
|     |     |     |     |     |     |     | Assuming |      | weights  | across all | layers |
| --- | --- | --- | --- | --- | --- | --- | -------- | ---- | -------- | ---------- | ------ |
|     |     |     |     |     |     |     |          | have | the same | variance   |        |
56/1
|     |     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     |     | Lecture9 |     |
| --- | --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --- | -------- | --- |

In general,
|     |     | Var(s ) = | [nVar(w)]kVar(x) |     |
| --- | --- | --------- | ---------------- | --- |
ki
|     | To ensure  | that variance | in the output | of any   |
| --- | ---------- | ------------- | ------------- | -------- |
|     | layer does | not blow      | up or shrink  | we want: |
Var(az) = a2(Var(z))
|     |            | nVar(w)     | = 1              |          |
| --- | ---------- | ----------- | ---------------- | -------- |
|     | If we draw | the weights | from a unit      | Gaussian |
|     | and scale  | them by     | √1 then, we have | :        |
n
z
|     | nVar(w) | = nVar(√ | )   |     |
| --- | ------- | -------- | --- | --- |
n
1
|     |     | = n ∗ | Var(z) = 1 ← | (UnitGaussian) |
| --- | --- | ----- | ------------ | -------------- |
n
57/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |
| -------------- | --------------------- | --- | -------- | --- |

|     | Let’s see | what happens | if we use this |
| --- | --------- | ------------ | -------------- |
initialization
sigmoid activations
58/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |
tanh activation

HoweverthisdoesnotworkforReLU
neurons
|     | Why ?       |              |                   |     |
| --- | ----------- | ------------ | ----------------- | --- |
|     | Intuition:  | He et.al.    | argue that        | a   |
|     | factor of   | 2 is needed  | when dealing      |     |
|     | with ReLU   | Neurons      |                   |     |
|     | Intuitively | this happens | because           | the |
|     | range of    | ReLU neurons | is restricted     |     |
|     | only to     | the positive | half of the space |     |
59/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

|     | Indeed    | when we account | for this    |
| --- | --------- | --------------- | ----------- |
|     | factor of | 2 we see better | performance |
60/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |     |
| -------------- | --------------------- | -------- | --- |

| Module | 9.5 : Batch | Normalization |     |
| ------ | ----------- | ------------- | --- |
61/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | -------------- | --------------------- | -------- |

We will now see a method called batch normalization which allows us to be less
| careful about | initialization |     |
| ------------- | -------------- | --- |
62/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

|     |     | To understand | the intuition   | behind | Batch   | Nor- |
| --- | --- | ------------- | --------------- | ------ | ------- | ---- |
|     |     | malization    | let us consider | a deep | network |      |
h4
Letusfocusonthelearningprocessfortheweights
|     |     | between | these two layers |     |     |     |
| --- | --- | ------- | ---------------- | --- | --- | --- |
h3
|     |     | Typically  | we use mini-batch | algorithms    |          |        |
| --- | --- | ---------- | ----------------- | ------------- | -------- | ------ |
|     |     | What would | happen            | if there is a | constant | change |
h2
|     |     | in the distribution | of  | h   |     |     |
| --- | --- | ------------------- | --- | --- | --- | --- |
3
| h1  |     | In other | words what       | would happen | if across | mini- |
| --- | --- | -------- | ---------------- | ------------ | --------- | ----- |
|     |     | batches  | the distribution | of h keeps   | changing  |       |
3
| h0  |     | Would | the learning process | be easy | or hard? |     |
| --- | --- | ----- | -------------------- | ------- | -------- | --- |
x x x
1 2 3
63/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture9 |     |     |
| --- | -------------- | --- | --------------------- | -------- | --- | --- |

|     | It would           | help if    | the pre-activations | at each          | layer |
| --- | ------------------ | ---------- | ------------------- | ---------------- | ----- |
|     | were unit          | gaussians  |                     |                  |       |
|     | Why not            | explicitly | ensure this         | by standardizing |       |
|     | the pre-activation |            | ?                   |                  |       |
|     |                    |            | sˆ = s√ik −E[s      | ik ]             |       |
ik
|     |     |     | var(s | )   |     |
| --- | --- | --- | ----- | --- | --- |
ik
|     | But how       | do we compute  | E[s          | ik ] and Var[s ik | ]?      |
| --- | ------------- | -------------- | ------------ | ----------------- | ------- |
|     | We compute    | it from        | a mini-batch |                   |         |
|     | Thus we       | are explicitly | ensuring     | that the          | distri- |
|     | bution of     | the inputs     | at different | layers does       | not     |
|     | change across | batches        |              |                   |         |
64/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture9 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

|     | This         | is what       | the deep  | network       | will     | look like | with    |
| --- | ------------ | ------------- | --------- | ------------- | -------- | --------- | ------- |
|     | Batch        | Normalization |           |               |          |           |         |
|     | Is this      | legal         | ?         |               |          |           |         |
|     | Yes,         | it is         | because   | just as       | the tanh | layer     | is dif- |
|     | ferentiable, |               | the Batch | Normalization |          | layer     | is also |
differentiable
|     | Hence | we  | can backpropagate |     | through | this | layer |
| --- | ----- | --- | ----------------- | --- | ------- | ---- | ----- |
65/1
| MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture9 |     |     |
| -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

|     | Catch:   | Do        | we necessarily |         | want    | to force | a unit   |
| --- | -------- | --------- | -------------- | ------- | ------- | -------- | -------- |
|     | gaussian | input     | to the         | tanh    | layer?  |          |          |
|     | Why      | not let   | the network    | learn   | what    | is best  | for it?  |
|     | After    | the Batch | Normalization  |         |         | step add | the fol- |
|     | lowing   | step:     |                |         |         |          |          |
|     |          |           | y(k)           | γksˆ    | +β(k)   |          |          |
|     |          |           |                | = ik    |         |          |          |
|     | What     | happens   | if the         | network | learns: |          |          |
(cid:112)
|     |     |              | γk  | = var(xk) |     |     |     |
| --- | --- | ------------ | --- | --------- | --- | --- | --- |
|     |     |              | βk  | = E[xk]   |     |     |     |
|     | We  | will recover | s   |           |     |     |     |
ik
γk and βk are additional
|     | In other | words | by adjusting |     | these | additional | para- |
| --- | -------- | ----- | ------------ | --- | ----- | ---------- | ----- |
parameters of the network.
|     | meters | the | network | can learn | to recover |     | s if that |
| --- | ------ | --- | ------- | --------- | ---------- | --- | --------- |
ik
|     | is more | favourable |     |     |     |     |     |
| --- | ------- | ---------- | --- | --- | --- | --- | --- |
66/1
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture9 |     |     |     |
| -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

We will now compare the performance with and without batch normalization on
| MNIST data | using 2 layers.... |     |
| ---------- | ------------------ | --- |
67/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

68/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| -------------- | --------------------- | -------- |

| 2016-17: Still | exciting times |         |     |     |
| -------------- | -------------- | ------- | --- | --- |
| Even better    | optimization   | methods |     |     |
| Data driven    | initialization | methods |     |     |
| Beyond batch   | normalization  |         |     |     |
69/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture9 |
| --- | --- | -------------- | --------------------- | -------- |
