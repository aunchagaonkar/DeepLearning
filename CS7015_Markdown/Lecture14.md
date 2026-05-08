| CS7015 | (Deep Learning) | : Lecture | 14  |
| ------ | --------------- | --------- | --- |
Sequence Learning Problems, Recurrent Neural Networks, Backpropagation
Through Time (BPTT), Vanishing and Exploding Gradients, Truncated BPTT
|     | Mitesh | M. Khapra |     |
| --- | ------ | --------- | --- |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | -------------- | --------------------- | --------- |

| Module | 14.1: Sequence | Learning | Problems |     |
| ------ | -------------- | -------- | -------- | --- |
2/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

|     | In feedforward  | and                      | convolutional |
| --- | --------------- | ------------------------ | ------------- |
|     | neural networks | the size                 | of the input  |
|     | was always      | fixed                    |               |
|     | For example,    | we fed fixed             | size (32×     |
|     | 32) images      | to convolutional         | neural        |
|     | networks        | for image classification |               |
10 5
10 5
3/44
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| -------------- | --------------------- | --------- | --- |

|     |     |     |     |     | In feedforward | and | convolutional |     |
| --- | --- | --- | --- | --- | -------------- | --- | ------------- | --- |
)eh,tas|riahc(P
|              | )eh,tas|nam(P |          |          |              | neural networks | the              | size of        | the input |
| ------------ | ------------- | -------- | -------- | ------------ | --------------- | ---------------- | -------------- | --------- |
| )eh,tas|eh(P |               |          |          | )eh,tas|no(P |                 |                  |                |           |
|              |               |          |          |              | was always      | fixed            |                |           |
|              |               | . . .    | . .      | . . . .      |                 |                  |                |           |
|              |               |          |          |              | For example,    | we fed           | fixed          | size (32× |
|              |               |          |          |              | 32) images      | to convolutional |                | neural    |
| .            | . .           | . . .    | . .      | . . . .      | networks        | for image        | classification |           |
|              |               |          |          |              | Similarly       | in word2vec,     | we fed         | a fixed   |
|              |               |          |          |              | window          | (k) of words     | to the         | network   |
|              | . .           | . . .    | . .      | . . .        |                 |                  |                |           |
|              |               | Wcontext | Wcontext |              |                 |                  |                |           |
|              |               | he       | sat      |              |                 |                  |                |           |
4/44
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     | In feedforward |          | and   | convolutional |        |       |
| --- | --- | -------------- | -------- | ----- | ------------- | ------ | ----- |
|     |     | neural         | networks | the   | size          | of the | input |
|     |     | was always     |          | fixed |               |        |       |
apple
|     |     | For example, |     | we fed | fixed | size | (32× |
| --- | --- | ------------ | --- | ------ | ----- | ---- | ---- |
bus
|      |     | 32) images      |        | to convolutional |                |          | neural |
| ---- | --- | --------------- | ------ | ---------------- | -------------- | -------- | ------ |
|      |     | networks        | for    | image            | classification |          |        |
| 10 5 | car |                 |        |                  |                |          |        |
| 10 5 | .   |                 |        |                  |                |          |        |
|      | . . | Similarly       | in     | word2vec,        | we             | fed a    | fixed  |
|      |     | window          | (k)    | of words         | to the         | network  |        |
|      |     | Further,        | each   | input            | to the         | network  |        |
|      |     | was independent |        | of               | the            | previous | or     |
|      |     | future          | inputs |                  |                |          |        |
5/44
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     | In feedforward |          | and   | convolutional |        |       |
| --- | --- | -------------- | -------- | ----- | ------------- | ------ | ----- |
|     |     | neural         | networks | the   | size          | of the | input |
|     |     | was always     |          | fixed |               |        |       |
apple
|     |     | For example, |     | we fed | fixed | size | (32× |
| --- | --- | ------------ | --- | ------ | ----- | ---- | ---- |
bus
|      |     | 32) images      |        | to convolutional |                 |          | neural |
| ---- | --- | --------------- | ------ | ---------------- | --------------- | -------- | ------ |
|      |     | networks        | for    | image            | classification  |          |        |
| 10 5 | car |                 |        |                  |                 |          |        |
| 10 5 | .   |                 |        |                  |                 |          |        |
|      | . . | Similarly       | in     | word2vec,        | we              | fed a    | fixed  |
|      |     | window          | (k)    | of words         | to the          | network  |        |
|      |     | Further,        | each   | input            | to the          | network  |        |
|      |     | was independent |        | of               | the             | previous | or     |
|      |     | future          | inputs |                  |                 |          |        |
|      |     | For example,    |        | the              | computatations, |          |        |
outputsanddecisionsfortwosuccess-
|     |     | ive images |      | are completely |     | independ- |     |
| --- | --- | ---------- | ---- | -------------- | --- | --------- | --- |
|     |     | ent of     | each | other          |     |           |     |
6/44
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     | In many     | applications | the        | input is not |
| --- | ----------- | ------------ | ---------- | ------------ |
|     | of a fixed  | size         |            |              |
|     | Further     | successive   | inputs     | may not be   |
| p   | independent | of           | each other |              |
e e (cid:104)stop(cid:105)
|     | For example,    |       | consider       | the task of  |
| --- | --------------- | ----- | -------------- | ------------ |
|     | auto completion |       |                |              |
|     | Given the       | first | character      | ‘d’ you want |
|     | to predict      | the   | next character | ‘e’ and      |
so on
d e e p
7/44
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     | Notice a          | few things |            |        |         |
| --- | --- | ----------------- | ---------- | ---------- | ------ | ------- |
|     |     | First, successive |            | inputs     | are no | longer  |
|     |     | independent       | (while     | predicting |        | ‘e’ you |
| p   |     | would want        | to         | know what  | the    | previ-  |
e e (cid:104)stop(cid:105)
|     |     | ous input     | was        | in addition    | to the        | cur- |
| --- | --- | ------------- | ---------- | -------------- | ------------- | ---- |
|     |     | rent input)   |            |                |               |      |
|     |     | Second,       | the length | of             | the inputs    | and  |
|     |     | the number    | of         | predictions    | you           | need |
|     |     | to make       | is not     | fixed          | (for example, |      |
|     |     | “learn”,      | “deep”,    | “machine”      | have          | dif- |
|     |     | ferent number |            | of characters) |               |      |
|     |     | Third, each   |            | network        | (orange-blue- |      |
d e e p
|     |     | green structure) |     | is performing   |     | the |
| --- | --- | ---------------- | --- | --------------- | --- | --- |
|     |     | sametask(input:  |     | characteroutput |     |     |
: character)
8/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- | --- |

Theseareknownassequencelearning
problems
|     | We need  | to look at a | sequence of (de- |
| --- | -------- | ------------ | ---------------- |
| p   | pendent) | inputs and   | produce an out-  |
e e (cid:104)stop(cid:105)
|     | put (or    | outputs)    |             |
| --- | ---------- | ----------- | ----------- |
|     | Each input | corresponds | to one time |
step
|     | Let us look   | at some more | examples of |
| --- | ------------- | ------------ | ----------- |
|     | such problems |              |             |
d e e p
9/44
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| -------------- | --------------------- | --------- | --- |

|      |           |      | Consider                          | the task of      | predicting the    | part   |
| ---- | --------- | ---- | --------------------------------- | ---------------- | ----------------- | ------ |
|      |           |      | of speech                         | tag (noun,       | adverb, adjective |        |
|      |           |      | verb) of                          | each word in     | a sentence        |        |
|      |           |      | Once we                           | see an adjective | (social)          | we are |
| noun | adjective | noun | almostsurethatthenextwordshouldbe |                  |                   |        |
| verb | article   |      |                                   |                  |                   |        |
|      |           |      | a noun (man)                      |                  |                   |        |
|      |           |      | Thus the                          | current output   | (noun) depends    |        |
onthecurrentinputaswellastheprevi-
|     |     |     | ous input  |                 |              |        |
| --- | --- | --- | ---------- | --------------- | ------------ | ------ |
|     |     |     | Further    | the size of the | input is not | fixed  |
|     |     |     | (sentences | could have      | arbitrary    | number |
of words)
Noticethathereweareinterestedinpro-
| man is | a social | animal | ducing an    | output at each | time step |      |
| ------ | -------- | ------ | ------------ | -------------- | --------- | ---- |
|        |          |        | Each network | is performing  | the       | same |
|        |          |        | task (input  | : word, output | : tag)    |      |
10/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Sometimes | we may | not be interested |     |
| --- | --- | --- | --------- | ------ | ----------------- | --- |
inproducinganoutputateverystage
|             |             |          | Instead        | we would              | look at the    | full se- |
| ----------- | ----------- | -------- | -------------- | --------------------- | -------------- | -------- |
|             |             |          | quence         | and then produce      | an output      |          |
| don’t don’t | don’t don’t | don’t    |                |                       |                |          |
| care care   | care care   | care +/− |                |                       |                |          |
|             |             |          | Forexample,    | considerthetaskofpre- |                |          |
|             |             |          | dicting        | the polarity          | of a movie     | review   |
|             |             |          | The prediction | clearly               | does not       | de-      |
|             |             |          | pend only      | on the                | last word but  | also     |
|             |             |          | on some        | words which           | appear before  |          |
|             |             |          | Here again     | we could              | think that     | the      |
|             |             |          | network        | is performing         | the same       | task     |
|             |             |          | at each        | step (input           | : word, output | :        |
The movie was boring and long +/−) but it’s just that we don’t care
|     |     |     | about intermediate |     | outputs |     |
| --- | --- | --- | ------------------ | --- | ------- | --- |
11/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|                | Sequences     | could be             | composed of any-   |
| -------------- | ------------- | -------------------- | ------------------ |
|                | thing (not    | just words)          |                    |
|                | Forexample,   | avideocouldbetreated |                    |
|                | as a sequence | of images            |                    |
| Surya Namaskar | We may        | want to look         | at the entire se-  |
|                | quence        | and detect           | the activity being |
performed
...
...
12/44
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| -------------- | --------------------- | --------- | --- |

| Module | 14.2: Recurrent | Neural | Networks |     |
| ------ | --------------- | ------ | -------- | --- |
13/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

| How do | we model such | tasks involving | sequences ? |     |
| ------ | ------------- | --------------- | ----------- | --- |
14/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

Wishlist
| Account | for dependence | between inputs   |     |     |
| ------- | -------------- | ---------------- | --- | --- |
| Account | for variable   | number of inputs |     |     |
Make sure that the function executed at each time step is the same
We will focus on each of these to arrive at a model for dealing with sequences
15/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

|       |     | What is | the function being | executed |
| ----- | --- | ------- | ------------------ | -------- |
|       |     | at each | time step ?        |          |
|       |     |         | s = σ(Ux +b)       |          |
| y1 y2 |     |         | i i                |          |
|       |     |         | y = O(Vs           | +c)      |
|       |     |         | i i                |          |
i = timestep
V V
Sincewewantthesamefunctiontobe
| s 1 s | 2   | executed   | at each timestep  | we should   |
| ----- | --- | ---------- | ----------------- | ----------- |
|       |     | share the  | same network      | (i.e., same |
| U U   |     | parameters | at each timestep) |             |
x1 x2
16/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | -------------- | --------------------- | --------- | --- |

|       |       |     |     | This parameter                 |          | sharing   | also      | ensures    |        |
| ----- | ----- | --- | --- | ------------------------------ | -------- | --------- | --------- | ---------- | ------ |
|       |       |     |     | that the                       | network  | becomes   |           | agnostic   | to     |
|       |       |     |     | the length                     | (size)   | of        | the input |            |        |
| y1 y2 | y3 y4 |     | yn  | Sincewearesimplygoingtocompute |          |           |           |            |        |
|       |       |     |     | the same                       | function |           | (with     | same       | para-  |
|       |       |     |     | meters)                        | at each  | timestep, |           | the number |        |
|       |       |     |     | of timesteps                   |          | doesn’t   | matter    |            |        |
| V V   | V V   |     | V   |                                |          |           |           |            |        |
|       |       |     |     | We just                        | create   | multiple  | copies    |            | of the |
...
| s 1 | s 2 s 3 s | 4   | s n |         |     |         |      |     |      |
| --- | --------- | --- | --- | ------- | --- | ------- | ---- | --- | ---- |
|     |           |     |     | network | and | execute | them | at  | each |
timestep
| U U   | U U   |     | U   |     |     |     |     |     |     |
| ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
| x1 x2 | x3 x4 |     | xn  |     |     |     |     |     |     |
17/44
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     | How do          | we account        | for dependence    |
| --- | --- | --- | --------------- | ----------------- | ----------------- |
| y1  |     | y2  |                 |                   |                   |
|     |     |     | between         | inputs ?          |                   |
|     |     |     | Let us first    | see an infeasible | way of            |
| v   |     | v   |                 |                   |                   |
|     |     |     | doing this      |                   |                   |
|     |     |     | At each         | timestep we       | will feed all the |
| u   |     | u   |                 |                   |                   |
|     |     |     | previous        | inputs to the     | network           |
|     |     |     | Is this okay    | ?                 |                   |
| x1  | x1  | x2  |                 |                   |                   |
|     |     |     | No, it violates | the other         | two items on      |
| y3  |     | y4  | our wishlist    |                   |                   |
|     |     |     | How ? Let       | us see            |                   |
v v
u u
| x1 x2 x3 | x1 x2 | x3 x4 |     |     |     |
| -------- | ----- | ----- | --- | --- | --- |
18/44
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture14 |     |
| --- | -------------- | --- | --------------------- | --------- | --- |

First,thefunctionbeingcomputedat
| y1  |     | y2  |                |         |            |              |           |
| --- | --- | --- | -------------- | ------- | ---------- | ------------ | --------- |
|     |     |     | each time-step |         | now        | is different |           |
| v   |     | v   |                |         |            |              |           |
|     |     |     |                | y       | = f (x     | )            |           |
|     |     |     |                | 1       | 1 1        |              |           |
|     |     |     |                | y       | = f (x     | ,x )         |           |
|     |     |     |                | 2       | 2 1        | 2            |           |
| u   |     | u   |                | y       | = f (x     | ,x ,x )      |           |
|     |     |     |                | 3       | 3 1        | 2 3          |           |
| x1  | x1  | x2  | The network    |         | is now     | sensitive    | to the    |
|     |     |     | length         | of the  | sequence   |              |           |
| y3  |     | y4  |                |         |            |              |           |
|     |     |     | For example    |         | a sequence |              | of length |
|     |     |     | 10 will        | require | f ,...,f   |              | whereas a |
|     |     |     |                |         | 1          | 10           |           |
v v
|     |     |     | sequence | of  | length | 100 will | require |
| --- | --- | --- | -------- | --- | ------ | -------- | ------- |
f ,...,f
|     |     |     | 1   | 100 |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
u u
| x1 x2 x3 | x1 x2 | x3 x4 |     |     |     |     |     |
| -------- | ----- | ----- | --- | --- | --- | --- | --- |
19/44
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture14 |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|       |       |     |     | The        | solution | is     | to add   | a recurrent |
| ----- | ----- | --- | --- | ---------- | -------- | ------ | -------- | ----------- |
|       |       |     |     | connection |          | in the | network, |             |
|       |       |     |     |            | s        | = σ(Ux | +Ws      | +b)         |
| y1 y2 | y3 y4 |     | yn  |            | i        |        | i        | i−1         |
|       |       |     |     |            | y        | = O(Vs | +c)      |             |
|       |       |     |     |            | i        |        | i        |             |
or
| V V | V V |         | V   |     | y   | = f(x ,s | ,W,U,V,b,c) |     |
| --- | --- | ------- | --- | --- | --- | -------- | ----------- | --- |
|     |     |         |     |     | i   | i        | i−1         |     |
| W   | W W | W ... W |     |     |     |          |             |     |
s n
|       |       |     |     | s                   | i is the | state      | of the | network at  |
| ----- | ----- | --- | --- | ------------------- | -------- | ---------- | ------ | ----------- |
|       |       |     |     | timestep            |          | i          |        |             |
| U U   | U U   |     | U   |                     |          |            |        |             |
|       |       |     |     | The                 |          | parameters | are    | W,U,V,c,b   |
|       |       |     |     | which               |          | are shared | across | timesteps   |
| x1 x2 | x3 x4 |     | xn  |                     |          |            |        |             |
|       |       |     |     | The                 | same     | network    | (and   | parameters) |
|       |       |     |     | canbeusedtocomputey |          |            |        | ,y ,...,y   |
|       |       |     |     |                     |          |            |        | 1 2 10      |
or y
100
20/44
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture14 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     | This can | be represented | more com- |
| --- | -------- | -------------- | --------- |
pactly
yi
V
s i W
U
xi
21/44
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| -------------- | --------------------- | --------- | --- |

|                              |                            | Let us revisit | the sequence   | learning    |
| ---------------------------- | -------------------------- | -------------- | -------------- | ----------- |
|                              |                            | problems       | that we saw    | earlier     |
| e e p (cid:104)stop(cid:105) | noun verb articleadjective | noun           |                |             |
|                              |                            | We now         | have recurrent | connections |
|                              |                            | between time   | steps which    | account for |
dependence between inputs
| d e e p | man is a | social animal |     |     |
| ------- | -------- | ------------- | --- | --- |
SuryaNamaskar
|     | dcaorne’t dcaorne’t dcaorne’t | dcaorne’t dcaorne’t +/− |     |     |
| --- | ----------------------------- | ----------------------- | --- | --- |
...
...
|     | was boring | long |     |     |
| --- | ---------- | ---- | --- | --- |
|     | The movie  | and  |     |     |
22/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | -------------- | --------------------- | --------- | --- |

| Module | 14.3: Backpropagation |     | through | time |
| ------ | --------------------- | --- | ------- | ---- |
23/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     | Before proceeding | let us look       | at the |
| --- | --- | ----------------- | ----------------- | ------ |
|     |     | dimensions        | of the parameters | care-  |
fully
| y1 y2 | y3 y4 |     |     |     |
| ----- | ----- | --- | --- | --- |
Rn
|     |     | x i ∈  | (n-dimensional | input) |
| --- | --- | ------ | -------------- | ------ |
|     |     | s ∈ Rd | (d-dimensional | state) |
i
Rk
| V V | V V | y ∈ | (say k classes) |     |
| --- | --- | --- | --------------- | --- |
i
| W W | W W | U ∈ Rn×d |     |     |
| --- | --- | -------- | --- | --- |
|     |     | V ∈ Rd×k |     |     |
| U U | U U |          |     |     |
Rd×d
|       |       | W ∈ |     |     |
| ----- | ----- | --- | --- | --- |
| x1 x2 | x3 x4 |     |     |     |
24/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | -------------- | --------------------- | --------- | --- |

|       |       | How do        | we train this network | ?      |
| ----- | ----- | ------------- | --------------------- | ------ |
|       |       | (Ans: using   | backpropagation)      |        |
|       |       | Let us        | understand this with  | a con- |
| y1 y2 | y3 y4 | crete example |                       |        |
| V V   | V V   |               |                       |        |
| W     | W W W |               |                       |        |
| U U   | U U   |               |                       |        |
| x1 x2 | x3 x4 |               |                       |        |
25/44
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | -------------- | --------------------- | --------- | --- |

Supposeweconsiderourtaskofauto-
|     |     |     | completion | (predicting |     | the next char- |
| --- | --- | --- | ---------- | ----------- | --- | -------------- |
acter)
|     |     |     | For simplicity |              | we assume | that there     |
| --- | --- | --- | -------------- | ------------ | --------- | -------------- |
| e e | p   |     | are only       | 4 characters |           | in our vocabu- |
(cid:104)stop(cid:105)
|     |     |     | lary (d,e,p,                     | <stop>)     |            |                 |
| --- | --- | --- | -------------------------------- | ----------- | ---------- | --------------- |
|     |     |     | At each                          | timestep    | we         | want to predict |
|     |     |     | one of these                     | 4           | characters |                 |
| V V | V   | V   |                                  |             |            |                 |
| W   | W   | W   | Whatisasuitableoutputfunctionfor |             |            |                 |
|     |     |     | this task                        | ? (softmax) |            |                 |
| U U | U   | U   | What is                          | a suitable  | loss       | function for    |
|     |     |     | this task                        | ? (cross    | entropy)   |                 |
| d e | e   | p   |                                  |             |            |                 |
26/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|        |        |               | Suppose       | we initialize   | U,V,W    | ran- |
| ------ | ------ | ------------- | ------------- | --------------- | -------- | ---- |
|        |        |               | domly         | and the network | predicts | the  |
| L 1(θ) | L 2(θ) | L 3(θ) L 4(θ) |               |                 |          |      |
| y1     | y2 y3  | y4            | probabilities | as shown        |          |      |
PredictedTruePredictedTruePredictedTruePredictedTrue
| d 0.2    | 0 0.2 0 0.2 | 0 0.2 0 | And the      | true probabilities |           | are as |
| -------- | ----------- | ------- | ------------ | ------------------ | --------- | ------ |
| e 0.7    | 1 0.7 1 0.1 | 0 0.1 0 |              |                    |           |        |
| p 0.1    | 0 0.1 0 0.7 | 1 0.7 0 |              |                    |           |        |
| stop 0.1 | 0 0.1 0 0.1 | 0 0.1 1 | shown        |                    |           |        |
|          |             |         | We need      | to answer two      | questions |        |
| V        | V           | V V     |              |                    |           |        |
|          |             |         | What         | is the total loss  | made      | by the |
| W        | W           | W       |              |                    |           |        |
|          |             |         | model        | ?                  |           |        |
|          |             |         | How do       | we backpropagate   | this      | loss   |
| U        | U           | U U     |              |                    |           |        |
|          |             |         | and update   | the parameters     |           | (θ =   |
|          |             |         | {U,V,W,b,c}) | of the             | network   | ?      |
| d        | e           | e p     |              |                    |           |        |
27/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

Thetotallossissimplythesumofthe
|                                                      |             |               |     | loss over | all time-steps |     |     |
| ---------------------------------------------------- | ----------- | ------------- | --- | --------- | -------------- | --- | --- |
| L 1(θ)                                               | L 2(θ)      | L 3(θ) L 4(θ) |     |           |                |     |     |
| y1                                                   | y2          | y3 y4         |     |           |                |     |     |
| PredictedTruePredictedTruePredictedTruePredictedTrue |             |               |     |           | T              |     |     |
| d                                                    | 0.2 0 0.2 0 | 0.2 0 0.2 0   |     | L(θ)      | (cid:88) L     |     |     |
| e                                                    | 0.7 1 0.7 1 | 0.1 0 0.1 0   |     | =         |                | (θ) |     |
| p                                                    | 0.1 0 0.1 0 | 0.7 1 0.7 1   |     |           |                | t   |     |
| stop                                                 | 0.1 0 0.1 0 | 0.1 0 0.1 0   |     |           |                |     |     |
t=1
|     |     |     |     | L (θ) = | −log(y    | )            |         |
| --- | --- | --- | --- | ------- | --------- | ------------ | ------- |
|     | V V | V V |     | t       |           | tc           |         |
|     | W W | W   |     | y tc =  | predicted | probability  | of true |
|     |     |     |     |         | character | at time-step | t       |
|     | U U | U U |     | T =     | number    | of timesteps |         |
Forbackpropagationweneedtocom-
|     | d e | e e |     |          |           |                  |     |
| --- | --- | --- | --- | -------- | --------- | ---------------- | --- |
|     |     |     |     | pute the | gradients | w.r.t. W,U,V,b,c |     |
|     |     |     |     | Let us   | see how   | to do that       |     |
28/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture14 |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- |

∂L(θ)
|     |     |     | Let us | consider |     | (V  | is a matrix |
| --- | --- | --- | ------ | -------- | --- | --- | ----------- |
∂V
L(θ))
|        |               |        | so ideally | we  | should | write | ∇ v |
| ------ | ------------- | ------ | ---------- | --- | ------ | ----- | --- |
| L 1(θ) | L 2(θ) L 3(θ) | L 4(θ) |            |     |        |       |     |
| y1     | y2 y3         | y4     |            |     |        |       |     |
P red i c tedTr uePre d i ctedTr uePre d i ctedTr uePre d i ctedTr ue T
|          |             |               |     | ∂L(θ) | (cid:88) | ∂L  | (θ) |
| -------- | ----------- | ------------- | --- | ----- | -------- | --- | --- |
| d 0 . 2  | 0 0 . 2 0 0 | . 2 0 0 . 2 0 |     |       |          | t   |     |
| e 0.7    | 1 0.7 1 0.1 | 0 0.1 0       |     |       | =        |     |     |
| p 0.1    | 0 0.1 0 0.7 | 1 0.7 1       |     | ∂V    |          | ∂V  |     |
| stop 0.1 | 0 0.1 0 0.1 | 0 0.1 0       |     |       |          |     |     |
t=1
| V   | V   | V V |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
Eachtermisthesummationissimply
| W   | W   | W   |                |            |                 |       |            |
| --- | --- | --- | -------------- | ---------- | --------------- | ----- | ---------- |
|     |     |     | the derivative |            | of the          | loss  | w.r.t. the |
|     |     |     | weights        | in the     | output          | layer |            |
| U   | U   | U U |                |            |                 |       |            |
|     |     |     | We have        | already    | seen            | how   | to do this |
|     |     |     | when           | we studied | backpropagation |       |            |
| d   | e   | e e |                |            |                 |       |            |
29/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture14 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

∂L(θ)
|     |     |     |     | Let | us consider | the | derivative |     |     |
| --- | --- | --- | --- | --- | ----------- | --- | ---------- | --- | --- |
∂W
| L 1(θ) | L 2(θ) | L 3(θ) | L 4(θ) |     |     |     |     |     |     |
| ------ | ------ | ------ | ------ | --- | --- | --- | --- | --- | --- |
T
| y1                                                   | y2  | y3  | y4  |     | ∂L(θ) |     | (cid:88) ∂L | (θ) |     |
| ---------------------------------------------------- | --- | --- | --- | --- | ----- | --- | ----------- | --- | --- |
| PredictedTruePredictedTruePredictedTruePredictedTrue |     |     |     |     |       |     |             | t   |     |
=
| d    | 0 . 2 0 0 . 2 | 0 0 . 2 | 0 0 . 2 0 |     |           | ∂W   | ∂W             |     |     |
| ---- | ------------- | ------- | --------- | --- | --------- | ---- | -------------- | --- | --- |
| e    | 0 . 7 1 0 . 7 | 1 0 . 1 | 0 0 . 1 0 |     |           |      |                |     |     |
| p    | 0.1 0 0.1     | 0 0.7   | 1 0.7 1   |     |           |      | t=1            |     |     |
| stop | 0.1 0 0.1     | 0 0.1   | 0 0.1 0   |     |           |      |                |     |     |
|      |               |         |           | By  | the chain | rule | of derivatives |     | we  |
∂L
|     | V V | V   | V   | know | that | t(θ) is | obtained | by  | sum- |
| --- | --- | --- | --- | ---- | ---- | ------- | -------- | --- | ---- |
∂W
|     | W W |     | W   | ming | gradients | along | all | the | paths |
| --- | --- | --- | --- | ---- | --------- | ----- | --- | --- | ----- |
L
|     |     |     |     | from | (θ) | to W |     |     |     |
| --- | --- | --- | --- | ---- | --- | ---- | --- | --- | --- |
t
L
|     |     |     |     | What | are    | the paths | connecting  |     | t (θ) |
| --- | --- | --- | --- | ---- | ------ | --------- | ----------- | --- | ----- |
|     | U U | U   | U   |      |        |           |             |     |       |
|     |     |     |     | to W | ?      |           |             |     |       |
|     |     |     |     | Let  | us see | this by   | considering |     | L (θ) |
4
|     | d e | e   | e   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
30/44
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |                   |           | L (θ)     | depends on      | s               |
| --- | ----------------- | --------- | --------- | --------------- | --------------- |
|     |                   |           | 4         |                 | 4               |
|     |                   |           | s in turn | depends         | on s and W      |
|     |                   |           | 4         |                 | 3               |
|     | L1(θ) L2(θ) L3(θ) | L4(θ)     |           |                 |                 |
|     |                   |           | s in turn | depends         | on s and W      |
|     |                   |           | 3         |                 | 2               |
|     |                   |           | s in turn | depends         | on s and W      |
|     |                   |           | 2         |                 | 1               |
|     |                   |           | s in turn | depends         | on s and        |
|     | V V V             | V         | 1         |                 | 0 W             |
|     | W W               | W W...    | where s   | 0 is a constant | starting state. |
|     | s1 s2 s3          | s4        |           |                 |                 |
|     | U U U             | U         |           |                 |                 |
|     | x1 x2 x3          | x4        |           |                 |                 |
| s 0 | s 1 s 2 s 3       | s 4 L (θ) |           |                 |                 |
4
W
31/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     |     |     | What | we have | here | is  | an ordered | net- |
| --- | --- | --- | --- | --- | ---- | ------- | ---- | --- | ---------- | ---- |
work
|     | L1(θ) | L2(θ) L3(θ) | L4(θ) |     |     |     |     |     |     |     |
| --- | ----- | ----------- | ----- | --- | --- | --- | --- | --- | --- | --- |
Inanorderednetworkeachstatevari-
|     |     |       |        |     | able      | is computed |        | one | at a time  | in a    |
| --- | --- | ----- | ------ | --- | --------- | ----------- | ------ | --- | ---------- | ------- |
|     | V   | V     | V V    |     |           |             |        |     |            |         |
|     |     |       |        |     | specified | order       | (first |     | s 1 , then | s 2 and |
|     |     | W W   | W W... |     | so on)    |             |        |     |            |         |
|     | s1  | s2 s3 | s4     |     |           |             |        |     |            |         |
|     |     |       |        |     | Now       | we have     |        |     |            |         |
|     | U   | U     | U U    |     |           |             |        |     |            |         |
|     |     |       |        |     |           | ∂L          |        | ∂L  |            |         |
|     |     |       |        |     |           |             | 4 (θ)  |     | 4 (θ) ∂s 4 |         |
=
|     | x1  | x2 x3 | x4  |     |     | ∂W  |     | ∂s  | 4 ∂W |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | ---- | --- |
L
| s 0 | s 1 | s 2 s 3 | s 4 | 4 (θ) |     |     |     |     |     |     |
| --- | --- | ------- | --- | ----- | --- | --- | --- | --- | --- | --- |
Wehavealreadyseenhowtocompute
∂L 4(θ)
|     |     |     |     |     |     | when | we  | studied | backprop |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | ------- | -------- | --- |
∂s4
|     |     |     |     |     | But how | do  | we compute |     | ∂s4 |     |
| --- | --- | --- | --- | --- | ------- | --- | ---------- | --- | --- | --- |
W
∂W
32/44
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |       |             |       |     | Recall  | that          |          |          |
| --- | ----- | ----------- | ----- | --- | ------- | ------------- | -------- | -------- |
|     | L1(θ) | L2(θ) L3(θ) | L4(θ) |     |         |               |          |          |
|     |       |             |       |     |         | s = σ(Ws      | +b)      |          |
|     |       |             |       |     |         | 4             | 3        |          |
|     |       |             |       |     | In such | an ordered    | network, | we can’t |
|     | V     | V           | V V   |     |         |               |          |          |
|     |       |             |       |     | compute | ∂s4 by simply | treating | s as     |
3
|     |     | W W   | W   | W... |            | ∂W       |         |         |
| --- | --- | ----- | --- | ---- | ---------- | -------- | ------- | ------- |
|     | s1  | s2 s3 | s4  |      | a constant | (because | it also | depends |
on
W)
|     | U   | U   | U U |     |         |           |           |            |
| --- | --- | --- | --- | --- | ------- | --------- | --------- | ---------- |
|     |     |     |     |     | In such | networks  | the total | derivative |
|     |     |     |     |     | ∂s4 has | two parts |           |            |
∂W
|     | x1  | x2 x3 | x4  |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- |
+
|     |     |         |     | L     | Explicit: | ∂ s4, treatingallotherin- |         |              |
| --- | --- | ------- | --- | ----- | --------- | ------------------------- | ------- | ------------ |
| s 0 | s 1 | s 2 s 3 | s 4 | 4 (θ) |           | ∂ W                       |         |              |
|     |     |         |     |       | puts as   | constant                  |         |              |
|     |     |         |     |       | Implicit  | : Summing                 | over    | all indirect |
|     |     |         |     |       | paths     | from s to W               |         |              |
|     |     | W       |     |       |           | 4                         |         |              |
|     |     |         |     |       | Let us    | see how to                | do this |              |
33/44
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

∂s ∂+s ∂s ∂s
4 4 4 3
= +
∂W ∂W ∂s ∂W
3
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
explicit implicit
∂+s ∂s (cid:104) ∂+s ∂s ∂s (cid:105)
4 4 3 3 2
= + +
∂W ∂s ∂W ∂s ∂W
3 2
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
explicit implicit
∂+s ∂s ∂+s ∂s ∂s (cid:104)∂+s ∂s ∂s (cid:105)
4 4 3 4 3 2 2 1
= + + +
∂W ∂s ∂W ∂s ∂s ∂W ∂s ∂W
3 3 2 1
∂+s ∂s ∂+s ∂s ∂s ∂+s ∂s ∂s ∂s (cid:104)∂+s (cid:105)
4 4 3 4 3 2 4 3 2 1
= + + +
∂W ∂s ∂W ∂s ∂s ∂W ∂s ∂s ∂s ∂W
3 3 2 3 2 1
For simplicity we will short-circuit some of the paths
∂s 4 ∂s 4 ∂+s 4 ∂s 4 ∂+s 3 ∂s 4 ∂+s 2 ∂s 4 ∂+s 1 (cid:88) 4 ∂s 4 ∂+s k
= + + + =
∂W ∂s ∂W ∂s ∂W ∂s ∂W ∂s ∂W ∂s ∂W
4 3 2 1 k
k=1
34/44
MiteshM.Khapra CS7015(DeepLearning): Lecture14

|     |       |             |       |     |     | Finally | we    | have |          |     |
| --- | ----- | ----------- | ----- | --- | --- | ------- | ----- | ---- | -------- | --- |
|     | L1(θ) | L2(θ) L3(θ) | L4(θ) |     |     |         | ∂L    |      | ∂L       |     |
|     |       |             |       |     |     |         | 4 (θ) |      | 4 (θ) ∂s | 4   |
=
|     |     |     |     |     |     |     | ∂W  |     | ∂s 4 ∂W |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- |
4
|     | V   | V   | V V |     |     |     | ∂s  |     | ∂s ∂+s     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- |
|     |     |     |     |     |     |     |     | 4   | (cid:88) 4 | k   |
=
|     |     | W W | W W... |     |     |     | ∂W  |     | ∂s ∂W |     |
| --- | --- | --- | ------ | --- | --- | --- | --- | --- | ----- | --- |
|     | s1  | s2  | s3 s4  |     |     |     |     |     | k     |     |
k=1
|     |     |       |       |       |     |                                   | ∂L      |     | ∂L t              |        |
| --- | --- | ----- | ----- | ----- | --- | --------------------------------- | ------- | --- | ----------------- | ------ |
|     | U   | U     | U U   |       |     |                                   | (θ)     |     | (θ) (cid:88)      | ∂s ∂+s |
|     |     |       |       |       |     | ∴                                 | t       | =   | t                 | t k    |
|     |     |       |       |       |     |                                   | ∂W      |     | ∂s                | ∂s ∂W  |
|     |     |       |       |       |     |                                   |         |     | t k=1             | k      |
|     | x1  | x2    | x3 x4 |       |     |                                   |         |     |                   |        |
|     |     |       |       | L     |     | Thisalgorithmiscalledbackpropaga- |         |     |                   |        |
| s 0 | s 1 | s 2 s | 3 s 4 | 4 (θ) |     |                                   |         |     |                   |        |
|     |     |       |       |       |     | tion                              | through |     | time (BPTT)       | as we  |
|     |     |       |       |       |     | backpropagate                     |         |     | over all previous | time   |
steps
W
35/44
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture14 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| Module | 14.4: The | problem | of Exploding | and Vanishing |
| ------ | --------- | ------- | ------------ | ------------- |
Gradients
36/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

∂st
|     | We  | will | now focus | on  |     | and high- |
| --- | --- | ---- | --------- | --- | --- | --------- |
∂s
|     | light | an    | important | problem | k   | in train- |
| --- | ----- | ----- | --------- | ------- | --- | --------- |
|     | ing   | RNN’s | using     | BPTT    |     |           |
|     |       | ∂s    | ∂s        | ∂s      | ∂s  |           |
|     |       | t     | t         | t−1     |     | k+1       |
|     |       |       | =         |         | ... |           |
|     |       | ∂s    | ∂s        | ∂s      |     | ∂s        |
|     |       | k     | t−1       | t−2     |     | k         |
t−1
|     |     |     | (cid:89) ∂s |     |     |     |
| --- | --- | --- | ----------- | --- | --- | --- |
j+1
=
∂s
j
j=k
|     | Let     | us look | at            | one such | term | in the |
| --- | ------- | ------- | ------------- | -------- | ---- | ------ |
|     | product |         | (i.e., ∂sj+1) |          |      |        |
∂sj
37/44
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture14 |     |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- | --- |

We are interested in
∂sj
∂sj−1
a = [a ,a ,a ,...a ,] a = Ws +b
j j1 j2 j3 jd j j
s = [σ(a ),σ(a ),...σ(a )] s = σ(a )
j j1 j2 jd j j
∂sj1 ∂sj2 ∂sj3 ...  ∂s j = ∂s j ∂a j
∂aj1 ∂aj1 ∂aj1
∂s ∂a ∂s
∂
∂
a
s
j j =

   ∂ ∂ a s . j j 1 2 ∂ ∂ a s . j j 2 2
..
. .

  
j−1
= dia
j
g(σ
j
(cid:48) (
−
a
1
j ))W
. . . ∂s
. . . jd
∂a
jd
 σ(cid:48)(a ) 0 0 0 
j1
 0 σ(cid:48)(a j2 ) 0 0 
=  
 0 0
...  

W
of
e
∂
a
s
r
j
e i
←
nte
i
r
f
es
it
te
i
d
s s
in
m
t
a
h
ll
e
(
m
lar
a
g
g
e
n
)
itu
∂s
d
t
e
0 0 ... σ(cid:48)(a jd ) and ∂s h j− e 1 nce ∂L t will vanish (explo ∂s d k e)
∂W
(cid:48)
= diag(σ (a ))
j
38/44
MiteshM.Khapra CS7015(DeepLearning): Lecture14

|     | (cid:13) (cid:13) |     |     |     |     |     | (cid:13) |     | (cid:13) |
| --- | ----------------- | --- | --- | --- | --- | --- | -------- | --- | -------- |
(cid:13) ∂ s (cid:13) (cid:13) (cid:13) (cid:13) (cid:13) (cid:13) t (cid:13)
|     | j   | = (cid:13) | diag(σ (cid:48) | (a ))W (cid:13) |     | ∂s  | (cid:89) | ∂s  |     |
| --- | --- | ---------- | --------------- | --------------- | --- | --- | -------- | --- | --- |
(cid:13) (cid:13) (cid:13) j (cid:13) (cid:13) t (cid:13) (cid:13) j (cid:13)
|     | (cid:13)∂ s (cid:13) |          |     |          |     | (cid:13)   | (cid:13) = (cid:13) |     | (cid:13) |
| --- | -------------------- | -------- | --- | -------- | --- | ---------- | ------------------- | --- | -------- |
|     | j−1                  |          |     |          |     | (cid:13)∂s | (cid:13) (cid:13)   | ∂s  | (cid:13) |
|     |                      | (cid:13) |     | (cid:13) |     |            | k                   |     | j−1      |
(cid:13)diag(σ (cid:48) (cid:13)(cid:107)W(cid:107) (cid:13)j=k+1 (cid:13)
|     |     | ≤        |     | (a j )   |     |     |     |     |     |
| --- | --- | -------- | --- | -------- | --- | --- | --- | --- | --- |
|     |     | (cid:13) |     | (cid:13) |     |     | t   |     |     |
(cid:89)
|     |            |         |          |           |     |     | ≤   | γλ  |     |
| --- | ---------- | ------- | -------- | --------- | --- | --- | --- | --- | --- |
| ∵   | σ(a ) is a | bounded | function | (sigmoid, |     |     |     |     |     |
j
|       | σ(cid:48)(a |         |     |     |     |     | j=k+1   |     |     |
| ----- | ----------- | ------- | --- | --- | --- | --- | ------- | --- | --- |
| tanh) | ) is        | bounded |     |     |     |     |         |     |     |
|       | j           |         |     |     |     |     | (γλ)t−k |     |     |
≤
1
(cid:48)
|     | σ (a )               | ≤ =                    | γ[if σ | is logistic ] |            |      |                |             |         |
| --- | -------------------- | ---------------------- | ------ | ------------- | ---------- | ---- | -------------- | ----------- | ------- |
|     | j                    | 4                      |        |               |            |      |                |             |         |
|     |                      |                        |        |               | If         | γλ < | 1 the gradient | will        | vanish  |
|     |                      | ≤ 1 =                  | γ[if σ | is tanh ]     |            |      |                |             |         |
|     |                      |                        |        |               | If         | γλ > | 1 the gradient | could       | explode |
|     | (cid:13) ∂s (cid:13) |                        |        |               |            |      |                |             |         |
|     | (cid:13) j (cid:13)  |                        |        |               | This       | is   | known as       | the problem | of      |
|     | (cid:13) (cid:13)    | ≤ γ(cid:107)W(cid:107) |        |               |            |      |                |             |         |
|     | (cid:13)∂s (cid:13)  |                        |        |               |            |      |                |             |         |
|     | j−1                  |                        |        |               | vanishing/ |      | exploding      | gradients   |         |
|     |                      | ≤ γλ                   |        |               |            |      |                |             |         |
39/44
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture14 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | One simple    | way of avoiding      | this is to |
| --- | --- | --- | ------------- | -------------------- | ---------- |
|     |     |     | use truncated | backpropogation      |            |
|     |     |     | where we      | restrict the product | to         |
|     |     |     | τ(< t−k)      | terms                |            |
L t
| y1 y2 | y3 y4 | yn  |     |     |     |
| ----- | ----- | --- | --- | --- | --- |
| v v   | v v   | v   |     |     |     |
| w     | w w   | ww  |     |     |     |
| u u   | u u   | u   |     |     |     |
| x1 x2 | x3 x4 | xn  |     |     |     |
40/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Module | 14.5: Some | Gory Details |     |     |
| ------ | ---------- | ------------ | --- | --- |
41/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     | ∂L  | (θ) | ∂L  | (θ) | t ∂s ∂+s   |     |
| --- | --- | --- | --- | --- | --- | ---------- | --- |
|     |     |     | t   |     | t   | (cid:88) t | k   |
=
|     |     |           | ∂W                           |           | ∂s                           | ∂s                                                 | ∂W                           |
| --- | --- | --------- | ---------------------------- | --------- | ---------------------------- | -------------------------------------------------- | ---------------------------- |
|     |     |           |                              |           | t                            | k                                                  |                              |
|     |     | (cid:124) | (cid:123)(cid:122) (cid:125) | (cid:124) | (cid:123)(cid:122) (cid:125) | k=1 (cid:124)(cid:123)(cid:122)(cid:125) (cid:124) | (cid:123)(cid:122) (cid:125) |
|     |     | ∈Rd×d     |                              | ∈R1×d     |                              | ∈Rd×d ∈Rd×d×d                                      |                              |
|     |     |           |                              | ∂L t(θ)   |                              | L                                                  |                              |
We know how to compute (derivative of (θ) (scalar) w.r.t. last
|              |           |     |       | ∂st             |     |     | t   |
| ------------ | --------- | --- | ----- | --------------- | --- | --- | --- |
| hidden layer | (vector)) |     | using | backpropagation |     |     |     |
We just saw a formula for ∂st which is the derivative of a vector w.r.t. a
∂s
k
vector)
∂+s k is a tensor ∈ Rd×d×d, the derivative of a vector ∈ Rd w.r.t. a matrix
∂W
∈ Rd×d
| How do | we compute |     | ∂+s k | ? Let | us see |     |     |
| ------ | ---------- | --- | ----- | ----- | ------ | --- | --- |
∂W
42/44
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture14 |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --------- |

∂+s
| We just look | at one | element of | this k tensor |     |
| ------------ | ------ | ---------- | ------------- | --- |
∂W
∂+s
| kp is the | (p,q,r)-th | element | of the 3d tensor |     |
| --------- | ---------- | ------- | ---------------- | --- |
∂Wqr
| a k = Ws k−1 | +b  |     |     |     |
| ------------ | --- | --- | --- | --- |
| s = σ(a      | )   |     |     |     |
| k k          |     |     |     |     |
43/44
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture14 |
| --- | --- | -------------- | --------------------- | --------- |

(cid:80)d
| a =Ws    |        |           |       |             | ∂a  |                  | ∂         | W s      |            |     |
| -------- | ------ | --------- | ----- | ----------- | --- | ---------------- | --------- | -------- | ---------- | --- |
| k        | k−1    |           |       |             |     | kp =             | i=1       | pi k−1,i |            |     |
|  a     |  W    | W ...     | W     |  s       | ∂W  | qr               |           | ∂W qr    |            |     |
| k1       | 11     | 12        | 1d    | k−1,1       |     |                  |           |          |            |     |
| a k2   |       |           |       | s k−1,2  |     | =s               | k−1,i     | if p=q   | and i=r    |     |
|        |       |           |       |          |     |                  |           |          |            |     |
|  .     |  .    | . .       | .     |  .       |     |                  |           |          |            |     |
| . .      | . .    | . . . .   | . .   | . .         |     | =0               | otherwise |          |            |     |
|        |       |           |       |          |     |                  |           |          |            |     |
|  =    |        |           |       |          | ∂   | s                |           |          |            |     |
|  a k p |  W p1 | W p2 . .. | W pd |  s k− 1,p |     | k p =σ(cid:48)(a |           |          |            |     |
|        |       |           |       |          |     |                  |           | )s       | if p=q and | i=r |
|  .     |  .    | . .       | .     |   .      | ∂ W |                  | kp        | k−1,r    |            |     |
| . .      | . .    | . . . .   | . .   | . .         |     | q r              |           |          |            |     |
|        |       |           |       |          |     |                  |           |          |            |     |
|          |        |           |       |             |     | =0               | otherwise |          |            |     |
| a        |        |           |       | s           |     |                  |           |          |            |     |
| kd       |        |           |       | k−1,d       |     |                  |           |          |            |     |
d
(cid:88)
| a = | W   | s        |     |     |     |     |     |     |     |     |
| --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
| kp  |     | pi k−1,i |     |     |     |     |     |     |     |     |
i=1
| s =σ(a |       | )     |     |     |     |     |     |     |     |     |
| ------ | ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
| kp     | kp    |       |     |     |     |     |     |     |     |     |
| ∂s     | ∂s    | ∂a    |     |     |     |     |     |     |     |     |
| kp =   | kp    | kp    |     |     |     |     |     |     |     |     |
| ∂W qr  | ∂a kp | ∂W qr |     |     |     |     |     |     |     |     |
∂a
| =σ(cid:48)(a |     | kp  |     |     |     |     |     |     |     |     |
| ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
kp )
∂W
qr
44/44
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture14 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |
