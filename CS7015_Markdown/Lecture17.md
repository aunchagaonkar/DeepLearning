| CS7015 | (Deep Learning) | : Lecture | 17  |
| ------ | --------------- | --------- | --- |
Recap of Probability Theory, Bayesian Networks, Conditional Independence in
|     | Bayesian | Networks  |     |
| --- | -------- | --------- | --- |
|     | Mitesh   | M. Khapra |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | -------------- | --------------------- | --------- |

| Module | 17.0: Recap | of Probability | Theory |     |
| ------ | ----------- | -------------- | ------ | --- |
2/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

We will start with a quick recap of some basic concepts from probability
3/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| -------------- | --------------------- | --------- |

|     | Axioms of | Probability |     |     |
| --- | --------- | ----------- | --- | --- |
|     | For any   | event A,    |     |     |
Ω
|     |     | P(A) | ≥ 0 |     |
| --- | --- | ---- | --- | --- |
A
1
| A 3 | If A   | ,A ,A ,....,A | are disjoint |              |
| --- | ------ | ------------- | ------------ | ------------ |
|     | 1      | 2 3           | n            |              |
|     | events | (i.e., A ∩ A  | = φ ∀i       | (cid:54)= j) |
|     |        | i             | j            |              |
A then
2
| A 4 A 5 |     | (cid:88) |       |     |
| ------- | --- | -------- | ----- | --- |
|         |     | P(∪A ) = | P(A ) |     |
|         |     | i        | i     |     |
i
|     | If Ω is | the universal | set containing | all |
| --- | ------- | ------------- | -------------- | --- |
|     | events  | then          |                |     |
|     |         | P(Ω)          | = 1            |     |
4/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Random Variable | (intuition)     |               |         |
| --- | --- | --- | --------------- | --------------- | ------------- | ------- |
|     |     |     | Suppose         | a student       | can get one   | of 3    |
| Ω   |     |     | possible        | grades in a     | course: A,B,C |         |
|     |     |     | One way         | of interpreting | this          | is that |
B
|     |     |     | there are | 3 possible | events here |     |
| --- | --- | --- | --------- | ---------- | ----------- | --- |
A
|     |     |        | Another      | way of looking    | at                | this is |
| --- | --- | ------ | ------------ | ----------------- | ----------------- | ------- |
|     | C   |        | there is     | a random variable | G                 | which   |
|     |     |        | each student | to one            | of the 3 possible |         |
|     |     | Grades | values       |                   |                   |         |
|     |     |        | And we       | are interested    | in P(G            | = g)    |
A
|     |     | B   | where | g ∈ {A,B,C} |     |     |
| --- | --- | --- | ----- | ----------- | --- | --- |
Ω
|     | G   | C   | Of course,   | both interpretations |     | are |
| --- | --- | --- | ------------ | -------------------- | --- | --- |
|     |     |     | conceptually | equivalent           |     |     |
5/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     | Random Variable |         | (intuition) |               |
| --- | --------------- | ------- | ----------- | ------------- |
|     | But the         | second  | one         | (using random |
|     | variables)      | is more | compact     |               |
Grades
|     | Specially, | when | there | are multiple |
| --- | ---------- | ---- | ----- | ------------ |
A
|     | attributes | associated |     | with a student |
| --- | ---------- | ---------- | --- | -------------- |
Ω B
| G C | (outcome) | - grade, | height, | age, etc.       |
| --- | --------- | -------- | ------- | --------------- |
|     | We could  | have     | one     | random variable |
Height
|         | corresponding |     | to each      | attribute |
| ------- | ------------- | --- | ------------ | --------- |
| H Short | And then      | ask | for outcomes | (or stu-  |
Tall
|     | dents) | where   | Grade | = g, Height = |
| --- | ------ | ------- | ----- | ------------- |
|     | h, Age | = a and | so on |               |
Age
A
Adult
Young
6/86
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |
| -------------- | --------------------- | --- | --------- | --- |

|     |     | Random Variable | (formal)          |               |      |
| --- | --- | --------------- | ----------------- | ------------- | ---- |
|     |     | A random        | variable          | is a function |      |
|     |     | which           | maps each outcome | in Ω          | to a |
Grades
value
A
|     |     | Inthepreviousexample,G(orf  |     |     | )     |
| --- | --- | --------------------------- | --- | --- | ----- |
| Ω   | B   |                             |     |     | grade |
|     | G C | mapseachstudentinΩtoavalue: |     |     | A,    |
|     |     | B or C                      |     |     |       |
Height
|     |         | The event | Grade =    | A is a shorthand |     |
| --- | ------- | --------- | ---------- | ---------------- | --- |
|     | H Short | for the   | event {ω ∈ | Ω : f Grade =    | A}  |
Tall
Age
A
Adult
Young
7/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

|     | Random | Variable | (continuous |     | v/s |
| --- | ------ | -------- | ----------- | --- | --- |
discrete)
|     | A   | random | variable can | either | take |
| --- | --- | ------ | ------------ | ------ | ---- |
Grades
|     | continuous |     | values | (for example, |     |
| --- | ---------- | --- | ------ | ------------- | --- |
A
weight,height)
Ω B
| G C | Or  | discrete | values | (for example, |     |
| --- | --- | -------- | ------ | ------------- | --- |
grade,nationality)
Height
|     | For | this discussion | we  | will mainly | fo- |
| --- | --- | --------------- | --- | ----------- | --- |
120cm
.
| H . | cus | on discrete | random | variables |     |
| --- | --- | ----------- | ------ | --------- | --- |
.
200cm
Weight
A 120 kg
. .
.
45kg
8/86
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

