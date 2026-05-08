| CS7015 | (Deep Learning) | : Lecture | 15  |
| ------ | --------------- | --------- | --- |
Long Short Term Memory Cells (LSTMs), Gated Recurrent Units (GRUs)
|     | Mitesh | M. Khapra |     |
| --- | ------ | --------- | --- |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/43
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |
| --- | -------------- | --------------------- | --------- |

| Module | 15.1: Selective  |     | Read, Selective | Write, Selective |
| ------ | ---------------- | --- | --------------- | ---------------- |
| Forget | - The Whiteboard |     | Analogy         |                  |
2/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |
| --- | --- | -------------- | --------------------- | --------- |

| y1 y2 | y3 y4 | yt  |           |     |      |        |         |
| ----- | ----- | --- | --------- | --- | ---- | ------ | ------- |
|       |       |     | The state | (s  | ) of | an RNN | records |
i
|     |     |     | information |     | from all | previous | time |
| --- | --- | --- | ----------- | --- | -------- | -------- | ---- |
steps
| V V   | V V   | V     |                 |         |              |            |            |
| ----- | ----- | ----- | --------------- | ------- | ------------ | ---------- | ---------- |
|       |       |       | At each         | new     | timestep     |            | the old    |
| W     | W W W | ... W |                 |         |              |            |            |
| s1 s2 | s3 s4 | st    | information     |         | gets morphed |            | by the     |
|       |       |       | current         | input   |              |            |            |
| U U   | U U   | U     |                 |         |              |            |            |
|       |       |       | One could       | imagine |              | that after | t steps    |
|       |       |       | the information |         | stored       | at         | time step  |
| x1 x2 | x3 x4 | xt    | t−k (for        | some    | k <          | t) gets    | completely |
morphed
|     |     |     | so much    | that | it would | be          | impossible |
| --- | --- | --- | ---------- | ---- | -------- | ----------- | ---------- |
|     |     |     | to extract | the  | original | information |            |
|     |     |     | stored at  | time | step     | t−k         |            |
3/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| y1 y2 | y3 y4 | yt  |                 |         |       |           |      |
| ----- | ----- | --- | --------------- | ------- | ----- | --------- | ---- |
|       |       |     | A similar       | problem |       | occurs    | when |
|       |       |     | the information |         | flows | backwards |      |
(backpropagation)
| V V   | V V   | V     |                     |           |          |            |        |
| ----- | ----- | ----- | ------------------- | --------- | -------- | ---------- | ------ |
|       |       |       | It is               | very      | hard to  | assign     | the    |
| W     | W W W | ... W |                     |           |          |            |        |
| s1 s2 | s3 s4 | st    | responsibility      |           | of the   | error      | caused |
|       |       |       | at time             | step      | t to the | events     | that   |
| U U   | U U   | U     |                     |           |          |            |        |
|       |       |       | occurred            | at time   | step     | t−k        |        |
|       |       |       | This responsibility |           | is       | of course  | in the |
| x1 x2 | x3 x4 | xt    | form of             | gradients | and      | we studied | the    |
probleminbackwardflowofgradients
|     |     |     | We saw           | a formal | argument  |           | for this |
| --- | --- | --- | ---------------- | -------- | --------- | --------- | -------- |
|     |     |     | while discussing |          | vanishing | gradients |          |
4/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

|     | Let us      | see an analogy |        | for this |            |
| --- | ----------- | -------------- | ------ | -------- | ---------- |
|     | We can      | think          | of the | state    | as a fixed |
|     | size memory |                |        |          |            |
|     | Compare     | this           | to a   | fixed    | size white |
|     | board       | that           | you    | use      | to record  |
information
|     | At each | time step | (periodic |     | intervals) |
| --- | ------- | --------- | --------- | --- | ---------- |
|     | we keep | writing   | something |     | to the     |
board
|     | Effectively | at              | each | time     | step we  |
| --- | ----------- | --------------- | ---- | -------- | -------- |
|     | morph       | the information |      | recorded | till     |
|     | that time   | point           |      |          |          |
|     | After       | many timesteps  |      | it       | would be |
impossibletoseehowtheinformation
|     | at time  | step t−k | contributed |     | to the |
| --- | -------- | -------- | ----------- | --- | ------ |
|     | state at | timestep | t           |     |        |
5/43
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |     |
| -------------- | --------------------- | --------- | --- | --- | --- |

|     | Continuing    | our whiteboard    |            | analogy, |
| --- | ------------- | ----------------- | ---------- | -------- |
|     | suppose       | we are interested | in         | deriving |
|     | an expression | on the            | whiteboard |          |
|     | We follow     | the following     | strategy   | at       |
|     | each time     | step              |            |          |
|     | Selectively   | write on          | the board  |          |
|     | Selectively   | read the          | already    | written  |
content
|     | Selectively | forget | (erase) | some |
| --- | ----------- | ------ | ------- | ---- |
content
|     | Let us look | at each | of these | in detail |
| --- | ----------- | ------- | -------- | --------- |
6/43
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| a =         | 1 b = 3 c =   | 5 d = 11     | Selective  | write |            |             |        |
| ----------- | ------------- | ------------ | ---------- | ----- | ---------- | ----------- | ------ |
|             |               |              | There      | may   | be many    | steps       | in the |
| Compute     | ac(bd+a)+ad   |              |            |       |            |             |        |
|             |               |              | derivation |       | but we may | just skip   | a few  |
| Say “board” | can have only | 3 statements |            |       |            |             |        |
|             |               |              | In         | other | words we   | select what | to     |
at a time.
write
ac
1
2 bd
bd+a
3
ac(bd+a)
4
5 ad
6 ac(bd+a)+ad
ac = 5
bd = 33
7/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| a = 1   | b = 3 c =   | 5 d = 11 | Selective | read                 |              |
| ------- | ----------- | -------- | --------- | -------------------- | ------------ |
|         |             |          | While     | writing one step     | we typically |
| Compute | ac(bd+a)+ad |          |           |                      |              |
|         |             |          | read      | some of the previous | steps we     |
Say “board” can have only 3 statements have already written and then decide
| at a time. |     |     | what | to write next   |                |
| ---------- | --- | --- | ---- | --------------- | -------------- |
|            |     |     | For  | example at Step | 3, information |
ac
1
|     |     |     | from | Step 2 is important |     |
| --- | --- | --- | ---- | ------------------- | --- |
2 bd
Inotherwordsweselectwhattoread
bd+a
3
ac(bd+a)
4
5 ad
6 ac(bd+a)+ad
ac = 5
bd = 33
|     | bd+a | = 34 |     |     |     |
| --- | ---- | ---- | --- | --- | --- |
8/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| a =         | 1 b = 3 c =   | 5 d = 11     | Selective | forget |          |             |            |
| ----------- | ------------- | ------------ | --------- | ------ | -------- | ----------- | ---------- |
|             |               |              | Once      | the    | board    | is full,    | we need to |
| Compute     | ac(bd+a)+ad   |              |           |        |          |             |            |
|             |               |              | delete    | some   | obsolete | information |            |
| Say “board” | can have only | 3 statements |           |        |          |             |            |
Buthowdowedecidewhattodelete?
at a time.
|     |     |     | We     | will        | typically | delete | the least |
| --- | --- | --- | ------ | ----------- | --------- | ------ | --------- |
|     |     |     | useful | information |           |        |           |
ac
1
|     |     |     | In  | other | words | we select | what to |
| --- | --- | --- | --- | ----- | ----- | --------- | ------- |
2 bd
forget
bd+a
3
ac(bd+a)
4
5 ad
6 ac(bd+a)+ad
ac = 5
bd = 33
bd+a = 34
9/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |
ac = 5
bd+a = 34
ac = 5
|     | ac(bd+a) | = 170 |     |     |     |     |     |
| --- | -------- | ----- | --- | --- | --- | --- | --- |
bd+a = 34
ac = 5
|     | ac(bd+a) | = 170 |     |     |     |     |     |
| --- | -------- | ----- | --- | --- | --- | --- | --- |
ad = 11
|     | ad+ac(bd+a) | = 181 |     |     |     |     |     |
| --- | ----------- | ----- | --- | --- | --- | --- | --- |
|     | ac(bd+a)    | = 170 |     |     |     |     |     |
ad = 11

|     | a =     | 1 b | = 3 c =     | 5 d = 11     |              |                 |       |        |           |
| --- | ------- | --- | ----------- | ------------ | ------------ | --------------- | ----- | ------ | --------- |
|     |         |     |             |              | There        | are various     | other |        | scenarios |
|     | Compute |     | ac(bd+a)+ad |              | where        | we can motivate |       | the    | need for  |
|     |         |     |             |              | selective    | write, read     | and   | forget |           |
| Say | “board” | can | have only   | 3 statements |              |                 |       |        |           |
|     |         |     |             |              | For example, | you             | could | think  | of our    |
at a time.
|     |     |     |     |     | brain as | something     | which | can   | store |
| --- | --- | --- | --- | --- | -------- | ------------- | ----- | ----- | ----- |
|     | ac  |     |     |     | only a   | finite number | of    | facts |       |
1
|     | 2 bd |     |     |     | At different | time       | steps | we selectively |          |
| --- | ---- | --- | --- | --- | ------------ | ---------- | ----- | -------------- | -------- |
|     |      |     |     |     | read, write  | and forget |       | some           | of these |
bd+a
3
facts
ac(bd+a)
4
|     |     |     |     |     | Since the | RNN also | has | a finite | state |
| --- | --- | --- | --- | --- | --------- | -------- | --- | -------- | ----- |
5 ad
|     |     |     |     |     | size, we | need to | figure | out | a way to |
| --- | --- | --- | --- | --- | -------- | ------- | ------ | --- | -------- |
6 ac(bd+a)+ad
|     |     |     |     |     | allow it | to selectively | read, | write | and |
| --- | --- | --- | --- | --- | -------- | -------------- | ----- | ----- | --- |
forget
|     |     | ad+ac(bd+a) |          | = 181 |     |     |     |     |     |
| --- | --- | ----------- | -------- | ----- | --- | --- | --- | --- | --- |
|     |     |             | ac(bd+a) | = 170 |     |     |     |     |     |
ad = 11
10/43
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

| Module | 15.2: Long | Short Term  | Memory(LSTM) |     | and |
| ------ | ---------- | ----------- | ------------ | --- | --- |
| Gated  | Recurrent  | Units(GRUs) |              |     |     |
11/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

Questions
Can we give a concrete example where RNNs also need to selectively read,
write and forget ?
How do we convert this intuition into mathematical equations ? We will see
this over the next few slides
12/43
MiteshM.Khapra CS7015(DeepLearning): Lecture15

|     |     | Consider | the | task | of predicting | the | sentiment |
| --- | --- | -------- | --- | ---- | ------------- | --- | --------- |
+/−
|     |     | (positive/negative) |       |              | of a    | review |               |
| --- | --- | ------------------- | ----- | ------------ | ------- | ------ | ------------- |
|     |     | RNN reads           |       | the document |         | from   | left to right |
|     |     | and after           | every | word         | updates | the    | state         |
Bythetimewereachtheendofthedocument
|     |     | the information |            | obtained |      | from | the first few |
| --- | --- | --------------- | ---------- | -------- | ---- | ---- | ------------- |
|     |     | words is        | completely |          | lost |      |               |
... ... ...performance
| The first |     | Ideally | we want | to          |     |       |               |
| --------- | --- | ------- | ------- | ----------- | --- | ----- | ------------- |
|           |     | forget  | the     | information |     | added | by stop words |
Review: Thefirsthalfofthemoviewasdrybut
|                                  |         | (a,         | the, etc.) |      |     |             |          |
| -------------------------------- | ------- | ----------- | ---------- | ---- | --- | ----------- | -------- |
| thesecondhalfreallypickeduppace. | Thelead |             |            |      |     |             |          |
|                                  |         | selectively |            | read | the | information | added by |
actordeliveredanamazingperformance
|     |     | previous    |      | sentiment | bearing   | words       | (awesome, |
| --- | --- | ----------- | ---- | --------- | --------- | ----------- | --------- |
|     |     | amazing,    |      | etc.)     |           |             |           |
|     |     | selectively |      | write     | new       | information | from the  |
|     |     | current     | word | to        | the state |             |           |
13/43
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

Questions
Can we give a concrete example where RNNs also need to selectively read,
write and forget ?
How do we convert this intuition into mathematical equations ?
14/43
MiteshM.Khapra CS7015(DeepLearning): Lecture15

|     |     | Recall | that the blue | colored | vector |
| --- | --- | ------ | ------------- | ------- | ------ |
+/−
|     |     | (s ) is | called the state | of the | RNN |
| --- | --- | ------- | ---------------- | ------ | --- |
t
|     |     | It has | a finite size | (s ∈ Rn) | and is |
| --- | --- | ------ | ------------- | -------- | ------ |
t
|                        |     | used to        | store all the      | information     | upto    |
| ---------------------- | --- | -------------- | ------------------ | --------------- | ------- |
|                        |     | timestep       | t                  |                 |         |
|                        |     | This           | state is analogous |                 | to the  |
|                        |     | whiteboard     | and sooner         | or later        | it will |
| ... ... ...performance |     | get overloaded | and                | the information |         |
The first
|     |     | from | the initial | states | will get |
| --- | --- | ---- | ----------- | ------ | -------- |
Review: Thefirsthalfofthemoviewasdrybut
|     |     | morphed | beyond recognition |     |     |
| --- | --- | ------- | ------------------ | --- | --- |
thesecondhalfreallypickeduppace. Thelead
actordeliveredanamazingperformance Wishlist: selective write, selective
|     |     | read and         | selective    | forget | to ensure |
| --- | --- | ---------------- | ------------ | ------ | --------- |
|     |     | that this        | finite sized | state  | vector is |
|     |     | used effectively |              |        |           |
15/43
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

|      |               |      | Just to | be clear, | we  | have | computed |
| ---- | ------------- | ---- | ------- | --------- | --- | ---- | -------- |
| -1.4 |               | -0.9 |         |           |     |      |          |
| -0.4 | selectiveread | 0.2  |         |           |     |      |          |
1 s e l e c t i v e w r it e 1 a state s at timestep t − 1 and
| .   | s e l e c t i v e f or g e t | .    |             | t−1     |          |         |          |
| --- | ---------------------------- | ---- | ----------- | ------- | -------- | ------- | -------- |
| . . |                              | . .  |             |         |          |         |          |
|     |                              |      | now we      | want to | overload | it      | with new |
| -2  |                              | -1.9 | information | (x      | ) and    | compute | a new    |
t
| st−1 | 0.7  | st  |       |      |     |     |     |
| ---- | ---- | --- | ----- | ---- | --- | --- | --- |
|      | -0.2 |     | state | (s ) |     |     |     |
t
1.1
|     | . . |     | While | doing so | we want | to  | make sure |
| --- | --- | --- | ----- | -------- | ------- | --- | --------- |
.
|     | -0.3 |     | that we | use selective |     | write, | selective |
| --- | ---- | --- | ------- | ------------- | --- | ------ | --------- |
xt
|     |     |     | read and  | selective   | forget | so          | that only |
| --- | --- | --- | --------- | ----------- | ------ | ----------- | --------- |
|     |     |     | important | information |        | is retained | in        |
s
t
|     |     |     | We will | now see    | how | to implement |     |
| --- | --- | --- | ------- | ---------- | --- | ------------ | --- |
|     |     |     | these   | items from | our | wishlist     |     |
16/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

