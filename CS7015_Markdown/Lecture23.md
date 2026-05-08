| CS7015     | (Deep Learning) |           | : Lecture | 23  |
| ---------- | --------------- | --------- | --------- | --- |
| Generative | Adversarial     | Networks  | (GANs)    |     |
|            | Mitesh          | M. Khapra |           |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/38
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture23 |
| --- | -------------- | --------------------- | --- | --------- |

| Module | 23.1: Generative |     | Adversarial | Networks | - The |
| ------ | ---------------- | --- | ----------- | -------- | ----- |
intuition
2/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     |     |     | So far | we have looked |     | at generative |     |
| --- | --- | --- | --- | --- | ------ | -------------- | --- | ------------- | --- |
Xˆ
|     |     |     |     |     | models | which explicitly |     | model | the |
| --- | --- | --- | --- | --- | ------ | ---------------- | --- | ----- | --- |
Pφ(X|z)
|     |     |     |     |     | joint | probability | distribution |     | or  |
| --- | --- | --- | --- | --- | ----- | ----------- | ------------ | --- | --- |
z
|     |     |     |     |     | conditional | probability |     | distribution |     |
| --- | --- | --- | --- | --- | ----------- | ----------- | --- | ------------ | --- |
+
H∈{0,1}n
| c1 c2        | cn         |     |     | ∗        |                              |           |      |            |        |
| ------------ | ---------- | --- | --- | -------- | ---------------------------- | --------- | ---- | ---------- | ------ |
|              |            |     |     | (cid:15) | For example,                 | in        | RBMs | we         | learn  |
| h1 h2        | ··· hn     |     |     |          |                              |           |      |            |        |
|              |            |     |     |          | P(X,H),                      | in VAEs   | we   | learn      | P(z|X) |
| w1,1         | wm,nW∈Rm×n | µ   |     |          |                              |           |      |            |        |
|              |            |     |     | Σ        | andP(X|z)whereasinARmodelswe |           |      |            |        |
| v1 v2        | ··· vm     |     |     | Qθ(z|X)  | learn P(X)                   |           |      |            |        |
| b1 b         | bm         |     |     |          |                              |           |      |            |        |
| V∈{ 0 2 ,1}m |            |     |     | X        | What                         | if we are | only | interested | in     |
p(x4|x1,x2,x3)
|     |       | p(x3|x1,x2) |     |     | sampling     | from the | distribution |     | and      |
| --- | ----- | ----------- | --- | --- | ------------ | -------- | ------------ | --- | -------- |
|     | p(x1) | p(x2|x1)    |     |     |              |          |              |     |          |
|     |       |             |     |     | don’t really | care     | about        | the | explicit |
|     |       |             |     |     | density      | function | P(X)?        |     |          |
V
|     | h1 h2 | h3  | h4  |     |           |            |     |        |     |
| --- | ----- | --- | --- | --- | --------- | ---------- | --- | ------ | --- |
|     |       |     |     |     | What does | this mean? |     | Let us | see |
W
|     | x1  | x2 x3 | x4             |     |                       |           |     |     | 3/38 |
| --- | --- | ----- | -------------- | --- | --------------------- | --------- | --- | --- | ---- |
|     |     |       | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture23 |     |     |      |

As usual we are given some training data (say, MNIST images) which obviously
| comes from | some underlying | distribution |     |     |
| ---------- | --------------- | ------------ | --- | --- |
Our goal is to generate more images from this distribution (i.e., create images
| which look | similar | to the images from | the training | data) |
| ---------- | ------- | ------------------ | ------------ | ----- |
Inotherwords,wewanttosamplefromacomplexhighdimensionaldistribution
which is intractable (recall RBMs, VAEs and AR models deal with this
| intractability | in their | own way) |     |     |
| -------------- | -------- | -------- | --- | --- |
4/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Complex | Transformation |     |     |
| --- | ------- | -------------- | --- | --- |
Sample Generated
z ∼N(0,I)
GANs take a different approach to this problem where the idea is to sample
fromasimpletractabledistribution(say, z ∼ N(0,I))andthenlearnacomplex
| transformation | from this | to the training | distribution |     |
| -------------- | --------- | --------------- | ------------ | --- |
In other words, we will take a z ∼ N(0,I), learn to make a series of complex
transformations on it so that the output looks as if it came from our training
distribution
5/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture23 |
| --- | -------------- | --- | --------------------- | --------- |

|     |     | What            | can we            | use for such   | a complex |         |
| --- | --- | --------------- | ----------------- | -------------- | --------- | ------- |
|     |     | transformation? | A                 | Neural Network |           |         |
|     |     | How             | do you train such | a neural       | network?  | Using a |
Real or Fake
|     |     | two | player game |     |     |     |
| --- | --- | --- | ----------- | --- | --- | --- |
Discriminator
|     |     | There | are two players      | in the game: | a generator   |        |
| --- | --- | ----- | -------------------- | ------------ | ------------- | ------ |
|     |     | and   | a discriminator      |              |               |        |
|     |     | The   | job of the generator | is to        | produce       | images |
|     |     | which | look so natural      | that the     | discriminator |        |
Real Images
Generator
|     |     | thinks | that the images | came from | the real | data |
| --- | --- | ------ | --------------- | --------- | -------- | ---- |
distribution
|           |     | The       | job of the discriminator | is      | to get better | and |
| --------- | --- | --------- | ------------------------ | ------- | ------------- | --- |
| z ∼N(0,I) |     | better    | at distinguishing        | between | true images   | and |
|           |     | generated | (fake) images            |         |               |     |
6/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture23 |     |     |
| --- | -------------- | --- | --------------------- | --------- | --- | --- |

|     | So let’s      | look | at the | full picture |                |     |        |
| --- | ------------- | ---- | ------ | ------------ | -------------- | --- | ------ |
|     | Let           | G φ  | be the | generator    | and            | D θ | be the |
|     | discriminator |      | (φ and | θ are        | the parameters |     | of G   |
Real or Fake
|     | and | D, respectively) |     |     |     |     |     |
| --- | --- | ---------------- | --- | --- | --- | --- | --- |
Discriminator
|     | We       | have | a neural network |         | based | generator     | which |
| --- | -------- | ---- | ---------------- | ------- | ----- | ------------- | ----- |
|     | takes    | as   | input a noise    | vector  | z     | ∼ N(0,I)      | and   |
|     | produces |      | G φ (z) = X      |         |       |               |       |
|     | We       | have | a neural         | network | based | discriminator |       |
Real Images
Generator
|     | which | could | take as      | input | a real X | or a         | generated |
| --- | ----- | ----- | ------------ | ----- | -------- | ------------ | --------- |
|     | X =   | G (z) | and classify | the   | input    | as real/fake |           |
φ
z ∼N(0,I)
7/38
| MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture23 |     |     |
| -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | What    | should   | be  | the           | objective | function |     | of the |
| --- | --- | ------- | -------- | --- | ------------- | --------- | -------- | --- | ------ |
|     |     | overall | network? |     |               |           |          |     |        |
|     |     | Let’s   | look     | at  | the objective |           | function |     | of the |
Real or Fake
|     |     | generator | first |     |     |     |     |     |     |
| --- | --- | --------- | ----- | --- | --- | --- | --- | --- | --- |
Discriminator
|     |     | Given                               | an    | image   | generated |     | by the    | generator | as      |
| --- | --- | ----------------------------------- | ----- | ------- | --------- | --- | --------- | --------- | ------- |
|     |     | G (z)thediscriminatorassignsascoreD |       |         |           |     |           | (G        | (z))    |
|     |     | φ                                   |       |         |           |     |           | θ         | φ       |
|     |     | to it                               |       |         |           |     |           |           |         |
|     |     | This                                | score | will be | between   | 0   | and 1 and | will      | tell us |
Real Images
Generator
|           |     | the      | probability | of   | the image |           | being real | or          | fake |
| --------- | --- | -------- | ----------- | ---- | --------- | --------- | ---------- | ----------- | ---- |
|           |     | For      | a given     | z,   | the       | generator |            | would       | want |
|           |     | to       | maximize    | logD | (G        | (z))      | (log       | likelihood) | or   |
|           |     |          |             |      | θ         | φ         |            |             |      |
| z ∼N(0,I) |     | minimize | log(1−D     |      | (G        | (z)))     |            |             |      |
|           |     |          |             |      | θ         | φ         |            |             |      |
8/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture23 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

This is just for a single z and the generator would
like to do this for all possible values of z,
Real or Fake For example, if z was discrete and drawn from a
uniform distribution (i.e., p(z) = 1 ∀z) then the
N
Discriminator generator’s objective function would be
N
(cid:88) 1
min log(1−D (G (z)))
θ φ
φ N
i=1
Generator Real Images
However, in our case, z is continuous and not
uniform (z ∼ N(0,I)) so the equivalent objective
function would be
z ∼N(0,I) ˆ
min p(z)log(1−D (G (z)))
θ φ
φ
minE [log(1−D (G (z)))]
θ φ
φ z∼p(z)
9/38
MiteshM.Khapra CS7015(DeepLearning): Lecture23

|     |     | Now | let’s | look at the          | discriminator |              |        |
| --- | --- | --- | ----- | -------------------- | ------------- | ------------ | ------ |
|     |     | The | task  | of the discriminator |               | is to assign | a high |
scoretorealimagesandalowscoretofakeimages
Real or Fake
|     |     | And | it should | do this | for all | possible | real images |
| --- | --- | --- | --------- | ------- | ------- | -------- | ----------- |
Discriminator
|     |     | and       | all possible | fake images        |     |                 |     |
| --- | --- | --------- | ------------ | ------------------ | --- | --------------- | --- |
|     |     | In        | other        | words, it should   |     | try to maximize | the |
|     |     | following |              | objective function |     |                 |     |
Real Images
| Generator |     | maxE |         | [logD (x)]+E |        | [log(1−D | (G (z)))] |
| --------- | --- | ---- | ------- | ------------ | ------ | -------- | --------- |
|           |     |      | x∼pdata | θ            | z∼p(z) |          | θ φ       |
θ
z ∼N(0,I)
10/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|              |     | If we         | put | the objectives | of     | the       | generator | and |
| ------------ | --- | ------------- | --- | -------------- | ------ | --------- | --------- | --- |
|              |     | discriminator |     | together       | we get | a minimax | game      |     |
| Real or Fake |     |               |     | [E             |        |           |           |     |
|              |     | min           | max |                | logD   | (x)       |           |     |
|              |     |               |     | x∼p data       |        | θ         |           |     |
|              |     |               | φ θ |                |        |           |           |     |
Discriminator
+E
|     |     |            |            |                      | z∼p(z) log(1−D |         | θ (G φ | (z)))] |
| --- | --- | ---------- | ---------- | -------------------- | -------------- | ------- | ------ | ------ |
|     |     | The        | first term | in the               | objective      | is only | w.r.t. | the    |
|     |     | parameters |            | of the discriminator |                | (θ)     |        |        |
Real Images
| Generator |     | The           | second        | term in          | the objective |          | is w.r.t.   | the    |
| --------- | --- | ------------- | ------------- | ---------------- | ------------- | -------- | ----------- | ------ |
|           |     | parameters    |               | of the generator |               | (φ)      | as well     | as the |
|           |     | discriminator |               | (θ)              |               |          |             |        |
| z ∼N(0,I) |     | The           | discriminator | wants            | to            | maximize | the         | second |
|           |     | term          | whereas       | the generator    |               | wants    | to minimize | it     |
|           |     | (hence        | it is         | a two-player     | game)         |          |             |        |
11/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     | So      | the overall | training | proceeds | by               | alternating |
| --- | --- | --- | ------- | ----------- | -------- | -------- | ---------------- | ----------- |
|     |     |     | between | these       | two      | step     |                  |             |
|     |     |     | Step    | 1: Gradient |          | Ascent   | on Discriminator |             |
Real or Fake
| Discriminator |     |     | max  | [E          | logD | (x)+E   | log(1−D      | (G (z)))] |
| ------------- | --- | --- | ---- | ----------- | ---- | ------- | ------------ | --------- |
|               |     |     |      | x∼p         |      | θ       | z∼p(z)       | θ φ       |
|               |     |     | θ    |             | data |         |              |           |
|               |     |     | Step | 2: Gradient |      | Descent | on Generator |           |
E
|           | Real Images |     |     | min |        | log(1−D | θ (G φ (z))) |     |
| --------- | ----------- | --- | --- | --- | ------ | ------- | ------------ | --- |
| Generator |             |     |     |     | z∼p(z) |         |              |     |
φ
Inpractice,theabovegeneratorobjectivedoesnot
|     |     |     | work | well and | we  | use a slightly | modified | objective |
| --- | --- | --- | ---- | -------- | --- | -------------- | -------- | --------- |
z ∼N(0,I)
|     |     |     | Let | us see | why |     |     |     |
| --- | --- | --- | --- | ------ | --- | --- | --- | --- |
12/38
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture23 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- |

|     |     | When    | the sample |     | is likely | fake,     | we     | want |
| --- | --- | ------- | ---------- | --- | --------- | --------- | ------ | ---- |
|     |     | to give | a feedback |     | to the    | generator | (using |      |
gradients)
4
log(1−D(g(x)))
However,inthisregionwhereD(G(z))isclose
−log(D(g(x)))
| 2   |     | to 0, the | curve    | of the | loss | function | is very | flat |
| --- | --- | --------- | -------- | ------ | ---- | -------- | ------- | ---- |
|     |     | and the   | gradient | would  | be   | close    | to 0    |      |
ssoL
| 0             |       | Trick:            | Instead | of minimizing |          | the      | likelihood | of  |
| ------------- | ----- | ----------------- | ------- | ------------- | -------- | -------- | ---------- | --- |
|               |       | the discriminator |         | being         | correct, | maximize |            | the |
| −2            |       | likelihood        | of the  | discriminator |          | being    | wrong      |     |
|               |       | In effect,        | the     | objective     | remains  | the      | same       | but |
| −4            |       | the gradient      | signal  |               | becomes  | better   |            |     |
| 0 0.2 0.4 0.6 | 0.8 1 |                   |         |               |          |          |            |     |
D(G(z))
13/38
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture23 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