|       |     | Marginal Distribution |                  |                |
| ----- | --- | --------------------- | ---------------- | -------------- |
|       |     | What do               | we mean by       | marginal dis-  |
|       |     | tribution             | over a random    | variable ?     |
| G P(G | =   | Consider              | our random       | variable G for |
| g)    |     | grades                |                  |                |
| A 0.1 |     | Specifying            | the marginal     | distribution   |
| B 0.2 |     |                       |                  |                |
|       |     | over G                | means specifying |                |
| C 0.7 |     |                       |                  |                |
|       |     | P(G                   | = g) ∀g          | ∈ A,B,C        |
|       |     | We denote             | this marginal    | distribution   |
|       |     | compactly             | by P(G)          |                |
9/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     |     | Joint | Distribution    |            |          |           |     |
| --- | --- | ----- | --------------- | ---------- | -------- | --------- | --- |
|     |     |       | Consider        | two random | variable | G (grade) | and |
|     |     |       | I (intellegence | ∈ {High,   | Low})    |           |     |
G I P(G = g,I = i) The joint distribution over these two random
| A High | 0.3  |     | variables | assigns probabilities |              | to all events | in- |
| ------ | ---- | --- | --------- | --------------------- | ------------ | ------------- | --- |
| A Low  | 0.1  |     | volving   | these two             | random       | variables     |     |
| B High | 0.15 |     |           |                       |              |               |     |
| B Low  | 0.15 |     | P(G =     | g,I = i)              | ∀(g,i) ∈     | {A,B,C}×{H,L} |     |
| C High | 0.1  |     |           |                       |              |               |     |
|        |      |     | We denote | this joint            | distribution | compactly     |     |
| C Low  | 0.2  |     |           |                       |              |               |     |
by P(G,I)
10/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     | Conditional | Distribution |     |     |     |     |     |
| --- | ----------- | ------------ | --- | --- | --- | --- | --- |
G P(G|I = H) Consider two random variable G (grade) and I (intel-
| A 0.6 | legence)        |     |              |           |        |            |           |
| ----- | --------------- | --- | ------------ | --------- | ------ | ---------- | --------- |
| B 0.3 | Suppose         | we  | are given    | the value | of     | I (say, I  | = H) then |
| C 0.1 | the conditional |     | distribution |           | P(G|I) | is defined | as        |
G P(G|I = L)
|       |     |       |        | P(G = | g,I = | H)   |         |
| ----- | --- | ----- | ------ | ----- | ----- | ---- | ------- |
| A 0.3 | P(G | = g|I | = H) = |       |       | ∀g ∈ | {A,B,C} |
| B 0.4 |     |       |        | P(I   | = H)  |      |         |
C 0.3
|     | More | compactly | defined | as  |     |     |     |
| --- | ---- | --------- | ------- | --- | --- | --- | --- |
P(G,I)
|     |     |     | P(G|I) | =   |     |     |     |
| --- | --- | --- | ------ | --- | --- | --- | --- |
P(I)
|     |     | or  | P(G,I)                       | =           | P(G|I)                                 | ∗ P(I)                               |     |
| --- | --- | --- | ---------------------------- | ----------- | -------------------------------------- | ------------------------------------ | --- |
|     |     |     | (cid:124) (cid:123)(cid:122) | (cid:125)   | (cid:124) (cid:123)(cid:122) (cid:125) | (cid:124)(cid:123)(cid:122)(cid:125) |     |
|     |     |     | joint                        | conditional |                                        | marginal                             |     |
11/86
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     | Joint | Distribution |              | (n  | random | variables) |           |     |
| --- | --- | --- | --- | ----- | ------------ | ------------ | --- | ------ | ---------- | --------- | --- |
|     |     |     |     |       | The joint    | distribution |     | of n   | random     | variables |     |
assignsprobabilitiestoalleventsinvolvingthe
| X ...   | X P(X   | ,X  | ,...,X | )   | n random | variables, |            |        |          |        |       |
| ------- | ------- | --- | ------ | --- | -------- | ---------- | ---------- | ------ | -------- | ------ | ----- |
| 1       | n       | 1   | 2      | n   |          |            |            |        |          |        |       |
| ... ... | ... ... |     |        |     | In other | words      | it assigns |        |          |        |       |
| ... ... | ... ... |     |        |     |          |            |            |        |          |        |       |
| ... ... | ... ... |     |        |     |          |            | P(X        | = x ,X | = x      | ,...,X | = x ) |
|         |         |     |        |     |          |            | 1          | 1      | 2        | 2 n    | n     |
|         |         |     |        |     | for all  | possible   | values     | that   | variable | X can  | take  |
i
(cid:80)
|     |     |     | =   | 1   |                       |     |     |     |                  |     |     |
| --- | --- | --- | --- | --- | --------------------- | --- | --- | --- | ---------------- | --- | --- |
|     |     |     |     |     | IfeachrandomvariableX |     |     |     | cantaketwovalues |     |     |
i
|     |     |     |     |     | then the | joint | distribution |     | will assign | probab- |     |
| --- | --- | --- | --- | --- | -------- | ----- | ------------ | --- | ----------- | ------- | --- |
2n
|     |     |     |     |     | ilities to | the | possible | events |     |     |     |
| --- | --- | --- | --- | --- | ---------- | --- | -------- | ------ | --- | --- | --- |
12/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture17 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|       |       |           | Joint | Distribution |              | (n    | random | variables)  |       |
| ----- | ----- | --------- | ----- | ------------ | ------------ | ----- | ------ | ----------- | ----- |
|       |       |           |       | The joint    | distribution |       | over   | two random  | vari- |
|       |       |           |       | ables        | X and        | X can | be     | written as, |       |
|       |       |           |       |              | 1            | 2     |        |             |       |
| X ... | X P(X | ,X ,...,X | )     |              |              |       |        |             |       |
1 n 1 2 n P(X 1 ,X 2 ) = P(X 2 |X 1 )P(X 1 ) = P(X 1 |X 2 )P(X 2 )
| ... ... | ... ... |     |     |           |           |          |           |                  |      |
| ------- | ------- | --- | --- | --------- | --------- | -------- | --------- | ---------------- | ---- |
| ... ... | ... ... |     |     | Similarly | for       | n random | variables |                  |      |
| ... ... | ... ... |     |     |           |           |          |           |                  |      |
|         |         |     |     | P(X       | ,X ,...,X | )        |           |                  |      |
|         |         |     |     |           | 1 2       | n        |           |                  |      |
|         |         |     |     | = P(X     | ,...,X    | |X       | )P(X      | )                |      |
|         |         |     |     |           | 2         | n        | 1         | 1                |      |
|         |         |     |     | = P(X     | 3 ,...,X  | n |X     | 1 ,X 2    | )P(X 2 |X 1 )P(X | 1 )  |
|         |         |     |     | = P(X     | ,...,X    | |X       | ,X        | ,X )P(X |X       | ,X ) |
|         |         |     |     |           | 4         | n        | 1 2       | 3 3              | 2 1  |
|         |         |     |     | P(X       | |X        | )P(X     | )         |                  |      |
|         |         |     |     |           | 2         | 1 1      |           |                  |      |
n
(cid:89)
|     |     |     |     | = P(X | )   | P(X | |Xi−1) | (chain | rule) |
| --- | --- | --- | --- | ----- | --- | --- | ------ | ------ | ----- |
|     |     |     |     |       | 1   |     | i      |        |       |
1
i=2
13/86
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture17 |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|           |       |          | From          | Joint        | Distributions |     | to Marginal       |       |        |
| --------- | ----- | -------- | ------------- | ------------ | ------------- | --- | ----------------- | ----- | ------ |
| A B       | P(A = | a,B = b) | Distributions |              |               |     |                   |       |        |
| High High | 0.3   |          |               | Suppose      | we are given  | a   | joint distribtion |       | over   |
| High Low  | 0.25  |          |               | two random   | variables     | A,  | B                 |       |        |
| Low High  | 0.35  |          |               | The marginal | distributions |     | of A              | and B | can be |
| Low Low   | 0.1   |          |               |              |               |     |                   |       |        |
|           |       |          |               | computed     | as            |     |                   |       |        |
(cid:88)
| A P(A     | = a) |     |     |     | P(A = a) = | P(A | = a,B | =   | b)  |
| --------- | ---- | --- | --- | --- | ---------- | --- | ----- | --- | --- |
| High 0.55 |      |     |     |     |            |     |       |     |     |
∀b
| Low 0.45 |      |     |     |     |            | (cid:88) |       |     |     |
| -------- | ---- | --- | --- | --- | ---------- | -------- | ----- | --- | --- |
|          |      |     |     |     | P(B = b) = | P(A      | = a,B | =   | b)  |
| B P(B    | = a) |     |     |     |            |          |       |     |     |
∀a
| High 0.65 |     |     |     |      |                   |     |     |     |     |
| --------- | --- | --- | --- | ---- | ----------------- | --- | --- | --- | --- |
|           |     |     |     | More | compactly written |     | as  |     |     |
| Low 0.35  |     |     |     |      |                   |     |     |     |     |
(cid:88)
|     |     |     |     |     | P(A) | =   | P(A,B) |     |     |
| --- | --- | --- | --- | --- | ---- | --- | ------ | --- | --- |
B
(cid:88)
|     |     |     |     |     | P(B) | =   | P(A,B) |     |     |
| --- | --- | --- | --- | --- | ---- | --- | ------ | --- | --- |
14/86
A
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |     |     | What | if there | are | n random |     | variables | ?   |     |
| --- | --- | --- | ---- | -------- | --- | -------- | --- | --------- | --- | --- |
A B P(A = a,B = b) Suppose we are given a joint distribtion over
| High High | 0.3  |     |     | n random     | variables |               | X , X , | ..., X |     |     |
| --------- | ---- | --- | --- | ------------ | --------- | ------------- | ------- | ------ | --- | --- |
|           |      |     |     |              |           |               | 1 2     | n      |     |     |
| High Low  | 0.25 |     |     | The marginal |           | distributions |         | over X | can | be  |
1
| Low High  | 0.35 |     |     | computed       | as    |          |      |               |     |       |
| --------- | ---- | --- | --- | -------------- | ----- | -------- | ---- | ------------- | --- | ----- |
| Low Low   | 0.1  |     |     |                |       |          |      |               |     |       |
|           |      |     |     | P(X 1 =        | x 1 ) |          |      |               |     |       |
| A P(A     | = a) |     |     | (cid:88)       |       |          |      |               |     |       |
|           |      |     |     | =              | P(X   | =        | x ,X | = x ,...,X    |     | = x ) |
| High 0.55 |      |     |     |                |       | 1        | 1 2  | 2             | n   | n     |
| Low 0.45  |      |     |     | ∀x2,x3,...,xn  |       |          |      |               |     |       |
| B P(B     | = a) |     |     |                |       |          |      |               |     |       |
|           |      |     |     | More compactly |       | written  | as   |               |     |       |
| High 0.65 |      |     |     |                |       | (cid:88) |      |               |     |       |
|           |      |     |     | P(X            | 1 ) = |          | P(X  | 1 ,X 2 ,...,X | n ) |       |
| Low 0.35  |      |     |     |                |       |          |      |               |     |       |
X2,X3,...,Xn
15/86
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture17 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     | Conditional |     | Independence |     |     |     |
| --- | --- | ----------- | --- | ------------ | --- | --- | --- |
Recall that by Chain Rule of TworandomvariablesX andY aresaidtobe
| Probability |              |         | independent  | if              |        |                 |        |
| ----------- | ------------ | ------- | ------------ | --------------- | ------ | --------------- | ------ |
| P(X,Y)      | = P(X)P(Y|X) |         |              |                 |        |                 |        |
|             |              |         |              | P(X|Y)          | =      | P(X)            |        |
| However,    | if X and Y   | are in- |              |                 |        |                 |        |
|             |              |         | We denote    | this as         | X ⊥⊥ Y |                 |        |
| dependent,  | then         |         |              |                 |        |                 |        |
|             |              |         | In other     | words, knowing  |        | the value of    | Y does |
|             |              |         | not change   | our belief      | about  | X               |        |
| P(X,Y)      | = P(X)P(Y)   |         |              |                 |        |                 |        |
|             |              |         | We would     | expect          | Grade  | to be dependent | on     |
|             |              |         | Intelligence | but independent |        | of Weight       |        |
16/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

Okay, we are now ready to move on to Bayesian Networks or Directed Graphical
Models
17/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| -------------- | --------------------- | --------- |

| Module | 17.1: Why | are we | interested | in Joint |
| ------ | --------- | ------ | ---------- | -------- |
Distributions
18/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | In many | real world | applications, | we  |
| --- | --- | --- | ------- | ---------- | ------------- | --- |
Y
|          | Oil      |       | have to      | deal with a  | large number  | of  |
| -------- | -------- | ----- | ------------ | ------------ | ------------- | --- |
|          |          |       | random       | variables    |               |     |
| X        | X        | X     |              |              |               |     |
| 1        | 2        | 3     |              |              |               |     |
| Salinity | Pressure | Depth | For example, | an oil       | company may   | be  |
|          |          |       | interested   | in computing | the probabil- |     |
| X 4      |          | X 5   |              |              |               |     |
Temperature Biodiversity ity of finding oil at a particular loca-
tion
X 6
|       | Density  |         | This may       | depend | on various | (ran- |
| ----- | -------- | ------- | -------------- | ------ | ---------- | ----- |
|       |          |         | dom) variables |        |            |       |
| P(Y,X | ,X ,X ,X | ,X ,X ) |                |        |            |       |
| 1     | 2 3      | 4 5 6   |                |        |            |       |
Thecompanyisinterestedinknowing
|     |     |     | the joint | distribution |     |     |
| --- | --- | --- | --------- | ------------ | --- | --- |
19/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     | But why | joint distribution? |     |     |
| --- | --- | --- | --- | ------- | ------------------- | --- | --- |
Y
Oil
|             |          |              |       | Aren’t         | we just       | interested          | in    |
| ----------- | -------- | ------------ | ----- | -------------- | ------------- | ------------------- | ----- |
| X           | X        |              | X     |                |               |                     |       |
| 1           | 2        |              | 3     | P(Y|X          | 1 ,X 2 ,...,X | n )?                |       |
| Salinity    | Pressure |              | Depth |                |               |                     |       |
|             |          |              |       | Well, if       | we know       | the joint distribu- |       |
| X 4         |          | X 5          |       |                |               |                     |       |
|             |          |              |       | tion, we       | can find      | answers to a        | bunch |
| Temperature |          | Biodiversity |       |                |               |                     |       |
|             |          |              |       | of interesting | questions     |                     |       |
X 6
|     |     |     |     | Let us | see some such | questions | of in- |
| --- | --- | --- | --- | ------ | ------------- | --------- | ------ |
Density
terest
| P(Y,X | ,X ,X ,X | ,X ,X | )   |     |     |     |     |
| ----- | -------- | ----- | --- | --- | --- | --- | --- |
| 1     | 2 3      | 4 5   | 6   |     |     |     |     |
20/86
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

|             |     |          |              |       | We    | can find | the      | conditional | distribution  |           |        |     |
| ----------- | --- | -------- | ------------ | ----- | ----- | -------- | -------- | ----------- | ------------- | --------- | ------ | --- |
|             |     | Y        |              |       |       |          |          |             | P(Y,X         | ,...,X    | )      |     |
|             |     |          |              |       |       |          |          |             |               | 1         | n      |     |
|             |     |          |              |       | P(Y|X | ,...,X   | ) =      | (cid:80)    |               |           |        |     |
|             |     | Oil      |              |       |       | 1        | n        |             |               | P(Y,X     | ,...,X | )   |
|             |     |          |              |       |       |          |          | X1,...,Xn   |               |           | 1      | n   |
| X           |     | X        |              | X     |       |          |          |             |               |           |        |     |
| 1           |     | 2        |              | 3     |       |          |          |             |               |           |        |     |
| Salinity    |     | Pressure |              | Depth |       |          |          |             |               |           |        |     |
|             |     |          |              |       | We    | can find | the      | marginal    | distribution, |           |        |     |
|             | X   |          |              | X     |       |          |          |             |               |           |        |     |
|             | 4   |          |              | 5     |       |          | (cid:88) |             |               |           |        |     |
|             |     |          |              |       |       | P(Y)     | =        | P(Y,X       |               | ,X ,...,X | )      |     |
| Temperature |     |          | Biodiversity |       |       |          |          |             | 1             | 2         | n      |     |
X1,...,Xn
|     |     | X 6 |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Density
|       |      |           |           |     | We  | can find | the   | conditional | independencies, |     |     |     |
| ----- | ---- | --------- | --------- | --- | --- | -------- | ----- | ----------- | --------------- | --- | --- | --- |
| P(Y,X | 1 ,X | 2 ,X 3 ,X | 4 ,X 5 ,X | 6 ) |     |          | P(Y,X | ) =         | P(Y)P(X         | )   |     |     |
|       |      |           |           |     |     |          |       | 1           |                 | 1   |     |     |
21/86
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |     |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- | --- |

