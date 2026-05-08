| CS7015 | (Deep Learning) | : Lecture | 11  |
| ------ | --------------- | --------- | --- |
Convolutional Neural Networks, LeNet, AlexNet, ZF-Net, VGGNet,
|     | GoogLeNet | and ResNet |     |
| --- | --------- | ---------- | --- |
|     | Mitesh    | M. Khapra  |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

| Module | 11.1 : The | convolution | operation |     |
| ------ | ---------- | ----------- | --------- | --- |
2/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | Suppose | we are tracking | the position |     |
| --- | --- | --- | ------- | --------------- | ------------ | --- |
ofanaeroplaneusingalasersensorat
|     |     |     | discrete    | time intervals |          |     |
| --- | --- | --- | ----------- | -------------- | -------- | --- |
|     |     |     | Now suppose | our sensor     | is noisy |     |
| x   | x   | x   |             |                |          |     |
| 0   | 1   | 2   |             |                |          |     |
|     |     |     | To obtain   | a less noisy   | estimate | we  |
wouldliketoaverageseveralmeasure-
∞
| (cid:88) |           |     | ments       |              |     |      |
| -------- | --------- | --- | ----------- | ------------ | --- | ---- |
| s = x    | w = (x∗w) |     |             |              |     |      |
| t        | t−a −a    | t   |             |              |     |      |
|          |           |     | More recent | measurements | are | more |
a=0
|     |     |     | important | so we would | like to take | a   |
| --- | --- | --- | --------- | ----------- | ------------ | --- |
|     |     |     | weighted  | average     |              |     |
ifinlpteurt
convolution
3/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     |     |     | In practice, | we would | only sum | over a |
| --- | --- | --- | --- | --- | --- | ------------ | -------- | -------- | ------ |
| 6   |     |     |     |     |     | small window |          |          |        |
(cid:88)
| s = | x w    |     |     |     |     |            |           |          |        |
| --- | ------ | --- | --- | --- | --- | ---------- | --------- | -------- | ------ |
| t   | t−a −a |     |     |     |     |            |           |          |        |
|     |        |     |     |     |     | The weight | array (w) | is known | as the |
a=0
filter
Wejustslidethefilterovertheinputand
|     |     |     |     |     |     | compute | the value of s | based | on a win- |
| --- | --- | --- | --- | --- | --- | ------- | -------------- | ----- | --------- |
t
|             |           |          |     |     |     | dow around | x t        |             |        |
| ----------- | --------- | -------- | --- | --- | --- | ---------- | ---------- | ----------- | ------ |
| w−6 w−5     | w−4 w−3   | w−2 w−1  | w0  |     |     |            |            |             |        |
|             |           |          |     |     |     | Here the   | input (and | the kernel) | is one |
| W 0.01 0.01 | 0.02 0.02 | 0.04 0.4 | 0.5 |     |     |            |            |             |        |
dimensional
X 1.00 1.10 1.20 1.40 1.70 1.80 1.90 2.10 2.20 2.40 2.50 2.70 Can we use a convolutional operation on
|        |         |      |           |           |           | a 2D input | also? |     |     |
| ------ | ------- | ---- | --------- | --------- | --------- | ---------- | ----- | --- | --- |
| S      |         | 0.00 | 1.80 0.00 | 0.00 0.00 | 0.00 0.00 |            |       |     |     |
| s =x w | +x w +x | w    | +x w      | +x w      | +x w      | +x w       |       |     |     |
| 6 6 0  | 5 −1    | 4 −2 | 3 −3      | 2 −4      | 1 −5      | 0 −6       |       |     |     |
4/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     |     |     | In practice, | we would | only sum | over a |
| --- | --- | --- | --- | --- | --- | --- | ------------ | -------- | -------- | ------ |
|     | 6   |     |     |     |     |     | small window |          |          |        |
(cid:88)
| s   | =   | x w |     |     |     |     |            |           |          |        |
| --- | --- | --- | --- | --- | --- | --- | ---------- | --------- | -------- | ------ |
| t   |     | t−a | −a  |     |     |     |            |           |          |        |
|     |     |     |     |     |     |     | The weight | array (w) | is known | as the |
a=0
filter
Wejustslidethefilterovertheinputand
|     |     |     |     |     |     |     | compute | the value of s | based | on a win- |
| --- | --- | --- | --- | --- | --- | --- | ------- | -------------- | ----- | --------- |
t
|     |      |      |           |          |     |     | dow around | x t        |             |        |
| --- | ---- | ---- | --------- | -------- | --- | --- | ---------- | ---------- | ----------- | ------ |
|     | w−6  | w−5  | w−4 w−3   | w−2 w−1  | w0  |     |            |            |             |        |
|     |      |      |           |          |     |     | Here the   | input (and | the kernel) | is one |
| W   | 0.01 | 0.01 | 0.02 0.02 | 0.04 0.4 | 0.5 |     |            |            |             |        |
dimensional
X 1.00 1.10 1.20 1.40 1.70 1.80 1.90 2.10 2.20 2.40 2.50 2.70 Can we use a convolutional operation on
|      |     |      |      |           |                |           | a 2D input | also? |     |     |
| ---- | --- | ---- | ---- | --------- | -------------- | --------- | ---------- | ----- | --- | --- |
| S    |     |      |      | 0.00 1.80 | 1.96 0.00 0.00 | 0.00 0.00 |            |       |     |     |
| s =x | w   | +x w | +x   | w +x w    | +x w           | +x w      | +x w       |       |     |     |
| 6    | 6 0 | 5    | −1 4 | −2 3      | −3 2 −4        | 1 −5      | 0 −6       |       |     |     |
5/1
|     |     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     |     | In practice, | we would | only sum | over a |
| --- | --- | --- | --- | --- | --- | ------------ | -------- | -------- | ------ |
| 6   |     |     |     |     |     | small window |          |          |        |
(cid:88)
| s = | x w    |     |     |     |     |            |           |          |        |
| --- | ------ | --- | --- | --- | --- | ---------- | --------- | -------- | ------ |
| t   | t−a −a |     |     |     |     |            |           |          |        |
|     |        |     |     |     |     | The weight | array (w) | is known | as the |
a=0
filter
Wejustslidethefilterovertheinputand
|     |     |     |     |     |     | compute | the value of s | based | on a win- |
| --- | --- | --- | --- | --- | --- | ------- | -------------- | ----- | --------- |
t
|     |           |           |          |     |     | dow around | x t        |             |        |
| --- | --------- | --------- | -------- | --- | --- | ---------- | ---------- | ----------- | ------ |
|     | w−6 w−5   | w−4 w−3   | w−2 w−1  | w0  |     |            |            |             |        |
|     |           |           |          |     |     | Here the   | input (and | the kernel) | is one |
| W   | 0.01 0.01 | 0.02 0.02 | 0.04 0.4 | 0.5 |     |            |            |             |        |
dimensional
X 1.00 1.10 1.20 1.40 1.70 1.80 1.90 2.10 2.20 2.40 2.50 2.70 Can we use a convolutional operation on
|      |           |      |           |           |           | a 2D input | also? |     |     |
| ---- | --------- | ---- | --------- | --------- | --------- | ---------- | ----- | --- | --- |
| S    |           | 0.00 | 1.80 1.96 | 2.11 0.00 | 0.00 0.00 |            |       |     |     |
| s =x | w +x w +x | w    | +x w      | +x w      | +x w      | +x w       |       |     |     |
| 6 6  | 0 5 −1    | 4 −2 | 3 −3      | 2 −4      | 1 −5      | 0 −6       |       |     |     |
6/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     |     | In practice, | we would | only sum | over a |
| --- | --- | --- | --- | --- | --- | ------------ | -------- | -------- | ------ |
| 6   |     |     |     |     |     | small window |          |          |        |
(cid:88)
| s = | x w |     |     |     |     |            |           |          |        |
| --- | --- | --- | --- | --- | --- | ---------- | --------- | -------- | ------ |
| t   | t−a | −a  |     |     |     |            |           |          |        |
|     |     |     |     |     |     | The weight | array (w) | is known | as the |
a=0
filter
Wejustslidethefilterovertheinputand
|     |     |     |     |     |     | compute | the value of s | based | on a win- |
| --- | --- | --- | --- | --- | --- | ------- | -------------- | ----- | --------- |
t
|     |     |      |           |           |         | dow around | x t        |             |        |
| --- | --- | ---- | --------- | --------- | ------- | ---------- | ---------- | ----------- | ------ |
|     |     | w−6  | w−5 w−4   | w−3 w−2   | w−1 w0  |            |            |             |        |
|     |     |      |           |           |         | Here the   | input (and | the kernel) | is one |
| W   |     | 0.01 | 0.01 0.02 | 0.02 0.04 | 0.4 0.5 |            |            |             |        |
dimensional
X 1.00 1.10 1.20 1.40 1.70 1.80 1.90 2.10 2.20 2.40 2.50 2.70 Can we use a convolutional operation on
|        |      |      |           |           |           | a 2D input | also? |     |     |
| ------ | ---- | ---- | --------- | --------- | --------- | ---------- | ----- | --- | --- |
| S      |      |      | 0.00 1.80 | 1.96 2.11 | 2.16 2.28 | 0.00       |       |     |     |
| s =x w | +x w | +x   | w +x w    | +x        | w +x      | w +x w     |       |     |     |
| 6 6 0  | 5    | −1 4 | −2 3      | −3 2      | −4 1      | −5 0 −6    |       |     |     |
7/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

|     |     |     |     |     |     | In practice, | we would | only sum | over a |
| --- | --- | --- | --- | --- | --- | ------------ | -------- | -------- | ------ |
| 6   |     |     |     |     |     | small window |          |          |        |
(cid:88)
| s = | x w    |     |     |     |     |            |           |          |        |
| --- | ------ | --- | --- | --- | --- | ---------- | --------- | -------- | ------ |
| t   | t−a −a |     |     |     |     |            |           |          |        |
|     |        |     |     |     |     | The weight | array (w) | is known | as the |
a=0
filter
Wejustslidethefilterovertheinputand
|     |     |     |     |     |     | compute | the value of s | based | on a win- |
| --- | --- | --- | --- | --- | --- | ------- | -------------- | ----- | --------- |
t
|     |     |      |           |           |         | dow around | x t        |             |        |
| --- | --- | ---- | --------- | --------- | ------- | ---------- | ---------- | ----------- | ------ |
|     |     | w−6  | w−5 w−4   | w−3 w−2   | w−1 w0  |            |            |             |        |
|     |     |      |           |           |         | Here the   | input (and | the kernel) | is one |
| W   |     | 0.01 | 0.01 0.02 | 0.02 0.04 | 0.4 0.5 |            |            |             |        |
dimensional
X 1.00 1.10 1.20 1.40 1.70 1.80 1.90 2.10 2.20 2.40 2.50 2.70 Can we use a convolutional operation on
|        |         |      |           |           |           | a 2D input | also? |     |     |
| ------ | ------- | ---- | --------- | --------- | --------- | ---------- | ----- | --- | --- |
| S      |         | 0.00 | 1.80 1.96 | 2.11 2.16 | 2.28 2.42 |            |       |     |     |
| s =x w | +x w +x | w    | +x w      | +x w      | +x w      | +x w       |       |     |     |
| 6 6 0  | 5 −1    | 4 −2 | 3 −3      | 2 −4      | 1 −5      | 0 −6       |       |     |     |
8/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     | We can   | think of images | as 2D inputs       |
| --- | --- | --- | -------- | --------------- | ------------------ |
|     |     |     | We would | now like        | to use a 2D filter |
(m×n)
|     |     |     | First let | us see what | the 2D formula |
| --- | --- | --- | --------- | ----------- | -------------- |
looks like
|     |     |     | This formula   | looks  | at all the preced- |
| --- | --- | --- | -------------- | ------ | ------------------ |
|     |     |     | ing neighbours | (i−a,j | −b)                |
|     |     |     | In practice,   | we use | the following for- |
|     |     |     | mula which     | looks  | at the succeeding  |
m−1n−1 neighbours
(cid:88) (cid:88)
| S ij =(I∗K) | = I i−a,j−b | K a,b I i+a,j+b | K a,b |     |     |
| ----------- | ----------- | --------------- | ----- | --- | --- |
ij
a=0 b=0
9/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | Let us | apply this idea | to a toy ex- |
| --- | --- | --- | ------ | --------------- | ------------ |
Input
|     | Kernel |     | ample and | see the results |     |
| --- | ------ | --- | --------- | --------------- | --- |
| a b | c d    |     |           |                 |     |
w x
g
| e f | h   |     |     |     |     |
| --- | --- | --- | --- | --- | --- |
y z
| i j | k (cid:96) |     |     |     |     |
| --- | ---------- | --- | --- | --- | --- |
Output
| aw+bx+ey+fz | bw+cx+fy+gz | cw+dx+gy+hz        |     |     |     |
| ----------- | ----------- | ------------------ | --- | --- | --- |
| ew+fx+iy+jz | fw+gx+jy+kz | gw+hx+ky+(cid:96)z |     |     |     |
10/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|          |                              |            |        | For the                           | rest of the | discussion | we will |
| -------- | ---------------------------- | ---------- | ------ | --------------------------------- | ----------- | ---------- | ------- |
|          | (cid:98) m (cid:99) (cid:98) | n (cid:99) |        |                                   |             |            |         |
|          | 2                            | 2          |        | usethefollowingformulaforconvolu- |             |            |         |
|          | (cid:88) (cid:88)            |            |        |                                   |             |            |         |
| S =(I∗K) | =                            | I Km       | +a,n   |                                   |             |            |         |
| ij       | ij                           | i−a,j−b    | 2 2 +b | tion                              |             |            |         |
a=(cid:98)−m(cid:99)b=(cid:98)−n(cid:99)
|     | 2   | 2   |     | In other   | words we    | will assume | that     |
| --- | --- | --- | --- | ---------- | ----------- | ----------- | -------- |
|     |     |     |     | the kernel | is centered | on the      | pixel of |
interest
| pixel of | interest |     |     |     |     |     |     |
| -------- | -------- | --- | --- | --- | --- | --- | --- |
Sowewillbelookingatbothpreceed-
|     |     |     |     | ing and | succeeding | neighbors |     |
| --- | --- | --- | --- | ------- | ---------- | --------- | --- |
11/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Let us see some examples of 2D convolutions applied to images
12/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| -------------- | --------------------- | --------- |

| 1 1 1          |                       |            |
| -------------- | --------------------- | ---------- |
| ∗ 1 1 1        | =                     |            |
| 1 1 1          |                       |            |
|                | blurs the             | image 13/1 |
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11  |

| 0 -1 0         |                       |           |      |
| -------------- | --------------------- | --------- | ---- |
| ∗ -1 5 -1      | =                     |           |      |
| 0 -1 0         |                       |           |      |
|                | sharpens              | the image | 14/1 |
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |      |

| 1 1 1          |                       |           |      |
| -------------- | --------------------- | --------- | ---- |
| ∗ 1 -8 1       | =                     |           |      |
| 1 1 1          |                       |           |      |
|                | detects               | the edges | 15/1 |
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |      |

| We will now | see a working | example | of 2D convolution. |
| ----------- | ------------- | ------- | ------------------ |
16/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

Wejustslidethekernelovertheinput
image
|     | Each time     | we slide      | the kernel we get |
| --- | ------------- | ------------- | ----------------- |
|     | one value     | in the output |                   |
|     | The resulting | output        | is called a fea-  |
|     | ture map.     |               |                   |
Wecanusemultiplefilterstogetmul-
|     | tiple feature | maps. |     |
| --- | ------------- | ----- | --- |
17/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

a b c d
Question
e g
| Inthe1Dcase,weslideaonedimensional |                   |       |     | f h |
| ---------------------------------- | ----------------- | ----- | --- | --- |
| filter over                        | a one dimensional | input |     |     |
i j k l
| In the  | 2D case, we slide | a two dimen-     |           |     |
| ------- | ----------------- | ---------------- | --------- | --- |
| stional | filter over a two | dimensional out- |           |     |
|         |                   |                  | A B C B A | B C |
put
| What would | happen in | the 3D case? |     |     |
| ---------- | --------- | ------------ | --- | --- |
18/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

