| CS7015 | (Deep Learning) | : Lecture | 2   |
| ------ | --------------- | --------- | --- |
McCulloch Pitts Neuron, Thresholding Logic, Perceptrons, Perceptron
Learning Algorithm and Convergence, Multilayer Perceptrons (MLPs),
|     | Representation | Power of MLPs |     |
| --- | -------------- | ------------- | --- |
|     | Mitesh         | M. Khapra     |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/69
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | -------------- | --------------------- | -------- |

| Module | 2.1: Biological | Neurons |     |     |
| ------ | --------------- | ------- | --- | --- |
2/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     | y   |     | The most | fundamental |           | unit | of a          | deep |
| --- | --- | --- | -------- | ----------- | --------- | ---- | ------------- | ---- |
|     |     |     | neural   | network     | is called |      | an artificial |      |
neuron
|            | σ   |        | Why is              | it called   | a        | neuron   | ? Where      |     |
| ---------- | --- | ------ | ------------------- | ----------- | -------- | -------- | ------------ | --- |
|            |     |        | does the            | inspiration |          | come     | from         | ?   |
|            |     |        | The inspiration     |             | comes    | from     | biology      |     |
| w          | w   | w      |                     |             |          |          |              |     |
| 1          | 2   | 3      | (more specifically, |             | from     | the      | brain)       |     |
| x          | x   | x      | biological          | neurons     |          | = neural | cells        | =   |
| 1          | 2   | 3      |                     |             |          |          |              |     |
|            |     |        | neural              | processing  | units    |          |              |     |
| Artificial |     | Neuron |                     |             |          |          |              |     |
|            |     |        | We will             | first       | see what |          | a biological |     |
|            |     |        | neuron              | looks       | like ... |          |              |     |
3/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

|     | dendrite: | receivessignalsfromother |     |
| --- | --------- | ------------------------ | --- |
neurons
|     | synapse:        | point of connection | to      |
| --- | --------------- | ------------------- | ------- |
|     | other neurons   |                     |         |
|     | soma: processes | the information     |         |
|     | axon: transmits | the output          | of this |
neuron
Biological Neurons∗
∗Image adapted from
https://cdn.vectorstock.com/i/composite/12,25/neuron-cell-vector-81225.jpg
4/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |
| -------------- | --------------------- | -------- | --- |

|     | Let us     | see a very cartoonish | illustra-    |
| --- | ---------- | --------------------- | ------------ |
|     | tion of    | how a neuron          | works        |
|     | Our sense  | organs interact       | with the     |
|     | outside    | world                 |              |
|     | They relay | information           | to the neur- |
ons
|     | The neurons | (may) get  | activated and     |
| --- | ----------- | ---------- | ----------------- |
|     | produces    | a response | (laughter in this |
case)
5/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |
| -------------- | --------------------- | -------- | --- |

|     | Of course, | in reality,    | it       | is not         | just a single |
| --- | ---------- | -------------- | -------- | -------------- | ------------- |
|     | neuron     | which does     | all this |                |               |
|     | There      | is a massively | parallel | interconnected |               |
|     | network    | of neurons     |          |                |               |
Thesenseorgansrelayinformationtothelow-
|     | est layer | of neurons          |     |          |             |
| --- | --------- | ------------------- | --- | -------- | ----------- |
|     | Some of   | these neurons       | may | fire (in | red) in re- |
|     | sponse    | to this information |     | and in   | turn relay  |
informationtootherneuronstheyareconnec-
ted to
|     | These                            | neurons may       | also | fire (again,  | in red)   |
| --- | -------------------------------- | ----------------- | ---- | ------------- | --------- |
|     | and the                          | process continues |      | eventually    | resulting |
|     | in a response                    | (laughter         |      | in this case) |           |
|     | Anaveragehumanbrainhasaround1011 |                   |      |               | (100      |
billion) neurons!
6/69
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

|     | This massively | parallel     | network   | also ensures |     |
| --- | -------------- | ------------ | --------- | ------------ | --- |
|     | that there     | is division  | of work   |              |     |
|     | Each neuron    | may          | perform a | certain role | or  |
|     | respond        | to a certain | stimulus  |              |     |
A simplified illustration
7/69
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

Theneuronsinthebrainarearranged
|     | in a hierarchy |      |                  |
| --- | -------------- | ---- | ---------------- |
|     | We illustrate  | this | with the help of |
visualcortex(partofthebrain)which
|     | deals with | processing | visual informa- |
| --- | ---------- | ---------- | --------------- |
tion
Startingfromtheretina,theinforma-
tionisrelayedtoseverallayers(follow
|     | the arrows) |             |                     |
| --- | ----------- | ----------- | ------------------- |
|     | We observe  | that the    | layers V1, V2 to    |
|     | AIT form    | a hierarchy | (from identify-     |
|     | ing simple  | visual      | forms to high level |
objects)
8/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |
| -------------- | --------------------- | -------- | --- |

|     | Sample illustration | of hierarchical |     |
| --- | ------------------- | --------------- | --- |
processing∗
|     | ∗Idea borrowed | from Hugo Larochelle’s | lecture slides |
| --- | -------------- | ---------------------- | -------------- |
9/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |
| -------------- | --------------------- | -------- | --- |

Disclaimer
| I understand | very little | about how | the brain works! |     |
| ------------ | ----------- | --------- | ---------------- | --- |
What you saw so far is an overly simplified explanation of how the brain works!
But this explanation suffices for the purpose of this course!
10/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 2.2: McCulloch | Pitts | Neuron |     |
| ------ | -------------- | ----- | ------ | --- |
11/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     | McCulloch |     | (neuroscientist) |     | and | Pitts | (logi- |
| --- | --- | --------- | --- | ---------------- | --- | --- | ----- | ------ |
y ∈ {0,1}
|     |     | cian)  | proposed   |     | a highly   | simplified |          | computa- |
| --- | --- | ------ | ---------- | --- | ---------- | ---------- | -------- | -------- |
|     |     | tional | model      | of  | the neuron | (1943)     |          |          |
|     |     | g      | aggregates | the | inputs     | and the    | function | f        |
f
|     |     | takes | a      | decision | based         | on this | aggregation |     |
| --- | --- | ----- | ------ | -------- | ------------- | ------- | ----------- | --- |
| g   |     | The   | inputs | can      | be excitatory | or      | inhibitory  |     |
|     |     | y     | = 0 if | any x is | inhibitory,   | else    |             |     |
i
x x .. ..
| 1 2 x ∈ {0,1} |     |     |     |     |     |     |     |     |
| ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| n             |     |     |     |     |     |     | n   |     |
(cid:88)
|     |     |     | g(x | ,x ,...,x | ) = | g(x) = | x   |     |
| --- | --- | --- | --- | --------- | --- | ------ | --- | --- |
|     |     |     |     | 1 2       | n   |        | i   |     |
i=1
|     |     |      |           | y = f(g(x))         | =   | 1 if      | g(x) | ≥ θ |
| --- | --- | ---- | --------- | ------------------- | --- | --------- | ---- | --- |
|     |     |      |           |                     | =   | 0 if      | g(x) | < θ |
|     |     | θ    | is called | the thresholding    |     | parameter |      |     |
|     |     | This | is        | called Thresholding |     | Logic     |      |     |
12/69
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture2 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

Let us implement some boolean functions using this McCulloch Pitts (MP) neuron
...
13/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

|     | y ∈       | {0,1}      |     | y   | ∈ {0,1}  |     | y ∈ {0,1}    |
| --- | --------- | ---------- | --- | --- | -------- | --- | ------------ |
|     |           | θ          |     |     | 3        |     | 1            |
|     | x         | x x        |     | x   | x x      |     | x x x        |
|     | 1         | 2 3        |     |     | 1 2 3    |     | 1 2 3        |
| A   | McCulloch | Pitts unit |     | AND | function |     | OR function  |
|     | y ∈       | {0,1}      |     | y   | ∈ {0,1}  |     | y ∈ {0,1}    |
|     |           | 1          |     |     | 0        |     | 0            |
|     | x         | x          |     | x   | x        |     | x            |
|     | 1         | 2          |     |     | 1 2      |     | 1            |
|     | x AND     | !x ∗       |     | NOR | function |     | NOT function |
|     | 1         | 2          |     |     |          |     |              |
∗circleattheendindicatesinhibitoryinput:
ifanyinhibitoryinputis1theoutputwillbe0 14/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture2 |     |
| --- | --- | --- | -------------- | --- | --------------------- | -------- | --- |

Can any boolean function be represented using a McCulloch Pitts unit ?
Before answering this question let us first see the geometric interpretation of a
MP unit ...
15/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

y ∈ {0,1}
|     |     |     | A single                    | MP       | neuron splits | the  | input     | points | (4   |
| --- | --- | --- | --------------------------- | -------- | ------------- | ---- | --------- | ------ | ---- |
|     |     |     | points for                  | 2 binary | inputs)       | into | two       | halves |      |
|     |     |     | Pointslyingonorabovetheline |          |               |      | (cid:80)n | x      | −θ = |
i=1 i
1
|     |     |     | 0 and points |        | lying below | this     | line      |         |      |
| --- | --- | --- | ------------ | ------ | ----------- | -------- | --------- | ------- | ---- |
|     |     |     | In other     | words, | all inputs  | which    |           | produce | an   |
| x   | x   |     |              |        |             |          |           |         |      |
| 1   | 2   |     |              |        |             |          | (cid:80)n |         |      |
|     |     |     | output       | 0 will | be on       | one side | (         | x       | < θ) |
i=1 i
| OR  | function |     |             |     |            |       |     |         |     |
| --- | -------- | --- | ----------- | --- | ---------- | ----- | --- | ------- | --- |
|     |          |     | of the line | and | all inputs | which |     | produce | an  |
(cid:80)2
x +x = x ≥1 output 1 will lie on the other side ( (cid:80)n x ≥
| 1 2 | i=1 i |     |     |     |     |     |     |     | i   |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
i=1
|     |     |     | θ) of this | line |     |     |     |     |     |
| --- | --- | --- | ---------- | ---- | --- | --- | --- | --- | --- |
x 2
|       |          |     | Let us   | convince | ourselves | about |             | this with | a     |
| ----- | -------- | --- | -------- | -------- | --------- | ----- | ----------- | --------- | ----- |
| (0,1) | (1,1)    |     | few more | examples | (if       | it is | not already |           | clear |
|       |          |     | from the | math)    |           |       |             |           |       |
|       | x +x = θ | = 1 |          |          |           |       |             |           |       |
1 2
x
| (0,0) | (1,0) | 1   |     |     |     |     |     |     |     |
| ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
16/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture2 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|              | y ∈ {0,1} |     | y ∈       | {0,1}       |
| ------------ | --------- | --- | --------- | ----------- |
|              | 2         |     |           | 0           |
|              | x x       |     | x         | x           |
|              | 1 2       |     | 1         | 2           |
| AND function |           |     | Tautology | (always ON) |
(cid:80)2
| x +x = | x ≥2  |     |     |     |
| ------ | ----- | --- | --- | --- |
| 1 2    | i=1 i |     | x   |     |
2
x
2
(0,1) (1,1)
| (0,1) | (1,1)        |     |              |     |
| ----- | ------------ | --- | ------------ | --- |
|       |              |     | x 1 +x 2 = θ | = 0 |
|       | x 1 +x 2 = θ | = 2 |              |     |
x
(0,0) (1,0) 1
x
| (0,0) | (1,0) | 1   |     |     |
| ----- | ----- | --- | --- | --- |
17/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     | y ∈ {0,1} |     |               |              |                |        |
| --- | --------- | --- | ------------- | ------------ | -------------- | ------ |
|     |           |     | What if       | we have more | than 2 inputs? |        |
|     |           |     | Well, instead | of a         | line we will   | have a |
plane
|     | 1 OR  |     |                   |               |              |        |
| --- | ----- | --- | ----------------- | ------------- | ------------ | ------ |
|     |       |     | FortheORfunction, |               | wewantaplane |        |
|     |       |     | such that         | the point     | (0,0,0) lies | on one |
|     | x x x |     |                   |               |              |        |
|     | 1 2 3 |     |                   |               |              |        |
|     |       |     | side and          | the remaining | 7 points     | lie on |
x
2
|         |          |         | the other | side of the | plane |     |
| ------- | -------- | ------- | --------- | ----------- | ----- | --- |
| (0,1,0) | (1,1,0)  |         |           |             |       |     |
| (0,1,1) | (1,1,1)x | +x +x = | θ = 1     |             |       |     |
1 2 3
x
| (0,0,0) | (1,0,0) | 1   |     |     |     |     |
| ------- | ------- | --- | --- | --- | --- | --- |
| (0,0,1) | (1,0,1) |     |     |     |     |     |
x
| 3   |     |                |                       |          |     | 18/69 |
| --- | --- | -------------- | --------------------- | -------- | --- | ----- |
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |       |

The story so far ...
A single McCulloch Pitts Neuron can be used to represent boolean functions
which are linearly separable
Linear separability (for boolean functions) : There exists a line (plane) such
that all inputs which produce a 1 lie on one side of the line (plane) and all
inputs which produce a 0 lie on other side of the line (plane)
19/69
MiteshM.Khapra CS7015(DeepLearning): Lecture2

Module 2.3: Perceptron
20/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

| The story ahead | ...         |              |               |     |     |
| --------------- | ----------- | ------------ | ------------- | --- | --- |
| What about      | non-boolean | (say, real)  | inputs        | ?   |     |
| Do we always    | need        | to hand code | the threshold | ?   |     |
Are all inputs equal ? What if we want to assign more weight (importance) to
| some inputs | ?         |           |              |           |     |
| ----------- | --------- | --------- | ------------ | --------- | --- |
| What about  | functions | which are | not linearly | separable | ?   |
21/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|     | y   |     |     | Frank    | Rosenblatt, | an        | American |            | psychologist, |       |
| --- | --- | --- | --- | -------- | ----------- | --------- | -------- | ---------- | ------------- | ----- |
|     |     |     |     | proposed | the         | classical |          | perceptron |               | model |
(1958)
|     |       |     |     | A more          | general      | computational |              |             | model     | than   |
| --- | ----- | --- | --- | --------------- | ------------ | ------------- | ------------ | ----------- | --------- | ------ |
|     |       |     |     | McCulloch–Pitts |              | neurons       |              |             |           |        |
|     |       |     |     | Main            | differences: |               | Introduction |             | of numer- |        |
| w w | .. .. | w   |     |                 |              |               |              |             |           |        |
| 1 2 |       | n   |     | ical weights    | for          | inputs        | and          | a mechanism |           | for    |
|     |       |     |     | learning        | these        | weights       |              |             |           |        |
| x x | ..    | ..  | x   |                 |              |               |              |             |           |        |
| 1 2 |       |     | n   |                 |              |               |              |             |           |        |
|     |       |     |     | Inputs          | are no       | longer        | limited      | to boolean  |           | values |
RefinedandcarefullyanalyzedbyMinskyand
|     |     |     |     | Papert         | (1969) | - their | model | is  | referred | to as |
| --- | --- | --- | --- | -------------- | ------ | ------- | ----- | --- | -------- | ----- |
|     |     |     |     | the perceptron |        | model   | here  |     |          |       |
22/69
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

y
n
(cid:88)
|     |     |     |     | y = 1 | if w ∗x | ≥ θ |
| --- | --- | --- | --- | ----- | ------- | --- |
|     |     |     |     |       | i i     |     |
i=1
n
(cid:88)
|     |     |     |     | = 0 | if w ∗x | < θ |
| --- | --- | --- | --- | --- | ------- | --- |
|     |     |     |     |     | i i     |     |
i=1
|         | w w .. | .. w  |           |            |     |     |
| ------- | ------ | ----- | --------- | ---------- | --- | --- |
| w 0 =−θ | 1 2    | n     |           |            |     |     |
|         |        |       | Rewriting | the above, |     |     |
| x = 1   | x x    | .. .. | x         |            |     |     |
| 0       | 1 2    |       | n         |            |     |     |
n
| A more accepted | convention, |     |     |       | (cid:88) |        |
| --------------- | ----------- | --- | --- | ----- | -------- | ------ |
|                 |             |     |     | y = 1 | if w ∗x  | −θ ≥ 0 |
|                 |             | n   |     |       | i i      |        |
(cid:88)
i=1
|     | y = 1 if | w i ∗x | i ≥ 0 |     |     |     |
| --- | -------- | ------ | ----- | --- | --- | --- |
n
(cid:88)
i=0
|     |     |     |     | = 0 | if w i ∗x i | −θ < 0 |
| --- | --- | --- | --- | --- | ----------- | ------ |
n
(cid:88)
|     | = 0 if | w ∗x | < 0 |     | i=1 |     |
| --- | ------ | ---- | --- | --- | --- | --- |
i i
i=0
| where, | x = 1 and | w = | −θ  |     |     |     |
| ------ | --------- | --- | --- | --- | --- | --- |
|        | 0         | 0   |     |     |     |     |
23/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture2 |     |
| --- | --- | -------------- | --- | --------------------- | -------- | --- |

| We will now | try to answer      | the following | questions:         |     |
| ----------- | ------------------ | ------------- | ------------------ | --- |
| Why         | are we trying      | to implement  | boolean functions? |     |
| Why         | do we need weights | ?             |                    |     |
| Why         | is w = −θ called   | the bias      | ?                  |     |
0
24/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     |     | Consider | the | task of | predicting | whether |     | we would | like |
| --- | --- | --- | -------- | --- | ------- | ---------- | ------- | --- | -------- | ---- |
y
|     |     |     | a movie  | or not  |     |          |     |          |          |     |
| --- | --- | --- | -------- | ------- | --- | -------- | --- | -------- | -------- | --- |
|     |     |     | Suppose, | we base | our | decision | on  | 3 inputs | (binary, | for |
simplicity)
|         |     |     | Based on    | our    | past viewing |                 | experience | (data), |          | we may |
| ------- | --- | --- | ----------- | ------ | ------------ | --------------- | ---------- | ------- | -------- | ------ |
|         |     |     | give a high | weight | to           | isDirectorNolan |            | as      | compared | to     |
|         | w w | w   |             |        |              |                 |            |         |          |        |
| w 0 =−θ | 1 2 | 3   | the other   | inputs |              |                 |            |         |          |        |
x = 1 x x x Specifically, even if the actor is not Matt Damon and
| 0   | 1   | 2   | 3             |        |                |     |        |        |              |          |
| --- | --- | --- | ------------- | ------ | -------------- | --- | ------ | ------ | ------------ | -------- |
|     |     |     | the genre     | is not | thriller       | we  | would  | still  | want         | to cross |
|     |     |     | the threshold |        | θ by assigning |     | a high | weight | to isDirect- |          |
orNolan
x 1 = isActorDamon
x = isGenreThriller
| 2   |     |     | w is called | the | bias | as it | represents | the | prior | (preju- |
| --- | --- | --- | ----------- | --- | ---- | ----- | ---------- | --- | ----- | ------- |
0
x = isDirectorNolan
| 3   |     |     | dice)     |       |              |     |          |           |        |      |
| --- | --- | --- | --------- | ----- | ------------ | --- | -------- | --------- | ------ | ---- |
|     |     |     | A movie   | buff  | may have     | a   | very low | threshold | and    | may  |
|     |     |     | watch any | movie | irrespective |     | of the   | genre,    | actor, | dir- |
25/69
|     |     |     | ector [θ       | = 0]                  |       |             |          |          |      |       |
| --- | --- | --- | -------------- | --------------------- | ----- | ----------- | -------- | -------- | ---- | ----- |
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |       |             | Lecture2 |          |      |       |
|     |     |     | On the         | other                 | hand, | a selective | viewer   | may      | only | watch |
|     |     |     | thrillers      | starring              | Matt  | Damon       | and      | directed | by   | Nolan |
[θ = 3]
The weights (w 1 ,w 2 ,...,w n ) and the bias (w 0 ) will de-
|     |     |     | pend on | the data | (viewer |     | history | in this | case) |     |
| --- | --- | --- | ------- | -------- | ------- | --- | ------- | ------- | ----- | --- |

What kind of functions can be implemented using the perceptron? Any difference
from McCulloch Pitts neurons?
26/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

| McCulloch |     | Pitts Neuron |         |          |            |     |           |     |          |       |
| --------- | --- | ------------ | ------- | -------- | ---------- | --- | --------- | --- | -------- | ----- |
|           |     |              |         | From the | equations  |     | it should |     | be clear | that  |
| (assuming | no  | inhibitory   | inputs) |          |            |     |           |     |          |       |
|           |     |              |         | even a   | perceptron |     | separates | the | input    | space |
|           |     | n            |         | into two | halves     |     |           |     |          |       |
(cid:88)
| y   | = 1 | if  | x ≥ 0 |            |       |         |     |         |        |      |
| --- | --- | --- | ----- | ---------- | ----- | ------- | --- | ------- | ------ | ---- |
|     |     |     | i     | All inputs | which | produce |     | a 1 lie | on one | side |
i=0
|     |     |     |     | and all | inputs | which | produce |     | a 0 lie | on the |
| --- | --- | --- | --- | ------- | ------ | ----- | ------- | --- | ------- | ------ |
n
|     |     | (cid:88) |       | other side |     |     |     |     |     |     |
| --- | --- | -------- | ----- | ---------- | --- | --- | --- | --- | --- | --- |
|     | = 0 | if       | x < 0 |            |     |     |     |     |     |     |
i
|     |     | i=0 |     | In other | words,       | a   | single   | perceptron | can | only  |
| --- | --- | --- | --- | -------- | ------------ | --- | -------- | ---------- | --- | ----- |
|     |     |     |     | be used  | to implement |     | linearly | separable  |     | func- |
tions
| Perceptron |     |     |     | Then what | is         | the difference? |        | The     | weights | (in-    |
| ---------- | --- | --- | --- | --------- | ---------- | --------------- | ------ | ------- | ------- | ------- |
|            |     |     |     | cluding   | threshold) |                 | can be | learned | and     | the in- |
n
(cid:88)
| y = | 1 if | w   | ∗x ≥ 0 | puts can | be  | real valued |     |     |     |     |
| --- | ---- | --- | ------ | -------- | --- | ----------- | --- | --- | --- | --- |
i i
|     |     | i=0 |     | We will | first | revisit | some | boolean | functions |     |
| --- | --- | --- | --- | ------- | ----- | ------- | ---- | ------- | --------- | --- |
n
|     |      | (cid:88) |        | and then | see | the | perceptron |     | learning | al- |
| --- | ---- | -------- | ------ | -------- | --- | --- | ---------- | --- | -------- | --- |
| =   | 0 if | w        | ∗x < 0 |          |     |     |            |     |          |     |
i i
|     |     |     |     | gorithm | (for | learning | weights) |     |     |     |
| --- | --- | --- | --- | ------- | ---- | -------- | -------- | --- | --- | --- |
i=0
27/69
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

x
| x 1 x 2 | OR  |     |     |     |     | 2   |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:80)2
| 0 0 | 0 w 0 | + w i x i | < 0 |     |     |     |     |     |
| --- | ----- | --------- | --- | --- | --- | --- | --- | --- |
i=1
| 1 0 | 1 w | + (cid:80)2 w x | ≥ 0 |     | (0,1) |     | (1,1) |     |
| --- | --- | --------------- | --- | --- | ----- | --- | ----- | --- |
|     | 0   | i i             |     |     |       |     |       |     |
i=1
| 0 1 | 1 w | + (cid:80)2 w x | ≥ 0 |     |     |     |     |     |
| --- | --- | --------------- | --- | --- | --- | --- | --- | --- |
|     | 0   | i=1 i i         |     |     |     |     |     |     |
(cid:80)2
| 1 1       | 1 w    | + w x    | ≥ 0 |         |     |       |       |     |
| --------- | ------ | -------- | --- | ------- | --- | ----- | ----- | --- |
|           | 0      | i=1 i i  |     |         |     |       |       |     |
|           |        |          |     | −1+1.1x | 1   | +1.1x | 2 = 0 |     |
| w +w ·0+w | ·0 < 0 | =⇒ w < 0 |     |         |     |       |       |     |
| 0 1       | 2      | 0        |     |         |     |       |       |     |
x
| w +w ·0+w | ·1 ≥ 0 | =⇒ w ≥ −w |      |      | (0,0) |     | (1,0)    | 1   |
| --------- | ------ | --------- | ---- | ---- | ----- | --- | -------- | --- |
| 0 1       | 2      | 2         | 0    |      |       |     |          |     |
| w +w ·1+w | ·0 ≥ 0 | =⇒ w ≥ −w |      |      |       |     |          |     |
| 0 1       | 2      | 1         | 0    |      |       |     |          |     |
| w +w ·1+w | ·1 ≥ 0 | =⇒ w +w   | ≥ −w |      |       |     |          |     |
| 0 1       | 2      | 1         | 2 0  |      |       |     |          |     |
|           |        |           |      | Note | that  | we  | can come | up  |
Onepossiblesolutiontothissetofinequalities with a similar set of inequal-
is w = −1,w = 1.1,,w = 1.1 (and various ities and find the value of θ
| 0               | 1             | 2   |     |                          |      |      |     |     |
| --------------- | ------------- | --- | --- | ------------------------ | ---- | ---- | --- | --- |
| other solutions | are possible) |     |     | foraMcCullochPittsneuron |      |      |     |     |
|                 |               |     |     | also                     | (Try | it!) |     |     |
28/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

| Module | 2.4: Errors | and Error | Surfaces |     |
| ------ | ----------- | --------- | -------- | --- |
29/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

| Let us | fix the | threshold | (−w | = 1) | and try |     |     |     |     |     |     |
| ------ | ------- | --------- | --- | ---- | ------- | --- | --- | --- | --- | --- | --- |
0
| different | values     | of w        | ,w         |               |         |          | −1+(0.45)x |           |     | +(0.45)x | = 0 |
| --------- | ---------- | ----------- | ---------- | ------------- | ------- | -------- | ---------- | --------- | --- | -------- | --- |
|           |            | 1           | 2          |               |         |          |            |           | 1   |          | 2   |
| Say, w    | = −1,w     | = −1        |            |               |         |          |            | x         |     |          |     |
| 1         |            | 2           |            |               |         |          |            | 2         |     |          |     |
|           |            |             |            |               |         |          | −1+1.1x    | +1.1x     |     | = 0      |     |
| What      | is wrong   | with        | this line? | We            | make an |          |            | 1         |     | 2        |     |
| error on  | 1 out      | of the      | 4 inputs   |               |         |          |            | (0,1)     |     | (1,1)    |     |
| Lets try  | some       | more values | of         | w 1 ,w 2 and  | note    |          |            |           |     |          |     |
| how many  | errors     | we          | make       |               |         |          |            |           |     |          |     |
|           |            | w w         | errors     |               |         |          |            |           |     |          |     |
|           |            | 1           | 2          |               |         |          |            |           |     |          |     |
|           |            | -1          | -1         | 3             |         |          |            |           |     |          |     |
|           |            |             |            |               |         |          |            | (0,0)     |     | (1,0)    | x 1 |
|           |            | 1.5         | 0          | 1             |         |          |            |           |     |          |     |
|           |            | 0.45 0.45   |            | 3             |         |          |            | −1+(1.5)x |     | +(0)x    | = 0 |
|           |            |             |            |               |         |          |            |           | 1   |          | 2   |
| We are    | interested | in those    | values     | of w          | ,w ,w   |          |            |           |     |          |     |
|           |            |             |            |               | 0 1 2   |          |            |           |     |          |     |
|           |            |             |            |               |         | −1+(−1)x |            | +(−1)x    |     | = 0      |     |
| which     | result     | in 0 error  |            |               |         |          |            | 1         |     | 2        |     |
| Let us    | plot the   | error       | surface    | corresponding | to      |          |            |           |     |          |     |
| different | values     | of w        | ,w ,w      |               |         |          |            |           |     |          |     |
|           |            | 0           | 1 2        |               |         |          |            |           |     |          |     |
30/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     | For ease | of analysis, |     | we will | keep w |
| --- | -------- | ------------ | --- | ------- | ------ |
0
|     | fixed (-1)    | and plot  | the    | error             | for dif-  |
| --- | ------------- | --------- | ------ | ----------------- | --------- |
|     | ferent values | of        | w 1 ,w | 2                 |           |
|     | For a given   | w         | ,w ,w  | we                | will com- |
|     |               | 0         | 1      | 2                 |           |
|     | pute−w        | 0 +w 1 ∗x | 1 +w   | 2 ∗x 2 forallcom- |           |
|     | binations     | of (x     | ,x )   | and note          | down      |
1 2
|     | how many   | errors         | we make |             |           |
| --- | ---------- | -------------- | ------- | ----------- | --------- |
|     | For the    | OR function,   |         | an error    | occurs    |
|     | if(x ,x    | ) = (0,0)but−w |         |             | +w ∗x +   |
|     | 1 2        |                |         | 0           | 1 1       |
|     | w ∗x       | ≥ 0 or if      | (x ,x   | ) (cid:54)= | (0,0) but |
|     | 2 2        |                | 1       | 2           |           |
|     | −w 0 +w    | 1 ∗x 1 +w      | 2 ∗x    | 2 <         | 0         |
|     | We are     | interested     | in      | finding     | an al-    |
|     | gorithm    | which          | finds   | the         | values of |
|     | w ,w which | minimize       |         | this        | error     |
|     | 1 2        |                |         |             |           |
31/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |     |     |
| -------------- | --------------------- | -------- | --- | --- | --- |

| Module | 2.5: Perceptron | Learning | Algorithm |     |
| ------ | --------------- | -------- | --------- | --- |
32/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

We will now see a more principled approach for learning these weights and
| threshold | but before that | let us answer | this question... |     |
| --------- | --------------- | ------------- | ---------------- | --- |
Apart from implementing boolean functions (which does not look very interest-
| ing) what | can a perceptron | be used | for ? |     |
| --------- | ---------------- | ------- | ----- | --- |
Our interest lies in the use of perceptron as a binary classifier. Let us see what
this means...
33/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     |     |     | Let us | reconsider |     | our problem | of deciding |     |
| --- | --- | --- | --- | ------ | ---------- | --- | ----------- | ----------- | --- |
y
|         |        |      |     | whether      | to watch |            | a movie      | or not           |           |
| ------- | ------ | ---- | --- | ------------ | -------- | ---------- | ------------ | ---------------- | --------- |
|         |        |      |     | Suppose      | we       | are given  | a list       | of m movies      | and       |
|         |        |      |     | a label      | (class)  | associated | with         | each movie       | in-       |
|         |        |      |     | dicating     | whether  |            | the user     | liked this movie | or        |
|         |        |      |     | not : binary |          | decision   |              |                  |           |
|         | w w .. | .. w |     |              |          |            |              |                  |           |
| w 0 =−θ | 1 2    | n    |     | Further,     | suppose  |            | we represent | each             | movie     |
|         |        |      |     | with n       | features | (some      | boolean,     | some             | real val- |
| x = 1   | x x .. | ..   | x   |              |          |            |              |                  |           |
| 0       | 1 2    |      | n   |              |          |            |              |                  |           |
ued)
x = isActorDamon
| 1   |     |     |     | We will | assume | that | the data | is linearly | sep- |
| --- | --- | --- | --- | ------- | ------ | ---- | -------- | ----------- | ---- |
x 2 = isGenreThriller arable and we want a perceptron to learn how
| x = isDirectorNolan |     |     |     | to make | this | decision |     |     |     |
| ------------------- | --- | --- | --- | ------- | ---- | -------- | --- | --- | --- |
3
x = imdbRating(scaled to 0 to 1) Inotherwords,wewanttheperceptrontofind
4
|     |     |     |     | the equation |     | of this | separating | plane | (or find |
| --- | --- | --- | --- | ------------ | --- | ------- | ---------- | ----- | -------- |
... ...
|                          |     |     |         | the values | of  | w 0 ,w | 1 ,w 2 ,..,w | m ) |     |
| ------------------------ | --- | --- | ------- | ---------- | --- | ------ | ------------ | --- | --- |
| x = criticsRating(scaled |     | to  | 0 to 1) |            |     |        |              |     |     |
n
34/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture2 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

| Algorithm:         | Perceptron  | Learning | Algorithm |               |                  |             |
| ------------------ | ----------- | -------- | --------- | ------------- | ---------------- | ----------- |
|                    |             |          |           | Why           | would this work  | ?           |
| P ← inputs         | with        | label 1; |           |               |                  |             |
|                    |             |          |           | To understand | why              | this works  |
| N ← inputs         | with        | label 0; |           |               |                  |             |
|                    |             |          |           | we will       | have to get into | a bit of    |
| Initialize         | w randomly; |          |           |               |                  |             |
|                    |             |          |           | Linear        | Algebra and a    | bit of geo- |
| while !convergence | do          |          |           |               |                  |             |
metry...
| Pick random | x ∈   | P ∪N ;           |        |     |     |     |
| ----------- | ----- | ---------------- | ------ | --- | --- | --- |
| if x ∈      | P and | (cid:80)n w ∗x < | 0 then |     |     |     |
i=0 i i
| w   | = w+x ; |     |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- |
end
(cid:80)n
| if x ∈ | N and | w i ∗x i | ≥ 0 then |     |     |     |
| ------ | ----- | -------- | -------- | --- | --- | --- |
i=0
| w   | = w−x ; |     |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- |
end
end
| //the algorithm | converges  | when all  | the |     |     |     |
| --------------- | ---------- | --------- | --- | --- | --- | --- |
| inputs are      | classified | correctly |     |     |     |     |
35/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

Consider two vectors w and x We are interested in finding the line
|     |     |         |           |     | wTx =        | 0 which   | divides |           | the input |
| --- | --- | ------- | --------- | --- | ------------ | --------- | ------- | --------- | --------- |
|     | w   | = [w ,w | ,w ,...,w | ]   |              |           |         |           |           |
|     |     | 0       | 1 2       | n   | space into   | two       | halves  |           |           |
|     | x   | = [1,x  | ,x ,...,x | ]   |              |           |         |           |           |
|     |     |         | 1 2       | n   | Every        | point (x) | on      | this line | satisfies |
|     |     |         | n         |     |              | wTx       |         |           |           |
|     |     |         | (cid:88)  |     | the equation |           | =       | 0         |           |
wTx
|     | w·x | =   | = w | i ∗x i |     |     |     |     |     |
| --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
Whatcanyoutellabouttheangle(α)
i=0
|      |          |         |     |            | between   | w and     | any | point | (x) which |
| ---- | -------- | ------- | --- | ---------- | --------- | --------- | --- | ----- | --------- |
| We   | can thus | rewrite | the | perceptron | lies on   | this line | ?   |       |           |
| rule | as       |         |     |            |           | 90◦       | (∵  |       | wTx       |
|      |          |         |     |            | The angle | is        |     | cosα  | = =       |
||w||||x||
0)
|     | y = | 1 if | wTx | ≥ 0 |     |     |     |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
Sincethevectorwisperpendicularto
wTx
|     | =   | 0 if |     | < 0 |               |     |          |      |             |
| --- | --- | ---- | --- | --- | ------------- | --- | -------- | ---- | ----------- |
|     |     |      |     |     | every point   | on  | the line | it   | is actually |
|     |     |      |     |     | perpendicular | to  | the      | line | itself      |
36/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | -------- | --- | --- | --- |

| Consider | some | points | (vectors) |     | which | lie in |     |     |
| -------- | ---- | ------ | --------- | --- | ----- | ------ | --- | --- |
x 2
| thepositivehalfspaceofthisline(i.e.,wTx |     |     |     |     |     | ≥   |     |     |
| --------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
w
| 0)  |     |     |     |     |     |     | p   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
2
wTx
| What will | be  | the angle  | between | any  | such | vec- | = 0 |     |
| --------- | --- | ---------- | ------- | ---- | ---- | ---- | --- | --- |
|           |     |            |         |      | 90◦  |      | p   |     |
| tor and   | w ? | Obviously, | less    | than |      |      | 1   | p   |
3
| What | about | points | (vectors) | which | lie | in the |     |     |
| ---- | ----- | ------ | --------- | ----- | --- | ------ | --- | --- |
wTx
| negativehalfspaceofthisline(i.e., |     |     |     |     |     | < 0) n |     |     |
| --------------------------------- | --- | --- | --- | --- | --- | ------ | --- | --- |
1
x
| What will | be  | the angle | between | any | such | vec- |     | 1   |
| --------- | --- | --------- | ------- | --- | ---- | ---- | --- | --- |
90◦
| tor and    | w ?  | Obviously, | greater | than |             |     |     |     |
| ---------- | ---- | ---------- | ------- | ---- | ----------- | --- | --- | --- |
| Of course, | this | also       | follows | from | the formula |     |     |     |
wTx
| (cosα = |     | )   |     |     |     |     |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- |
||w||||x||
n n
| Keeping | this | picture | in mind | let | us revisit | the | 2 3 |     |
| ------- | ---- | ------- | ------- | --- | ---------- | --- | --- | --- |
algorithm
37/69
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture2 |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | -------- | --- |

| Algorithm:         | Perceptron  |          | Learning Algorithm |     |                             |           |             |             |
| ------------------ | ----------- | -------- | ------------------ | --- | --------------------------- | --------- | ----------- | ----------- |
|                    |             |          |                    |     | For x                       | ∈ P       | if w.x      | < 0 then it |
| P ← inputs         | with        | label    | 1;                 |     | meansthattheangle(α)between |           |             |             |
| N ← inputs         | with        | label    | 0;                 |     |                             |           |             |             |
|                    |             |          |                    |     | this                        | x and     | the current | w is        |
| Initialize         | w randomly; |          |                    |     | greater                     | than      | 90◦ (but    | we want α   |
| while !convergence |             | do       |                    |     | to be                       | less than | 90◦)        |             |
| Pick               | random      | x ∈ P ∪N | ;                  |     | What                        | happens   | to the      | new angle   |
| if x               | ∈ P and     | w.x      | < 0 then           |     |                             |           |             |             |
|                    |             |          |                    |     | (α                          | ) when    | w           | = w+x       |
|                    |             |          |                    |     | new                         |           | new         |             |
| w                  | = w+x       | ;        |                    |     |                             |           |             |             |
| end                |             |          |                    |     | cos(α                       |           | ) ∝ w       | Tx          |
|                    |             |          |                    |     |                             | new       | new         |             |
| if x               | ∈ N and     | w.x      | ≥ 0 then           |     |                             |           |             |             |
(w+x)Tx
∝
| w   | = w−x | ;   |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- |
∝ wTx+xTx
end
cosα+xTx
| end             |     |           |              |     |       |     | ∝        |     |
| --------------- | --- | --------- | ------------ | --- | ----- | --- | -------- | --- |
| //the algorithm |     | converges | when all the |     |       |     |          |     |
|                 |     |           |              |     | cos(α |     | ) > cosα |     |
new
| inputs | are classified | correctly |     |     |       |     |                    |     |
| ------ | -------------- | --------- | --- | --- | ----- | --- | ------------------ | --- |
|        |                |           |     |     | Thusα |     | willbelessthanαand |     |
new
wTx
|     | cosα= |     |     |     | this is | exactly | what | we want |
| --- | ----- | --- | --- | --- | ------- | ------- | ---- | ------- |
||w||||x||
38/69
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

| Algorithm:         | Perceptron  |          | Learning Algorithm |     |                             |          |             |             |
| ------------------ | ----------- | -------- | ------------------ | --- | --------------------------- | -------- | ----------- | ----------- |
|                    |             |          |                    |     | For x                       | ∈ N      | if w.x      | ≥ 0 then it |
| P ← inputs         | with        | label    | 1;                 |     | meansthattheangle(α)between |          |             |             |
| N ← inputs         | with        | label    | 0;                 |     |                             |          |             |             |
|                    |             |          |                    |     | this x                      | and      | the current | w is less   |
| Initialize         | w randomly; |          |                    |     | than                        | 90◦ (but | we want     | α to be     |
| while !convergence |             | do       |                    |     | greater                     | than     | 90◦)        |             |
| Pick               | random      | x ∈ P ∪N | ;                  |     | What                        | happens  | to the      | new angle   |
| if x               | ∈ P and     | w.x      | < 0 then           |     |                             |          |             |             |
|                    |             |          |                    |     | (α                          | ) when   | w           | = w−x       |
|                    |             |          |                    |     | new                         |          | new         |             |
| w                  | = w+x       | ;        |                    |     |                             |          |             |             |
| end                |             |          |                    |     | cos(α                       |          | ) ∝ w       | Tx          |
|                    |             |          |                    |     |                             | new      | new         |             |
| if x               | ∈ N and     | w.x      | ≥ 0 then           |     |                             |          |             |             |
(w−x)Tx
∝
| w   | = w−x | ;   |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- |
∝ wTx−xTx
end
cosα−xTx
| end             |     |           |              |     |       |     | ∝        |     |
| --------------- | --- | --------- | ------------ | --- | ----- | --- | -------- | --- |
| //the algorithm |     | converges | when all the |     |       |     |          |     |
|                 |     |           |              |     | cos(α |     | ) < cosα |     |
new
| inputs | are classified | correctly |     |     |      |     |                 |        |
| ------ | -------------- | --------- | --- | --- | ---- | --- | --------------- | ------ |
|        |                |           |     |     | Thus | α   | will be greater | than α |
new
wTx
|     | cosα= |     |     |     | and this | is exactly | what | we want |
| --- | ----- | --- | --- | --- | -------- | ---------- | ---- | ------- |
||w||||x||
39/69
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

| We will now | see this algorithm | in action | for a toy dataset |     |
| ----------- | ------------------ | --------- | ----------------- | --- |
40/69
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |
| --- | -------------- | --------------------- | --- | -------- |

|     |     |     |     | We initialized |     | w to a | random | value |     |
| --- | --- | --- | --- | -------------- | --- | ------ | ------ | ----- | --- |
|     | x   | 2   |     |                |     |        |        |       |     |
(∵
|     |     |     |     | We observe                         | that | currently, | w·x | <   | 0 angle |
| --- | --- | --- | --- | ---------------------------------- | ---- | ---------- | --- | --- | ------- |
|     |     | p   |     | >90◦)forallthepositivepointsandw·x |      |            |     |     | ≥ 0     |
2
|     |     |     |     | (∵ angle | < 90◦) | for | all the | negative | points |
| --- | --- | --- | --- | -------- | ------ | --- | ------- | -------- | ------ |
p
|     | 1   |     | p   | (the situation |     | is exactly | oppsite | of  | what we |
| --- | --- | --- | --- | -------------- | --- | ---------- | ------- | --- | ------- |
3
|     |     |     |     | actually | want    | it to be) |     |          |       |
| --- | --- | --- | --- | -------- | ------- | --------- | --- | -------- | ----- |
| n   |     |     |     | We now   | run the | algorithm | by  | randomly | going |
1
|     |     |     | x   | over the | points |     |     |     |     |
| --- | --- | --- | --- | -------- | ------ | --- | --- | --- | --- |
1
|     |     |     |     | Randomlypickapoint(say,p |           |       | 1   | ),applycorrec- |           |
| --- | --- | --- | --- | ------------------------ | --------- | ----- | --- | -------------- | --------- |
|     |     |     |     | tion w =                 | w +x      | ∵ w·x | < 0 | (you           | can check |
|     |     |     |     | the angle                | visually) |       |     |                |           |
|     | n   | n   |     | Randomlypickapoint(say,p |           |       |     | ),applycorrec- |           |
|     | 2   | 3   |     |                          |           |       | 2   |                |           |
|     |     |     |     | tion w =                 | w +x      | ∵ w·x | < 0 | (you           | can check |
|     |     |     |     | the angle                | visually) |       |     |                |           |
|     |     |     |     | Randomlypickapoint(say,n |           |       |     | ),applycorrec- |           |
1
∵
|     |     |     |     | tion w = | w −x | w·x | ≥ 0 | (you | can check |
| --- | --- | --- | --- | -------- | ---- | --- | --- | ---- | --------- |
41/69
|     |     |     | MiteshM.Khapra | the CS7015(DeepLearning): angle | visually) |     | Lecture2 |                |     |
| --- | --- | --- | -------------- | ------------------------------- | --------- | --- | -------- | -------------- | --- |
|     |     |     |                | Randomlypickapoint(say,n        |           |     |          | ),nocorrection |     |
3
∵
|     |     |     |     | needed | w·x | < 0 (you | can | check | the angle |
| --- | --- | --- | --- | ------ | --- | -------- | --- | ----- | --------- |
visually)
|     |     |     |     | Randomlypickapoint(say,n |     |          | 2   | ),nocorrection |           |
| --- | --- | --- | --- | ------------------------ | --- | -------- | --- | -------------- | --------- |
|     |     |     |     | needed ∵                 | w·x | < 0 (you | can | check          | the angle |
visually)
|     |     |     |     | Randomlypickapoint(say,p |     |     |     | ),applycorrec- |     |
| --- | --- | --- | --- | ------------------------ | --- | --- | --- | -------------- | --- |
3
|     |     |     |     | tion w =                 | w +x      | ∵ w·x | < 0 | (you           | can check |
| --- | --- | --- | --- | ------------------------ | --------- | ----- | --- | -------------- | --------- |
|     |     |     |     | the angle                | visually) |       |     |                |           |
|     |     |     |     | Randomlypickapoint(say,p |           |       |     | ),nocorrection |           |
1
∵
|     |     |     |     | needed | w·x | ≥ 0 (you | can | check | the angle |
| --- | --- | --- | --- | ------ | --- | -------- | --- | ----- | --------- |
visually)
|     |     |     |     | Randomlypickapoint(say,p |     |     |     | ),nocorrection |     |
| --- | --- | --- | --- | ------------------------ | --- | --- | --- | -------------- | --- |
2
|     |     |     |     | needed ∵ | w·x | ≥ 0 (you | can | check | the angle |
| --- | --- | --- | --- | -------- | --- | -------- | --- | ----- | --------- |
visually)
|     |     |     |     | Randomlypickapoint(say,n |     |          | 1   | ),nocorrection |           |
| --- | --- | --- | --- | ------------------------ | --- | -------- | --- | -------------- | --------- |
|     |     |     |     | needed ∵                 | w·x | < 0 (you | can | check          | the angle |
visually)
|     |     |     |     | Randomlypickapoint(say,n |     |     |     | ),nocorrection |     |
| --- | --- | --- | --- | ------------------------ | --- | --- | --- | -------------- | --- |
3
|     |     |     |     | needed ∵ | w·x | < 0 (you | can | check | the angle |
| --- | --- | --- | --- | -------- | --- | -------- | --- | ----- | --------- |
visually)
|     |     |     |     | Randomlypickapoint(say,n |     |     |     | ),nocorrection |     |
| --- | --- | --- | --- | ------------------------ | --- | --- | --- | -------------- | --- |
2
∵
|     |     |     |     | needed | w·x | < 0 (you | can | check | the angle |
| --- | --- | --- | --- | ------ | --- | -------- | --- | ----- | --------- |
visually)
|     |     |     |     | Randomlypickapoint(say,p |     |          | 3   | ),nocorrection |           |
| --- | --- | --- | --- | ------------------------ | --- | -------- | --- | -------------- | --------- |
|     |     |     |     | needed ∵                 | w·x | ≥ 0 (you | can | check          | the angle |
visually)
|     |     |     |     | The algorithm |     | has converged |     |     |     |
| --- | --- | --- | --- | ------------- | --- | ------------- | --- | --- | --- |

| Module | 2.6: Proof | of Convergence |     |     |
| ------ | ---------- | -------------- | --- | --- |
42/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

Now that we have some faith and intuition about why the algorithm works, we
| will see a more | formal proof | of convergence | ... |     |
| --------------- | ------------ | -------------- | --- | --- |
43/69
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |
| --- | -------------- | --------------------- | --- | -------- |

Theorem
Definition: Two sets P and N of points in an n-dimensional space are called
absolutely linearly separable if n + 1 real numbers w ,w ,...,w exist such that
0 1 n
(cid:80)n
every point (x ,x ,...,x ) ∈ P satisfies w ∗x > w and every point
|              | 1 2             | n              | i=1 i i | 0   |
| ------------ | --------------- | -------------- | ------- | --- |
| (x ,x ,...,x | ) ∈ N satisfies | (cid:80)n w ∗x | < w .   |     |
| 1 2          | n               | i              | i 0     |     |
i=1
Proposition: If the sets P and N are finite and linearly separable, the perceptron
learning algorithm updates the weight vector w a finite number of times. In other
t
words: if the vectors in P and N are tested cyclically one after the other, a weight
vector w is found after a finite number of steps t which can separate the two sets.
t
| Proof: On | the next slide |     |     |     |
| --------- | -------------- | --- | --- | --- |
44/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

Setup:
|        |           |        | Algorithm: |     | Perceptron | Learning |     | Algorithm |     |
| ------ | --------- | ------ | ---------- | --- | ---------- | -------- | --- | --------- | --- |
| If x ∈ | N then -x | ∈ P (∵ |            |     |            |          |     |           |     |
| wTx    | wT(−x)    |        |            |     |            |          |     |           |     |
| <      | 0 =⇒      | ≥ 0)   | P ←inputs  |     | with       | label 1; |     |           |     |
|        |           |        | N ←inputs  |     | with       | label    | 0;  |           |     |
Wecanthusconsiderasingle
|           |       |         | N−contains |     | negations | of all | points in | N;  |     |
| --------- | ----- | ------- | ---------- | --- | --------- | ------ | --------- | --- | --- |
| P(cid:48) | N−    |         |            |     |           |        |           |     |     |
| set       | = P ∪ | and for |            |     |           |        |           |     |     |
P(cid:48) ←P ∪N−;
| every element | p ∈               | P(cid:48) ensure |            |              |                    |     |     |     |     |
| ------------- | ----------------- | ---------------- | ---------- | ------------ | ------------------ | --- | --- | --- | --- |
|               |                   |                  | Initialize |              | w randomly;        |     |     |     |     |
| that wTp      | ≥ 0               |                  |            |              |                    |     |     |     |     |
|               |                   |                  | while      | !convergence |                    | do  |     |     |     |
| Further       | we will normalize | all              |            | Pick random  | p∈P(cid:48)        | ;   |     |     |     |
|               |                   |                  |            | p←           | p (so now,||p||=1) |     | ;   |     |     |
| the p’s       | so that ||p||     | = 1 (no-         |            | ||p||        |                    |     |     |     |     |
|               |                   |                  |            | if w.p<0     | then               |     |     |     |     |
| tice that     | this does         | not affect       |            |              |                    |     |     |     |     |
|               | ∵                 | wT p             |            | w=w+p        | ;                  |     |     |     |     |
| the solution  | if                | ≥                |            |              |                    |     |     |     |     |
|               |                   | ||p||            |            | end          |                    |     |     |     |     |
| 0 then        | wTp ≥ 0)          |                  |            |              |                    |     |     |     |     |
end
Let w∗ be the normalized //the algorithm converges when all the inputs are
| solution | vector (we  | know one    | classified |      | correctly       |          |           |              |              |
| -------- | ----------- | ----------- | ---------- | ---- | --------------- | -------- | --------- | ------------ | ------------ |
|          |             |             | //notice   | that | we do           | not need | the other | if condition |              |
| exists   | as the data | is linearly |            |      |                 |          |           |              |              |
|          |             |             | because    |      | by construction | we       | want all  | points in    | P(cid:48) to |
separable)
|     |     |     | lie | in the | positive half | space | w.p≥0 |     |     |
| --- | --- | --- | --- | ------ | ------------- | ----- | ----- | --- | --- |
45/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture2 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

| Observations: |     |     |     | Proof: |     |     |     |     |     |     |
| ------------- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
w∗ is some optimal solution Nowsupposeattimesteptweinspectedthe
wT
| whichexistsbutwedon’tknow |     |     |     |     | point p | and found | that | ·p  | ≤ 0 |     |
| ------------------------- | --- | --- | --- | --- | ------- | --------- | ---- | --- | --- | --- |
|                           |     |     |     |     | i       |           |      |     | i   |     |
what it is
|     |     |     |     |     | We make | a correction | w   | =   | w +p |     |
| --- | --- | --- | --- | --- | ------- | ------------ | --- | --- | ---- | --- |
|     |     |     |     |     |         |              |     | t+1 | t i  |     |
We do not make a correction Let β be the angle between w∗ and w
t+1
| at  | every | time-step |     |     |     |     |     |     |     |     |
| --- | ----- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
w∗·w
t+1
|     |      |              |     |         | cosβ | =   |        |     |     |     |
| --- | ---- | ------------ | --- | ------- | ---- | --- | ------ | --- | --- | --- |
| We  | make | a correction |     | only if |      |     | ||w || |     |     |     |
t+1
| wT  | ·p ≤ | 0 at      | that time | step     |           |      |       |       |          |     |
| --- | ---- | --------- | --------- | -------- | --------- | ---- | ----- | ----- | -------- | --- |
|     | i    |           |           |          |           | w∗·w |       | w∗·(w |          |     |
|     |      |           |           |          | Numerator | =    | t+1   | =     | t +p i ) |     |
| So  | at   | time-step | t         | we would |           | w∗·w | +w∗·p |       |          |     |
=
| have     | made       | only | k      | (≤ t) cor- |     |         | t   |       | i          |       |
| -------- | ---------- | ---- | ------ | ---------- | --- | ------- | --- | ----- | ---------- | ----- |
|          |            |      |        |            |     | ≥ w∗·w  | +δ  | (δ    | = min{w∗·p | |∀i}) |
| rections |            |      |        |            |     |         | t   |       |            | i     |
|          |            |      |        |            |     | ≥ w∗·(w |     | +p    | )+δ        |       |
| Every    | time       | we   | make   | a correc-  |     |         | t−1 | j     |            |       |
|          |            |      |        |            |     | w∗·w    |     | +w∗·p |            |       |
| tion     | a quantity |      | δ gets | added to   |     | ≥       |     |       | +δ         |       |
|          |            |      |        |            |     |         | t−1 |       | j          |       |
| the      | numerator  |      |        |            |     | ≥ w∗·w  |     | +2δ   |            |       |
t−1
| So  | by time-step |     | t,  | a quantity |     | ≥ w∗·w | +(k)δ |     | (By induction) |     |
| --- | ------------ | --- | --- | ---------- | --- | ------ | ----- | --- | -------------- | --- |
0
| kδ  | gets | added | to the | numer- |     |     |     |     |     |     |
| --- | ---- | ----- | ------ | ------ | --- | --- | --- | --- | --- | --- |
46/69
ator
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

Proof (continued:)
wT
| So far we | have, | ·p i ≤ 0 (and | hence we made | the correction) |     |     |
| --------- | ----- | ------------- | ------------- | --------------- | --- | --- |
w∗·w
|     |     | cosβ = | t+1 (by definition) |     |     |     |
| --- | --- | ------ | ------------------- | --- | --- | --- |
|     |     | ||w    | ||                  |     |     |     |
t+1
|     | Numerator | ≥ w∗·w | +kδ (proved | by induction) |     |     |
| --- | --------- | ------ | ----------- | ------------- | --- | --- |
0
|     | Denominator2 | = ||w | ||2 |     |     |     |
| --- | ------------ | ----- | --- | --- | --- | --- |
t+1
|     |     | = (w +p      | )·(w +p ) |      |     |     |
| --- | --- | ------------ | --------- | ---- | --- | --- |
|     |     | t            | i t i     |      |     |     |
|     |     | = ||w ||2+2w | ·p +||p   | ||2) |     |     |
|     |     | t            | t i       | i    |     |     |
||2+||p ||2 (∵
|     |     | ≤ ||w       | w          | ·p ≤ 0) |     |     |
| --- | --- | ----------- | ---------- | ------- | --- | --- |
|     |     | t           | i          | t i     |     |     |
|     |     | ≤ ||w ||2+1 | (∵ ||p ||2 | = 1)    |     |     |
|     |     | t           | i          |         |     |     |
|     |     | ≤ (||w      | ||2+1)+1   |         |     |     |
t−1
|     |     | ≤ ||w | ||2+2 |     |     |     |
| --- | --- | ----- | ----- | --- | --- | --- |
t−1
|     |     | ≤ ||w ||2+(k) | (By same | observation | that we made | about δ) |
| --- | --- | ------------- | -------- | ----------- | ------------ | -------- |
0
47/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

Proof (continued:)
wT
| So far we | have, | ·p  | i ≤ 0 | (and hence | we made | the correction) |     |
| --------- | ----- | --- | ----- | ---------- | ------- | --------------- | --- |
w∗·w
|     |     | cosβ | =   | t+1 | (by definition) |     |     |
| --- | --- | ---- | --- | --- | --------------- | --- | --- |
||w ||
t+1
|     | Numerator |     | ≥ w∗·w | +kδ | (proved | by induction) |     |
| --- | --------- | --- | ------ | --- | ------- | ------------- | --- |
0
Denominator2 ≤ ||w ||2+k (By same observation that we made about δ)
0
w∗·w
0 +kδ
|     |     | cosβ | ≥   |     |     |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- |
(cid:112)
||w ||2+k
0
√
| cosβ | thus grows | proportional |     | to  | k   |     |     |
| ---- | ---------- | ------------ | --- | --- | --- | --- | --- |
As k (number of corrections) increases cosβ can become arbitrarily large
| But | since cosβ | ≤ 1, | k must | be bounded | by  | a maximum | number |
| --- | ---------- | ---- | ------ | ---------- | --- | --------- | ------ |
Thus,therecanonlybeafinitenumberofcorrections(k)towandthealgorithm
| will | converge! |     |     |     |     |     |     |
| ---- | --------- | --- | --- | --- | --- | --- | --- |
48/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- |

| Coming back | to our questions | ... |     |     |
| ----------- | ---------------- | --- | --- | --- |
What about non-boolean (say, real) inputs? Real valued inputs are allowed in
perceptron
Do we always need to hand code the threshold? No, we can learn the threshold
Are all inputs equal? What if we want to assign more weight (importance) to
some inputs? A perceptron allows weights to be assigned to inputs
What about functions which are not linearly separable ? Not possible with a
| single | perceptron but | we will see how | to handle this | ..  |
| ------ | -------------- | --------------- | -------------- | --- |
49/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 2.7: Linearly | Separable | Boolean | Functions |
| ------ | ------------- | --------- | ------- | --------- |
50/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

So what do we do about functions which are not linearly separable ?
| Let us | see one such | simple boolean | function first ? |     |
| ------ | ------------ | -------------- | ---------------- | --- |
51/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

x
| x 1 x 2 | XOR |     |     |     | 2   |     |     |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:80)2
| 0 0 | 0 w | 0 + | w i x i | < 0 |     |     |     |     |     |
| --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- |
i=1
| 1 0 | 1 w | + (cid:80)2 | w x | ≥ 0 | (0,1) |     | (1,1) |     |     |
| --- | --- | ----------- | --- | --- | ----- | --- | ----- | --- | --- |
|     |     | 0           | i i |     |       |     |       |     |     |
i=1
| 0 1 | 1 w | + (cid:80)2 | w x     | ≥ 0 |     |     |     |     |     |
| --- | --- | ----------- | ------- | --- | --- | --- | --- | --- | --- |
|     |     | 0           | i=1 i i |     |     |     |     |     |     |
(cid:80)2
| 1 1       | 0 w    | +   | w x     | < 0 |     |     |     |     |     |
| --------- | ------ | --- | ------- | --- | --- | --- | --- | --- | --- |
|           |        | 0   | i=1 i i |     |     |     |     |     |     |
| w +w ·0+w | ·0 < 0 | =⇒  | w < 0   |     |     |     |     |     |     |
| 0 1       | 2      |     | 0       |     |     |     |     |     |     |
x
| w +w ·0+w | ·1 ≥ 0 | =⇒  | w ≥ −w |      | (0,0) |               | (1,0)     | 1   |          |
| --------- | ------ | --- | ------ | ---- | ----- | ------------- | --------- | --- | -------- |
| 0 1       | 2      |     | 2      | 0    |       |               |           |     |          |
| w +w ·1+w | ·0 ≥ 0 | =⇒  | w ≥ −w |      |       |               |           |     |          |
| 0 1       | 2      |     | 1      | 0    | And   | indeed        | you       | can | see that |
| w +w ·1+w | ·1 < 0 | =⇒  | w +w   | < −w | it    | is impossible |           | to  | draw a   |
| 0 1       | 2      |     | 1      | 2 0  |       |               |           |     |          |
|           |        |     |        |      | line  | which         | separates |     | the red  |
The fourth condition contradicts conditions 2 points from the blue points
and 3
| Hence we | cannot have | a solution | to  | this set of |     |     |     |     |     |
| -------- | ----------- | ---------- | --- | ----------- | --- | --- | --- | --- | --- |
inequalities
52/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     | Most real          | world | data    | is not | linearly | separable |
| --- | ------------------ | ----- | ------- | ------ | -------- | --------- |
|     | and will always    |       | contain | some   | outliers |           |
|     | In fact, sometimes |       | there   | may    | not be   | any out-  |
liersbutstillthedatamaynotbelinearlysep-
arable
|     | We need       | computational                |            | units     | (models) | which     |
| --- | ------------- | ---------------------------- | ---------- | --------- | -------- | --------- |
|     | can deal with | such                         | data       |           |          |           |
|     | While a       | single                       | perceptron |           | cannot   | deal with |
|     | suchdata,     | wewillshowthatanetworkofper- |            |           |          |           |
|     | ceptrons can  | indeed                       |            | deal with | such     | data      |
ooooo
o o
o o
o + ++ + o
o o
o + + o
+ +
o o
o + + o
o + + o
o o
o + + o
+ +
o ++ o
o o
o ooooo o
53/69
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture2 |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- |

Before seeing how a network of perceptrons can deal with linearly inseparable
data, we will discuss boolean functions in some more detail ...
54/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

| How many     | boolean   | functions | can you    | design | from    | 2 inputs | ?   |             |
| ------------ | --------- | --------- | ---------- | ------ | ------- | -------- | --- | ----------- |
| Let us begin | with some | easy      | ones which | you    | already | know     | ..  |             |
| x x          | f f       | f f       | f f        | f f    | f       | f f      | f f | f f f       |
| 1 2          | 1 2       | 3 4       | 5 6        | 7      | 8 9     | 10 11    | 12  | 13 14 15 16 |
| 0 0          | 0 0       | 0 0       | 0 0        | 0 0    | 1       | 1 1      | 1 1 | 1 1 1       |
| 0 1          | 0 0       | 0 0       | 1 1        | 1 1    | 0       | 0 0      | 0 1 | 1 1 1       |
| 1 0          | 0 0       | 1 1       | 0 0        | 1 1    | 0       | 0 1      | 1 0 | 0 1 1       |
| 1 1          | 0 1       | 0 1       | 0 1        | 0 1    | 0       | 1 0      | 1 0 | 1 0 1       |
Of these, how many are linearly separable ? (turns out all except XOR and
| !XOR - | feel free to | verify) |     |     |     |     |     |     |
| ------ | ------------ | ------- | --- | --- | --- | --- | --- | --- |
In general, how many boolean functions can you have for n inputs ? 22n
Howmanyofthese22n
|     |     | functionsarenotlinearlyseparable? |     |     |     |     | Forthetimebeing, |     |
| --- | --- | --------------------------------- | --- | --- | --- | --- | ---------------- | --- |
it suffices to know that at least some of these may not be linearly inseparable
| (I encourage | you to | figure | out the | exact answer | :-) | )   |     |     |
| ------------ | ------ | ------ | ------- | ------------ | --- | --- | --- | --- |
55/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture2 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- |

| Module | 2.8: Representation |     | Power | of a Network | of  |
| ------ | ------------------- | --- | ----- | ------------ | --- |
Perceptrons
56/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

We will now see how to implement any boolean function using a network of
perceptrons ...
57/69
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| -------------- | --------------------- | -------- |

|     |     |     | For this    | discussion,   | we will         | assume True    |
| --- | --- | --- | ----------- | ------------- | --------------- | -------------- |
|     |     |     | = +1 and    | False         | = -1            |                |
|     | y   |     | We consider | 2 inputs      | and 4           | perceptrons    |
|     |     |     | Each input  | is connected  | to              | all the 4 per- |
|     |     |     | ceptrons    | with specific | weights         |                |
| w w | w   | w   | The bias    | (w 0 ) of     | each perceptron | is -2          |
1 2 3 4
|         |     |     | (i.e., each | perceptron        | will fire    | only if the  |
| ------- | --- | --- | ----------- | ----------------- | ------------ | ------------ |
|         |     |     | weighted    | sum of            | its input is | ≥ 2)         |
|         |     |     | Each of     | these perceptrons | is           | connected to |
| bias=-2 |     |     | an output   | perceptron        | by weights   | (which       |
|         |     |     | need to     | be learned)       |              |              |
x 1 x 2
|                     |        |     | The output | of this         | perceptron | (y) is the |
| ------------------- | ------ | --- | ---------- | --------------- | ---------- | ---------- |
| red edge indicates  | w = -1 |     |            |                 |            |            |
|                     |        |     | output     | of this network |            |            |
| blue edge indicates | w = +1 |     |            |                 |            |            |
58/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture2 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

Terminology:
|         |     |     |     |     | This network |            | contains   | 3 layers      |        |            |
| ------- | --- | --- | --- | --- | ------------ | ---------- | ---------- | ------------- | ------ | ---------- |
|         |     |     |     |     | The layer    | containing |            | the inputs    |        | (x ,x ) is |
|         |     | y   |     |     |              |            |            |               |        | 1 2        |
|         |     |     |     |     | called the   | input      | layer      |               |        |            |
|         |     |     |     |     | The middle   | layer      | containing |               | the    | 4 per-     |
|         |     |     |     |     | ceptrons     | is called  | the        | hidden        | layer  |            |
|         | w w | w   | w   |     |              |            |            |               |        |            |
|         | 1 2 | 3   | 4   |     | The final    | layer      | containing |               | one    | output     |
| h       | h   | h   |     | h   |              |            |            |               |        |            |
| 1       | 2   |     | 3   | 4   |              |            |            |               |        |            |
|         |     |     |     |     | neuron       | is called  | the        | output        | layer  |            |
|         |     |     |     |     | The outputs  |            | of the     | 4 perceptrons |        | in the     |
|         |     |     |     |     | hidden       | layer are  | denoted    |               | by h   | ,h ,h ,h   |
| bias=-2 |     |     |     |     |              |            |            |               | 1      | 2 3 4      |
|         |     |     |     |     | The red      | and blue   | edges      | are           | called | layer 1    |
|         | x 1 | x   | 2   |     | weights      |            |            |               |        |            |
red edge indicates w = -1 w ,w ,w ,w are called layer 2 weights
|           |           |        |     |     | 1 2 | 3 4 |     |     |     |     |
| --------- | --------- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
| blue edge | indicates | w = +1 |     |     |     |     |     |     |     |     |
59/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

Weclaimthatthisnetworkcanbeusedto
implementanybooleanfunction(linearly
|       |      | y   |      |     | separable       | or not) | !              |        |             |       |
| ----- | ---- | --- | ---- | --- | --------------- | ------- | -------------- | ------ | ----------- | ----- |
|       |      |     |      |     | In other        | words,  | we can         | find   | w ,w ,w     | ,w    |
|       |      |     |      |     |                 |         |                |        | 1 2         | 3 4   |
|       |      |     |      |     | such that       | the     | truth table    | of     | any boolean |       |
|       |      |     |      |     | function        | can     | be represented |        | by this     | net-  |
|       | w w  | w   | w    |     |                 |         |                |        |             |       |
|       | 1    | 2   | 3 4  |     | work            |         |                |        |             |       |
| h     | h    |     | h    | h   |                 |         |                |        |             |       |
| 1     | 2    |     | 3    | 4   |                 |         |                |        |             |       |
|       |      |     |      |     | Astonishing     | claim!  | Well,          | not    | really, if  | you   |
| -1,-1 | -1,1 |     | 1,-1 | 1,1 |                 |         |                |        |             |       |
|       |      |     |      |     | understand      | what    | is going       | on     |             |       |
|       |      |     |      |     | Each perceptron |         | in the         | middle | layer       | fires |
bias=-2
|     |     |     |     |     | only for | a specific | input        | (and   | no two | per- |
| --- | --- | --- | --- | --- | -------- | ---------- | ------------ | ------ | ------ | ---- |
|     | x 1 |     | x 2 |     | ceptrons | fire       | for the same | input) |        |      |
red edge indicates w = -1 the first perceptron fires for {-1,-1}
blue edge indicates w = +1 the second perceptron fires for {-1,1}
|     |     |     |                |     | the third             | perceptron |          | fires for | {1,-1} |       |
| --- | --- | --- | -------------- | --- | --------------------- | ---------- | -------- | --------- | ------ | ----- |
|     |     |     |                |     | the fourth            | perceptron |          | fires for | {1,1}  | 60/69 |
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |            | Lecture2 |           |        |       |
Letusseewhythisnetworkworksbytak-
|     |     |     |     |     | ing an | example | of the | XOR | function |     |
| --- | --- | --- | --- | --- | ------ | ------- | ------ | --- | -------- | --- |

|     |     |     |     |     |     | Let | w be | the bias | output | of the | neuron |
| --- | --- | --- | --- | --- | --- | --- | ---- | -------- | ------ | ------ | ------ |
0
(cid:80)4
|     |     |     |     |     |     | (i.e., | it will | fire if | w h   | ≥ w | )   |
| --- | --- | --- | --- | --- | --- | ------ | ------- | ------- | ----- | --- | --- |
|     |     |     |     |     |     |        |         |         | i=1 i | i 0 |     |
y
|         |     |      |     |      |     | x x          | XOR     | h h              | h      | h (cid:80)4     | w h     |
| ------- | --- | ---- | --- | ---- | --- | ------------ | ------- | ---------------- | ------ | --------------- | ------- |
|         |     |      |     |      |     | 1 2          |         | 1 2              | 3      | 4               | i=1 i i |
|         |     |      |     |      |     | 0 0          | 0       | 1 0              | 0      | 0               | w 1     |
|         | w   | w    | w   | w    |     | 0 1          | 1       | 0 1              | 0      | 0               | w       |
|         |     | 1    | 2   | 3 4  |     |              |         |                  |        |                 | 2       |
| h       |     | h    |     | h    | h   | 1 0          | 1       | 0 0              | 1      | 0               | w       |
|         | 1   | 2    |     | 3    | 4   |              |         |                  |        |                 | 3       |
|         |     |      |     |      |     | 1 1          | 0       | 0 0              | 0      | 1               | w       |
| -1,-1   |     | -1,1 |     | 1,-1 | 1,1 |              |         |                  |        |                 | 4       |
|         |     |      |     |      |     | This         | results | in the following |        | four conditions |         |
| bias=-2 |     |      |     |      |     | to implement |         | XOR: w           | < w ,w | ≥               | w ,w ≥  |
|         |     |      |     |      |     |              |         |                  | 1 0    | 2               | 0 3     |
|         |     |      |     |      |     | w ,w         | <w      |                  |        |                 |         |
|         |     |      |     |      |     | 0            | 4       | 0                |        |                 |         |
|         |     | x 1  |     | x 2  |     |              |         |                  |        |                 |         |
Unlikebefore,therearenocontradictionsnow
| red edge | indicates |     | w = | -1  |     |     |     |     |     |     |     |
| -------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
andthesystemofinequalitiescanbesatisfied
| blue | edge | indicates | w   | = +1 |     |             |     |           |                 |     |         |
| ---- | ---- | --------- | --- | ---- | --- | ----------- | --- | --------- | --------------- | --- | ------- |
|      |      |           |     |      |     | Essentially |     | each w is | now responsible |     | for one |
i
|     |     |     |     |     |     | of the | 4 possible | inputs         | and can  | be    | adjusted |
| --- | --- | --- | --- | --- | --- | ------ | ---------- | -------------- | -------- | ----- | -------- |
|     |     |     |     |     |     | to get | the        | desired output | for that | input |          |
61/69
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

|     |     |     |     |     | It should | be clear                 | that      | the same    | network    |        |
| --- | --- | --- | --- | --- | --------- | ------------------------ | --------- | ----------- | ---------- | ------ |
|     |     |     |     |     | can be    | used to                  | represent | the         | remaining  | 15     |
|     |     | y   |     |     | boolean   | functions                | also      |             |            |        |
|     |     |     |     |     | Each      | boolean                  | function  | will result | in         | a dif- |
|     |     |     |     |     | ferent    | set of non-contradicting |           |             | inequalit- |        |
ieswhichcanbesatisfiedbyappropriately
|     | w w | w   | w   |     |         |      |       |     |     |     |
| --- | --- | --- | --- | --- | ------- | ---- | ----- | --- | --- | --- |
|     | 1   | 2   | 3 4 |     | setting | w ,w | ,w ,w |     |     |     |
| h   | h   |     | h   | h   |         | 1 2  | 3     | 4   |     |     |
| 1   | 2   |     | 3   | 4   |         |      |       |     |     |     |
Try it!
| -1,-1 | -1,1 |     | 1,-1 | 1,1 |     |     |     |     |     |     |
| ----- | ---- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
bias=-2
|           | x 1       |     | x 2  |     |     |     |     |     |     |     |
| --------- | --------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
| red edge  | indicates | w = | -1   |     |     |     |     |     |     |     |
| blue edge | indicates | w   | = +1 |     |     |     |     |     |     |     |
62/69
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

| What if | we have more | than 3 inputs | ?   |     |
| ------- | ------------ | ------------- | --- | --- |
63/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

Again each of the 8 perceptorns will fire only for one of the 8 inputs
Each of the 8 weights in the second layer is responsible for one of the 8 inputs
and can be adjusted to produce the desired output for that input
y
| w 1 w 2 | w 3 w 4 w 5 | w 6 w 7 w 8 |     |
| ------- | ----------- | ----------- | --- |
bias=-3
|     | x   | x x |     |
| --- | --- | --- | --- |
|     | 1   | 2 3 |     |
64/69
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | -------------- | --------------------- | -------- |

| What if | we have n | inputs ? |     |     |
| ------- | --------- | -------- | --- | --- |
65/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

Theorem
Any boolean function of n inputs can be represented exactly by a network of
perceptrons containing 1 hidden layer with 2n perceptrons and one output layer
containing 1 perceptron
Proof (informal:) We just saw how to construct such a network
Note: A network of 2n+1 perceptrons is not necessary but sufficient. For
example, we already saw how to represent AND function with just 1 perceptron
Catch: As n increases the number of perceptrons in the hidden layers obviously
increases exponentially
66/69
MiteshM.Khapra CS7015(DeepLearning): Lecture2

| Again, why | do we | care about boolean | functions ? |     |
| ---------- | ----- | ------------------ | ----------- | --- |
How does this help us with our original problem: which was to predict whether
| we like a | movie or | not? Let us see! |     |     |
| --------- | -------- | ---------------- | --- | --- |
67/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |

|     | y   |     | We  | are | given this | data | about | our past | movie |
| --- | --- | --- | --- | --- | ---------- | ---- | ----- | -------- | ----- |
experience
|     | w1 w2 w3 w4 w5 w6w7 w8 |     |     |      |        |        |           |        |        |
| --- | ---------------------- | --- | --- | ---- | ------ | ------ | --------- | ------ | ------ |
|     |                        |     | For | each | movie, | we are | given the | values | of the |
bias=-3
|      |          |        | various                               |          | factors          | (x ,x ,...,x |           | ) that | we base   |
| ---- | -------- | ------ | ------------------------------------- | -------- | ---------------- | ------------ | --------- | ------ | --------- |
|      |          |        |                                       |          |                  | 1 2          | n         |        |           |
|      |          |        | our                                   | decision | on               | and we       | are also  | also   | given the |
|      | x1 x2 x3 |        | value                                 | of       | y (like/dislike) |              |           |        |           |
|      |          |        | p i                                   | ’s are   | the points       | for which    | the       | output | was 1     |
|     |          |       |                                       |          |                  |              |           |        |           |
| p x  | x ... x  | y = 1  | and                                   | n ’s     | are the          | points       | for which | it     | was 0     |
| 1    | 11 12 1n | 1      |                                       | i        |                  |              |           |        |           |
| p x | x ... x  | y = 1 |                                       |          |                  |              |           |        |           |
| 2   | 21 22 2n | 2     | Thedatamayormaynotbelinearlyseparable |          |                  |              |           |        |           |
| .    | . . .    | . .    |                                       |          |                  |              |           |        |           |
| .   | . . .    | . .   |                                       |          |                  |              |           |        |           |
.  . . . . .  The proof that we just saw tells us that it is
|     |          |       |                                         |       |          |           |                |        |          |
| ---- | -------- | ------ | --------------------------------------- | ----- | -------- | --------- | -------------- | ------ | -------- |
| n x | x ... x  | y = 0 |                                         |       |          |           |                |        |          |
| 1    | k1 k2 kn | i      | possible                                |       | to have  | a network | of perceptrons |        | and      |
|     |          |       |                                         |       |          |           |                |        |          |
| n x | x ... x  | y = 0 | learntheweightsinthisnetworksuchthatfor |       |          |           |                |        |          |
| 2    | j1 j2    | jn j   |                                         |       |          |           |                |        |          |
| .   | . . .    | . .   |                                         |       |          |           |                |        |          |
| .    | . . .    | . .    | any                                     | given | p or     | n the     | output         | of the | network  |
| .    | . . .    | . .    |                                         |       | i        | j         |                |        |          |
|      |          |        | will                                    | be    | the same | as y      | or y (i.e.,    | we     | can sep- |
|      |          |        |                                         |       |          | i         | j              |        |          |
|      |          |        | arate                                   | the   | positive | and       | the negative   |        | points)  |
68/69
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture2 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

| The story so | far ... |     |     |     |
| ------------ | ------- | --- | --- | --- |
Networks of the form that we just saw (containing, an input, output and one
or more hidden layers) are called Multilayer Perceptrons (MLP, in short)
More appropriate terminology would be“Multilayered Network of Perceptrons”
| but MLP | is the more | commonly used | name |     |
| ------- | ----------- | ------------- | ---- | --- |
The theorem that we just saw gives us the representation power of a MLP with
| a single | hidden layer |     |     |     |
| -------- | ------------ | --- | --- | --- |
Specifically, it tells us that a MLP with a single hidden layer can represent any
| boolean | function |     |     |     |
| ------- | -------- | --- | --- | --- |
69/69
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture2 |
| --- | --- | -------------- | --------------------- | -------- |