| Module | 17.2: How | do we represent | a joint | distribution |
| ------ | --------- | --------------- | ------- | ------------ |
22/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     | Let us return | to  | the case | of n | random |
| --- | --- | --- | --- | ------------- | --- | -------- | ---- | ------ |
Y (yes/no)
variables
Oil
|     |              |                |                    | For simplicity |          | assume | each   | of these |
| --- | ------------ | -------------- | ------------------ | -------------- | -------- | ------ | ------ | -------- |
|     |              |                |                    | variables      | can take | binary | values |          |
| X   | 1 (high/low) | X 2 (high/low) | X 3 (deep/shallow) |                |          |        |        |          |
Salinity Depth
|     |     | Pressure |     | To specify | the | joint distribution, |     | we  |
| --- | --- | -------- | --- | ---------- | --- | ------------------- | --- | --- |
2n
|     | X (high/low) |     | X (high/low) | need to       | specify | −   | 1 values.  | Why |
| --- | ------------ | --- | ------------ | ------------- | ------- | --- | ---------- | --- |
|     | 4            |     | 5            |               |         |     |            |     |
|     |              |     |              | not (2n)?     |         |     |            |     |
|     | Temperature  |     | Biodiversity |               |         |     |            |     |
|     |              |     |              | If we specify | these   | 2n  | −1 values, | we  |
X (high/low)
|     |       | 6        |         | haveanexplicitrepresentationforthe |     |     |     |     |
| --- | ----- | -------- | ------- | ---------------------------------- | --- | --- | --- | --- |
|     |       | Density  |         | joint distribution                 |     |     |     |     |
|     | P(Y,X | ,X ,X ,X | ,X ,X ) |                                    |     |     |     |     |
|     |       | 1 2 3    | 4 5 6   |                                    |     |     |     |     |
23/86
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

|     |         |         |     |     | Challenges | with explicit |     |     |     |
| --- | ------- | ------- | --- | --- | ---------- | ------------- | --- | --- | --- |
| X 1 | X 2 X 3 | X 4 ... | X n | P   |            |               |     |     |     |
representation
| 0   | 0 0 | 0 ... | 0   | 0.01 |                |            |           |             |     |
| --- | --- | ----- | --- | ---- | -------------- | ---------- | --------- | ----------- | --- |
|     |     |       |     |      | Computational: |            | Expensive | to          | ma- |
| 1   | 0 0 | 0 ... | 0   | 0.03 |                |            |           |             |     |
| 0   | 1 0 | 0 ... | 0   | 0.05 | nipulate       | and too    | large     | to to store |     |
| 1   | 1 0 | 0 ... | 0   | 0.1  |                |            |           |             |     |
|     |     |       |     |      | Cognitive:     | Impossible |           | to acquire  | so  |
...
|     |     |     |     |     | many numbers |     | from a | human |     |
| --- | --- | --- | --- | --- | ------------ | --- | ------ | ----- | --- |
...
...
|          |                        |        |     |           | Statistical:  | Need | huge       | amounts | of  |
| -------- | ---------------------- | ------ | --- | --------- | ------------- | ---- | ---------- | ------- | --- |
| 1        | 1 1                    | 1 ...  | 1   | 0.002     |               |      |            |         |     |
|          |                        |        |     |           | data to learn | the  | parameters |         |     |
| (Once    | the first 2n−1         | values | are | specified |               |      |            |         |     |
| the last | value is deterministic |        | as  | the       |               |      |            |         |     |
| values   | need to sum            | to 1)  |     |           |               |      |            |         |     |
24/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- | --- |

| Module | 17.3: Can  | we represent | the joint | distribution |
| ------ | ---------- | ------------ | --------- | ------------ |
| more   | compactly? |              |           |              |
25/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

Considerthecaseoftworandomvari-
| I S | P(I,S) |     |                                   |     |     |
| --- | ------ | --- | --------------------------------- | --- | --- |
| 0 0 | 0.665  |     | ables,Intelligence(I)andSATScores |     |     |
| 0 1 | 0.035  |     | (S)                               |     |     |
| 1 0 | 0.06   |     |                                   |     |     |
Assumethatbotharebinaryandtake
| 1 1               | 0.24 |            |                                  |                 |     |
| ----------------- | ---- | ---------- | -------------------------------- | --------------- | --- |
|                   |      |            | values from                      | High(1), Low(0) |     |
| This distribution | has  | (22−1 = 3) |                                  |                 |     |
| parameters.       |      |            | Hereisonewayofspecifyingthejoint |                 |     |
distribution
| Alternatively, | the table            | has 4 rows      |               |                |            |
| -------------- | -------------------- | --------------- | ------------- | -------------- | ---------- |
| but the last   | row is deterministic |                 |               |                |            |
|                |                      |                 | Of course,    | there are many | such joint |
| given the      | first 3 rows         | (or parameters) |               |                |            |
|                |                      |                 | distributions | possible       |            |
26/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|      |     |     |     | Note that | there is   | a natural | ordering |     |
| ---- | --- | --- | --- | --------- | ---------- | --------- | -------- | --- |
|      | i = | 0 i | = 1 |           |            |           |          |     |
| P(I) | 0.7 | 0.3 |     | in these  | two random | variables |          |     |
no.of parameters=1
|            |      |      |     | The SAT      | Score (S)             | presumably   |         | de- |
| ---------- | ---- | ---- | --- | ------------ | --------------------- | ------------ | ------- | --- |
|            | s =  | 0 s  | = 1 |              |                       |              |         |     |
|            |      |      |     | pends        | upon the Intelligence |              | (I).    | An  |
| P(S|I = 0) | 0.95 | 0.05 |     |              |                       |              |         |     |
|            |      |      |     | alternate    | and even              | more         | natural | way |
| P(S|I = 1) | 0.2  | 0.8  |     |              |                       |              |         |     |
|            |      |      |     | to represent | the same              | distribution |         | is  |
no.of parameters=2
| What! | So from | 3 parameters | we have |     |     |     |     |     |
| ----- | ------- | ------------ | ------- | --- | --- | --- | --- | --- |
P(I,S) = P(I)×P(S|I)
| gone to   | 6 parameters? |           |         |     |     |     |     |     |
| --------- | ------------- | --------- | ------- | --- | --- | --- | --- | --- |
| Well, not | really!       | (remember | sum for |     |     |     |     |     |
each row in the above table has to be Instead of specifying the 4 entries in
| 1)         |     |            |            | P(I,S),  | we can specify |            | 2 entries | for |
| ---------- | --- | ---------- | ---------- | -------- | -------------- | ---------- | --------- | --- |
|            |     |            |            | P(I) and | 4 entries      | for P(S|I) |           |     |
| The number | of  | parameters | is still 3 |          |                |            |           |     |
27/86
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- | --- | --- |

|      |         |     | What have         | we achieved | so far?         |
| ---- | ------- | --- | ----------------- | ----------- | --------------- |
|      | i=0 i=1 |     |                   |             |                 |
|      |         |     | We were           | not able to | reduce the num- |
| P(I) | 0.7 0.3 |     |                   |             |                 |
|      |         |     | ber of parameters |             |                 |
no.of parameters=1
|                    | s=0 s=1   |     | But, we      | have a more          | natural way of |
| ------------------ | --------- | --- | ------------ | -------------------- | -------------- |
| P(S|I = 0)         | 0.95 0.05 |     |              |                      |                |
|                    |           |     | representing | the distribution     |                |
| P(S|I = 1)         | 0.2 0.8   |     |              |                      |                |
| no.of parameters=2 |           |     | This is      | known as conditional | para-          |
meterization
28/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

Nowconsiderathirdrandomvariable
|     | Grade (G) |     |     |     |
| --- | --------- | --- | --- | --- |
Intelligence
|     | Notice          | that none of | these 3 variables |     |
| --- | --------------- | ------------ | ----------------- | --- |
|     | are independent | of           | each other        |     |
SAT Grade
|     | Grade and    | SAT Score         | are clearly | cor-    |
| --- | ------------ | ----------------- | ----------- | ------- |
|     | related      | with Intelligence |             |         |
|     | Grade and    | SAT Score         | are also    | correl- |
|     | ated because | we would          | expect      |         |
|     | P(G =        | 1|S = 1) >        | P(G = 1|S   | = 0)    |
29/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     | However,  | it        | is possible | that        | the | dis-  |
| --- | --- | --------- | --------- | ----------- | ----------- | --- | ----- |
|     |     | tribution | satisfies | a           | conditional |     | inde- |
Intelligence
pendence
|     |       | If we             | know           | that I | = H,           | then | it is |
| --- | ----- | ----------------- | -------------- | ------ | -------------- | ---- | ----- |
| SAT | Grade | possiblethatS     |                | = H    | doesnotgiveany |      |       |
|     |       | extra information |                | for    | determining    |      | G     |
|     |       | In other          | words,         | if we  | know           | that | the   |
|     |       | student           | is intelligent |        | we can         | make | in-   |
ferencesabouthisgradewithouteven
|     |     | knowing   | the  | SAT score |      |            |      |
| --- | --- | --------- | ---- | --------- | ---- | ---------- | ---- |
|     |     | Formally, | we   | assume    | that | (S ⊥       | G|I) |
|     |     | Note that | this | is just   | an   | assumption |      |
30/86
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     |     | We could        | argue that | in many | cases |
| --- | --- | --------------- | ---------- | ------- | ----- |
|     |     | S (cid:54)⊥ G|I |            |         |       |
Intelligence
|     |       | For example, | a student               | might   | be in- |
| --- | ----- | ------------ | ----------------------- | ------- | ------ |
|     |       | telligent,   | butwealsohavetofactorin |         |        |
| SAT | Grade | his/her      | ability to write        | in time | bound  |
exams
|     |     | In which    | case S and       | G        | are not in- |
| --- | --- | ----------- | ---------------- | -------- | ----------- |
|     |     | dependent   | given I          | (because | the SAT     |
|     |     | score tells | us about         | the      | ability to  |
|     |     | write time  | bound exams)     |          |             |
|     |     | But, for    | this discussion, |          | we will as- |
|     |     | sume S      | ⊥ G|I            |          |             |
31/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