R G B
|     | What | would | a 3D | filter look | like? |     |
| --- | ---- | ----- | ---- | ----------- | ----- | --- |
Itwillbe3Dandwewillrefertoitasavolume
|     | Once again | we  | will    | slide | the volume  | over the |
| --- | ---------- | --- | ------- | ----- | ----------- | -------- |
|     | 3D input   | and | compute | the   | convolution | oper-    |
ation
|     | Note that  | in     | this lecture |     | we will      | assume that |
| --- | ---------- | ------ | ------------ | --- | ------------ | ----------- |
|     | the filter | always | extends      |     | to the depth | of the      |
image
filter
|     | In effect, | we are | doing | a 2D     | convolution | oper-        |
| --- | ---------- | ------ | ----- | -------- | ----------- | ------------ |
|     | ation on   | a 3D   | input | (because | the         | filter moves |
|     | along the  | height | and   | the      | width but   | not along    |
the depth)
|     | As a result | the | output | will | be 2D | (only width |
| --- | ----------- | --- | ------ | ---- | ----- | ----------- |
|     | and height, | no  | depth) |      |       |             |
OUTPUT
INPUT Onceagainwecanapplymultiplefilterstoget
|     | multiple | feature | maps |     |     |     |
| --- | -------- | ------- | ---- | --- | --- | --- |
19/1
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture11 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

| Module     | 11.2 : Relation | between | input | size, output | size |
| ---------- | --------------- | ------- | ----- | ------------ | ---- |
| and filter | size            |         |       |              |      |
20/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

So far we have not said anything explicit about the dimensions of the
1 inputs
2 filters
3 outputs
and the relations between them
We will see how they are related but before that we will define a few quantities
21/1
MiteshM.Khapra CS7015(DeepLearning): Lecture11

|     |     | We first | define the | following quantit- |     |
| --- | --- | -------- | ---------- | ------------------ | --- |
ies
|     |     | Width(W | ), Height(H  | ) andDepth |     |
| --- | --- | ------- | ------------ | ---------- | --- |
| F   |     |         | 1            | 1          |     |
|     |     | (D ) of | the original | input      |     |
1
|     |     | The Stride | S (We will | come back | to  |
| --- | --- | ---------- | ---------- | --------- | --- |
F
| D1  | H2  | this later) |            |             |        |
| --- | --- | ----------- | ---------- | ----------- | ------ |
|     |     | The number  | of filters | K           |        |
|     |     | The spatial | extent     | (F) of each | filter |
H1
|     |     | (the depth                   | of each        | filter is same | as   |
| --- | --- | ---------------------------- | -------------- | -------------- | ---- |
|     |     | the depth                    | of each input) |                |      |
|     |     | The output                   | is W ×H        | ×D (we         | will |
|     |     |                              | 2              | 2 2            |      |
|     | W2  | soonseeaformulaforcomputingW |                |                | ,    |
2
| W1  |     | H and | D ) |     |     |
| --- | --- | ----- | --- | --- | --- |
|     | D2  | 2     | 2   |     |     |
D1
22/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

====
pixel of interest
|     | Let us compute | the dimension | (W 2 ,H 2 ) of |
| --- | -------------- | ------------- | -------------- |
the output
|     | Notice that    | we can’t place   | the kernel at the  |
| --- | -------------- | ---------------- | ------------------ |
|     | corners as     | it will cross    | the input boundary |
|     | This is        | true for all the | shaded points (the |
|     | kernel crosses | the input        | boundary)          |
Thisresultsinanoutputwhichisofsmaller
|     | dimensions | than the input |     |
| --- | ---------- | -------------- | --- |
23/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

======
pixel of interest
pixel of interest
|     |     |     | Let us compute | the dimension | (W 2 ,H 2 ) of |
| --- | --- | --- | -------------- | ------------- | -------------- |
the output
|     |     |     | Notice that    | we can’t place   | the kernel at the  |
| --- | --- | --- | -------------- | ---------------- | ------------------ |
|     |     |     | corners as     | it will cross    | the input boundary |
|     |     |     | This is        | true for all the | shaded points (the |
|     |     |     | kernel crosses | the input        | boundary)          |
Thisresultsinanoutputwhichisofsmaller
|             |           |       | dimensions   | than the input |                     |
| ----------- | --------- | ----- | ------------ | -------------- | ------------------- |
|             |           |       | As the size  | of the kernel  | increases, this be- |
| In general, | W = W     | −F +1 |              |                |                     |
|             | 2 1       |       | comes true   | for even more  | pixels              |
|             | H 2 = H 1 | −F +1 | For example, | let’s consider | a 5 × 5 kernel      |
We will refine this formula further We have an even smaller output now
24/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|             |          |       |     | What if     | we want the   | output to be     | of same |
| ----------- | -------- | ----- | --- | ----------- | ------------- | ---------------- | ------- |
| 00 00 00 00 | 00 00 00 | 00 00 |     | size as the | input?        |                  |         |
| 00          |          | 00    |     |             |               |                  |         |
|             |          |       |     | We can      | use something | known as padding |         |
| 00          |          | 00    |     |             |               |                  |         |
Padtheinputswithappropriatenumberof0
| 00  |     | 00  |     |                                     |           |              |         |
| --- | --- | --- | --- | ----------------------------------- | --------- | ------------ | ------- |
|     |     | ==  |     | inputssothatyoucannowapplythekernel |           |              |         |
| 00  |     | 00  |     |                                     |           |              |         |
|     |     |     |     | at the corners                      |           |              |         |
| 00  |     | 00  |     |                                     |           |              |         |
|     |     |     |     | Let us use                          | pad P = 1 | with a 3 × 3 | kernel  |
| 00  |     | 00  |     |                                     |           |              |         |
| 00  |     | 00  |     | This means                          | we will   | add one row  | and one |
00 00 00 00 00 00 00 00 00 column of 0 inputs at the top, bottom, left
|     |     |      |           | and right |     |     |     |
| --- | --- | ---- | --------- | --------- | --- | --- | --- |
|     |     | We   | now have, |           |     |     |     |
|     | W = | W −F | +2P +1    |           |     |     |     |
2 1
|                | H 2 = | H 1 −F  | +2P +1  |     |     |     |     |
| -------------- | ----- | ------- | ------- | --- | --- | --- | --- |
| We will refine | this  | formula | further |     |     |     |     |
25/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

| 0 0 0 0 | 0 0 0 0 0 |     | What       | does the stride | S do?        |
| ------- | --------- | --- | ---------- | --------------- | ------------ |
| 0       | 0         |     |            |                 |              |
| 0       | 0         |     | It defines | the intervals   | at which the |
|         |           |     | filter is  | applied (here   | S = 2)       |
| 0       | 0         |     |            |                 |              |
=
| 0              | 0                 |            |           |                 |             |
| -------------- | ----------------- | ---------- | --------- | --------------- | ----------- |
|                |                   |            | Here, we  | are essentially | skipping    |
| 0              | 0                 |            |           |                 |             |
|                |                   |            | every 2nd | pixel which     | will again  |
| 0              | 0                 |            |           |                 |             |
|                |                   |            | result    | in an output    | which is of |
| 0              | 0                 |            |           |                 |             |
| 0 0 0 0        | 0 0 0 0 0         |            | smaller   | dimensions      |             |
| So what should | our final formula | look like, |           |                 |             |
W 1 −F +2P
|     | W = | +1  |     |     |     |
| --- | --- | --- | --- | --- | --- |
2
S
H −F +2P
|     | H = | 1 +1 |     |     |     |
| --- | --- | ---- | --- | --- | --- |
2
S
26/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     | Finally, | coming to | the depth of the |
| --- | -------- | --------- | ---------------- |
output.
|     | Each filter | gives us     | one 2D output. |
| --- | ----------- | ------------ | -------------- |
|     | K filters   | will give us | K such 2D out- |
puts
H2
|     | We can  | think of the | resulting output |
| --- | ------- | ------------ | ---------------- |
|     | as K ×W | ×H volume    |                  |
filter 2 2
H1
|     | Thus D | 2 = K |     |
| --- | ------ | ----- | --- |
W2
W1
D2=K
D1
W2=W1− S F+2P+1
H2=H1−F +2P+1
S
D2=K
27/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

Let us do a few exercises
55=HH2
22
27==
4
−??11+1
11
∗ =
11
227
3
96filters
55=WWW22
222
7
4
−===1???1+1
227 Stride=4
Padding=0
W2=W1−
S
F+2P+1 D29=6?
3 H2=H1−F
S
+2P+1
28/1
MiteshM.Khapra CS7015(DeepLearning): Lecture11

