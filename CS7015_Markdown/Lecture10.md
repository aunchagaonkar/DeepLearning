| CS7015   | (Deep     | Learning)       | : Lecture | 10    |
| -------- | --------- | --------------- | --------- | ----- |
| Learning | Vectorial | Representations | Of        | Words |
|          | Mitesh    | M. Khapra       |           |       |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |
| --- | -------------- | --------------------- | --- | --------- |

Acknowledgments
| ‘word2vec | Parameter | Learning | Explained’ | by Xin Rong |     |
| --------- | --------- | -------- | ---------- | ----------- | --- |
‘word2vec Explained: deriving Mikolov et al.’s negative-sampling word-
| embedding      | method’ | by Yoav       | Goldberg    | and Omer Levy |     |
| -------------- | ------- | ------------- | ----------- | ------------- | --- |
| Sebastian      | Ruder’s | blogs on word | embeddingsa |               |     |
| aBlog1, Blog2, | Blog3   |               |             |               |     |
2/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --- | --------------------- | --------- |

| Module | 10.1: One-hot | representations |     | of words |
| ------ | ------------- | --------------- | --- | -------- |
3/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     | Let us    | start with      | a very simple     | mo-   |
| --- | --- | --- | --- | --------- | --------------- | ----------------- | ----- |
|     |     |     |     | tivation  | for why         | we are interested | in    |
|     |     |     |     | vectorial | representations | of                | words |
Supposewearegivenaninputstream
|     |     |     |     | of words      | (sentence,     | document,   | etc.)    |
| --- | --- | --- | --- | ------------- | -------------- | ----------- | -------- |
|     |     |     |     | and we        | are interested | in          | learning |
|     |     |     |     | some function |                | of it (say, | yˆ =     |
sentiments(words))
Model
Say,weemployamachinelearningal-
|            |                  |                        |       | gorithm      | (some mathematical |            | model) |
| ---------- | ---------------- | ---------------------- | ----- | ------------ | ------------------ | ---------- | ------ |
|            |                  |                        |       | for learning | such               | a function | (yˆ =  |
| [5.7, 1.2, | 2.3, -10.2, 4.5, | ..., 11.9, 20.1, -0.5, | 40.7] |              |                    |            |        |
f(x))
|             |                 |                  |        | We first     | need a way  | of converting | the       |
| ----------- | --------------- | ---------------- | ------ | ------------ | ----------- | ------------- | --------- |
| This is by  | far AAMIR       | KHAN’s best one. | Finest |              |             |               |           |
|             |                 |                  |        | input stream | (or         | each word     | in the    |
| casting and | terrific acting | by all.          |        |              |             |               |           |
|             |                 |                  |        | stream)      | to a vector | x (a          | mathemat- |
ical quantity)
4/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     | Given a | corpus, | consider | the set V |
| --- | --- | --- | --- | --- | ------- | ------- | -------- | --------- |
Corpus:
|     |     |     |     |     | of all unique | words | across | all input |
| --- | --- | --- | --- | --- | ------------- | ----- | ------ | --------- |
Human machine interface for computer streams (i.e., all sentences or docu-
| applications |         |             |     |                 | ments)      |     |            |        |
| ------------ | ------- | ----------- | --- | --------------- | ----------- | --- | ---------- | ------ |
| User         | opinion | of computer |     | system response |             |     |            |        |
|              |         |             |     |                 | V is called | the | vocabulary | of the |
time
|      |           |            |     |        | corpus (i.e., | all | sentences | or docu- |
| ---- | --------- | ---------- | --- | ------ | ------------- | --- | --------- | -------- |
| User | interface | management |     | system |               |     |           |          |
ments)
| System | engineering |     | for improved | response |         |                  |     |           |
| ------ | ----------- | --- | ------------ | -------- | ------- | ---------------- | --- | --------- |
|        |             |     |              |          | We need | a representation |     | for every |
time
|     |     |     |     |     | word in | V   |     |     |
| --- | --- | --- | --- | --- | ------- | --- | --- | --- |
V= [human,machine, interface, for, computer, One very simple way of doing this is
| applications,     | user, | opinion,     | of, | system, response, |                    |         |        |           |
| ----------------- | ----- | ------------ | --- | ----------------- | ------------------ | ------- | ------ | --------- |
|                   |       |              |     |                   | to use one-hot     | vectors | of     | size |V|  |
| time, management, |       | engineering, |     | improved]         |                    |         |        |           |
|                   |       |              |     |                   | The representation |         | of the | i-th word |
machine: 0 1 0 ... 0 0 0 will have a 1 in the i-th position and
|     |     |     |     |     | a 0 in the | remaining | |V|−1 | positions |
| --- | --- | --- | --- | --- | ---------- | --------- | ----- | --------- |
5/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

Problems:
| cat: | 0 0 0 | 0 0 1 0 |     |     |     |     |
| ---- | ----- | ------- | --- | --- | --- | --- |
V tendstobeverylarge(forexample,
| dog: | 0 1 0 | 0 0 0 0 | 50KforPTB,13MforGoogle1Tcor- |     |     |     |
| ---- | ----- | ------- | ---------------------------- | --- | --- | --- |
pus)
| truck: | 0 0 0 | 1 0 0 0 |            |                 |                |     |
| ------ | ----- | ------- | ---------- | --------------- | -------------- | --- |
|        |       |         | These      | representations | do not capture |     |
|        |       |         | any notion | of similarity   |                |     |
√
euclid dist(cat,dog) = 2 Ideally, we would want the represent-
√
|        |                 |     | ations   | of cat and dog (both | domestic |       |
| ------ | --------------- | --- | -------- | -------------------- | -------- | ----- |
| euclid | dist(dog,truck) | = 2 |          |                      |          |       |
|        |                 |     | animals) | to be closer         | to each  | other |
| cosine | sim(cat,dog)    | = 0 |          |                      |          |       |
|        |                 |     | than the | representations      | of cat   | and   |
| cosine | sim(dog,truck)  | = 0 |          |                      |          |       |
truck
|     |     |     | However,      | with 1-hot representations, |         |     |
| --- | --- | --- | ------------- | --------------------------- | ------- | --- |
|     |     |     | the Euclidean | distance                    | between | any |
√
|     |     |                | two words             | in the vocabulary | in         | 2   |
| --- | --- | -------------- | --------------------- | ----------------- | ---------- | --- |
|     |     |                | And the               | cosine similarity | between    |     |
|     |     |                | any two               | words in the      | vocabulary | is  |
|     |     |                | 0                     |                   |            | 6/1 |
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10         |            |     |

| Module | 10.2: Distributed |     | Representations | of words |
| ------ | ----------------- | --- | --------------- | -------- |
7/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     |     | You shall      | know a word    | by the com-   |
| --- | --- | --- | --- | --- | -------------- | -------------- | ------------- |
|     |     |     |     |     | pany it        | keeps - Firth, | J. R. 1957:11 |
|     |     |     |     |     | Distributional | similarity     | based rep-    |
resentations
|     |     |     |     |     | This leads | us to the | idea of co- |
| --- | --- | --- | --- | --- | ---------- | --------- | ----------- |
A bank is a financial institution that accepts occurrence matrix
| deposits    | from the  | public and       | creates      | credit. |     |     |     |
| ----------- | --------- | ---------------- | ------------ | ------- | --- | --- | --- |
| The idea    | is to use | the accompanying |              | words   |     |     |     |
| (financial, | deposits, | credit)          | to represent | bank    |     |     |     |
8/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --------- | --- |

Corpus:
|     |     |     |     |     |     | A co-occurrence |     | matrix | is  | a terms× |
| --- | --- | --- | --- | --- | --- | --------------- | --- | ------ | --- | -------- |
Human machine interface for computer ap- terms matrix which captures the
plications
|     |     |     |     |     |     | number | of times | a   | term | appears in |
| --- | --- | --- | --- | --- | --- | ------ | -------- | --- | ---- | ---------- |
User opinion of computer system response the context of another term
time
|         |              |            |        |          |              | The context    |            | is defined      | as a          | window of |
| ------- | ------------ | ---------- | ------ | -------- | ------------ | -------------- | ---------- | --------------- | ------------- | --------- |
| User    | interface    | management |        | system   |              |                |            |                 |               |           |
|         |              |            |        |          |              | k words        | around     | the             | terms         |           |
| System  | engineering  |            | for    | improved | response     |                |            |                 |               |           |
| time    |              |            |        |          |              | Let us         | build      | a co-occurrence |               | matrix    |
|         |              |            |        |          |              | for this       | toy corpus |                 | with k        | = 2       |
|         |              |            |        |          |              | This is        | also       | known           | as a          | word ×    |
|         | human        | machine    | system |          | for ... user |                |            |                 |               |           |
|         |              |            |        |          |              | context        | matrix     |                 |               |           |
| human   | 0            |            | 1      | 0        | 1 ... 0      |                |            |                 |               |           |
| machine | 1            |            | 0      | 0        | 1 ... 0      |                |            |                 |               |           |
| system  | 0            |            | 0      | 0        | 1 ... 2      |                |            |                 |               |           |
|         |              |            |        |          |              | You could      | choose     | the             | set           | of words  |
| for     | 1            |            | 1      | 1        | 0 ... 0      |                |            |                 |               |           |
| .       | .            |            | .      | .        | . . .        | and contexts   |            | to be           | same or       | different |
| .       | .            |            | .      | .        | . . .        |                |            |                 |               |           |
| .       | .            |            | .      | .        | . . .        |                |            |                 |               |           |
| user    | 0            |            | 0      | 2        | 0 ... 0      | Each row       |            | (column)        | of            | the co-   |
|         |              |            |        |          |              | occurrence     | matrix     |                 | gives a       | vectorial |
|         | Co-occurence |            |        | Matrix   |              |                |            |                 |               |           |
|         |              |            |        |          |              | representation |            | of the          | corresponding |           |
|         |              |            |        |          |              | word (context) |            |                 |               |           |
9/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     | Some (fixable) | problems       |                     |
| --- | --- | --- | -------------- | -------------- | ------------------- |
|     |     |     | Stop words     | (a, the,       | for, etc.) are very |
|     |     |     | frequent       | → these counts | will be very        |
high
| human     | machine system | for ... user |     |     |     |
| --------- | -------------- | ------------ | --- | --- | --- |
| human 0   | 1              | 0 1 ... 0    |     |     |     |
| machine 1 | 0              | 0 1 ... 0    |     |     |     |
| system 0  | 0              | 0 1 ... 2    |     |     |     |
| for 1     | 1              | 1 0 ... 0    |     |     |     |
| . .       | .              | . . . .      |     |     |     |
| . .       | .              | . . . .      |     |     |     |
| . .       | .              | . . . .      |     |     |     |
| user 0    | 0              | 2 0 ... 0    |     |     |     |
10/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | Some (fixable) | problems       |          |
| --- | --- | --- | -------------- | -------------- | -------- |
|     |     |     | Solution       | 1: Ignore very | frequent |
words
| human     | machine system | ... user |     |     |     |
| --------- | -------------- | -------- | --- | --- | --- |
| human 0   | 1 0            | ... 0    |     |     |     |
| machine 1 | 0 0            | ... 0    |     |     |     |
| system 0  | 0 0            | ... 2    |     |     |     |
| . .       | . .            | . .      |     |     |     |
| . .       | . .            | . .      |     |     |     |
| . .       | . .            | . .      |     |     |     |
| user 0    | 0 2            | ... 0    |     |     |     |
11/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | Some (fixable) | problems           |           |
| --- | --- | --- | -------------- | ------------------ | --------- |
|     |     |     | Solution       | 2: Use a threshold | t (say, t |
= 100)
| human     | machine system | for ... user |         |               |               |
| --------- | -------------- | ------------ | ------- | ------------- | ------------- |
| human 0   | 1              | 0 x ... 0    |         |               |               |
|           |                |              | X ij    | = min(count(w | i ,c j ),t),  |
| machine 1 | 0              | 0 x ... 0    |         |               |               |
| system 0  | 0              | 0 x ... 2    |         |               |               |
| for x     | x              | x x ... x    |         |               |               |
| . .       | .              | . . . .      | where w | is word and   | c is context. |
| . .       | .              | . . . .      |         |               |               |
| . .       | .              | . . . .      |         |               |               |
| user 0    | 0              | 2 x ... 0    |         |               |               |
12/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     |     | Some (fixable) | problems              |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- |
|     |     |     |     | Solution 3:    | Instead of count(w,c) | use |
PMI(w,c)
|       | human | machine system | for ... user |              | p(c|w) |     |
| ----- | ----- | -------------- | ------------ | ------------ | ------ | --- |
| human | 0     | 2.944          | 0 2.25 ... 0 | PMI(w,c)=log |        |     |
p(c)
| machine | 2.944 | 0   | 0 2.25 ... 0    |     |     |     |
| ------- | ----- | --- | --------------- | --- | --- | --- |
| system  | 0     | 0   | 0 1.15 ... 1.84 |     |     |     |
count(w,c)∗N
| for  | 2.25 | 2.25 1.15 | 0 ... 0 |                      | =log              |              |
| ---- | ---- | --------- | ------- | -------------------- | ----------------- | ------------ |
| .    | .    | .         | . . . . |                      | count(c)∗count(w) |              |
| .    | .    | .         | . . . . |                      |                   |              |
| .    | .    | .         | . . . . | N is the total       | number of words   |              |
| user | 0    | 0 1.84    | 0 ... 0 |                      |                   |              |
|      |      |           |         | If count(w,c)=0,     | PMI(w,c)=−∞       |              |
|      |      |           |         | Instead use,         |                   |              |
|      |      |           |         | PMI 0 (w,c)=PMI(w,c) | if                | count(w,c)>0 |
|      |      |           |         |                      | =0                | otherwise    |
or
|     |     |     |     | PPMI(w,c)=PMI(w,c) | if  | PMI(w,c)>0 |
| --- | --- | --- | --- | ------------------ | --- | ---------- |
|     |     |     |     |                    | =0  | otherwise  |
13/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- |

|               |                |              | Some (severe)                   | problems    |       |
| ------------- | -------------- | ------------ | ------------------------------- | ----------- | ----- |
|               |                |              | Very high                       | dimensional | (|V|) |
|               |                |              | Very sparse                     |             |       |
| human         | machine system | for ... user |                                 |             |       |
| human 0       | 2.944          | 0 2.25 ... 0 | Growswiththesizeofthevocabulary |             |       |
| machine 2.944 | 0              | 0 2.25 ... 0 |                                 |             |       |
system 0 0 0 1.15 ... 1.84 Solution: Use dimensionality reduc-
| for 2.25 | 2.25 1.15 | 0 ... 0 |            |     |     |
| -------- | --------- | ------- | ---------- | --- | --- |
| . .      | .         | . . . . | tion (SVD) |     |     |
| . .      | .         | . . . . |            |     |     |
| . .      | .         | . . . . |            |     |     |
| user 0   | 0 1.84    | 0 ... 0 |            |     |     |
14/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Module | 10.3: SVD | for learning | word representations |     |
| ------ | --------- | ------------ | -------------------- | --- |
15/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     |     |     |     | Singular |          | Value Decomposition  |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | -------- | -------------------- | --- | --- |
|     |     |     |     |     |     |     | gives    | a        | rank k approximation |     | of  |
|     |     |     |     |     |     |     | the      | original | matrix               |     |     |
|    |    |     |     |     |     |     |          |          |                      |     |     |
VT
|     |     |     |     |     |     |     | X   | = X PPMIm×n | =            | U m×k Σ  | k×k |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------- | ------------ | -------- | --- |
|    |    |     |     |     |     |     |     |             |              |          | k×n |
|    |  = |     |     |     |     |     |     |             |              |          |     |
|  X |    |     |     |     |     |     |     |             |              |          |     |
|     |     |     |     |     |     |     | X   |             | (simplifying | notation | to  |
PPMI
m×n
|         |        |     |     |     |     |     | X)  | is the | co-occurrence |     | matrix |
| ------- | ------ | --- | --- | --- | --- | --- | --- | ------ | ------------- | --- | ------ |
|  ↑ ··· | ↑  σ |     |    | ←  | vT  | →  |     |        |               |     |        |
1
|          |         |     |     |     | 1   |     | with | PPMI  | values   |        |     |
| -------- | ------- | --- | --- | --- | --- | --- | ---- | ----- | -------- | ------ | --- |
|         |       | ... |    |    | .   |    |      |       |          |        |     |
|         |        |     |     |     | . . |     |      |       |          |        |     |
| u 1 ··· | u k   |     |    |    |     |    | SVD  | gives | the best | rank-k | ap- |
T
| ↓ ··· | ↓   |     | σ k |     | ← v k | →   |             |     |        |          |      |
| ----- | --- | --- | --- | --- | ----- | --- | ----------- | --- | ------ | -------- | ---- |
|       | m×k |     |     | k×k |       | k×n | proximation |     | of the | original | data |
(X)
|     |     |     |     |     |     |     | Discovers |      | latent semantics |      | in the |
| --- | --- | --- | --- | --- | --- | --- | --------- | ---- | ---------------- | ---- | ------ |
|     |     |     |     |     |     |     | corpus    |      | (let us examine  | this | with   |
|     |     |     |     |     |     |     | the       | help | of an example)   |      |        |
16/1
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     |     |     |     |     |     | Notice  | that the | product | can         | be  |
| --- | --- | --- | --- | --- | --- | --- | ------- | -------- | ------- | ----------- | --- |
|     |     |     |     |     |     |     | written | as a sum |         | of k rank-1 |     |
matrices
|        |    |     |     |     |       |     | Each σ         | u vT ∈     | Rm×n | because | it     |
| ------- | --- | --- | --- | --- | ----- | --- | -------------- | ---------- | ---- | ------- | ------ |
|         |     |     |     |     |       |     |                | i i i      |      |         |        |
|        |    |     |     |     |       |     | is a product   | of         | a m  | × 1     | vector |
|        |    | =   |     |     |       |     |                |            |      |         |        |
|  X     |    |     |     |     |       |     | with a         | 1×n vector |      |         |        |
|         | m×n |     |     |     |       |     |                |            |      |         | vT     |
|         |     |     |     |     |       |     | If we truncate | the        | sum  | at σ    | 1 u 1  |
|  ↑ ··· | ↑  | σ  |     |    | ← vT | →  |                |            |      |         | 1      |
|         |     | 1   |     |     |       |     | then we        | get the    | best | rank-1  | ap-    |
1
|         |      |    | ... |    |    | .  |             |     |       |     |      |
| -------- | ----- | --- | --- | --- | --- | --- | ----------- | --- | ----- | --- | ---- |
|         |      |     |     |     |     | . . | proximation | of  | X (By | SVD | the- |
| u 1 ··· | u k  |    |     |    |    |    |             |     |       |     |      |
T
| ↓ ··· | ↓   |       |      | σ k       | ← v | k → | orem!       | But what      | does     | this mean? |      |
| ----- | --- | ----- | ---- | --------- | --- | --- | ----------- | ------------- | -------- | ---------- | ---- |
|       | m×k |       |      | k×k       |     | k×n |             |               |          |            |      |
|       | =σ  | u vT  | +σ u | vT +···+σ | u   | vT  | We will     | see on        | the next | slide)     |      |
|       |     | 1 1 1 | 2    | 2 2       | k   | k k |             |               |          |            |      |
|       |     |       |      |           |     |     | If we       | truncate      | the      | sum        | at   |
|       |     |       |      |           |     |     | vT          | vT            |          |            |      |
|       |     |       |      |           |     |     | σ 1 u 1     | +σ 2 u 2      | then     | we get     | the  |
|       |     |       |      |           |     |     | 1           |               | 2        |            |      |
|       |     |       |      |           |     |     | best rank-2 | approximation |          |            | of X |
|       |     |       |      |           |     |     | and so      | on            |          |            |      |
17/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

What do we mean by approxim-
ation here?
Notice that X has m×n entries
 
When we use he rank-1 approx-
    = imation we are using only n +
 X 
m+1 entries to reconstruct [u ∈
m×n Rm,v ∈ Rn,σ ∈ R1]
 ↑ ··· ↑  σ  ← vT →
1 1 But SVD theorem tells us that
  u 1 ··· u k      ...     . . .   u 1 ,v 1 and σ 1 store the most in-
↓ ··· ↓ m×k σ k k×k ← v k T → k×n formation in X (akin to the prin-
=σ u vT +σ u vT +···+σ u vT cipal components in X)
1 1 1 2 2 2 k k k
Each subsequent term (σ u vT,
2 2 2
σ u vT, ...) stores less and less
3 3 3
important information
18/1
MiteshM.Khapra CS7015(DeepLearning): Lecture10

| verylight                    |                     | green                        |                    |                     |               |
| ---------------------------- | ------------------- | ---------------------------- | ------------------ | ------------------- | ------------- |
|                              |                     |                              | As an analogy      | consider            | the case when |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |                    |                     |               |
|                              |                     |                              | we are using       | 8 bits to represent | colors        |
| 0 0                          | 0 1 1               | 0 1 1                        |                    |                     |               |
|                              |                     |                              | The representation | of very             | light, light, |
|                              |                     |                              | dark and           | very dark green     | would look    |
different
| light |     | green |     |     |     |
| ----- | --- | ----- | --- | --- | --- |
Butnowwhatifwewereaskedtocom-
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |            |                     |               |
| ---------------------------- | ------------------- | ---------------------------- | ---------- | ------------------- | ------------- |
|                              |                     |                              | press this | into 4 bits?        | (akin to com- |
| 0 0                          | 1 0 1               | 0 1 1                        |            |                     |               |
|                              |                     |                              | pressing   | m×m values          | into m+m+1    |
|                              |                     |                              | values on  | the previous slide) |               |
|                              |                     |                              | We will    | retain the most     | important 4   |
| dark                         |                     | green                        |            |                     |               |
|                              |                     |                              | bits and   | now the previously  | (slightly)    |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |            |                     |               |
latentsimilaritybetweenthecolorsnow
| 0 1                          | 0 0 1               | 0 1 1                        | becomes     | very obvious   |                 |
| ---------------------------- | ------------------- | ---------------------------- | ----------- | -------------- | --------------- |
|                              |                     |                              | Something   | similar is     | guaranteed by   |
|                              |                     |                              | SVD (retain | the most       | important in-   |
| verydark                     |                     | green                        |             |                |                 |
|                              |                     |                              | formation   | and discover   | the latent sim- |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |             |                |                 |
|                              |                     |                              | ilarities   | between words) |                 |
| 1 0                          | 0 0 1               | 0 1 1                        |             |                |                 |
19/1
|                              |                     | MiteshM.Khapra               | CS7015(DeepLearning): | Lecture10 |     |
| ---------------------------- | ------------------- | ---------------------------- | --------------------- | --------- | --- |
| verylight                    |                     | green                        |                       |           |     |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |                       |           |     |
| 0 0                          | 0 1 1               | 0 1 1                        |                       |           |     |
| light                        |                     | green                        |                       |           |     |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |                       |           |     |
| 0 0                          | 1 0 1               | 0 1 1                        |                       |           |     |
| dark                         |                     | green                        |                       |           |     |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |                       |           |     |
| 0 1                          | 0 0 1               | 0 1 1                        |                       |           |     |
| verydark                     |                     | green                        |                       |           |     |
| (cid:122) (cid:125)(cid:124) | (cid:123) (cid:122) | (cid:125)(cid:124) (cid:123) |                       |           |     |
| 1 0                          | 0 0 1               | 0 1 1                        |                       |           |     |

human machine system for ... user human machine system for ... user
human 0 2.944 0 2.25 ... 0 human 2.01 2.01 0.23 2.14 ... 0.43
machine 2.944 0 0 2.25 ... 0 machine 2.01 2.01 0.23 2.14 ... 0.43
system 0 0 0 1.15 ... 1.84 system 0.23 0.23 1.17 0.96 ... 1.29
| for 2.25      | 2.25 1.15 | 0 ... 0 | for  | 2.14     | 2.14 0.96 | 1.87 ... -0.13 |
| ------------- | --------- | ------- | ---- | -------- | --------- | -------------- |
| . .           | .         | . . . . |      | . .      | . .       | . . .          |
| . .           | .         | . . . . |      | . .      | . .       | . . .          |
| . .           | .         | . . . . |      | . .      | . .       | . . .          |
| user 0        | 0 1.84    | 0 ... 0 | user | 0.43     | 0.43 1.29 | -0.13 ... 1.71 |
| Co-occurrence | Matrix    | (X)     |      | Low rank | X → Low   | rank Xˆ        |
Notice that after low rank reconstruction with SVD, the latent co-occurrence
| between | {system,machine} | and {human,user} |     | has | become visible |     |
| ------- | ---------------- | ---------------- | --- | --- | -------------- | --- |
20/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     |     |     |     |     |     |     | Recall | that earlier | each row | of the | original |
| --- | --- | --- | --- | --- | --- | --- | ------ | ------------ | -------- | ------ | -------- |
X =
|     |     |     |     |     |     |     | matrix | X served | as the representation |     | of a |
| --- | --- | --- | --- | --- | --- | --- | ------ | -------- | --------------------- | --- | ---- |
word
|         | human | machine | system | for    | ... user |     |          |     |                |       |          |
| ------- | ----- | ------- | ------ | ------ | -------- | --- | -------- | --- | -------------- | ----- | -------- |
| human   | 0     | 2.944   |        | 0 2.25 | ...      | 0   |          |     |                |       |          |
|         |       |         |        |        |          |     | Then XXT | is  | a matrix whose | ij-th | entry is |
| machine | 2.944 | 0       |        | 0 2.25 | ...      | 0   |          |     |                |       |          |
system 0 0 0 1.15 ... 1.84 the dot product between the representation
for 2.25 2.25 1.15 0 ... 0 of word i (X[i:]) and word j (X[j :])
| .      | .            | .       |        | . .       | .             | .   |       |                              |                                        |                    |           |
| ------ | ------------ | ------- | ------ | --------- | ------------- | --- | ----- | ---------------------------- | -------------------------------------- | ------------------ | --------- |
| .      | .            | .       |        | . .       | .             | .   |       |                              |                                        |                    |           |
| .      | .            | .       |        | . .       | .             | .   | X[i:] |                             | 1 2 3                                | 1 2                | 1        |
| user   | 0            | 0       | 1.84   | 0         | ...           | 0   |       |                              |                                        |                    |           |
|        |              |         |        |           |               |     |       |                              | 2 1 0                                  | 2 1                | 3         |
|        |              |         |        |           |               |     |       |                             |                                      |                    |          |
|        |              |         |        |           |               |     | X[j   | :]                           | 1 3 5                                  | 3 0                | 5         |
|        |              | XXT     | =      |           |               |     |       |                              |                                        |                    |           |
|        |              |         |        |           |               |     |       | (cid:124)                    | (cid:123)(cid:122) (cid:125) (cid:124) | (cid:123)(cid:122) | (cid:125) |
|        |              |         |        |           |               |     |       |                              | X                                      | XT                 |           |
|        |              |         |        |           |               |     |       |                             |                                       |                    |           |
|        | human        | machine | system | for       | ... user      |     |       | . .                          | 22                                     |                    |           |
| hu m a | n 3 2 . 5    | 2 3 . 9 | 7 .    | 7 8 2 0 . | 2 5 . . . 7 . | 0 1 |       |                              |                                        |                    |           |
|        |              |         |        |           |               |     | =.   | .                            | .                                     |                    |           |
| m a ch | i ne 2 3 . 9 | 3 2 . 5 | 7 .    | 7 8 2 0 . | 2 5 . . . 7 . | 0 1 |       |                              |                                        |                    |           |
| system | 7.78         | 7.78    |        | 0 17.65   | ... 21.84     |     |       | . .                          | .                                      |                    |           |
| for    | 20.25        | 20.25   | 17.65  | 36.3      | ... 11.8      |     |       |                              |                                        |                    |           |
|        |              |         |        |           |               |     |       | (cid:124) (cid:123)(cid:122) | (cid:125)                              |                    |           |
| .      | .            | .       |        | . .       | .             | .   |       |                              |                                        |                    |           |
| .      | .            | .       |        | . .       | .             | .   |       | XXT                          |                                        |                    |           |
| .      | .            | .       |        | . .       | .             | .   |       |                              |                                        |                    |           |
user 7.01 7.01 21.84 11.8 ... 28.3 The ij-th entry of XXT thus (roughly)
|     |        |                      |     |     |     |     | captures     | the | cosine similarity |     | between |
| --- | ------ | -------------------- | --- | --- | --- | --- | ------------ | --- | ----------------- | --- | ------- |
|     |        |                      |     |     |     |     | word i ,word | j   |                   |     |         |
|     | cosine | sim(human,user)=0.21 |     |     |     |     |              |     |                   |     |         |
21/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     |     |     |     |     | Once | we do | an SVD | what | is a |
| --- | --- | --- | --- | --- | --- | ---- | ----- | ------ | ---- | ---- |
Xˆ =
|       |       |         |        |      |          | good choice |     | for the representation |     | of  |
| ----- | ----- | ------- | ------ | ---- | -------- | ----------- | --- | ---------------------- | --- | --- |
|       | human | machine | system | for  | ... user | word i ?    |     |                        |     |     |
| human | 2.01  | 2.01    | 0.23   | 2.14 | ... 0.43 |             |     |                        |     |     |
machine 2.01 2.01 0.23 2.14 ... 0.43 Obviously, taking the i-th row of the
| system | 0.23 | 0.23 | 1.17 | 0.96 | ... 1.29 |     |     |     |     |     |
| ------ | ---- | ---- | ---- | ---- | -------- | --- | --- | --- | --- | --- |
for 2.14 2.14 0.96 1.87 ... -0.13 reconstructed matrix does not make
| .       | .     | .       |        | . .   | .         | .                                  |          |                |               |        |
| ------- | ----- | ------- | ------ | ----- | --------- | ---------------------------------- | -------- | -------------- | ------------- | ------ |
|         |       |         |        |       |           | sense because                      |          | it is still    | high dimen-   |        |
| .       | .     | .       |        | . .   | .         | .                                  |          |                |               |        |
| .       | .     | .       |        | . .   | .         | .                                  |          |                |               |        |
| user    | 0.43  | 0.43    | 1.29   | -0.13 | ... 1.71  | sional                             |          |                |               |        |
|         |       |         |        |       |           | But we                             | saw      | that the       | reconstructed |        |
|         |       | XˆXˆT   | =      |       |           |                                    |          |                |               |        |
|         |       |         |        |       |           | matrix                             | Xˆ =     | UΣVT discovers |               | latent |
|         |       |         |        |       |           | semantics                          | and      | its word       | representa-   |        |
|         | human | machine | system | for   | ... user  |                                    |          |                |               |        |
| human   | 25.4  | 25.4    | 7.6    | 21.9  | ... 6.84  | tions are                          | more     | meaningful     |               |        |
| machine | 25.4  | 25.4    | 7.6    | 21.9  | ... 6.84  |                                    |          |                |               |        |
| system  | 7.6   | 7.6     | 24.8   | 18.03 | ... 20.6  |                                    |          |                |               |        |
|         |       |         |        |       |           | Wishlist:                          | We       | would want     | represent-    |        |
| for     | 21.9  | 21.9    | 0.96   | 24.6  | ... 15.32 |                                    |          |                |               |        |
| .       | .     | .       |        | . .   | .         | .                                  |          |                |               |        |
|         |       |         |        |       |           | ations                             | of words | (i, j)         | to be of      | smal-  |
| .       | .     | .       |        | . .   | .         | .                                  |          |                |               |        |
| .       | .     | .       |        | . .   | .         | . lerdimensionsbutstillhavethesame |          |                |               |        |
| user    | 6.84  | 6.84    | 20.6   | 15.32 | ... 17.11 |                                    |          |                |               |        |
similarity(dotproduct)asthecorres-
Xˆ
|     |        |                      |     |                |     | ponding               | rows | of        |     |      |
| --- | ------ | -------------------- | --- | -------------- | --- | --------------------- | ---- | --------- | --- | ---- |
|     | cosine | sim(human,user)=0.33 |     |                |     |                       |      |           |     | 22/1 |
|     |        |                      |     | MiteshM.Khapra |     | CS7015(DeepLearning): |      | Lecture10 |     |      |

|     |     |     |     |     | Notice | that the | dot | product between | the |
| --- | --- | --- | --- | --- | ------ | -------- | --- | --------------- | --- |
Xˆ =
|     |     |     |     |     | rows of | the the | matrix | W = UΣ | is the |
| --- | --- | --- | --- | --- | ------- | ------- | ------ | ------ | ------ |
word
|     |       |         |        |              | same | as the dot | product | between | the rows |
| --- | ----- | ------- | ------ | ------------ | ---- | ---------- | ------- | ------- | -------- |
|     | human | machine | system | for ... user |      |            |         |         |          |
of Xˆ
| human   | 2.01 | 2.01 | 0.23 | 2.14 ... 0.43 |     |     |     |     |     |
| ------- | ---- | ---- | ---- | ------------- | --- | --- | --- | --- | --- |
| machine | 2.01 | 2.01 | 0.23 | 2.14 ... 0.43 |     |     |     |     |     |
| system  | 0.23 | 0.23 | 1.17 | 0.96 ... 1.29 |     |     |     |     |     |
XˆXˆT =(UΣVT)(UΣVT)T
| for | 2.14 | 2.14 | 0.96 | 1.87 ... -0.13 |     |     |     |     |     |
| --- | ---- | ---- | ---- | -------------- | --- | --- | --- | --- | --- |
| .   | .    | .    | .    | . .            | .   |     |     |     |     |
=(UΣVT)(VΣUT)
| .    | .    | .    | .    | . .            | .   |          |     |           |     |
| ---- | ---- | ---- | ---- | -------------- | --- | -------- | --- | --------- | --- |
| .    | .    | .    | .    | . .            | .   |          |     |           |     |
| user | 0.43 | 0.43 | 1.29 | -0.13 ... 1.71 |     | =UΣΣTUT  |     | (∵VTV =I) |     |
|      |      |      |      |                |     | =UΣ(UΣ)T |     | =W WT     |     |
word word
|     |     | XˆXˆT | =   |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
Conventionally,
|     | human | machine | system | for ... user |     |     |     |     |     |
| --- | ----- | ------- | ------ | ------------ | --- | --- | --- | --- | --- |
W =UΣ∈Rm×k
| human   | 25.4 | 25.4 | 7.6  | 21.9 ... 6.84  |     | word |     |     |     |
| ------- | ---- | ---- | ---- | -------------- | --- | ---- | --- | --- | --- |
| machine | 25.4 | 25.4 | 7.6  | 21.9 ... 6.84  |     |      |     |     |     |
| system  | 7.6  | 7.6  | 24.8 | 18.03 ... 20.6 |     |      |     |     |     |
istakenastherepresentationofthemwords
| for  | 21.9 | 21.9 | 0.96 | 24.6 ... 15.32  |          |            |     |     |     |
| ---- | ---- | ---- | ---- | --------------- | -------- | ---------- | --- | --- | --- |
| .    | .    | .    | .    | . .             | . in the | vocabulary | and |     |     |
| .    | .    | .    | .    | . .             | .        |            |     |     |     |
| .    | .    | .    | .    | . .             | .        |            |     |     |     |
| user | 6.84 | 6.84 | 20.6 | 15.32 ... 17.11 |          |            | W   | =V  |     |
context
istakenastherepresentationofthecontext
words
|     |     | similarity=0.33 |     |                |                       |     |           |     | 23/1 |
| --- | --- | --------------- | --- | -------------- | --------------------- | --- | --------- | --- | ---- |
|     |     |                 |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |      |

| Module | 10.4: Continuous |     | bag of words | model |
| ------ | ---------------- | --- | ------------ | ----- |
24/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

The methods that we have seen so far are called count based models because
| they use | the co-occurrence | counts of | words |     |
| -------- | ----------------- | --------- | ----- | --- |
We will now see methods which directly learn word representations (these are
| called (direct) | prediction | based | models) |     |
| --------------- | ---------- | ----- | ------- | --- |
25/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |
| --- | -------------- | --- | --------------------- | --------- |

| The story ahead | ...             |                   |             |           |
| --------------- | --------------- | ----------------- | ----------- | --------- |
| Continuous      | bag of          | words model       |             |           |
| Skip gram       | model with      | negative sampling | (the famous | word2vec) |
| GloVe           | word embeddings |                   |             |           |
| Evaluating      | word embeddings |                   |             |           |
| Good old        | SVD does        | just fine!!       |             |           |
26/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     |     |     | Consider | this Task: | Predict | n-th |
| --- | --- | --- | --- | --- | --- | -------- | ---------- | ------- | ---- |
Sometime in the 21st century, Joseph Cooper, word given previous n-1 words
| a widowed   | former | engineer |                   | and former | NASA    |          |           |         |     |
| ----------- | ------ | -------- | ----------------- | ---------- | ------- | -------- | --------- | ------- | --- |
|             |        |          |                   |            |         | Example: | he sat on | a chair |     |
| pilot, runs | a farm | with     | his father-in-law |            | Donald, |          |           |         |     |
son Tom, and daughter Murphy, It is post-truth Training data: All n-word windows
| society | (Cooper | is reprimanded |          | for | telling    | in your | corpus |     |     |
| ------- | ------- | -------------- | -------- | --- | ---------- | ------- | ------ | --- | --- |
| Murphy  | that    | the Apollo     | missions |     | did indeed |         |        |     |     |
happen) and a series of crop blights threatens hu- Training data for this task is easily
|            |           |                |          |      |             | available | (take all           | n word | windows |
| ---------- | --------- | -------------- | -------- | ---- | ----------- | --------- | ------------------- | ------ | ------- |
| manity’s   | survival. | Murphy         | believes |      | her bedroom |           |                     |        |         |
|            |           |                |          |      |             | from the  | whole of wikipedia) |        |         |
| is haunted | by        | a poltergeist. |          | When | a pattern   |           |                     |        |         |
is created out of dust on the floor, Cooper For ease of illustration, we will first
realizes that gravity is behind its formation, focus on the case when n = 2 (i.e.,
| not a ”ghost”. |            | He          | interprets | the    | pattern as |         |             |       |          |
| -------------- | ---------- | ----------- | ---------- | ------ | ---------- | ------- | ----------- | ----- | -------- |
|                |            |             |            |        |            | predict | second word | based | on first |
| a set of       | geographic | coordinates |            | formed | into       |         |             |       |          |
word)
| binary code.                        |      | Cooper | and  | Murphy    | follow the |     |     |     |     |
| ----------------------------------- | ---- | ------ | ---- | --------- | ---------- | --- | --- | --- | --- |
| coordinates                         | to a | secret | NASA | facility, | where they |     |     |     |     |
| aremetbyCooper’sformerprofessor,Dr. |      |        |      |           | Brand.     |     |     |     |     |
Somesample4wordwindowsfromacorpus
27/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

| We will now | try to answer | these two questions: |     |     |
| ----------- | ------------- | -------------------- | --- | --- |
| How         | do you model  | this task?           |     |     |
What is the connection between this task and learning word representations?
28/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

)tas|riahc(P )tas|nam(P
|           |     |       |     |           |       | We will                           | model  | this problem |     | using a |
| --------- | --- | ----- | --- | --------- | ----- | --------------------------------- | ------ | ------------ | --- | ------- |
| )tas|eh(P |     |       |     | )tas|no(P |       |                                   |        |              |     |         |
|           |     | . . . | . . | .         | . . . | feedforward                       | neural | network      |     |         |
|           |     |       |     |           |       | Input: One-hotrepresentationofthe |        |              |     |         |
| .         | . . | . . . | . . | . .       | . .   |                                   |        |              |     |         |
|           |     |       |     |           |       | context                           | word   |              |     |         |
|           |     |       |     |           |       | Output:                           | There  | are          | |V| | words   |
Wword∈Rk×|V|
|     |     |       |     |     |        | (classes)          | possible | and we       | want | to pre- |
| --- | --- | ----- | --- | --- | ------ | ------------------ | -------- | ------------ | ---- | ------- |
|     | . . | . . . | . . | . . | . h∈Rk |                    |          |              |      |         |
|     |     |       |     |     |        | dict a probability |          | distribution |      | over    |
these|V|classes(multi-classclassific-
|     |     | Wcontext | ∈   |     |        |                |     |     |          |     |
| --- | --- | -------- | --- | --- | ------ | -------------- | --- | --- | -------- | --- |
|     |     | Rk×|V|   |     |     |        | ation problem) |     |     |          |     |
|     | 0   | 1 0 ...  | 0   | 0 0 | x∈R|V| | Parameters:    | W   |     | ∈ Rk×|V| | and |
context
|     |     |     |     |     |     | W ∈        | Rk×|V|      |      |       |        |
| --- | --- | --- | --- | --- | --- | ---------- | ----------- | ---- | ----- | ------ |
|     |     | sat |     |     |     | word       |             |      |       |        |
|     |     |     |     |     |     | (we are    | assuming    | that | the   | set of |
|     |     |     |     |     |     | words      | and context |      | words | is the |
|     |     |     |     |     |     | same: each | of size     | |V|) |       |        |
29/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- | --- |

)tas|riahc(P )tas|nam(P
| )tas|eh(P |     |     |     | )tas|no(P |     | WhatistheproductW |            | context     | xgiventhatx |     |
| --------- | --- | --- | --- | --------- | --- | ----------------- | ---------- | ----------- | ----------- | --- |
|           | .   | . . | . . | . . . .   |     | is a one          | hot vector |             |             |     |
|           |     |     |     |           |     | It is simply      | the        | i-th column | of          | W   |
context
| . . | . . | . . | . . | . . . . |     |     |        |              |     |     |
| --- | --- | --- | --- | ------- | --- | --- | ------ | ------------ | --- | --- |
|     |     |     |     |         |     |    |        | 0         |     |   |
|     |     |     |     |         |     |     | −1 0.5 | 2            |     | 0.5 |
|     |     |     |     |         |     |    | 3 −1   | −2 1=−1 |     |     |
Wword∈Rk×|V|
|     |     |     |     |            |     |         | −2 1.7 | 3       | 0       | 1.7      |
| --- | --- | --- | --- | ---------- | --- | ------- | ------ | ------- | ------- | -------- |
| .   | . . | . . | . . | . . . h∈Rk |     |         |        |         |         |          |
|     |     |     |     |            |     |         | ith    |         |         | ith      |
|     |     |     |     |            |     | So when | the    | word is | present | the ele- |
mentintheonehotvectorisONandtheith
|     |     | Wcontext | ∈   |     |     |        |      |      |          |     |
| --- | --- | -------- | --- | --- | --- | ------ | ---- | ---- | -------- | --- |
|     |     | Rk×|V|   |     |     |     | column | of W | gets | selected |     |
context
0 1 0 ... 0 0 0 x∈R|V| In other words, there is a one-to-one corres-
pondencebetweenthewordsandthecolumn
|     |     | sat |     |     |     | of W |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- |
context
|     |     |     |     |     |     | More specifically, |     | we                    | can treat | the i-th |
| --- | --- | --- | --- | --- | --- | ------------------ | --- | --------------------- | --------- | -------- |
|     |     |     |     |     |     | columnofW          |     | astherepresentationof |           |          |
context
|     |     |     |     |     |     | context | i   |     |     |     |
| --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- | --- |
30/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

)tas|riahc(P )tas|nam(P
| )tas|eh(P |     |     |     | )tas|no(P | HowdoweobtainP(on|sat)?                  |     |           |           | Forthismulti- |
| --------- | --- | --- | --- | --------- | ---------------------------------------- | --- | --------- | --------- | ------------- |
|           | .   | . . | . . | . . . .   | classclassificationproblemwhatisanappro- |     |           |           |               |
|           |     |     |     |           | priate output                            |     | function? | (softmax) |               |
. . . . . . . . . . . . Therefore, P(on|sat) is proportional to the
dotproductbetweenjthcolumnofW
context
ith
|     |     | Wword∈Rk×|V| |     |            | and                | column    | of W     | word    |              |
| --- | --- | ------------ | --- | ---------- | ------------------ | --------- | -------- | ------- | ------------ |
|     |     |              |     |            | P(word             | = i|sat)  | thus     | depends | on the ith   |
| .   | . . | . .          | . . | . . . h∈Rk |                    |           |          |         |              |
|     |     |              |     |            | column             | of W word |          |         |              |
|     |     | Wcontext     | ∈   |            | We thus            | treat     | the i-th | column  | of W word as |
|     |     | Rk×|V|       |     |            | the representation |           | of       | word i  |              |
0 1 0 ... 0 0 0 x∈R|V| Hope you see an analogy with SVD! (there
|     |     |     |     |     | we had | a different | way | of learning | W   |
| --- | --- | --- | --- | --- | ------ | ----------- | --- | ----------- | --- |
context
|     |     | sat |     |     | and W | but | we saw | that | the ith column |
| --- | --- | --- | --- | --- | ----- | --- | ------ | ---- | -------------- |
word
|     |     |     |     |     | of W | corresponded |     | to  | the representa- |
| --- | --- | --- | --- | --- | ---- | ------------ | --- | --- | --------------- |
word
ith
|           |     |          |        |       | tion of the  |               | word) |       |                |
| --------- | --- | -------- | ------ | ----- | ------------ | ------------- | ----- | ----- | -------------- |
|           |     | e(W      | word   | h)[i] |              |               |       |       |                |
| P(on|sat) |     | =        |        |       |              |               |       |       |                |
|           |     | (cid:80) |        |       | Now that     | we understood |       | the   | interpretation |
|           |     |          | e(W    | h)[j] |              |               |       |       |                |
|           |     |          | j word |       | of W context | and           | W     | , our | aim now is to  |
word
|     |     |     |     |     | learn these | parameters |     |     |     |
| --- | --- | --- | --- | --- | ----------- | ---------- | --- | --- | --- |
31/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Wedenotethecontextword(sat)bythein-
)tas|no(P=ˆy
|     | )tas|riahc(P |     |     |     |     |     | dex c and | the correct | output | word (on) by |
| --- | ------------ | --- | --- | --- | --- | --- | --------- | ----------- | ------ | ------------ |
)tas|nam(P
| )tas|eh(P |     |       |     |     |       |     | the index | w          |                |         |
| --------- | --- | ----- | --- | --- | ----- | --- | --------- | ---------- | -------------- | ------- |
|           |     | . . . | . . | .   | . . . |     |           |            |                |         |
|           |     |       |     |     |       |     | For this  | multiclass | classification | problem |
whatisanappropriateoutputfunction(yˆ=
| .   | . . | . . . | . . | . . | . . |     | f(x)) ?                          | softmax |     |       |
| --- | --- | ----- | --- | --- | --- | --- | -------------------------------- | ------- | --- | ----- |
|     |     |       |     |     |     |     | Whatisanappropriatelossfunction? |         |     | cross |
Wword∈Rk×|V|
entropy
|     | . . | . . . | . . | . . | . h∈Rk |     | L(θ)=−logyˆ |     | =−logP(w|c) |     |
| --- | --- | ----- | --- | --- | ------ | --- | ----------- | --- | ----------- | --- |
w
|     |     |          |     |     |     |     |     | h=W        | ·x            | =u               |
| --- | --- | -------- | --- | --- | --- | --- | --- | ---------- | ------------- | ---------------- |
|     |     | Wcontext | ∈   |     |     |     |     | context    |               | c c              |
|     |     | Rk×|V|   |     |     |     |     |     |            | e x p (u      | · v )            |
|     |     |          |     |     |     |     |     | yˆ =       | c             | w                |
|     |     |          |     |     |     |     |     | w (cid:80) | e x p(        | u · v w(cid:48)) |
|     | 0   | 1 0 ...  | 0   | 0 0 |     |     |     |            | w(cid:48) ∈ V | c                |
x∈R|V|
|     |     |     |     |     |     |     | u is the      | column | of W     | corresponding |
| --- | --- | --- | --- | --- | --- | --- | ------------- | ------ | -------- | ------------- |
|     |     | sat |     |     |     |     | c             |        | context  |               |
|     |     |     |     |     |     |     | to context    | c and  | v is the | column of W   |
|     |     |     |     |     |     |     |               |        | w        | word          |
|     |     |     |     |     |     |     | corresponding | to     | context  | w             |
32/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

)tas|riahc(P )tas|nam(P
|           |     |       |     |           |       | How do      | we train this | simple feed  | for- |
| --------- | --- | ----- | --- | --------- | ----- | ----------- | ------------- | ------------ | ---- |
| )tas|eh(P |     |       |     | )tas|no(P |       |             |               |              |      |
|           |     | . . . | . . | .         | . . . | ward neural | network?      | backpropaga- |      |
tion
| .   | . . | . . . | . . | . . | . . |           |                |              |         |
| --- | --- | ----- | --- | --- | --- | --------- | -------------- | ------------ | ------- |
|     |     |       |     |     |     | Let us    | consider one   | input-output | pair    |
|     |     |       |     |     |     | (c,w) and | see the update | rule         | for v w |
Wword∈Rk×|V|
|     | . . | . . .    | . . | . . | . h∈Rk |     |     |     |     |
| --- | --- | -------- | --- | --- | ------ | --- | --- | --- | --- |
|     |     | Wcontext | ∈   |     |        |     |     |     |     |
Rk×|V|
|     | 0   | 1 0 ... | 0   | 0 0 | x∈R|V| |     |     |     |     |
| --- | --- | ------- | --- | --- | ------ | --- | --- | --- | --- |
sat
33/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

. . . . . . . . . . . .
. . . . . . . . . .
0 1 0 ... 0 0 0
sat
34/1
)tas|eh(P
)tas|riahc(P )tas|nam(P
)tas|no(P
. . . . . . . . . L(θ) = −logyˆ
w
exp(u ·v )
c w
= −log
(cid:80)
exp(u ·v )
w(cid:48)∈V c w(cid:48)
(cid:88)
Wword∈Rk×|V| = −(u
c
·v
w
−log exp(u
c
·v
w(cid:48)
))
h∈Rk w(cid:48)∈V
exp(u ·v )
c w
Wcontext ∈ ∇
vw
= −(u
c
−
(cid:80)
exp(u ·v )
·u
c
)
Rk×|V| w(cid:48)∈V c w(cid:48)
= −u (1−yˆ ) x∈R|V| c w
And the update rule would be
∂
∇ = − L(θ)
vw ∂v w v w = v w −η∇ vw
= v +ηu (1−yˆ )
w c w
MiteshM.Khapra CS7015(DeepLearning): Lecture10

)tas|riahc(P )tas|nam(P
|           |     |              |     |           |       | This  | update                      | rule | has a | nice interpret- |     |
| --------- | --- | ------------ | --- | --------- | ----- | ----- | --------------------------- | ---- | ----- | --------------- | --- |
| )tas|eh(P |     |              |     | )tas|no(P |       |       |                             |      |       |                 |     |
|           |     | . . .        | . . | .         | . . . | ation |                             |      |       |                 |     |
| .         | . . | . . .        | . . | . .       | . .   |       | v                           | = v  | +ηu   | (1−yˆ           | )   |
|           |     |              |     |           |       |       | w                           | w    | c     | w               |     |
|           |     | Wword∈Rk×|V| |     |           |       | Ifyˆ  | → 1thenwearealreadypredict- |      |       |                 |     |
w
|     |     |     |     |     |     | ing | the right | word | and | v will | not be |
| --- | --- | --- | --- | --- | --- | --- | --------- | ---- | --- | ------ | ------ |
w
|     | . . | . . . | . . | . . | . h∈Rk |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
updated
|     |     | Wcontext | ∈   |     |     | If yˆ | →   | 0 then | v gets | updated | by  |
| --- | --- | -------- | --- | --- | --- | ----- | --- | ------ | ------ | ------- | --- |
|     |     |          |     |     |     |       | w   |        | w      |         |     |
Rk×|V|
|     |     |     |     |     |     | adding | a   | fraction | of u | to it |     |
| --- | --- | --- | --- | --- | --- | ------ | --- | -------- | ---- | ----- | --- |
c
|     | 0   | 1 0 ... | 0   | 0 0 | x∈R|V| |         |           |            |            |            |          |
| --- | --- | ------- | --- | --- | ------ | ------- | --------- | ---------- | ---------- | ---------- | -------- |
|     |     |         |     |     |        | This    | increases |            | the cosine | similarity |          |
|     |     | sat     |     |     |        | between |           | v and      | u (How?    |            | Refer to |
|     |     |         |     |     |        |         |           | w          | c          |            |          |
|     |     |         |     |     |        | slide   | 38 of     | Lecture    | 2)         |            |          |
|     |     |         |     |     |        | The     | training  | objective  |            | ensures    | that     |
|     |     |         |     |     |        | the     | cosine    | similarity |            | between    | word     |
|     |     |         |     |     |        | (v w    | ) and     | context    | word       | (u c )     | is max-  |
imized
35/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

)tas|riahc(P )tas|nam(P
|           |     |       |     |           | What happens | to the             | representations |         |
| --------- | --- | ----- | --- | --------- | ------------ | ------------------ | --------------- | ------- |
| )tas|eh(P |     |       |     | )tas|no(P |              |                    |                 |         |
|           |     | . . . | . . | . . . .   | of two words | w and w(cid:48)    | which           | tend to |
|           |     |       |     |           | appear       | in similar context | (c)             |         |
| .         | . . | . . . | . . | . . . .   |              |                    |                 |         |
|           |     |       |     |           | The training | ensures            | that            | both v  |
w
v(cid:48)
|     |     |              |     |     | and    | have a high            | cosine | similarity |
| --- | --- | ------------ | --- | --- | ------ | ---------------------- | ------ | ---------- |
|     |     | Wword∈Rk×|V| |     |     | w      |                        |        |            |
|     |     |              |     |     | with u | and hence transitively |        | (intu-     |
c
. . . . . . . . . . h∈Rk itively)ensuresthatv andv (cid:48) havea
w w
|     |     |          |     |            | high cosine | similarity        | with each    | other |
| --- | --- | -------- | --- | ---------- | ----------- | ----------------- | ------------ | ----- |
|     |     | Wcontext | ∈   |            |             |                   |              |       |
|     |     | Rk×|V|   |     |            | This is     | only an intuition | (reasonable) |       |
|     | 0   | 1 0 ...  | 0   | 0 0 x∈R|V| | Haven’t     | come across       | a formal     | proof |
for this!
sat
36/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

)eh,tas|riahc(P
)eh,tas|nam(P
|     |     |     |     | )eh,tas|no(P |     | In practice, | instead | of window | size | of 1 it is |
| --- | --- | --- | --- | ------------ | --- | ------------ | ------- | --------- | ---- | ---------- |
)eh,tas|eh(P
|     |     |     |     |         |     | common  | to use a | window | size of | d   |
| --- | --- | --- | --- | ------- | --- | ------- | -------- | ------ | ------- | --- |
|     | .   | . . | . . | . . . . |     | So now, |          |        |         |     |
d−1
(cid:88)
|     |     |     |     |         |     |     | h=  | u   | ci  |     |
| --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- |
| . . | . . | . . | . . | . . . . |     |     |     |     |     |     |
i=1
|     |     | Wword   | ∈   |     |     | [W         | ,W      | ] just means |        | that we are |
| --- | --- | ------- | --- | --- | --- | ---------- | ------- | ------------ | ------ | ----------- |
|     |     |         |     |     |     | context    | context |              |        |             |
|     |     | Rk×2|V| |     |     |     | stacking 2 | copies  | of W         | matrix |             |
context
0
| .   | . . | . . | . . | . . . h∈Rk |     |     |     |     |     |     |
| --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- |
1}sat

|     |     |     |     |     |     | −1 0.5 | 2   | −1  | 0.5 | 2   |
| --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | ----- |
0
|     |     |                      |     |         |     |  3 −1  | −2  | 3   | −1 −2 |    |
| --- | --- | -------------------- | --- | ------- | --- | ------- | --- | --- | ----- | ----- |
|     |     | [Wcontext,Wcontext]∈ |     |         |     |         |     |     |       | 0   |
|     |     |                      |     |         |     | −2 1.7  | 3   | −2  | 1.7   | 3   |
|     |     | Rk×2|V|              |     |         |     |         |     |     |       | 0   |
|     |     |                      |     |         |     |         |     |     |       | 1 }he |
|     |     |                      |     | x∈R2|V| |     |  2.5  |     |     |       |       |
sat
he
=−3
4.7
|     |     |     |     |                |                       | The resultant | product   | would         | simply | be the   |
| --- | --- | --- | --- | -------------- | --------------------- | ------------- | --------- | ------------- | ------ | -------- |
|     |     |     |     |                |                       | sum of the    | columns   | corresponding |        | to ‘sat’ |
|     |     |     |     |                |                       | and ‘he’      |           |               |        | 37/1     |
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |               | Lecture10 |               |        |          |

Of course in practice we will not do this expensive matrix multiplication
If ‘he’ is ith word in the vocabulary and sat is the jth word then we will
| simply access | columns W[i | :] and W[j | :] and add | them |
| ------------- | ----------- | ---------- | ---------- | ---- |
38/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture10 |
| --- | -------------- | --- | --------------------- | --------- |

| Now what | happens | during | backpropagation |     |     |
| -------- | ------- | ------ | --------------- | --- | --- |
Recall that
d−1
(cid:88)
h = u
ci
i=1
and
|     |     |     |              | e(w word h)[k]     |     |
| --- | --- | --- | ------------ | ------------------ | --- |
|     |     |     | P(on|sat,he) | =                  |     |
|     |     |     |              | (cid:80) e(w h)[j] |     |
j word
| where ‘k’ | is the   | index   | of the word ‘on’ |              |                 |
| --------- | -------- | ------- | ---------------- | ------------ | --------------- |
| The loss  | function | depends | on {W            | ,u ,u ,...,u | } and all these |
|           |          |         | word             | c1 c2        | c               |
d−1
| parameters | will | get updated | during | backpropogation |     |
| ---------- | ---- | ----------- | ------ | --------------- | --- |
Try deriving the update rule for v now and see how it differs from the one we
w
derived before
39/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | --- | -------------- | --------------------- | --------- |

| )eh,tas|riahc(P |     |     |     |     | Some problems: |     |     |     |     |
| --------------- | --- | --- | --- | --- | -------------- | --- | --- | --- | --- |
)eh,tas|nam(P
)eh,tas|no(P
| )eh,tas|eh(P |     |     |     |         | Notice that | the | softmax         | function | at   |
| ------------ | --- | --- | --- | ------- | ----------- | --- | --------------- | -------- | ---- |
|              |     |     |     |         | the output  | is  | computationally |          | very |
|              | .   | . . | . . | . . . . |             |     |                 |          |      |
expensive
| . . | . . | . . | . . | . . . . |     |     |       |      |     |
| --- | --- | --- | --- | ------- | --- | --- | ----- | ---- | --- |
|     |     |     |     |         |     |     | exp(u | ·v ) |     |
|     |     |     |     |         | yˆ  | =   | c     | w    |     |
w (cid:80)
|     |     | Wword | ∈   |     |     |             | exp(u | ·v          | )   |
| --- | --- | ----- | --- | --- | --- | ----------- | ----- | ----------- | --- |
|     |     |       |     |     |     | w(cid:48)∈V |       | c w(cid:48) |     |
Rk×2|V|
|     |     |                      |     |            | The denominator |           | requires   | a              | summa- |
| --- | --- | -------------------- | --- | ---------- | --------------- | --------- | ---------- | -------------- | ------ |
| .   | . . | . .                  | . . | . . . h∈Rk |                 |           |            |                |        |
|     |     |                      |     |            | tion over       | all words | in         | the vocabulary |        |
|     |     | [Wcontext,Wcontext]∈ |     |            | We will revisit |           | this issue | soon           |        |
Rk×2|V|
x∈R2|V|
sat
he
40/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

| Module | 10.5: Skip-gram | model |     |     |
| ------ | --------------- | ----- | --- | --- |
41/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

The model that we just saw is called the continuous bag of words model (it
| predicts | an output | word give a bag | of context | words) |
| -------- | --------- | --------------- | ---------- | ------ |
We will now see the skip gram model (which predicts context words given an
input word)
42/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|      |        |     |     |            | Notice        | that the | role  | of      | context and   |
| ---- | ------ | --- | --- | ---------- | ------------- | -------- | ----- | ------- | ------------- |
| hhee | ssaatt |     | aa  | cchhaaiirr |               |          |       |         |               |
|      |        |     |     |            | word has      | changed  |       | now     |               |
|      |        |     |     |            | In the simple |          | case  | when    | there is only |
|      |        |     |     | Wcontext ∈ |               |          |       |         |               |
|      |        |     |     |            | one context   |          | word, | we will | arrive at     |
Rk×|V|
|     |       |     |     |              | the same | update  | rule | for | u c as we did |
| --- | ----- | --- | --- | ------------ | -------- | ------- | ---- | --- | ------------- |
|     | . . . | . . | . . | . . . h∈R|k| |          |         |      |     |               |
|     |       |     |     |              | for v    | earlier |      |     |               |
w
|     |     | Wword∈Rk×|V| |     |            | Notice        | that even | when        | we  | have mul-     |
| --- | --- | ------------ | --- | ---------- | ------------- | --------- | ----------- | --- | ------------- |
|     |     |              |     |            | tiple context |           | words       | the | loss function |
|     |     |              |     |            | would         | just be   | a summation |     | of many       |
|     | 0 0 | 1 ...        | 0   | 0 0 x∈R|V| |               |           |             |     |               |
|     |     |              |     |            | cross entropy |           | errors      |     |               |
d−1
(cid:88)
L(θ)
|     |     |     |     |     |     |     | = − | logyˆ | wi  |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- |
i=1
|     |     |     |     |     | Typically, | we    | predict | context | words |
| --- | --- | --- | --- | --- | ---------- | ----- | ------- | ------- | ----- |
|     |     |     |     |     | on both    | sides | of the  | given   | word  |
43/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Some problems
| he  | sat   |     | a   | chair        |                    |          |             |               |
| --- | ----- | --- | --- | ------------ | ------------------ | -------- | ----------- | ------------- |
|     |       |     |     |              | Same as            | bag of   | words       |               |
|     |       |     |     |              | The softmax        | function |             | at the output |
|     |       |     |     | Wcontext ∈   |                    |          |             |               |
|     |       |     |     | Rk×|V|       | is computationally |          | expensive   |               |
|     | . . . | . . | . . | . . . h∈R|k| | Solution           | 1: Use   | negative    | sampling      |
|     |       |     |     |              | Solution           | 2: Use   | contrastive | estima-       |
Wword∈Rk×|V|
tion
|     |     |       |     |            | Solution | 3: Use | hierarchical | softmax |
| --- | --- | ----- | --- | ---------- | -------- | ------ | ------------ | ------- |
|     | 0 0 | 1 ... | 0   | 0 0 x∈R|V| |          |        |              |         |
44/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

D = [(sat, on), (sat, Let D be the set of all correct (w,c) pairs in the
| a), (sat, | chair), (on, | corpus |     |     |     |
| --------- | ------------ | ------ | --- | --- | --- |
a), (on,chair), (a,chair), Let D(cid:48) be the set of all incorrect (w,r) pairs in
| (on,sat),    | (a, sat),       |           |                       |                    |            |
| ------------ | --------------- | --------- | --------------------- | ------------------ | ---------- |
|              |                 | the       | corpus                |                    |            |
| (chair,sat), | (a, on),        |           |                       |                    |            |
|              |                 | D(cid:48) | can be constructed    | by randomly        | sampling a |
| (chair, on), | (chair, a)      | ]         |                       |                    |            |
|              |                 | context   | word r which          | has never appeared | with w     |
| D(cid:48)    |                 | and       | creating a pair (w,r) |                    |            |
| =            | [(sat, oxygen), |           |                       |                    |            |
(sat, magic), (chair, As before let v be the representation of the word
w
sad), (chair, walking)] wandu betherepresentationofthecontextword
c
c
45/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     | For | a given | (w,c) ∈ | D we | are interested | in max- |
| --- | --- | ------- | ------- | ---- | -------------- | ------- |
imizing
P(z = 1|w,c)
|     |     |     | p(z | = 1|w,c) |     |     |
| --- | --- | --- | --- | -------- | --- | --- |
σ
|     | Let | us model | this probability |     | by  |     |
| --- | --- | -------- | ---------------- | --- | --- | --- |
σ(uTv
|     |     |     | p(z = 1|w,c) | =   | )   |     |
| --- | --- | --- | ------------ | --- | --- | --- |
|     |     |     |              |     | c w |     |
·
1
=
|     |             |     |           |      | 1+e−uT c vw       |     |
| --- | ----------- | --- | --------- | ---- | ----------------- | --- |
|     | Considering |     | all (w,c) | ∈ D, | we are interested | in  |
u v
c w
(cid:89)
|     |     |     | maximize |     | p(z = 1|w,c) |     |
| --- | --- | --- | -------- | --- | ------------ | --- |
θ
(w,c)∈D
|     | where | θ is | the word | representation | (v  | ) and con- |
| --- | ----- | ---- | -------- | -------------- | --- | ---------- |
w
|     | textrepresentation(u |     |     | )forallwordsinourcorpus |     |     |
| --- | -------------------- | --- | --- | ----------------------- | --- | --- |
c
46/1
| MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |
| -------------- | --- | --------------------- | --- | --- | --------- | --- |

D(cid:48)
|     |     | For | (w,r) | ∈   | we are | interested | in maximizing |     |
| --- | --- | --- | ----- | --- | ------ | ---------- | ------------- | --- |
P(z = 0|w,r)
|     |     |     |     |     | p(z | = 0|w,r) |     |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- |
σ
|     |     | Again | we  | model | this | as  |     |     |
| --- | --- | ----- | --- | ----- | ---- | --- | --- | --- |
1−σ(uTv
|     |     |     | p(z | = 0|w,r) | =   |     | )   |     |
| --- | --- | --- | --- | -------- | --- | --- | --- | --- |
− r w
1
|     |     |     |     |     | =   | 1−    |       |     |
| --- | --- | --- | --- | --- | --- | ----- | ----- | --- |
|     |     |     |     |     |     | 1+e−v | r Tvw |     |
1
· σ(−uTv
|     |     |     |     |     | =   |       | =   | )   |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- |
|     |     |     |     |     |     | 1+euT | vw  | r w |
r
|     |     | Considering |     | all      | (w,r) | ∈ D(cid:48), | we are interested | in  |
| --- | --- | ----------- | --- | -------- | ----- | ------------ | ----------------- | --- |
| u   | v   |             |     |          |       |              |                   |     |
| r   | w   |             |     |          |       | (cid:89)     |                   |     |
|     |     |             |     | maximize |       | p(z          | = 0|w,r)          |     |
θ
(w,r)∈D(cid:48)
47/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|              |     | Combining |          | the two  | we get:    |          |            |     |
| ------------ | --- | --------- | -------- | -------- | ---------- | -------- | ---------- | --- |
| P(z = 0|w,r) |     |           |          | (cid:89) |            | (cid:89) |            |     |
|              |     |           | maximize |          | p(z=1|w,c) |          | p(z=0|w,r) |     |
θ
|     |     |           |     | (w,c)∈D  |            | (w,r)∈D(cid:48) |                |     |
| --- | --- | --------- | --- | -------- | ---------- | --------------- | -------------- | --- |
|     |     |           |     | (cid:89) |            | (cid:89)        |                |     |
|     |     | =maximize |     |          | p(z=1|w,c) |                 | (1−p(z=1|w,r)) |     |
σ
θ
|     |     |     |     | (w,c)∈D |     | (w,r)∈D(cid:48) |     |     |
| --- | --- | --- | --- | ------- | --- | --------------- | --- | --- |
(cid:88)
|     |     | =maximize |     |     | logp(z=1|w,c) |     |     |     |
| --- | --- | --------- | --- | --- | ------------- | --- | --- | --- |
θ
(w,c)∈D
− (cid:88)
|     |     |     |     | +   | log(1−p(z=1|w,r)) |     |     |     |
| --- | --- | --- | --- | --- | ----------------- | --- | --- | --- |
(w,r)∈D(cid:48)
|     |     |           |     | (cid:88) |     | 1   | (cid:88) | 1   |
| --- | --- | --------- | --- | -------- | --- | --- | -------- | --- |
|     |     | =maximize |     |          | log |     | +        | log |
·
|     |     |           | θ   |          | 1+e−vc   | Tvw |                 | 1+evr Tvw |
| --- | --- | --------- | --- | -------- | -------- | --- | --------------- | --------- |
|     |     |           |     | (w,c)∈D  |          |     | (w,r)∈D(cid:48) |           |
|     |     |           |     | (cid:88) |          |     | (cid:88)        |           |
|     |     | =maximize |     |          | logσ(vTv | )+  | logσ(−vTv       | )         |
|     |     |           |     |          |          | c w |                 | r w       |
θ
|     |     |       |       | (w,c)∈D |     | (w,r)∈D(cid:48) |     |     |
| --- | --- | ----- | ----- | ------- | --- | --------------- | --- | --- |
| u   | v   |       |       |         |     |                 |     |     |
| r   | w   | where | σ(x)= | 1       |     |                 |     |     |
1+e−x
48/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | In the   | original | paper, | Mikolov   | et. al.  | sample | k     |
| --- | --- | -------- | -------- | ------ | --------- | -------- | ------ | ----- |
|     |     | negative | (w,r)    | pairs  | for every | positive | (w,c)  | pairs |
P(z = 0|w,r)
|     |     | The | size of | D(cid:48) is thus | k times | the size      | of D    |     |
| --- | --- | --- | ------- | ----------------- | ------- | ------------- | ------- | --- |
|     |     | The | random  | context           | word    | is drawn from | a modi- |     |
σ
|     |     | fied | unigram | distribution |         |     |     |     |
| --- | --- | ---- | ------- | ------------ | ------- | --- | --- | --- |
|     |     |      |         | r            | ∼ p(r)4 | 3   |     |     |
−
|     |     |     |     |     | count(r)4 | 3   |     |     |
| --- | --- | --- | --- | --- | --------- | --- | --- | --- |
r ∼
N
| ·   |     | N = | total number |     | of words | in the corpus |     |     |
| --- | --- | --- | ------------ | --- | -------- | ------------- | --- | --- |
u v
r w
49/1
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

| Module | 10.6: Contrastive |     | estimation |     |
| ------ | ----------------- | --- | ---------- | --- |
50/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

Some problems
| he  | sat   |     | a   | chair        |                    |          |             |               |
| --- | ----- | --- | --- | ------------ | ------------------ | -------- | ----------- | ------------- |
|     |       |     |     |              | Same as            | bag of   | words       |               |
|     |       |     |     |              | The softmax        | function |             | at the output |
|     |       |     |     | Wcontext ∈   |                    |          |             |               |
|     |       |     |     | Rk×|V|       | is computationally |          | expensive   |               |
|     | . . . | . . | . . | . . . h∈R|k| | Solution           | 1: Use   | negative    | sampling      |
|     |       |     |     |              | Solution           | 2: Use   | contrastive | estima-       |
Wword∈Rk×|V|
tion
|     |     |       |     |            | Solution | 3: Use | hierarchical | softmax |
| --- | --- | ----- | --- | ---------- | -------- | ------ | ------------ | ------- |
|     | 0 0 | 1 ... | 0   | 0 0 x∈R|V| |          |        |              |         |
51/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

Positive: He sat on a chair Negative: He sat abracadabra a chair
|     | s   |     |     | s   |     |
| --- | --- | --- | --- | --- | --- |
c
Wout∈Rh×|1|
Wout∈Rh×|1|
| . . .    | . . . . . .            | .                   | . . .       | . . . . .     | . .           |
| -------- | ---------------------- | ------------------- | ----------- | ------------- | ------------- |
|          | Wh ∈                   |                     |             | Wh ∈          |               |
|          | R2d×h                  |                     |             | R2d×h         |               |
|          | vc vw                  |                     | vc          | vw            |               |
|          | sat on                 |                     | sat         | abracadabra   |               |
| We would | like s to be greater   | than s              |             |               |               |
|          |                        | c                   | So we can   | maximize s−(s | c +m)         |
| Okay, so | let us try to maximize | s−s                 |             |               |               |
|          |                        | c                   | What if s>s | c + m (don’t  | do any thing) |
| But we   | would like the         | difference to be at |             |               |               |
|          |                        |                     | maximize    | max(0,s−(s    | +m))          |
| least m  |                        |                     |             |               | c             |
52/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Module | 10.7: Hierarchical |     | softmax |     |
| ------ | ------------------ | --- | ------- | --- |
53/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

Some problems
| he  | sat   |     | a   | chair        |                    |          |             |               |
| --- | ----- | --- | --- | ------------ | ------------------ | -------- | ----------- | ------------- |
|     |       |     |     |              | Same as            | bag of   | words       |               |
|     |       |     |     |              | The softmax        | function |             | at the output |
|     |       |     |     | Wcontext ∈   |                    |          |             |               |
|     |       |     |     | Rk×|V|       | is computationally |          | expensive   |               |
|     | . . . | . . | . . | . . . h∈R|k| | Solution           | 1: Use   | negative    | sampling      |
|     |       |     |     |              | Solution           | 2: Use   | contrastive | estima-       |
Wword∈Rk×|V|
tion
|     |     |       |     |            | Solution | 3: Use | hierarchical | softmax |
| --- | --- | ----- | --- | ---------- | -------- | ------ | ------------ | ------- |
|     | 0 0 | 1 ... | 0   | 0 0 x∈R|V| |          |        |              |         |
54/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     |     | Construct | a binary tree such       | that there are |
| --- | --- | --- | --- | --- | --------- | ------------------------ | -------------- |
|     |     |     |     |     | |V| leaf  | nodes each corresponding | to one         |
|     |     |     |     |     | word in   | the vocabulary           |                |
ev T u w
| .   | . . 1 | . . . | . . . . | . max | c   |     |     |
| --- | ----- | ----- | ------- | ----- | --- | --- | --- |
(cid:80) e vc T uw
|V|
|     | . . . | . . .   | . . . . |     |     |     |     |
| --- | ----- | ------- | ------- | --- | --- | --- | --- |
|     | 0 1   | 0 ... 0 | 0 0     |     |     |     |     |
sat
55/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- |

|          | π(on)1=1 |     | u1  | Construct |            | a binary   | tree          | such that | there | are  |
| -------- | -------- | --- | --- | --------- | ---------- | ---------- | ------------- | --------- | ----- | ---- |
|          |          |     |     | |V|       | leaf nodes | each       | corresponding |           | to    | one  |
|          |          |     |     | word      | in the     | vocabulary |               |           |       |      |
| π(on)2=0 | u2       |     |     |           |            |            |               |           |       |      |
|          |          |     |     | There     | exists     | a unique   |               | path from | the   | root |
|          |          |     |     | node      | to a       | leaf node. |               |           |       |      |
π(on)3=0
|     |     |       |         | uV Let | l(w ),    | l(w ),   | ..., l(w | ) be the | nodes | on    |
| --- | --- | ----- | ------- | ------ | --------- | -------- | -------- | -------- | ----- | ----- |
|     |     |       |         |        | 1         | 2        |          | p        |       |       |
|     |     |       |         | the    | path from | root     | to w     |          |       |       |
|     | .   | . .   | .       |        |           |          |          |          |       |       |
|     |     |       |         | Let    | π(w) be   | a binary | vector   | such     | that: |       |
| . . | . 1 | . . . | . . . . | .      |           |          |          |          |       |       |
|     | on  |       |         | π(w)   | =1        | path     | branches | left at  | node  | l(w ) |
|     |     |       |         |        | k         |          |          |          |       | k     |
=0 otherwise
| .   | . . | . . . | . . . . h=v |     |     |     |     |     |     |     |
| --- | --- | ----- | ----------- | --- | --- | --- | --- | --- | --- | --- |
c Finallyeachinternalnodeisassociatedwith
|     |     |     |     | a vector | u   |     |     |     |     |     |
| --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- |
i
|     |     |     |     | So  | the parameters |     | of  | the module |     | are |
| --- | --- | --- | --- | --- | -------------- | --- | --- | ---------- | --- | --- |
0 1 0 ... 0 0 0 W context and u 1 ,u 2 ,...,u v (in effect, we
|     |     |     |     | have  | the same | number | of  | parameters | as  | be- |
| --- | --- | --- | --- | ----- | -------- | ------ | --- | ---------- | --- | --- |
|     |     | sat |     | fore) |          |        |     |            |     |     |
56/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- | --- |

|     |     | π(on)1=1 |     | u1  |     | For a           | given | pair (w,c) | we are | interested | in  |
| --- | --- | -------- | --- | --- | --- | --------------- | ----- | ---------- | ------ | ---------- | --- |
|     |     |          |     |     |     | the probability |       | p(w|v      | )      |            |     |
c
|          |     |     |     |     |     | We model | this | probability | as  |     |     |
| -------- | --- | --- | --- | --- | --- | -------- | ---- | ----------- | --- | --- | --- |
| π(on)2=0 |     | u2  |     |     |     |          |      |             |     |     |     |
(cid:89)
|     |     |     |     |     |     |     | p(w|v | )=  | (π(w | )|v ) |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | ---- | ----- | --- |
|     |     |     |     |     |     |     |       | c   | k    | c     |     |
π(on)3=0
|     |     |       |     |           | uV  |             |        |            | k        |             |     |
| --- | --- | ----- | --- | --------- | --- | ----------- | ------ | ---------- | -------- | ----------- | --- |
|     |     | . .   | . . |           |     | For example |        |            |          |             |     |
|     |     |       |     |           |     |             | P(on|v | )=P(π(on)  |          | =1|v        | )   |
| .   | . . | 1 . . | . . | . . .     | .   |             |        | sat        | 1        | sat         |     |
|     |     | on    |     |           |     |             |        | ∗P(π(on)   |          | =0|v        | )   |
|     |     |       |     |           |     |             |        |            | 2        | sat         |     |
|     |     |       |     |           |     |             |        | ∗P(π(on)   |          | =0|v        | )   |
|     |     |       |     |           |     |             |        |            | 3        | sat         |     |
|     | . . | . . . | . . | . . . h=v |     |             |        |            |          |             |     |
|     |     |       |     |           | c   | In effect,  | we     | are saying | that the | probability |     |
ofpredictingawordisthesameaspredicting
|     |     |         |     |     |     | the correct |      | unique | path from | the root | node |
| --- | --- | ------- | --- | --- | --- | ----------- | ---- | ------ | --------- | -------- | ---- |
|     |     |         |     |     |     | to that     | word |        |           |          |      |
|     | 0   | 1 0 ... | 0   | 0 0 |     |             |      |        |           |          |      |
sat
57/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

| π(on)1=1 |     | u1  | We  | model |     |     |     |
| -------- | --- | --- | --- | ----- | --- | --- | --- |
1
P(π(on) i =1)=
|     |     |     |     |     | 1+e−vc | Tui |     |
| --- | --- | --- | --- | --- | ------ | --- | --- |
π(on)2=0 u2
|     |     |     |     | P(π(on) | i =0)=1−P(π(on) | i =1) |     |
| --- | --- | --- | --- | ------- | --------------- | ----- | --- |
1
| π(on)3=0 |     |     |     | P(π(on) | =0)=          |          |         |
| -------- | --- | --- | --- | ------- | ------------- | -------- | ------- |
|          |     |     | uV  |         | i             |          |         |
|          |     |     |     |         | 1+evc         | Tui      |         |
| .        | . . | .   |     |         |               |          |         |
|          |     |     | The | above   | model ensures | that the | repres- |
. . . 1 . . . . . . . . entation of a context word v c will have a
| on  |     |     | high(low) | similarity | with            | the representation |      |
| --- | --- | --- | --------- | ---------- | --------------- | ------------------ | ---- |
|     |     |     | of the    | node       | u if u appears  | and the            | path |
|     |     |     |           |            | i i             |                    |      |
|     |     |     | branches  | to         | the left(right) | at u               |      |
i
| . . . | . . . | . . . . h=v |          |              |             |                 |       |
| ----- | ----- | ----------- | -------- | ------------ | ----------- | --------------- | ----- |
|       |       |             | c Again, | transitively | the         | representations | of    |
|       |       |             | contexts | which        | appear with | the same        | words |
|       |       |             | will     | have high    | similarity  |                 |       |
| 0 1   | 0 ... | 0 0 0       |          |              |             |                 |       |
sat
58/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     | π(on)1=1 |     | u1  |     |     |     |     |     |     |
| --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
|π(w)|
(cid:89)
| π(on)2=0 |     | u2  |     |     |     | P(w|v | ) = | P(π(w |     | )|v ) |
| -------- | --- | --- | --- | --- | --- | ----- | --- | ----- | --- | ----- |
|          |     |     |     |     |     |       | c   |       | k   | c     |
k=1
π(on)3=0
uV
|     |       |     |       |         |     | Note that   | p(w|v | )        | can now      | be com- |
| --- | ----- | --- | ----- | ------- | --- | ----------- | ----- | -------- | ------------ | ------- |
|     |       | .   | . .   | .       |     |             |       | c        |              |         |
|     |       |     |       |         |     | puted using |       | |π(w)|   | computations | in-     |
|     | . . . | 1   | . . . | . . . . | .   |             |       |          |              |         |
|     |       |     |       |         |     | stead of    | |V|   | required | by softmax   |         |
on
|     |     |     |     |             |     | How doweconstruct |          |      | thebinary | tree?      |
| --- | --- | --- | --- | ----------- | --- | ----------------- | -------- | ---- | --------- | ---------- |
|     |     |     |     |             |     | Turns             | out that | even | a         | random ar- |
|     | . . | . . | . . | . . . . h=v |     |                   |          |      |           |            |
c
|     |     |     |       |       |     | rangement | of  | the words | on  | leaf nodes |
| --- | --- | --- | ----- | ----- | --- | --------- | --- | --------- | --- | ---------- |
|     |     |     |       |       |     | does well | in  | practice  |     |            |
|     | 0   | 1   | 0 ... | 0 0 0 |     |           |     |           |     |            |
sat
59/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| Module | 10.8: GloVe | representations |     |     |
| ------ | ----------- | --------------- | --- | --- |
60/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

Count based methods (SVD) rely on global co-occurrence counts from the
| corpus | for computing | word representations |     |     |
| ------ | ------------- | -------------------- | --- | --- |
Predict based methods learn word representations using co-occurrence inform-
ation
| Why not | combine | the two (count | and learn) | ?   |
| ------- | ------- | -------------- | ---------- | --- |
61/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

Corpus:
|     |     |     |     |     |     |     | X ij | encodes | important | global | information |     |
| --- | --- | --- | --- | --- | --- | --- | ---- | ------- | --------- | ------ | ----------- | --- |
Humanmachineinterfaceforcomputerapplications
|     |     |     |     |     |     |     | about | the | co-occurrence | between | i and | j   |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | ------------- | ------- | ----- | --- |
Useropinionofcomputersystemresponsetime
|     |     |     |     |     |     |     | (global: | becauseitiscomputedfortheentire |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | ------------------------------- | --- | --- | --- | --- |
Userinterfacemanagementsystem
corpus)
Systemengineeringforimprovedresponsetime
Whynotlearnwordvectorswhicharefaith-
|         |       |         | X =       |       |           |     | ful to                               | this information? |            |        |       |     |
| ------- | ----- | ------- | --------- | ----- | --------- | --- | ------------------------------------ | ----------------- | ---------- | ------ | ----- | --- |
|         |       |         |           |       |           |     | For example,                         |                   | enforce    |        |       |     |
|         | human | machine | system    | for   | ... user  |     |                                      |                   |            |        |       |     |
| human   | 2.01  |         | 2.01 0.23 | 2.14  | ... 0.43  |     |                                      |                   |            |        |       |     |
| machine | 2.01  |         | 2.01 0.23 | 2.14  | ... 0.43  |     |                                      | v Tv              | =logP(j|i) |        |       |     |
|         |       |         |           |       |           |     |                                      | i                 | j          |        |       |     |
| system  | 0.23  |         | 0.23 1.17 | 0.96  | ... 1.29  |     |                                      |                   |            |        |       |     |
| for     | 2.14  |         | 2.14 0.96 | 1.87  | ... -0.13 |     |                                      |                   | =logX      | −log(X | )     |     |
| .       |       | .       | .         | . .   | .         | .   |                                      |                   |            | ij     | i     |     |
| .       |       | .       | .         | . .   | .         | .   |                                      |                   |            |        |       |     |
| .       |       | .       | .         | . .   | .         | .   | Similarly,                           |                   |            |        |       |     |
| user    | 0.43  |         | 0.43 1.29 | -0.13 | ... 1.71  |     |                                      |                   |            |        |       |     |
|         |       |         |           |       |           |     | vTv                                  | =logX             |            | −logX  | (X =X | )   |
|         |       |         |           |       |           |     | j                                    | i                 | ij         | j      | ij    | ji  |
|         |       |         | X         | X     |           |     |                                      |                   |            |        |       |     |
|         |       | P(j|i)= | ij =      | ij    |           |     | Essentiallywearesayingthatwewantword |                   |            |        |       |     |
(cid:80)
|     |     |     | X ij | X i |     |     | vectors | v and | v   | such that | vTv is faithful |     |
| --- | --- | --- | ---- | --- | --- | --- | ------- | ----- | --- | --------- | --------------- | --- |
|     |     |     |      |     |     |     |         | i     | j   |           | i j             |     |
X =X
|     |     | ij  | ji  |     |     |     | to the | globally | computed | P(j|i) |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | -------- | -------- | ------ | --- | --- |
62/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

Corpus:
Adding the two equations we get
Humanmachineinterfaceforcomputerapplications
Useropinionofcomputersystemresponsetime 2vTv =2logX −logX −logX
i j ij i j
Userinterfacemanagementsystem
1 1
Systemengineeringforimprovedresponsetime v i Tv j =logX ij − 2 logX i − 2 logX j
X =
NotethatlogX andlogX dependonlyon
i j
thewordsi&j andwecanthinkofthemas
human machine system for ... user
word specific biases which will be learned
human 2.01 2.01 0.23 2.14 ... 0.43
machine 2.01 2.01 0.23 2.14 ... 0.43
system 0.23 0.23 1.17 0.96 ... 1.29 vTv =logX −b −b
for 2.14 2.14 0.96 1.87 ... -0.13 i j ij i j
. . . . . . . vTv +b +b =logX
. . . . . . . i j i j ij
. . . . . . .
user 0.43 0.43 1.29 -0.13 ... 1.71
We can then formulate this as the following
optimization problem
P(j|i)= (cid:80) X X ij ij = X X i i j vi, m vj, i b n i,bj (cid:88) i,j (v (cid:124) i Tv j + (cid:123)(cid:122) b i +b (cid:125) j − l (cid:124) og (cid:123) X (cid:122) i (cid:125) j )2
X =X predictedvalue actualvalue
ij ji usingmodel computedfrom
parameters thegivencorpus
63/1
MiteshM.Khapra CS7015(DeepLearning): Lecture10

Corpus:
Humanmachineinterfaceforcomputerapplications
(cid:88)
Useropinionofcomputersystemresponsetime min (v Tv +b +b −logX )2
|                               |     |     |     |     |     |     |             |     | i j | i j | ij  |
| ----------------------------- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- |
| Userinterfacemanagementsystem |     |     |     |     |     |     | vi,vj,bi,bj |     |     |     |     |
i,j
Systemengineeringforimprovedresponsetime
|     |     | X   | =   |     |     |     | Drawback: |     | weighs | all | co-occurrences |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | ------ | --- | -------------- |
equally
|         | human       | machine | system | for       | ...     | user    |           |          |                 |          |     |
| ------- | ----------- | ------- | ------ | --------- | ------- | ------- | --------- | -------- | --------------- | -------- | --- |
|         |             |         |        |           |         |         | Solution: |          | add a weighting | function |     |
| human   | 2.01        | 2.01    | 0.23   | 2.14      | ...     | 0.43    |           |          |                 |          |     |
| m a c h | ine 2 . 0 1 | 2 . 0 1 | 0 .    | 2 3 2 . 1 | 4 . . . | 0 . 4 3 |           |          |                 |          |     |
|         |             |         |        |           |         |         |           | (cid:88) | )(vTv           |          | )2  |
sy s t em 0 . 2 3 0 . 2 3 1 . 1 7 0 . 9 6 . . . 1 . 2 9 min f(X ij j +b i +b j −logX ij
| fo r | 2. 14 | 2. 14 | 0.   | 96 1. 87 | . .. | -0. 13 | vi,vj,bi,bj |      |              | i      |              |
| ---- | ----- | ----- | ---- | -------- | ---- | ------ | ----------- | ---- | ------------ | ------ | ------------ |
| .    | .     | .     |      | . .      | .    | .      |             | i,j  |              |        |              |
| .    | .     | .     |      | . .      | .    | .      |             |      |              |        |              |
| .    | .     | .     |      | . .      | .    | .      |             |      |              |        |              |
|      |       |       |      |          |      |        | Wishlist:   |      | f(X ij )     | should | be such that |
| user | 0.43  | 0.43  | 1.29 | -0.13    | ...  | 1.71   |             |      |              |        |              |
|      |       |       |      |          |      |        | neither     | rare | nor frequent | words  | are over-    |
weighted.
|     |         | X        |      | X        |     |     |       |     |          |           |          |
| --- | ------- | -------- | ---- | -------- | --- | --- | ----- | --- | -------- | --------- | -------- |
|     | P(j|i)= |          | ij = | ij       |     |     |       |     | (cid:26) |           | (cid:27) |
|     |         | (cid:80) |      | (cid:80) |     |     |       |     | ( x )α,  | if x<x    |          |
|     |         |          | X ij | X i      |     |     | f(x)= |     | xm ax    |           | max      |
|     |         |          |      |          |     |     |       |     | 1,       | otherwise |          |
X =X
|     |     | ij ji |     |     |     |     |       |       |          |             |         |
| --- | --- | ----- | --- | --- | --- | --- | ----- | ----- | -------- | ----------- | ------- |
|     |     |       |     |     |     |     | where | α can | be tuned | for a given | dataset |
64/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

| Module | 10.9: Evaluating | word | representations |     |
| ------ | ---------------- | ---- | --------------- | --- |
65/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

| How do | we evaluate | the learned word | representations | ?   |
| ------ | ----------- | ---------------- | --------------- | --- |
66/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

|                   |       |          |       | Semantic |             | Relatedness       |                 |             |
| ----------------- | ----- | -------- | ----- | -------- | ----------- | ----------------- | --------------- | ----------- |
|                   |       |          |       |          | Ask humans  | to judge          | the relatedness |             |
|                   |       |          |       |          | between     | a pair of words   |                 |             |
|                   |       |          |       |          | Compute     | the cosine        |                 | similarity  |
|                   |       |          |       |          | between     | the corresponding |                 | word        |
|                   |       |          |       |          | vectors     | learned by the    | model           |             |
|                   |       |          |       |          | Given       | a large number    |                 | of such     |
| S human (cat,dog) | = 0.8 |          |       |          |             |                   |                 |             |
|                   |       |          |       |          | word pairs, | compute           | the             | correlation |
|                   |       | v T v    |       |          |             |                   |                 |             |
|                   |       | c at dog |       |          | between     | S & S             | ,               | and com-    |
| S (cat,dog)       | =     |          | = 0.7 |          |             | model             | human           |             |
model (cid:107) v (cid:107)(cid:107) v (cid:107) pare different models
|     |     | cat dog |     |     |                 |                  |          |      |
| --- | --- | ------- | --- | --- | --------------- | ---------------- | -------- | ---- |
|     |     |         |     |     | Model           | 1 is better than | Model    | 2 if |
|     |     |         |     |     | correlation(S   | model1           | ,S human | )    |
|     |     |         |     |     | > correlation(S |                  | ,S       | )    |
model2 human
67/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

Synonym Detection
|     |     |     |     | Given: | a term and | four candidate |     |
| --- | --- | --- | --- | ------ | ---------- | -------------- | --- |
synonyms
|            |             |            |             | Pick the                           | candidate    | which has    | the |
| ---------- | ----------- | ---------- | ----------- | ---------------------------------- | ------------ | ------------ | --- |
| Term       | : levied    |            |             | largestcosinesimilaritywiththeterm |              |              |     |
| Candidates | : {unposed, |            |             | Compute                            | the accuracy | of different |     |
|            |             |            |             | models                             | and compare  |              |     |
|            | believed,   | requested, | correlated} |                                    |              |              |     |
| Synonym    | : = argmax  | cosine(v   | term ,v c ) |                                    |              |              |     |
c∈C
68/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture10 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Analogy
|     |     |     | Semantic  | Analogy: | Find nearest |     |
| --- | --- | --- | --------- | -------- | ------------ | --- |
|     |     |     | neighbour | of v     | − v          | +   |
|     |     |     |           | sister   | brother      |     |
v
grandson
|                  |             |     | Syntactic | Analogy: | Find nearest |       |
| ---------------- | ----------- | --- | --------- | -------- | ------------ | ----- |
|                  |             |     | neighbour | of v     | −v +v        |       |
|                  |             |     |           | works    | work         | speak |
| brother : sister | :: grandson | : ? |           |          |              |       |
| work : works     | :: speak :  | ?   |           |          |              |       |
69/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

| So which algorithm | gives the best | result ? |     |
| ------------------ | -------------- | -------- | --- |
Boroni et.al [2014] showed that predict models consistently outperform count
| models in all tasks. |     |     |     |
| -------------------- | --- | --- | --- |
Levy et.al [2015] do a much more through analysis (IMO) and show that good
old SVD does better than prediction based models on similarity tasks but not
on analogy tasks.
70/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | -------------- | --------------------- | --------- |

| Module | 10.10: Relation | between | SVD | & word2Vec |
| ------ | --------------- | ------- | --- | ---------- |
71/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

| The story ahead | ...             |                   |             |           |
| --------------- | --------------- | ----------------- | ----------- | --------- |
| Continuous      | bag of          | words model       |             |           |
| Skip gram       | model with      | negative sampling | (the famous | word2vec) |
| GloVe           | word embeddings |                   |             |           |
| Evaluating      | word embeddings |                   |             |           |
| Good old        | SVD does        | just fine!!       |             |           |
72/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |
| --- | --- | -------------- | --------------------- | --------- |

| he  | sat |     | a   | chair      | RecallthatSVDdoesamatrixfactorization |               |               |      |
| --- | --- | --- | --- | ---------- | ------------------------------------- | ------------- | ------------- | ---- |
|     |     |     |     |            | of the co-occurrence                  | matrix        |               |      |
|     |     |     |     |            | Levy et.al                            | [2015] show   | that word2vec | also |
|     |     |     |     | Wcontext ∈ | implicitly                            | does a matrix | factorization |      |
Rk×|V|
|     |       |     |     |              | What does   | this mean ?    |     |     |
| --- | ----- | --- | --- | ------------ | ----------- | -------------- | --- | --- |
|     | . . . | . . | . . | . . . h∈R|k| |             |                |     |     |
|     |       |     |     |              | Recall that | word2vec gives | us  | W & |
context
|     |     |     |     |     | W . |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
word
Wword∈Rk×|V|
|     |     |       |     |            | Turns out | that we can also | show    | that |
| --- | --- | ----- | --- | ---------- | --------- | ---------------- | ------- | ---- |
|     |     |       |     |            |           | M =W context     | ∗W word |      |
|     | 0 0 | 1 ... | 0   | 0 0 x∈R|V| |           |                  |         |      |
where
|     |     |     |     |     | M   | =PMI(w ,c )−log(k) |     |     |
| --- | --- | --- | --- | --- | --- | ------------------ | --- | --- |
ij i i
|     |     |     |     |     | k=number        | of negative  | samples    |           |
| --- | --- | --- | --- | --- | --------------- | ------------ | ---------- | --------- |
|     |     |     |     |     | So essentially, | word2vec     | factorizes | a mat-    |
|     |     |     |     |     | rix M which     | is related   | to the     | PMI based |
|     |     |     |     |     | co-occurrence   | matrix (very | similar    | to what   |
|     |     |     |     |     | SVD does)       |              |            |           |
73/1
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture10 |     |     |
| --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |
