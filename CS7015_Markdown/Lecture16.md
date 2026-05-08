| CS7015  | (Deep   | Learning) | :         | Lecture   | 16  |
| ------- | ------- | --------- | --------- | --------- | --- |
| Encoder | Decoder | Models,   | Attention | Mechanism |     |
|         |         | Mitesh    | M. Khapra |           |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/63
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |
| --- | -------------- | --- | --------------------- | --- | --------- |

| Module | 16.1: Introduction |     | to Encoder | Decoder | Models |
| ------ | ------------------ | --- | ---------- | ------- | ------ |
2/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |            |       |        |                 | We will             | start       | by          | revisiting | the       |
| --- | --- | ---------- | ----- | ------ | --------------- | ------------------- | ----------- | ----------- | ---------- | --------- |
|     | I   | am at home | today | ⟨stop⟩ |                 | problem             | of language |             | modeling   |           |
| yt  | yt  | yt yt      | yt    | yt     | =jjyt (cid:0)1) |                     |             |             |            |           |
|     |     |            |       | P(yt   | 1               | Informally,         | given       | ‘t(cid:0)i’ | words      | we are    |
|     |     |            |       |        |                 | interested          | in          | predicting  | the        | tth word  |
|     | V   | V V        | V V   | V      |                 |                     |             |             |            |           |
|     |     |            |       |        |                 | Moreformally,giveny |             |             | ;y ;:::;y  | we        |
|     |     |            |       |        |                 |                     |             |             | 1 2        | t(cid:0)1 |
|     | W   | W W        | W W   |        |                 | want to             | find        |             |            |           |
st
s0
|     |     |     |     |     |     | (cid:3) |        |     | jy        |             |
| --- | --- | --- | --- | --- | --- | ------- | ------ | --- | --------- | ----------- |
|     | U   | U U | U U | U   |     | y =     | argmax | P(y | ;y ;:::;y | t(cid:0)1 ) |
|     |     |     |     |     |     |         |        |     | t 1 2     |             |
xt
|      |     |      |         |       |     | Let    | us see  | how       | we    | model |
| ---- | --- | ---- | ------- | ----- | --- | ------ | ------- | --------- | ----- | ----- |
| <GO> |     | I am | at home | today |     | P(y jy | ;y :::y | ) using   | a RNN |       |
|      |     |      |         |       |     | t 1    | 2       | t(cid:0)1 |       |       |
jy
|     |     |     |     |     |     | We will   | refer     | to P(y | ;y               | :::y t(cid:0)1 ) by |
| --- | --- | --- | --- | --- | --- | --------- | --------- | ------ | ---------------- | ------------------- |
|     |     |     |     |     |     |           |           |        | t 1 2            |                     |
|     |     |     |     |     |     | shorthand | notation: |        | P(y jyt(cid:0)1) |                     |
t
1
3/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture16 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|      |         |       |        |                 | We are     | interested |       | in         |             |            |
| ---- | ------- | ----- | ------ | --------------- | ---------- | ---------- | ----- | ---------- | ----------- | ---------- |
| I am | at home | today | ⟨stop⟩ |                 |            |            |       |            |             |            |
|      |         |       | yt     | =jjyt (cid:0)1) |            | P(y        | =     | jjy ;y     | :::y        | )          |
|      |         |       | P(yt   | 1               |            |            | t     | 1          | 2 t(cid:0)1 |            |
|      |         |       |        |                 | where      | j 2        | V and | V          | is the      | set of all |
| V V  | V       | V V   | V      |                 |            |            |       |            |             |            |
|      |         |       |        |                 | vocabulary |            | words |            |             |            |
| W    | W W     | W W   |        |                 |            |            |       |            |             |            |
|      |         |       | st     |                 | Using      | an         | RNN   | we compute |             | this as    |
s0
| U U | U   | U U | U   |     |     | jjyt(cid:0)1) |     |              |     |     |
| --- | --- | --- | --- | --- | --- | ------------- | --- | ------------ | --- | --- |
|     |     |     |     |     | P(y | =             |     | = softmax(Vs |     | +c) |
|     |     |     |     |     |     | t             | 1   |              |     | t j |
xt
|        |       |      |       |     | In other | words         |         | we compute   |             |       |
| ------ | ----- | ---- | ----- | --- | -------- | ------------- | ------- | ------------ | ----------- | ----- |
| <GO> I | am at | home | today |     |          |               |         |              |             |       |
|        |       |      |       |     |          | jjyt(cid:0)1) |         |              | jjs         |       |
|        |       |      |       |     | P(y      | =             |         | = P(y        | =           | )     |
|        |       |      |       |     |          | t             | 1       |              | t           | t     |
|        |       |      |       |     |          |               |         | = softmax(Vs |             | +c)   |
|        |       |      |       |     |          |               |         |              |             | t j   |
|        |       |      |       |     | Notice   | that          | the     | recurrent    | connections |       |
|        |       |      |       |     | ensure   | that          | s t has | information  |             | about |
yt(cid:0)1
|     |     |                |     |                       | 1   |     |           |     |     | 4/63 |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | ---- |
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture16 |     |     |      |

|      |         |              |       |           | Data:  | All sentences   | from any large |
| ---- | ------- | ------------ | ----- | --------- | ------ | --------------- | -------------- |
| I am | at home | today ⟨stop⟩ |       |           | corpus | (say wikipedia) |                |
|      |         | yt           | =jjyt | (cid:0)1) |        |                 |                |
|      |         |              | P(yt  | 1         | Model: |                 |                |
| V V  | V       | V V          | V     |           |        | s = (cid:27)(Ws | +Ux +b)        |
|      |         |              |       |           |        | t               | t(cid:0)1 t    |
jjyt(cid:0)1)
| W   | W W | W W |     |     | P(y = | = softmax(Vs | +c) |
| --- | --- | --- | --- | --- | ----- | ------------ | --- |
|     |     |     | st  |     | t     | 1            | t j |
s0
| U U | U   | U U | U   |     | Parameters: | U;V;W;b;c |     |
| --- | --- | --- | --- | --- | ----------- | --------- | --- |
Loss:
xt
| <GO> I | am at | home | today |     |             | ∑T             |     |
| ------ | ----- | ---- | ----- | --- | ----------- | -------------- | --- |
|        |       |      |       |     | L((cid:18)) | = L ((cid:18)) |     |
t
t=1
jyt(cid:0)1)
India, officially the Republic L ((cid:18)) = (cid:0)logP(y = ℓ
|           |              |          |     |     | t   |     | t t 1 |
| --------- | ------------ | -------- | --- | --- | --- | --- | ----- |
| of India, | is a country | in South |     |     |     |     |       |
Data:
|         |                           |       |     |     | where ℓ | is the true word | at time step |
| ------- | ------------------------- | ----- | --- | --- | ------- | ---------------- | ------------ |
| Asia.   | It is the seventh-largest |       |     |     |         | t                |              |
| country | by area,                  | ..... |     |     | t       |                  |              |
5/63
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

|          |         |              | What is      | the input | at each  | time step? |
| -------- | ------- | ------------ | ------------ | --------- | -------- | ---------- |
| o/p:I am | at home | today <stop> |              |           |          |            |
|          |         |              | It is simply |           | the word | that we    |
|          |         |              | predicted    | at the    | previous | time step  |
In general
|     |     |     |     | s t = RNN(s | t(cid:0)1 | ;x t ) |
| --- | --- | --- | --- | ----------- | --------- | ------ |
st
|         |         |         | Let j       | be the  | index    | of the word |
| ------- | ------- | ------- | ----------- | ------- | -------- | ----------- |
| 1 0     | 0 1     | 0 0     |             |         |          |             |
| 0 0     | 0 0     | 1 0     | which has   | been    | assigned | the max     |
| 0 0 1 0 | 0 1 0 0 | 0 0 0 1 |             |         |          |             |
| 0 0     | 0 0     | 0 0     |             |         |          |             |
|         |         |         | probability | at time | step     | t(cid:0)1   |
<GO>
|     |     |     |                  | x   | = e(v     | )      |
| --- | --- | --- | ---------------- | --- | --------- | ------ |
|     |     |     |                  |     | t j       |        |
|     |     |     | x is essentially |     | a one-hot | vector |
t
))representingthejth
|     |     |     | (e(v j |     |     | wordinthe |
| --- | --- | --- | ------ | --- | --- | --------- |
vocabulary
|     |     |     | In practice,   |     | instead | of one hot    |
| --- | --- | --- | -------------- | --- | ------- | ------------- |
|     |     |     | representation |     | we use  | a pre-trained |
|     |     |     | word embedding |     | of the  | jth word      |
6/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     | Notice | that s is not computed | but |
| --- | --- | --- | --- | ------ | ---------------------- | --- |
0
| I am | at home | today | ⟨stop⟩   | just randomly | initialized   |           |
| ---- | ------- | ----- | -------- | ------------- | ------------- | --------- |
|      |         |       | yt =jjyt | (cid:0)1)     |               |           |
|      |         |       | P(yt     | 1 We learn    | it along with | the other |
|      |         |       |          | parameters    | of RNN (or    | LSTM or   |
| V V  | V       | V V   | V        |               |               |           |
GRU)
| W   | W W | W W |     | We will | return back to | this later |
| --- | --- | --- | --- | ------- | -------------- | ---------- |
st
s0
| U U | U   | U U | U   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
xt
| <GO> I | am at | home | today |     |     |     |
| ------ | ----- | ---- | ----- | --- | --- | --- |
7/63
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

s = (cid:27)(U x +Ws +b)s s~ = (cid:27)(W(o ⊙ s )+Ux +b) s~ = (cid:27)(W h +Ux +b)
| t   | t   | t(cid:0)1 | t t |         | t t(cid:0)1 | t    | t       | t(cid:0)1 | t   |
| --- | --- | --------- | --- | ------- | ----------- | ---- | ------- | --------- | --- |
| h   |     |           | s   | = i ⊙ s | +(1(cid:0)i | )⊙s~ | s = f ⊙ | s +i      | ⊙s~ |
| t   |     |           | t   | t       | t(cid:0)1   | t t  | t t     | t(cid:0)1 | t t |
⊙(cid:27)(s
| h t |     |     | h t |     |     |     | h t = o t | t ) |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- |
s = RNN( s t(cid:0)1 ;x ) s = GRU( s t(cid:0)1 ;x ) h ;s = LSTM( h t(cid:0)1 ;s t(cid:0)1 ;x )
| t   |     | t   |     | t   |     | t   | t t |     | t   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Before moving on we will see a compact way of writing the function computed
|     | by RNN, | GRU and   | LSTM      |       |         |     |     |     |     |
| --- | ------- | --------- | --------- | ----- | ------- | --- | --- | --- | --- |
|     | We will | use these | notations | going | forward |     |     |     |     |
8/63
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

|     |              |     |        |                 | So          | far | we have     | seen how | to model     | the |
| --- | ------------ | --- | ------ | --------------- | ----------- | --- | ----------- | -------- | ------------ | --- |
| A   | man throwing |     | ⟨stop⟩ |                 | conditional |     | probability |          | distribution |     |
|     |              | .   | . . yt | =jjyt (cid:0)1) |             | jyt | (cid:0)1)   |          |              |     |
|     |              |     |        | P(yt 1          | P(y         | t   |             |          |              |     |
1
|     |     |     |     |     | More | informally, |            | we  | have seen      | how |
| --- | --- | --- | --- | --- | ---- | ----------- | ---------- | --- | -------------- | --- |
| V   | V   | V   | V   |     |      |             |            |     |                |     |
|     |     |     |     |     | to   | generate    | a sentence |     | given previous |     |
words
| W   | W   | W.  | . .W |     |     |     |     |     |     |     |
| --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
st
s0
|     |     |     |     |     | What     |     | if we          | want      | to generate | a               |
| --- | --- | --- | --- | --- | -------- | --- | -------------- | --------- | ----------- | --------------- |
| U   | U   | U   | U   |     | sentence |     | given          | an image? |             |                 |
|     |     | .   | . . |     |          |     |                |           |             | jyt (cid:0)1;I) |
|     |     |     |     | xt  | We       | are | now interested |           | in P(y      |                 |
t 1
|      |       |     |      |     | instead |     | of P(y | jyt(cid:0)1) | where | I is an |
| ---- | ----- | --- | ---- | --- | ------- | --- | ------ | ------------ | ----- | ------- |
| <Go> | A man |     | park |     |         |     |        | t            |       |         |
1
image
|     | A   | man | throwing |     |        |     |          |                |     |         |
| --- | --- | --- | -------- | --- | ------ | --- | -------- | -------------- | --- | ------- |
|     |     |     |          |     | Notice |     | that P(y | jyt(cid:0)1;I) | is  | again a |
t
|     | a frisbee |     | in a park |     |             |     |              | 1   |     |     |
| --- | --------- | --- | --------- | --- | ----------- | --- | ------------ | --- | --- | --- |
|     |           |     |           |     | conditional |     | distribution |     |     |     |
9/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

jyt(cid:0)1)
|     |     |     |     |     |     | Earlier | we modeled |     | P(y t | as  |
| --- | --- | --- | --- | --- | --- | ------- | ---------- | --- | ----- | --- |
1
|     | A man | throwing |     | ⟨stop⟩         |             |     |       |           |         |     |
| --- | ----- | -------- | --- | -------------- | ----------- | --- | ----- | --------- | ------- | --- |
|     |       |          | . . | . yt P(yt=jjyt | (cid:0)1;I) |     | jyt   | (cid:0)1) | jjs     |     |
|     |       |          |     |                | 1           |     | P(y t | =         | P(y t = | t ) |
1
|     |     |     |      |     |     | Wheres   | wasastatecapturingallthe |       |       |                 |
| --- | --- | --- | ---- | --- | --- | -------- | ------------------------ | ----- | ----- | --------------- |
|     | V V |     | V    | V   |     |          | t                        |       |       |                 |
|     |     |     |      |     |     | previous | words                    |       |       |                 |
|     | W   | W   | W. . | .W  |     |          |                          |       |       |                 |
|     |     |     |      | st  |     | We could | now                      | model | P(y = | jjyt(cid:0)1;I) |
t
1
| s0 = fc7(I) |     |     |     |     |     | as P(y | = jjs  | ;f (I)) |                |     |
| ----------- | --- | --- | --- | --- | --- | ------ | ------ | ------- | -------------- | --- |
|             | U U |     | U   | U   |     |        | t      | t c7    |                |     |
|             |     |     |     |     |     | where  | fc (I) | is the  | representation |     |
|             |     |     | . . | .   |     |        | 7      |         |                |     |
xt
|     |     |     |     |     |     | obtained | from | the | fc layer | of an |
| --- | --- | --- | --- | --- | --- | -------- | ---- | --- | -------- | ----- |
7
|     | <GO> A | man |     | park |     |     |     |     |     |     |
| --- | ------ | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
image
CNN
10/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture16 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

| There are many | ways of making | P(y = j) conditional | on f (I) |
| -------------- | -------------- | -------------------- | -------- |
|                |                | t                    | c7       |
| Let us see two | such options   |                      |          |
11/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | -------------- | --------------------- | --------- |

|     | A man | throwing | ⟨stop⟩ |             |     |     |     |     |
| --- | ----- | -------- | ------ | ----------- | --- | --- | --- | --- |
|     |       | . .      | .      | (cid:0)1;I) |     |     |     |     |
yt P(yt=jjyt
1
|     | V V | V      | V   |        |     |             |                |      |
| --- | --- | ------ | --- | ------ | --- | ----------- | -------------- | ---- |
|     |     |        |     | Option |     | 1: Set      | s 0 = f c7 (I) |      |
|     | W   | W W. . | .W  | Now    | s   | and hence   | all subsequent | s ’s |
|     |     |        | sT  |        | 0   |             |                | t    |
|     |     |        |     | depend |     | on f c7 (I) |                |      |
s0 = fc7(I)
|     | U U | U   | U   |     |     |      |              |      |
| --- | --- | --- | --- | --- | --- | ---- | ------------ | ---- |
|     |     |     |     | We  | can | thus | say that P(y | = j) |
t
|     |     | . . | . xT | depends |     | on f | (I) |     |
| --- | --- | --- | ---- | ------- | --- | ---- | --- | --- |
c7
|     | <GO> | man | park | In  | other | words, | we are computing |     |
| --- | ---- | --- | ---- | --- | ----- | ------ | ---------------- | --- |
A
jjs
| CNN |     |     |     | P(y | =   | ;f (I)) |     |     |
| --- | --- | --- | --- | --- | --- | ------- | --- | --- |
|     |     |     |     |     | t   | t c7    |     |     |
Option 1
12/63
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|       |          |                  | Option       | 2:   | Another | more    | explicit |
| ----- | -------- | ---------------- | ------------ | ---- | ------- | ------- | -------- |
| A man | throwing | ⟨stop⟩           | way of doing | this | is to   | compute |          |
|       | .        | . . yt P(yt=jjyt | (cid:0)1;I)  |      |         |         |          |
1
|             |      |      | s =          | RNN(s   | t(cid:0)1 ;[x | ;f (I))]   |         |
| ----------- | ---- | ---- | ------------ | ------- | ------------- | ---------- | ------- |
|             |      |      | t            |         |               | t c7       |         |
| V V         | V    | V    |              |         |               |            |         |
|             |      |      | In other     | words   | we are        | explicitly | using   |
| W           | W W. | . .W | f (I) to     | compute | s and         | hence      |         |
|             |      | st   | c7           |         | t             |            |         |
|             |      |      | P(y = j)     |         |               |            |         |
| s0 = fc7(I) |      |      | t            |         |               |            |         |
| U U         | U    | U    |              |         |               |            |         |
|             |      |      | You could    | think   | of            | other      | ways of |
|             | .    | . .  |              |         |               |            |         |
|             |      | xt   | conditioning | P(y     | = j)          | on f       |         |
|             |      |      |              |         | t             | c7         |         |
| <GO> A      | man  | park |              |         |               |            |         |
CNN
Option 2
13/63
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture16 |     |     |     |
| --- | -------------- | --- | --------------------- | --------- | --- | --- | --- |

|         |     |     | Let          | us look at | the full |
| ------- | --- | --- | ------------ | ---------- | -------- |
| Decoder |     |     | architecture |            |          |
⟨stop⟩
| A man | throwing |                          | A CNN | is first used | to encode |
| ----- | -------- | ------------------------ | ----- | ------------- | --------- |
|       | . .      | .                        |       |               |           |
|       |          | yt P(yt=jjyt (cid:0)1;I) |       |               |           |
1 the image
|     |        |       | A RNN      | is then used | to decode |
| --- | ------ | ----- | ---------- | ------------ | --------- |
| V V | V      | V     |            |              |           |
|     |        |       | (generate) | a sentence   | from the  |
| W   | W W. . | .W st | encoding   |              |           |
|     |        |       | This       | is a typical | encoder   |
Encoder
| U U    | U   | U    |         |                |             |
| ------ | --- | ---- | ------- | -------------- | ----------- |
| h0     |     |      | decoder | architecture   |             |
|        | . . | .    |         |                |             |
|        |     | xt   | Both    | the encoder    | and decoder |
| <GO> A | man | park | use a   | neural network |             |
CNN
14/63
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |
| --- | -------------- | --------------------- | --- | --------- | --- |

|     |         |     |     |     | Let          | us look | at  | the full |
| --- | ------- | --- | --- | --- | ------------ | ------- | --- | -------- |
|     | Decoder |     |     |     | architecture |         |     |          |
⟨stop⟩
|     | A man | throwing |              |             | A CNN      | is first | used     | to encode |
| --- | ----- | -------- | ------------ | ----------- | ---------- | -------- | -------- | --------- |
|     |       | . .      | .            |             |            |          |          |           |
|     |       |          | yt P(yt=jjyt | (cid:0)1;I) |            |          |          |           |
|     |       |          |              | 1           | the image  |          |          |           |
|     |       |          |              |             | A RNN      | is then  | used     | to decode |
|     | V V   | V        | V            |             |            |          |          |           |
|     |       |          |              |             | (generate) | a        | sentence | from the  |
|     | W     | W W      | W st         |             | encoding   |          |          |           |
|     |       |          |              |             | This       | is a     | typical  | encoder   |
Encoder
|     | U U    | U   | U    |     |                |                |     |               |
| --- | ------ | --- | ---- | --- | -------------- | -------------- | --- | ------------- |
| h0  |        |     |      |     | decoder        | architecture   |     |               |
|     |        | . . | .    |     |                |                |     |               |
|     |        |     | xt   |     | Both           | the encoder    |     | and decoder   |
|     | <GO> A | man | park |     | use a          | neural network |     |               |
| CNN |        |     |      |     | Alternatively, |                | the | encoder’s     |
|     |        |     |      |     | output         | can be         | fed | to every step |
of the decoder
15/63
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

| Module | 16.2: Applications |     | of Encoder | Decoder | models |
| ------ | ------------------ | --- | ---------- | ------- | ------ |
16/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

For all these applications we will try to answer the following questions
What kind of a network can we use to encode the input(s)? (What is an
| appropriate | encoder?) |     |     |     |
| ----------- | --------- | --- | --- | --- |
What kind of a network can we use to decode the output? (What is an
| appropriate | decoder?)      |               |     |     |
| ----------- | -------------- | ------------- | --- | --- |
| What are    | the parameters | of the model  | ?   |     |
| What is     | an appropriate | loss function | ?   |     |
17/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     |     | Task: | Image | captioning |     |     |
| --- | --- | --- | --- | --- | ----- | ----- | ---------- | --- | --- |
(cid:0)1;fc7)
|     | Decod er |             | L t ((cid:18)) = (cid:0) l o gP (yt=jjyt | 1   |       | fx  |                | gN         |     |
| --- | -------- | ----------- | ---------------------------------------- | --- | ----- | --- | -------------- | ---------- | --- |
|     |          |             | . . .                                    |     | Data: | i   | =image i ; y i | =caption i | i=1 |
|     | A m      | an throwing | ⟨ st o p ⟩                               |     |       |     |                |            |     |
. . .
|     |     |     | yt P(yt | =jjyt (cid:0)1;fc7) | Model: |     |     |     |     |
| --- | --- | --- | ------- | ------------------- | ------ | --- | --- | --- | --- |
1
Encoder:
|     | V   | V V  | V       |     |     |     |          |     |     |
| --- | --- | ---- | ------- | --- | --- | --- | -------- | --- | --- |
|     |     |      |         |     |     |     | s =CNN(x | )   |     |
|     |     |      |         |     |     |     | 0        | i   |     |
|     | W   | W W. | . .W st |     |     |     |          |     |     |
Decoder:
Encoder
|     | U    | U U | U     |     |             |     |                           |                 |              |
| --- | ---- | --- | ----- | --- | ----------- | --- | ------------------------- | --------------- | ------------ |
| h0  |      |     |       |     |             |     | s =RNN(s                  | t(cid:0)1 ;e(^y | t(cid:0)1 )) |
|     |      |     | . . . |     |             |     | t                         |                 |              |
|     |      |     | xt    |     |             |     | jyt(cid:0)1;I)=softmax(Vs |                 |              |
|     |      |     |       |     |             | P(y |                           |                 | +b)          |
|     |      | man | park  |     |             |     | t 1                       |                 | t            |
|     | <GO> | A   |       |     |             |     |                           |                 |              |
| CNN |      |     |       |     | Parameters: |     | U , V,                    | W , W           | ;b           |
|     |      |     |       |     |             |     | dec                       | dec conv        |              |
Loss:
|     |     |     |     |     |     | ∑T  |     | ∑T  |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
=ℓjyt(cid:0)1;I)
|     |     |     |     |     | L((cid:18))= |     | L((cid:18)) =(cid:0) | logP(y  |       |
| --- | --- | --- | --- | --- | ------------ | --- | -------------------- | ------- | ----- |
|     |     |     |     |     |              |     | t                    |         | t t 1 |
|     |     |     |     |     |              | i=1 |                      | t=1     |       |
|     |     |     |     |     | Algorithm:   |     | Gradient             | descent | with  |
backpropagation
18/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

| o/p:           | Thegroundiswet |     |        |       |         |             |            |               |       |
| -------------- | -------------- | --- | ------ | ----- | ------- | ----------- | ---------- | ------------- | ----- |
|                |                |     |        | Task: | Textual |             | entailment |               |       |
| o/p:The ground | is             | wet | <STOP> |       | fx      |             |            | =hypothesisgN |       |
|                |                |     |        | Data: |         | i =premise; | i y        | i             | i i=1 |
|                |                |     |        | Model | (Option |             | 1):        |               |       |
Encoder:
|     |     |     | st  |     |     | h   | =RNN(h | ;x           | )   |
| --- | --- | --- | --- | --- | --- | --- | ------ | ------------ | --- |
|     |     |     |     |     |     | t   |        | t(cid:0)1 it |     |
Decoder:
| 1 0        | 0       | 1   | 0    |     |     |     |          |                 |              |
| ---------- | ------- | --- | ---- | --- | --- | --- | -------- | --------------- | ------------ |
| 0 0        | 0       | 0   | 1    |     |     |     | s =h     | (T is length    | of input)    |
| 0 1        | 0       | 0   | 0    |     |     |     | 0 T      |                 |              |
| 0 0        | 1       | 0   | 0    |     |     |     |          |                 |              |
| 0 0        | 0       | 0   | 0    |     |     |     | s =RNN(s | t(cid:0)1 ;e(^y | t(cid:0)1 )) |
| <G o> T he | gro und | i s | w et |     |     |     | t        |                 |              |
jyt(cid:0)1;x)=softmax(Vs
|     |     |     |     |             | P(y |     |      |         | +b)    |
| --- | --- | --- | --- | ----------- | --- | --- | ---- | ------- | ------ |
|     |     |     |     |             |     | t 1 |      |         | t      |
|     |     |     | ht  | Parameters: |     | U   | , V, | W , U   | , W ;b |
|     |     |     |     |             |     |     | dec  | dec enc | enc    |
Loss:
|     |     |     |     |     | ∑T  |     | ∑T  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jyt (cid:0)1;x)
| x1     | x2 x3              | x4      |     | L((cid:18))= |     | L ((cid:18))=(cid:0) |          | logP(y  | =ℓ   |
| ------ | ------------------ | ------- | --- | ------------ | --- | -------------------- | -------- | ------- | ---- |
|        |                    |         |     |              |     | t                    |          | t       | t 1  |
|        |                    |         |     |              | i=1 |                      | t=1      |         |      |
| i/p:It | is raining         | outside |     |              |     |                      |          |         |      |
| i/p:   | Itisrainingoutside |         |     | Algorithm:   |     |                      | Gradient | descent | with |
backpropagation
19/63
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

| o/p: Thegroundiswet |     |     |       |         |            |     |     |     |
| ------------------- | --- | --- | ----- | ------- | ---------- | --- | --- | --- |
|                     |     |     | Task: | Textual | entailment |     |     |     |
o/p:The ground is wet <STOP> Data: fx =premise ; y =hypothesis gN
|     |     |     |       | i       |     | i i | i   | i=1 |
| --- | --- | --- | ----- | ------- | --- | --- | --- | --- |
|     |     |     | Model | (Option | 2): |     |     |     |
Encoder:
|     |     |     |     |     | h =RNN(h | t(cid:0)1 | ;x ) |     |
| --- | --- | --- | --- | --- | -------- | --------- | ---- | --- |
|     |     | st  |     |     | t        |           | it   |     |
Decoder:
| 1 0 0           | 1   | 0   |             |                           | s 0 =h     | T (T     | is length of          | input)        |
| --------------- | --- | --- | ----------- | ------------------------- | ---------- | -------- | --------------------- | ------------- |
| 0 0 0           | 0   | 1   |             |                           |            |          |                       |               |
| 0 1 0           | 0   | 0   |             |                           |            |          |                       |               |
| 0 0 1           | 0   | 0   |             |                           | s t =RNN(s |          | t(cid:0)1 ;[h T ;e(^y | t(cid:0)1 )]) |
| 0 0 0           | 0   | 0   |             |                           |            |          |                       |               |
| <Go> The ground | is  | wet |             | jyt(cid:0)1;x)=softmax(Vs |            |          |                       |               |
|                 |     |     |             | P(y                       |            |          | +b)                   |               |
|                 |     |     |             | t                         | 1          |          | t                     |               |
|                 |     |     | Parameters: |                           | U dec ,    | V, W dec | , U enc , W enc       | ;b            |
ht
Loss:
|                         |                 |     |                 | ∑T  |                     | ∑T     |                  |     |
| ----------------------- | --------------- | --- | --------------- | --- | ------------------- | ------ | ---------------- | --- |
|                         |                 |     | L((cid:18))=    |     | L((cid:18))=(cid:0) | logP(y | =ℓjyt(cid:0)1;x) |     |
|                         |                 |     |                 |     | t                   |        | t t              | 1   |
| x1 x2                   | x3 x4           |     |                 |     |                     |        |                  |     |
|                         |                 |     |                 | i=1 |                     | t=1    |                  |     |
| i/p:It is               | raining outside |     | Algorithm:      |     | Gradient            |        | descent with     |     |
| i/p: Itisrainingoutside |                 |     | backpropagation |     |                     |        |                  |     |
20/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

o/p: Meingharjarahahoon
|          |      |     |      |      | Task: | Machine | translation |           |     |     |
| -------- | ---- | --- | ---- | ---- | ----- | ------- | ----------- | --------- | --- | --- |
| o/p:Mein | ghar | ja  | raha | hoon |       | fx      |             | =targetgN |     |     |
|          |      |     |      |      | Data: |         | i =source;  | i y i     | i   | i=1 |
|          |      |     |      |      | Model | (Option | 1):         |           |     |     |
Encoder:
|     |     |     |     | st  |     |     | h =RNN(h |           | ;x ) |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --------- | ---- | --- |
|     |     |     |     |     |     |     | t        | t(cid:0)1 | it   |     |
Decoder:
|     | 1 0      | 0     | 1   | 0     |     |     |          |     |                 |              |
| --- | -------- | ----- | --- | ----- | --- | --- | -------- | --- | --------------- | ------------ |
|     | 0 0      | 0     | 0   | 1     |     |     | s =h     | (T  | is length       | of input)    |
|     | 0 1      | 0     | 0   | 0     |     |     | 0        | T   |                 |              |
|     | 0 0      | 1     | 0   | 0     |     |     |          |     |                 |              |
|     | 0 0      | 0     | 0   | 0     |     |     | s =RNN(s |     | t(cid:0)1 ;e(^y | t(cid:0)1 )) |
| <G  | o> M ein | gh ar | j a | ra ha |     |     | t        |     |                 |              |
jyt(cid:0)1;x)=softmax(Vs
|     |     |     |     |     |             | P(y |     |      |     | +b)    |
| --- | --- | --- | --- | --- | ----------- | --- | --- | ---- | --- | ------ |
|     |     |     |     |     |             |     | t 1 |      | t   |        |
|     |     |     |     | ht  | Parameters: |     | U , | V, W | , U | , W ;b |
|     |     |     |     |     |             |     | dec | dec  | enc | enc    |
Loss:
|     |     |     |     |     |     | ∑T  |     | ∑T  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jyt (cid:0)1;x)
|     | x1    | x2 x3        | x4         |     | L((cid:18))= |     | L ((cid:18))=(cid:0) | logP(y |         | =ℓ   |
| --- | ----- | ------------ | ---------- | --- | ------------ | --- | -------------------- | ------ | ------- | ---- |
|     |       |              |            |     |              |     | t                    |        | t       | t 1  |
|     |       |              |            |     |              | i=1 |                      | t=1    |         |      |
|     | i/p:I | am           | going home |     |              |     |                      |        |         |      |
|     | i/p:  | Iamgoinghome |            |     | Algorithm:   |     | Gradient             |        | descent | with |
backpropagation
21/63
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

o/p: Meingharjarahahoon
|          |      |     |      |      | Task: | Machine | translation |           |     |     |
| -------- | ---- | --- | ---- | ---- | ----- | ------- | ----------- | --------- | --- | --- |
| o/pM:ein | ghar | ja  | raha | hoon |       | fx      |             | =targetgN |     |     |
|          |      |     |      |      | Data: |         | i =source;  | i y i     | i   | i=1 |
|          |      |     |      |      | Model | (Option | 2):         |           |     |     |
Encoder:
|     |     |     |     | st  |     |     | h =RNN(h |           | ;x ) |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --------- | ---- | --- |
|     |     |     |     |     |     |     | t        | t(cid:0)1 | it   |     |
Decoder:
|     | 1 0      | 0     | 1   | 0     |     |     |          |     |               |                     |
| --- | -------- | ----- | --- | ----- | --- | --- | -------- | --- | ------------- | ------------------- |
|     | 0 0      | 0     | 0   | 1     |     |     | s =h     | (T  | is length     | of input)           |
|     | 0 1      | 0     | 0   | 0     |     |     | 0        | T   |               |                     |
|     | 0 0      | 1     | 0   | 0     |     |     |          |     |               |                     |
|     | 0 0      | 0     | 0   | 0     |     |     | s =RNN(s |     | t(cid:0)1 ;[h | ;e(^y t(cid:0)1 )]) |
| <G  | o> M ein | gh ar | j a | ra ha |     |     | t        |     |               | T                   |
jyt(cid:0)1;x)=softmax(Vs
|     |     |     |     |     |             | P(y |     |      |     | +b)    |
| --- | --- | --- | --- | --- | ----------- | --- | --- | ---- | --- | ------ |
|     |     |     |     |     |             |     | t 1 |      | t   |        |
|     |     |     |     | ht  | Parameters: |     | U , | V, W | , U | , W ;b |
|     |     |     |     |     |             |     | dec | dec  | enc | enc    |
Loss:
|     |     |     |     |     |     | ∑T  |     | ∑T  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jyt (cid:0)1;x)
|     | x1    | x2 x3        | x4         |     | L((cid:18))= |     | L ((cid:18))=(cid:0) | logP(y |         | =ℓ   |
| --- | ----- | ------------ | ---------- | --- | ------------ | --- | -------------------- | ------ | ------- | ---- |
|     |       |              |            |     |              |     | t                    |        | t       | t 1  |
|     |       |              |            |     |              | i=1 |                      | t=1    |         |      |
|     | i/p:I | am           | going home |     |              |     |                      |        |         |      |
|     | i/p:  | Iamgoinghome |            |     | Algorithm:   |     | Gradient             |        | descent | with |
backpropagation
22/63
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

o/p:
|        |     | š ' @ i y | a   |       |                 |             |     |            |       |
| ------ | --- | --------- | --- | ----- | --------------- | ----------- | --- | ---------- | ----- |
|        |     |           |     | Task: | Transliteration |             |     |            |       |
| o/p: š |     |           |     |       | fx              |             |     | =tgtwordgN |       |
|        | ' @ | i         | y a | Data: |                 | i =srcword; | i y | i          | i i=1 |
|        |     |           |     | Model | (Option         |             | 1): |            |       |
Encoder:
|     |     |     | st  |     |     | h   | =RNN(h | ;x        | )   |
| --- | --- | --- | --- | --- | --- | --- | ------ | --------- | --- |
|     |     |     |     |     |     | t   |        | t(cid:0)1 | it  |
Decoder:
| 1    | 0 0 | 1   | 0 0 |             |     |                           |          |           |                    |
| ---- | --- | --- | --- | ----------- | --- | ------------------------- | -------- | --------- | ------------------ |
| 0    | 0 0 | 0   | 1 1 |             |     |                           | s =h     | (T is     | length of input)   |
| 0    | 1 0 | 0   | 0 0 |             |     |                           | 0 T      |           |                    |
| 0    | 0 1 | 0   | 0 0 |             |     |                           |          |           |                    |
| 0    | 0 0 | 0   | 0 0 |             |     |                           | s =RNN(s | t(cid:0)1 | ;e(^y t(cid:0)1 )) |
| <Go> | š   | @   | y   |             |     |                           | t        |           |                    |
|      | '   |     | i   |             |     | jyt(cid:0)1;x)=softmax(Vs |          |           |                    |
|      |     |     |     |             | P(y |                           |          |           | +b)                |
|      |     |     |     |             |     | t 1                       |          |           | t                  |
|      |     |     | ht  | Parameters: |     | U                         | , V,     | W , U     | , W ;b             |
|      |     |     |     |             |     |                           | dec      | dec       | enc enc            |
Loss:
|     |     |     |     |     | ∑T  |     | ∑T  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jyt (cid:0)1;x)
| x1    | x2   | x3 x4 | x5  | L((cid:18))= |     | L ((cid:18))=(cid:0) |          | logP(y  | =ℓ    |
| ----- | ---- | ----- | --- | ------------ | --- | -------------------- | -------- | ------- | ----- |
|       |      |       |     |              |     | t                    |          |         | t t 1 |
|       |      |       |     |              | i=1 |                      | t=1      |         |       |
| i/p:I | N    | D I   | A   |              |     |                      |          |         |       |
|       | i/p: | INDIA |     | Algorithm:   |     |                      | Gradient | descent | with  |
backpropagation
23/63
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

o/p:
|        |     | š ' @ i y | a   |       |                 |             |     |            |       |     |
| ------ | --- | --------- | --- | ----- | --------------- | ----------- | --- | ---------- | ----- | --- |
|        |     |           |     | Task: | Transliteration |             |     |            |       |     |
| o/p: š |     |           |     |       | fx              |             |     | =tgtwordgN |       |     |
|        | ' @ | i         | y a | Data: |                 | i =srcword; | i y | i          | i i=1 |     |
|        |     |           |     | Model | (Option         |             | 2): |            |       |     |
Encoder:
|     |     |     | st  |     |     | h   | =RNN(h | ;x        | )   |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | --------- | --- | --- |
|     |     |     |     |     |     | t   |        | t(cid:0)1 | it  |     |
Decoder:
| 1    | 0 0 | 1   | 0 0 |             |     |                           |          |           |                  |        |
| ---- | --- | --- | --- | ----------- | --- | ------------------------- | -------- | --------- | ---------------- | ------ |
| 0    | 0 0 | 0   | 1 1 |             |     |                           | s =h     | (T is     | length of        | input) |
| 0    | 1 0 | 0   | 0 0 |             |     |                           | 0 T      |           |                  |        |
| 0    | 0 1 | 0   | 0 0 |             |     |                           |          |           |                  |        |
| 0    | 0 0 | 0   | 0 0 |             |     |                           | s =RNN(s | t(cid:0)1 | ;[e(^y t(cid:0)1 | );h ]) |
| <Go> | š   | @   | y   |             |     |                           | t        |           |                  | T      |
|      | '   |     | i   |             |     | jyt(cid:0)1;x)=softmax(Vs |          |           |                  |        |
|      |     |     |     |             | P(y |                           |          |           | +b)              |        |
|      |     |     |     |             |     | t 1                       |          |           | t                |        |
|      |     |     | ht  | Parameters: |     | U                         | , V,     | W , U     | , W              | ;b     |
|      |     |     |     |             |     |                           | dec      | dec       | enc enc          |        |
Loss:
|     |     |     |     |     | ∑T  |     | ∑T  |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jyt (cid:0)1;x)
| x1    | x2   | x3 x4 | x5  | L((cid:18))= |     | L ((cid:18))=(cid:0) |          | logP(y  | =ℓ   |     |
| ----- | ---- | ----- | --- | ------------ | --- | -------------------- | -------- | ------- | ---- | --- |
|       |      |       |     |              |     | t                    |          |         | t t  | 1   |
|       |      |       |     |              | i=1 |                      | t=1      |         |      |     |
| i/p:I | N    | D I   | A   |              |     |                      |          |         |      |     |
|       | i/p: | INDIA |     | Algorithm:   |     |                      | Gradient | descent | with |     |
backpropagation
24/63
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- | --- |

O/p: White
|       | Task: | Image | Question | Answeing  |       |     |
| ----- | ----- | ----- | -------- | --------- | ----- | --- |
| White |       | fx    | =fI;qg;  | =AnswergN |       |     |
|       | Data: | i     |          | i y i     | i i=1 |     |
Model:
Encoder:
s
|     |     | h^ =CNN(I); |     | h~ =RNN(h~ |           | ;q ) |
| --- | --- | ----------- | --- | ---------- | --------- | ---- |
|     |     | I           |     | t          | t(cid:0)1 | it   |
~ht ^hI
s=[h~ ;h^
|     |     |     | T   | I ] |     |     |
| --- | --- | --- | --- | --- | --- | --- |
Decoder:
P(yjq;I)=softmax(Vs+b)
What is the bird’s color
|     | Parameters: |     | V,  | b, U , W , | W ;b |     |
| --- | ----------- | --- | --- | ---------- | ---- | --- |
|     |             |     |     | q q        | conv |     |
Loss:
L((cid:18))=(cid:0)logP(y=ℓjI;q)
CNN
|     | Algorithm: |     |     | Gradient | descent | with |
| --- | ---------- | --- | --- | -------- | ------- | ---- |
backpropagation
Question: What
isthebird’scolor
25/63
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |     | o/p:        | Indiawon |     |       |          |     |               |     |
| --- | --- | ----------- | -------- | --- | ----- | -------- | --- | ------------- | --- |
|     |     | theworldcup |          |     | Task: | Document |     | Summarization |     |
fx
o/p:India won the world cup <STOP> Data: i = Document i ; y i =
SummarygN
i i=1
Model:
Encoder:
st
|     |     |     |     |     |     |     | h =RNN(h |           | ;x ) |
| --- | --- | --- | --- | --- | --- | --- | -------- | --------- | ---- |
|     |     |     |     |     |     |     | t        | t(cid:0)1 | it   |
Decoder:
|     | 1   | 0 0 | 1   | 0 0 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | 0   | 0 0 | 0   | 1 1 |     |     |     |     |     |
|     | 0   | 1 0 | 0   | 0 0 |     |     | s   | =h  |     |
|     | 0   | 0 1 | 0   | 0 0 |     |     |     | 0 T |     |
|     | 0   | 0 0 | 0   | 0 0 |     |     |     |     |     |
<Go> India won the world cup s =RNN(s t(cid:0)1 ;e(^y t(cid:0)1 ))
t
|     |     |     |           | c   |     | P(y | jyt(cid:0)1;x)=softmax(Vs |     | +b) |
| --- | --- | --- | --------- | --- | --- | --- | ------------------------- | --- | --- |
|     |     |     |           |     |     |     | t 1                       |     | t   |
|     |     |     | . . . . . | .   |     |     |                           |     |     |
ht
|     |     |     |     |     | Parameters: |     | U   | , V, W | , U , W ;b |
| --- | --- | --- | --- | --- | ----------- | --- | --- | ------ | ---------- |
|     |     |     |     |     |             |     | dec | dec    | enc enc    |
Loss:
|     |     |     | . . . . . | .   |     | ∑T  |     | ∑T  |     |
| --- | --- | --- | --------- | --- | --- | --- | --- | --- | --- |
=ℓjyt(cid:0)1;x)
|     |           |                |           |              | L((cid:18))= |     | L((cid:18))=(cid:0) | logP(y |              |
| --- | --------- | -------------- | --------- | ------------ | ------------ | --- | ------------------- | ------ | ------------ |
|     |           |                | . . . . . | .            |              |     | t                   |        | t t 1        |
|     | i/pI:ndia | beats          |           | Srilanka     |              |     |                     |        |              |
|     |           |                |           |              |              | i=1 |                     | t=1    |              |
| i/p | : India   | beats Srilanka | to win    | ICC WC 2011. |              |     |                     |        |              |
|     |           |                |           |              | Algorithm:   |     | Gradient            |        | descent with |
DhoniandGambhir’shalfcenturieshelpbeatSL
backpropagation 26/63
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

oA/p:mAanmwaanlkiwngalkoinngonaarorpoepe
|     |     |     | Task: | Video     | Captioning |       |
| --- | --- | --- | ----- | --------- | ---------- | ----- |
|     |     |     |       | fx        | =descgN    |       |
|     |     |     | Data: | i =video; | i y i      | i i=1 |
Model:
Encoder:
|     |     |     |     | h   | =RNN(h    | ;CNN(x )) |
| --- | --- | --- | --- | --- | --------- | --------- |
|     |     |     |     | t   | t(cid:0)1 | it        |
Decoder:
|     |       |     |     |     | s =h     |                              |
| --- | ----- | --- | --- | --- | -------- | ---------------------------- |
|     |       |     |     |     | 0 T      |                              |
|     |       |     |     |     | s =RNN(s | t(cid:0)1 ;e(^y t(cid:0)1 )) |
|     | . . . |     |     |     | t        |                              |
jyt(cid:0)1;x)=softmax(Vs
|     |       |     |             | P(y |             | +b)      |
| --- | ----- | --- | ----------- | --- | ----------- | -------- |
|     |       |     |             | t   | 1           | t        |
|     |       |     | Parameters: |     | U ,W ,V,b,W | ,U ,     |
|     | . . . |     |             |     | dec dec     | conv enc |
|     |       |     | W           | ;b  |             |          |
enc
Loss:
. . .
| CNN CNN |     | CNN |     | ∑T  | ∑T  |     |
| ------- | --- | --- | --- | --- | --- | --- |
=ℓjyt(cid:0)1;x)
|     |          |     | L((cid:18))= | L((cid:18))=(cid:0) | logP(y   |              |
| --- | -------- | --- | ------------ | ------------------- | -------- | ------------ |
|     |          |     |              |                     | t        | t t 1        |
|     | .. .. .. |     |              | i=1                 | t=1      |              |
|     |          |     | Algorithm:   |                     | Gradient | descent with |
backpropagation 27/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

o/p: SuryaNamaskar
|               | Task: | Video | Classification |             |       |
| ------------- | ----- | ----- | -------------- | ----------- | ----- |
| Suryanamaskar |       | fx    |                | =ActivitygN |       |
|               | Data: | i     | =Video;        | i y i       | i i=1 |
Model:
Encoder:
|     |     |     | h =RNN(h | ;CNN(x    | ))  |
| --- | --- | --- | -------- | --------- | --- |
|     |     |     | t        | t(cid:0)1 | it  |
. . .
Decoder:
s=h
T
| . . . |             |     | P(yjI)=softmax(Vs+b) |            |                |
| ----- | ----------- | --- | -------------------- | ---------- | -------------- |
|       | Parameters: |     | V, b,                | W conv , U | enc , W enc ;b |
. . .
CNN CNN CNN
Loss:
L((cid:18))=(cid:0)logP(y=ℓjVideo)
.. .. ..
|     | Algorithm: |     | Gradient |     | descent with |
| --- | ---------- | --- | -------- | --- | ------------ |
backpropagation
28/63
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

| o/p:I oam/p: | Ifinaem<fiSnTOeP> |     |       |     |        |     |     |
| ------------ | ----------------- | --- | ----- | --- | ------ | --- | --- |
|              |                   |     | Task: |     | Dialog |     |     |
fx
|     |     |     | Data: |     | i = Utterance; | i   | y i = |
| --- | --- | --- | ----- | --- | -------------- | --- | ----- |
ResponsegN
i i=1
Model:
st
Encoder:
|        |     |      |     |          | h =RNN(h | ;x )            |              |
| ------ | --- | ---- | --- | -------- | -------- | --------------- | ------------ |
|        |     |      |     |          | t        | t(cid:0)1 it    |              |
| 1 0    | 0   | 1    |     |          |          |                 |              |
| 0 0    | 0   | 0    |     | Decoder: |          |                 |              |
| 0 1    | 0   | 0    |     |          |          |                 |              |
| 0 0    | 1   | 0    |     |          |          |                 |              |
| 0 0    | 0   | 0    |     |          | s =h     | (T is length    | of input)    |
|        | am  |      |     |          | 0 T      |                 |              |
| <Go> I |     | fine |     |          |          |                 |              |
|        |     |      |     |          | s =RNN(s | t(cid:0)1 ;e(^y | t(cid:0)1 )) |
t
c
|     |     |     |     | P(y | jyt(cid:0)1;x)=softmax(Vs |     | +b) |
| --- | --- | --- | --- | --- | ------------------------- | --- | --- |
|     |     |     |     |     | t 1                       | t   |     |
ht
|     |     |     | Parameters: |     | U , V, | W , U   | , W , b |
| --- | --- | --- | ----------- | --- | ------ | ------- | ------- |
|     |     |     |             |     | dec    | dec enc | enc     |
Loss:
|         |         |     |                 |     | ∑T ∑T               |         |                  |
| ------- | ------- | --- | --------------- | --- | ------------------- | ------- | ---------------- |
| x1 x2   | x3      |     |                 |     |                     |         | =ℓjyt(cid:0)1;x) |
|         |         |     | L((cid:18))=    |     | L((cid:18))=(cid:0) | logP(y  |                  |
|         |         |     |                 |     | t                   | t       | t 1              |
| i/p:How | are you |     |                 |     |                     |         |                  |
|         |         |     |                 |     | i=1 t=1             |         |                  |
|         |         |     | Algorithm:      |     | Gradient            | descent | with             |
| i/p:    | How are | you | backpropagation |     |                     |         |                  |
29/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

And the list continues ...
Try picking a problem from your domain and see if you can model it using the
encoder decoder paradigm
Encoder decoder models can be made even more expressive by adding an
“attention” mechanism
We will first motivate the need for this and then explain how to model it
30/63
MiteshM.Khapra CS7015(DeepLearning): Lecture16

| Module | 16.3: Attention | Mechanism |     |
| ------ | --------------- | --------- | --- |
31/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | -------------- | --------------------- | --------- |

Letusmotivatethetaskofattentionwith
| o/p: Iamgoinghome |     | the help | of MT |     |     |
| ----------------- | --- | -------- | ----- | --- | --- |
Theencoderreadsthesentencesonlyonce
| o/p:I am going home <STOP> |     |             |            |                  |      |
| -------------------------- | --- | ----------- | ---------- | ---------------- | ---- |
|                            |     | and encodes | it         |                  |      |
|                            |     | At each     | timestep   | the decoder uses | this |
|                            |     | embedding   | to produce | a new word       |      |
si
|     |     | Is this how | humans | translate a sentence | ?   |
| --- | --- | ----------- | ------ | -------------------- | --- |
Not really!
| 1 0 0 1         | 0    |     |     |     |     |
| --------------- | ---- | --- | --- | --- | --- |
| 0 0 0 0         | 1    |     |     |     |     |
| 0 0 1 0 0 1 0 0 | 0 0  |     |     |     |     |
| 0 0 0 0         | 0    |     |     |     |     |
| <Go> I am going | home |     |     |     |     |
c
hi
| x1 x2 x3 x4           | x5   |     |     |     |     |
| --------------------- | ---- | --- | --- | --- | --- |
| i/pM:ain ghar ja raha | hoon |     |     |     |     |
i/p: Maingharjarahahoon
32/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |
Option2

|         |               |     | Humans                           | try to produce | each word | in  |
| ------- | ------------- | --- | -------------------------------- | -------------- | --------- | --- |
| o/p : I | am going home |     | theoutputbyfocusingonlyoncertain |                |           |     |
| t : [ 1 | 0 0 0 0 ]     |     | words in                         | the input      |           |     |
1
| t 2 : [ 0 | 0 0 0 1 ]     |     | Essentiallyateachtimestepwecome |                |        |       |
| --------- | ------------- | --- | ------------------------------- | -------------- | ------ | ----- |
| t : [ 0   | 0 0.5 0.5 0 ] |     |                                 |                |        |       |
| 3         |               |     | up with                         | a distribution | on the | input |
| t : [ 0   | 1 0 0 0 ]     |     | words                           |                |        |       |
4
|            |              |      | This distribution | tells             | us how      | much  |
| ---------- | ------------ | ---- | ----------------- | ----------------- | ----------- | ----- |
| i/p : Main | ghar ja raha | hoon |                   |                   |             |       |
|            |              |      | attention         | to pay to         | each input  | words |
|            |              |      | at each           | time step         |             |       |
|            |              |      | Ideally,          | at each time-step | we should   |       |
|            |              |      | feed only         | this relevant     | information |       |
|            |              |      | (i.e. encodings   | of relevant       | words)      | to    |
|            |              |      | the decoder       |                   |             |       |
33/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|                   |             |     | Let us       | revisit the decoder | that we have |
| ----------------- | ----------- | --- | ------------ | ------------------- | ------------ |
| o/p: Iamgoinghome |             |     | seen so      | far                 |              |
|                   |             |     | We either    | feed in the encoder | information  |
| o/p:I am going    | home <STOP> |     |              |                     |              |
|                   |             |     | only once(at | s )                 |              |
0
|     |     |     | Or we feed | the same encoder | information |
| --- | --- | --- | ---------- | ---------------- | ----------- |
|     |     |     | at each    | time step        |             |
si
|         |          |      | Now suppose                       | an oracle       | told you which    |
| ------- | -------- | ---- | --------------------------------- | --------------- | ----------------- |
|         |          |      | words to                          | focus on at a   | given time-step t |
| 1 0     | 0 1      | 0    |                                   |                 |                   |
| 0 0     | 0 0      | 1    |                                   |                 |                   |
| 0 0 1 0 | 0 1 0 0  | 0 0  | Canyouthinkofasmarterwayoffeeding |                 |                   |
| 0 0     | 0 0      | 0    |                                   |                 |                   |
| <Go> I  | am going | home | information                       | to the decoder? |                   |
c
hi
| x1 x2         | x3 x4   | x5   |     |     |     |
| ------------- | ------- | ---- | --- | --- | --- |
| i/pM:ain ghar | ja raha | hoon |     |     |     |
i/p: Maingharjarahahoon
34/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |
Option2

|         |             |     | We could                              | just take         | a weighted  | average |
| ------- | ----------- | --- | ------------------------------------- | ----------------- | ----------- | ------- |
| am      | going       |     | ofthecorrespondingwordrepresentations |                   |             |         |
| o/p:I   | home <STOP> |     |                                       |                   |             |         |
|         |             |     | and feed                              | it to the decoder |             |         |
|         |             |     | For example                           | at timestep       | 3,          | we can  |
|         |             |     | just take                             | a weighted        | average     | of the  |
|         |             |     | representations                       | of ‘ja’           | and ‘raha’  |         |
|         |             |     | Intuitively                           | this should       | work        | better  |
| 1 0 0 0 | 0 0 1 0     | 0 1 |                                       |                   |             |         |
| 0 1     | 0 0         | 0   | because                               | we are not        | overloading | the     |
| 0 0     | 1 0         | 0   |                                       |                   |             |         |
| 0 0     | 0 0         | 0   |                                       |                   |             |         |
|         | am going    |     | decoder                               | with irrelevant   | information |         |
| <Go>    | I home      |     |                                       |                   |             |         |
|         |             |     | (about                                | words that do     | not matter  | at this |
| +       | c2+ c3+ c4+ | c5  |                                       |                   |             |         |
time step)
(cid:11)(cid:11)11;;32 (cid:11)(cid:11)(cid:11)(cid:11)2211;;;;3245(cid:11)(cid:11)32;;24(cid:11)(cid:11)(cid:11)343;;;324(cid:11)2;5(cid:11)(cid:11)(cid:11)(cid:11)4543;;;;3245(cid:11)4;5(cid:11)(cid:11)55;;34(cid:11)5;5
|     |     |     | How do | we convert | this intuition | into a |
| --- | --- | --- | ------ | ---------- | -------------- | ------ |
hi
model ?
| x1       | x2 x3 x4     | x5   |     |     |     |     |
| -------- | ------------ | ---- | --- | --- | --- | --- |
| i/p:Main | ghar ja raha | hoon |     |     |     |     |
35/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

Ofcourseinpracticewewillnothavethis
| am    | going |             |     | oracle      |           |          |      |      |
| ----- | ----- | ----------- | --- | ----------- | --------- | -------- | ---- | ---- |
| o/p:I |       | home <STOP> |     |             |           |          |      |      |
|       |       |             |     | The machine | will have | to learn | this | from |
the data
|         |     |     |     | To enable     | this we define | a function     |     |     |
| ------- | --- | --- | --- | ------------- | -------------- | -------------- | --- | --- |
|         |     |     |     |               | e = f (s       | ;c             | )   |     |
|         |     |     |     |               | jt ATT         | t(cid:0)1 j    |     |     |
| 1 0 0 0 | 0 0 | 1 0 | 0 1 |               |                |                |     |     |
| 0 1     | 0   | 0   | 0   |               |                |                |     |     |
| 0 0     | 1   | 0   | 0   |               |                |                |     |     |
| 0 0     | 0   | 0   | 0   | This quantity | captures       | the importance |     | of  |
am going
| <Go> I      |                         | home        |             | jth         |          |          |       | tth  |
| ----------- | ----------------------- | ----------- | ----------- | ----------- | -------- | -------- | ----- | ---- |
|             |                         |             |             | the input   | word for | decoding | the   |      |
|             | +                       | ct          |             | output word | (we will | see the  | exact | form |
| (cid:11)1;2 | (cid:11)2;2 (cid:11)3;2 | (cid:11)4;2 | (cid:11)5;2 | of f later) |          |          |       |      |
ATT
|     |     |     | hi  | We can normalize | these    | weights | by  | using |
| --- | --- | --- | --- | ---------------- | -------- | ------- | --- | ----- |
|     |     |     |     | the softmax      | function |         |     |       |
|     |     |     |     |                  | exp(e    | )       |     |       |
jt
(cid:11) =
jt ∑M
| x1  | x2 x3 | x4  | x4  |     |       |     |     |     |
| --- | ----- | --- | --- | --- | ----- | --- | --- | --- |
|     |       |     |     |     | exp(e | )   |     |     |
jt
| i/p:Main | ghar | ja raha | hoon           |                       |           |     |     |       |
| -------- | ---- | ------- | -------------- | --------------------- | --------- | --- | --- | ----- |
|          |      |         |                |                       | j=1       |     |     | 36/63 |
|          |      |         | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |       |

| am    | going |        |     |            | exp(e | )   |     |
| ----- | ----- | ------ | --- | ---------- | ----- | --- | --- |
| o/p:I | home  | <STOP> |     | (cid:11) = |       | jt  |     |
jt ∑M
exp(e )
jt
j=1
|         |     |         | (cid:11) jt denotes | the  | probability | of focusing | on     |
| ------- | --- | ------- | ------------------- | ---- | ----------- | ----------- | ------ |
|         |     |         | the jth             | word | to produce  | the tth     | output |
| 1 0 0 0 | 0 0 | 1 0 0 1 |                     |      |             |             |        |
| 0 1     | 0   | 0 0     |                     |      |             |             |        |
| 0 0     | 1   | 0 0     | word                |      |             |             |        |
| 0 0     | 0   | 0 0     |                     |      |             |             |        |
am going
| <Go> I |      | home | Wearenowtryingtolearnthe(cid:11)’sinstead |                  |     |          |                |
| ------ | ---- | ---- | ----------------------------------------- | ---------------- | --- | -------- | -------------- |
|        | + ct |      | of an                                     | oracle informing |     | us about | the (cid:11)’s |
(cid:11)1;2 (cid:11)2;2 (cid:11)3;2 (cid:11)4;2 (cid:11)5;2 Learning would always involve some
parameters
hi
|          |         |           | So let’s | define | a parametric | form | for (cid:11)’s |
| -------- | ------- | --------- | -------- | ------ | ------------ | ---- | -------------- |
| x1       | x2 x3   | x4 x4     |          |        |              |      |                |
| i/p:Main | ghar ja | raha hoon |          |        |              |      |                |
37/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|       |          |             |     | From                           | now     | on    | we will | refer | to the | decoder   |
| ----- | -------- | ----------- | --- | ------------------------------ | ------- | ----- | ------- | ----- | ------ | --------- |
|       | am going |             |     | RNN’sstateatthet-thtimestepass |         |       |         |       |        | and       |
| o/p:I |          | home <STOP> |     |                                |         |       |         |       |        | t         |
|       |          |             |     | the                            | encoder | RNN’s |         | state | at the | j-th time |
step as c
j
|     |     |     |     | Given |     | these new | notations, |     | one  | (among |
| --- | --- | --- | --- | ----- | --- | --------- | ---------- | --- | ---- | ------ |
|     |     |     |     | many) |     | possible  | choice     | for | f is |        |
ATT
| 0 1  | 0 0 | 0 0 0 1  | 1 0 |            | e   | = VT       | tanh(U        | s             | +W        | c )            |
| ---- | --- | -------- | --- | ---------- | --- | ---------- | ------------- | ------------- | --------- | -------------- |
| 0    | 1   | 0 0      | 0   |            | jt  | att        |               | att t(cid:0)1 |           | att j          |
| 0    | 0   | 1 0      | 0   |            |     |            |               |               |           |                |
| 0    | 0   | 0 0      | 0   |            |     |            |               |               |           |                |
|      |     | am going |     |            |     |            |               |               |           |                |
| <Go> | I   | home     |     | V          | 2   | Rd , U     | 2 Rd(cid:2)d, | W             | 2         | Rd(cid:2)d are |
|      |     |          |     |            | att |            | att           |               | att       |                |
|      |     | + ct     |     | additional |     | parameters |               | of            | the model |                |
(cid:11)1;2 (cid:11)2;2 (cid:11)3;2 (cid:11)4;2 (cid:11)5;2 These parameters will be learned along
|     |     |     |     | with | the | other | parameters |     | of the | encoder |
| --- | --- | --- | --- | ---- | --- | ----- | ---------- | --- | ------ | ------- |
hi
and decoder
|          | x1 x2 | x3 x4   | x4   |     |     |     |     |     |     |     |
| -------- | ----- | ------- | ---- | --- | --- | --- | --- | --- | --- | --- |
| i/p:Main | ghar  | ja raha | hoon |     |     |     |     |     |     |     |
38/63
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture16 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|       |             |     | Wait a     | minute !   |                        |          |
| ----- | ----------- | --- | ---------- | ---------- | ---------------------- | -------- |
| am    | going       |     |            |            |                        |          |
| o/p:I | home <STOP> |     | This model | would make | a lot of               | sense if |
|       |             |     | were given | the true   | (cid:11)’s at training | time     |
(cid:11)true = [0;0;0:5;0:5;0]
tj
(cid:11)pred
| 1 0 0 0 | 0 0 1 0 | 0 1 |     | = [0:1;0:1;0:35;0:35;0:1] |     |     |
| ------- | ------- | --- | --- | ------------------------- | --- | --- |
| 0 1     | 0 0     | 0   |     | tj                        |     |     |
| 0 0     | 1 0     | 0   |     |                           |     |     |
| 0 0     | 0 0     | 0   |     |                           |     |     |
am going
<Go> I home We could then minimize L((cid:11)true;(cid:11)pred)
L((cid:18))
|     | + ct |     | in addition | to  | as defined | earlier |
| --- | ---- | --- | ----------- | --- | ---------- | ------- |
(cid:11)1;2 (cid:11)2;2 (cid:11)3;2 (cid:11)4;2 (cid:11)5;2 But in practice it is very hard to get (cid:11)true
hi
| x1       | x2 x3 x4     | x4   |     |     |     |     |
| -------- | ------------ | ---- | --- | --- | --- | --- |
| i/p:Main | ghar ja raha | hoon |     |     |     |     |
39/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|                   |     | For example, |         | in our translation |       | example     |
| ----------------- | --- | ------------ | ------- | ------------------ | ----- | ----------- |
| am going          |     | we would     | want    | someone            | to    | manually    |
| o/p:I home <STOP> |     |              |         |                    |       |             |
|                   |     | annotate     | the     | source             | words | which       |
|                   |     | contribute   | to      | every target       | word  |             |
|                   |     | It is hard   | to get  | such annotated     |       | data        |
|                   |     | Then how     | would   | this               | model | work in the |
|                   |     | absence      | of such | data ?             |       |             |
| 1 0 0 0 0 0 1 0   | 0 1 |              |         |                    |       |             |
| 0 1 0 0           | 0   |              |         |                    |       |             |
| 0 0 1 0           | 0   |              |         |                    |       |             |
| 0 0 0 0           | 0   |              |         |                    |       |             |
am going
| <Go> I home |     |     |     |     |     |     |
| ----------- | --- | --- | --- | --- | --- | --- |
+ ct
| (cid:11)1;2 (cid:11)2;2 (cid:11)3;2 (cid:11)4;2 | (cid:11)5;2 |     |     |     |     |     |
| ----------------------------------------------- | ----------- | --- | --- | --- | --- | --- |
hi
| x1 x2 x3 x4           | x4   |     |     |     |     |     |
| --------------------- | ---- | --- | --- | --- | --- | --- |
| i/p:Main ghar ja raha | hoon |     |     |     |     |     |
40/63
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|         |       |             |     | It works     | because     | it        | is a better | modeling     |
| ------- | ----- | ----------- | --- | ------------ | ----------- | --------- | ----------- | ------------ |
| am      | going |             |     | choice       |             |           |             |              |
| o/p:I   |       | home <STOP> |     |              |             |           |             |              |
|         |       |             |     | This is a    | more        | informed  | model       |              |
|         |       |             |     | We are       | essentially | asking    | the         | model to     |
|         |       |             |     | approach     | the         | problem   | in a        | better (more |
|         |       |             |     | natural)     | way         |           |             |              |
|         |       |             |     | Given enough |             | data      | it should   | be able      |
| 1 0 0 0 | 0 0   | 1 0         | 0 1 |              |             |           |             |              |
| 0 1     | 0     | 0           | 0   |              |             |           |             |              |
| 0 0     | 1     | 0           | 0   | to learn     | these       | attention | weights     | just as      |
| 0 0     | 0     | 0           | 0   |              |             |           |             |              |
am going
| <Go> I      |                         | home        |             | humans          | do   |        |       |             |
| ----------- | ----------------------- | ----------- | ----------- | --------------- | ---- | ------ | ----- | ----------- |
|             | +                       | ct          |             | That’s the      | hope | (and   | hope  | is a good   |
| (cid:11)1;2 | (cid:11)2;2 (cid:11)3;2 | (cid:11)4;2 | (cid:11)5;2 | thing)          |      |        |       |             |
|             |                         |             |             | And in practice |      | indeed | these | models work |
hi
|     |     |     |     | better than | the | vanilla | encoder | decoder |
| --- | --- | --- | --- | ----------- | --- | ------- | ------- | ------- |
models
| x1       | x2 x3 | x4      | x4   |     |     |     |     |     |
| -------- | ----- | ------- | ---- | --- | --- | --- | --- | --- |
| i/p:Main | ghar  | ja raha | hoon |     |     |     |     |     |
41/63
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Let us revisit the MT model that we saw earlier and answer the same set of
questions again (data, encoder, decoder, loss, training algorithm)
42/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| -------------- | --------------------- | --------- |

| o/p:I am | going home | <STOP> |     |               |             |           |       |     |
| -------- | ---------- | ------ | --- | ------------- | ----------- | --------- | ----- | --- |
|          |            |        |     | Task: Machine | Translation |           |       |     |
|          |            |        |     | fx            |             | =targetgN |       |     |
|          |            |        |     | Data: i       | =source;    | i y i     | i i=1 |     |
Encoder:
|     |     |     |     |     | h =RNN(h | ;x        | )   |     |
| --- | --- | --- | --- | --- | -------- | --------- | --- | --- |
|     |     |     |     |     | t        | t(cid:0)1 | t   |     |
s =h
0 T
| 1 0    | 0 1      | 0      |     | Decoder:            |        |        |        |     |
| ------ | -------- | ------ | --- | ------------------- | ------ | ------ | ------ | --- |
| 0 0    | 0 0      | 1      |     |                     |        |        |        |     |
| 0 1    | 0 0      | 0      |     |                     |        |        |        |     |
| 0 0    | 1 0      | 0      |     | e =VT               | tanh(U | h      | +W s   | )   |
| 0 0    | 0 0      | 0      |     | jt                  | attn   | attn j | attn t |     |
| <Go> I | am going | home   |     |                     |        |        |        |     |
|        |          |        |     | (cid:11) =softmax(e |        | )      |        |     |
|        |          |        |     | jt                  |        | jt     |        |     |
|        | c2+ c3+  | c4+ c5 |     |                     |        |        |        |     |
| +      |          |        |     |                     | ∑T     |        |        |     |
(cid:11)(cid:11)11;;32 (cid:11)(cid:11)(cid:11)(cid:11)2211;;;;3245(cid:11)(cid:11)32;;24(cid:11)(cid:11)(cid:11)343;;;324(cid:11)2;5(cid:11)(cid:11)(cid:11)(cid:11)4543;;;;3245(cid:11)4;5(cid:11)(cid:11)55;;34(cid:11)5;5 c t = (cid:11) jt h j
j=1
|               |         | hi   |     | s =RNN(s      |           | ;[e(^y              | );c ])  |      |
| ------------- | ------- | ---- | --- | ------------- | --------- | ------------------- | ------- | ---- |
|               |         |      |     | t             |           | t(cid:0)1 t(cid:0)1 | t       |      |
|               |         |      |     | ℓ =softmax(Vs |           | +b)                 |         |      |
|               |         |      |     | t             |           | t                   |         |      |
| x1 x2         | x3 x4   | x5   |     | Parameters:   | U         | , V, W              | , U , W | , b, |
|               |         |      |     |               | dec       | dec                 | enc     | enc  |
|               |         |      |     | U , V         |           |                     |         |      |
| i/p:Main ghar | ja raha | hoon |     | attn attn     |           |                     |         |      |
|               |         |      |     | Loss and      | Algorithm | remains             | same    |      |
43/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

You can try adding an attention component to all the other encoder decoder
models that we discussed earlier and answer the same set of questions (data,
| encoder, decoder, | loss, training | algorithm) |
| ----------------- | -------------- | ---------- |
44/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| -------------- | --------------------- | --------- |

Can we check if the attention model actually learns something meaningful ?
In other words does it really learn to focus on the most relevant words in the
| input at | the t-th timestep | ?   |     |     |
| -------- | ----------------- | --- | --- | --- |
We can check this by plotting the attention weights as a heatmap (we will see
| some examples | on the | next slide) |     |     |
| ------------- | ------ | ----------- | --- | --- |
45/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | --- | -------------- | --------------------- | --------- |

Figure: Example output of attention-based Figure: Example output of attention-based
|               |              |               | neural machine | translation | model [Cho | et al. |
| ------------- | ------------ | ------------- | -------------- | ----------- | ---------- | ------ |
| summarization | system [Rush | et al. 2015.] |                |             |            |        |
2015].
The heat map shows a soft alignment between the input and the generated
output.
Each cell in the heat mapsssss corresponds to (cid:11) (i.e., the importance of the
tj
jth input word for predicting the tth output word as determined by the model)
46/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

Figure: Example output of attention-based video captioning system [Yao et al. 2015.] 47/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| -------------- | --------------------- | --------- |

| Module | 16.4: Attention | over | images |
| ------ | --------------- | ---- | ------ |
48/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | -------------- | --------------------- | --------- |

Howdowemodelanattentionmechanism
for images?
A man throwing
a frisbee in a park
49/63
MiteshM.Khapra CS7015(DeepLearning): Lecture16

Howdowemodelanattentionmechanism
ja for images?
o/pm:ain ghar raha hoon <STOP>
|     | In the case    | of text        | we have  | a     |
| --- | -------------- | -------------- | -------- | ----- |
|     | representation | for every      | location | (time |
|     | step) of the   | input sequence |          |       |
hi
1 0 0 0 0 0 1 0 0 1 0 1
0 1 0 0 0 0
0 0 1 0 0 0
0 0 0 0 0 0
ghar ja
<Go> main raha hoon
+ ct
(cid:11)1 (cid:11)2 (cid:11)3 (cid:11)4
hi
x1 x2 x3 x4
i/p:I am going home
50/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Howdowemodelanattentionmechanism
| Encoder |     | for images?    |                    |          |       |
| ------- | --- | -------------- | ------------------ | -------- | ----- |
| h0      |     | In the         | case of text       | we have  | a     |
|         |     | representation | for every          | location | (time |
|         |     | step) of       | the input sequence |          |       |
CNN
|     |     | But for                   | images we   | typically   | use   |
| --- | --- | ------------------------- | ----------- | ----------- | ----- |
|     |     | representation            | from        | one of the  | fully |
|     |     | connected                 | layers      |             |       |
|     |     | This representation       | does        | not contain | any   |
|     |     | location                  | information |             |       |
|     |     | Sothenwhatistheinputtothe |             | attention   |       |
mechanism?
51/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

Well,insteadofthefc7representationwe
|     |     |     |     |     | use the output | of one of       | the convolution |
| --- | --- | --- | --- | --- | -------------- | --------------- | --------------- |
|     |     |     |     |     | layers which   | has spatial     | information     |
|     |     |     |     |     | For example    | the output      | of the 5th      |
|     |     |     |     |     | convolutional  | layer of VGGNet | is a 14(cid:2)  |
14(cid:2)512
size feature map
softmax
| 224     | 224 112 | 112 56 | 56  | 28  | 28      |      |     |
| ------- | ------- | ------ | --- | --- | ------- | ---- | --- |
|         |         |        |     |     | 14      | 14   | 7   |
|         | 211     | 211 65 | 65  | 82  | 82 41   | 41 7 |     |
| 422 422 |         |        |     |     |         | 512  |     |
|         |         |        |     | 256 | 512 512 | 512  |     |
maxpool
|            |              | 128     | 256  | maxpool | Conv maxpool | Conv |            |
| ---------- | ------------ | ------- | ---- | ------- | ------------ | ---- | ---------- |
|            | 64 128       | maxpool | Conv |         |              |      |            |
| 64         | maxpool Conv |         |      |         |              |      |            |
| Input Conv |              |         |      |         |              |      | fc fc 1000 |
40964096
52/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --------- | --- |

Well,insteadofthefc7representationwe
|     |     |     | use the       | output of one of | the convolution |
| --- | --- | --- | ------------- | ---------------- | --------------- |
|     |     |     | layers which  | has spatial      | information     |
|     |     |     | For example   | the output       | of the 5th      |
|     |     |     | convolutional | layer of VGGNet  | is a 14(cid:2)  |
14(cid:2)512
|             |          |      |          | size feature map |                  |
| ----------- | -------- | ---- | -------- | ---------------- | ---------------- |
|             | +        |      | We could | think of this    | as 196 locations |
|             |          |      | (each    | having a 512     | dimensional      |
| (cid:11) t1 | (cid:11) | t196 |          |                  |                  |
representation)
| 512 |       |     | The model  | will then learn | an attention     |
| --- | ----- | --- | ---------- | --------------- | ---------------- |
|     | …     |     | over these | locations       | (which in turn   |
| 1   | 2 196 |     | correspond | to actual       | locations in the |
images)
14
512
14
53/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

Let us look at some examples of attention over images for the task of image
captioning
54/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| -------------- | --------------------- | --------- |

Figure: Examples of the attention-based model attending to the correct object (white
indicates the attended regions,underlines indicates the corresponding word) [Kyunghyun
Cho et al. 2015.]
55/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| -------------- | --------------------- | --------- |

| Module | 16.5: Hierarchical |     | Attention |
| ------ | ------------------ | --- | --------- |
56/63
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |
| --- | -------------- | --------------------- | --------- |

|     |     |     | Consider  | a dialog between | a user (u) |
| --- | --- | --- | --------- | ---------------- | ---------- |
|     |     |     | and a bot | (B)              |            |
Context
|               |           |             | The dialog | contains | a sequence of    |
| ------------- | --------- | ----------- | ---------- | -------- | ---------------- |
| U: Can you    | suggest a | good movie? |            |          |                  |
|               |           |             | utterances | between  | the user and the |
| B: Yes, sure. | How about | Logan?      | bot        |          |                  |
U: Okay, who is the lead actor? Each utterance in turn is a sequence
of words
Response
|         |             |        | Thus       | what we have  | here is a        |
| ------- | ----------- | ------ | ---------- | ------------- | ---------------- |
| B: Hugh | Jackman, of | course | “sequence  | of sequences” | as input         |
|         |             |        | Can you    | think of an   | encoder for such |
|         |             |        | a sequence | of sequences? |                  |
57/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |           |            |              |      |           | We could        | think               | of a     | two level |
| --- | --------- | ---------- | ------------ | ---- | --------- | --------------- | ------------------- | -------- | --------- |
|     | o/p:Hugh  | Jackman of | course<STOP> |      |           |                 |                     |          |           |
|     |           |            |              |      |           | hierarchical    | RNN encoder         |          |           |
|     |           |            |              |      |           | The first       | level RNN           | operates | on the    |
|     |           |            |              |      |           | sequence        | of words in         | each     | utterance |
|     |           |            |              |      |           | and gives       | us a representation |          |           |
|     | 1         | 0          | 0 1          | 0    |           | We now          | have a sequence     | of       | utterance |
|     | 0         | 0          | 0 0          | 1    |           |                 |                     |          |           |
|     | 0         | 1          | 0 0          | 0    |           |                 |                     |          |           |
|     | 0         | 0          | 1 0          | 0    |           | representations | (red                | vectors  | in the    |
|     | 0         | 0          | 0 0          | 0    |           |                 |                     |          |           |
|     | <Go>      | I am       | going        | home |           | image)          |                     |          |           |
|     |           |            |              |      |           | We can          | now have            | another  | RNN       |
|     |           |            |              |      |           | which encodes   | this                | sequence | and       |
|     |           |            |              |      |           | gives a single  | representations     |          | for the   |
|     |           |            |              |      |           | sequences       | of utterances       |          |           |
|     |           |            |              |      |           | The decoder     | can then            | produce  | an        |
|     | …         |            | …            |      | …         | output sequence | conditioned         |          | on this   |
| Can | youmovie? | Yes        | sureLogan?   | Okay | whoactor? | utterance       |                     |          |           |
58/63
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture16 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

|                |                |              |           | Let us         | look at another  | example     |     |
| -------------- | -------------- | ------------ | --------- | -------------- | ---------------- | ----------- | --- |
| Politics       | is the process | of making    | decisions |                |                  |             |     |
|                |                |              |           | Consider       | the task         | of document |     |
| applying       | to all members | of each      | group.    |                |                  |             |     |
|                |                |              |           | classification | or summarization |             |     |
| More narrowly, | it refers      | to achieving | and …     |                |                  |             |     |
Adocumentisasequenceofsentences
Politics
Eachsentenceinturnisasequenceof
words
|                                |     |                       |     | We can   | again use a | hierarchical | RNN |
| ------------------------------ | --- | --------------------- | --- | -------- | ----------- | ------------ | --- |
|                                |     |                       |     | to model | this        |              |     |
| …                              |     | …                     | …   |          |             |              |     |
| Politics isdecisionsapplyingto |     | group Morenarrowlyand |     |          |             |              |     |
59/63
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|          |           |             |              |           |     | fDocument  |               | gN  |     |
| -------- | --------- | ----------- | ------------ | --------- | --- | ---------- | ------------- | --- | --- |
|          |           |             |              |           |     | Data:      | i ;class      | i   |     |
| Politics | is        | the process | of making    | decisions |     |            |               | i=1 |     |
|          |           |             |              |           |     | Word level | (1) encoder:  |     |     |
| applying | to        | all members | of each      | group.    |     |            |               |     |     |
|          |           |             |              |           |     | h1 =RNN(h1 | ;w )          |     |     |
| More     | narrowly, | it refers   | to achieving | and       | …   | ij         | ij(cid:0)1 ij |     |     |
=h1
|     |     |     |     |     |     | s     | [T is length | of sentence | i]  |
| --- | --- | --- | --- | --- | --- | ----- | ------------ | ----------- | --- |
|     |     |     |     |     |     | i iTi |              |             |     |
Politics
|     |     |     |     |     |     | Sentence   | level (2) encoder: |               |     |
| --- | --- | --- | --- | --- | --- | ---------- | ------------------ | ------------- | --- |
|     |     |     |     |     |     | h2 =RNN(h2 | ;s )               |               |     |
|     |     |     |     |     |     | i          | i(cid:0)1 i        |               |     |
|     |     |     |     |     |     | s=h2       | [K is number       | of sentences] |     |
K
Decoder:
P(yjdocument)=softmax(Vs+b)
|          |                       |     |                       |     |     | Params:     | W1 , U1 , | W2 , U2 | , V;b |
| -------- | --------------------- | --- | --------------------- | --- | --- | ----------- | --------- | ------- | ----- |
|          |                       |     |                       |     |     |             | enc enc   | enc enc |       |
|          |                       |     |                       |     |     | Loss: Cross | Entropy   |         |       |
|          | …                     |     | …                     | …   |     |             |           |         |       |
|          |                       |     |                       |     |     | Algorithm:  | Gradient  | Descent | with  |
| Politics | isdecisionsapplyingto |     | group Morenarrowlyand |     |     |             |           |         |       |
backpropagation
60/63
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture16 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     | How would | you            | model attention | in      |
| --- | --------- | -------------- | --------------- | ------- |
|     | such a    | hierarchical   | encoder         | decoder |
|     | model     | ?              |                 |         |
|     | We need   | attention      | at two levels   |         |
|     | First we  | need to attend | to important    |         |
|     | (most     | informative)   | words           | in a    |
sentence
|     | Then we | need to attend | to important |      |
| --- | ------- | -------------- | ------------ | ---- |
|     | (most   | informative)   | sentences    | in a |
document
|     | Let us | see how to | model this |     |
| --- | ------ | ---------- | ---------- | --- |
Figure: Hierarchical Attention Network
[Yang et al.]
61/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Data: fDocument ;class gN
i i i=1
Word level (1) encoder:
hij=RNN(hij(cid:0)1;wij)
uij=tanh(Wwhij+bw)
(cid:11)ij=
∑
∑ e
t
x
e
p
x
(
p
u
(
T i
u
j u
T
it
w
u
)
w)
si= (cid:11)ijhij
j
Sentence level (2) encoder:
hi=RNN(hi(cid:0)1;si)
ui=tanh(Wshi+bs)
(cid:11)i=
∑
∑ e
i
x
e
p
x
(
p
u
(
T i
u
u
T
i
s
u
)
s)
Figure: Hierarchical Attention Network
s= (cid:11)ihi
[Yang et al.] i
62/63
MiteshM.Khapra CS7015(DeepLearning): Lecture16

Decoder:
|     | P(yjdocument) | = softmax(Vs+b) |     |
| --- | ------------- | --------------- | --- |
Parameters:
|     | W ;W ;V;b   | ;b ;b;u ;u       |     |
| --- | ----------- | ---------------- | --- |
|     | w s         | w s w s          |     |
|     | Loss: cross | entropy          |     |
|     | Algorithm:  | Gradient Descent | and |
backpropagation
Figure: Hierarchical Attention Network
[Yang et al..]
63/63
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture16 |     |
| -------------- | --------------------- | --------- | --- |
