| CS7015 | (Deep | Learning) | : Lecture | 13  |
| ------ | ----- | --------- | --------- | --- |
Visualizing Convolutional Neural Networks, Guided Backpropagation, Deep
| Dream, Deep | Art, Fooling | Convolutional | Neural | Networks |
| ----------- | ------------ | ------------- | ------ | -------- |
|             | Mitesh       | M. Khapra     |        |          |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/72
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture13 |
| --- | -------------- | --------------------- | --- | --------- |

Acknowledgements
Dream∗
| Andrej Karpathy | Video Lecture | on Visualization | and Deep |
| --------------- | ------------- | ---------------- | -------- |
∗Visualization, Deep Dream, Neural Style, Adversarial Examples
2/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

| Module | 13.1: | Visualizing | patches  | which maximally |
| ------ | ----- | ----------- | -------- | --------------- |
|        |       | activate    | a neuron |                 |
3/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | --- | -------------- | --------------------- | --------- |

0001
| esned |     | Consider | some neurons | in a | given |
| ----- | --- | -------- | ------------ | ---- | ----- |
6904
esned
|     |     | layer of | a CNN |     |     |
| --- | --- | -------- | ----- | --- | --- |
6904
esn 2
| e d 2 gnilo |     | We can | feed in images | to this | CNN |
| ----------- | --- | ------ | -------------- | ------- | --- |
6 5 2 o P
5 53 xaM
| 3 noitu |     | and identify | the images | which | cause |
| ------- | --- | ------------ | ---------- | ----- | ----- |
6 5 2 l o vn
7 7 oC
| 3 3 noitulovnoC |     | these neurons | to fire |     |     |
| --------------- | --- | ------------- | ------- | --- | --- |
483
9
| 3 3 9 |     | We can | then trace | back to the | patch |
| ----- | --- | ------ | ---------- | ----------- | ----- |
noitu
11 4 8 3 l o vnoC
| 11  |     | intheimagewhichcausestheseneur- |     |     |     |
| --- | --- | ------------------------------- | --- | --- | --- |
3 3
| 32 6 | gnilo | ons to fire |     |     |     |
| ---- | ----- | ----------- | --- | --- | --- |
5 2 o P xaM
32
3 3 noitulovnoC
| 72  | 652 | Letuslookattheresultofoneofsuch |     |     |     |
| --- | --- | ------------------------------- | --- | --- | --- |
72
| 5 5 |     | experiment | conducted | by Grishick | et  |
| --- | --- | ---------- | --------- | ----------- | --- |
55 gnilooPxaM
69
| 55  |     | al., 2014 |     |     |     |
| --- | --- | --------- | --- | --- | --- |
3 3
noitulovnoC
69
11 11
tupnI
4/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

They consider 6 neurons in the pool5 layer and find the image patches which
| cause these | neurons      | to fire     |          |     |
| ----------- | ------------ | ----------- | -------- | --- |
| One neuron  | fires for    | people      | faces    |     |
| Another     | neuron fires | for dog     | faces    |     |
| Another     | neuron fires | for flowers |          |     |
| Another     | neuron fires | for numbers |          |     |
| Another     | neuron fires | for houses  |          |     |
| Another     | neuron fires | for shiny   | surfaces |     |
5/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | --- | -------------- | --------------------- | --------- |

| Module | 13.2: Visualizing | filters | of a CNN |
| ------ | ----------------- | ------- | -------- |
6/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

|     | Recall | that we | had done | something |
| --- | ------ | ------- | -------- | --------- |
xˆ
|     | similar         | while discussing |            | autoencoders |
| --- | --------------- | ---------------- | ---------- | ------------ |
|     | We are          | interested       | in finding | an input     |
|     | which maximally |                  | excites    | a neuron     |
h(x)
|     | Turns out | that     | the input | which will |
| --- | --------- | -------- | --------- | ---------- |
|     | maximally | activate | a neuron  | is W       |
(cid:107)W(cid:107)
x
{wTx}
max
x
s.t. ||x||2 =xTx=1
w 1
Solution: x=
(cid:112) wTw
1 1
7/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| h h |     | Now recall | that we | can think | of a |
| --- | --- | ---------- | ------- | --------- | ---- |
11 12
|     |       | CNN also    | as a feed-forward | network    |     |
| --- | ----- | ----------- | ----------------- | ---------- | --- |
|     |       | with sparse | connections       | and weight |     |
|     | . . . | sharing     |                   |            |     |
|     |       | Once        | again, we are     | interested | in  |
16
|     |     | knowing      | what kind    | of inputs | will |
| --- | --- | ------------ | ------------ | --------- | ---- |
|     |     | cause a      | given neuron | to fire   |      |
|     |     | The solution | would        | be the    | same |
2
h
|     | 14  | ( W )               | where W is the | filter(2×2, | in  |
| --- | --- | ------------------- | -------------- | ----------- | --- |
|     | =   | (cid:107)W(cid:107) |                |             |     |
*
|     |     | this case) |               |               |     |
| --- | --- | ---------- | ------------- | ------------- | --- |
|     |     | We can     | thus think of | these filters | as  |
|     |     | pattern    | detectors     |               |     |
8/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

|     | WecansimplyplottheK×K |     | weights |
| --- | --------------------- | --- | ------- |
(filters)asimages&visualizethemas
patterns
|     | The filters  | essentially           | detect these   |
| --- | ------------ | --------------------- | -------------- |
|     | patterns     | (by causing           | the neurons to |
|     | maximally    | fire)                 |                |
|     | This is only | interpretable         | for the fil-   |
|     | ters in      | the first convolution | layer          |
{wTx} (Why?)
max
x
s.t. ||x||2 =xTx=1
w 1
Solution: x=
(cid:112) wTw
1 1
9/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |
| -------------- | --------------------- | --------- | --- |

| Module | 13.3: Occlusion | experiments |     |
| ------ | --------------- | ----------- | --- |
10/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