Question
| Now let’s        | see the implication | of this assumption |     |
| ---------------- | ------------------- | ------------------ | --- |
| Does it simplify | things in           | any way?           |     |
32/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | -------------- | --------------------- | --------- |

|      |         |     | How many | parameters | do we need | to  |
| ---- | ------- | --- | -------- | ---------- | ---------- | --- |
|      |         |     | specify  | P(I,G,S)?  |            |     |
|      | i = 0 i | = 1 |          |            |            |     |
| P(I) | 0.7 0.3 |     |          |            |            |     |
|      |         |     |          | (2×2×3−1   | = 11)      |     |
no.of parameters=1
|            | s=0 s=1   |     |           |                    |           |       |
| ---------- | --------- | --- | --------- | ------------------ | --------- | ----- |
|            |           |     | What if   | we use conditional | paramet-  |       |
| P(S|I = 0) | 0.95 0.05 |     |           |                    |           |       |
| P(S|I = 1) | 0.2 0.8   |     | erization | by following       | the chain | rule? |
no.of parameters=2
|                    |           |      | P(I,G,S) | = P(S,G|I)P(I)       |     |     |
| ------------------ | --------- | ---- | -------- | -------------------- | --- | --- |
|                    | g=A g=B   | g=C  |          | = P(S|G,I)P(G|I)P(I) |     |     |
| P(G—I=0)           | 0.2 0.34  | 0.46 |          | = P(S|I)P(G|I)P(I)   |     |     |
| P(G—I=1)           | 0.74 0.17 | 0.09 |          |                      |     |     |
| no.of parameters=4 |           |      | since (S | ⊥ G|I)               |     |     |
Weneedthefollowingdistributionsto
total no.of parameters=7 fully specify the joint distribution
33/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|      |         |     | The alternate | parameterization | is           |
| ---- | ------- | --- | ------------- | ---------------- | ------------ |
|      |         |     | more natural  | than that        | of the joint |
|      | i = 0 i | = 1 |               |                  |              |
| P(I) | 0.7 0.3 |     | distribution  |                  |              |
no.of parameters=1
|     |         |     | The alternate | parameterization | is           |
| --- | ------- | --- | ------------- | ---------------- | ------------ |
|     |         |     | more compact  | than that        | of the joint |
|     | s=0 s=1 |     |               |                  |              |
distribution
| P(S|I = 0) | 0.95 0.05 |     |               |                  |     |
| ---------- | --------- | --- | ------------- | ---------------- | --- |
| P(S|I = 1) | 0.2 0.8   |     |               |                  |     |
|            |           |     | The alternate | parameterization | is  |
no.of parameters=2
|     |     |     | more modular. | (When | we added G, |
| --- | --- | --- | ------------- | ----- | ----------- |
wecouldjustreusethetablesforP(I)
|     | g=A g=B | g=C |     |     |     |
| --- | ------- | --- | --- | --- | --- |
and P(S|I))
| P(G—I=0) | 0.2 0.34  | 0.46 |     |     |     |
| -------- | --------- | ---- | --- | --- | --- |
| P(G—I=1) | 0.74 0.17 | 0.09 |     |     |     |
no.of parameters=4
| total no.of | parameters=7 |     |     |     |     |
| ----------- | ------------ | --- | --- | --- | --- |
34/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Module | 17.4: Can | we use | a graph | to represent | a joint |
| ------ | --------- | ------ | ------- | ------------ | ------- |
distribution?
35/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

|     |     |     |     | Suppose | we have | n random | variables, |
| --- | --- | --- | --- | ------- | ------- | -------- | ---------- |
C
allofwhichareindependentgivenan-
|     |     |     |     | other random | variable     | C          |     |
| --- | --- | --- | --- | ------------ | ------------ | ---------- | --- |
|     |     |     |     | The joint    | distribution | factorizes | as, |
. . .
| X X |     | X   | X   |       |          |           |     |
| --- | --- | --- | --- | ----- | -------- | --------- | --- |
| 1   | 2   | 3   | n   |       |          |           |     |
|     |     |     |     | P(C,X | ,...,X ) | = P(C)P(X | |C) |
|     |     |     |     | 1     | n        |           | 1   |
|     |     |     |     |       | P(X      | |X        | ,C) |
2 1
|                |     |       |             |     | P(X | |X  | ,X ,C)... |
| -------------- | --- | ----- | ----------- | --- | --- | --- | --------- |
| This is called | the | Naive | Bayes model |     |     | 3   | 2 1       |
n
| It makes | the Naive       | assumption | that    |     |     |        | (cid:89)  |
| -------- | --------------- | ---------- | ------- | --- | --- | ------ | --------- |
| nC       |                 |            |         |     |     | = P(C) | P(X i |C) |
| pairs    | are independent |            | given C |     |     |        |           |
2
i=1
|     |     |     |     | since X | ⊥ X |C |     |     |
| --- | --- | --- | --- | ------- | ------ | --- | --- |
i j
36/86
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | --- | -------------- | --------------------- | --------- | --- | --- |

|              |     |              | Bayesian | networks | build on | the intu- |
| ------------ | --- | ------------ | -------- | -------- | -------- | --------- |
| Intelligence |     | Intelligence |          |          |          |           |
itionsthatwedevelopedfortheNaive
| I   |     | I   |                      |                    |             |        |
| --- | --- | --- | -------------------- | ------------------ | ----------- | ------ |
|     |     |     | Bayes model          |                    |             |        |
|     |     |     | But they             | are not restricted | to          | strong |
| G   | G   | S   | (naive) independence |                    | assumptions |        |
Grade
|     |       |     | We use graphs | to  | represent | the joint |
| --- | ----- | --- | ------------- | --- | --------- | --------- |
|     | Grade | SAT |               |     |           |           |
distribution
|     | C     |     | Nodes: Random   |            | Variables |     |
| --- | ----- | --- | --------------- | ---------- | --------- | --- |
|     |       |     | Edges: Indicate | dependence |           |     |
| X   | X ... | X   |                 |            |           |     |
| 1   | 2     | n   |                 |            |           |     |
37/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     | Let’s revisit | the | student | example |     |
| --- | ------------- | --- | ------- | ------- | --- |
Difficulty Intelligence
|     | We will | introduce | a few | more | random |
| --- | ------- | --------- | ----- | ---- | ------ |
D I
|     | variables | and | independence |     | assump- |
| --- | --------- | --- | ------------ | --- | ------- |
tions
|     | The grade | now | depends | on  | student’s |
| --- | --------- | --- | ------- | --- | --------- |
Grade G S
|     | Intelligence | &   | exam’s | Difficulty | level |
| --- | ------------ | --- | ------ | ---------- | ----- |
SAT
|     | The SAT | score | depends | on  | Intelli- |
| --- | ------- | ----- | ------- | --- | -------- |
gence
Letter L
|     | The recommendation |            |         | Letter | from the |
| --- | ------------------ | ---------- | ------- | ------ | -------- |
|     | course             | instructor | depends |        | on the   |
Grade
38/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |     |
| -------------- | --------------------- | --------- | --- | --- | --- |

|     | The Bayesian | network | contains | a   |
| --- | ------------ | ------- | -------- | --- |
Difficulty Intelligence
|     | node for | each random | variable |     |
| --- | -------- | ----------- | -------- | --- |
D I
|     | The edges     | denote the | dependencies |     |
| --- | ------------- | ---------- | ------------ | --- |
|     | between       | the random | variables    |     |
|     | Each variable | depends    | directly on  | its |
Grade G S
|     | parents | in the network |     |     |
| --- | ------- | -------------- | --- | --- |
SAT
Letter L
39/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     | The Bayesian | network | can be viewed |     |
| --- | ------------ | ------- | ------------- | --- |
Difficulty Intelligence
|     | as a data | structure |     |     |
| --- | --------- | --------- | --- | --- |
D I
|     | It provides | a skeleton   | for represent- |     |
| --- | ----------- | ------------ | -------------- | --- |
|     | ing a joint | distribution | compactly      | by  |
factorization
Grade G S
|     | Let us | see what this | means |     |
| --- | ------ | ------------- | ----- | --- |
SAT
Letter L
40/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     | Each node   | is associated | with a local |
| --- | --- | --- | --- | ----------- | ------------- | ------------ |
|     |     | i0  | i1  | probability | model         |              |
0.7 0.3
|     | Difficulty |     |              | Local,                            | because it represents | the de- |
| --- | ---------- | --- | ------------ | --------------------------------- | --------------------- | ------- |
| d0  | d1 D       | I   | Intelligence | pendenciesofeachvariableonitspar- |                       |         |
| 0.6 | 0.4        |     |              |                                   |                       |         |
ents
|     |       |     |     | There | are 5 such local | probability |
| --- | ----- | --- | --- | ----- | ---------------- | ----------- |
| g1  | g2 g3 |     |     |       |                  |             |
i0,d0 0.3 0.4 0.3 G Grade S SAT models associated with the graph
| i0,d1 0.05 | 0.25 0.7  |     |           |               |               |             |
| ---------- | --------- | --- | --------- | ------------- | ------------- | ----------- |
| i1,d0      |           |     |           | Each variable | (in general)  | is associ-  |
| 0.9        | 0.08 0.02 |     |           |               |               |             |
| i1,d1 0.5  | 0.3 0.2   |     | s0 s1     |               |               |             |
|            |           |     |           | ated with     | a conditional | probability |
|            |           | i0  | 0.95 0.05 |               |               |             |
|            |           | i1  |           | distribution  | (conditional  | on its par- |
|            |           |     | 0.2 0.8   |               |               |             |
|            | Letter    | L   |           |               |               |             |
ents)
l0 l1
|     | g1 0.1 | 0.9 |     |     |     |     |
| --- | ------ | --- | --- | --- | --- | --- |
|     | g2 0.4 | 0.6 |     |     |     |     |
g3
0.99 0.01
41/86
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