Let us do a few exercises
28=HH22 32==
1
−??5+1
5
∗ =
5
32
1
6filters
28=WWW3
222
2
1
−===5???+1
32 Stride=1
Padding=0
W2=W1−
S
F+2P+1 D26=?
1 H2=H1−F
S
+2P+1
29/1
MiteshM.Khapra CS7015(DeepLearning): Lecture11

| Module | 11.3 : Convolutional |     | Neural | Networks |
| ------ | -------------------- | --- | ------ | -------- |
30/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

Putting things into perspective
What is the connection between this operation (convolution) and neural net-
works?
We will try to understand this by considering the task of “image classification”
31/1
MiteshM.Khapra CS7015(DeepLearning): Lecture11

Features
Rawpixels
car, bus, monument, flower
EdgeDetector
car, bus, monument, flower
SIFT/HOG
car, bus, monument, flower
static feature extraction (no learning) learning weights of classifier
32/1
MiteshM.Khapra CS7015(DeepLearning): Lecture11

| Input | Features | Classifier          |        |
| ----- | -------- | ------------------- | ------ |
|       |          | car, bus, monument, | flower |
0 0 0 0 0
0 1 1 1 0
0 1 -8 1 0
0 1 1 1 0
0 0 0 0 0
|     |     | car, bus, monument, | flower |
| --- | --- | ------------------- | ------ |
-1.21358689e-033.23652686e-03······-2.06615720e-02
-1.52757822e-032.36130832e-03······-1.19824838e-02
... ... ...
|     |     | Learn these weights |     |
| --- | --- | ------------------- | --- |
... ... ...
-8.25322699e-04-5.14897937e-03······-9.90395527e-03
Insteadof using handcraftedkernelssuchas edgedetectors can we learn meaningful ker-
nels/filters in addition to learning the weights of the classifier?
33/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

| Input | Features | Classifier          |        |
| ----- | -------- | ------------------- | ------ |
|       |          | car, bus, monument, | flower |
0 0 0 0 0
0 1 1 1 0
0 1 -8 1 0
0 1 1 1 0
0 0 0 0 0
|     |     | car, bus, monument, | flower |
| --- | --- | ------------------- | ------ |
---010..02.02133135878706148139e3-303-0-.0303..220341630582776588964e-80·3·················-20.0.06-6041.6054877422058e78-20725
--010...05052037175570184523822e-50-30.05023..5030617196336058·39·2·3e7-0·3·······-0·.04··3··2··367-410.1.0981204186385e4-202
... ... ... ... ... ... ... ... ...
... ... ... ... ... ... ... ... ...
--080...02005373092220568097197e-704-0.0-05.0.015040833933715992317e7-0·3·················-9-.09.00032.90750591271741e62-70843
Even better: Instead of using handcrafted kernels (such as edge detectors)can we learn
multiple meaningful kernels/filters in addition to learning the weights of the clas-
34/1
sifier?
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

| Input |     |     |     | Classifier |
| ----- | --- | --- | --- | ---------- |
car,bus,monument,flower
|     | -1.21358689e-033.23652686e-03······-2.06615720e-02 |     | -0.011125820.02185669······ 0.00015161 |     |
| --- | -------------------------------------------------- | --- | -------------------------------------- | --- |
-1.52757822e-032.36130832e-03······-1.19824838e-02 -0.006875870.01229961······ 0.00214013 backpropagation
|     | ... ...                                             | ... | ... ... ...                             |     |
| --- | --------------------------------------------------- | --- | --------------------------------------- | --- |
|     | ... ...                                             | ... | ... ... ...                             |     |
|     | -8.25322699e-04-5.14897937e-03······-9.90395527e-03 |     | -0.00372989-0.00886137······-0.01974954 |     |
Can we learn multiple layers of meaningful kernels/filters in addition to
| learning    | the weights | of the classifier? |     |     |
| ----------- | ----------- | ------------------ | --- | --- |
| Yes, we can | !           |                    |     |     |
Simply by treating these kernels as parameters and learning them in addition to the
| weights of | the classifier | (using back propagation) |     |     |
| ---------- | -------------- | ------------------------ | --- | --- |
Such a network is called a Convolutional Neural Network. 35/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

Okay, I get it that the idea is to learn the kernel/filters by just treating them
| as parameters | of the classification | model |     |
| ------------- | --------------------- | ----- | --- |
But how is this different from a regular feedforward neural network
Let us see
36/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

10classes(digits)
| .   | This is what   | a regular feed-forward |     |
| --- | -------------- | ---------------------- | --- |
| .   | neural network | will look like         |     |
.
|     | There are | many dense connections |     |
| --- | --------- | ---------------------- | --- |
here
|     | For example      | all the 16 input   | neurons |
| --- | ---------------- | ------------------ | ------- |
|     | are contributing | to the computation |         |
of h
11
16
|     | Contrast            | this to what happens | in the |
| --- | ------------------- | -------------------- | ------ |
| 2   | case of convolution |                      |        |
37/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

|     |     | Only a few | local | neurons | participate |     |
| --- | --- | ---------- | ----- | ------- | ----------- | --- |
h h
11 12
|     |     | in the computation |     | of  | h   |     |
| --- | --- | ------------------ | --- | --- | --- | --- |
11
|     |       | For example, |      | only pixels | 1,  | 2, 5, 6 |
| --- | ----- | ------------ | ---- | ----------- | --- | ------- |
|     | . . . |              |      |             |     |         |
|     |       | contribute   | to h |             |     |         |
11
|     |     | The connections |     | are much | sparser |     |
| --- | --- | --------------- | --- | -------- | ------- | --- |
16
|     |     | We are    | taking | advantage          |     | of the |
| --- | --- | --------- | ------ | ------------------ | --- | ------ |
|     |     | structure | of the | image(interactions |     |        |
2
|     | hhhhh | between | neighboring | pixels |     | are more |
| --- | ----- | ------- | ----------- | ------ | --- | -------- |
1111112234
| *   | =   | interesting) |     |               |     |         |
| --- | --- | ------------ | --- | ------------- | --- | ------- |
|     |     | This sparse  |     | connectivity  |     | reduces |
|     |     | the number   |     | of parameters |     | in the  |
model
38/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- | --- |

Butissparseconnectivityreallygood
thing ?
|     | Aren’t           | we losing | information |     | (by los-   |
| --- | ---------------- | --------- | ----------- | --- | ---------- |
|     | ing interactions |           | between     |     | some input |
pixels)
|     | Well, not | really       |     |          |        |
| --- | --------- | ------------ | --- | -------- | ------ |
|     | The two   | highlighted  |     | neurons  | (x 1 & |
|     | x )∗ do   | not interact |     | in layer | 1      |
5
|     | But they    | indirectly |      | contribute | to the   |
| --- | ----------- | ---------- | ---- | ---------- | -------- |
|     | computation |            | of g | and hence  | interact |
3
indirectly
∗ Goodfellow-et-al-2016
39/1
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture11 |     |
| -------------- | --------------------- | --- | --- | --------- | --- |

|     |     |     | Another  | characteristic    | of   |
| --- | --- | --- | -------- | ----------------- | ---- |
|     |     |     | CNNs     | is weight sharing |      |
|     |     |     | Consider | the following     | net- |
work
|     |     |     | Do we | want the | kernel |
| --- | --- | --- | ----- | -------- | ------ |
16
weightstobedifferentfordif-
|          |     |     | ferent portions | of the        | image?  |
| -------- | --- | --- | --------------- | ------------- | ------- |
| Kernel 1 |     |     | Imagine         | that we are   | trying  |
|          |     |     | to learn        | a kernel that | detects |
edges
Kernel 2
| 4x4 Image |     |     | Shouldn’twebeapplyingthe |            |      |
| --------- | --- | --- | ------------------------ | ---------- | ---- |
|           |     |     | same kernel              | at all the | por- |
|           |     |     | tions of                 | the image? |      |
40/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

|     | In other             | words shouldn’t |         | the         | orange |
| --- | -------------------- | --------------- | ------- | ----------- | ------ |
|     | and pink             | kernels be      | the     | same        |        |
|     | Yes, indeed          |                 |         |             |        |
|     | This would           | make            | the job | of learning |        |
|     | easier(instead       | of              | trying  | to learn    | the    |
|     | same weights/kernels |                 | at      | different   | loc-   |
|     | ations again         | and again)      |         |             |        |
|     | But does             | that mean       | we      | can have    | only   |
16
|     | one kernel?    |              |          |        |         |
| --- | -------------- | ------------ | -------- | ------ | ------- |
|     | No, we         | can have     | many     | such   | kernels |
|     | but the        | kernels will | be       | shared | by all  |
|     | locations      | in the image |          |        |         |
|     | This is called | “weight      | sharing” |        |         |
41/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |     |
| -------------- | --------------------- | --------- | --- | --- | --- |