| pomeranian wheel ... | hound |     |           |     |                   |     |     |        |
| -------------------- | ----- | --- | --------- | --- | ----------------- | --- | --- | ------ |
|                      |       |     | Typically |     | we are interested |     | in  | under- |
Softmax
|     |     |                        | standing                     |             | which portions        |            | of the | image |
| --- | --- | ---------------------- | ---------------------------- | ----------- | --------------------- | ---------- | ------ | ----- |
|     |     |                        | are                          | responsible | for                   | maximizing |        | the   |
|     |     | (c) Layer 5, strongest | (d) Classifier, probability  |             | (e) Classifier, most  |            |        |       |
(a) Input Image (b) Layer 5, strongest feature map feature map projections of cporrerct colassb  ab  i lit y oprobfable aclass certain class
PTKP eo nm eihs r a  n ialln
|     |     |     |     | 0 0 . . 8 9 | ee ek n isn e o s bn e ad |     |     |     |
| --- | --- | --- | --- | ----------- | ------------------------- | --- | --- | --- |
cou0.7ld
|     |     |     | We  | 0.6 | occlude | (gray | out) | differ- |
| --- | --- | --- | --- | --- | ------- | ----- | ---- | ------- |
0.5
|     |     |     | ent | patc0.4hes | in the | image | and | see the |
| --- | --- | --- | --- | ---------- | ------ | ----- | --- | ------- |
0.3
| True Label: Pomeranian |     |     |        | 0 . 2    |                              |             |     |     |
| ---------------------- | --- | --- | ------ | -------- | ---------------------------- | ----------- | --- | --- |
|                        |     |     | effect | on0 . 1  | the predicted                | probability |     | of  |
|                        |     |     |        |          | CRCP aaal rcbi   ew rh e e l |             |     |     |
|                        |     |     |        | 0.25     |                              |             |     |     |
|                        |     |     | the    | co rr ec | o c te  v a n class          |             |     |     |
0.2
0.15
( c)  L a y e r  5 ,  st ro n g e s t (d) C la s s ifi e r,  p r o b a b ility Forexa(e ) C r0m la s s ifi ep r ,  m ol ste  thisheatmapshowsthat
| (a) Input Image (b) Layer 5, strongest feature map | fe a tu r e   m a p  p ro j e | c t ions o f  c o r | re c t  c la s s   | p o.1 b                                             | a b le   c l as s  |     |     |     |
| -------------------------------------------------- | ----------------------------- | ------------------- | ------------------ | --------------------------------------------------- | ------------------ | --- | --- | --- |
|                                                    |                               |                     |                    | 0 . 9lu PTKP eo nm n e dihs r a  bn n ad ialln 0.05 |                    |     |     |     |
True Label: Car Wheel o cc0 . 8 ee ek isn e o s e in g the face of the dog causes
|                        |     |     |     | 0 . 7                   | AGIMFAAIVN f g h a n   h oer u n d           |        |            |     |
| ---------------------- | --- | --- | --- | ----------------------- | -------------------------------------------- | ------ | ---------- | --- |
|                        |     |     |     | 0 . 6 0 . 7             | r i o so hr d   so em n t   ts e t t e r     |        |            |     |
|                        |     |     | a   | 0 m . 5 a x i 0 m . 6   | u u ras r   t c a o r a b to a r d drop      | in the | prediction |     |
|                        |     |     |     | 0 . 4 0 . 5             | cu dt r eal m li a i cn    g t e o r w rienr |        |            |     |
|                        |     |     | pro | 0 . 3 b a b i 0 . 4 lit | c ie e z y   s l o l a l y                   |        |            |     |
| True Label: Pomeranian |     |     |     | 0 . 2 0 . 3             | c k   b r a c e                              |        |            |     |
0 . 1 0 . 2
| True Label: Afghan Hound |     |     |          | CRCP   aaal rcbi   ew ra h e e l r0 . 1 |              |     |      |     |
| ------------------------ | --- | --- | -------- | --------------------------------------- | ------------ | --- | ---- | --- |
|                          |     |     | S im0.25 | i o l c e  v a n                        | observations | are | made | for |
0.2
|     |     |     | other | images |     |     |     |     |
| --- | --- | --- | ----- | ------ | --- | --- | --- | --- |
0.15
|                                                    | (c) Layer 5, strongest  | (d) Classifier, probability  |     | 0.1 (e) Classifier, most                        |     |     |     |     |
| -------------------------------------------------- | ----------------------- | ---------------------------- | --- | ----------------------------------------------- | --- | --- | --- | --- |
| (a) Input Image (b) Layer 5, strongest feature map | feature map projections | of correct class             |     | probable class                                  |     |     |     |     |
| True Label: Car Wheel                              |                         |                              |     | 0 0.0 . 95 PTKP eo nm n eihs r a  bn n ad ialln |     |     |     |     |
0 . 8 ee ek isn e o s e
  0 0 . . 7 7 AGIMFAAIVN f o g hr h d a so n en     h ts oer u t t n e d r
0 0 . . 6 6 r i so r t   a r b t to e a r d
|     |     |     |     | 0 . 5 u cu ras   dt c o eal a m i cn    g o w enr |     |     |     | 11/72 |
| --- | --- | --- | --- | ------------------------------------------------- | --- | --- | --- | ----- |
0 0 . . 5 4 c e   l o r l y li a t e r ri
|                        | MiteshM.Khapra | CS7015( | D0  | 0 0 0 . . . 4 e 2 3 ep ie z c s k l a   L b r a c e e a rning): | Lecture13 |     |     |     |
| ---------------------- | -------------- | ------- | --- | --------------------------------------------------------------- | --------- | --- | --- | --- |
| True Label: Pomeranian |                |         |     | 0 . . 3 1                                                       |           |     |     |     |
  0 . 2
| True Label: Afghan Hound |     |     |     | 00 .. 21 CRCP   aaal rcbi   ew rh e e l |     |     |     |     |
| ------------------------ | --- | --- | --- | --------------------------------------- | --- | --- | --- | --- |
5 o c e  v a n
0.2
0.15
0.1
| True Label: Car Wheel |     |     |     | 0.05 |     |     |     |     |
| --------------------- | --- | --- | --- | ---- | --- | --- | --- | --- |

0 . 7 AGIMFAAIVN f o g hr h d a so n en     h ts oer u t t n e d r
0 . 6 r i so r t   a r b t to e a r d
0 . 5 u cu ras   dt c o eal a m i cn    g o w n
c e   l o r l y li a t e r r ie r
0 . 4 ie z c s k l a   b r a c e
| ( a)  I n p u t I m a g e (b) Layer 5, strongest feature map | (c) Layer 5, strongest feature map projections | (d) Classifier, probability  of correct class  |     | 0 . 3 ( e probable class  )   C lassifier, most  |     |     |     |     |
| ------------------------------------------------------------ | ---------------------------------------------- | ---------------------------------------------- | --- | ------------------------------------------------ | --- | --- | --- | --- |
  0 . 2 PTKP eo nm eihs r a  n ialln
| True La b e l :  A fg h a n  H ound |     |     |     | 0 0. .1 9 ee ek n isn o bn ad |     |     |     |     |
| ----------------------------------- | --- | --- | --- | ----------------------------- | --- | --- | --- | --- |
0 . 8 e s e
0.7
0.6
0.5
0.4 0.3
0 . 2
| True Label: Pomeranian |     |     |     | 0 . 1 |     |     |     |     |
| ---------------------- | --- | --- | --- | ----- | --- | --- | --- | --- |
  CRCP aaal rcbi   ew rh e e l

0.25 o c e  v a n
0.2
0.15
0.1
| True Label: Car Wheel |     |     |     | 0.05 |     |     |     |     |
| --------------------- | --- | --- | --- | ---- | --- | --- | --- | --- |

0 . 7 AGIMFAAIVN f o g hr h d a so n en     h ts oer u t t n e d r
0 . 6 r i so r t   a r b t to e a r d
0 . 5 u cu ras   dt c o eal a m i cn    g o w rienr
0 . 4 c ie e z   s l o l r a l y li a t e r
c k   b r a c e
0 . 3
0.2
| True Label: Afghan Hound |     |     |     | 0.1 |     |     |     |     |
| ------------------------ | --- | --- | --- | --- | --- | --- | --- | --- |

| Module | 13.4: | Finding influence | of input | pixels using |
| ------ | ----- | ----------------- | -------- | ------------ |
backpropagation
12/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     | We can   | think     | of an image | as a m×n |
| --- | --- | -------- | --------- | ----------- | -------- |
|     |     | inputs x | ,x ,...,x |             |          |
0 1 m×n
|     |     | We are | interested | in finding | the influ- |
| --- | --- | ------ | ---------- | ---------- | ---------- |
hj
|     |     | ence of | each of | these inputs(x | ) on a |
| --- | --- | ------- | ------- | -------------- | ------ |
i
|     |     | given neuron(h |        | j )  |                |
| --- | --- | -------------- | ------ | ---- | -------------- |
|     |     | If a small     | change | in x | causes a large |
i
|     |     | change    | in h j then  | we can | say that x i |
| --- | --- | --------- | ------------ | ------ | ------------ |
|     | xi  | has a lot | of influence | of     | h            |
j
∂hj
| flatten |     | In other | words | the gradient | could |
| ------- | --- | -------- | ----- | ------------ | ----- |
∂xi
|     |     | tell us about | the | influence |     |
| --- | --- | ------------- | --- | --------- | --- |
x 0 x 1 · · · ·
· · · · · ·
· · · · · ·
· · · · · ·
· · · · · ·
· · · · · x
mn
13/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

∂h j
|     |     | = 0 | −→  | no influence |
| --- | --- | --- | --- | ------------ |
∂x i
hj
∂h
j
|     |     | = large | −→  | high influence |
| --- | --- | ------- | --- | -------------- |
∂x
i
∂h
|     |     | j = small | −→  | low influence |
| --- | --- | --------- | --- | ------------- |
∂x
i
xi
|     |     | We could | just compute | these partial |
| --- | --- | -------- | ------------ | ------------- |
flatten
|               |     | derivatives | w.r.t all      | the inputs    |
| ------------- | --- | ----------- | -------------- | ------------- |
| ∂ h ∂ h · · · | ·   |             |                |               |
| i i           |     | And then    | visualize this | gradient mat- |
∂ x 0 ∂ x 1
| · · · · · | ·   |           |              |     |
| --------- | --- | --------- | ------------ | --- |
|           |     | rix as an | image itself |     |
| · · · · · | ·   |           |              |     |
| · · · · · | ·   |           |              |     |
| · · · · · | ·   |           |              |     |
| · · · · · | ∂hi |           |              |     |
∂xmn
14/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |
| --- | -------------- | --------------------- | --------- | --- |

hj
xi
|     |     | But how | do we | compute | these gradi- |
| --- | --- | ------- | ----- | ------- | ------------ |
flatten
ents?
| x x · · · | ·   |                |            |               |             |
| --------- | --- | -------------- | ---------- | ------------- | ----------- |
| 0 1       |     | Recall         | that we    | can represent | CNNs        |
| · · · · · | ·   |                |            |               |             |
|           |     | by feedforward |            | neural        | network     |
| · · · · · | ·   |                |            |               |             |
|           |     | Then           | we already | know          | how to com- |
| · · · · · | ·   |                |            |               |             |
puteinfluences(gradient)usingback-
| · · · · · | ·   |     |     |     |     |
| --------- | --- | --- | --- | --- | --- |
propogation
| · · · · · | x   |     |     |     |     |
| --------- | --- | --- | --- | --- | --- |
mn
|     |     | For example, |     | we know | how to back- |
| --- | --- | ------------ | --- | ------- | ------------ |
propthegradientstillthefirsthidden
15/72
layer
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |
3
| h32 |     |     | ∂h 32 | (cid:88) ∂h | 32 ∂h 1i |
| --- | --- | --- | ----- | ----------- | -------- |
=
|     |     |     | ∂x  | ∂h  | ∂x   |
| --- | --- | --- | --- | --- | ---- |
|     |     |     | 2   | i=1 | 1i 2 |
|     | h1i |     |     | 4   |      |
(cid:88)
|     |     |     | h   | = w | x   |
| --- | --- | --- | --- | --- | --- |
|     |     |     | 1i  | ji  | j   |
j=1
∂h 1i
|     | x2  |     |     | =w 12 |     |
| --- | --- | --- | --- | ----- | --- |
∂x
2
flatten
| · · · | ·   |     |     |     |     |
| ----- | --- | --- | --- | --- | --- |
x 0 x 1
| · · · · · | ·    |     |     |     |     |
| --------- | ---- | --- | --- | --- | --- |
| · · · · · | ·    |     |     |     |     |
| · · · · · | ·    |     |     |     |     |
| · · · · · | ·    |     |     |     |     |
| · · · · · | x mn |     |     |     |     |

Thisiswhatwegetifwecomputethe
|     | gradients         | and plot   | it as          | an image     |
| --- | ----------------- | ---------- | -------------- | ------------ |
|     | The above         | procedure  | does           | not show     |
|     | very sharp        | influences |                |              |
|     | Springenberg      | et         | al. proposed   | “guided      |
|     | back propagation” |            | which          | gives a bet- |
|     | ter idea          | about      | the influences |              |
16/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| Module | 13.5: Guided | Backpropagation |     |
| ------ | ------------ | --------------- | --- |
17/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

|     | We feed       | an input to   | the CNN     | and do     |
| --- | ------------- | ------------- | ----------- | ---------- |
|     | a forward     | pass          |             |            |
|     | We consider   | one neuron    | in some     | fea-       |
|     | ture map      | at some layer |             |            |
|     | We are        | interested in | finding     | the influ- |
|     | ence of       | the input on  | this neuron |            |
|     | We retain     | this neuron   | and         | set all    |
|     | other neurons | in the        | layer to    | zero       |
18/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     |     | We now | backpropogate | all the way | to  |
| --- | --- | --- | ------ | ------------- | ----------- | --- |
the inputs
|               | 1  -1  5          | 1  0  5        |             |        |              |      |
| ------------- | ----------------- | -------------- | ----------- | ------ | ------------ | ---- |
| Forward pass  |                   |                | Recall that | during | forward pass | relu |
|               | 12   --15   -57   | 12   00   50   |             |        |              |      |
Forward pass  -21 3     251     -4 57  021     200     405     activation allows only positive values
--
Forward pass
- -23 2   -2 05     -- 471     022     2 30     401     to pass & clamps −ve values to zero
|     |     | - - |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
Backward pass:
- -63 2   2 00     401     062     -3 23     411     Similarly during backward pass no
| backpropagation          |   -                            | - -                        |     |     |     |     |
| ------------------------ | ------------------------------ | -------------------------- | --- | --- | --- | --- |
| B a c k w a r d  p a s s | :    062     -00 1     301     | 262     --3 13     311     |     |     |     |     |
ba c k p r o p a g a ti o n   - - - - gradientpassesthroughthedeadrelu
| B a c k w a r d  p a s s  | :    060     -03 1     300     | 262     --3 13     311     |         |     |     |     |
| ------------------------- | ------------------------------ | -------------------------- | ------- | --- | --- | --- |
| ba c k p r o p a g a ti o | n                              | - -                        | neurons |     |     |     |
Backward pass:
|              | 0 06     - 301     3 01     | 262     --3 13     311     |           |                  |     |       |
| ------------ | --------------------------- | -------------------------- | --------- | ---------------- | --- | ----- |
| “deconvnet”  |                             | - -                        | In guided | back propagation |     | any - |
B a c k w a r d  p a ss:
|     | 260     003     310     | 262     --3 13     311     |     |     |     |     |
| --- | ----------------------- | -------------------------- | --- | --- | --- | --- |
“d e c o n v n e t”   - - ve gradients flowing from the upper
| B a c k w a r d   p a s s             | :     26     00     31     | 262     --3 13     311     |           |             |     |     |
| ------------------------------------- | -------------------------- | -------------------------- | --------- | ----------- | --- | --- |
|                                       | 0 0 0                      | - -                        | layer are | also set to | 0   |     |
| “Bd ae cc ko wn av rn de   pt” a  s s | :                          |                            |           |             |     |     |
| g u i d e d                           | 062     000     003        | -62 2   -- 331     -13 1   |           |             |     |     |

B b aac c kk wp rao rpda pgaastsio: n
| g u i d e d                          | 060     000     300     | 262     --3 13     311     |     |     |     |     |
| ------------------------------------ | ----------------------- | -------------------------- | --- | --- | --- | --- |
| bB aac kk wp rao rpda pgaastsio: n   |                         | - -                        |     |     |     |     |
c
| guided  | 06   00   30   | 26   --13   31   |     |     |     | 19/72 |
| ------- | -------------- | ---------------- | --- | --- | --- | ----- |
backpropagation  0  0  3  -1M  i3t eshM.Khapra CS7015(DeepLearning): Lecture13
2

|                 |     | Intuition: | Neglect             | all the     | negative |
| --------------- | --- | ---------- | ------------------- | ----------- | -------- |
| Backpropagation |     | influences | (gradients)         | and focus   | only     |
|                 |     | on the     | positive influences | (gradients) |          |
|                 |     | This gives | a better            | picture of  | the true |
|                 |     | influence  | of the input        |             |          |
GuidedBackpropagation
20/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

| Module | 13.6: Optimization | over | images |
| ------ | ------------------ | ---- | ------ |
21/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

|     |     |     |     | Suppose | we want to        | create an image |     |
| --- | --- | --- | --- | ------- | ----------------- | --------------- | --- |
|     |     |     |     | which   | looks like a      | dumbell (or an  | os- |
|     |     |     |     | trich,  | or a car, or just | anything)       |     |
55
27 23
11 11 9 Dumbell I n o t h e r w o r d s w e w a nt t o c r e a t e
| 3 5 3 |         | 7 5 d e nse     |       |         |                   |                 |         |
| ----- | ------- | --------------- | ----- | ------- | ----------------- | --------------- | ------- |
| 3 3   | 3 3 3 3 | 3 3 3 3 2 dense | dense |         |                   |                 |         |
| 11 5  |         | 7 5 2           |       | a n i m | a g e s u c h t h | a t i f w e p a | s s i t |
|       | 11      | 9 2 5 6 2 5 6   |       |         |                   |                 |         |
27 23 384 Con v o l ution M ax P o oling t h ro u g h a t r a i n ed C o n v N e t i t s h o u l d
| 55  | 3 8 4 | Convolution |     |     |     |     |     |
| --- | ----- | ----------- | --- | --- | --- | --- | --- |
Max 2 P 5 o 6 oling Conv o l ution
| 96 256                 |     |      | 1000 | maximize | the probability | of the | class |
| ---------------------- | --- | ---- | ---- | -------- | --------------- | ------ | ----- |
| MaxPooling Convolution |     | 4096 | 4096 |          |                 |        |       |
96
| Convolution |     |     |     | dumbell |     |     |     |
| ----------- | --- | --- | --- | ------- | --- | --- | --- |
Input
Wecouldposethisasanoptimization
|     |     |     |     | problem  | w.r.t I (i   | , i , ..., i | )   |
| --- | --- | --- | --- | -------- | ------------ | ------------ | --- |
|     |     |     |     |          | 0            | 1 mn         |     |
|     |     |     |     | argmax(S | c (I)−λΩ(I)) |              |     |
I
|     |     |     |     | S (I) = | Score for class | C before | softmax |
| --- | --- | --- | --- | ------- | --------------- | -------- | ------- |
c
|     |     |     |     | Ω(I) = | Some regularizer | to ensure | that |
| --- | --- | --- | --- | ------ | ---------------- | --------- | ---- |
|     |     |     |     |        | I looks like     | an image  |      |
22/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture13 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     |     | We   | can essentially |         | think         | of the image |
| --- | --- | --- | --- | --- | --- | ---- | --------------- | ------- | ------------- | ------------ |
|     |     |     |     |     |     | as   | a collection    |         | of parameters |              |
|     |     |     |     |     |     | Keep | the             | weights | of trained    | convolu-     |
55
|     | 27    | 23      |                     |                |         |      |            |         |                 |              |
| --- | ----- | ------- | ------------------- | -------------- | ------- | ---- | ---------- | ------- | --------------- | ------------ |
|     | 11    | 11      | 9                   |                | Dumbell | t io | n al n e u | r al n  | e t w o rk fi x | e d          |
|     | 3 5 3 |         | 7                   | 5 d e nse      |         |      |            |         |                 |              |
|     | 3 3   | 3 3 3 3 | 3 3 3 3             | 2 dense        | dense   |      |            |         |                 |              |
|     | 11 5  |         | 7 5                 | 2              |         | N o  | w a d ju   | s t t h | e s e p ar a m  | e ters(image |
|     |       | 11      | 9 2 5 6             | 2 5 6          |         |      |            |         |                 |              |
|     | 27    | 23      | 384 Con v o l ution | M ax P o oling |         |      |            |         |                 |              |
5 5 3 8 4 Convolution p i x el s ) s o that the score of a class is
Max 2 P 5 o 6 oling Conv o l ution
|     | 9 6 2 5 6                    |     |     |      | 1000 |     |              |     |     |     |
| --- | ---------------------------- | --- | --- | ---- | ---- | --- | ------------ | --- | --- | --- |
|     | M axP o oling Conv o l ution |     |     | 4096 | 4096 | m a | x i m i z ed |     |     |     |
96
Convolution
| Input |     |     |     |     |     | Let | us see | how |     |     |
| ----- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- |
23/72
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture13 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

55
27 23
|     |           |     | 11 9              | Classi                         |
| --- | --------- | --- | ----------------- | ------------------------------ |
|     |           | 3   | 5                 | 7 d e nse                      |
|     | ZeroImage | 3   | 3 3 3 3 3 3       | 3 3 5 2 dense dense            |
|     |           |     | 5                 | 3 3 5 2                        |
|     |           |     | 11 9              | 7 2 5 6 2 5 6                  |
|     |           |     | 27 23 384         | Con v o l ution M ax P o oling |
|     |           | 55  | 3 8 4 Convolution |                                |
2 5 6 Conv o l ution
|     |     | 96         | 256 Max P o oling | 1000      |
| --- | --- | ---------- | ----------------- | --------- |
|     |     | MaxPooling | Convolution       | 4096 4096 |
96
Convolution
| 1 Start with | a zero image |                      |     |     |
| ------------ | ------------ | -------------------- | --- | --- |
| Set the      | score vector | to be [0,0,...1,0,0] |     |     |
2
∂Sc(I)
| 3 Compute | the gradient |     |     |     |
| --------- | ------------ | --- | --- | --- |
∂i
k
∂S (I)
| 4 Now update | the pixel | i = i −η | c   |     |
| ------------ | --------- | -------- | --- | --- |
|              |           | k k      | ∂ i |     |
k
| Now again | do a forward | pass through | the network |     |
| --------- | ------------ | ------------ | ----------- | --- |
5
| 6 Go to | step 2 |     |     |     |
| ------- | ------ | --- | --- | --- |
24/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | --- | -------------- | --------------------- | --------- |

55
|     | 27                     | 23            |                 |                            | H u s k y           |
| --- | ---------------------- | ------------- | --------------- | -------------------------- | ------------------- |
|     |                        | 11            | 9               |                            | D C u u m p b e l l |
| 3   | 5                      |               |                 | 7 d e nse                  |                     |
| 3   |                        | 3 3 3 3       | 3 3 3           | 3 5 2 dense                | dense L e m o n     |
|     | 5                      |               | 3               | 3 5 2                      |                     |
|     |                        | 11            | 9 7             | 2 5 6 2 5 6                | D a l m a t i o n   |
|     | 27                     | 23            | 384 Con         | v o l ution M ax P o oling | B e l l P e p p e r |
|     | 55                     | 3             | 8 4 Convolution |                            |                     |
|     |                        | 2 5 6 Conv    | o l ution       |                            |                     |
|     | 96 256                 | Max P o oling |                 |                            | 1000                |
|     | MaxPooling Convolution |               |                 | 4096                       | 4096                |
96
Convolution
Lets look at the images obtained for maximizing some class scores
25/72
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture13 |     |
| -------------- | --- | --------------------- | --- | --------- | --- |

|     | 227 | 55  |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
27 23
|     | 11         |             | 11                                 | 9           |                            |               |             |                   |
| --- | ---------- | ----------- | ---------------------------------- | ----------- | -------------------------- | ------------- | ----------- | ----------------- |
|     | 3          | 5 3         |                                    |             | 7 5                        | d e nse       | W e c a n   | a c tu al ly d o  |
|     | 3          | 3           | 3 3                                | 3 3 3 3     | 3                          | 2 dense dense |             |                   |
|     | 11         | 5           |                                    |             | 3 5                        | 2             |             |                   |
|     |            |             | 11                                 | 9 7         | 2 5 6 2 5 6                |               | thi s f o   | r a n y a rb it - |
|     |            | 27          | 23                                 | 384 Con     | v o l ution M ax P o oling |               |             |                   |
|     | 55         |             | 3 8 4                              | Convolution |                            |               |             |                   |
|     | 227        |             | Max 2 P 5 o 6 oling Conv o l ution |             |                            |               | rary neuron | in the            |
|     | 96         | 256         |                                    |             |                            | 1000          |             |                   |
|     | MaxPooling | Convolution |                                    |             |                            | 4096 4096     | convnet     |                   |
96
Convolution
Input 3
Parameters:0 S=2,P=0
Repeat:
| Feed | an image | through |     | the network |     |     |     |     |
| ---- | -------- | ------- | --- | ----------- | --- | --- | --- | --- |
Set activation in layer of interest to all zero, except for a neuron of interest
| Backprop | to  | image |     |     |     |     |     |     |
| -------- | --- | ----- | --- | --- | --- | --- | --- | --- |
i = i −η ∂A(I) , A(I) is the activation of the ith neuron in some layer
| k   | k   | ∂i  |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
k
26/72
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture13 |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --------- | --- |

Letuslookatsome“updated”images
|     | which | excite certain | neurons in some |
| --- | ----- | -------------- | --------------- |
layer
|     | Starting      | with different  | initializations |
| --- | ------------- | --------------- | --------------- |
|     | instead       | of using a zero | image we can    |
|     | get different | insights        |                 |
|     | Each of       | these 4 images  | are obtained    |
Layer-8
|     | by focusing  | on one         | neuron in layer 8 |
| --- | ------------ | -------------- | ----------------- |
|     | and starting | with different | initializa-       |
tions
|     | We can       | do a similar | analysis with |
| --- | ------------ | ------------ | ------------- |
|     | other layers |              |               |
Layer-7
27/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |
| -------------- | --------------------- | --------- | --- |

| Module | 13.7: Creating | images | from embeddings |
| ------ | -------------- | ------ | --------------- |
28/72
MiteshM.Khapra CS7015(DeepLearning): Lecture13

|     |     |     |     | We could  | think | of the    | fc7 layer as |
| --- | --- | --- | --- | --------- | ----- | --------- | ------------ |
|     |     |     |     | some kind | of an | embedding | for the      |
|     | 227 |     |     | image     |       |           |              |
55
|     | 27                               | 23                   |                                    |             |             |       |              |
| --- | -------------------------------- | -------------------- | ---------------------------------- | ----------- | ----------- | ----- | ------------ |
| 11  |                                  | 11                   | 9                                  | Question:   | Given       | this  | embedding    |
|     | 3 5 3                            | 3 3                  | 3 7 3 5 d e nse                    |             |             |       |              |
|     | 3 5 3                            | 3 3                  | 3 3 2 dense                        | dense       |             |       |              |
| 11  |                                  |                      | 7 5 2                              | can we      | reconstruct | the   | image?       |
|     |                                  | 11                   | 9 2 5 6 2 5 6                      |             |             |       |              |
|     | 27                               | 23                   | 384 Con v o l ution M ax P o oling |             |             |       |              |
|     | 5 5                              | 3 8 4                | Convolution                        | W e c a n   | pose this   | as an | optimization |
|     | 227                              | 2 5 6 Conv o l ution |                                    |             |             |       |              |
|     | 2 5 6                            | Max P o oling        |                                    | 1000        |             |       |              |
|     | M axP 9 o 6 oling Conv o l ution |                      |                                    | pr ob l e m |             |       |              |
|     | 96                               |                      | 4096                               | 4096        |             |       |              |
Convolution
3
Input
29/72
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Find an image | such that  |            |
| --- | --- | --- | ------------- | ---------- | ---------- |
|     |     |     | Its embedding | is similar | to a given |
| 227 |     |     | embedding     |            |            |
55
27 23
| 11  | 11 9 |     |     |     |     |
| --- | ---- | --- | --- | --- | --- |
3 5 3 3 3 3 7 3 5 d e nse I t l o o k s natural (some prior regular-
| 3 5 3                     | 3 3                  | 3 3 2 dense                    | dense         |     |     |
| ------------------------- | -------------------- | ------------------------------ | ------------- | --- | --- |
| 11                        |                      | 7 5 2                          | iz a t io n ) |     |     |
|                           | 11 9                 | 2 5 6 2 5 6                    |               |     |     |
| 27                        | 23 384               | Con v o l ution M ax P o oling |               |     |     |
| 55                        | 3 8 4 Convolution    |                                |               |     |     |
| 227                       | 2 5 6 Conv o l ution |                                |               |     |     |
| 256                       | Max P o oling        |                                | 1000          |     |     |
| MaxPooling 96 Convolution |                      |                                |               |     |     |
| 96                        |                      | 4096                           | 4096          |     |     |
Convolution
3
Input
30/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

φ :Embeddingofanimageofinterest
0
|     |     |     |     |     | X   | :Random | image | (say zero | image) |
| --- | --- | --- | --- | --- | --- | ------- | ----- | --------- | ------ |
227
|             | 55                        |                |               |                                | Repeat |               |                 |                |             |
| ----------- | ------------------------- | -------------- | ------------- | ------------------------------ | ------ | ------------- | --------------- | -------------- | ----------- |
|             | 27                        | 23             |               |                                |        |               |                 |                |             |
| 11          |                           | 11             | 9             |                                |        | F o r w       | a rd pass using | X              | and compute |
|             | 3 5 3                     | 3              | 3             | 3 7 3 5 d e nse                |        |               |                 |                |             |
|             | 3 5 3                     | 3              | 3             | 3 3 2 dense                    | dense  |               |                 |                |             |
| 11          |                           |                |               | 7 5 2                          |        | φ ( x ).      |                 |                |             |
|             |                           | 11             | 9             | 2 5 6 2 5 6                    |        |               |                 |                |             |
|             | 27                        | 23             | 384           | Con v o l ution M ax P o oling |        | C o m         | p u te          |                |             |
|             | 55                        | 3 8            | 4 Convolution |                                |        |               |                 |                |             |
| 227         |                           | 2 5 6 Conv o l | ution         |                                |        |               |                 |                |             |
|             | 256                       | Max P o oling  |               |                                | 1000   |               |                 |                |             |
|             | MaxPooling 96 Convolution |                |               |                                |        | L(i)=||φ(x)−φ |                 | ||2+λ||φ(x)||6 |             |
|             | 96                        |                |               | 4096                           | 4096   |               |                 | 0              |             |
| Convolution |                           |                |               |                                |        |               |                 |                | 6           |
3
Input
|     |     |     |     |     |     | i =i | −η L(i) |     |     |
| --- | --- | --- | --- | --- | --- | ---- | ------- | --- | --- |
k k
∂ik
31/72
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture13 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| Original | Image |     |
| -------- | ----- | --- |
32/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Conv-1
33/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-1
34/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Mpool-1
35/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Norm-1
36/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Conv-2
37/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-2
38/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Mpool-2
39/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Norm-2
40/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Conv-3
41/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-3
42/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Conv-4
43/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-4
44/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Conv-5
45/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-5
46/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Mpool-5
47/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

FC-6
48/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-6
49/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

FC-7
50/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

Relu-7
51/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

FC-8
52/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

| Module | 13.8: Deep | Dream |     |
| ------ | ---------- | ----- | --- |
53/72
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture13 |
| -------------- | --------------------- | --- | --------- |

|     |     |     |     | Suppose      | instead | of starting | with a  |
| --- | --- | --- | --- | ------------ | ------- | ----------- | ------- |
|     |     |     |     | blank (zero) | image   | we start    | with an |
227
|     | 55                     |                        |                               | actual        | image.      |                    |           |
| --- | ---------------------- | ---------------------- | ----------------------------- | ------------- | ----------- | ------------------ | --------- |
|     | 27                     | 23                     |                               |               |             |                    |           |
| 11  |                        | 11                     | 9                             |               |             |                    |           |
|     | 3                      |                        | 7                             | W e fo c      | u s o n s o | m e la y e r a n   | dcheckthe |
|     |                        | 3 3                    | 3 35                          | 2             |             |                    |           |
|     | 3                      | 3 3                    | 3 35                          | 2             |             |                    |           |
| 11  |                        |                        | 7 256                         | act iv a t    | io n s o f  | t he n e u r o n s |           |
|     |                        | 11 9                   | 2 5 6                         |               |             |                    |           |
|     | 27 23                  |                        | 384 Conv o l ution MaxPooling |               |             |                    |           |
|     | 55                     | 384                    | Convolution                   | We want       | to change   | the image          | so that   |
| 227 |                        | 256                    |                               |               |             |                    |           |
|     | 256                    | MaxPooling Convolution |                               |               |             |                    |           |
|     | 96                     |                        |                               | these neurons |             | fire even more     |           |
|     | MaxPooling Convolution |                        |                               |               |             |                    |           |
96
Convolution
3
Input
54/72
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

|     |     |     |     | How would | we achieve | this? |     |
| --- | --- | --- | --- | --------- | ---------- | ----- | --- |
h ij
|     |     |     |     | Suppose | we want to | boost the | activa- |
| --- | --- | --- | --- | ------- | ---------- | --------- | ------- |
227
|     | 55    |                        |                           | tion h                             | (some neuron | in some | layer) |
| --- | ----- | ---------------------- | ------------------------- | ---------------------------------- | ------------ | ------- | ------ |
|     | 27    | 23                     |                           | ij                                 |              |         |        |
| 11  |       | 11                     | 9                         |                                    |              |         |        |
|     | 3     |                        | 7                         |                                    |              |         |        |
|     |       | 3 3                    | 3 35                      | 2                                  |              |         |        |
|     | 3     | 3 3                    | 3 35                      | 2                                  |              |         |        |
| 11  |       |                        | 7 2 5                     | 6 Wecanformulatethisasthefollowing |              |         |        |
|     |       | 1 1 9                  | 2 5 6                     |                                    |              |         |        |
|     | 27 23 |                        | 384 Co nv o l ution Max P | o oling                            |              |         |        |
|     | 55    | 384                    | Convolution               | optimization                       | problem      |         |        |
| 227 |       | 256                    |                           |                                    |              |         |        |
|     | 256   | MaxPooling Convolution |                           |                                    |              |         |        |
96
|     | MaxPooling Convolution |     |     |     |         |     |     |
| --- | ---------------------- | --- | --- | --- | ------- | --- | --- |
|     | 96                     |     |     |     | maxL(I) |     |     |
Convolution
| 3   |     |     |     |     | I   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
Input
|     |     |     |     |     | L(I) = | h2  |     |
| --- | --- | --- | --- | --- | ------ | --- | --- |
ij
|     |     |     |     | Consider | a pixel i | in the | image |
| --- | --- | --- | --- | -------- | --------- | ------ | ----- |
mn
|     |     |     |     |     | ∂L(I) ∂L(I) | ∂h  |     |
| --- | --- | --- | --- | --- | ----------- | --- | --- |
ij
=
|     |     |     |     |     | ∂i ∂h | ∂i    |     |
| --- | --- | --- | --- | --- | ----- | ----- | --- |
|     |     |     |     |     | mn    | ij mn |     |
55/72
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

(cid:16)
|     |     |     |     | Once the | image | is  | updated | i = |
| --- | --- | --- | --- | -------- | ----- | --- | ------- | --- |
|     |     | h   |     |          |       |     |         | mn  |
ij
|     |     |          |     |             | ∂L(I) (cid:17) |          |         |                 |
| --- | --- | -------- | --- | ----------- | -------------- | -------- | ------- | --------------- |
| 227 |     |          |     | i +         |                | w e fe e | d i t b | a c k t o t h e |
|     | 55  |          |     | m n         |                |          |         |                 |
|     | 27  | 23       |     |             | ∂i mn          |          |         |                 |
| 11  |     | 11 9     |     | n e t w o r | k              |          |         |                 |
| 3   |     | 7        | 35  |             |                |          |         |                 |
| 3   |     | 3 3 3    | 2   |             |                |          |         |                 |
|     |     | 3 3 3 35 | 2   |             |                |          |         |                 |
11 7 256 T h i s t i m e the ta rg e t n e ur o n s s h o u ld
|     |     | 11 9 2 5 6 | MaxPooling |     |     |     |     |     |
| --- | --- | ---------- | ---------- | --- | --- | --- | --- | --- |
27 23 3 8 4 Conv o l ution fire even more (because we have pre-
| 55  |                | 384 Conv o l ution |     |                 |     |     |       |            |
| --- | -------------- | ------------------ | --- | --------------- | --- | --- | ----- | ---------- |
| 227 |                | 256 Convolution    |     |                 |     |     |       |            |
|     | 256 MaxPooling |                    |     | cisely modified |     | the | image | to achieve |
96
| MaxPooling | Convolution |     |     |       |     |     |     |     |
| ---------- | ----------- | --- | --- | ----- | --- | --- | --- | --- |
| 96         |             |     |     | this) |     |     |     |     |
Convolution
3
| Input |     |     |     | Doingthisiterativelywouldmakethe |          |           |        |          |
| ----- | --- | --- | --- | -------------------------------- | -------- | --------- | ------ | -------- |
|       |     |     |     | image                            | more and | more      | like   | the pat- |
|       |     |     |     | terns that                       | cause    | the       | neuron | to fire  |
|       |     |     |     | Let us                           | run this | algorithm |        |          |
56/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture13 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

57/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

58/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

59/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

|     |     |     |     | So what     | exactly | is happening |         | here? |        |
| --- | --- | --- | --- | ----------- | ------- | ------------ | ------- | ----- | ------ |
|     |     |     |     | The network |         | has been     | trained | to    | detect |
227
|     | 55                     |                        |                               | certain         | patterns | (dogs,     | cat,     | birds        | etc.) |
| --- | ---------------------- | ---------------------- | ----------------------------- | --------------- | -------- | ---------- | -------- | ------------ | ----- |
|     | 27                     | 23                     |                               |                 |          |            |          |              |       |
| 11  |                        | 11                     | 9                             |                 |          |            |          |              |       |
|     | 3                      |                        | 7                             | w h i ch appear |          | frequently | in       | the ImageNet |       |
|     |                        | 3 3                    | 3 35                          | 2               |          |            |          |              |       |
|     | 3                      | 3 3                    | 3 35                          | 2               |          |            |          |              |       |
| 11  |                        |                        | 7 256                         | da t a          |          |            |          |              |       |
|     |                        | 11 9                   | 2 5 6                         |                 |          |            |          |              |       |
|     | 27 23                  |                        | 384 Conv o l ution MaxPooling |                 |          |            |          |              |       |
|     | 55                     | 384                    | Convolution                   | It starts       | seeing   | these      | patterns | even         | when  |
|     | 227                    | 256                    |                               |                 |          |            |          |              |       |
|     | 256                    | MaxPooling Convolution |                               |                 |          |            |          |              |       |
|     | 96                     |                        |                               | they hardly     | exist    |            |          |              |       |
|     | MaxPooling Convolution |                        |                               |                 |          |            |          |              |       |
96
|     | Convolution |     |     | If a cloud | looks | a   | little bit | like | a bird, |
| --- | ----------- | --- | --- | ---------- | ----- | --- | ---------- | ---- | ------- |
3
Input
|     |     |     |     | the network     | will | make         | it   | look more | like     |
| --- | --- | --- | --- | --------------- | ---- | ------------ | ---- | --------- | -------- |
|     |     |     |     | a bird.         | This | in turn      | will | make      | the net- |
|     |     |     |     | work recognize  |      | the bird     | even | more      | strongly |
|     |     |     |     | on the          | next | pass and     | so   | forth,    | until a  |
|     |     |     |     | highly detailed |      | bird appears |      | seemingly | out      |
|     |     |     |     | of nowhere.     | -    | Google∗      |      |           |          |
∗research.googleblog.com/2015/06/inceptionism-
going-deeper-into-neural.html
60/72
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture13 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

| Module | 13.9: Deep | Art |
| ------ | ---------- | --- |
61/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

62/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

|     |     |     | To design | a network    | which can      | do  |
| --- | --- | --- | --------- | ------------ | -------------- | --- |
|     |     |     | this, we  | first define | two quantities |     |
222277
5555
2277 2233 1111
1111 33 99 77 C o n te n t T a r ge ts : T h e a c t i v a tio ns
|     | 33 33 | 33 3355 22 |     |     |     |     |
| --- | ----- | ---------- | --- | --- | --- | --- |
1111 33 33 33 33 3355 22 of a ll la y er s fo r th e g iv e n c o n t e n t im -
|             | 11 11 99                                          | 77 22 55 66 22 55 66                                      |     |     |     |     |
| ----------- | ------------------------------------------------- | --------------------------------------------------------- | --- | --- | --- | --- |
| 2277        | 2233                                              | 338844 CCoo nnvv oo ll uuttiioonn MMaaxx PP oo oolliinngg |     |     |     |     |
| 5555        | 22 55 66 33 88 44 CCoonnvvoolluuttiioonn          |                                                           | age |     |     |     |
| 222277      | MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn |                                                           |     |     |     |     |
| 9966 225566 |                                                   |                                                           |     |     |     |     |
9966 MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn Ideally, we would want the new im-
wantthemtobeequal
33 CCoonnvvoolluuttiioonn
| IInnppuutt |     |     | agetobesuchthatit’sactivationsare |     |     |     |
| ---------- | --- | --- | --------------------------------- | --- | --- | --- |
222277
| 5555 2277 |     |     | also close | to those of | the original | con- |
| --------- | --- | --- | ---------- | ----------- | ------------ | ---- |
2233 1111
| 1111 33 | 99       | 77                   |             |       |     |     |
| ------- | -------- | -------------------- | ----------- | ----- | --- | --- |
| 33      | 33 33    | 33 3355 22           | t e n t i m | a g e |     |     |
| 1111    | 33 33    | 33 3355 22           |             |       |     |     |
|         | 11 11 99 | 77 22 55 66 22 55 66 |             |       |     |     |
2277 2233 338844 CCoo nnvv oo ll uuttiioonn MMaaxx PP oo oolliinngg L e t p(cid:126) , (cid:126)x b e the activations of the con-
| 5555                                             | 22 55 66 33 88 44 CCoonnvvoolluuttiioonn          |     |            |              |           |        |
| ------------------------------------------------ | ------------------------------------------------- | --- | ---------- | ------------ | --------- | ------ |
| 222277 225566                                    | MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn |     |            |              |           |        |
| 9966                                             |                                                   |     | tent image | and the      | new image | (to be |
| 9966 MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn |                                                   |     |            |              |           |        |
| CCoonnvvoolluuttiioonn                           |                                                   |     | generated) | respectively |           |        |
33
IInnppuutt
(cid:88)
|     |     |     | L       | (p(cid:126),(cid:126)x) = | (p(cid:126) −(cid:126)x | )2  |
| --- | --- | --- | ------- | ------------------------- | ----------------------- | --- |
|     |     |     | content |                           | ijk                     | ijk |
ijk
63/72
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture13 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     | Next we                        | would want | the style | of the |
| --- | --- | --- | --- | --- | ------------------------------ | ---------- | --------- | ------ |
| 227 |     |     |     |     | generatedimagetobethesameasthe |            |           |        |
55
27 23 11
| 11 3           |                    | 9                 | 7                             |     | st y le i m a | ge              |               |        |
| -------------- | ------------------ | ----------------- | ----------------------------- | --- | ------------- | --------------- | ------------- | ------ |
| 3              | 3                  | 3                 | 3 35                          | 2   |               |                 |               |        |
| 11             | 3                  | 3                 | 3 35 2                        |     |               |                 |               |        |
|                | 1 1                | 9                 | 7 2 5 6 2 5 6                 |     | H o w d o     | w e capture the | style         | of the |
| 27             | 23                 | 384               | Co nv o l ution Max P o oling |     |               |                 |               |        |
| 55             | 2 5 6              | 3 8 4 Convolution |                               |     |               |                 |               |        |
| 227            | Max P o oling Conv | o l ution         |                               |     | image?        |                 |               |        |
| 96             | 256                |                   |                               |     |               |                 |               |        |
| 9 6 MaxPooling | Convolution        |                   |                               |     |               |                 |               |        |
| Conv o lution  |                    |                   |                               |     | Turns out     | that if V ∈     | R64×(256×256) | is     |
3
| Input |     |     |     |     |                                   |                |      | VTV     |
| ----- | --- | --- | --- | --- | --------------------------------- | -------------- | ---- | ------- |
|       |     |     |     |     | the activation                    | at a layer     | then | ∈       |
|       |     |     |     |     | R64×64 capturesthestyleoftheimage |                |      |         |
|       |     |     |     |     | The deeper                        | layers capture |      | more of |
|       |     |     |     |     | this style                        | information    |      |         |
64/72
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture13 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |        |     |     | To    | ensure   | that   | the style | of the           | new |
| --- | ------ | --- | --- | ----- | -------- | ------ | --------- | ---------------- | --- |
|     |        |     |     | image | captured |        | by layer  | (cid:96) matches |     |
|     | 222277 |     |     | the   | style    | of the | style     | image, we        | can |
5555 2277
|     |         | 2233 1111                                |                                                    | use | the following |     | objective | function | :   |
| --- | ------- | ---------------------------------------- | -------------------------------------------------- | --- | ------------- | --- | --------- | -------- | --- |
|     | 1111 33 | 99                                       | 77                                                 |     |               |     |           |          |     |
|     | 33      | 33 33                                    | 33 3355                                            | 22  |               |     |           |          |     |
|     | 1111    | 33 33                                    | 33 77 3355 22 55 66                                | 22  |               |     |           |          |     |
|     |         | 11 11 99                                 | 22 55 66                                           |     |               |     |           |          |     |
|     |         | 2277 2233 338844                         | CCoo nnvv oo ll uuttiioonn MMaaxx PP oo oolliinngg |     |               |     |           |          |     |
|     | 5555    | 22 55 66 33 88 44 CCoonnvvoolluuttiioonn |                                                    |     |               |     |           |          |     |
CCoonntteenntt IImmaaggee 222277 V22255 T 66 V2MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn (cid:88) (G(cid:96) −A(cid:96) )2
|     | 9966 |     |     |     | E   | =   |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
9966 MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn (cid:96) j ij
|            | CCoonnvvoolluuttiioonn | equal  |     |     |     |     |     |     |     |
| ---------- | ---------------------- | ------ | --- | --- | --- | --- | --- | --- | --- |
| 33         |                        |        |     |     |     | ij  |     |     |     |
| IInnppuutt |                        | V1 TV1 |     |     |     |     |     |     |     |
222277
|      | 5555 | 2277         |         | where | G(cid:96) | and | A(cid:96) are | the style gram |     |
| ---- | ---- | ------------ | ------- | ----- | --------- | --- | ------------- | -------------- | --- |
| 1111 |      | 2233 1111 99 |         |       |           |     |               |                |     |
|      | 33   |              | 77 3355 |       |           |     |               |                |     |
33 33 33 33 33 33 22 m a t ric es c o m p u te d at l ay e r (cid:96) fo r t h e
| 1111 |     |          | 33 77 3355 22 55 66 22           |     |     |     |     |     |     |
| ---- | --- | -------- | -------------------------------- | --- | --- | --- | --- | --- | --- |
|      |     | 11 11 99 | 22 55 66 MMaaxx PP oo oolliinngg |     |     |     |     |     |     |
2277 2233 338844 CCoo nnvv oo ll uuttiioonn sty l e im a g e a n d n ew i m a g e re sp e c t -
|     | 5555   | 22 55 66 33 88 44 CCoonnvvoolluuttiioonn                 |     |        |     |     |     |     |     |
| --- | ------ | -------------------------------------------------------- | --- | ------ | --- | --- | --- | --- | --- |
|     | 222277 | 225566 MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn |     | ively. |     |     |     |     |     |
|     | 9966   | CCoonnvvoolluuttiioonn                                   |     |        |     |     |     |     |     |
9966 MMaaxxPPoooolliinngg
|            | CCoonnvvoolluuttiioonn |     |     |     |     |                 |          | L                 |     |
| ---------- | ---------------------- | --- | --- | --- | --- | --------------- | -------- | ----------------- | --- |
| 33         |                        |     |     |     |     |                 | (cid:88) |                   |     |
| IInnppuutt |                        |     |     |     | L   | ((cid:126)a,x¯) | =        | w E               |     |
|            |                        |     |     |     |     | style           |          | (cid:96) (cid:96) |     |
(cid:96)=0
65/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture13 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | 222277  |      |           |                |          |     |     | 222277  |           |      |                      |
| --- | ------- | ---- | --------- | -------------- | -------- | --- | --- | ------- | --------- | ---- | -------------------- |
|     |         | 5555 |           |                |          |     |     | 5555    |           |      |                      |
|     |         | 2277 | 2233 1111 |                |          |     |     |         | 2277 2233 | 1111 |                      |
|     | 1111 33 | 5    |           | 99 77          |          |     |     | 1111 33 | 5         | 99   | 77                   |
|     | 33      |      | 3 33      | 33 33          | 3355 22  |     |     | 33      | 3 33      | 33   | 33 3355 22           |
|     | 1111    | 5    | 3 33      | 33 33          | 3355 22  |     |     | 1111    | 5 3 33    | 33   | 33 3355 22           |
|     |         |      | 11 11     | 99 77 22 55 66 | 22 55 66 |     |     |         | 11 11     | 99   | 77 22 55 66 22 55 66 |
2277 2233 338844 CCoo nnvv oo ll uuttiioonn MMaaxx PP oo oolliinngg 2277 2233 338844 CCoo nnvv oo ll uuttiioonn MMaaxx PP oo oolliinngg
5555 22 55 66 33 88 44 CCoonnvvoolluuttiioonn 5555 22 55 66 33 88 44 CCoonnvvoolluuttiioonn
222277 MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn 222277 MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn
|     |     | 9966 225566 |     |     |     |     |     | 9966 | 225566 |     |     |
| --- | --- | ----------- | --- | --- | --- | --- | --- | ---- | ------ | --- | --- |
9966 MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn 9966 MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn
|     | CCoonnvvoolluuttiioonn |     |     |     |     |     |            | CCoonnvvoolluuttiioonn |     |     |     |
| --- | ---------------------- | --- | --- | --- | --- | --- | ---------- | ---------------------- | --- | --- | --- |
|     | 33                     |     |     |     |     |     | 33         |                        |     |     |     |
|     | IInnppuutt             |     |     |     |     |     | IInnppuutt |                        |     |     |     |
222277
5555 2277
2233 1111
|     |     |     |     |     | 1111 33 | 5      |                                                   | 99 77                                    |                  |     |     |
| --- | --- | --- | --- | --- | ------- | ------ | ------------------------------------------------- | ---------------------------------------- | ---------------- | --- | --- |
|     |     |     |     |     | 33      |        | 3 3 33 33                                         | 33 3355                                  | 22               |     |     |
|     |     |     |     |     | 1111    | 5      | 33 33                                             | 33 77 3355                               | 22 55 66 22      |     |     |
|     |     |     |     |     |         |        | 11 11                                             | 99 22 55 66                              |                  |     |     |
|     |     |     |     |     |         | 2277   | 2233                                              | 338844 CCoo nnvv oo ll uuttiioonn MMaaxx | PP oo oolliinngg |     |     |
|     |     |     |     |     | 5555    |        | 22 55 66 33 88 44                                 | CCoonnvvoolluuttiioonn                   |                  |     |     |
|     |     |     |     |     | 222277  | 225566 | MMaaxx PP oo oolliinngg CCoonnvv oo ll uuttiioonn |                                          |                  |     |     |
9966
|     |     |     |     |     | 9966 | MMaaxxPPoooolliinngg CCoonnvvoolluuttiioonn |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---- | ------------------------------------------- | --- | --- | --- | --- | --- |
CCoonnvvoolluuttiioonn
33
IInnppuutt
| The | total loss | is given | by                                 | :-  |         |                            |     |                         |     |     |     |
| --- | ---------- | -------- | ---------------------------------- | --- | ------- | -------------------------- | --- | ----------------------- | --- | --- | --- |
|     |            | L        | (p(cid:126),(cid:126)a,(cid:126)x) | =   | αL      | (p(cid:126),(cid:126)x)+βL |     | ((cid:126)a,(cid:126)x) |     |     |     |
|     |            |          | total                              |     | content |                            |     | style                   |     |     |     |
66/72
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture13 |     |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --------- | --- | --- | --- |

| Module | 13.10: Fooling | Deep Convolution | Neural |
| ------ | -------------- | ---------------- | ------ |
Networks
67/72
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| --- | -------------- | --------------------- | --------- |

Turns out that using this idea of optimizing over the input, we can also “fool”
ConvNets
Let us see how
68/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |
| -------------- | --------------------- | --------- |

|     |     |      |     | Suppose          | we feed in | an image to a |
| --- | --- | ---- | --- | ---------------- | ---------- | ------------- |
| 227 |     |      |     | ostrich Convnet. |            |               |
|     | 55  |      |     | .                |            |               |
|     | 27  | 23 1 | 1   | . .              |            |               |
11 3 5 9 7 N o w i n s t e a d o f m a x i m i z i n g t h e lo g -
| 3   |     | 3 3 | 3 3 35 2 |     |     |     |
| --- | --- | --- | -------- | --- | --- | --- |
| 11  | 5 3 | 3   | 3 3 35 2 |     |     |     |
1 1 9 7 2 5 6 2 5 6 b . us l i k e l ih o o d o f th e c o r r e c t c l a s s ( b u s ) w e
|     | 27  | 23    | 3 8 4 Co nv o l ution Max P o oling | .   |     |     |
| --- | --- | ----- | ----------------------------------- | --- | --- | --- |
|     | 55  | 2 5 6 | 3 8 4 Co nv o l ution               | .   |     |     |
227 Max P o oling Con v o l ution s e t t h e o b j ec t i ve t o m a x im i z e s o m e
|     | 96 256                 |     |     |           |                      |     |
| --- | ---------------------- | --- | --- | --------- | -------------------- | --- |
| 96  | MaxPooling Convolution |     |     | incorrect | class (say, ostrich) |     |
Convolution
3
Input
|     |     |     |     | Turns          | out that with minimal  | changes   |
| --- | --- | --- | --- | -------------- | ---------------------- | --------- |
|     |     |     |     | to the         | image (using backprop) | we can    |
|     |     |     |     | soon convince  | the Convnet            | that this |
|     |     |     |     | is an ostrich. |                        |           |
|     |     |     |     | Let us         | see some examples      |           |
69/72
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- |

Notice that the changes
are so minimal that the
two images are indistin-
guishable to humans
But the ConvNet thinks
that the third image ob-
tainedbyaddingthefirst
image to the second im-
age is an ostrich
∗Intriguing properties of neural networks, Szegedy et al., 2013
70/72
MiteshM.Khapra CS7015(DeepLearning): Lecture13

|     |     |     |     | We can          | also do this  | start-  |
| --- | --- | --- | --- | --------------- | ------------- | ------- |
|     |     |     |     | ing with        | random images | and     |
|     |     |     |     | then optimizing | them          | to pre- |
|     |     |     |     | dict some       | class.        |         |
|     |     |     |     | In all these    | cases the     | classi- |
|     |     |     |     | fier is 99.6%   | confident     | of the  |
class
|     |     |     |     | Let us    | see an intuitive | ex-  |
| --- | --- | --- | --- | --------- | ---------------- | ---- |
|     |     |     |     | planation | of why this      | hap- |
pens
∗Neural Networks are Easily Fooled: High Confidence Predictions for Unrecognizable
| Images Nguyen, | Yosinski, Clune, | 2014 |     |     |     |     |
| -------------- | ---------------- | ---- | --- | --- | --- | --- |
71/72
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     | Images         | are extremely | high | dimen- |
| --- | -------------- | ------------- | ---- | ------ |
|     | sional objects | (R227×227)    |      |        |
Therearemanymanymanypointsin
|     | this high     | dimensional | space            |           |
| --- | ------------- | ----------- | ---------------- | --------- |
|     | Of these      | only a few  | are images       | (of       |
|     | which we      | see some    | during training) |           |
|     | Using these   | training    | images           | we fit    |
|     | some decision | boundaries  |                  |           |
|     | While doing   | so we also  | end              | up taking |
|     | decisions     | about the   | many             | many un-  |
|     | seen points   | in this     | high dimensional |           |
|     | space (Notice | the         | large green      | and       |
|     | red regions   | which do    | not contain      | any       |
|     | training      | points)     |                  |           |
72/72
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture13 |     |     |
| -------------- | --------------------- | --------- | --- | --- |