|     |     |     |     |     |     | The graph | gives         | us a         | natural factor- |
| --- | --- | --- | --- | --- | --- | --------- | ------------- | ------------ | --------------- |
|     |     |     |     |     |     | ization   | for the joint | distribution |                 |
|     |     |     | i0  | i1  |     | In this   | case,         |              |                 |
|     |     |     | 0.7 | 0.3 |     |           |               |              |                 |
Difficulty
|     | d0 d1   |     |     |              |     | P(I,D,G,S,L) |     | =   | P(I)P(D) |
| --- | ------- | --- | --- | ------------ | --- | ------------ | --- | --- | -------- |
|     | D       |     | I   | Intelligence |     |              |     |     |          |
|     | 0.6 0.4 |     |     |              |     |              |     |     |          |
P(G|I,D)P(S|I)P(L|G)
|       | g1 g2 g3    |     |       |     |     |              |     |     |     |
| ----- | ----------- | --- | ----- | --- | --- | ------------ | --- | --- | --- |
|       |             | G   |       | S   |     | For example, |     |     |     |
| i0,d0 | 0.3 0.4 0.3 |     | Grade | SAT |     |              |     |     |     |
i0,d1
|       | 0.05 0.25 0.7 |     |     |       |     |           |       |       |            |
| ----- | ------------- | --- | --- | ----- | --- | --------- | ----- | ----- | ---------- |
| i1,d0 | 0.9 0.08 0.02 |     |     |       |     |           |       |       |            |
|       |               |     |     |       |     | P(I = 1,D | = 0,G | = B,S | = 1,L = 0) |
| i1,d1 | 0.5 0.3 0.2   |     |     | s0 s1 |     |           |       |       |            |
i0
|     |     |     |     | 0.95 0.05 |     |     | = 0.3×0.6×0.08×0.8×0.4 |     |     |
| --- | --- | --- | --- | --------- | --- | --- | ---------------------- | --- | --- |
|     |     |     | i1  | 0.2 0.8   |     |     |                        |     |     |
L
Letter
|     |     |     |     |     |     | The graph | structure |     | (nodes, edges) |
| --- | --- | --- | --- | --- | --- | --------- | --------- | --- | -------------- |
l0 l1
|     |     |     |     |     |     | along with | the conditional |     | probabil- |
| --- | --- | --- | --- | --- | --- | ---------- | --------------- | --- | --------- |
g1 0.1 0.9
g2
|     |     | 0.4 | 0.6 |     |     | ity distribution |     | is called | a Bayesian |
| --- | --- | --- | --- | --- | --- | ---------------- | --- | --------- | ---------- |
g3 0.99 0.01
Network
42/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

| Module | 17.5: Different | types | of reasoning | in a Bayesian |
| ------ | --------------- | ----- | ------------ | ------------- |
network
43/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

New Notations
| We will denote | P(I = 0) | by P(i0) |     |
| -------------- | -------- | -------- | --- |
In general, we will denote P(I = 0,D = 1,G = B,S = 1,L = 0) by
P(i0,d1,gb,s1,l0)
44/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | -------------- | --------------------- | --------- |

|     |     |     |     |         | Causal | Reasoning       |                 |            |
| --- | --- | --- | --- | ------- | ------ | --------------- | --------------- | ---------- |
|     |     |     |     |         |        | Here, we        | try to predict  | downstream |
|     |     |     |     |         |        | effects of      | various factors |            |
|     |     |     |     | i0 i1   |        |                 |                 |            |
|     |     |     |     | 0.7 0.3 |        | Let us consider | an example      |            |
Difficulty
|     | d0 d1   |     |     |                |     | What is   | the probability | that a stu-    |
| --- | ------- | --- | --- | -------------- | --- | --------- | --------------- | -------------- |
|     |         | D   |     | I Intelligence |     |           |                 |                |
|     | 0.6 0.4 |     |     |                |     |           |                 |                |
|     |         |     |     |                |     | dent will | get a good      | recommendation |
P(l1)?
letter,
|     | g1 g2 | g3  |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- |
|     |       |     | G   |     | S   |     |     |     |
i0,d0 0.3 0.4 0.3 Grade SAT (cid:88) (cid:88) (cid:88) (cid:88)
| i0,d1 |           |      |     |     | P(l1) |     |     | P(I,D,G,S,l1) |
| ----- | --------- | ---- | --- | --- | ----- | --- | --- | ------------- |
|       | 0.05 0.25 | 0.7  |     |     | =     |     |     |               |
| i1,d0 | 0.9 0.08  | 0.02 |     |     |       |     |     |               |
i1,d1 0.5 0.3 0.2 s0 s1 I(cid:15)(0,1)D(cid:15)(0,1)S(cid:15)(0,1)G(cid:15)(A,B,C)
i0
|     |     |     |     | 0.95   | 0.05 |     |     |     |
| --- | --- | --- | --- | ------ | ---- | --- | --- | --- |
|     |     |     |     | i1 0.2 | 0.8  |     |     |     |
L
Letter
|     |     |     | l0     | l1  |     |     |     |     |
| --- | --- | --- | ------ | --- | --- | --- | --- | --- |
|     |     |     | g1 0.1 | 0.9 |     |     |     |     |
g2
|     |     |     | 0.4     | 0.6  |     |     |     |     |
| --- | --- | --- | ------- | ---- | --- | --- | --- | --- |
|     |     |     | g3 0.99 | 0.01 |     |     |     |     |
45/86
|       | (cid:88) |               |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |
| ----- | -------- | ------------- | --- | -------------- | --------------------- | --- | --------- | --- |
| P(l1) |          | P(I,D,G,S,l1) |     |                |                       |     |           |     |
=
I,D,G,S
|     | (cid:88) | (cid:88) | (cid:88) | (cid:88) P(I,D,G,S,l1) |     |     |     |     |
| --- | -------- | -------- | -------- | ---------------------- | --- | --- | --- | --- |
=
I(cid:15)(0,1)D(cid:15)(0,1)G(cid:15)(A,B,C)S(cid:15)(0,1)
|     | = 50.2% |     |     |     |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- | --- | --- |

| (cid:88) | (cid:88) | (cid:88) | (cid:88) |               |     |     |     |
| -------- | -------- | -------- | -------- | ------------- | --- | --- | --- |
| P(l1)    |          |          |          | P(I,D,G,S,l1) |     |     |     |
=
I(cid:15)(0,1)D(cid:15)(0,1)S(cid:15)(0,1)G(cid:15)(A,B,C)
| (cid:88)       | (cid:88)       |        |          | (cid:88)       |     | (cid:88)         |                          |
| -------------- | -------------- | ------ | -------- | -------------- | --- | ---------------- | ------------------------ |
| = P(I)         |                | P(D|I) |          | P(S|I,D)       |     |                  | P(G|I,D,S).P(l1|G,I,D,S) |
| I(cid:15)(0,1) | D(cid:15)(0,1) |        |          | S(cid:15)(0,1) |     | G(cid:15)(A,B,C) |                          |
| (cid:88)       | (cid:88)       |        | (cid:88) |                |     | (cid:88)         |                          |
P(G|I,D).P(l1|G)
| = P(I)         |                | P(D) |                | P(S|I) |                  |     |     |
| -------------- | -------------- | ---- | -------------- | ------ | ---------------- | --- | --- |
| I(cid:15)(0,1) | D(cid:15)(0,1) |      | S(cid:15)(0,1) |        | G(cid:15)(A,B,C) |     |     |
| D              | I              |      |                |        |                  |     |     |
G S
L
46/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- |

|        | (cid:88) (cid:88)             |      | (cid:88)       | (cid:88)         |                 |     |
| ------ | ----------------------------- | ---- | -------------- | ---------------- | --------------- | --- |
| P(l1)= | P(I)                          | P(D) | P(S|I)         |                  | P(G|I,D)P(l1|G) |     |
|        | I(cid:15)(0,1) D(cid:15)(0,1) |      | S(cid:15)(0,1) | G(cid:15)(A,B,C) |                 |     |
|        | (cid:88) (cid:88)             |      | (cid:88)       |                  |                 |     |
= P(I) P(D) P(S|I)0.9(P(g1|I,D))+0.6(P(g2|I,D))+0.01(P(g3|I,D))
|     | I(cid:15)(0,1) D(cid:15)(0,1) |     | S(cid:15)(0,1) |     |     |     |
| --- | ----------------------------- | --- | -------------- | --- | --- | --- |
Similarly using the other tables, we can evaluate this equation
P(l1)=0.502
g1 g2 g3
|     | D I |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
l0 l1
i0,d0 0.3 0.4 0.3
g1
0.1 0.9
i0,d1 0.05 0.25 0.7
|     | G   | S   | g2  |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
0.4 0.6
i1,d0 0.9 0.08 0.02
|     |     |     | g3  | 0.99 | 0.01 |     |
| --- | --- | --- | --- | ---- | ---- | --- |
i1,d1
0.5 0.3 0.2
L
47/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |
| --- | --- | --- | -------------- | --- | --------------------- | --------- |

|     |     |     |     |     | Causal Reasoning |             |                |     |
| --- | --- | --- | --- | --- | ---------------- | ----------- | -------------- | --- |
|     |     |     |     |     | Now what         | if we start | adding inform- |     |
|     |     |     |     |     | ation about      | the factors | that could     | in- |
i0 i1
|     |     |     |     |     | fluence | l1  |     |     |
| --- | --- | --- | --- | --- | ------- | --- | --- | --- |
0.7 0.3
Difficulty
|       | d0 d1   |     |       |              | Whatifsomeonerevealsthatthestu- |                  |           |     |
| ----- | ------- | --- | ----- | ------------ | ------------------------------- | ---------------- | --------- | --- |
|       |         | D   | I     | Intelligence |                                 |                  |           |     |
|       | 0.6 0.4 |     |       |              | dent is                         | not intelligent? |           |     |
|       |         |     |       |              | Intelligence                    | will affect      | the score | and |
|       | g1 g2   | g3  |       |              | hence the                       | grade            |           |     |
|       |         |     | G     | S            |                                 |                  |           |     |
| i0,d0 | 0.3 0.4 | 0.3 | Grade | SAT          |                                 |                  |           |     |
i0,d1
|       | 0.05 0.25 | 0.7  |     |       |     |     |     |     |
| ----- | --------- | ---- | --- | ----- | --- | --- | --- | --- |
| i1,d0 | 0.9 0.08  | 0.02 |     |       |     |     |     |     |
| i1,d1 | 0.5 0.3   | 0.2  |     | s0 s1 |     |     |     |     |
i0
|     |     |     |     | 0.95 0.05 |     |     |     |     |
| --- | --- | --- | --- | --------- | --- | --- | --- | --- |
|     |     |     | i1  | 0.2 0.8   |     |     |     |     |
L
Letter
|     |     | l0     | l1  |     |     |     |     |     |
| --- | --- | ------ | --- | --- | --- | --- | --- | --- |
|     |     | g1 0.1 | 0.9 |     |     |     |     |     |
g2
|     |     | 0.4     | 0.6  |     |     |     |     |     |
| --- | --- | ------- | ---- | --- | --- | --- | --- | --- |
|     |     | g3 0.99 | 0.01 |     |     |     |     |     |
48/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- |