| So far, | we have focused | only on | the convolution | operation |
| ------- | --------------- | ------- | --------------- | --------- |
Let us see what a full convolutional neural network looks like
42/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

ConvolutionLayer2
| Input ConvolutionLayer1 |     |     |     | PoolingLayer2 |     |     |     |
| ----------------------- | --- | --- | --- | ------------- | --- | --- | --- |
A
|     |     | PoolingLayer1 |     |     | FC1(120)FC2(84)Output(10) |     |     |
| --- | --- | ------------- | --- | --- | ------------------------- | --- | --- |
32
28
14
| 32  |           |     |           |       |           |         | Pa r a m P ar a m |
| --- | --------- | --- | --------- | ----- | --------- | ------- | ----------------- |
|     |           |     |           |       | 10        | Pa r    | a m = 8 5 0       |
|     | 28        |     | 14        |       |           | 5 = 4 8 | 1 20= 1 0 1 64    |
|     |           |     |           |       | 10        | 5       |                   |
|     | S=1,F     | =5, | S=1,F =2, |       |           |         |                   |
|     | K=6,P     | =0, | K=6,P =0, |       |           |         |                   |
|     |           |     |           | S=1,F | =5, S=1,F | =2,     |                   |
|     | Param=150 |     | Param=0   |       | =0,K=16,P | =0,     |                   |
K=16,P
|                  |             |       |             | Param=2400 | Param=0 |     |     |
| ---------------- | ----------- | ----- | ----------- | ---------- | ------- | --- | --- |
| It has alternate | convolution |       | and pooling | layers     |         |     |     |
| What does        | a pooling   | layer | do?         |            |         |     |     |
Let us see
43/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

|     |     |     | 1 4 | 2 1 |         |     |
| --- | --- | --- | --- | --- | ------- | --- |
|     |     |     | 5 8 | 3 4 | maxpool | 8 4 |
=
| *       |                |     | 7 6      | 4 5 2x2filters(stride2) |         | 7 5   |
| ------- | -------------- | --- | -------- | ----------------------- | ------- | ----- |
|         |                |     | 1 3      | 1 2                     |         |       |
| Input   | 1filter        |     |          |                         |         |       |
|         |                |     | 1 4      | 2 1                     |         |       |
|         |                |     | 5 8      | 3 4                     | maxpool | 8 8 4 |
|         |                |     | 7 6      | 4 5 2x2filters(stride1) |         | 8 8 5 |
|         |                |     | 1 3      | 1 2                     |         | 7 6 5 |
| Instead | of max pooling | we  | can also | do average              | pooling |       |
44/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |
| --- | --- | -------------- | --- | --------------------- | --- | --------- |

We will now see some case studies where convolution neural networks have been
successful
45/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| -------------- | --------------------- | --------- |

|     | LeNet-5 | for | handwritten | character | recognition |     |     |     |
| --- | ------- | --- | ----------- | --------- | ----------- | --- | --- | --- |
ConvolutionLayer2
| Input |     |     |     | PoolingLayer2 |     |     |     |     |
| ----- | --- | --- | --- | ------------- | --- | --- | --- | --- |
ConvolutionLayer1
| A   |     | PoolingLayer1 |     |     | FC1(120)FC2(84)Output(10) |     |     |     |
| --- | --- | ------------- | --- | --- | ------------------------- | --- | --- | --- |
32
28
14
|     |     |     |     |     |     |     |                             | PP aa rr aa mm |
| --- | --- | --- | --- | --- | --- | --- | --------------------------- | -------------- |
| 32  |     |     |     |     |     |     | PPaa rr aa mm PPaa rr aa mm |                |
|     |     | 28  | 14  |     | 10  | 5   | 20= 1= 0? 1 64              | = = 8? 5 0     |
= 4= 8? 1
5
10
|     |     | SS==11,,FF ==55,, | SS==11,,FF ==22,, |     |            |        |     |     |
| --- | --- | ----------------- | ----------------- | --- | ---------- | ------ | --- | --- |
|     |     | KK==66,,PP ==00,, | KK==66,,PP ==00,, |     | SS==11,,FF | ==22,, |     |     |
SS==11,,FF ==55,,
|     |     | PParaarmam==1?50 | PPaarraamm==?0 | KK==1166,,PP      | ==00,,KK==1166,,PP | ==00,, |     |     |
| --- | --- | ---------------- | -------------- | ----------------- | ------------------ | ------ | --- | --- |
|     |     |                  |                | PaPraarmam==24?00 | PPaarraamm==?0     |        |     |     |
46/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

| How do | we train a | convolutional neural | network ? |     |
| ------ | ---------- | -------------------- | --------- | --- |
47/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

Input
Kernel
| b c | d   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | l   | m   | n o |
w x
| e f | g   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
y z
g
| h i | j   |     |     | b c d | e f | h i j |
| --- | --- | --- | --- | ----- | --- | ----- |
OOOOuuuuttttppppuuuutttt
|     |     |     |     | A CNN       | can be implemented | as a    |
| --- | --- | --- | --- | ----------- | ------------------ | ------- |
|     |     |     |     | feedforward | neural             | network |
(cid:96)(cid:96)(cid:96)(cid:96) mmmm
|     |     |     |     | wherein    | only a few | weights(in color) |
| --- | --- | --- | --- | ---------- | ---------- | ----------------- |
|     |     |     |     | are active |            |                   |
nnnn oooo
|        |      |                     |     | the rest | of the weights | (in gray) are |
| ------ | ---- | ------------------- | --- | -------- | -------------- | ------------- |
| We can | thus | train a convolution |     |          |                |               |
zero
| neural          | network     | using          |          |     |     |     |
| --------------- | ----------- | -------------- | -------- | --- | --- | --- |
| backpropagation |             | by thinking    | of it as |     |     |     |
| a feedforward   |             | neural network | with     |     |     |     |
| sparse          | connections |                |          |     |     |     |
48/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

| Module | 11.4 : CNNs | (success | stories | on ImageNet) |
| ------ | ----------- | -------- | ------- | ------------ |
49/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

| ImageNet Success | Stories(roadmap | for rest | of the talk) |     |
| ---------------- | --------------- | -------- | ------------ | --- |
AlexNet
ZFNet
VGGNet
50/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --- | --------------------- | --------- |

2288..22
2255..88
152layers
1166..44
1111..77
19layers 22layers
|         |                 | 77..33 66..77 |          |
| ------- | --------------- | ------------- | -------- |
| shallow | 8layers 8layers |               | 33..5577 |
IILLSSVVRRCC’’1100 IILLSSVVRRCC’’1111 IILLSSVVRRCC’’1122 IILLSSVVRRCC’’1133 IILLSSVVRRCC’’1144 IILLSSVVRRCC’’1144 IILLSSVVRRCC’’1155
|     | AAlleexxNNeett ZZFFNNeett | VVGGGG GGoooogglleeNNeett | RReessNNeett |
| --- | ------------------------- | ------------------------- | ------------ |
51/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --------------------- | --------- |

| ImageNet Success | Stories(roadmap | for rest | of the talk) |     |
| ---------------- | --------------- | -------- | ------------ | --- |
AlexNet
ZFNet
VGGNet
52/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --- | --------------------- | --------- |

TotalParameters:27.55M
227
55
27
23
| 11  |     |     | 11  | 9   |                 |
| --- | --- | --- | --- | --- | --------------- |
|     | 5   |     |     | 7   |                 |
| 3   |     | 3 3 | 3   |     | 5 de nse        |
| 3   |     | 3 3 |     | 3   | 3 2 dense dense |
|     | 5   |     | 3   | 3   | 3               |
| 11  |     |     |     |     | 5 2             |
|     |     |     |     | 7   | 2 5 6           |
|     |     | 11  | 9   | 256 |                 |
|     | 27  | 23  |     |     | Max P o oling   |
384 Convolution
| 55  |     |             | Convolution |     |     |
| --- | --- | ----------- | ----------- | --- | --- |
|     |     | 256         | 384         |     |     |
| 227 |     | Convolution |             |     |     |
MaxPooling 1000
|            | 96 256      |     |     |     |     |
| ---------- | ----------- | --- | --- | --- | --- |
| MaxPooling | Convolution |     |     |     |     |
4096 4096
96
Convolution
3
Input
53/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture11 |
| --- | --- | -------------- | --------------------- | --- | --------- |

| Let us look     | at the |     |     |     |     |
| --------------- | ------ | --- | --- | --- | --- |
| connections     | in the |     |     |     |     |
| fully connected | lay-   |     |     |     |     |
| ers in more     | detail |     |     |     |     |
makelinear
|         |               |     | 2   | dense dense | dense |
| ------- | ------------- | --- | --- | ----------- | ----- |
| We will | first stretch |     |     |             |       |
2
| out the | last conv |     |     |     |     |
| ------- | --------- | --- | --- | --- | --- |
256
| or maxpool | layer to  | MaxPooling |              |     |      |
| ---------- | --------- | ---------- | ------------ | --- | ---- |
| make it a  | 1d vector |            |              |     |      |
| This 1d    | vector is |            |              |     |      |
|            |           |            | 2×2×256=1024 |     | 1000 |
thendenselyconnec-
| ted to   | other lay-  |     |     |           |     |
| -------- | ----------- | --- | --- | --------- | --- |
|          |             |     |     | 4096 4096 |     |
| ers just | as in a     |     |     |           |     |
| regular  | feedforward |     |     |           |     |
neural network
54/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| ImageNet Success | Stories(roadmap | for rest | of the talk) |     |
| ---------------- | --------------- | -------- | ------------ | --- |
AlexNet
ZFNet
VGGNet
55/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --- | --------------------- | --------- |

|     | 227 | 55  |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
27
|     |               |     |             | 23         | 11          |      |           |                    |              |       |
| --- | ------------- | --- | ----------- | ---------- | ----------- | ---- | --------- | ------------------ | ------------ | ----- |
| 11  | 3             | 5   |             |            |             | 9    | 7         |                    |              |       |
|     |               |     | 3           | 3          |             | 3    | 3         | 3 5                | 2dense dense | dense |
| 11  | 3             | 5   | 3           | 3          |             | 3    | 3         | 3                  | 2            |       |
|     |               |     |             |            |             |      | 7         | 5                  |              |       |
|     |               |     |             | 11         |             | 9    |           | 2 5 6              | 2 5 6        |       |
|     |               | 27  |             | 23         |             |      | 3 8 4     | Conv o l ution Max | P o oling    |       |
|     | 55            |     |             |            | 384         | Conv | o l ution |                    |              |       |
| 227 |               |     |             | 256        |             |      |           |                    |              | 1000  |
|     |               |     | 256         | MaxPooling | Convolution |      |           |                    |              |       |
|     |               | 96  | Convolution |            |             |      |           |                    | 4096         | 4096  |
|     | 96 MaxPooling |     |             |            |             |      |           |                    |              |       |
DifferenceinTotalNo.ofParameters
3 Convolution
| Input |     |     |     |     |     |     | 1.45M |     |     |     |
| ----- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- |
227
55
|     |            |     | 27          | 23         |             |     |              |                    |              |       |
| --- | ---------- | --- | ----------- | ---------- | ----------- | --- | ------------ | ------------------ | ------------ | ----- |
|     |            |     |             |            | 11          | 9   |              |                    |              |       |
| 7   | 3          | 5   |             |            |             |     | 7            |                    |              |       |
|     | 3          |     | 3           | 3          |             | 3   | 3            | 3 5                | 2dense dense | dense |
| 7   |            | 5   | 3           | 3          |             | 3   | 3            | 3 5                | 2            |       |
|     |            |     |             |            |             | 9   | 7            |                    | 2 5 6        |       |
|     |            |     |             | 23 11      |             |     |              | 5 1 2              |              |       |
|     |            | 27  |             |            |             | 1   | 0 2 4        | Co n v olution Max | P o oling    |       |
|     | 55         |     |             |            | 512         | Co  | n v o lution |                    |              |       |
| 227 |            |     |             | 256        | Convolution |     |              |                    |              | 1000  |
|     |            | 96  | 256         | MaxPooling |             |     |              |                    |              |       |
|     | MaxPooling |     | Convolution |            |             |     |              |                    | 4096         | 4096  |
96
Convolution
| 3   |     |     |     |     |     |     |     |     |     | 56/1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
Input
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture11 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

| ImageNet Success | Stories(roadmap | for rest | of the talk) |     |
| ---------------- | --------------- | -------- | ------------ | --- |
AlexNet
ZFNet
VGGNet
57/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture11 |
| --- | -------------- | --- | --------------------- | --------- |

softmax
| 224     | 224 112 | 112 | 56  | 56 28 |     | 28      |     |      |
| ------- | ------- | --- | --- | ----- | --- | ------- | --- | ---- |
|         |         |     |     |       |     | 14      |     | 14 7 |
|         | 211     | 211 | 65  | 65 82 |     | 82 41   |     | 41 7 |
| 422 422 |         |     |     |       |     |         |     | 512  |
|         |         |     |     | 256   |     | 512 512 |     | 512  |
maxpool
|     |         | 128         |      | 256 maxpool | Conv | maxpool | Conv |     |
| --- | ------- | ----------- | ---- | ----------- | ---- | ------- | ---- | --- |
|     | 64      | 128 maxpool | Conv |             |      |         |      |     |
| 64  | maxpool | Conv        |      |             |      |         |      |     |
Input Conv 1000
fc fc
40964096
| Kernel | size       | is 3×3 | throughout |        |         |     |     |     |
| ------ | ---------- | ------ | ---------- | ------ | ------- | --- | --- | --- |
| Total  | parameters | in     | non FC     | layers | = ∼ 16M |     |     |     |
Total Parameters in FC layers = (512×7×7×4096) + (4096×4096) + (4096×1024) =
∼122M
| Most | parameters | are | in the | first FC | layer | (∼ 102M) |     |     |
| ---- | ---------- | --- | ------ | -------- | ----- | -------- | --- | --- |
58/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture11 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

| Module     | 11.5 : Image | Classification | continued |     |
| ---------- | ------------ | -------------- | --------- | --- |
| (GoogLeNet | and          | ResNet)        |           |     |
59/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| --- | --- | -------------- | --------------------- | --------- |

Considertheoutputatacertainlayer
H1
|     |            |     | of a convolutional              | neural | network |     |
| --- | ---------- | --- | ------------------------------- | ------ | ------- | --- |
| f   |            | H   |                                 |        |         |     |
|     | MaxPooling |     | Afterthislayerwecouldapplyamax- |        |         |     |
f
D
| H   |                |     | pooling | layer |     |     |
| --- | -------------- | --- | ------- | ----- | --- | --- |
| 1   | W1 convolution | H2  |         |       |     |     |
1
|     |     |     | Or a 1×1 | convolution |     |     |
| --- | --- | --- | -------- | ----------- | --- | --- |
D
| 3   | 1   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
convolution
| 3   |     |     | Or a 3×3 | convolution |     |     |
| --- | --- | --- | -------- | ----------- | --- | --- |
| D   | W   |     |          |             |     |     |
|     |     | H3  | Or a 5×5 | convolution |     |     |
W2
W
| 5   |     |     | Question: | Why | choose between |     |
| --- | --- | --- | --------- | --- | -------------- | --- |
convolution
| 5   | 1   |     |               |               |             |     |
| --- | --- | --- | ------------- | ------------- | ----------- | --- |
|     |     |     | these options | (convolution, | maxpool-    |     |
| D   |     | 1   |               |               |             |     |
| D   |     | W3  | ing, filter   | sizes)?       |             |     |
|     |     |     | Idea: Why     | not apply     | all of them | at  |
1
|     |     |     | the same    | time and | then concatenate |     |
| --- | --- | --- | ----------- | -------- | ---------------- | --- |
|     |     |     | the feature | maps?    |                  |     |
60/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Well this | naive idea | could result | in a |
| --- | --- | --- | --------- | ---------- | ------------ | ---- |
H1
|     |            |     | large number | of computations |            |     |
| --- | ---------- | --- | ------------ | --------------- | ---------- | --- |
| f   |            | H   |              |                 |            |     |
|     | MaxPooling |     | If P = 0     | & S = 1 then    | convolving | a   |
f
D
| H   |                |     | W ×H ×D | input with | a F ×F | ×D  |
| --- | -------------- | --- | ------- | ---------- | ------ | --- |
| 1   | W1 convolution | H2  |         |            |        |     |
1
|     |     |     | filter results | in a (W | − F + 1)(H | −   |
| --- | --- | --- | -------------- | ------- | ---------- | --- |
D
| 3   | 1   |     | F +1) sized | output |     |     |
| --- | --- | --- | ----------- | ------ | --- | --- |
convolution
3
| D   |     | W   |              |        |                 |     |
| --- | --- | --- | ------------ | ------ | --------------- | --- |
|     |     |     | Each element | of the | output requires |     |
H3
|     |     | W2  | O(F ×F | ×D) computations |     |     |
| --- | --- | --- | ------ | ---------------- | --- | --- |
W
5
convolution
| 5   | 1   |     | Can we reduce | the number | of compu- |     |
| --- | --- | --- | ------------- | ---------- | --------- | --- |
| D   |     | 1   | tations?      |            |           |     |
| D   |     | W3  |               |            |           |     |
1
61/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     | Yes, by | using 1×1               | convolutions |     |     |
| --- | --- | ------- | ----------------------- | ------------ | --- | --- |
|     |     | Huh??   | Whatdoesa1×1convolution |              |     |     |
do ?
H HH
|     |     | It aggregates      | along | the | depth     |     |
| --- | --- | ------------------ | ----- | --- | --------- | --- |
|     |     | SoconvolvingaD×W×H |       |     | inputwith |     |
1
| 1   |     | D 1 1×1(D | 1 < D)filterswillresultin |     |       |      |
| --- | --- | --------- | ------------------------- | --- | ----- | ---- |
| D   |     | a D ×W    | ×H output                 | (S  | = 1,P | = 0) |
1
|     |     | If D 1 <  | D then    | this | effectively | re- |
| --- | --- | --------- | --------- | ---- | ----------- | --- |
| W   |     | duces the | dimension | of   | the input   | and |
WW
|       |     | hence the    | computations |        |     |        |
| ----- | --- | ------------ | ------------ | ------ | --- | ------ |
|       |     | Specifically | instead      | of O(F | ×F  | ×D)    |
|       |     | we will      | need O(F     | ×F ×D  | )   | compu- |
| D D11 |     |              |              |        | 1   |        |
tations
Wecouldthenapplysubsequent3×3,
|     |     | 5×5 filter | on this | reduced | output |     |
| --- | --- | ---------- | ------- | ------- | ------ | --- |
62/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- | --- |

|     |     | But we | might want | to use | different |
| --- | --- | ------ | ---------- | ------ | --------- |
1×1convolutions
| 28  |     | dimensionality | reductions | before | the |
| --- | --- | -------------- | ---------- | ------ | --- |
1 × 1 c o n v o l u t io n s 3 3 3 ××× 333 ccc ooonnn vvv ooollluuu ttt iiiooo nnn sss
( d i m e n s i o n a l it y r e - ( ( (ooo nnnrrr eeeddd uuu ccceee ddd iiinnn ppp uuu ttt ))) 3×3 and 5×5 filters
d u c t i o n )
Filter
1 1 ×× 11 cc oo nn vv oo ll uu tt iioo nn ss concatenation S o w e c a n u s e D an d D 1 × 1 fi l -
( ( dd ii mm ee nn ss ii oo nn aa ll iitt yy rr ee -- 5 5 5 ××× 555 ccc ooonnn vvv ooollluuu ttt iiiooo nnn sss 1 2
( ( (ooo nnnrrr eeeddd uuu ccceee ddd iiinnn ppp uuu ttt )))
d d uu cc tt ii oo nn )) te rs b ef o r e t h e 3 × 3 a nd 5 × 5 fi lte r s
28
3 × 3 M a x p o o lin g respectively
(d im en si o n al i ty r e- 11××11ccoonnvvoolluuttiioonnss
duction)
| 256 |     | We can         | then add          | the maxpooling |     |
| --- | --- | -------------- | ----------------- | -------------- | --- |
|     |     | layer followed | by dimensionality |                | re- |
duction
|     |     | And a new   | set of 1×1     | convolutions |           |
| --- | --- | ----------- | -------------- | ------------ | --------- |
|     |     | And finally | we concatenate |              | all these |
layers
|     |     | ThisiscalledtheInception |                   |           | module |
| --- | --- | ------------------------ | ----------------- | --------- | ------ |
|     |     | We will                  | now see GoogLeNet |           | which  |
|     |     | contains                 | many such         | inception | mod-   |
ules
63/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

| 229 112 | 56 56 28 | 28 28 |     |     |       |     |           |     |
| ------- | -------- | ----- | --- | --- | ----- | --- | --------- | --- |
|         |          |       | 14  |     | 14 14 | 14  | 7 7 7     |     |
|         |          |       |     |     |       |     | 5a 5b 1 1 | 1 1 |
922 211 65 65 82 3a 82 3b 82 41 4a 4b 4c 41 4d 41 4e 41 7 7 7 avgpool 1024 dropout(40%) 1024
|     |     |     |     |     |     | 832 | 832 1024 |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- |
192 256 480 maxpool 480 Inception 512 Inception 528 Inception 832 maxpool Inception Inception 1000 1000
| 64  | 192 maxpool Inception | Inception |     |     |     |     |     | fc softmax |
| --- | --------------------- | --------- | --- | --- | --- | --- | --- | ---------- |
Conv 64maxpool Conv
Input
641×1convolutions
28
|     |     |     |     | 961×1convolu-        | 1283×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
|     |     |     |     | 1 6 1 ×       | 1 c o n v o lu -                |                      | concatenation |     |
| --- | --- | --- | --- | ------------- | ------------------------------- | -------------------- | ------------- | --- |
|     |     |     |     | t i o n s ( d | i m e n s io n a lity 3 2 5 × 5 | c o nv o l u t io ns |               |     |
|     |     |     |     |               | (o n r ed uc                    | e d i n p u t )      |               |     |
r e d u c t i o n )
28
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 321×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
192
1281×1
convolutions
28
|     |     |     |     | 1281×1convolu-       | 1923×3convolu-  |     |        |      |
| --- | --- | --- | --- | -------------------- | --------------- | --- | ------ | ---- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |        |      |
|     |     |     |     | reduction)           | input)          |     | Filter | 64/1 |
concatenation
|     |     |     | Mitesh3 | 2 M 1 × .       | 1 K c o nh v oa lu p- r a C5   | cS n7v 0l t1 5ns(DeepLearning): | Lecture11 |     |
| --- | --- | --- | ------- | --------------- | ------------------------------ | ------------------------------- | --------- | --- |
|     |     |     |         | t i o n s ( d   | i m e n s io n a lit y 9 6 5 × | o o u io                        |           |     |
|     |     |     |         | r e d u c t i o | n ) (o n r ed uc               | e d i n p u t )                 |           |     |
28
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 641×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
256
1921×1
convolutions
14
|     |     |     |     | 961×1convolu-        | 2083×3convolu-  |     |        |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | ------ | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |        |     |
|     |     |     |     | reduction)           | input)          |     | Filter |     |
concatenation
|     |     |     |     | 1 6 1 × | 1 c o n v o lu - 4 8 5 × 5 | c o nv o l u t io ns |     |     |
| --- | --- | --- | --- | ------- | -------------------------- | -------------------- | --- | --- |
t i o n s ( d i m e n s io n a lity
|     |     |     |     | r e d u c t i o | n ) (o n r ed uc | e d i n p u t ) |     |     |
| --- | --- | --- | --- | --------------- | ---------------- | --------------- | --- | --- |
14
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 641×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
480
1601×1
convolutions
14
|     |     |     |     | 1121×1convolu-       | 2243×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
concatenation
|     |     |     |     | 2 4 1 ×       | 1 c o n v o lu - 6 4 5 × 5         | c o nv o l u t io ns |     |     |
| --- | --- | --- | --- | ------------- | ---------------------------------- | -------------------- | --- | --- |
|     |     |     |     | t i o n s ( d | i m e n s io n a lity (o n r ed uc | e d i n p u t )      |     |     |
r e d u c t i o n )
14
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 641×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
512
1281×1
convolutions
14
|     |     |     |     | 1281×1convolu-       | 2563×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
|     |     |     |     | 2 4 1 ×       | 1 c o n v o lu -                   |                      | concatenation |     |
| --- | --- | --- | --- | ------------- | ---------------------------------- | -------------------- | ------------- | --- |
|     |     |     |     |               | 6 4 5 × 5                          | c o nv o l u t io ns |               |     |
|     |     |     |     | t i o n s ( d | i m e n s io n a lity (o n r ed uc | e d i n p u t )      |               |     |
r e d u c t i o n )
14
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 641×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
512
1121×1
convolutions
14
|     |     |     |     | 1441×1convolu-       | 2883×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
|     |     |     |     | 3 2 1 ×         | 1 c o n v o lu -                |                      | concatenation |     |
| --- | --- | --- | --- | --------------- | ------------------------------- | -------------------- | ------------- | --- |
|     |     |     |     | t i o n s ( d   | i m e n s io n a lity 6 4 5 × 5 | c o nv o l u t io ns |               |     |
|     |     |     |     | r e d u c t i o | n ) (o n r ed uc                | e d i n p u t )      |               |     |
14
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 641×1convolutions |     |     |     |
| --- | --- | --- | --- | ------------------ | ----------------- | --- | --- | --- |
duction)
512
2561×1
convolutions
14
|     |     |     |     | 1601×1convolu-       | 3203×3convolu-  |     |        |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | ------ | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |        |     |
|     |     |     |     | reduction)           | input)          |     | Filter |     |
concatenation
|     |     |     |     | 321×1convolu-        | 1285×5convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
14
|     |     |     |     | 3×3Maxpooling      | 1281×1       |     |     |     |
| --- | --- | --- | --- | ------------------ | ------------ | --- | --- | --- |
|     |     |     |     | (dimensionalityre- | convolutions |     |     |     |
duction)
528
2561×1
convolutions
7
|     |     |     |     | 1601×1convolu-       | 3203×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
concatenation
|     |     |     |     | 321×1convolu-        | 1285×5convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
7
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 1281×1 |     |     |     |
| --- | --- | --- | --- | ------------------ | ------ | --- | --- | --- |
convolutions
duction)
832
3841×1
convolutions
7
|     |     |     |     | 1921×1convolu-       | 3843×3convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
Filter
concatenation
|     |     |     |     | 481×1convolu-        | 1285×5convolu-  |     |     |     |
| --- | --- | --- | --- | -------------------- | --------------- | --- | --- | --- |
|     |     |     |     | tions(dimensionality | tions(onreduced |     |     |     |
|     |     |     |     | reduction)           | input)          |     |     |     |
7
3×3Maxpooling
|     |     |     |     | (dimensionalityre- | 1281×1       |     |     |     |
| --- | --- | --- | --- | ------------------ | ------------ | --- | --- | --- |
|     |     |     |     | duction)           | convolutions |     |     |     |
832

|     |     | Important | Trick: | Got rid of | the |
| --- | --- | --------- | ------ | ---------- | --- |
1000
|     |     | fully connected | layer |     |     |
| --- | --- | --------------- | ----- | --- | --- |
∈R1024×1000
W
|     |     | Notice that | output of | the last layer | is  |
| --- | --- | ----------- | --------- | -------------- | --- |
1024 7×7×1024
|                |     | 7×7×1024                       | dimensional        |            |      |
| -------------- | --- | ------------------------------ | ------------------ | ---------- | ---- |
| flflaatttteenn |     | Whatifweweretoaddafullyconnec- |                    |            |      |
|                |     | ted layer                      | with 1000          | nodes (for | 1000 |
| 7              |     | classes)                       | on top of this     |            |      |
| pickaverage    |     | We would                       | have 7×7×1024×1000 |            | =    |
1024
|     |     | 49M parameters |     |     |     |
| --- | --- | -------------- | --- | --- | --- |
1024
Insteadtheyuseanaveragepoolingof
| 7   |     | size 7×7 | on each of | the 1024 feature |     |
| --- | --- | -------- | ---------- | ---------------- | --- |
maps
|     |     | This results | in a 1024 | dimensional |     |
| --- | --- | ------------ | --------- | ----------- | --- |
output
|     |     | Significantly | reduces | the number | of  |
| --- | --- | ------------- | ------- | ---------- | --- |
parameters
65/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture11    |              |     |
| --- | -------------- | --------------------- | ------------ | ------------ | --- |
|     |                | 12× less              | parameters   | than AlexNet |     |
|     |                | 2× more               | computations |              |     |

GoogLeNet
ResNet
66/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |
| -------------- | --------------------- | --------- |

|     | Suppose     | we have been   | able to train | a   |
| --- | ----------- | -------------- | ------------- | --- |
|     | shallow     | neural network | well          |     |
|     | Now suppose | we construct   | a deeper      |     |
networkwhichhasfewmorelayers(in
orange)
|     | Intuitively, | if the   | shallow network |     |
| --- | ------------ | -------- | --------------- | --- |
|     | works well   | then the | deep network    |     |
shouldalsoworkwellbysimplylearn-
|     | ing to compute | identity       | functions        | in   |
| --- | -------------- | -------------- | ---------------- | ---- |
|     | the new        | layers         |                  |      |
|     | Essentially,   | the solution   | space            | of a |
|     | shallow        | neural network | is a subset      | of   |
|     | the solution   | space          | of a deep neural |      |
network
67/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Butinpracticeitisobservedthatthis
|     | doesn’t happen |          |               |
| --- | -------------- | -------- | ------------- |
|     | Notice that    | the deep | layers have a |
|     | higher error   | rate on  | the test set  |
68/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

x
|     | Consider | any two stacked | layers | in a |
| --- | -------- | --------------- | ------ | ---- |
CNN
|     | The two | layers are essentially |     |     |
| --- | ------- | ---------------------- | --- | --- |
relu
|     | learning | some function | of the input  |     |
| --- | -------- | ------------- | ------------- | --- |
|     | What if  | we enable it  | to learn only | a   |
relu
|     | residual | function of | the input? |     |
| --- | -------- | ----------- | ---------- | --- |
H(x)
x
relu Identity
F(x) relu
H(x)=F(x)+x
69/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

x
|     | Why would | this help?   |                 |
| --- | --------- | ------------ | --------------- |
|     | Remember  | our argument | that a          |
|     | deeper    | version of a | shallow network |
relu
woulddojustfinebylearningidentity
|     | transformations | in the | new layers |
| --- | --------------- | ------ | ---------- |
relu
|     | This identity | connection | from the in- |
| --- | ------------- | ---------- | ------------ |
H(x)
|     | put allows   | a ResNet | to retain a copy |
| --- | ------------ | -------- | ---------------- |
| x   | of the input |          |                  |
Usingthisideatheywereabletotrain
|     | really deep | networks |     |
| --- | ----------- | -------- | --- |
relu Identity
F(x) relu
H(x)=F(x)+x
70/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |

|     | 1st place      | in all five main | tracks        |            |
| --- | -------------- | ---------------- | ------------- | ---------- |
|     | ImageNet       | Classification:  |               | “Ultra-    |
|     | deep”          | 152-layer nets   |               |            |
|     | ImageNet       | Detection:       |               | 16% better |
|     | than           | the 2nd best     | system        |            |
|     | ImageNet       | Localization:    |               | 27% bet-   |
|     | ter            | than the 2nd     | best system   |            |
|     | COCODetection: |                  | 11%betterthan |            |
|     | the            | 2nd best system  |               |            |
|     | COCO           | Segmentation:    |               | 12% better |
|     | than           | the 2nd best     | system        |            |
ResNet, 152 layers
71/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Bag of tricks
|     | Batch Normalizaton  | after                   | every  |
| --- | ------------------- | ----------------------- | ------ |
|     | CONV layer          |                         |        |
|     | Xavier/2            | initialization from [He | et al] |
|     | SGD + Momentum(0.9) |                         |        |
Learningrate:0.1,dividedby10when
|     | validation   | error plateaus |     |
| --- | ------------ | -------------- | --- |
|     | Mini-batch   | size 256       |     |
|     | Weight decay | of 1e-5        |     |
|     | No dropout   | used           |     |
ResNet, 152 layers
72/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture11 |     |
| -------------- | --------------------- | --------- | --- |