With that we are now ready to see the full algorithm for training GANs
procedureGAN Training
1:
fornumberoftrainingiterationsdo
2:
forkstepsdo
3:
•Sampleminibatchofmnoisesamples{z(1),..,z(m)}fromnoisepriorp (z)
4: g
•Sampleminibatchofmexamples{x(1),..,x(m)}fromdatageneratingdistributionp (x)
5: data
6: •Updatethediscriminatorbyascendingitsstochasticgradient:
| 1 (cid:88) m (cid:104) | (cid:16) (cid:17) (cid:16) | (cid:16) (cid:16) (cid:17)(cid:17)(cid:17)(cid:105) |
| ---------------------- | -------------------------- | --------------------------------------------------- |
| ∇ logD                 | x(i) +log 1−D              | G z(i)                                              |
| θm                     | θ                          | θ φ                                                 |
i=1
endfor
7:
•Sampleminibatchofmnoisesamples{z(1),..,z(m)}fromnoisepriorp (z)
8: g
•Updatethegeneratorbyascendingitsstochasticgradient
9:
|     | 1 (cid:88) m (cid:104) (cid:16) (cid:16) | (cid:16) (cid:17)(cid:17)(cid:17)(cid:105) |
| --- | ---------------------------------------- | ------------------------------------------ |
| ∇   | log D G                                  | z(i)                                       |
| φm  | θ φ                                      |                                            |
i=1
10: endfor
11: endprocedure
14/38
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| -------------- | --------------------- | --------- |

| Module | 23.2: Generative |     | Adversarial | Networks | -   |
| ------ | ---------------- | --- | ----------- | -------- | --- |
Architecture
15/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

We will now look at one of the popular neural networks used for the generator
| and discriminator | (Deep | Convolutional | GANs) |     |
| ----------------- | ----- | ------------- | ----- | --- |
For discriminator, any CNN based classifier with 1 class (real) at the output
| can be used | (e.g. VGG, | ResNet, etc.) |     |     |
| ----------- | ---------- | ------------- | --- | --- |
Figure: Generator (Redford et al 2015) (left) and discriminator (Yeh et al 2016) (right)
used in DCGAN
16/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

| Architecture | guidelines |     | for stable | Deep | Convolutional | GANs |     |
| ------------ | ---------- | --- | ---------- | ---- | ------------- | ---- | --- |
Replace any pooling layers with strided convolutions (discriminator) and
| fractional-strided |     | convolutions |     | (generator). |         |                |     |
| ------------------ | --- | ------------ | --- | ------------ | ------- | -------------- | --- |
| Use batchnorm      |     | in both      | the | generator    | and the | discriminator. |     |
Remove fully connected hidden layers for deeper architectures.
Use ReLU activation in generator for all layers except for the output, which
| uses          | tanh. |            |     |                      |     |         |        |
| ------------- | ----- | ---------- | --- | -------------------- | --- | ------- | ------ |
| Use LeakyReLU |       | activation |     | in the discriminator |     | for all | layers |
17/38
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- |

| Module | 23.3: Generative |     | Adversarial | Networks | - The |
| ------ | ---------------- | --- | ----------- | -------- | ----- |
| Math   | Behind it        |     |             |          |       |
18/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

We will now delve a bit deeper into the objective function used by GANs and
| see what | it implies |     |     |     |
| -------- | ---------- | --- | --- | --- |
Suppose we denote the true data distribution by p (x) and the distribution
data
| of the data | generated | by the model | as p (x) |     |
| ----------- | --------- | ------------ | -------- | --- |
G
| What do | we wish should | happen | at the end | of training? |
| ------- | -------------- | ------ | ---------- | ------------ |
|         |                | p      | (x) = p    | (x)          |
G data
Can we prove this formally even though the model is not explicitly computing
this density?
| We will | try to prove | this over the | next few | slides |
| ------- | ------------ | ------------- | -------- | ------ |
19/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

Theorem
The global minimum of the virtual training criterion C(G) = max V(G,D) is
D
| achieved | if and only | if p | = p           |     |     |
| -------- | ----------- | ---- | ------------- | --- | --- |
|          |             |      | G data        |     |     |
|          |             |      | is equivalent | to  |     |
Theorem
1 If p = p then the global minimum of the virtual training criterion
G data
| C(G) | = max | V(G,D) | is achieved and |     |     |
| ---- | ----- | ------ | --------------- | --- | --- |
D
2 The global minimum of the virtual training criterion C(G) = max V(G,D) is
D
| achieved | only | if p = | p   |     |     |
| -------- | ---- | ------ | --- | --- | --- |
G data
20/38
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | --- | -------------- | --------------------- | --------- |

| Outline of | the Proof |     |     |     |
| ---------- | --------- | --- | --- | --- |
The ‘if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | if p = p |     |
| ---------- | ------ | ----------- | -------- | --- |
G data
D
(a) Find the value of V(D,G) when the generator is optimal i.e., when p = p
G data
(b) Find the value of V(D,G) for other values of the generator i.e., for any p
G
| such | that p (cid:54)= p |     |     |     |
| ---- | ------------------ | --- | --- | --- |
G data
(c) Show that a < b ∀ p (cid:54)= p (and hence the minimum V(D,G) is achieved
G data
| when | p = p ) |     |     |     |
| ---- | ------- | --- | --- | --- |
G data
The ‘only if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | only if p = p |     |
| ---------- | ------ | ----------- | ------------- | --- |
|            |        |             | G data        |     |
D
| Show | that when | V(D,G) is | minimum then p | = p |
| ---- | --------- | --------- | -------------- | --- |
G data
21/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

| First   | let us look | at  | the objective   | function | again    |             |     |           |
| ------- | ----------- | --- | --------------- | -------- | -------- | ----------- | --- | --------- |
|         | min         | max | [E              | logD     | (x)+E    | log(1−D     |     | (G (z)))] |
|         |             |     | x∼p             |          | θ z∼p(z) |             |     | θ φ       |
|         | φ           | θ   | data            |          |          |             |     |           |
| We will | expand      | it  | to its integral | form     |          |             |     |           |
|         |             |     | ˆ               |          | ˆ        |             |     |           |
|         | min         | max | p (x)logD       |          | (x)+     | p(z)log(1−D |     | (G (z)))  |
|         |             |     | data            |          | θ        |             |     | θ φ       |
φ θ
|     |     |     | x   |     |     | z   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
Let p (X) denote the distribution of the X’s generated by the generator and
G
since X is a function of z we can replace the second integral as shown below
|     |     |     | ˆ      |         |        | ˆ              |     |        |
| --- | --- | --- | ------ | ------- | ------ | -------------- | --- | ------ |
|     | min | max | p data | (x)logD | θ (x)+ | p G (x)log(1−D |     | θ (x)) |
|     |     | φ θ | x      |         |        | x              |     |        |
The above replacement follows from the law of the unconscious statistician
| (click | to link | of wikipedia | page) |     |     |     |     |     |
| ------ | ------- | ------------ | ----- | --- | --- | --- | --- | --- |
22/38
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

Okay,soourrevisedobjectiveisgivenby
ˆ
|     | min max | (p data (x)logD | θ (x)+p | G (x)log(1−D | θ (x)))dx |     |
| --- | ------- | --------------- | ------- | ------------ | --------- | --- |
|     | φ θ     | x               |         |              |           |     |
GivenageneratorG,weareinterestedinfindingtheoptimumdiscriminatorDwhich
willmaximizetheaboveobjectivefunction
Theaboveobjectivewillbemaximizedwhenthequantityinsidetheintegralis
maximized∀x
Tofindtheoptimawewilltakethederivativeoftheterminsidetheintegralw.r.t. D
andsetittozero
d
|     | (p (x)logD | (x)+p | (x)log(1−D | (x)))=0 |     |     |
| --- | ---------- | ----- | ---------- | ------- | --- | --- |
| d(D | (x)) data  | θ     | G          | θ       |     |     |
θ
|     |      | 1       |         | 1                  |          |        |
| --- | ---- | ------- | ------- | ------------------ | -------- | ------ |
|     | p    | (x)     | +p (x)  | (−1)=0             |          |        |
|     | data |         | G       |                    |          |        |
|     |      | D θ (x) |         | 1−D θ (x)          |          |        |
|     |      |         |         | p (x)              | p G      | (x)    |
|     |      |         |         | data               | =        |        |
|     |      |         |         | D (x)              | 1−D      | (x)    |
|     |      |         |         | θ                  |          | θ      |
|     |      |         | (p data | (x))(1−D θ (x))=(p | G (x))(D | θ (x)) |
p (x)
|     |     |     |     | D (x)= |     | data |
| --- | --- | --- | --- | ------ | --- | ---- |
θ
|     |     |     |     |     | p G (x)+p | data (x) |
| --- | --- | --- | --- | --- | --------- | -------- |
23/38
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |
| --- | --- | -------------- | --- | --------------------- | --- | --------- |