|          |      |      | Selective Write |              |                   |
| -------- | ---- | ---- | --------------- | ------------ | ----------------- |
| -1.4     |      | -0.9 |                 |              |                   |
| -00 .4 W | σ    | 0 .2 | Recall          | that in RNNs | we use s to       |
| 1        |      | 1    |                 |              | t−1               |
| .        |      | .    |                 |              |                   |
| . .      |      | . .  | compute         | s            |                   |
|          | U    |      |                 | t            |                   |
|          |      |      | s = σ(Ws        | +Ux          | ) (ignoring bias) |
| -02      |      | -1.9 | t               | t−1          | t                 |
| st−1     | 0.7  | st   |                 |              |                   |
|          | -0.2 |      | But now         | instead of   | passing s as it   |
t−1
|     | 1.1 |     | is to s | we want to pass | (write) only |
| --- | --- | --- | ------- | --------------- | ------------ |
|     | . . |     | t       |                 |              |
.
|     |     |     | some portions | of it | to the next state |
| --- | --- | --- | ------------- | ----- | ----------------- |
-0.3
|     | xt  |     | In the        | strictest case | our decisions    |
| --- | --- | --- | ------------- | -------------- | ---------------- |
|     |     |     | could be      | binary (for    | example, retain  |
|     |     |     | 1st and       | 3rd entries    | and delete the   |
|     |     |     | rest of       | the entries)   |                  |
|     |     |     | But a more    | sensible       | way of doing     |
|     |     |     | this would    | be to assign   | a value          |
|     |     |     | between       | 0 and 1 which  | determines       |
|     |     |     | what fraction | of the         | current state to |
|     |     |     | pass on       | to the next    | state            |
17/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|                |       |      |      | Selective | Write        |           |                 |       |
| -------------- | ----- | ---- | ---- | --------- | ------------ | --------- | --------------- | ----- |
| -1.4 0.2       | 0.5   |      | -1.4 |           |              |           |                 |       |
| -0.4 0.34      | 0.36  |      | -0.4 |           | We introduce | a vector  | o               | which |
| 1 (cid:12) 0.9 | = 0.9 |      | 1    |           |              |           | t−1             |       |
| . .            | .     |      | .    |           |              |           |                 |       |
| . . . .        | . .   |      | . .  |           | decides what | fraction  | of each element |       |
|                |       |      |      |           | of s should  | be passed | to the          | next  |
| -2 0.29        | 0.6   | 0.7  | -2   |           | t−1          |           |                 |       |
| st−1 ot−1      | ht−1  | -0.2 | st   |           | state        |           |                 |       |
1.1
| selectivewrite |     | . . |     |     |              |      |                 |     |
| -------------- | --- | --- | --- | --- | ------------ | ---- | --------------- | --- |
|                |     | .   |     |     | Each element | of o | gets multiplied |     |
t−1
-0.3
|     |     |     |     |     | with the | corresponding | element | of  |
| --- | --- | --- | --- | --- | -------- | ------------- | ------- | --- |
xt
s
t−1
|     |     |     |     |     | Each element | of o | is restricted | to  |
| --- | --- | --- | --- | --- | ------------ | ---- | ------------- | --- |
t−1
|     |     |     |     |     | be between | 0 and 1       |     |     |
| --- | --- | --- | --- | --- | ---------- | ------------- | --- | --- |
|     |     |     |     |     | But how    | do we compute | o ? | How |
t−1
|     |     |     |     |     | does the  | RNN know    | what fraction | of  |
| --- | --- | --- | --- | --- | --------- | ----------- | ------------- | --- |
|     |     |     |     |     | the state | to pass on? |               |     |
18/43
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture15 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|                |       |      |      | Selective Write |                  |               |
| -------------- | ----- | ---- | ---- | --------------- | ---------------- | ------------- |
| -1.4 0.2       | 0.5   |      | -1.4 |                 |                  |               |
| -0.4 0.34      | 0.36  |      | -0.4 | Well the        | RNN has to       | learn o along |
| 1 (cid:12) 0.9 | = 0.9 |      | 1    |                 |                  | t−1           |
| . .            | .     |      | .    |                 |                  |               |
| . . . .        | . .   |      | . .  | with the        | other parameters | (W,U,V)       |
| -2 0.29        | 0.6   | 0.7  | -2   | We compute      | o and            | h as          |
|                |       |      |      |                 | t−1              | t−1           |
| st−1 ot−1      | ht−1  | -0.2 | st   |                 |                  |               |
1.1
| selectivewrite |     | . . |     |     |          |         |
| -------------- | --- | --- | --- | --- | -------- | ------- |
|                |     | .   |     | o = | σ(W h +U | x +b )  |
|                |     |     |     | t−1 | o t−2    | o t−1 o |
-0.3
|     |     |     |     | h = | o (cid:12)σ(s | )   |
| --- | --- | --- | --- | --- | ------------- | --- |
t−1 t−1 t−1
xt
|     |     |     |     | The parameters | W               | ,U ,b need to   |
| --- | --- | --- | --- | -------------- | --------------- | --------------- |
|     |     |     |     |                | o               | o o             |
|     |     |     |     | be learned     | along with      | the existing    |
|     |     |     |     | parameters     | W,U,V           |                 |
|     |     |     |     | The sigmoid    | (logistic)      | function        |
|     |     |     |     | ensures        | that the values | are between     |
|     |     |     |     | 0 and 1        |                 |                 |
|     |     |     |     | o t is called  | the output      | gate as it      |
|     |     |     |     | decides how    | much to         | pass (write) to |
|     |     |     |     | the next       | time step       |                 |
19/43
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

|          |     |     |     | Selective | Read |     |     |     |     |
| -------- | --- | --- | --- | --------- | ---- | --- | --- | --- | --- |
| -1.4 0.2 | 0.5 |     | 0.4 | -1.4      |      |     |     |     |     |
-0 .4 0 . 3 4 0 . 3 6 W σ 0 . 6 -0 .4 We will now use h to compute the
| 1 (cid:12) 0 . 9 | = 0 . 9 |     | 0 . 1 | 1   |           |      | t−1           |        |     |
| ---------------- | ------- | --- | ----- | --- | --------- | ---- | ------------- | ------ | --- |
| . .              | .       |     | .     | .   |           |      |               |        |     |
| . . . .          | . .     | U   | . .   | . . | new state | at   | the next time | step   |     |
| -2 0.29          | 0.6     | 0.7 | 0.2   | -2  | We will   | also | use x which   | is the | new |
t
| st−1 ot−1      | ht−1 | - 0 . 2 | s˜t | st  |          |      |        |     |     |
| -------------- | ---- | ------- | --- | --- | -------- | ---- | ------ | --- | --- |
|                |      | 1 . 1   |     |     | input at | time | step t |     |     |
| selectivewrite |      | . .     |     |     |          |      |        |     |     |
.
-0.3
|     |     |     |     |     | s˜  | t = σ(Wh | t−1 +Ux | t +b) |     |
| --- | --- | --- | --- | --- | --- | -------- | ------- | ----- | --- |
xt
|     |     |     |     |     | Note that       | W,U    | and b   | are similar | to  |
| --- | --- | --- | --- | --- | --------------- | ------ | ------- | ----------- | --- |
|     |     |     |     |     | the parameters  |        | that we | used in     | RNN |
|     |     |     |     |     | (for simplicity |        | we have | not shown   | the |
|     |     |     |     |     | bias b          | in the | figure) |             |     |
20/43
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|          |     |     |         |      | Selective | Read |     |     |     |     |     |
| -------- | --- | --- | ------- | ---- | --------- | ---- | --- | --- | --- | --- | --- |
| -1.4 0.2 | 0.5 |     | 0.4 0.8 | -1.4 |           |      |     |     |     |     |     |
-0 .4 0 . 3 4 0 . 3 6 W σ 0 . 6 0 . 6 6 -0 .4 s˜ thus captures all the information
| 1 (cid:12) 0 . 9 | = 0 . 9 |     | 0 . 1 (cid:12) 0 . 1 | 1   |     | t                      |     |     |     |         |     |
| ---------------- | ------- | --- | -------------------- | --- | --- | ---------------------- | --- | --- | --- | ------- | --- |
| . .              | .       |     | . .                  | .   |     |                        |     |     |     |         |     |
| . . . .          | . .     | U   | . . . .              | . . |     | fromthepreviousstate(h |     |     |     | )andthe |     |
t−1
|                |      |         |               |     |     | current  | input | x   |             |      |     |
| -------------- | ---- | ------- | ------------- | --- | --- | -------- | ----- | --- | ----------- | ---- | --- |
| -2 0.29        | 0.6  | 0.7     | 0.2 0.71      | -2  |     |          |       | t   |             |      |     |
| st−1 ot−1      | ht−1 | - 0 . 2 | s˜t it        | st  |     |          |       |     |             |      |     |
|                |      | 1 . 1   |               |     |     | However, | we    | may | not         | want | to  |
| selectivewrite |      | . .     | selectiveread |     |     |          |       |     |             |      |     |
|                |      | .       |               |     |     | use all  | this  | new | information |      | and |
-0.3
|     |     |     |     |     |     | only selectively |     | read | from | it  | before |
| --- | --- | --- | --- | --- | --- | ---------------- | --- | ---- | ---- | --- | ------ |
xt
|     |     |     |     |     |     | constructing |     | the new | cell | state | s   |
| --- | --- | --- | --- | --- | --- | ------------ | --- | ------- | ---- | ----- | --- |
t
|     |     |     |     |     |     | To do this        | we             | introduce |             | another | gate |
| --- | --- | --- | --- | --- | --- | ----------------- | -------------- | --------- | ----------- | ------- | ---- |
|     |     |     |     |     |     | called the        | input          | gate      |             |         |      |
|     |     |     |     |     |     | i                 | = σ(W          | h         | +U          | x +b    | )    |
|     |     |     |     |     |     | t                 |                | i t−1     | i           | t i     |      |
|     |     |     |     |     |     | and use           | i t (cid:12)s˜ | t as the  | selectively |         | read |
|     |     |     |     |     |     | state information |                |           |             |         |      |
21/43
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|                |        |     |                  |      | So far we | have the following |     |
| -------------- | ------ | --- | ---------------- | ---- | --------- | ------------------ | --- |
| -1.4 0.2       | 0.5    |     | 0.4 0.8          | -1.4 |           |                    |     |
| -0.4 0.34      | 0.36 W | σ   | 0.6 0.66         | -0.4 |           |                    |     |
| 1 (cid:12) 0.9 | = 0.9  |     | 0.1 (cid:12) 0.1 | 1    |           |                    |     |
| . .            | .      |     | . .              | .    |           |                    |     |
| . . . .        | . .    | U   | . . . .          | . .  | Previous  | state:             |     |
| -2 0.29        | 0.6    | 0.7 | 0.2 0.71         | -2   | s         |                    |     |
t−1
| st−1 ot−1 | ht−1 | -0.2 | s˜t it | st  |     |     |     |
| --------- | ---- | ---- | ------ | --- | --- | --- | --- |
1.1
| selectivewrite |     | . . | selectiveread |     | Output | gate: |     |
| -------------- | --- | --- | ------------- | --- | ------ | ----- | --- |
.
|     |     | -0.3 |     |     | o =         | σ(W h +U              | x +b )  |
| --- | --- | ---- | --- | --- | ----------- | --------------------- | ------- |
|     |     |      |     |     | t−1         | o t−2                 | o t−1 o |
|     |     | xt   |     |     | Selectively | Write:                |         |
|     |     |      |     |     | h t−1 =     | o t−1 (cid:12)σ(s t−1 | )       |
|     |     |      |     |     | Current     | (temporary)           | state:  |
|     |     |      |     |     | s˜ = σ(Wh   | +Ux                   | +b)     |
|     |     |      |     |     | t           | t−1                   | t       |
Input gate:
|     |     |     |     |     | i = σ(W     | h +U x  | +b ) |
| --- | --- | --- | --- | --- | ----------- | ------- | ---- |
|     |     |     |     |     | t           | i t−1 i | t i  |
|     |     |     |     |     | Selectively | Read:   |      |
i (cid:12)s˜
t t
22/43
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     | -1.4 0.2       | 0.5    |      | 0.4 0.8          | -1.4 | 0.9          | -0.9 |     |     |     |     |
| --- | -------------- | ------ | ---- | ---------------- | ---- | ------------ | ---- | --- | --- | --- | --- |
|     | -0.4 0.34      | 0.36 W | σ    | 0.6 0.66         | -0.4 | 0.7          | 0.2  |     |     |     |     |
|     | 1 (cid:12) 0.9 | = 0.9  |      | 0.1 (cid:12) 0.1 | + 1  | (cid:12) 0.9 | = 1  |     |     |     |     |
|     | . .            | .      |      | . .              | .    | .            | .    |     |     |     |     |
|     | . . . .        | . .    | U    | . . . .          | . .  | . .          | . .  |     |     |     |     |
|     | -2 0.29        | 0.6    | 0.7  | 0.2 0.71         | -2   | 0.8          | -1.9 |     |     |     |     |
|     | st−1 ot−1      | ht−1   | -0.2 | s˜t it           | st−1 | ft           | st   |     |     |     |     |
1.1
|     | selectivewrite |     | . . | selectiveread | selectiveforget |     |     |     |     |     |     |
| --- | -------------- | --- | --- | ------------- | --------------- | --- | --- | --- | --- | --- | --- |
.
-0.3
xt
| Selective | Forget          |            |                 |             |     | Butwemaynotwanttousethewhole |     |             |           |            |            |
| --------- | --------------- | ---------- | --------------- | ----------- | --- | ---------------------------- | --- | ----------- | --------- | ---------- | ---------- |
|           | Howdowecombines |            |                 | ands˜ toget |     | of                           | s   | but forget  | some      | parts      | of it      |
|           |                 |            | t−1             | t           |     |                              | t−1 |             |           |            |            |
|           | the new         | state      |                 |             |     | To                           | do  | this we     | introduce |            | the forget |
|           | Here is         | one simple | (but effective) | way         |     | gate                         |     |             |           |            |            |
|           | of doing        | this:      |                 |             |     |                              |     |             |           |            |            |
|           |                 |            |                 |             |     |                              | f = | σ(W         | h         | +U x       | +b )       |
|           |                 |            |                 |             |     |                              | t   | f           | t−1       | f t        | f          |
|           |                 | s = s      | +i (cid:12)s˜   |             |     |                              |     |             |           |            |            |
|           |                 | t t−1      | t               | t           |     |                              | s = | f (cid:12)s | +i        | (cid:12)s˜ |            |
|           |                 |            |                 |             |     |                              | t   | t           | t−1       | t t        |            |
23/43
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | -1.4 | 0.2  | 0.5    |     | 0.4 0.8  | -1.4 0.9 |     | -1.5 0.19 | 0.4  |     |
| --- | ---- | ---- | ------ | --- | -------- | -------- | --- | --------- | ---- | --- |
|     | -0.4 | 0.34 | 0.36 W | σ   | 0.6 0.66 | -0.4 0.7 |     | 0.2 0.34  | 0.34 |     |
1 (cid:12) 0.9 = 0.9 0.1 (cid:12) 0.1 + 1 (cid:12) 0.9 = 1 (cid:12) 0.9 = 0.8
|     | .    | .    | .    |      | . .      | . .     |     | .         | . .     |     |
| --- | ---- | ---- | ---- | ---- | -------- | ------- | --- | --------- | ------- | --- |
|     | . .  | . .  | . .  | U    | . . . .  | . . . . |     | . .       | . . . . |     |
|     | -2   | 0.29 | 0.6  | 0.7  | 0.2 0.71 | -2 0.8  |     | -1.9 0.32 | 0.12    |     |
|     | st−1 | ot−1 | ht−1 | -0.2 | s˜t it   | st−1 ft |     | st ot     | ht      |     |
1.1
selectivewrite . . selectiveread selectiveforget selectivewrite
.
-0.3
xt
|     | We  | now | have the | full | set of equations | for LSTMs |     |     |     |     |
| --- | --- | --- | -------- | ---- | ---------------- | --------- | --- | --- | --- | --- |
The green box together with the selective write operations following it, show
|        | all   | the computations |      |      | which happen | at timestep | t             |       |            |     |
| ------ | ----- | ---------------- | ---- | ---- | ------------ | ----------- | ------------- | ----- | ---------- | --- |
| Gates: |       |                  |      |      |              | States:     |               |       |            |     |
| o      | = σ(W | h                | +U x | +b ) |              | s˜ =        | σ(Wh          | +Ux   | +b)        |     |
| t      |       | o t−1            | o t  | o    |              | t           |               | t−1   | t          |     |
| i      | = σ(W | h                | +U x | +b ) |              | s =         | f (cid:12)s   | +i    | (cid:12)s˜ |     |
| t      |       | i t−1            | i t  | i    |              | t           | t             | t−1   | t t        |     |
| f      | = σ(W | h                | +U x | +b ) |              | h =         | o (cid:12)σ(s | ) and | rnn        | = h |
| t      |       | f t−1            | f    | t f  |              | t           | t             | t     | out        | t   |
24/43
|     |     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |
| --- | --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- |

Note
LSTM has many variants which include different number of gates and also
different arrangement of gates
The one which we just saw is one of the most popular variants of LSTM
Another equally popular variant of LSTM is Gated Recurrent Unit which we
will see next
25/43
MiteshM.Khapra CS7015(DeepLearning): Lecture15

|     |     |     | -1.4 | 0.2          |      | 0.4 | 0.8          | -1.4 | 0.2          | -1.5 |     |     |
| --- | --- | --- | ---- | ------------ | ---- | --- | ------------ | ---- | ------------ | ---- | --- | --- |
|     |     |     | -0.4 | 0.34         | W σ  | 0.6 | 0.66         | -0.4 | 0.34         | 0.2  |     |     |
|     |     |     | 1    | (cid:12) 0.9 |      | 0.1 | (cid:12) 0.1 | + 1  | (cid:12) 0.9 | = 1  |     |     |
|     |     |     | .    | .            |      | .   | .            | .    | .            | .    |     |     |
|     |     |     | . .  | . .          | U    | . . | . .          | . .  | . .          | . .  |     |     |
|     |     |     | -2   | 0.29         | 0.7  | 0.2 | 0.71         | -2   | 0.29         | -1.9 |     |     |
|     |     |     | st−1 | ot           | -0.2 | s˜t | it           | st−1 | 1−it         | st   |     |     |
1.1
. .
.
-0.3
xt
| The | full | set of | equations | for | GRUs |     |     |     |     |     |     |     |
| --- | ---- | ------ | --------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
Gates:
|     | o   | = σ(W | s     | +U x | +b ) |     |     | No explicit               |           | forget | gate (the | forget |
| --- | --- | ----- | ----- | ---- | ---- | --- | --- | ------------------------- | --------- | ------ | --------- | ------ |
|     |     | t     | o t−1 | o    | t o  |     |     |                           |           |        |           |        |
|     | i   | = σ(W | s     | +U x | +b ) |     |     | gate                      | and input | gates  | are tied) |        |
|     |     | t     | i t−1 | i    | t i  |     |     |                           |           |        |           |        |
|     |     |       |       |      |      |     |     | Thegatesdependdirectlyons |           |        |           | and    |
t−1
States:
|     |      |       |            |      |            |     |     | not the | intermediate |     | h t−1 as | in the |
| --- | ---- | ----- | ---------- | ---- | ---------- | --- | --- | ------- | ------------ | --- | -------- | ------ |
|     | s˜ = | σ(W(o | (cid:12)s  | )+Ux | +b)        |     |     | case    | of LSTMs     |     |          |        |
|     | t    |       | t          | t−1  | t          |     |     |         |              |     |          |        |
|     | s =  | (1−i  | )(cid:12)s | +i   | (cid:12)s˜ |     |     |         |              |     |          |        |
|     | t    |       | t          | t−1  | t t        |     |     |         |              |     |          |        |
26/43
|     |     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture15 |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

| Module    | 15.3: How | LSTMs | avoid the | problem | of  |
| --------- | --------- | ----- | --------- | ------- | --- |
| vanishing | gradients |       |           |         |     |
27/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| -1.4 0.2  | 0.5      | 0.4 0.8  | -1.4 0.9 | -1.5 0.19 | 0.4  |     |
| --------- | -------- | -------- | -------- | --------- | ---- | --- |
| -0.4 0.34 | 0.36 W σ | 0.6 0.66 | -0.4 0.7 | 0.2 0.34  | 0.34 |     |
1 (cid:12) 0.9 = 0.9 0.1 (cid:12) 0.1 + 1 (cid:12) 0.9 = 1 (cid:12) 0.9 = 0.8
| . .       | .         | . .       | . .     | .         | . .     |     |
| --------- | --------- | --------- | ------- | --------- | ------- | --- |
| . . . .   | . .       | U . . . . | . . . . | . .       | . . . . |     |
| -2 0.29   | 0.6 0.7   | 0.2 0.71  | -2 0.8  | -1.9 0.32 | 0.12    |     |
| st−1 ot−1 | ht−1 -0.2 | s˜t it    | st−1 ft | st        | ot ht   |     |
1.1
selectivewrite . . selectiveread selectiveforget selectivewrite
.
-0.3
xt
Intuition
| During | forward propagation | the | Similarly | during | backward |     |
| ------ | ------------------- | --- | --------- | ------ | -------- | --- |
gates control the flow of information propagation they control the flow of
gradients
| They prevent | any irrelevant |     |     |     |     |     |
| ------------ | -------------- | --- | --- | --- | --- | --- |
information from being written to It is easy to see that during
| the state |     |     | backward   | pass | the gradients | will get |
| --------- | --- | --- | ---------- | ---- | ------------- | -------- |
|           |     |     | multiplied | by   | the gate      |          |
28/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

| -1.4 0.2  | 0.5      | 0.4 | 0.8 -1.4 0.9  | -1.5 0.19 | 0.4  |
| --------- | -------- | --- | ------------- | --------- | ---- |
| -0.4 0.34 | 0.36 W σ | 0.6 | 0.66 -0.4 0.7 | 0.2 0.34  | 0.34 |
1 (cid:12) 0.9 = 0.9 0.1 (cid:12) 0.1 + 1 (cid:12) 0.9 = 1 (cid:12) 0.9 = 0.8
| . .       | .         | .     | . . .       | . .       | .    |
| --------- | --------- | ----- | ----------- | --------- | ---- |
| . . . .   | . .       | U . . | . . . . . . | . . . .   | . .  |
| -2 0.29   | 0.6 0.7   | 0.2   | 0.71 -2 0.8 | -1.9 0.32 | 0.12 |
| st−1 ot−1 | ht−1 -0.2 | s˜t   | it st−1 ft  | st ot     | ht   |
1.1
selectivewrite . . selectiveread selectiveforget selectivewrite
.
-0.3
xt
If the state at time t−1 did not contribute much to the state at time t (i.e., if
(cid:107)f (cid:107) → 0 and (cid:107)o (cid:107) → 0) then during backpropagation the gradients flowing
| t    | t−1           |     |     |     |     |
| ---- | ------------- | --- | --- | --- | --- |
| into | s will vanish |     |     |     |     |
t−1
But this kind of a vanishing gradient is fine (since s did not contribute to s
t−1 t
| we don’t | want to hold | it responsible | for the crimes | of s ) |     |
| -------- | ------------ | -------------- | -------------- | ------ | --- |
t
The key difference from vanilla RNNs is that the flow of information and
gradients is controlled by the gates which ensure that the gradients vanish only
| when | they should (i.e., | when s | didn’t contribute | much | to s ) |
| ---- | ------------------ | ------ | ----------------- | ---- | ------ |
|      |                    |        | t−1               |      | t      |
29/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

We will now see an illustrative proof of how the gates control the flow of gradients
30/43
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |
| -------------- | --------------------- | --------- |

| L1(θ) L2(θ) | L3(θ) | L4(θ)  |     |     |                |           |      |                   |            |
| ----------- | ----- | ------ | --- | --- | -------------- | --------- | ---- | ----------------- | ---------- |
|             |       |        |     |     | Recall         | that      | RNNs |                   | had this   |
|             |       |        |     |     | multiplicative |           | term | which             | caused the |
| V           | V     | V V    |     |     | gradients      | to vanish |      |                   |            |
| W           | W     | W W... |     |     |                |           |      |                   |            |
| s1          | s2 s3 | s4     |     |     |                |           |      | t t−1             |            |
|             |       |        |     |     | ∂L (θ)         | ∂L        | (θ)  | (cid:88) (cid:89) | ∂s ∂+s     |
|             |       |        |     |     | t              | =         | t    |                   | j+1 k      |
| U           | U     | U U    |     |     | ∂W             | ∂s        |      |                   | ∂s ∂W      |
|             |       |        |     |     |                |           | t    |                   | j          |
k=1j=k
L
| x1      | x2 x3 | x4      |       |     | In particular, |     | if the           | loss at | 4 (θ) was |
| ------- | ----- | ------- | ----- | --- | -------------- | --- | ---------------- | ------- | --------- |
|         |       |         |       |     | highbecauseW   |     | wasnotgoodenough |         |           |
| s 0 s 1 | s 2   | s 3 s 4 | L (θ) |     |                |     |                  |         |           |
4
|     |     |     |     |     | to compute |     | s correctly |     | then this |
| --- | --- | --- | --- | --- | ---------- | --- | ----------- | --- | --------- |
1
|     |     |     |     |     | information |     | will not | be       | propagated |
| --- | --- | --- | --- | --- | ----------- | --- | -------- | -------- | ---------- |
|     |     |     |     |     | back to     | W   | as the   | gradient | ∂L t(θ)    |
W
∂W
|     |     |     |     |     | along this | long | path | will | vanish |
| --- | --- | --- | --- | --- | ---------- | ---- | ---- | ---- | ------ |
31/43
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| L1(θ) L2(θ) L3(θ) | L4(θ) |     |             |     |          |     |          |
| ----------------- | ----- | --- | ----------- | --- | -------- | --- | -------- |
|                   |       |     | In general, | the | gradient |     | of L (θ) |
t
|     |     |     | w.r.t. θ | vanishes | when | the | gradients |
| --- | --- | --- | -------- | -------- | ---- | --- | --------- |
i
| V V   | V V    |     | flowing   | through   | each       | and          | every    |
| ----- | ------ | --- | --------- | --------- | ---------- | ------------ | -------- |
|       |        |     | path from | L (θ)     | to         | θ vanish.    |          |
| W W   | W W... |     |           | t         |            | i            |          |
| s1 s2 | s3 s4  |     |           |           |            |              |          |
|       |        |     | On the    | other     | hand,      | the gradient | of       |
| U U   | U U    |     | L (θ)     | w.r.t.    | θ explodes |              | when the |
|       |        |     | t         |           | i          |              |          |
|       |        |     | gradient  | flowing   | through    |              | at least |
| x1 x2 | x3 x4  |     | one path  | explodes. |            |              |          |
s 0 s 1 s 2 s 3 s 4 L (θ) We will first argue that in the case of
4
|     |     |     | LSTMs       | there | exists        | at least | one path  |
| --- | --- | --- | ----------- | ----- | ------------- | -------- | --------- |
|     |     |     | through     | which | the gradients |          | can flow  |
|     | W   |     | effectively | (and  | hence         | no       | vanishing |
gradients)
32/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

|     |     | We        | will start |       | with the  | dependency  |          | graph |
| --- | --- | --------- | ---------- | ----- | --------- | ----------- | -------- | ----- |
|     |     | involving | different  |       | variables |             | in LSTMs |       |
|     |     | Starting  | with       | the   | states    | at timestep |          | k−1   |
|     |     |           | o          | = σ(W | h         | +U          | x +b     | )     |
|     |     |           | k          |       | o k−1     |             | o k o    |       |
sskk−−11
hhkk−−11 Wo,Uo,bo
|                  |      | For | simplicity | we    | will omit | the  | parameters | for |
| ---------------- | ---- | --- | ---------- | ----- | --------- | ---- | ---------- | --- |
|                  |      | now | and return |       | back to   | them | later      |     |
| ss˜˜kk ffkk iikk | ookk |     |            |       |           |      |            |     |
|                  |      |     | i          | = σ(W | h         | +U   | x +b )     |     |
| sskk             |      |     | k          |       | i k−1     | i    | k i        |     |
hk
|     |     |     | f    | = σ(W  | h           | +U  | x +b       | )   |
| --- | --- | --- | ---- | ------ | ----------- | --- | ---------- | --- |
|     |     |     | k    |        | f k−1       |     | f k f      |     |
|     |     |     | s˜ k | = σ(Wh | k−1         | +Ux | k +b)      |     |
|     |     |     | s    | = f    | (cid:12)s   | +i  | (cid:12)s˜ |     |
|     |     |     | k    | k      | k−1         | k   | k          |     |
|     |     |     | h    | = o    | (cid:12)σ(s | )   |            |     |
|     |     |     | k    | k      | k           |     |            |     |
33/43
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

sk−1
hk−1
| s˜k | fk  | ik  | ok  |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sk
hk
|      |     |     |     | Starting | from h | and | s   | we have | reached |     |
| ---- | --- | --- | --- | -------- | ------ | --- | --- | ------- | ------- | --- |
|      |     |     |     |          |        | k−1 | k−1 |         |         |     |
| st−1 |     |     |     | h and s  |        |     |     |         |         |     |
|      |     |     |     | k        | k      |     |     |         |         |     |
ht−1
|     |     |     |     | And the | recursion | will | now | continue | till | the |
| --- | --- | --- | --- | ------- | --------- | ---- | --- | -------- | ---- | --- |
last timestep
ot
| s˜t | ft  | it  |       |                |        |            |                  |      |         |     |
| --- | --- | --- | ----- | -------------- | ------ | ---------- | ---------------- | ---- | ------- | --- |
|     |     |     |       | For simplicity | and    | ease       | of illustration, |      | instead |     |
|     |     |     |       | of considering | the    | parameters |                  | (W,  | W ,     | W , |
| st  |     |     |       |                |        |            |                  |      | o       | i   |
|     |     |     |       | W , U,         | U , U  | , U )      | as separate      |      | nodes   | in  |
|     | ht  |     | Lt(θ) | f              | o      | i f        |                  |      |         |     |
|     |     |     |       | the graph      | we     | will just  | put              | them | on      | the |
|     |     |     |       | appropriate    | edges. |            | (We show         | only | a       | few |
34/43
| sk−1 |     |     |                | parameters            | and | not all)  |     |     |     |     |
| ---- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- | --- |
|      |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |     |     |
hk−1
|     |     | Wo  |     | For simplicity | and | ease | of illustration, |     | instead |     |
| --- | --- | --- | --- | -------------- | --- | ---- | ---------------- | --- | ------- | --- |
W
|     | Wf  | Wi  |     | of considering | the   | parameters |             | (W,  | W ,   | W , |
| --- | --- | --- | --- | -------------- | ----- | ---------- | ----------- | ---- | ----- | --- |
|     |     |     |     |                |       |            |             |      | o     | i   |
| s˜k | fk  | ik  | ok  |                |       |            |             |      |       |     |
|     |     |     |     | W , U,         | U , U | , U )      | as separate |      | nodes | in  |
|     |     |     |     | f              | o     | i f        |             |      |       |     |
|     |     |     |     | the graph      | we    | will just  | put         | them | on    | the |
sk
|     | hk  |     |     | appropriate | edges.         |          | (We show | only    | a   | few |
| --- | --- | --- | --- | ----------- | -------------- | -------- | -------- | ------- | --- | --- |
|     |     |     |     | parameters  | and            | not all) |          |         |     |     |
|     |     |     |     | We are      | now interested |          | in       | knowing | if  | the |
st−1
|     |      |     |     | gradientfromL |     | (θ)flowsbacktoanarbitrary |     |     |     |     |
| --- | ---- | --- | --- | ------------- | --- | ------------------------- | --- | --- | --- | --- |
|     | ht−1 |     |     |               |     | t                         |     |     |     |     |
|     |      |     |     | timestep      | k   |                           |     |     |     |     |
| s˜t | ft   | it  | ot  |               |     |                           |     |     |     |     |
st
|     | ht  |     | Lt(θ) |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |

|      |     |     | For example, | we    | are | interested | in  | knowing | if  |
| ---- | --- | --- | ------------ | ----- | --- | ---------- | --- | ------- | --- |
| sk−1 |     |     | the gradient | flows | to  | W through  | s   |         |     |
|      |     |     |              |       |     | f          |     | k       |     |
hk−1
|     |       |     | In other  | words,  | if L (θ) | was         | high because |     | W   |
| --- | ----- | --- | --------- | ------- | -------- | ----------- | ------------ | --- | --- |
|     |       |     |           |         | t        |             |              |     | f   |
|     | W Wo  |     |           |         |          |             |              |     |     |
|     | Wf Wi |     | failed to | compute | an       | appropriate | value        | for | s   |
k
| s˜k | fk ik | ok  |           |               |     |        |           |     |     |
| --- | ----- | --- | --------- | ------------- | --- | ------ | --------- | --- | --- |
|     |       |     | then this | information   |     | should | flow back | to  | W f |
|     |       |     | through   | the gradients |     |        |           |     |     |
sk
hk
|     |     |     | We can     | ask a similar | question |     | about | the      | other |
| --- | --- | --- | ---------- | ------------- | -------- | --- | ----- | -------- | ----- |
|     |     |     | parameters | (for          | example, | W   | , W , | W, etc.) |       |
i o
|     |     |     | How does | LSTM | ensure | that | this | gradient |     |
| --- | --- | --- | -------- | ---- | ------ | ---- | ---- | -------- | --- |
st−1
|     |     |     | does not | vanish | even | at arbitrary | time | steps? |     |
| --- | --- | --- | -------- | ------ | ---- | ------------ | ---- | ------ | --- |
ht−1
Let us see
| s˜t | ft it | ot  |     |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
st
|     | ht  | Lt(θ) |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
35/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

∂Lt(θ)
|     |     |     | It is sufficient | to  | show | that |     | does not |
| --- | --- | --- | ---------------- | --- | ---- | ---- | --- | -------- |
∂s
| sk−1 |     |     |        |             |           |     | k       |        |
| ---- | --- | --- | ------ | ----------- | --------- | --- | ------- | ------ |
|      |     |     | vanish | (because if | this does | not | va nish | we can |
hk−1
|     |       |     | reach W | through | s ) |     |     |     |
| --- | ----- | --- | ------- | ------- | --- | --- | --- | --- |
|     |       |     |         | f       | k   |     |     |     |
| W   | Wo    |     |         |         |     |     |     |     |
|     | Wf Wi |     |         |         |     |     |     |     |
First,weobservethattherearemultiplepaths
| s˜k | fk ik | ok  |           |               |      |                  |            |     |
| --- | ----- | --- | --------- | ------------- | ---- | ---------------- | ---------- | --- |
|     |       |     | from L    | (θ) to s (you | just | need             | to reverse | the |
|     |       |     |           | t k           |      |                  |            |     |
|     |       |     | direction | of the arrows | for  | backpropagation) |            |     |
sk
hk
|     |     |     | For example, | there | is one | path | through | s , |
| --- | --- | --- | ------------ | ----- | ------ | ---- | ------- | --- |
k+1
|     |     |     | another | through h |     |     |     |     |
| --- | --- | --- | ------- | --------- | --- | --- | --- | --- |
k
|     |     |     | Further, | there are | multiple | paths |     | to reach |
| --- | --- | --- | -------- | --------- | -------- | ----- | --- | -------- |
st−1
|     | ht−1 |     | to h itself | (as should |     | be obvious |     | from the |
| --- | ---- | --- | ----------- | ---------- | --- | ---------- | --- | -------- |
k
|     |     |     | number | of outgoing | arrows | from | h ) |     |
| --- | --- | --- | ------ | ----------- | ------ | ---- | --- | --- |
k
| s˜t | ft it | ot  | So at this | point | just convince |     | yourself | that |
| --- | ----- | --- | ---------- | ----- | ------------- | --- | -------- | ---- |
L
|     |     |     | there are | many paths | from | (θ) | to  | s   |
| --- | --- | --- | --------- | ---------- | ---- | --- | --- | --- |
|     |     |     |           |            |      | t   |     | k   |
st
|     | ht  | Lt(θ) |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- |
36/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|      |     |      |     | Consider |            | one such | path         | (highlighted) |      | which   |
| ---- | --- | ---- | --- | -------- | ---------- | -------- | ------------ | ------------- | ---- | ------- |
| sk−1 |     |      |     | will     | contribute | to       | the gradient |               |      |         |
|      |     | hk−1 |     | Let      | us denote  | the      | gradient     | along         | this | path as |
t
0
ok
|     | s˜k | fk ik |     |     |     | ∂L    |     |       |     |     |
| --- | --- | ----- | --- | --- | --- | ----- | --- | ----- | --- | --- |
|     |     |       |     |     |     | (θ)∂h |     | ∂s    | ∂s  |     |
|     |     |       |     |     | t   | = t   | t   | t ... | k+1 |     |
0
| sk  |     |     |     |     |     | ∂h  | ∂s  | ∂s  | ∂s  |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | t   | t   | t−1 |     | k   |
hk
∂L t(θ)
|     |     |     |     | The | first | term |     | is fine | and | it doesn’t |
| --- | --- | --- | --- | --- | ----- | ---- | --- | ------- | --- | ---------- |
∂ h
|     |     |     |     |        |     |            | t              |     | L   |           |
| --- | --- | --- | --- | ------ | --- | ---------- | -------------- | --- | --- | --------- |
|     |     |     |     | vanish | (h  | t is direc | t ly connected |     | to  | t (θ) and |
st−1
|     |     |     |     | there | are | no intermediate |     | nodes | which | can |
| --- | --- | --- | --- | ----- | --- | --------------- | --- | ----- | ----- | --- |
ht−1
|     |     |       |     | cause | the      | gradient | to vanish) |       |       |     |
| --- | --- | ----- | --- | ----- | -------- | -------- | ---------- | ----- | ----- | --- |
|     |     |       |     | We    | will now | look     | at the     | other | terms |     |
|     | s˜t | ft it | ot  |       |          |          |            |       |       |     |
|     |     |       |     | ∂ht   | ∂st      | (∀t)     |            |       |       |     |
∂st ∂st−1
st
|     |     | ht  | Lt(θ) |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
37/43
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture15 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

∂ht
|     |     |     | Let us | first look | at  |     |     |     |
| --- | --- | --- | ------ | ---------- | --- | --- | --- | --- |
∂st
| sk−1 |     |     | Recall | that |     |     |     |     |
| ---- | --- | --- | ------ | ---- | --- | --- | --- | --- |
hk−1
|     |     |     |     |     | h = o | (cid:12)σ(s | )   |     |
| --- | --- | --- | --- | --- | ----- | ----------- | --- | --- |
|     |     |     |     |     | t t   |             | t   |     |
ok
| s˜k | fk ik |     |           |           |              |          |          |        |
| --- | ----- | --- | --------- | --------- | ------------ | -------- | -------- | ------ |
|     |       |     | Note that | h         | only depends |          | on o and | s and  |
|     |       |     |           | ti        |              |          | ti       | ti     |
| sk  |       |     | not on    | any other | elements     | of       | o and    | s      |
|     |       |     |           |           |              |          | t        | t      |
|     | hk    |     | ∂ht       |           |              |          |          |        |
|     |       |     | will      | thus      | be a square  | diagonal |          | matrix |
∂st
Rd×d
|      |      |     | ∈                     | whose     | diagonal      | will     | be         |     |
| ---- | ---- | --- | --------------------- | --------- | ------------- | -------- | ---------- | --- |
|      |      |     | o (cid:12)σ(cid:48)(s | ) ∈       | Rd (see slide | 35       | of Lecture | 14) |
| st−1 |      |     | t                     | t         |               |          |            |     |
|      | ht−1 |     | We will               | represent | this          | diagonal | matrix     | by  |
(cid:12)σ(cid:48)(s
|     |       |     | D(o | ))  |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- |
|     |       |     | t   | t   |     |     |     |     |
| s˜t | ft it | ot  |     |     |     |     |     |     |
st
|     | ht  | Lt(θ) |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- |
38/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

∂st
|     |     |     | Now let | us consider |     |     |     |
| --- | --- | --- | ------- | ----------- | --- | --- | --- |
∂st−1
| sk−1 |     |     | Recall | that |     |     |     |
| ---- | --- | --- | ------ | ---- | --- | --- | --- |
hk−1
|     |     |     |     | s = f | (cid:12)s | +i (cid:12)s˜ |     |
| --- | --- | --- | --- | ----- | --------- | ------------- | --- |
|     |     |     |     | t t   | t−1       | t t           |     |
ok
| s˜k | fk ik |     |        |              |            |      |       |
| --- | ----- | --- | ------ | ------------ | ---------- | ---- | ----- |
|     |       |     | Notice | that s˜ also | depends    | on s | so we |
|     |       |     |        | t            |            |      | t−1   |
| sk  |       |     | cannot | treat it as  | a constant |      |       |
hk
|     |     |     | So once | again we | are dealing | with | an ordered |
| --- | --- | --- | ------- | -------- | ----------- | ---- | ---------- |
|     |     |     | network | and thus | ∂st will    | be a | sum of an  |
∂st−1
|     |     |     | explicit | term and | an implicit | term | (see slide |
| --- | --- | --- | -------- | -------- | ----------- | ---- | ---------- |
st−1
|     | ht−1  |       | 37 from         | Lecture 14)         |                |              |            |
| --- | ----- | ----- | --------------- | ------------------- | -------------- | ------------ | ---------- |
|     |       |       | For simplicity, | let                 | us assume      | that the     | gradient   |
|     |       |       | from the        | implicit            | term           | vanishes     | (we are    |
| s˜t | ft it | ot    |                 |                     |                |              |            |
|     |       |       | assuming        | a worst             | case scenario) |              |            |
| st  |       |       | And the         | gradient            | from           | the explicit | term       |
|     | ht    | Lt(θ) | (treating       | s˜ t as a constant) |                | is given     | by D(f t ) |
39/43
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture15 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|      |     |     |     | We  | now | return | back | to our | full expression |     | for |
| ---- | --- | --- | --- | --- | --- | ------ | ---- | ------ | --------------- | --- | --- |
| sk−1 |     |     |     | t   | :   |        |      |        |                 |     |     |
0
hk−1
|      |     |       |     |                                       | ∂L            | (θ)∂h    | ∂s                  |               | ∂s                   |     |     |
| ---- | --- | ----- | --- | ------------------------------------- | ------------- | -------- | ------------------- | ------------- | -------------------- | --- | --- |
|      |     |       |     |                                       |               | t        | t                   | t             | k+1                  |     |     |
|      |     |       |     | t                                     | =             |          |                     | ...           |                      |     |     |
|      |     |       |     |                                       | 0 ∂h          | ∂s       | ∂s                  |               | ∂s                   |     |     |
|      |     |       | ok  |                                       |               | t        | t t−1               |               | k                    |     |     |
|      | s˜k | fk ik |     |                                       |               |          |                     |               |                      |     |     |
|      |     |       |     |                                       | = L(cid:48)(h | ).D(o    | (cid:12)σ(cid:48)(s | ))D(f         | )...D(f              |     | )   |
|      |     |       |     |                                       | t             | t        | t                   | t             | t                    |     | k+1 |
| sk   |     |       |     |                                       | L(cid:48)     |          | (cid:12)σ(cid:48)(s |               |                      |     |     |
|      |     |       |     |                                       | =             | (h ).D(o |                     | ))D(f         | (cid:12)...(cid:12)f |     | )   |
|      |     | hk    |     |                                       | t             | t        | t                   | t             | t                    |     | k+1 |
|      |     |       |     |                                       | = L(cid:48)(h | ).D(o    | (cid:12)σ(cid:48)(s | ))D((cid:12)t |                      | f ) |     |
|      |     |       |     |                                       | t             | t        | t                   | t             | i=k+1                | i   |     |
| st−1 |     |       |     | Theredtermsdon’tvanishandtheblueterms |               |          |                     |               |                      |     |     |
ht−1
|     |     |       |     | contain |           | a multiplication |          | of       | the forget   | gates        |     |
| --- | --- | ----- | --- | ------- | --------- | ---------------- | -------- | -------- | ------------ | ------------ | --- |
|     |     |       |     | The     | forget    | gates            | thus     | regulate |              | the gradient |     |
|     | s˜t | ft it | ot  | flow    | depending |                  | on the   | explicit | contribution |              | of  |
|     |     |       |     | a       | state (s  | ) to             | the next | state    | s            |              |     |
|     |     |       |     |         |           | t                |          |          | t+1          |              |     |
st
|     |     | ht  | Lt(θ) |     |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
40/43
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | If during | forward |     | pass | s did | not contribute |     |
| --- | --- | --- | --- | --------- | ------- | --- | ---- | ----- | -------------- | --- |
t
| sk−1 |     |      |     | much           | to s | (because |     | f → 0)   | then | during   |
| ---- | --- | ---- | --- | -------------- | ---- | -------- | --- | -------- | ---- | -------- |
|      |     |      |     |                | t+1  |          |     | t        |      |          |
|      |     | hk−1 |     | backpropgation |      | also     | the | gradient |      | will not |
reach s
t
|     |     |       | ok  | This is | fine | because | if    | s did not | contribute |         |
| --- | --- | ----- | --- | ------- | ---- | ------- | ----- | --------- | ---------- | ------- |
|     | s˜k | fk ik |     |         |      |         |       | t         |            |         |
|     |     |       |     | much to | s    | then    | there | is no     | reason     | to hold |
t+1
| sk  |     |     |     | it responsible |     | during | backpropgation |     |     | (f does |
| --- | --- | --- | --- | -------------- | --- | ------ | -------------- | --- | --- | ------- |
t
hk
|      |     |       |     | the same     | regulation |         | during | forward  |              | pass and |
| ---- | --- | ----- | --- | ------------ | ---------- | ------- | ------ | -------- | ------------ | -------- |
|      |     |       |     | backward     | pass       | which   | is     | fair)    |              |          |
| st−1 |     |       |     | Thus there   |            | exists  | this   | one path | along        | which    |
|      |     | ht−1  |     | the gradient |            | doesn’t | vanish | when     | it shouldn’t |          |
|      |     |       |     | And as       | argued     | as      | long   | as the   | gradient     | flows    |
|      | s˜t | ft it | ot  | back to      | W          | through | one    | of the   | paths        | (t )     |
|      |     |       |     |              | f          |         |        |          |              | 0        |
|      |     |       |     | through      | s we       | are     | fine   | !        |              |          |
k
| st  |     |     |       | Of course | the | gradient  |     | flows back | only | when    |
| --- | --- | --- | ----- | --------- | --- | --------- | --- | ---------- | ---- | ------- |
|     |     | ht  | Lt(θ) | required  | as  | regulated | by  | f ’s (but  | let  | me just |
i
|     |     |     |     | say it one | last | time | that | this is | fair) |     |
| --- | --- | --- | --- | ---------- | ---- | ---- | ---- | ------- | ----- | --- |
41/43
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture15 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | Now     | we will | see       | why | LSTMs     | do not solve | the |
| --- | --- | --- | --- | ------- | ------- | --------- | --- | --------- | ------------ | --- |
|     |     |     |     | problem | of      | exploding |     | gradients |              |     |
sk−1
|     |     |     |     | We  | will | show | a path | through | which | the |
| --- | --- | --- | --- | --- | ---- | ---- | ------ | ------- | ----- | --- |
hk−1
|     |     |     |     | gradient | can | explode |     |     |     |     |
| --- | --- | --- | --- | -------- | --- | ------- | --- | --- | --- | --- |
∂Lt(θ)
|     |     |       | ok  | Let | us compute |     | one | term (say | t ) of |     |
| --- | --- | ----- | --- | --- | ---------- | --- | --- | --------- | ------ | --- |
|     | s˜k | fk ik |     |     |            |     |     |           | 1      | ∂h  |
k−1
|     |     |     |     | corresponding |     |     | to the | highlighted | path |     |
| --- | --- | --- | --- | ------------- | --- | --- | ------ | ----------- | ---- | --- |
sk
|     |     |     |     |     |     | (cid:18) |     | (cid:19) | (cid:18) | (cid:19) |
| --- | --- | --- | --- | --- | --- | -------- | --- | -------- | -------- | -------- |
|     |     | hk  |     |     | ∂L  | (θ)      | ∂h  | ∂o       | ∂h ∂o    |          |
|     |     |     |     |     | t = | t        | t   | t ...    | k        | k        |
1
|      |     |     |     |     |              | ∂h t      | ∂o t ∂h | t−1                   | ∂o k ∂h | k−1 |
| ---- | --- | --- | --- | --- | ------------ | --------- | ------- | --------------------- | ------- | --- |
|      |     |     |     |     | =L(cid:48)(h |           |         | )(cid:12)o(cid:48)).W |         |     |
|      |     |     |     |     |              | t )(D(σ(s | t       |                       | o )...  |     |
| st−1 |     |     |     |     |              | t         |         | t                     |         |     |
)(cid:12)o(cid:48)).W
|     |     | ht−1 |     |     |     | (D(σ(s | k   | o   | )   |     |
| --- | --- | ---- | --- | --- | --- | ------ | --- | --- | --- | --- |
k
|     |     |       |     | (cid:107)t | (cid:107)≤(cid:107)L(cid:48)(h | )(cid:107)((cid:107)K(cid:107)(cid:107)W |          | (cid:107))t−k+1 |          |         |
| --- | --- | ----- | --- | ---------- | ------------------------------ | ---------------------------------------- | -------- | --------------- | -------- | ------- |
|     |     |       |     | 1          |                                | t t                                      |          | o               |          |         |
|     | s˜t | ft it | ot  |            |                                |                                          |          |                 |          |         |
|     |     |       |     | Depending  |                                | on                                       | the norm | of              | matrix W | o , the |
|     |     |       |     | gradient   |                                | ∂Lt(θ)                                   | may      | explode         |          |         |
st
∂h k−1
|     |     | ht  | Lt(θ) | Similarly, |     | W ,        | W and | W can | also cause | the |
| --- | --- | --- | ----- | ---------- | --- | ---------- | ----- | ----- | ---------- | --- |
|     |     |     |       |            |     | i          | f     |       |            |     |
|     |     |     |       | gradients  |     | to explode |       |       |            |     |
42/43
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     |     | Lecture15 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --- | --------- | --- | --- |
sk−1
hk−1
|     | s˜k | fk ik | ok  |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
sk
hk
st−1
ht−1
|     | s˜t | ft it | ot  |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
st
|     |     | ht  | Lt(θ) |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |

|      |     |     | So how    | do we     | deal | with the | problem | of  |
| ---- | --- | --- | --------- | --------- | ---- | -------- | ------- | --- |
| sk−1 |     |     | exploding | gradients | ?    |          |         |     |
hk−1
|           |     |     | One popular                   | trick       | is to | use gradient | clipping     |     |
| --------- | --- | --- | ----------------------------- | ----------- | ----- | ------------ | ------------ | --- |
|           |     |     | While backpropagating         |             |       | if the       | norm of      | the |
| s˜k fk ik | ok  |     |                               |             |       |              |              |     |
|           |     |     | gradientexceedsacertainvalue, |             |       |              | itisscaledto |     |
|           |     |     | keep its                      | norm within | an    | acceptable   | threshold∗   |     |
sk
hk
|      |     |           | Essentially | we        | retain   | the direction | of      | the |
| ---- | --- | --------- | ----------- | --------- | -------- | ------------- | ------- | --- |
|      |     |           | gradient    | but scale | down     | the norm      |         |     |
| st−1 |     | ∗Pascanu, | Razvan,     | Tomas     | Mikolov, | and Yoshua    | Bengio. |     |
ht−1 “On the difficulty of training recurrent neural networks.”
ICML(3)28(2013):1310-1318
| s˜t ft it | ot  |     |     |     |     |     |     |     |
| --------- | --- | --- | --- | --- | --- | --- | --- | --- |
st
ht Lt(θ)
43/43
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture15 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |
