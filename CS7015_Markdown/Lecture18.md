| CS7015 | (Deep Learning) | : Lecture | 18  |
| ------ | --------------- | --------- | --- |
|        | Markov          | Networks  |     |
|        | Mitesh          | M. Khapra |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/29
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| --- | -------------- | --------------------- | --------- |

Acknowledgments
Probabilistic Graphical models: Principles and Techniques, Daphne Koller
and Nir Friedman
2/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| -------------- | --------------------- | --------- |

| Module | 18.1: Markov | Networks: | Motivation |     |
| ------ | ------------ | --------- | ---------- | --- |
3/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| --- | --- | -------------- | --------------------- | --------- |

|     | To motivate | undirected      | graphical     |
| --- | ----------- | --------------- | ------------- |
| A   | models      | let us consider | a new example |
D B
C
A,B,C,D are four students
A and B study together sometimes
B and C study together sometimes
C and D study together sometimes
A and D study together sometimes
A and C never study together
B and D never study together
4/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

|     |     |     | To motivate | undirected      | graphical        |     |
| --- | --- | --- | ----------- | --------------- | ---------------- | --- |
|     | A   |     | models      | let us consider | a new example    |     |
|     |     |     | Now suppose | there           | was some miscon- |     |
|     |     |     | ception     | in the lecture  | due to some      | er- |
| D   |     | B   |             |                 |                  |     |
|     |     |     | ror made    | by the teacher  |                  |     |
|     |     |     | Each one    | of A, B,        | C, D could have  | in- |
C
|     |     |     | dependently | cleared | this misconcep- |     |
| --- | --- | --- | ----------- | ------- | --------------- | --- |
tionbythinkingaboutitafterthelec-
| A,B,C,D | are four students |           | ture          |               |                 |      |
| ------- | ----------------- | --------- | ------------- | ------------- | --------------- | ---- |
|         |                   |           | In subsequent | study         | pairs, each     | stu- |
| A and   | B study together  | sometimes |               |               |                 |      |
|         |                   |           | dent could    | then pass     | on this inform- |      |
| B and   | C study together  | sometimes |               |               |                 |      |
|         |                   |           | ation to      | their partner |                 |      |
| C and   | D study together  | sometimes |               |               |                 |      |
| A and   | D study together  | sometimes |               |               |                 |      |
| A and   | C never study     | together  |               |               |                 |      |
| B and   | D never study     | together  |               |               |                 |      |
5/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     | We are     | now interested | in knowing    |      |
| --- | ---------- | -------------- | ------------- | ---- |
| A   | whether    | a student      | still has the | mis- |
|     | conception | or not         |               |      |
|     | Or we      | are interested | in P(A,B,C,D) |      |
D B
|     | where              | A, B, C, D | can take values  | 0   |
| --- | ------------------ | ---------- | ---------------- | --- |
|     | (no misconception) |            | or 1 (misconcep- |     |
C
tion)
|     | How do | we model | this using | a   |
| --- | ------ | -------- | ---------- | --- |
A,B,C,D are four students
|     | Bayesian | Network ? |     |     |
| --- | -------- | --------- | --- | --- |
A and B study together sometimes
B and C study together sometimes
C and D study together sometimes
A and D study together sometimes
A and C never study together
B and D never study together
6/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     | First let      | us examine | the conditional |
| --- | --- | -------------- | ---------- | --------------- |
|     | A   | independencies | in this    | problem         |
|     |     | A ⊥ C|{B,D}    | (because   | A & C never     |
interact)
D B
|     |     | B ⊥ D|{A,C} | (because | B & D never |
| --- | --- | ----------- | -------- | ----------- |
interact)
C
|               |                    | There      | are no other conditional | inde-      |
| ------------- | ------------------ | ---------- | ------------------------ | ---------- |
|               |                    | pendencies | in the problem           |            |
| A,B,C,D are   | four students      |            |                          |            |
|               |                    | Now let    | us try to represent      | this using |
| A and B study | together sometimes | a Bayesian | Network                  |            |
| B and C study | together sometimes |            |                          |            |
| C and D study | together sometimes |            |                          |            |
| A and D study | together sometimes |            |                          |            |
| A and C never | study together     |            |                          |            |
| B and D never | study together     |            |                          |            |
7/29
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     | How about | this one? |     |
| --- | --------- | --------- | --- |
A
|     | Indeed,      | it captures | the following in- |
| --- | ------------ | ----------- | ----------------- |
|     | dependencies | relation    |                   |
D B
A ⊥ C|{B,D}
| C   | But, it | also implies that |     |
| --- | ------- | ----------------- | --- |
B (cid:54)⊥ D|{A,C}
8/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

|     |     |     | Let us | try a different | network |     |
| --- | --- | --- | ------ | --------------- | ------- | --- |
| D   |     | B   |        |                 |         |     |
Again
A ⊥ C|{B,D}
But
| C   |     | A   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
B ⊥ D(unconditional)
| Perfect | Map: A | graph G is a Per- | You can | try other | networks |     |
| ------- | ------ | ----------------- | ------- | --------- | -------- | --- |
fectMapforadistributionP ifthein- Turns out there is no Bayesian Net-
dependance relations implied by the work which can exactly capture inde-
| graph   | are exactly         | the same as those |          |               |         |            |
| ------- | ------------------- | ----------------- | -------- | ------------- | ------- | ---------- |
|         |                     |                   | pendence | relations     | that we | are inter- |
| implied | by the distribution |                   |          |               |         |            |
|         |                     |                   | ested in |               |         |            |
|         |                     |                   | There    | is no Perfect | Map for | the dis-   |
tribution
9/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

Theproblemisthatadirectedgraph-
| A   |     | ical model | is not suitable | for this ex- |
| --- | --- | ---------- | --------------- | ------------ |
ample
|     |     | A directed | edge between | two nodes |
| --- | --- | ---------- | ------------ | --------- |
D B
|     |     | implies | some kind of direction | in the |
| --- | --- | ------- | ---------------------- | ------ |
interaction
C
|     |     | For example       | A → B                 | could indicate   |
| --- | --- | ----------------- | --------------------- | ---------------- |
|     |     | that A            | influences B but      | not the other    |
|     |     | way round         |                       |                  |
|     |     | But in            | our example A&B       | are equal        |
|     |     | partners          | (they both contribute | to the           |
|     |     | study discussion) |                       |                  |
|     |     | We want           | to capture the        | strength of      |
|     |     | this interaction  | (and                  | there is no dir- |
|     |     | ection here)      |                       |                  |
10/29
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     | We move     | on from Directed | Graph-    |
| --- | ----------- | ---------------- | --------- |
| A   | ical Models | to Undirected    | Graphical |
Models
|     | Also known | as Markov | Network |
| --- | ---------- | --------- | ------- |
D B
|     | The Markov     | Network          | on the left ex- |
| --- | -------------- | ---------------- | --------------- |
|     | actly captures | the interactions | inher-          |
C
|     | ent in  | the problem        |      |
| --- | ------- | ------------------ | ---- |
|     | But how | do we parameterize | this |
graph?
11/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

| Module | 18.2: Factors | in Markov | Network |     |
| ------ | ------------- | --------- | ------- | --- |
12/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Recall | that in the directed | case the |
| --- | ------ | -------------------- | -------- |
Difficulty Intellligence factors were Conditional Probability
|     | Distributions | (CPDs) |     |
| --- | ------------- | ------ | --- |
Eachsuchfactorcapturedinteraction
Grade SAT
|     | (dependence) | between | the connected |
| --- | ------------ | ------- | ------------- |
nodes
Letter
|     | Can we     | use CPDs in | the undirected |
| --- | ---------- | ----------- | -------------- |
|     | case also  | ?           |                |
|     | CPDs don’t | make sense  | in the undir-  |
P(G,S,I,L,D) =
|     | ected case | because there | is no direc- |
| --- | ---------- | ------------- | ------------ |
P(I)P(D)P(G|I,D)P(S|I)P(L|G)
|     | tion and | hence no natural | condition- |
| --- | -------- | ---------------- | ---------- |
|     | ing (Is  | A|B or B|A?)     |            |
13/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

Sowhatshouldbethefactorsorpara-
| A   | meters    | in this case |               |
| --- | --------- | ------------ | ------------- |
|     | Question: | What do      | we want these |
|     | factors   | to capture ? |               |
D B
|     | Answer: | The affinity     | between con- |
| --- | ------- | ---------------- | ------------ |
|     | nected  | random variables |              |
C
Justasinthedirectedcasethefactors
|     | captured       | the conditional | dependence      |
| --- | -------------- | --------------- | --------------- |
|     | between        | a set of random | variables,      |
|     | here we        | want them to    | capture the af- |
|     | finity between | them            |                 |
14/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

|     |     |     | However   | we can         | borrow | the     | intuition |
| --- | --- | --- | --------- | -------------- | ------ | ------- | --------- |
| A   |     |     | from the  | directed       | case.  |         |           |
|     |     |     | Even in   | the undirected |        | case,   | we want   |
|     |     |     | each such | factor         | to     | capture | inter-    |
D B
|     |     |     | actions | (affinity) | between |     | connected |
| --- | --- | --- | ------- | ---------- | ------- | --- | --------- |
nodes
C
|     |     |     | We could   | have         | factors |         | φ 1 (A,B), |
| --- | --- | --- | ---------- | ------------ | ------- | ------- | ---------- |
|     |     |     | φ (B,C),   | φ (C,D),     |         | φ (D,A) | which      |
|     |     |     | 2          | 3            |         | 4       |            |
|     |     |     | capture    | the affinity |         | between | the cor-   |
|     |     |     | responding | nodes.       |         |         |            |
15/29
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture18 |     |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     |     |     |     |     | Intuitively,  | it makes           | sense         | to         | have |
| --- | --- | --- | --- | --- | --- | --- | ------------- | ------------------ | ------------- | ---------- | ---- |
|     |     |     | A   |     |     |     | these         | factors associated |               | with       | each |
|     |     |     |     |     |     |     | pair of       | connected random   |               | variables. |      |
|     |     |     |     |     |     |     | We could      | now assign         | some          | values     | of   |
|     | D   |     |     |     | B   |     |               |                    |               |            |      |
|     |     |     |     |     |     |     | these factors |                    |               |            |      |
|     |     |     |     |     |     |     | Roughly       | speaking           | φ (A,B)       | asserts    |      |
|     |     |     | C   |     |     |     |               |                    | 1             |            |      |
|     |     |     |     |     |     |     | that it       | is more likely     | for           | A and      | B    |
|     |     |     |     |     |     |     | to agree      | [∵ weights         | for a0b0,a1b1 |            | >    |
a0b1,a1b0]
|     | φ1(A,B) | φ2(B,C) |        | φ3(C,D) | φ4(D,A)   |     |                               |              |      |        |     |
| --- | ------- | ------- | ------ | ------- | --------- | --- | ----------------------------- | ------------ | ---- | ------ | --- |
| a0  | b0 30   | a0 b0   | 100 a0 | b0 1    | a0 b0 100 |     |                               |              |      |        |     |
|     |         |         |        |         |           |     | φ (A,B)                       | also assigns | more | weight | to  |
| a0  | b1 5    | a0 b1   | 1 a0   | b0 100  | a0 b1 1   |     | 1                             |              |      |        |     |
| a1  | b0      | a1 b0   | a1     | b1      | a1 b0     |     |                               |              |      |        |     |
|     | 1       |         | 1      | 100     | 1         |     | thecasewhenbothdonothaveamis- |              |      |        |     |
| a1  | b1 10   | a1 b1   | 100 a1 | b1 1    | a1 b1 100 |     |                               |              |      |        |     |
But who will give us these values ? conception as compared to the case
Well now you need to learn them from data when both have the misconception
|     | (same  | as in the   | directed | case)       |          |     | a0b0 > | a1b1 |     |     |     |
| --- | ------ | ----------- | -------- | ----------- | -------- | --- | ------ | ---- | --- | --- | --- |
|     | If you | have access | to a     | lot of past | interac- |     |        |      |     |     |     |
Wecouldhavesimilarassignmentsfor
|     | tions             | between | A&B then | you            | could learn |                       | the other | factors   |     |     |       |
| --- | ----------------- | ------- | -------- | -------------- | ----------- | --------------------- | --------- | --------- | --- | --- | ----- |
|     | these values(more |         | on this  | later)         |             |                       |           |           |     |     | 16/29 |
|     |                   |         |          | MiteshM.Khapra |             | CS7015(DeepLearning): |           | Lecture18 |     |     |       |

|     |     |     |     |     |     | Notice a | few things |     |
| --- | --- | --- | --- | --- | --- | -------- | ---------- | --- |
A
|     |     |     |     |     |     | These tables          | do not represent | prob-        |
| --- | --- | --- | --- | --- | --- | --------------------- | ---------------- | ------------ |
|     |     |     |     |     |     | ability distributions |                  |              |
|     | D   |     |     |     | B   | They are              | just weights     | which can be |
|     |     |     |     |     |     | interpreted           | as the relative  | likelihood   |
|     |     |     |     |     |     | of an event           |                  |              |
C
|     |         |           |     |         |           | For example, | a = 0,b     | = 0 is more |
| --- | ------- | --------- | --- | ------- | --------- | ------------ | ----------- | ----------- |
|     | φ1(A,B) | φ2(B,C)   |     | φ3(C,D) | φ4(D,A)   | likely than  | a = 1,b = 1 |             |
| a0  | b0 30   | a0 b0 100 | a0  | b0 1    | a0 b0 100 |              |             |             |
| a0  | b1      | a0 b1     | a0  | b0      | a0 b1     |              |             |             |
|     | 5       | 1         |     | 100     | 1         |              |             |             |
| a1  | b0 1    | a1 b0 1   | a1  | b1 100  | a1 b0 1   |              |             |             |
| a1  | a1 10   | a1 b1 100 | a1  | b1 1    | a1 b1 100 |              |             |             |
17/29
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture18 |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --------- | --- |

|     |     |     |     |     |     | But eventually  |               | we          | are         | interested | in      |
| --- | --- | --- | --- | --- | --- | --------------- | ------------- | ----------- | ----------- | ---------- | ------- |
|     |     |     | A   |     |     | probability     | distributions |             |             |            |         |
|     |     |     |     |     |     | In the          | directed      |             | case        | going      | from    |
|     |     |     |     |     |     | factors         | to a          | joint       | probability |            | dis-    |
|     | D   |     |     |     | B   |                 |               |             |             |            |         |
|     |     |     |     |     |     | tribution       | was           | easy        | as          | the        | factors |
|     |     |     |     |     |     | were themselves |               | conditional |             |            | probab- |
C
|     |         |         |     |         |         | ility distributions |      |       |     |       |         |
| --- | ------- | ------- | --- | ------- | ------- | ------------------- | ---- | ----- | --- | ----- | ------- |
|     |         |         |     |         |         | We could            | just | write | the | joint | probab- |
|     | φ1(A,B) | φ2(B,C) |     | φ3(C,D) | φ4(D,A) |                     |      |       |     |       |         |
a0 b0 30 a0 b0 100 a0 b0 1 a0 b0 100 ilitydistributionastheproductofthe
| a0  | b1  | a0 b1 | a0  | b0  | a0 b1 |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | ----- | --- | --- | --- | --- | --- | --- |
|     | 5   |       | 1   | 100 | 1     |     |     |     |     |     |     |
a1 b0 1 a1 b0 1 a1 b1 100 a1 b0 1 factors (without violating the axioms
| a1  | a1 10 | a1 b1 | 100 a1 | b1 1 | a1 b1 100 |     |     |     |     |     |     |
| --- | ----- | ----- | ------ | ---- | --------- | --- | --- | --- | --- | --- | --- |
of probability)
|     |     |     |     |     |     | What    | do we   | do in       | this case | when      | the |
| --- | --- | --- | --- | --- | --- | ------- | ------- | ----------- | --------- | --------- | --- |
|     |     |     |     |     |     | factors | are not | probability |           | distribu- |     |
tions
18/29
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture18 |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|            |              |            | Well we | could still write | it as a product |
| ---------- | ------------ | ---------- | ------- | ----------------- | --------------- |
| Assignment | Unnormalized | Normalized |         |                   |                 |
a0 b0 c0 d0 300,000 4.17E-02 of these factors and normalize it appro-
| a0 b0 c0 | d1           |             |            |          |                     |
| -------- | ------------ | ----------- | ---------- | -------- | ------------------- |
|          | 300,000      | 4.17E-02    |            |          |                     |
| a0 b0 c1 | d0           |             | priately   |          |                     |
|          | 300,000      | 4.17E-02    |            |          |                     |
| a0 b0 c1 | d1           | 30 4.17E-06 |            |          |                     |
| a0 b1 c0 | d0 500       | 6.94E-05    |            |          |                     |
|          |              |             | P(a,b,c,d) | =        |                     |
| a0 b1 c0 | d1 500       | 6.94E-05    |            |          |                     |
| a0 b1 c1 | d0 5,000,000 | 6.94E-01    |            | 1        |                     |
|          |              |             |            | φ (a,b)φ | (b,c)φ (c,d)φ (d,a) |
| a0 b1 c1 | d1 500       | 6.94E-05    |            | 1        | 2 3 4               |
Z
| a1 b0 c0 | d0 100       | 1.39E-05    |          |          |                     |
| -------- | ------------ | ----------- | -------- | -------- | ------------------- |
| a1 b0 c0 | d1 1,000,000 | 1.39E-01    | where    |          |                     |
| a1 b0 c1 | d0 100       | 1.39E-05    |          |          |                     |
| a1 b0 c1 | d1           |             |          |          |                     |
|          | 100          | 1.39E-05    | (cid:88) |          |                     |
| a1 b1 c0 | d0           |             | Z =      | φ (a,b)φ | (b,c)φ (c,d)φ (d,a) |
|          |              | 10 1.39E-06 |          | 1 2      | 3 4                 |
| a1 b1 c0 | d1 100,000   | 1.39E-02    |          |          |                     |
a,b,c,d
| a1 b1 c1 | d0 100,000 | 1.39E-02 |             |                 |                 |
| -------- | ---------- | -------- | ----------- | --------------- | --------------- |
| a1 b1 c1 | d1 100,000 | 1.39E-02 |             |                 |                 |
|          |            |          | Based on    | the values that | we had assigned |
|          |            |          | to the      | factors we can  | now compute the |
|          |            |          | full joint  | probability     | distribution    |
|          |            |          | Z is called | the partition   | function.       |
19/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     | Let us       | build on the    | original example   |
| --- | --- | --- | ------------ | --------------- | ------------------ |
|     |     |     | by adding    | some more       | students           |
|     |     |     | Once again   | there           | is an edge between |
| E   | A   | F   |              |                 |                    |
|     |     |     | two students | if they         | study together     |
|     |     |     | One way      | of interpreting | these new          |
| D   | B   |     |              |                 |                    |
|     |     |     | connections  | is that         | {A,D,E} from a     |
|     |     |     | study group  | or a clique     |                    |
C
|     |     |     | Similarly | {A,F,B} | form a study |
| --- | --- | --- | --------- | ------- | ------------ |
groupand{C,D}formastudygroup
|     |     |     | and {B,C} | form a | study group |
| --- | --- | --- | --------- | ------ | ----------- |
20/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     |     |     |     | Now, what | should | the factors | be? |
| --- | --- | --- | --- | --- | --- | --------- | ------ | ----------- | --- |
Wecouldstillhavefactorswhichcap-
|     |     |     |     |     |     | ture pairwise | interactions    |          |             |
| --- | --- | --- | --- | --- | --- | ------------- | --------------- | -------- | ----------- |
|     | E   |     | A   |     | F   |               |                 |          |             |
|     |     |     |     |     |     | But could     | we do something |          | smarter     |
|     |     |     |     |     |     | (and more     | efficient)      |          |             |
|     |     | D   |     | B   |     |               |                 |          |             |
|     |     |     |     |     |     | Instead       | of having       | a factor | for each    |
|     |     |     |     |     |     | pair of       | nodes why not   | have     | it for each |
C
|            |        |          |     |        |       | maximal | clique? |     |     |
| ---------- | ------ | -------- | --- | ------ | ----- | ------- | ------- | --- | --- |
| φ          | (A,E)φ | (A,F)φ   |     | (B,F)φ | (A,B) |         |         |     |     |
|            | 1      | 2        |     | 3      | 4     |         |         |     |     |
| φ          | (A,D)φ | (D,E)φ   |     | (B,C)φ | (C,D) |         |         |     |     |
|            | 5      | 6        |     | 7      | 8     |         |         |     |     |
| φ (A,E,D)φ |        | (A,F,B)φ |     | (B,C)φ | (C,D) |         |         |     |     |
| 1          |        | 2        |     | 3      | 4     |         |         |     |     |
21/29
|     |     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| --- | --- | --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     | What         | if we add | one more student? |       |
| --- | --- | --- | ------------ | --------- | ----------------- | ----- |
|     |     |     | What will    | be the    | factors in this   | case? |
|     |     |     | Remember,    | we are    | interested in     | max-  |
|     |     |     | imal cliques |           |                   |       |
| E   | A   | F   | So instead   | of having | factors φ(EAG)    |       |
G
|     |     |     | φ(GAD) | φ(EGD)         | we will have | a   |
| --- | --- | --- | ------ | -------------- | ------------ | --- |
|     |     |     | single | factor φ(AEGD) | correspond-  |     |
| D   | B   |     |        |                |              |     |
|     |     |     | ing to | the maximal    | clique       |     |
C
22/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|            |       |               |     |     |     | E   | A   |     | F   |
| ---------- | ----- | ------------- | --- | --- | --- | --- | --- | --- | --- |
| Difficulty |       | Intellligence |     |     |     |     |     |     |     |
|            |       |               |     |     |     |     | B   | C   |     |
|            | Grade |               | SAT |     |     |     |     |     |     |
D
Letter
|     |     |     |     |     | A   | distribution | factorizes | over | a Markov |
| --- | --- | --- | --- | --- | --- | ------------ | ---------- | ---- | -------- |
A distribution P factorizes over a Bayesian Network H if P can be expressed as
| Network | G if P | can be expressed | as  |     |     |     |     |     |     |
| ------- | ------ | ---------------- | --- | --- | --- | --- | --- | --- | --- |
m
1 (cid:89)
|     |            | n        |          |     |     | P(X | ,...,X | )=  | φ(D ) |
| --- | ---------- | -------- | -------- | --- | --- | --- | ------ | --- | ----- |
|     |            | (cid:89) |          |     |     |     | 1 n    | Z   | i     |
|     | P(X ,...,X | )=       | P(X |P ) |     |     |     |        |     |       |
|     | 1          | n        | i aXi    |     |     |     |        | i=1 |       |
i=1
|     |     |     |     |     | where | each | D is a complete |     | sub-graph |
| --- | --- | --- | --- | --- | ----- | ---- | --------------- | --- | --------- |
i
|     |     |     |     |     | (maximal |     | clique) in | H   |     |
| --- | --- | --- | --- | --- | -------- | --- | ---------- | --- | --- |
A distribution is a Gibbs distribution parametrized by a set of factors Φ={φ 1 (D 1 ),...,φ m (D m )}
| if it is defined | as  |     |     |     |     |     |     |     |     |
| ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1 (cid:89) m
|     |     |     | P(X ,...,X | )=  | φ   | (D ) |     |     |     |
| --- | --- | --- | ---------- | --- | --- | ---- | --- | --- | --- |
|     |     |     | 1          | n   |     | i i  |     |     |     |
Z
i=1
23/29
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture18 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| Module | 18.3: Local | Independencies | in  | a Markov |
| ------ | ----------- | -------------- | --- | -------- |
Network
24/29
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Let U be  | the set of             | all random | vari-   |
| --- | --------- | ---------------------- | ---------- | ------- |
|     | ables in  | our joint distribution |            |         |
|     | Let X,Y,Z | be some                | distinct   | subsets |
of U
|     | A distribution | P            | over        | these RVs |
| --- | -------------- | ------------ | ----------- | --------- |
|     | would          | imply X⊥Y|Z  | if and      | only if   |
|     | we can         | write        |             |           |
|     | P(X)           | = φ 1 (X,Z)φ | 2 (Y,Z)     |           |
|     | Let us         | see this in  | the context | of our    |
|     | original       | example      |             |           |
25/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| A   | In this example |     |     |
| --- | --------------- | --- | --- |
|     | P(A,B,C,D)      | =   |     |
D B
1
|     | [φ 1 (A,B)φ | 2 (B,C)φ 3 (C,D)φ | 4 (D,A)] |
| --- | ----------- | ----------------- | -------- |
Z
C
|     | We can rewrite | this as |     |
| --- | -------------- | ------- | --- |
|     | P(A,B,C,D)     | =       |     |
1
|     | [φ (A,B)φ | (B,C)][φ (C,D)φ | (D,A)] |
| --- | --------- | --------------- | ------ |
|     | 1         | 2 3             | 4      |
Z
|     | (cid:124)   | (cid:123)(cid:122) (cid:125)(cid:124) | (cid:123)(cid:122) (cid:125) |
| --- | ----------- | ------------------------------------- | ---------------------------- |
|     | φ5(B,{A,C}) | φ6(D,{A,C})                           |                              |
|     | We can      | say that B⊥D|{A,C}                    | which                        |
|     | is indeed   | true                                  |                              |
26/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |
| -------------- | --------------------- | --------- | --- |

| A   | In this example |     |     |     |
| --- | --------------- | --- | --- | --- |
|     | P(A,B,C,D)      | =   |     |     |
D B
1
|     | [φ 1 (A,B)φ | 2 (B,C)φ 3 (C,D)φ | 4 (D,A)] |     |
| --- | ----------- | ----------------- | -------- | --- |
Z
C
|     | Alternatively | we can rewrite | this as |     |
| --- | ------------- | -------------- | ------- | --- |
|     | P(A,B,C,D)    | =              |         |     |
1
|     | [φ (A,B)φ | (D,A)][φ (C,D)φ | (B,C)] |     |
| --- | --------- | --------------- | ------ | --- |
|     | 1         | 2 3             | 4      |     |
Z
|     | (cid:124)   | (cid:123)(cid:122) (cid:125)(cid:124) | (cid:123)(cid:122) | (cid:125) |
| --- | ----------- | ------------------------------------- | ------------------ | --------- |
|     | φ5(A,{B,D}) |                                       | φ6(C,{B,D})        |           |
|     | We can      | say that A⊥C|{B,D}                    | which              |           |
|     | is indeed   | true                                  |                    |           |
27/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     | For a given      | Markov        | network     | H we  |
| --- | ---------------- | ------------- | ----------- | ----- |
|     | define Markov    | Blanket       | of a RV     | X to  |
|     | be the neighbors | of            | X in H      |       |
|     | Analogous        | to the case   | of Bayesian |       |
|     | Networks         | we can define | the local   | in-   |
|     | dependences      | associated    | with H      | to be |
|     | X⊥(U             | −{X}−MB       | )|MB        | (X)   |
H H
28/29
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| Bayesian   | network       | Markov | network |
| ---------- | ------------- | ------ | ------- |
| Difficulty | Intellligence |        |         |
Grade SAT
Letter
| Local Independencies |          | Local Independencies |             |
| -------------------- | -------- | -------------------- | ----------- |
| X ⊥NonDescendents    | |ParentG |                      | |NeighborsG |
| i                    | Xi Xi    | X i ⊥NonNeighbors    | Xi          |
Xi
29/29
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture18 |
| --- | -------------- | --------------------- | --------- |
