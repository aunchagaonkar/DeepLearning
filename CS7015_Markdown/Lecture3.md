| CS7015 | (Deep Learning) | : Lecture | 3   |
| ------ | --------------- | --------- | --- |
Sigmoid Neurons, Gradient Descent, Feedforward Neural Networks,
| Representation | Power of | Feedforward Neural | Networks |
| -------------- | -------- | ------------------ | -------- |
|                | Mitesh   | M. Khapra          |          |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/70
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | -------------- | --------------------- | -------- |

Acknowledgements
For Module 3.4, I have borrowed ideas from the videos by Ryan Harris on
| “visualize backpropagation” |     | (available | on youtube) |     |     |
| --------------------------- | --- | ---------- | ----------- | --- | --- |
a
For Module 3.5, I have borrowed ideas from this excellent book which is
| available online |     |     |     |     |     |
| ---------------- | --- | --- | --- | --- | --- |
I am sure I would have been influenced and borrowed ideas from other sources
| and I apologize | if I have | failed to acknowledge |     | them |     |
| --------------- | --------- | --------------------- | --- | ---- | --- |
ahttp://neuralnetworksanddeeplearning.com/chap4.html
2/70
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture3 |
| --- | -------------- | --- | --------------------- | --- | -------- |

| Module | 3.1: Sigmoid | Neuron |     |     |
| ------ | ------------ | ------ | --- | --- |
3/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

| The story ahead | ...     |            |     |     |
| --------------- | ------- | ---------- | --- | --- |
| Enough about    | boolean | functions! |     |     |
What about arbitrary functions of the form y = f(x) where x ∈ Rn (instead of
| {0,1}n) and | y ∈ R (instead | of {0,1}) | ?   |     |
| ----------- | -------------- | --------- | --- | --- |
Can we have a network which can (approximately) represent such functions ?
Before answering the above question we will have to first graduate from per-
| ceptrons | to sigmoidal | neurons | ... |     |
| -------- | ------------ | ------- | --- | --- |
4/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

Recall
A perceptron will fire if the weighted sum of its inputs is greater than the
threshold (-w )
0
5/70
MiteshM.Khapra CS7015(DeepLearning): Lecture3

y
|     |     | The thresholding |         | logic | used by a     | perceptron |     |
| --- | --- | ---------------- | ------- | ----- | ------------- | ---------- | --- |
|     |     | is very          | harsh ! |       |               |            |     |
|     |     | For example,     | let     | us    | return to our | problem    | of  |
bias = w = −0.5
0
decidingwhetherwewilllikeordislikeamovie
Considerthatwebaseourdecisiononlyonone
| w = 1 |     | input (x | = criticsRating |     | which | lies between |     |
| ----- | --- | -------- | --------------- | --- | ----- | ------------ | --- |
| 1     |     |          | 1               |     |       |              |     |
0 and 1)
x
1
|     |     | Ifthethresholdis0.5(w |     |     | = −0.5)andw |     | = 1 |
| --- | --- | --------------------- | --- | --- | ----------- | --- | --- |
|     |     |                       |     |     | 0           |     | 1   |
criticsRating
|     |     | then what          | would | be    | the decision       | for a | movie |
| --- | --- | ------------------ | ----- | ----- | ------------------ | ----- | ----- |
|     |     | with criticsRating |       | =     | 0.51 ? (like)      |       |       |
|     |     | What about         | a     | movie | with criticsRating |       | =     |
0.49 ? (dislike)
Itseemsharshthatwewouldlikeamoviewith
|     |     | rating 0.51 | but | not | one with a rating | of  | 0.49 |
| --- | --- | ----------- | --- | --- | ----------------- | --- | ---- |
6/70
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture3 |     |     |
| --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     |     |     |     | This behavior |     | is not | a characteristic |     | of the |
| --- | --- | --- | --- | ------------- | --- | ------ | ---------------- | --- | ------ |
1
|     |     |     |     | specific | problem       | we  | chose   | or the | specific |
| --- | --- | --- | --- | -------- | ------------- | --- | ------- | ------ | -------- |
|     |     |     |     | weight   | and threshold |     | that we | chose  |          |
Itisacharacteristicoftheperceptronfunction
| y   |     |     |     | itself which | behaves | like | a step | function |     |
| --- | --- | --- | --- | ------------ | ------- | ---- | ------ | -------- | --- |
Therewillalwaysbethissuddenchangeinthe
(cid:80)n
|     |     |     |     | decision | (from | 0 to 1) | when | w   | i x i crosses |
| --- | --- | --- | --- | -------- | ----- | ------- | ---- | --- | ------------- |
i=1
|     |     |     |     | the threshold | (-w | )   |     |     |     |
| --- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- |
0
|     |     |      |     | For most | real       | world | applications |          | we would |
| --- | --- | ---- | --- | -------- | ---------- | ----- | ------------ | -------- | -------- |
|     |     | -w 0 |     | expect   | a smoother |       | decision     | function | which    |
(cid:80)n
|     | z=  |     | w x | gradually | changes | from | 0 to 1 |     |     |
| --- | --- | --- | --- | --------- | ------- | ---- | ------ | --- | --- |
|     |     | i=1 | i i |           |         |      |        |     |     |
7/70
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture3 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     |     |     |     | Introducing | sigmoid |     | neurons | where | the | out- |
| --- | --- | --- | --- | ----------- | ------- | --- | ------- | ----- | --- | ---- |
1
|     |     |     |     | put function |     | is much | smoother | than | the | step |
| --- | --- | --- | --- | ------------ | --- | ------- | -------- | ---- | --- | ---- |
function
Hereisoneformofthesigmoidfunctioncalled
| y   |     |     |     | the logistic | function |     |     |     |     |     |
| --- | --- | --- | --- | ------------ | -------- | --- | --- | --- | --- | --- |
1
y =
1+e−(w0+(cid:80)n
wixi)
i=1
|     |     |           |     | We no         | longer  | see a        | sharp     | transition | around |     |
| --- | --- | --------- | --- | ------------- | ------- | ------------ | --------- | ---------- | ------ | --- |
|     |     | -w 0      |     | the threshold |         | -w           |           |            |        |     |
|     |     | (cid:80)n |     |               |         | 0            |           |            |        |     |
|     | z=  |           | w x | Also the      | output  | y is         | no longer | binary     | but    | a   |
|     |     | i=1       | i i |               |         |              |           |            |        |     |
|     |     |           |     | real value    | between | 0            | and       | 1 which    | can be | in- |
|     |     |           |     | terpreted     | as a    | probability  |           |            |        |     |
|     |     |           |     | Instead       | of a    | like/dislike | decision  |            | we get | the |
|     |     |           |     | probability   | of      | liking       | the movie |            |        |     |
8/70
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture3 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     | Perceptron |     |     |     | Sigmoid | (logistic) |     | Neuron |     |
| --- | ---------- | --- | --- | --- | ------- | ---------- | --- | ------ | --- |
y
y
σ
| w =−θ | w   | w .. | .. w |     |         | w   | w .. | .. w |     |
| ----- | --- | ---- | ---- | --- | ------- | --- | ---- | ---- | --- |
| 0     |     | 1 2  | n    |     | w 0 =−θ | 1   | 2    | n    |     |
| x =   | 1 x | x .. | ..   | x   | x = 1   | x x | ..   | ..   | x   |
| 0     | 1   | 2    |      | n   | 0       | 1   | 2    |      | n   |
n
|     |     | (cid:88)  |       |     |     |                | 1   |     |     |
| --- | --- | --------- | ----- | --- | --- | -------------- | --- | --- | --- |
|     |     |           |       |     |     | y =            |     |     |     |
| y   | = 1 | if w i ∗x | i ≥ 0 |     |     | 1+e−((cid:80)n |     |     |     |
i=0 wixi)
i=0
n
(cid:88)
|     | = 0 | if w ∗x | < 0 |     |     |     |     |     |     |
| --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
i i
i=0
9/70
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture3 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- | --- | --- |

|             | Perceptron     |              |         | Sigmoid Neuron |                |
| ----------- | -------------- | ------------ | ------- | -------------- | -------------- |
| 1           |                |              | 1       |                |                |
| y           |                |              | y       |                |                |
|             | -w             |              |         | -w             |                |
|             |                | 0            |         |                | 0              |
|             | (cid:80)n      |              |         | (cid:80)n      |                |
|             | z=             | w x          |         | z=             | w x            |
|             |                | i i          |         |                | i i            |
|             | i=1            |              |         | i=1            |                |
| Not smooth, | not continuous | (at w0), not |         |                |                |
|             |                |              | Smooth, | continuous,    | differentiable |
differentiable
10/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Module | 3.2: A typical | Supervised | Machine | Learning |
| ------ | -------------- | ---------- | ------- | -------- |
Setup
11/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

|         |            |        |     | What next  | ?           |                  |              |
| ------- | ---------- | ------ | --- | ---------- | ----------- | ---------------- | ------------ |
| Sigmoid | (logistic) | Neuron |     |            |             |                  |              |
|         |            |        |     | Well, just | as we       | had an algorithm | for learn-   |
|         |            | y      |     | ing the    | weights     | of a perceptron, | we also need |
|         |            |        |     | a way      | of learning | the weights      | of a sigmoid |
neuron
Beforeweseesuchanalgorithmwewillrevisit
|         |     |       |      | the concept | of error |     |     |
| ------- | --- | ----- | ---- | ----------- | -------- | --- | --- |
|         | w w | .. .. | w    |             |          |     |     |
| w 0 =−θ | 1 2 |       | n    |             |          |     |     |
| x = 1   | x x | ..    | .. x |             |          |     |     |
| 0       | 1 2 |       | n    |             |          |     |     |
12/70
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- |

| Earlier   | we mentioned  |           | that    | a single | perceptron   | cannot       |
| --------- | ------------- | --------- | ------- | -------- | ------------ | ------------ |
| deal with | this          | data      | because | it is    | not linearly | separable    |
| What      | does “cannot  |           | deal    | with”    | mean?        |              |
| What      | would happen  |           | if we   | use      | a perceptron | model to     |
| classify  | this data     | ?         |         |          |              |              |
| We would  | probably      |           | end     | up with  | a line like  | this ...     |
| This line | doesn’t       | seem      | to      | be too   | bad          |              |
| Sure, it  | misclassifies |           | 3 blue  | points   | and          | 3 red points |
| but we    | could         | live with | this    | error    | in most      | real world   |
applications
| From now  | on,     | we will | accept   |       | that it is   | hard to drive |
| --------- | ------- | ------- | -------- | ----- | ------------ | ------------- |
| the error | to 0    | in most | cases    | and   | will instead | aim to        |
| reach the | minimum |         | possible | error |              |               |
13/70
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture3 |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- |

This brings us to a typical machine learning setup which has the following
components...
| Data: {x | ,y }n |     |     |     |
| -------- | ----- | --- | --- | --- |
i i i=1
Model: Our approximation of the relation between x and y. For example,
1
yˆ=
1+e−(wTx)
|     |     | or yˆ= | wTx |     |
| --- | --- | ------ | --- | --- |
xTWx
or yˆ=
| or just about | any function |     |     |     |
| ------------- | ------------ | --- | --- | --- |
Parameters: Inalltheabovecases,wisaparameterwhichneedstobelearned
| from the data |     |     |     |     |
| ------------- | --- | --- | --- | --- |
Learning algorithm: An algorithm for learning the parameters (w) of the
model (for example, perceptron learning algorithm, gradient descent, etc.)
Objective/Loss/Errorfunction: Toguidethelearningalgorithm-thelearn-
| ing algorithm | should aim | to minimize | the loss function |     |
| ------------- | ---------- | ----------- | ----------------- | --- |
14/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

| As an illustration, |              | consider | our movie        | example |     |     |
| ------------------- | ------------ | -------- | ---------------- | ------- | --- | --- |
| Data:               | {x = movie,y |          | = like/dislike}n |         |     |     |
|                     | i            |          | i                |         | i=1 |     |
Model: Our approximation of the relation between x and y (the probability
| of liking | a movie). |     |     |     |     |     |
| --------- | --------- | --- | --- | --- | --- | --- |
1
yˆ=
1+e−(wTx)
| Parameter:           | w          |     |           |         |                 |           |
| -------------------- | ---------- | --- | --------- | ------- | --------------- | --------- |
| Learning             | algorithm: |     | Gradient  | Descent | [we will        | see soon] |
| Objective/Loss/Error |            |     | function: |         | One possibility | is        |
n
(cid:88)
|     |     |     | L(w) |     | )2           |     |
| --- | --- | --- | ---- | --- | ------------ | --- |
|     |     |     |      |     | = (yˆ i −y i |     |
i=1
The learning algorithm should aim to find a w which minimizes the above
| function | (squared | error | between | y   | and yˆ) |     |
| -------- | -------- | ----- | ------- | --- | ------- | --- |
15/70
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture3 |
| --- | --- | --- | -------------- | --- | --------------------- | -------- |

| Module | 3.3: Learning | Parameters: | (Infeasible) | guess |
| ------ | ------------- | ----------- | ------------ | ----- |
work
16/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     |     |     |     | Keeping | this supervised |     | ML  | setup | in mind, |
| --- | --- | --- | --- | --- | ------- | --------------- | --- | --- | ----- | -------- |
y
|     |     |     |     |     | we will      | now focus  | on this  | model | and        | discuss  |
| --- | --- | --- | --- | --- | ------------ | ---------- | -------- | ----- | ---------- | -------- |
|     |     |     |     |     | an algorithm | for        | learning | the   | parameters |          |
|     |     |     |     |     | of this      | model from | some     | given | data       | using an |
σ
|      |       |     |       |      | appropriate     | objective       |         | function |               |           |
| ---- | ----- | --- | ----- | ---- | --------------- | --------------- | ------- | -------- | ------------- | --------- |
|      |       |     |       |      | σ stands        | for the         | sigmoid | function |               | (logistic |
|      |       | w w | .. .. | w    | function        | in this case)   |         |          |               |           |
| w 0  | =−θ   | 1 2 |       | n    |                 |                 |         |          |               |           |
|      |       |     |       |      | For ease        | of explanation, |         | we       | will consider | a         |
| x    | = 1 x | x   | ..    | .. x |                 |                 |         |          |               |           |
| 0    |       | 1 2 |       | n    |                 |                 |         |          |               |           |
|      |       |     |       |      | very simplified | version         |         | of the   | model         | having    |
| f(x) | =     | 1   |       |      | just 1 input    |                 |         |          |               |           |
1+e−(w·x+b)
|     |     |     |     |     | Further  | to be consistent |       | with | the literature, |          |
| --- | --- | --- | --- | --- | -------- | ---------------- | ----- | ---- | --------------- | -------- |
|     |     |     |     |     | from now | on, we will      | refer | to w | as              | b (bias) |
0
| x   |     | σ   | yˆ= | f(x) |            |               |             |         |             |      |
| --- | --- | --- | --- | ---- | ---------- | ------------- | ----------- | ------- | ----------- | ---- |
|     | w   |     |     |      | Lastly,    | instead of    | considering |         | the problem | of   |
|     |     |     |     |      | predicting | like/dislike, |             | we will | assume      | that |
b
1
|      |             |     |     |                | we want               | to predict | criticsRating(y) |            |         | given |
| ---- | ----------- | --- | --- | -------------- | --------------------- | ---------- | ---------------- | ---------- | ------- | ----- |
|      |             |     |     |                | imdbRating(x)         | (for       | no               | particular | reason) |       |
| f(x) | =           | 1   |     |                |                       |            |                  |            |         | 17/70 |
|      | 1+e−(w·x+b) |     |     | MiteshM.Khapra | CS7015(DeepLearning): |            | Lecture3         |            |         |       |

| x   | σ   | yˆ= f(x) |     |     |     |     |     |
| --- | --- | -------- | --- | --- | --- | --- | --- |
w
|     |     |     | Input for | training |            |       |     |
| --- | --- | --- | --------- | -------- | ---------- | ----- | --- |
| b   |     |     | }N        |          |            |       |     |
| 1   |     |     | {x ,y     | →        | N pairs of | (x,y) |     |
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
|     |     |     | find      | w*, b*      | such that:     |              |      |
|     |     |     | f(0.5)    | →           | 0.2 and f(2.5) | → 0.9        |      |
18/70
|     |     | MiteshM.Khapra | CInS70o1t5h(DeerepwLoearrdnisn.g.).: |              | Lecture3  |               |          |
| --- | --- | -------------- | ------------------------------------ | ------------ | --------- | ------------- | -------- |
|     |     |                | We                                   | hope         | to find a | sigmoid       | function |
|     |     |                | such                                 | that         | (0.5,0.2) | and (2.5,0.9) | lie      |
|     |     |                | on                                   | this sigmoid |           |               |          |

| Let us | see this | in more | detail.... |     |
| ------ | -------- | ------- | ---------- | --- |
19/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
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
|     |        |     |      | i    | i   |     |     |
2
i=1
1
|     |     | =   | ∗(y −f(x | ))2+(y | −f(x |     | ))2 |
| --- | --- | --- | -------- | ------ | ---- | --- | --- |
|     |     |     | 2 1      | 1      | 2    | 2   |     |
1
σ(x) = 1
1+e−(wx+b) = ∗(0.9−f(2.5))2+(0.2−f(0.5))2
2
= 0.073
|                | We want | L(w,b)                | to be | as close | to 0 as  | possible | 20/70 |
| -------------- | ------- | --------------------- | ----- | -------- | -------- | -------- | ----- |
| MiteshM.Khapra |         | CS7015(DeepLearning): |       |          | Lecture3 |          |       |

|     | Let | us     | try some | other | values | of       | w, b     |     |
| --- | --- | ------ | -------- | ----- | ------ | -------- | -------- | --- |
|     |     |        |          | w     |        | b L(w,b) |          |     |
|     |     |        |          | 0.50  | 0.00   |          | 0.0730   |     |
|     |     |        |          | -0.10 | 0.00   |          | 0.1481   |     |
|     |     |        |          | 0.94  | -0.94  |          | 0.0214   |     |
|     |     |        |          | 1.42  | -1.73  |          | 0.0028   |     |
|     |     |        |          | 1.65  | -2.08  |          | 0.0003   |     |
|     |     |        |          | 1.78  | -2.27  |          | 0.0000   |     |
|     |     | Oops!! | this     | made  | things | even     | worse... |     |
1
| σ(x) = |     | Perhaps |     | it would | help | to push | w   | and b in the |
| ------ | --- | ------- | --- | -------- | ---- | ------- | --- | ------------ |
1+e−(wx+b)
|     |     | other | direction... |       |      |                 |           |                |
| --- | --- | ----- | ------------ | ----- | ---- | --------------- | --------- | -------------- |
|     |     | Let   | us keep      | going | in   | this direction, |           | i.e., increase |
|     |     | w     | and decrease |       | b    |                 |           |                |
|     |     | With  | some         | guess | work | and             | intuition | we were able   |
21/70
|     |                | to  | find the | right                 | values | for      | w and | b   |
| --- | -------------- | --- | -------- | --------------------- | ------ | -------- | ----- | --- |
|     | MiteshM.Khapra |     |          | CS7015(DeepLearning): |        | Lecture3 |       |     |

| Let us | look at | something | better than | our “guess | work” |
| ------ | ------- | --------- | ----------- | ---------- | ----- |
algorithm....
22/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
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
23/70
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |     |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- | --- |

| Let us | look at | the geometric | interpretation |         | of our        |
| ------ | ------- | ------------- | -------------- | ------- | ------------- |
| “guess | work”   | algorithm     | in terms       | of this | error surface |
24/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |
| --- | --- | -------------- | --------------------- | --- | -------- |

25/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

26/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

27/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

28/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

29/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

30/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

31/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

| Module | 3.4: Learning | Parameters | : Gradient | Descent |
| ------ | ------------- | ---------- | ---------- | ------- |
32/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

| Now let    | us see | if there | is a more | efficient | and |
| ---------- | ------ | -------- | --------- | --------- | --- |
| principled | way    | of doing | this      |           |     |
33/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |
| --- | --- | -------------- | --------------------- | --- | -------- |

Goal
Find a better way of traversing the error surface so that we can reach the
minimum value quickly without resorting to brute force search!
34/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

vector of parameters,
say, randomly initial-
ized
|             |     | We moved | in the direc- |
| ----------- | --- | -------- | ------------- |
| θ = [w,b] θ | θ   |          |               |
new
tion of ∆θ
∆θ = [∆w,∆b]
η·∆θ ∆θ
|     |     | Let us be | a bit conservat- |
| --- | --- | --------- | ---------------- |
change in the
ive: moveonlybyasmall
values of w, b
|     |     | amount | η   |
| --- | --- | ------ | --- |
θ = θ+η·∆θ
new
| Question: | What is | the right ∆θ | to use |
| --------- | ------- | ------------ | ------ |
?
| The | answer comes from | Taylor series |     |
| --- | ----------------- | ------------- | --- |
35/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| -------------- | --------------------- | -------- | --- |

For ease of notation, let ∆θ = u, then from Taylor series, we have,
|         |     |              |     |       | η2                     | η3          | η4   |
| ------- | --- | ------------ | --- | ----- | ---------------------- | ----------- | ---- |
| L(θ+ηu) |     | L(θ)+η∗uT∇   |     | L(θ)+ | ∗uT∇2L(θ)u+            |             |      |
|         |     | =            |     |       |                        | ∗...+       | ∗... |
|         |     |              |     | θ     | 2!                     | 3!          | 4!   |
|         |     | = L(θ)+η∗uT∇ |     | L(θ)  | [η is typically small, | so η2,η3,.. | → 0] |
θ
| Note that | the | move (ηu) | would | be favorable | only if, |     |     |
| --------- | --- | --------- | ----- | ------------ | -------- | --- | --- |
L(θ+ηu)−L(θ)
|     |     |     | < 0 [i.e., | if the | new loss is less than | the previous | loss] |
| --- | --- | --- | ---------- | ------ | --------------------- | ------------ | ----- |
This implies,
| uT∇ | L(θ) | < 0 |     |     |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- |
θ
36/70
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture3 |     |
| --- | --- | --- | -------------- | --- | --------------------- | -------- | --- |

| Okay, so | we have, |     |     |     |     |     |
| -------- | -------- | --- | --- | --- | --- | --- |
uT∇ L(θ)
|           |        |                   | θ     | < 0        |     |     |
| --------- | ------ | ----------------- | ----- | ---------- | --- | --- |
| But, what | is the | range of uT∇ L(θ) | ? Let | us see.... |     |     |
θ
| Let β be | the angle | between u and | ∇ L(θ), | then | we know | that, |
| -------- | --------- | ------------- | ------- | ---- | ------- | ----- |
θ
|     |     |     |     | uT∇ L(θ) |     |     |
| --- | --- | --- | --- | -------- | --- | --- |
θ
|     |     | −1 ≤ cos(β) | =         |        | ≤   | 1   |
| --- | --- | ----------- | --------- | ------ | --- | --- |
|     |     |             | ||u||∗||∇ | L(θ)|| |     |     |
θ
| multiply | throughout | by k = ||u||∗||∇ | L(θ)|| |     |     |     |
| -------- | ---------- | ---------------- | ------ | --- | --- | --- |
θ
|     |     |               |     | uT∇ L(θ) |     |     |
| --- | --- | ------------- | --- | -------- | --- | --- |
|     |     | −k ≤ k∗cos(β) | =   | θ        | ≤ k |     |
Thus, L(θ+ηu)−L(θ) = uT∇ L(θ) = k∗cos(β) will be most negative when
θ
| cos(β) | = −1 i.e., | when β is 180° |     |     |     |     |
| ------ | ---------- | -------------- | --- | --- | --- | --- |
37/70
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture3 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

| Gradient Descent | Rule |     |     |     |
| ---------------- | ---- | --- | --- | --- |
The direction u that we intend to move in should be at 180° w.r.t. the gradient
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
| where,∇w | =   |     | ,∇b = |     |
| -------- | --- | --- | ----- | --- |
t
|     | ∂w  |              | ∂b  |              |
| --- | --- | ------------ | --- | ------------ |
|     |     | at w=wt,b=bt |     | at w=wt,b=bt |
So we now have a more principled way of moving in the w-b plane than our “guess
work” algorithm
38/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

| Let us     | create an algorithm | from this | rule ... |     |
| ---------- | ------------------- | --------- | -------- | --- |
| Algorithm: | gradient            | descent() |          |     |
t ← 0;
| max iterations | ←                  | 1000; |     |     |
| -------------- | ------------------ | ----- | --- | --- |
| while          | t < max iterations | do    |     |     |
| w              | ← w −η∇w           | ;     |     |     |
| t+1            | t                  | t     |     |     |
| b              | ← b −η∇b           | ;     |     |     |
| t+1            | t                  | t     |     |     |
t ← t+1;
end
Toseethisalgorithminpracticeletusfirstderive∇w and∇bforourtoyneural
network
39/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
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
40/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |
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
41/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |     |
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
42/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

43/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

44/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

Later on in the course we will look at gradient descent in much more detail and
| discuss its | variants |     |     |     |
| ----------- | -------- | --- | --- | --- |
For the time being it suffices to know that we have an algorithm for learning
| the parameters | of a sigmoid    | neuron |     |     |
| -------------- | --------------- | ------ | --- | --- |
| So where       | do we head from | here ? |     |     |
45/70
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture3 |
| --- | -------------- | --- | --------------------- | -------- |

| Module  | 3.5: Representation |         | Power | of a Multilayer |
| ------- | ------------------- | ------- | ----- | --------------- |
| Network | of Sigmoid          | Neurons |       |                 |
46/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

Representation power of a mul- Representation power of a mul-
tilayer network of perceptrons tilayer network of sigmoid neurons
A multilayer network of perceptrons with A multilayer network of neurons with a
a single hidden layer can be used to rep- single hidden layer can be used to approx-
resent anyboolean functionprecisely(no imate any continuous function to any
errors) desired precision
|     | In other                            | words, there     | is a guarantee |          | that |
| --- | ----------------------------------- | ---------------- | -------------- | -------- | ---- |
|     | for any                             | function f(x)    | : Rn           | → Rm,    | we   |
|     | can always                          | find a neural    | network        | (with    | 1    |
|     | hidden                              | layer containing | enough         | neurons) |      |
|     | whoseoutputg(x)satisfies|g(x)−f(x)| |                  |                |          | <    |
(cid:15) !!
Proof: Wewillseeanillustrativeproofof
|     | this... [Cybenko, | 1989], | [Hornik, | 1991] |     |
| --- | ----------------- | ------ | -------- | ----- | --- |
47/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |     |
| -------------- | --------------------- | -------- | --- | --- | --- |

link(cid:63)
| See this | for an excellent | illustration | of this proof |     |
| -------- | ---------------- | ------------ | ------------- | --- |
The discussion in the next few slides is based on the ideas presented at the
above link
(cid:63)http://neuralnetworksanddeeplearning.com/chap4.html 48/70
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture3 |
| --- | -------------- | --- | --------------------- | -------- |

Weareinterestedinknowingwhether
|     | a network  | of neurons   | can be         | used to   |
| --- | ---------- | ------------ | -------------- | --------- |
|     | represent  | an arbitrary | function       | (like     |
|     | the one    | shown        | in the figure) |           |
|     | We observe | that         | such an        | arbitrary |
functioncanbeapproximatedbysev-
|     | eral “tower” | functions  |                   |         |
| --- | ------------ | ---------- | ----------------- | ------- |
|     | More         | the number | of such           | “tower” |
|     | functions,   | better     | the approximation |         |
Tobemoreprecise,wecanapproxim-
|     | ate any | arbitrary | function  | by a sum |
| --- | ------- | --------- | --------- | -------- |
|     | of such | “tower”   | functions |          |
49/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

|     |     | We make       | a few observations |               |
| --- | --- | ------------- | ------------------ | ------------- |
|     |     | All these     | “tower” functions  | are sim-      |
|     |     | ilar and      | only differ in     | their heights |
|     |     | and positions | on the x-axis      |               |
|     |     | Suppose       | there is a black   | box which     |
|     |     | takes the     | original input     | (x) and con-  |
+
|     |     | structs | these tower functions |     |
| --- | --- | ------- | --------------------- | --- |
. . .
|     |     | We can    | then have a simple | network   |
| --- | --- | --------- | ------------------ | --------- |
| . . | .   | which can | just add them      | up to ap- |
|     |     | proximate | the function       |           |
Tower Tower . . . TTTooowwweeerrr Tower Our job now is to figure out what is
|             |                       | inside this | blackbox |     |
| ----------- | --------------------- | ----------- | -------- | --- |
| maker maker | mmmaaakkkeeerrr maker |             |          |     |
. . .
x
50/70
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| --- | -------------- | --------------------- | -------- | --- |

| We will figure | this out over | the next | few slides ... |     |
| -------------- | ------------- | -------- | -------------- | --- |
51/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

Ifwetakethelogisticfunctionandset
|     |     |     | w to a   | very high value | we will recover |     |
| --- | --- | --- | -------- | --------------- | --------------- | --- |
|     |     |     | the step | function        |                 |     |
Letusseewhathappensaswechange
|     |     |     | the value  | of w          |               |      |
| --- | --- | --- | ---------- | ------------- | ------------- | ---- |
|     |     |     | Further    | we can adjust | the value     | of b |
|     |     |     | to control | the position  | on the x-axis |      |
atwhichthefunctiontransitionsfrom
|     |     |     | 0 to 1 |     |     |     |
| --- | --- | --- | ------ | --- | --- | --- |
52/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |
| --- | --- | -------------- | --------------------- | -------- | --- | --- |
1
| σ(x) = | w   | = 0,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 1,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 2,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 3,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 4,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 5,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 6,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 7,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 8,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 9,b = 0 |     |     |     |     |
| ------ | --- | --------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 10,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 11,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 12,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 13,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 14,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 15,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 16,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 17,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 18,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 19,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 20,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 21,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 22,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 23,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 24,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 25,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 26,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 27,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 28,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 29,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 30,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 31,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 32,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 33,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 34,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 35,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 36,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 37,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 38,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 39,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 40,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 41,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 42,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 43,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 44,b = 0 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 1 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 2 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 3 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 4 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 5 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 6 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 7 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 8 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 9 |     |     |     |     |
| ------ | --- | ---------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 10 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 11 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 12 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 13 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 14 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 15 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 16 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 17 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 18 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 19 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 20 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 21 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 22 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 23 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 24 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 25 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 26 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 27 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 28 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 29 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 30 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 31 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 32 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
| σ(x) = | 1 w | = 50,b = 33 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 34 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)
1
| σ(x) = | w   | = 50,b = 35 |     |     |     |     |
| ------ | --- | ----------- | --- | --- | --- | --- |
1+e−(wx+b)

|     | Now let  | us see  | what we   | get by | taking |
| --- | -------- | ------- | --------- | ------ | ------ |
|     | two such | sigmoid | functions | (with  | dif-   |
b(cid:48)s)
|     | ferent    | and     | subtracting | one      | from |
| --- | --------- | ------- | ----------- | -------- | ---- |
|     | the other |         |             |          |      |
|     | Voila!    | We have | our tower   | function | !!   |
53/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |     |
| -------------- | --------------------- | -------- | --- | --- | --- |

Canwecomeupwithaneuralnetworktorepresentthisoperationofsubtracting
| one sigmoid | function from | another | ?   |     |
| ----------- | ------------- | ------- | --- | --- |
54/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

55/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

|     | What if       | we have  | more      | than        | one input?   |              |
| --- | ------------- | -------- | --------- | ----------- | ------------ | ------------ |
|     | Suppose       | we are   | trying    | to take     | a decision   |              |
|     | about whether |          | we        | will find   | oil at       | a particular |
|     | location      | on the   | ocean     | bed(Yes/No) |              |              |
|     | Further,      | suppose  | we        | base        | our decision | on two       |
|     | factors:      | Salinity | (x        | ) and       | Pressure     | (x )         |
|     |               |          |           | 1           |              | 2            |
|     | We are        | given    | some      | data and    | it seems     | that         |
|     | y(oil|no-oil) | is       | a complex | function    |              | of x and     |
1
x 2
|     | We want | a neural | network |     | to approximate |     |
| --- | ------- | -------- | ------- | --- | -------------- | --- |
this function
56/70
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture3 |     |     |
| -------------- | --------------------- | --- | --- | -------- | --- | --- |

This is what a 2-dimensional sigmoid
1 looks like
y =
1+e−(w1x1+w2x2+b)
We need to figure out how to get a
tower in this case
First, let us set w to 0 and see if we
2
can get a two dimensional step func-
tion
What would happen if we change b ?
57/70
MiteshM.Khapra CS7015(DeepLearning): Lecture3
w = 2,w = 0,b = 0
1 2
w = 3,w = 0,b = 0
1 2
w = 4,w = 0,b = 0
1 2
w = 5,w = 0,b = 0
1 2
w = 6,w = 0,b = 0
1 2
w = 7,w = 0,b = 0
1 2
w = 8,w = 0,b = 0
1 2
w = 9,w = 0,b = 0
1 2
w = 10,w = 0,b = 0
1 2
w = 11,w = 0,b = 0
1 2
w = 12,w = 0,b = 0
1 2
w = 13,w = 0,b = 0
1 2
w = 14,w = 0,b = 0
1 2
w = 15,w = 0,b = 0
1 2
w = 16,w = 0,b = 0
1 2
w = 17,w = 0,b = 0
1 2
w = 18,w = 0,b = 0
1 2
w = 19,w = 0,b = 0
1 2
w = 20,w = 0,b = 0
1 2
w = 21,w = 0,b = 0
1 2
w = 22,w = 0,b = 0
1 2
w = 23,w = 0,b = 0
1 2
w = 24,w = 0,b = 0
1 2

|     | This is what | a 2-dimensional | sigmoid |     |
| --- | ------------ | --------------- | ------- | --- |
1
|     | looks like |     |     |     |
| --- | ---------- | --- | --- | --- |
y =
1+e−(w1x1+w2x2+b)
|     | We need    | to figure out | how to    | get a |
| --- | ---------- | ------------- | --------- | ----- |
|     | tower in   | this case     |           |       |
|     | First, let | us set w to   | 0 and see | if we |
2
|     | can get a | two dimensional | step | func- |
| --- | --------- | --------------- | ---- | ----- |
tion
|     | What would | happen | if we change | b ? |
| --- | ---------- | ------ | ------------ | --- |
58/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |
| -------------- | --------------------- | -------- | --- | --- |
w = 25,w = 0,b = 0
1 2
w = 25,w = 0,b = 5
1 2
w 1 = 25,w 2 = 0,b = 10
w = 25,w = 0,b = 15
1 2
w = 25,w = 0,b = 20
1 2
w 1 = 25,w 2 = 0,b = 25
w = 25,w = 0,b = 30
1 2
w = 25,w = 0,b = 35
1 2
w = 25,w = 0,b = 40
1 2
w 1 = 25,w 2 = 0,b = 45

|     | What if       | we take two       | such step func- |
| --- | ------------- | ----------------- | --------------- |
|     | tions (with   | different         | b values) and   |
|     | subtract      | one from the      | other           |
|     | We still      | don’t get a tower | (or we get      |
|     | a tower which | is open           | from two sides) |
59/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| -------------- | --------------------- | -------- | --- |

Now let us set w to 0 and adjust w
1 2
1 to get a 2-dimensional step function
y =
1+e−(w1x1+w2x2+b) with a different orientation
And now we change b
60/70
MiteshM.Khapra CS7015(DeepLearning): Lecture3
w = 0,w = 2,b = 0
1 2
w = 0,w = 3,b = 0
1 2
w = 0,w = 4,b = 0
1 2
w = 0,w = 5,b = 0
1 2
w = 0,w = 6,b = 0
1 2
w = 0,w = 7,b = 0
1 2
w = 0,w = 8,b = 0
1 2
w = 0,w = 9,b = 0
1 2
w = 0,w = 10,b = 0
1 2
w = 0,w = 11,b = 0
1 2
w = 0,w = 12,b = 0
1 2
w = 0,w = 13,b = 0
1 2
w = 0,w = 14,b = 0
1 2
w = 0,w = 15,b = 0
1 2
w = 0,w = 16,b = 0
1 2
w = 0,w = 17,b = 0
1 2
w = 0,w = 18,b = 0
1 2
w = 0,w = 19,b = 0
1 2
w = 0,w = 20,b = 0
1 2
w = 0,w = 21,b = 0
1 2
w = 0,w = 22,b = 0
1 2
w = 0,w = 23,b = 0
1 2
w = 0,w = 24,b = 0
1 2

|     | Now let | us set w to | 0 and adjust | w   |
| --- | ------- | ----------- | ------------ | --- |
|     |         | 1           |              | 2   |
1
|     | to get a | 2-dimensional | step function |     |
| --- | -------- | ------------- | ------------- | --- |
y =
1+e−(w1x1+w2x2+b)
|     | with a different | orientation |     |     |
| --- | ---------------- | ----------- | --- | --- |
|     | And now          | we change   | b   |     |
61/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |     |
| -------------- | --------------------- | -------- | --- | --- |
w = 0,w = 25,b = 0
1 2
w = 0,w = 25,b = 5
1 2
w 1 = 0,w 2 = 25,b = 10
w = 0,w = 25,b = 15
1 2
w = 0,w = 25,b = 20
1 2
w 1 = 0,w 2 = 25,b = 25
w = 0,w = 25,b = 30
1 2
w = 0,w = 25,b = 35
1 2
w = 0,w = 25,b = 40
1 2
w 1 = 0,w 2 = 25,b = 45

|     | Again, what | if we take | two such step |
| --- | ----------- | ---------- | ------------- |
functions(withdifferentbvalues)and
|     | subtract           | one from the       | other        |
| --- | ------------------ | ------------------ | ------------ |
|     | We still           | don’t get a tower  | (or we get   |
|     | a tower            | which is open from | two sides)   |
|     | Notice that        | this open tower    | has a dif-   |
|     | ferent orientation | from               | the previous |
one
62/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| -------------- | --------------------- | -------- | --- |

|     | Now what  | will    | we        | get by | adding two  |
| --- | --------- | ------- | --------- | ------ | ----------- |
|     | such open | towers  | ?         |        |             |
|     | We get    | a tower | standing  |        | on an elev- |
|     | ated base |         |           |        |             |
|     | We can    | now     | pass this | output | through     |
anothersigmoidneurontogetthede-
|     | sired tower | !       |             |     |           |
| --- | ----------- | ------- | ----------- | --- | --------- |
|     | We can      | now     | approximate |     | any func- |
|     | tion by     | summing |             | up  | many such |
towers
63/70
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture3 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

|     | For example,   | we could       | approximate |
| --- | -------------- | -------------- | ----------- |
|     | the following  | function using | a sum of    |
|     | several towers |                |             |
64/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |     |
| -------------- | --------------------- | -------- | --- |

Can we come up with a neural network to represent this entire procedure of
| constructing | a 3 dimensional | tower ? |     |
| ------------ | --------------- | ------- | --- |
65/70
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | -------------- | --------------------- | -------- |

66/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

67/70
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| -------------- | --------------------- | -------- |

Think
For 1 dimensional input we needed 2 neurons to construct a tower
For 2 dimensional input we needed 4 neurons to construct a tower
How many neurons will you need to construct a tower in n dimensions ?
68/70
MiteshM.Khapra CS7015(DeepLearning): Lecture3

Time to retrospect
| Why do | we care about | approximating | any arbitrary | function ? |
| ------ | ------------- | ------------- | ------------- | ---------- |
Can we tie all this back to the classification problem that we have been dealing
with ?
69/70
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture3 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     |     |     | This is what     | we         | actually | want                   |
| --- | --- | --- | --- | ---------------- | ---------- | -------- | ---------------------- |
|     |     |     |     | The illustrative |            | proof    | that we just saw tells |
|     |     |     |     | us that          | we can     | have a   | neural network with    |
|     |     |     |     | two hidden       | layers     | which    | can approximate        |
|     |     |     |     | the above        | function   | by       | a sum of towers        |
|     |     |     |     | Which means      | we         | can      | have a neural network  |
|     |     |     |     | which can        | exactly    | separate | the blue points        |
|     |     |     |     | from the         | red points | !!       |                        |
70/70
|                |            |               | MiteshM.Khapra   | CS7015(DeepLearning): |     | Lecture3 |     |
| -------------- | ---------- | ------------- | ---------------- | --------------------- | --- | -------- | --- |
| We are         | interested | in separating | the blue         |                       |     |          |     |
| points from    | the        | red points    |                  |                       |     |          |     |
| Suppose        | we use     | a single      | sigmoidal neuron |                       |     |          |     |
| to approximate |            | the relation  | between x =      |                       |     |          |     |
| [x ,x ] and    | y          |               |                  |                       |     |          |     |
1 2
| Obviously, | there | will be | errors (some blue |     |     |     |     |
| ---------- | ----- | ------- | ----------------- | --- | --- | --- | --- |
pointsgetclassifiedas1andsomeredpoints
| get classified | as  | 0)  |     |     |     |     |     |
| -------------- | --- | --- | --- | --- | --- | --- | --- |