P(l1,i0)
P(l1|i0)=
P(i0)
| P(l1,i0)= | (cid:88) | (cid:88) | (cid:88) | P(i0,D,G,S,l1) |     |     |
| --------- | -------- | -------- | -------- | -------------- | --- | --- |
D∈{0,1}S∈{0,1}G∈{A,B,C}
|     | (cid:88) | (cid:88) |         | (cid:88)  |                  |     |
| --- | -------- | -------- | ------- | --------- | ---------------- | --- |
|     | = P(D)   |          | P(S|i0) |           | P(G|D,i0)P(l1|G) |     |
|     | D∈{0,1}  | S∈{0,1}  |         | G∈{A,B,C} |                  |     |
(cid:88) (cid:88) P(S|i0) (cid:88) 0.9P(g1|D,i0)+0.6P(g2|D,i0)+0.01P(g3|D,i0)
|     | = P(D)  |         |     |           |     |     |
| --- | ------- | ------- | --- | --------- | --- | --- |
|     | D∈{0,1} | S∈{0,1} |     | G∈{A,B,C} |     |     |
P(l1|i0)=0.389
g1 g2 g3
|     | D I |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | l0  | l1  |     |
i0,d0 0.3 0.4 0.3
g1
|     |     |     |     | 0.1 | 0.9 |     |
| --- | --- | --- | --- | --- | --- | --- |
i0,d1 0.05 0.25 0.7
|     | G   | S   |     | g2  |     |     |
| --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 0.4 | 0.6 |     |
i1,d0 0.9 0.08 0.02
|     |     |     |     | g3 0.99 | 0.01 |     |
| --- | --- | --- | --- | ------- | ---- | --- |
i1,d1
0.5 0.3 0.2
L
49/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |
| --- | --- | --- | -------------- | --- | --------------------- | --------- |

|     |     |     |     |     |     | Causal | Reasoning                     |                |             |       |
| --- | --- | --- | --- | --- | --- | ------ | ----------------------------- | -------------- | ----------- | ----- |
|     |     |     |     |     |     |        | What                          | if the course  | was easy?   |       |
|     |     |     |     |     |     |        | A not                         | so intelligent | student may | still |
|     |     |     | i0  | i1  |     |        |                               |                |             |       |
|     |     |     | 0.7 | 0.3 |     |        | beabletogetagoodgradeandhence |                |             |       |
Difficulty
|           | d0 d1   |     |       |              |             |     | a good | letter                         |                 |     |
| --------- | ------- | --- | ----- | ------------ | ----------- | --- | ------ | ------------------------------ | --------------- | --- |
|           | D       |     | I     | Intelligence |             |     |        |                                |                 |     |
| 0.6       | 0.4     |     |       |              |             |     |        |                                |                 |     |
|           |         |     |       |              |             |     |        | (cid:88)                       | (cid:88)        |     |
|           |         |     |       |              | P(l1|i0,d0) |     | =      |                                | P(i0,d0,G,S,l1) |     |
| g1        | g2 g3   |     |       |              |             |     |        |                                |                 |     |
|           |         | G   |       | S            |             |     |        | G(cid:15)(A,B,C)S(cid:15)(0,1) |                 |     |
| i0,d0 0.3 | 0.4 0.3 |     | Grade |              | SAT         |     |        |                                |                 |     |
i0,d1
| 0.05      | 0.25 0.7  |     |     |     |     |             |     |         |             |     |
| --------- | --------- | --- | --- | --- | --- | ----------- | --- | ------- | ----------- | --- |
| i1,d0 0.9 | 0.08 0.02 |     |     |     |     | P(l1|i0,d1) |     | = 0.513 | (increases) |     |
| i1,d1 0.5 | 0.3 0.2   |     |     | s0  | s1  |             |     |         |             |     |
i0
|     |     |     |     | 0.95 | 0.05 |     |     |     |     |     |
| --- | --- | --- | --- | ---- | ---- | --- | --- | --- | --- | --- |
|     |     |     | i1  | 0.2  | 0.8  |     |     |     |     |     |
L
Letter
l0 l1
|     | g1  | 0.1 | 0.9 |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
g2
0.4 0.6
|     | g3  | 0.99 | 0.01 |     |     |     |     |     |     |     |
| --- | --- | ---- | ---- | --- | --- | --- | --- | --- | --- | --- |
50/86
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     |     | Evidential                      | Reasoning |     |     |     |
| --- | --- | --- | --- | --- | ------------------------------- | --------- | --- | --- | --- |
|     |     |     | i0  | i1  | Here,wereasonaboutcausesbylook- |           |     |     |     |
0.7 0.3
|           |       | Difficulty |       |              | ing                              | at their     | effects         |        |        |
| --------- | ----- | ---------- | ----- | ------------ | -------------------------------- | ------------ | --------------- | ------ | ------ |
|           | d0 d1 |            |       |              |                                  |              |                 |        |        |
|           |       | D          | I     | Intelligence | Whatistheprobabilityofthestudent |              |                 |        |        |
| 0.6       | 0.4   |            |       |              |                                  |              |                 |        |        |
|           |       |            |       |              | being                            | intelligent? |                 |        |        |
|           |       |            |       |              | What                             | is           | the probability | of the | course |
| g1        | g2    | g3         |       |              |                                  |              |                 |        |        |
|           |       |            | G     | S            |                                  |              |                 |        |        |
| i0,d0 0.3 | 0.4   | 0.3        | Grade | SAT          | being                            | difficult?   |                 |        |        |
i0,d1
| 0.05      | 0.25 | 0.7  |     |           |         |      |             |         |       |
| --------- | ---- | ---- | --- | --------- | ------- | ---- | ----------- | ------- | ----- |
| i1,d0 0.9 | 0.08 | 0.02 |     |           | Now     | let  | us see what | happens | if we |
| i1,d1 0.5 | 0.3  | 0.2  |     | s0 s1     |         |      |             |         |       |
|           |      |      | i0  |           | observe | some | effects     |         |       |
|           |      |      |     | 0.95 0.05 |         |      |             |         |       |
|           |      |      | i1  | 0.2 0.8   |         |      |             |         |       |
L
Letter
P(i1)
=?
|     |     | l0     | l1  |     |     |     |             |     |     |
| --- | --- | ------ | --- | --- | --- | --- | ----------- | --- | --- |
|     |     |        |     |     |     |     | P(i1) = 0.3 |     |     |
|     |     | g1 0.1 | 0.9 |     |     |     |             |     |     |
2
|     |     | g 0     | . 4 0 . 6   |     |     |     | P(d1)       |     |     |
| --- | --- | ------- | ----------- | --- | --- | --- | ----------- | --- | --- |
|     |     | g 3 0 . | 9 9 0 . 0 1 |     |     |     | =?          |     |     |
|     |     |         |             |     |     |     | P(d1) = 0.4 |     |     |
51/86
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

P(i1)=0.3
|     |     |     | Evidential | Reasoning |     |     |     |
| --- | --- | --- | ---------- | --------- | --- | --- | --- |
P(d1)=0.4
Whatifsomeonetellsusthatthestu-
P(i1|g3)=0.079(drops)
|     |     |     | dent secured | C   | grade? |     |     |
| --- | --- | --- | ------------ | --- | ------ | --- | --- |
P(d1|g3)=0.629(increases)
|     |     |     | What if | instead | of  | getting to | know |
| --- | --- | --- | ------- | ------- | --- | ---------- | ---- |
P(i1|l0)=0.14(drops)
|                   |                         |     | the grade, | we                 | get to          | know that      | the  |
| ----------------- | ----------------------- | --- | ---------- | ------------------ | --------------- | -------------- | ---- |
| P(l1|l0,g3)=0.079 |                         |     | student    | got a              | poor            | recommendation |      |
| (same             | as P(i1|g3))            |     | letter?    |                    |                 |                |      |
|                   | Difficulty Intelligence |     | What if    | we know            | about           | the grade      | as   |
|                   | D I                     |     | well as    | the recommendation |                 | letter?        |      |
|                   |                         |     | The last   | case               | is interesting! | (We            | will |
|                   | G                       | S   | return to  | it later)          |                 |                |      |
Grade
SAT
|     | Letter L |     |     |     |     |     |     |
| --- | -------- | --- | --- | --- | --- | --- | --- |
52/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| P(i1) | = 0.3 |     |            |      |     |     |
| ----- | ----- | --- | ---------- | ---- | --- | --- |
|       |       |     | Explaining | Away |     |     |
P(i1|g3)
|             | = 0.079(drops)          |     | Here, we         | see how different   |          | causes of |
| ----------- | ----------------------- | --- | ---------------- | ------------------- | -------- | --------- |
| P(i1|g3,d1) | = 0.11(improves)        |     | the same         | effect can interact |          |           |
|             |                         |     | We already       | saw how             | knowing  | the       |
|             |                         |     | grade influences | our                 | estimate | of in-    |
|             | Difficulty Intelligence |     |                  |                     |          |           |
telligence
|     | D I |     |         |              |            |     |
| --- | --- | --- | ------- | ------------ | ---------- | --- |
|     |     |     | What if | we were told | the course | was |
difficult?
|     | Grade G | S   |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- |
Ourbeliefinthestudent’sintelligence
SAT
improves
|     | L   |     | Why? | Let us see |     |     |
| --- | --- | --- | ---- | ---------- | --- | --- |
Letter
53/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

| P(i1) | = 0.3 |     |            |      |     |     |
| ----- | ----- | --- | ---------- | ---- | --- | --- |
|       |       |     | Explaining | Away |     |     |
P(i1|g3)
|             | = 0.079 |      | Knowing    | that the course | was difficult |     |
| ----------- | ------- | ---- | ---------- | --------------- | ------------- | --- |
| P(i1|g3,d1) | =       | 0.11 | explains   | away the bad    | grade         |     |
| P(i1|g2)    |         |      | “Oh! Maybe | the course      | was just      | too |
= 0.175
|             |     |      | difficult | and the student | might | have |
| ----------- | --- | ---- | --------- | --------------- | ----- | ---- |
| P(i1|g2,d1) | =   | 0.34 |           |                 |       |      |
receivedabadgradedespitebeingin-
| Difficulty | Intelligence |     |     |     |     |     |
| ---------- | ------------ | --- | --- | --- | --- | --- |
telligent!”
| D     | I   |     |                |              |              |     |
| ----- | --- | --- | -------------- | ------------ | ------------ | --- |
|       |     |     | The explaining | away         | effect could | be  |
|       |     |     | even more      | dramatic     |              |     |
|       | G   | S   |                |              |              |     |
| Grade |     |     | Let us         | consider the | case when    | the |
|       |     | SAT | grade was      | B            |              |     |
Letter L
54/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

| P(d1) | = 0.40 |     |            |      |     |     |
| ----- | ------ | --- | ---------- | ---- | --- | --- |
|       |        |     | Explaining | Away |     |     |
P(d1|g3)
|             | = 0.629      |      | Suppose     | we know      | that the student |     |
| ----------- | ------------ | ---- | ----------- | ------------ | ---------------- | --- |
| P(d1|s1,g3) | =            | 0.76 | had a high  | SAT Score,   | what happens     |     |
|             |              |      | to our      | belief about | the difficulty   | of  |
| Difficulty  | Intelligence |      |             |              |                  |     |
|             |              |      | the course? |              |                  |     |
| D           | I            |      |             |              |                  |     |
KnowingthattheSATscorewashigh
|       |     |     | tells us      | that the student | seems          | intel- |
| ----- | --- | --- | ------------- | ---------------- | -------------- | ------ |
|       | G   | S   |               |                  |                |        |
| Grade |     |     | ligent and    | perhaps          | the reason why | he     |
|       |     | SAT | scored        | a poor grade     | is that the    | course |
|       |     |     | was difficult |                  |                |        |
Letter L
55/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

| Module  | 17.6: Independencies |             | encoded      | by a Bayesian |
| ------- | -------------------- | ----------- | ------------ | ------------- |
| network | (Case                | 1: Node and | its parents) |               |
56/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

Why do we care about independencies encoded in a Bayesian network?
We saw that if two variables are independent then the chain rule gets
simplified, resulting in simpler factors which in turn reduces the number of
parameters.
In the extreme case, we say that in the Bayesian network model, each factor
was very simple (just P(X |Y) and as a result each factor just added 3
i
parameters
The more the number of independencies, the fewer the parameters and the
lesser is the inference time
For example, if we want to the compute the marginal P(S) then we just need
to sum over the values of I and not on any other variables
Hence we are interested in finding the independencies encoded in a Bayesian
network
57/86
MiteshM.Khapra CS7015(DeepLearning): Lecture17

In general, given n random variables, we are interested in knowing if
X ⊥ X
i j
| X ⊥ X | |Z, where | Z ⊆ X ,X ,...,X | /X ,X |     |
| ----- | --------- | --------------- | ----- | --- |
| i j   |           | 1 2             | n i j |     |
Let us answer some of the questions for our student Bayesian Network
58/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

|     | To understand | this | let us return | to  |
| --- | ------------- | ---- | ------------- | --- |
D I
|     | our student | example    |                  |        |
| --- | ----------- | ---------- | ---------------- | ------ |
|     | First,      | let us see | some independen- |        |
|     | cies which  | clearly    | do not exist     | in the |
G S
graph
|     | Is L ⊥ | G? (No, by | construction) |     |
| --- | ------ | ---------- | ------------- | --- |
|     | Is G ⊥ | D? (No, by | construction) |     |
L
|     | Is G ⊥ | I? (No, by | construction) |     |
| --- | ------ | ---------- | ------------- | --- |
|     | Is S ⊥ | I? (No, by | construction) |     |
Rule?
|     | Rule: | A node is | not independent | of  |
| --- | ----- | --------- | --------------- | --- |
its parents
59/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     |     |     | Let us                   | focus       | on G    | and L.          |              |      |
| --- | --- | --- | --- | ------------------------ | ----------- | ------- | --------------- | ------------ | ---- |
| D   | I   |     |     |                          |             |         |                 |              |      |
|     |     |     |     | We already               | know        | that    | G               | (cid:54)⊥ L. |      |
|     |     |     |     | WhatifweknowthevalueofI? |             |         |                 |              | Does |
|     |     |     |     | G become                 | independent |         | of              | L?           |      |
|     | G   | S   |     |                          |             |         |                 |              |      |
|     |     |     |     | No (intuitively,         |             | the     | student         | may          | be   |
|     |     |     |     | intelligent              | or          | not but | ultimately,     |              | the  |
|     |     |     |     | letter depends           |             | on      | the performance |              | in   |
the course.)
L
|     |     |     |     | If we know |             | the value | of    | D, does | G   |
| --- | --- | --- | --- | ---------- | ----------- | --------- | ----- | ------- | --- |
|     |     |     |     | become     | independent |           | of L. |         |     |
No,theinstructorisnotgoingtolook
|        |               |           |     | No (intuitively, |      | the | course     | may | be    |
| ------ | ------------- | --------- | --- | ---------------- | ---- | --- | ---------- | --- | ----- |
| at the | SAT score but | the grade |     |                  |      |     |            |     |       |
|        |               |           |     | easy or          | hard | but | the letter |     | would |
Rule?
|     |     |     |     | depend | on the | performance |     | in  | the |
| --- | --- | --- | --- | ------ | ------ | ----------- | --- | --- | --- |
course)
| Rule:       | A node is not      | independent | of    |                          |             |     |     |     |      |
| ----------- | ------------------ | ----------- | ----- | ------------------------ | ----------- | --- | --- | --- | ---- |
| its parents | even when          | we are      | given |                          |             |     |     |     |      |
|             |                    |             |       | WhatifweknowthevalueofS? |             |     |     |     | Does |
| the values  | of other variables |             |       | G become                 | independent |     | of  | L?  |      |
60/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture17 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | The same  | argument  | can be made |
| --- | --- | --- | --- | --------- | --------- | ----------- |
| D   | I   |     |     |           |           |             |
|     |     |     |     | about the | following | pairs       |
G (cid:54)⊥ D(evenwhenothervariablesare
given)
|     | G   | S   |     |                     |            |               |
| --- | --- | --- | --- | ------------------- | ---------- | ------------- |
|     |     |     |     | G (cid:54)⊥ I (even | when other | variables are |
given)
|     |     |     |     | S (cid:54)⊥ I (even | when other | variables are |
| --- | --- | --- | --- | ------------------- | ---------- | ------------- |
L
given)
Rule?
| Rule: A     | node is not        | independent | of    |     |     |     |
| ----------- | ------------------ | ----------- | ----- | --- | --- | --- |
| its parents | even when          | we are      | given |     |     |     |
| the values  | of other variables |             |       |     |     |     |
61/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

| Module  | 17.7: Independencies |             | encoded          | by a Bayesian |
| ------- | -------------------- | ----------- | ---------------- | ------------- |
| network | (Case                | 2: Node and | its non-parents) |               |
62/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

Nowlet’slookattherelationbetween
D I
|     |     | a node and    | its non-parent | nodes             |
| --- | --- | ------------- | -------------- | ----------------- |
|     |     | Is L ⊥ S?     |                |                   |
|     |     | No, knowing   | the SAT        | score tells us    |
| G   | S   |               |                |                   |
|     |     | about I       | which in turn  | tells us some-    |
|     |     | thing about   | G and hence    | L                 |
|     |     |               | P(l1|s1)       | P(l1|s0)          |
| L   |     | Hence we      | expect         | >                 |
|     |     | Similarly     | we can argue   | L (cid:54)⊥ D and |
|     |     | L (cid:54)⊥ I |                |                   |
63/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     | But what | if we know | the value of G? |
| --- | -------- | ---------- | --------------- |
D I
|     | Is (L ⊥ S)|G?      |                  |            |
| --- | ------------------ | ---------------- | ---------- |
|     | Yes, the           | grade completely | determines |
|     | the recommendation | letter           |            |
G S
|     | Once we  | know the grade, | other vari- |
| --- | -------- | --------------- | ----------- |
|     | ables do | not add any     | information |
|     | Hence (L | ⊥ S)|G          |             |
L
|     | Similarlywecanargue(L |     | ⊥ I)|Gand |
| --- | --------------------- | --- | --------- |
|     | (L ⊥ D)|G             |     |           |
64/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| -------------- | --------------------- | --------- | --- |

|     | But, wait | a minute! |     |     |
| --- | --------- | --------- | --- | --- |
D I
|     | The instructor | may          | also want to | look   |
| --- | -------------- | ------------ | ------------ | ------ |
|     | at the         | SAT score in | addition     | to the |
grade
G S
|     | Well, we | “assumed”    | that the      | in- |
| --- | -------- | ------------ | ------------- | --- |
|     | structor | only relies  | on the grade. |     |
|     | That was | our “belief” | of how        | the |
L
|     | world works |         |             |     |
| --- | ----------- | ------- | ----------- | --- |
|     | And hence   | we drew | the network | ac- |
cordingly
65/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Of course | we are free | to change | our |
| --- | --- | --- | --------- | ----------- | --------- | --- |
assumptions
|     |     |     | We may   | want to assume | that           | the in-  |
| --- | --- | --- | -------- | -------------- | -------------- | -------- |
| D   |     | I   | structor | also looks     | at the SAT     | score    |
|     |     |     | But if   | that is the    | case we have   | to       |
|     |     |     | change   | the network    | to reflect     | this de- |
| C   | G   | S   | pendence |                |                |          |
|     |     |     | Why just | SAT score?     | The instructor |          |
mayevenconsultoneofhiscolleagues
L
|     |     |     | and seek | his/her opinion |     |     |
| --- | --- | --- | -------- | --------------- | --- | --- |
66/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     |     |     | Remember:       |                 | The graph | is a reflec- |
| --- | --- | --- | --------------- | --------------- | --------- | ------------ |
|     |     |     | tion of         | our assumptions |           | about how    |
|     |     |     | the world       | works           |           |              |
| D   |     | I   | Our assumptions |                 | about     | dependencies |
|     |     |     | are encoded     | in              | the graph |              |
|     |     |     | Once we         | build           | the graph | we freeze it |
| C   | G   | S   |                 |                 |           |              |
|     |     |     | and do          | all the         | reasoning | and analysis |
|     |     |     | (independence)  |                 | on this   | graph        |
L
|     |     |     | It is not       | fair  | to ask | “what if” ques-  |
| --- | --- | --- | --------------- | ----- | ------ | ---------------- |
|     |     |     | tions involving |       | other  | factors          |
|     |     |     | (For example,   |       | what   | if the professor |
|     |     |     | was in          | a bad | mood?) |                  |
67/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     |     | If we believe | Graph       | (a) is how the |
| --- | --- | ------------- | ----------- | -------------- |
| D I | D I | world works   | then (L     | ⊥ S)|G         |
|     |     | If we believe | Graph(b)    | is how the     |
| G S | G S |               |             |                |
|     |     | world works   | then (L     | (cid:54)⊥ S)|G |
|     |     | We will stick | to Graph(a) | for the        |
| L   | L   |               |             |                |
discussion
| (a) | (b) |     |     |     |
| --- | --- | --- | --- | --- |
68/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

Let’s return back to our discussion of finding independence relations in the
graph
So far we have seen three cases as summarized in the next module
69/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| -------------- | --------------------- | --------- |

| Module  | 17.8: Independencies |             | encoded          | by a Bayesian |
| ------- | -------------------- | ----------- | ---------------- | ------------- |
| network | (Case                | 3: Node and | its descendants) |               |
70/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

|     | (G (cid:54)⊥ D) | (G (cid:54)⊥ I) (S | (cid:54)⊥ I) (L (cid:54)⊥ | G)   |
| --- | --------------- | ------------------ | ------------------------- | ---- |
|     | A node          | is not independent | of its                    | par- |
ents
|     | (G (cid:54)⊥ D,I)|S,L |     |     |     |
| --- | --------------------- | --- | --- | --- |
D I
|     | (S (cid:54)⊥ I)|D,G,L |                    |        |      |
| --- | --------------------- | ------------------ | ------ | ---- |
|     | (L (cid:54)⊥ G)|D,I,S |                    |        |      |
|     | A node                | is not independent | of its | par- |
G S
|     | ents even | when other | variables | are |
| --- | --------- | ---------- | --------- | --- |
given
|     | (S ⊥ G)|I? |     |     |     |
| --- | ---------- | --- | --- | --- |
L
|     | (L ⊥ D,I,S)|G?  |             |             |     |
| --- | --------------- | ----------- | ----------- | --- |
|     | (G ⊥ L)|D,I?    |             |             |     |
|     | A node          | seems to be | independent | of  |
|     | other variables | given       | its parents |     |
71/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

|     |     | Let us         | inspect    | this last | rule     |        |
| --- | --- | -------------- | ---------- | --------- | -------- | ------ |
|     |     | Is (G ⊥        | L)|D,I?    |           |          |        |
| D   | I   | Ifyouknowthatd |            | =         | 0andi =  | 1then  |
|     |     | you would      | expect     | the       | student  | to get |
|     |     | a good         | grade      |           |          |        |
| G   | S   |                |            |           |          |        |
|     |     | But now        | if someone | tells     | you that | the    |
|     |     | student        | got a poor | letter,   | your     | belief |
|     |     | will change    |            |           |          |        |
L
|     |     | So (G | (cid:54)⊥ L)|D,I |     |     |     |
| --- | --- | ----- | ---------------- | --- | --- | --- |
Theeffect(letter)actuallygivesusin-
|     |     | formation | about | the | cause (grade) |     |
| --- | --- | --------- | ----- | --- | ------------- | --- |
72/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- | --- |

|     | (G (cid:54)⊥ D) | (G (cid:54)⊥ I) (S | (cid:54)⊥ I) (L (cid:54)⊥ | G)   |
| --- | --------------- | ------------------ | ------------------------- | ---- |
|     | A node          | is not independent | of its                    | par- |
ents
|     | (G (cid:54)⊥ D,I)|S,L |     |     |     |
| --- | --------------------- | --- | --- | --- |
|     | (S (cid:54)⊥ I)|D,G,L |     |     |     |
D I
|     | (L (cid:54)⊥ G)|D,I,S |                    |           |      |
| --- | --------------------- | ------------------ | --------- | ---- |
|     | A node                | is not independent | of its    | par- |
|     | ents even             | when other         | variables | are  |
G S
given
|     | (S ⊥ G)|I     |     |     |     |
| --- | ------------- | --- | --- | --- |
|     | (L ⊥ D,I,S)|G |     |     |     |
L
|     | (G (cid:54)⊥ L)|D,I |                 |               |     |
| --- | ------------------- | --------------- | ------------- | --- |
|     | Given               | its parents,    | a node        | is  |
|     | independent         | of              | all variables |     |
|     | except              | its descendants |               |     |
73/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| Module | 17.9: Bayesian | Networks: | Formal | Semantics |
| ------ | -------------- | --------- | ------ | --------- |
74/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

We are now ready to formally define the semantics of a Bayesian Network
Bayesian Network Semantics:
A Bayesian Network structure G is a directed acyclic graph where nodes represent
random variables X ,X ,...,X . Let PG denote the parents of X in G and
| 1 2 | n aXi |     | i   |
| --- | ----- | --- | --- |
NonDescendants(X ) denote the variables in the graph that are not descendants of
i
X i . Then G encodes the following set of conditional independence assumptions
called the local independencies and denoted by I (G) for each variable X .
i i
| (X ⊥ NonDescendants(X | )|PG ) |     |     |
| --------------------- | ------ | --- | --- |
| i i                   | aXi    |     |     |
75/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | -------------- | --------------------- | --------- |

We will see some more formal definitions and then return to the question of
independencies.
76/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| -------------- | --------------------- | --------- |

| Module | 17.10: | I Maps |     |     |
| ------ | ------ | ------ | --- | --- |
77/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | Let          | P be a | joint distribution |         | over      |
| --- | --- | --- | ------------ | ------ | ------------------ | ------- | --------- |
|     |     |     | X =          | X ,X   | ,...,X             |         |           |
|     |     |     |              | 1      | 2                  | n       |           |
|     |     |     | We           | define | I(P) as            | the set | of        |
| D   | I   |     | independence |        | assumptions        |         | that hold |
in P.
|     |     |     | For         | Example: |                 |                 |         |
| --- | --- | --- | ----------- | -------- | --------------- | --------------- | ------- |
|     | G   | S   | I(P)        | = {(G    | ⊥ S|I,D),.....} |                 |         |
|     |     |     | Each        | element  | of this         | set is          | of the  |
|     |     |     | form        | X ⊥      | X |Z,Z          | ⊆ X|X           | ,X      |
|     | L   |     |             | i        | j               |                 | i j     |
|     |     |     | Let         | I(G) be  | the set         | of independence |         |
|     |     |     | assumptions |          | associated      | with            | a graph |
G.
78/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     | We say           | that G is an    | I-map for P if |
| --- | --- | ---------------- | --------------- | -------------- |
|     |     | I(G) ⊆           | I(P)            |                |
|     |     | G does           | not mislead     | us about       |
| D   | I   | independencies   | in P            |                |
|     |     | Any independence |                 | that G states  |
|     |     | must hold        | in P            |                |
| G   | S   |                  |                 |                |
|     |     | But P can        | have additional |                |
independencies.
L
79/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     |     | Consider | this joint | distribution over |
| --- | --- | -------- | ---------- | ----------------- |
X,Y
X Y P(X,Y)
| 0 0 0.08 |     |           |              |             |
| -------- | --- | --------- | ------------ | ----------- |
|          |     | We need   | to find a G  | which is an |
| 0 1 0.32 |     |           |              |             |
|          |     | I-map for | this P       |             |
| 1 0 0.12 |     |           |              |             |
| 1 1 0.48 |     | How do    | we find such | a G?        |
80/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     | Well since | there are only     | 2 variables |
| --- | ---------- | ------------------ | ----------- |
|     | here the   | only possibilities | are         |
X Y P(X,Y)
|     | I(P) = | {(X ⊥ Y)} or | I(P) = Φ |
| --- | ------ | ------------ | -------- |
0 0 0.08
0 1 0.32
|     | From the | table we can | easily check |
| --- | -------- | ------------ | ------------ |
1 0 0.12
|     | P(X,Y) | = P(X).P(Y) |     |
| --- | ------ | ----------- | --- |
1 1 0.48
|     | I(P) =          | {(X ⊥ Y)}   |          |
| --- | --------------- | ----------- | -------- |
|     | Now can         | you come up | with a G |
|     | which satisfies | I(G) ⊆      | I(P)?    |
81/86
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| -------------- | --------------------- | --------- | --- |

|        |         |           |      | Since we         | have only two        | variables |
| ------ | ------- | --------- | ---- | ---------------- | -------------------- | --------- |
|        |         |           |      | there are        | only 3 possibilities | for G     |
| X      | Y       | X         |      |                  |                      |           |
|        |         |           |      | Which of         | these is an I-Map    | for P?    |
|        |         |           |      | Well all three   | are I-Maps           | for P     |
|        |         |           |      | They all satisfy | the condition        |           |
| Y      | X       | Y         |      |                  |                      |           |
|        |         |           |      | I(G) ⊆ I(P)      |                      |           |
| I(G)=Φ | I(G )=Φ | I(G )={(X | ⊥Y)} |                  |                      |           |
|        | 2       | 3         |      |                  |                      |           |
82/86
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture17 |     |
| --- | --- | -------------- | --- | --------------------- | --------- | --- |

X Y P(X,Y)
| 0 0 0.08 |     |            |          |            |
| -------- | --- | ---------- | -------- | ---------- |
|          |     | Of course, | this was | just a toy |
| 0 1 0.32 |     |            |          |            |
example
| 1 0 0.12 |     |              |             |                |
| -------- | --- | ------------ | ----------- | -------------- |
| 1 1 0.48 |     | In practice, | we do       | not know P and |
|          |     | hence can’t  | compute     | I(P)           |
|          |     | We just      | make some   | assumptions    |
|          |     | about I(P)   | and then    | construct a G  |
|          |     | such that    | I(G) ⊆ I(P) |                |
83/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

|     |     | So why       | do we care about | I-Map?            |
| --- | --- | ------------ | ---------------- | ----------------- |
|     |     | If G is      | an I-Map for     | a joint           |
|     |     | distribution | P then           | P factorizes over |
| D   | I   | G            |                  |                   |
|     |     | What does    | that mean?       |                   |
| G   | S   |              |                  |                   |
|     |     | Well, it     | just means       | that P can be     |
|     |     | written      | as a product     | of factors where  |
|     |     | each factor  | is a c.p.d       | associated with   |
L
|     |     | the nodes | of G |     |
| --- | --- | --------- | ---- | --- |
84/86
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |     |
| --- | -------------- | --------------------- | --------- | --- |

| Theorem |     |     | Theorem |     |
| ------- | --- | --- | ------- | --- |
Let G be a BN structure over a set of Let G be a BN structure over a set of
random variables X and let P be a joint random variables X and let P be a joint
distribution over these variables. If G is distribution over these variables. If P
an I-Map for P, then P factorizes factorizes according to G, then G is an
| according      | to G |     | I-Map of P     |     |
| -------------- | ---- | --- | -------------- | --- |
| Proof:Exercise |      |     | Proof:Exercise |     |
85/86
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture17 |
| --- | --- | -------------- | --------------------- | --------- |

X
|     |     | 3   |     |     | Consider  | a set of random | variables     |
| --- | --- | --- | --- | --- | --------- | --------------- | ------------- |
|     |     |     |     |     | X ,X ,X   | ,X ,X           |               |
|     |     |     |     |     | 1 2       | 3 4 5           |               |
| X 5 |     |     | X 1 |     |           |                 |               |
|     |     |     |     |     | There are | many joint      | distributions |
possible
|     |     |     |     |     | Each may | entail different |     |
| --- | --- | --- | --- | --- | -------- | ---------------- | --- |
X X
|                   | 2          |                  | 4              |      |                |                      |               |
| ----------------- | ---------- | ---------------- | -------------- | ---- | -------------- | -------------------- | ------------- |
|                   |            |                  |                |      | independence   | relations            |               |
|                   |            |                  |                |      | For example,   | in some              | cases L could |
| Answer:           | A complete |                  | graph          |      |                |                      |               |
|                   |            |                  |                |      | be independent | of S; in             | some not.     |
| The factorization |            | entailed         | by the         |      |                |                      |               |
| above graph       | is         |                  |                |      | Can you        | think of a G         | which will be |
| P(X )P(X          | |X         | )P(X             | |X ,X )        |      |                |                      |               |
| 3                 | 5          | 3                | 1 3 5          |      | an I-Map       | for any distribution | over          |
| P(X |X            | ,X ,X      | )P(X             | |X ,X ,X       | ,X ) | P?             |                      |               |
| 2                 | 1 3        | 5                | 4 1 2 3        | 5    |                |                      |               |
| which is          | just chain | rule             | of probability |      |                |                      |               |
| which holds       | for        | any distribution |                |      |                |                      |               |
86/86
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture17 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- |