| This means | for any | given generator |     |     |     |
| ---------- | ------- | --------------- | --- | --- | --- |
p (x)
|     |     | D∗(G(x)) | data |     |     |
| --- | --- | -------- | ---- | --- | --- |
=
|         |            | G           | p (x)+p      | (x)     |     |
| ------- | ---------- | ----------- | ------------ | ------- | --- |
|         |            |             | data         | G       |     |
| Now the | if part of | the theorem | says “if p = | p ....” |     |
|         |            |             | G            | data    |     |
So let us substitute p = p into D∗(G(x)) and see what happens to the
|     |     | G data | G   |     |     |
| --- | --- | ------ | --- | --- | --- |
loss functions
|     |         | p       | 1            |                  |     |
| --- | ------- | ------- | ------------ | ---------------- | --- |
|     |         | D∗ data |              |                  |     |
|     |         | =       | =            |                  |     |
|     |         | G p +p  | 2            |                  |     |
|     |         | ˆdata   | G            |                  |     |
|     | V(G,D∗) | = p     | (x)logD(x)+p | (x)log(1−D(x))dx |     |
|     |         | G data  |              | G                |     |
ˆx
|     |     |          |              | (cid:18) | (cid:19) |
| --- | --- | -------- | ------------ | -------- | -------- |
|     |     |          | 1            |          | 1        |
|     |     | = p      | (x)log +p    | (x)log   | 1− dx    |
|     |     | data     | G            |          |          |
|     |     |          | 2            |          | 2        |
|     |     | x ˆ      |              | ˆ        |          |
|     |     | = log2   | p (x)dx−log2 | p        | (x)dx    |
|     |     |          | G            | data     |          |
|     |     |          | x            | x        |          |
|     |     | = −2log2 | = −log4      |          |          |
24/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture23 |
| --- | --- | -------------- | --------------------- | --- | --------- |

| Outline of | the Proof |     |     |     |
| ---------- | --------- | --- | --- | --- |
The ‘if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | if p = p |     |
| ---------- | ------ | ----------- | -------- | --- |
G data
D
(a) Find the value of V(D,G) when the generator is optimal i.e., when p = p
G data
(b) Find the value of V(D,G) for other values of the generator i.e., for any p
G
| such | that p (cid:54)= p |     |     |     |
| ---- | ------------------ | --- | --- | --- |
G data
(c) Show that a < b ∀ p (cid:54)= p (and hence the minimum V(D,G) is achieved
G data
| when | p = p ) |     |     |     |
| ---- | ------- | --- | --- | --- |
G data
The ‘only if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | only if p = p |     |
| ---------- | ------ | ----------- | ------------- | --- |
|            |        |             | G data        |     |
D
| Show | that when | V(D,G) is | minimum then p | = p |
| ---- | --------- | --------- | -------------- | --- |
G data
25/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

So what we have proved so far is that if the generator is optimal (p = p )
G data
| the discriminator’s | loss value  | is −log4 |            |     |
| ------------------- | ----------- | -------- | ---------- | --- |
| We still haven’t    | proved that | this is  | the minima |     |
For example, it is possible that for some p G (cid:54)= p data , the discriminator’s loss
| value is lower | than −log4 |     |     |     |
| -------------- | ---------- | --- | --- | --- |
To show that the discriminator achieves its lowest value “if p G = p data ”, we
need to show that for all other values of p the discriminator’s loss value is
G
| greater than | −log4 |     |     |     |
| ------------ | ----- | --- | --- | --- |
26/38
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture23 |
| --- | -------------- | --- | --------------------- | --------- |

To show this we will get rid of the assumption that p = p
G data
ˆ
(cid:20) (cid:18) p (x) (cid:19) (cid:18) p (x) (cid:19)(cid:21)
C(G)= p (x)log data +p (x)log 1− data dx
data p (x)+p (x) G p (x)+p (x)
ˆx G data G data
(cid:20) (cid:18) p (x) (cid:19) (cid:18) p (x) (cid:19) (cid:21)
= p (x)log data +p (x)log G +(log2−log2)(p +p ) dx
data p (x)+p (x) G p (x)+p (x) data G
x ˆ G data G data
=−log2 (p (x)+p (x))dx
G data
ˆ x
(cid:20) (cid:18) (cid:18) p (x) (cid:19)(cid:19) (cid:18) (cid:18) p (x) (cid:19)(cid:19)(cid:21)
+ p (x) log2+log data +p (x) log2+log G dx
data p (x)+p (x) G Pp (x)+p (x)
x G data G data
=−log2(1+1)
ˆ (cid:34) (cid:32) (cid:33) (cid:32) (cid:33)(cid:35)
p (x) p (x)
+ p (x)log data +p (x)log G dx
x
data pG(x)+pdata(x) G pG(x)+pdata(x)
2 2
(cid:18) p (x)+p (x)(cid:19) (cid:18) p (x)+p (x)(cid:19)
=−log4+KL p (cid:107) G data +KL p (cid:107) G data
data 2 G 2
27/38
MiteshM.Khapra CS7015(DeepLearning): Lecture23

| Outline of | the Proof |     |     |     |
| ---------- | --------- | --- | --- | --- |
The ‘if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | if p = p |     |
| ---------- | ------ | ----------- | -------- | --- |
G data
D
(a) Find the value of V(D,G) when the generator is optimal i.e., when p = p
G data
(b) Find the value of V(D,G) for other values of the generator i.e., for any p
G
| such | that p (cid:54)= p |     |     |     |
| ---- | ------------------ | --- | --- | --- |
G data
(c) Show that a < b ∀ p (cid:54)= p (and hence the minimum V(D,G) is achieved
G data
| when | p = p ) |     |     |     |
| ---- | ------- | --- | --- | --- |
G data
The ‘only if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | only if p = p |     |
| ---------- | ------ | ----------- | ------------- | --- |
|            |        |             | G data        |     |
D
| Show | that when | V(D,G) is | minimum then p | = p |
| ---- | --------- | --------- | -------------- | --- |
G data
28/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

| Okay, so | we have    |            |           |        |          |           |          |
| -------- | ---------- | ---------- | --------- | ------ | -------- | --------- | -------- |
|          |            |            | (cid:18)  |        | (cid:19) | (cid:18)  | (cid:19) |
|          |            |            |           | p data | +p g     | p data +p | G        |
| C(G)     | = −log4+KL |            | p         | ||     | +KL      | p ||      |          |
|          |            |            | data      |        |          | G         |          |
|          |            |            |           |        | 2        | 2         |          |
| We know  | that KL    | divergence | is always | ≥      | 0        |           |          |
∴
|       |             |          | C(G)  | ≥       | −log4    |     |     |
| ----- | ----------- | -------- | ----- | ------- | -------- | --- | --- |
| Hence | the minimum | possible | value | of C(G) | is −log4 |     |     |
But this is the value that C(G) achieves when p = p (and this is exactly
|          |              |        |         |        | G       | data |     |
| -------- | ------------ | ------ | ------- | ------ | ------- | ---- | --- |
| what we  | wanted to    | prove) |         |        |         |      |     |
| We have, | thus, proved | the    | if part | of the | theorem |      |     |
29/38
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture23 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

| Outline of | the Proof |     |     |     |
| ---------- | --------- | --- | --- | --- |
The ‘if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | if p = p |     |
| ---------- | ------ | ----------- | -------- | --- |
G data
D
(a) Find the value of V(D,G) when the generator is optimal i.e., when p = p
G data
(b) Find the value of V(D,G) for other values of the generator i.e., for any p
G
| such | that p (cid:54)= p |     |     |     |
| ---- | ------------------ | --- | --- | --- |
G data
(c) Show that a < b ∀ p (cid:54)= p (and hence the minimum V(D,G) is achieved
G data
| when | p = p ) |     |     |     |
| ---- | ------- | --- | --- | --- |
G data
The ‘only if’ part: The global minimum of the virtual training criterion
| C(G) = max | V(G,D) | is achieved | only if p = p |     |
| ---------- | ------ | ----------- | ------------- | --- |
|            |        |             | G data        |     |
D
| Show | that when | V(D,G) is | minimum then p | = p |
| ---- | --------- | --------- | -------------- | --- |
G data
30/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

| Now let’s | look | at the | other | part of the | theorem |     |     |     |     |
| --------- | ---- | ------ | ----- | ----------- | ------- | --- | --- | --- | --- |
If the global minimum of the virtual training criterion C(G)=max V(G,D) is achieved then
D
p G =p data
| We know | that |               |     |          |           |          |          |             |          |
| ------- | ---- | ------------- | --- | -------- | --------- | -------- | -------- | ----------- | -------- |
|         |      |               |     | (cid:18) |           | (cid:19) | (cid:18) |             | (cid:19) |
|         |      |               |     |          | p data    | +p g     |          | p data      | +p G     |
|         |      | C(G)=−log4+KL |     | p        | (cid:107) |          | +KL      | p (cid:107) |          |
|         |      |               |     |          | data      | 2        |          | G           | 2        |
If the global minima is achieved then C(G)=−log4 which implies that
|           |          |      | (cid:18) |                | (cid:19) | (cid:18) |                | (cid:19) |     |
| --------- | -------- | ---- | -------- | -------------- | -------- | -------- | -------------- | -------- | --- |
|           |          |      |          | p              | +p       |          | p +p           |          |     |
|           |          |      | KL p     | (cid:107) data | g +KL    | p        | (cid:107) data | G =0     |     |
|           |          |      |          | data 2         |          | G        | 2              |          |     |
| This will | happen   | only | when     | p =p           | (you can | prove    | this easily)   |          |     |
|           |          |      |          | G data         |          |          |                |          |     |
|           | (cid:16) |      | (cid:17) | (cid:0)        | (cid:1)  |          |                |          |     |
In fact KL p (cid:107)pdata+pg +KL p (cid:107)pdata+pG is the Jenson-Shannon divergence between
|     |     | data | 2   | G   | 2   |     |     |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
p G and p
data
|       |            | (cid:18) |           | (cid:19) | (cid:18) |           | (cid:19) |        |              |
| ----- | ---------- | -------- | --------- | -------- | -------- | --------- | -------- | ------ | ------------ |
|       |            |          | p data    | +p g     |          | p data +p | G        |        |              |
|       |            | KL p     | (cid:107) |          | +KL p    | (cid:107) |          | =JSD(p | (cid:107)p ) |
|       |            |          | data      | 2        | G        | 2         |          |        | data G       |
| which | is minimum | only     | when      | p =p     |          |           |          |        |              |
|       |            |          |           | G data   |          |           |          |        |              |
31/38
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture23 |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- |

| Module     | 23.4: Generative |     | Adversarial | Networks | - Some |
| ---------- | ---------------- | --- | ----------- | -------- | ------ |
| Cool Stuff | and Applications |     |             |          |        |
32/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

In each row the first image was generated by the network by taking a vector
z as the input and the last images was generated by a vector z as the input
| 1   |     |     |     |     | 2   |
| --- | --- | --- | --- | --- | --- |
All intermediate images were generated by feeding z’s which were obtained by
| interpolating | z and | z (z = | λz +(1−λ)z | )   |     |
| ------------- | ----- | ------ | ---------- | --- | --- |
|               | 1     | 2      | 1          | 2   |     |
As we transition from z 1 to z 2 in the input space there is a corresponding
| smooth transition | in  | the image | space | also |     |
| ----------------- | --- | --------- | ----- | ---- | --- |
33/38
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --- | --------------------- | --------- |

The first 3 images in the first column were generated by feeding some
| z ,z ,z | respectively | as the input | to the generator |
| ------- | ------------ | ------------ | ---------------- |
| 11 12   | 13           |              |                  |
The fourth image was generated by taking an average of z 1 = z 11 ,z 12 ,z 13 and
| feeding | it to the generator |     |     |
| ------- | ------------------- | --- | --- |
Similarly we obtain the average vectors z and z for the 2nd and 3rd columns
2 3
If we do a simple vector arithmetic on these averaged vectors then we see the 34/38
corresponding effect inMtihteeshgMe.nKehraaptraed imCSa7g01e5s(DeepLearning): Lecture23

35/38
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| -------------- | --------------------- | --------- |

| Module     | 23.5: Bringing | it all | together | (the deep |
| ---------- | -------------- | ------ | -------- | --------- |
| generative | summary)       |        |          |           |
36/38
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| --- | --- | -------------- | --------------------- | --------- |

|             | RBMs               | VAEs               | ARmodels      | GANs       |
| ----------- | ------------------ | ------------------ | ------------- | ---------- |
| Abstraction | Yes                | Yes                | No            | No         |
| Generation  | Yes                | Yes                | Yes           | Yes        |
| ComputeP(X) | Intractable        | Intractable        | Tractable     | No         |
| Sampling    | MCMC               | Fast               | Slow          | Fast       |
| TypeofGM    | Undirected         | Directed           | Directed      | Directed   |
| Loss        | KL-divergence      | KL-divergence      | KL-divergence | JSD        |
| Assumptions | Xindependentgivenz | Xindependentgivenz | None          | N.A.       |
| Samples     | Bad                | Ok                 | Good          | Good(best) |
|             | Table: Comparison  | of Generative      | Models        |            |
Recent works look at combining these methods: e.g. Adversarial Autoencoders (Makhzani
2015), PixelVAE (Gulrajani 2016) and PixelGAN Autoencoders (Makhzani 2017)
37/38
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |     |
| --- | -------------- | --------------------- | --------- | --- |

Source: Ian Goodfellow, NIPS 2016 Tutorial: Generative Adversarial Networks
38/38
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture23 |
| -------------- | --------------------- | --------- |
