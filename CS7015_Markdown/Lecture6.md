| CS7015 | (Deep Learning) | : Lecture | 6   |
| ------ | --------------- | --------- | --- |
Eigen Values, Eigen Vectors, Eigen Value Decomposition, Principal Component
| Analysis, | Singular     | Value Decomposition |     |
| --------- | ------------ | ------------------- | --- |
|           | Prof. Mitesh | M. Khapra           |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/71
| Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| ----- | -------------- | --------------------- | -------- |

| Module | 6.1 : | Eigenvalues | and Eigenvectors |     |
| ------ | ----- | ----------- | ---------------- | --- |
2/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

y
|     |     | What happens | when | a matrix | hits a |
| --- | --- | ------------ | ---- | -------- | ------ |
(cid:20) (cid:21)
1 2
A = vector?
2 1
(cid:20) (cid:21)
|      | 7   | The vector | gets       | transformed | into a     |
| ---- | --- | ---------- | ---------- | ----------- | ---------- |
| Ax = |     |            |            |             |            |
|      | 5   | new vector | (it strays | from        | its path)  |
|      |     | The vector | may        | also        | get scaled |
(cid:20) 1 (cid:21)
|     |     | (elongated | or shortened) |     | in the |
| --- | --- | ---------- | ------------- | --- | ------ |
x =
3
process.
x
3/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |     |     |
| -------------------- | --------------------- | --- | -------- | --- | --- |

y
|                   |     | For a given | square matrix | A, there |
| ----------------- | --- | ----------- | ------------- | -------- |
| (cid:20) (cid:21) |     |             |               |          |
1 2
| A = |     | exist special | vectors which | refuse to |
| --- | --- | ------------- | ------------- | --------- |
2 1
|     |     | stray from     | their path. |               |
| --- | --- | -------------- | ----------- | ------------- |
|     |     | These vectors  | are called  | eigenvectors. |
|     |     | More formally, |             |               |
(cid:20) 3 (cid:21) (cid:20) 1 (cid:21)
Ax = = 3
|                   | 3 1 | Ax = λx    | [direction remains | the same]      |
| ----------------- | --- | ---------- | ------------------ | -------------- |
| (cid:20) (cid:21) |     | The vector | will only          | get scaled but |
1
x =
|     |     | will not | change its direction. |     |
| --- | --- | -------- | --------------------- | --- |
1
x
4/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| --- | -------------------- | --------------------- | -------- | --- |

y
|     |     | So what | is so special | about |
| --- | --- | ------- | ------------- | ----- |
(cid:20) (cid:21)
1 2
| A = |     | eigenvectors? |     |     |
| --- | --- | ------------- | --- | --- |
2 1
Whyaretheyalwaysinthelimelight?
|     |     | It turns    | out that several | properties |
| --- | --- | ----------- | ---------------- | ---------- |
|     |     | of matrices | can be analyzed  | based      |
(cid:20) 3 (cid:21) (cid:20) 1 (cid:21)
|     |     | on their eigenvalues | (for | example, see |
| --- | --- | -------------------- | ---- | ------------ |
Ax = = 3
3 1
|     |     | spectral graph | theory)     |             |
| --- | --- | -------------- | ----------- | ----------- |
|     |     | We will        | now see two | cases where |
(cid:20) (cid:21)
1
| x = |     | eigenvalues/vectors | will | help us in |
| --- | --- | ------------------- | ---- | ---------- |
| 1   |     | this course         |      |            |
x
5/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| --- | -------------------- | --------------------- | -------- | --- |

|     |     |     |     | Let | us assume |     | that | on day | 0, k | students | eat |
| --- | --- | --- | --- | --- | --------- | --- | ---- | ------ | ---- | -------- | --- |
1
|     | Chinese | Mexican |     |         |       |     |     |          |     |         |       |
| --- | ------- | ------- | --- | ------- | ----- | --- | --- | -------- | --- | ------- | ----- |
|     |         |         |     | Chinese | food, | and | k   | students | eat | Mexican | food. |
2
|     | k   |          | k        |     |         |            |      |        |            |     |          |
| --- | --- | -------- | -------- | --- | ------- | ---------- | ---- | ------ | ---------- | --- | -------- |
|     | 1   |          | 2        | (Of | course, | no one     | eats | in the | mess!)     |     |          |
|     |     |          |          | On  | each    | subsequent |      | day i, | a fraction |     | p of the |
|     |     | (cid:20) | (cid:21) |     |         |            |      |        |            |     |          |
k
|     | v   | =   | 1   | students |     | who ate | Chinese |     | food on | day | (i − 1), |
| --- | --- | --- | --- | -------- | --- | ------- | ------- | --- | ------- | --- | -------- |
(0)
|     |             |         | k 2      | continue            | to         | eat Chinese |                         | food | on day | i, and | (1−p) |
| --- | ----------- | ------- | -------- | ------------------- | ---------- | ----------- | ----------------------- | ---- | ------ | ------ | ----- |
|     |             |         |          | shift               | to Mexican |             | food.                   |      |        |        |       |
|     | (cid:20) pk | +(1−q)k | (cid:21) |                     |            |             |                         |      |        |        |       |
|     |             | 1       | 2        |                     |            |             |                         |      |        |        |       |
| v   | =           |         |          | Similarlyafractionq |            |             | ofstudentswhoateMexican |      |        |        |       |
| (1) | (1−p)k      |         | +qk      |                     |            |             |                         |      |        |        |       |
1 2
|     |          |     |                           | food   | on day | (i−1)     | continue |          | to eat  | Mexican | food |
| --- | -------- | --- | ------------------------- | ------ | ------ | --------- | -------- | -------- | ------- | ------- | ---- |
|     | (cid:20) |     | (cid:21)(cid:20) (cid:21) |        |        |           |          |          |         |         |      |
|     | p        | 1−q | k 1                       |        |        |           |          |          |         |         |      |
|     | =        |     |                           | on day | i,     | and (1−q) |          | shift to | Chinese | food.   |      |
|     | 1−p      |     | q k                       |        |        |           |          |          |         |         |      |
2
|     |     |      |     | The     | number | of    | customers     | in  | the two | restaurants |     |
| --- | --- | ---- | --- | ------- | ------ | ----- | ------------- | --- | ------- | ----------- | --- |
|     | v   | = Mv |     | is thus | given  | by    | the following |     | series: |             |     |
|     | (1) |      | (0) |         |        |       |               |     |         |             |     |
|     | v   | = Mv |     |         |        |       |               |     |         |             |     |
|     | (2) |      | (1) |         |        |       | ,M2v          |     | ,M3v    |             |     |
|     |     |      |     |         |        | v ,Mv |               |     |         | ,...        |     |
|     |     | M2v  |     |         |        | (0)   | (0)           | (0) | (0)     |             |     |
=
(0)
Mnv
| In general, |     | v = |     |     |     |     |     |     |     |     |     |
| ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|             |     | (n) | (0) |     |     |     |     |     |     |     |     |
6/71
|     |     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture6 |     |     |     |
| --- | --- | --- | -------------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     |     |     | This is | a problem | for the two | restaurant |
| --- | --- | --- | ------- | --------- | ----------- | ---------- |
owners.
Thenumberofpatronsischangingconstantly.
|     |     |     | Or is        | it? Will the   | system eventually | reach  |
| --- | --- | --- | ------------ | -------------- | ----------------- | ------ |
|     |     |     | a steady     | state?         | (i.e. will the    | number |
|     | 1−p |     | of customers | in the         | two restaurants   | become |
|     |     |     | constant     | over time?)    |                   |        |
| p   |     | q   | Turns        | out they will! |                   |        |
| k   | 1   | k 2 |              |                |                   |        |
|     |     |     | Let’s see    | how?           |                   |        |
1−q
7/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |     |
| --- | --- | -------------------- | --------------------- | --- | -------- | --- |

| Definition |     |     | Definition |     |     |     |     |
| ---------- | --- | --- | ---------- | --- | --- | --- | --- |
Let λ ,λ ,...,λ be the A matrix M is called a stochastic matrix if all the
| 1 2 | n   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
eigenvectors of an n×n matrix entries are positive and the sum of the elements in
| A. λ is called | the dominant |     | each column | is equal | to 1. |     |     |
| -------------- | ------------ | --- | ----------- | -------- | ----- | --- | --- |
1
eigen value of A if (Note that the matrix in our example is a
|        |                  |     | stochastic | matrix) |     |     |     |
| ------ | ---------------- | --- | ---------- | ------- | --- | --- | --- |
| |λ | ≥ | |λ | i = 2,...,n |     |            |         |     |     |     |
| 1      | i                |     |            |         |     |     |     |
Theorem
Theorem
|             |            |     | If A is     | a n × n square | matrix   | with a dominant  |     |
| ----------- | ---------- | --- | ----------- | -------------- | -------- | ---------------- | --- |
| The largest | (dominant) |     |             |                |          |                  |     |
|             |            |     | eigenvalue, | then the       | sequence | of vectors given | by  |
eigenvalue of a stochastic matrix Av , A2v , ..., Anv ,... approaches a multiple of
|                |     |     | 0            | 0 0         |           |               |     |
| -------------- | --- | --- | ------------ | ----------- | --------- | ------------- | --- |
| is 1.          |     |     | the dominant | eigenvector | of A.     |               |     |
| See proof here |     |     |              |             |           |               |     |
|                |     |     | (the theorem | is slightly | misstated | here for ease | of  |
explanation)
8/71
|     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |     |     |
| --- | --- | -------------------- | --- | --------------------- | -------- | --- | --- |

1−p
|     | Let e | be the | dominant | eigenvector |     | of  | M and |     |     |
| --- | ----- | ------ | -------- | ----------- | --- | --- | ----- | --- | --- |
d
|     | λ = 1thecorrespondingdominanteigenvalue |     |     |     |     |     |     |     |     |
| --- | --------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
d
|     |       |              |      |             |     |               | p        | k   | k q |
| --- | ----- | ------------ | ---- | ----------- | --- | ------------- | -------- | --- | --- |
|     | Given | the previous |      | definitions |     | and theorems, |          | 1   | 2   |
|     | what  | can          | you  | say about   |     | the           | sequence |     |     |
|     | ,M2v  |              | ,M3v |             |     |               |          | 1−q |     |
|     | Mv    |              |      | ,...?       |     |               |          |     |     |
|     | (0)   | (0)          |      | (0)         |     |               |          |     |     |
|     | There | exists       | an n | such that   |     |               |          |     |     |
Mnv
|       | v =            |          | =    | ke (some   | multiple |             | of e )         |     |     |
| ----- | -------------- | -------- | ---- | ---------- | -------- | ----------- | -------------- | --- | --- |
|       | (n)            |          | (0)  | d          |          |             | d              |     |     |
|       | Now what       | happens  |      | at time    | step     | (n+1)?      |                |     |     |
| v     | = Mv           | =        | M(ke | d ) = k(Me |          | d ) = k(λ   | d e d ) = ke d |     |     |
| (n+1) |                | (n)      |      |            |          |             |                |     |     |
|       | The population |          |      | in the     | two      | restaurants |                |     |     |
|       | becomes        | constant |      | after time | step     | n.          |                |     |     |
|       | See Proof      | Here     |      |            |          |             |                |     |     |
9/71
|     |     |     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |     |
| --- | --- | --- | --- | ----- | -------------- | --- | --------------------- | -------- | --- |

Now instead of a stochastic matrix let us consider any square matrix A
,A2x
Let p be the time step at which the sequence x 0 ,Ax 0 0 ,... approaches a
| multiple | of e | (the dominant |     | eigenvector | of  | A)  |     |
| -------- | ---- | ------------- | --- | ----------- | --- | --- | --- |
d
|     |     |       | Apx | = ke      |           |          |      |
| --- | --- | ----- | --- | --------- | --------- | -------- | ---- |
|     |     |       |     | 0 d       |           |          |      |
|     |     | Ap+1x |     | A(Apx     |           |          |      |
|     |     |       |     | 0 =       | 0 ) = kAe | d = kλ d | e d  |
|     |     | Ap+2x |     | = A(Ap+1x | ) =       | kλ Ae =  | kλ2e |
|     |     |       |     | 0         | 0         | d d      | d d  |
|     |     | Ap+nx |     |           | )ne       |          |      |
|     |     |       |     | 0 = k(λ   | d d       |          |      |
In general, if λ is the dominant eigenvalue of a matrix A, what would happen
d
,A2x
| to the sequence |       | x ,Ax    |     | ,... | if  |     |     |
| --------------- | ----- | -------- | --- | ---- | --- | --- | --- |
|                 |       | 0        | 0   | 0    |     |     |     |
| |λ |>1          | (will | explode) |     |      |     |     |     |
d
| |λ |<1 | (will | vanish) |     |     |     |     |     |
| ------ | ----- | ------- | --- | --- | --- | --- | --- |
d
| |λ d |=1 | (will | reach   | a steady   | state) |             |     |     |
| -------- | ----- | ------- | ---------- | ------ | ----------- | --- | --- |
| (We will | use   | this in | the course | at     | some point) |     |     |
10/71
|     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |
| --- | --- | ----- | -------------- | --- | --------------------- | --- | -------- |

| Module | 6.2 : | Linear Algebra | - Basic | Definitions |
| ------ | ----- | -------------- | ------- | ----------- |
11/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

We will see some more examples where eigenvectors are important, but before
that let’s revisit some basic definitions from linear algebra.
12/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

Basis
A set of vectors ∈ Rn is called a basis, if they are linearly independent and every
vector ∈ Rn can be expressed as a linear combination of these vectors.
| Linearly | independent | vectors |     |     |     |
| -------- | ----------- | ------- | --- | --- | --- |
A set of n vectors v ,v ,...,v is linearly independent if no vector in the set can
1 2 n
be expressed as a linear combination of the remaining n−1 vectors.
| In other | words, the | only solution | to  |     |     |
| -------- | ---------- | ------------- | --- | --- | --- |
c v +c v +...c v = 0 is c = c = ··· = c = 0(c ’s are scalars)
|     | 1 1 2 2 | n n | 1   | 2   | n i |
| --- | ------- | --- | --- | --- | --- |
13/71
|     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --- | --------------------- | -------- |

R2
|     |     | For example  | consider |                   | the space |                   |     |
| --- | --- | ------------ | -------- | ----------------- | --------- | ----------------- | --- |
|     |     | Now consider |          | the vectors       |           |                   |     |
|     |     |              |          | (cid:20) (cid:21) |           | (cid:20) (cid:21) |     |
|     |     |              |          | 1                 |           | 0                 |     |
|     |     |              | x =      | and               | y         | =                 |     |
|     |     |              |          | 0                 |           | 1                 |     |
(cid:20) (cid:21)
a
| y = (0,1) |     | Any vector |     | ∈ R2, | can | be expressed | as a |
| --------- | --- | ---------- | --- | ----- | --- | ------------ | ---- |
b
|     |     | linear | combination | of  | these | two vectors | i.e |
| --- | --- | ------ | ----------- | --- | ----- | ----------- | --- |
x = (1,0)
|     |     |           | (cid:20) a | (cid:21) (cid:20) | 1 (cid:21) | (cid:20) 0 (cid:21) |          |
| --- | --- | --------- | ---------- | ----------------- | ---------- | ------------------- | -------- |
|     |     |           |            | = a               | +b         |                     |          |
|     |     |           | b          |                   | 0          | 1                   |          |
|     |     | Further,  | x and      | y are linearly    |            | independent.        |          |
|     |     | (the only | solution   | to                | c 1 x +    | c 2 y = 0           | is c 1 = |
c = 0)
2
14/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |     |     |     |
| --- | -------------------- | --------------------- | --- | -------- | --- | --- | --- |

|     |     | Infact,turnsoutthatxandy |           |        |                 |                 | areunitvectors |       |
| --- | --- | ------------------------ | --------- | ------ | --------------- | --------------- | -------------- | ----- |
|     |     | in the                   | direction | of     | the co-ordinate |                 | axes.          |       |
|     |     | And indeed               |           | we are | used            | to representing |                | all   |
|     |     | vectors                  | in R2     | as a   | linear          | combination     | of             | these |
two vectors.
|     |     | But there | is  | nothing | sacrosanct |     | about | the |
| --- | --- | --------- | --- | ------- | ---------- | --- | ----- | --- |
y = (0,1)
|     |     | particular | choice | of   | x and  | y.  |            |     |
| --- | --- | ---------- | ------ | ---- | ------ | --- | ---------- | --- |
|     |     | We could   |        | have | chosen | any | 2 linearly |     |
independentvectorsinR2
| x = (1,0) |     |             |          |          |          | asthebasisvectors. |              |         |
| --------- | --- | ----------- | -------- | -------- | -------- | ------------------ | ------------ | ------- |
|           |     | For         | example, |          | consider |                    | the linearly |         |
|           |     |             |          |          |          | [2,3]T             |              | [5,7]T. |
|           |     | independent |          | vectors, |          |                    | and          |         |
(cid:20) a (cid:21) (cid:20) 2 (cid:21) (cid:20) 5 (cid:21) See how any vector [a,b]T ∈ R2 can be
| = x   | +x  |           |     |          |             |     |     |       |
| ----- | --- | --------- | --- | -------- | ----------- | --- | --- | ----- |
| b 1 3 | 2 7 | expressed | as  | a linear | combination |     | of  | these |
two vectors.
| a = 2x 1 +5x | 2   |        |      |       |      |         |          |     |
| ------------ | --- | ------ | ---- | ----- | ---- | ------- | -------- | --- |
|              |     | We can | find | x and | x by | solving | a system | of  |
| b = 3x +7x   |     |        |      | 1     | 2    |         |          |     |
| 1            | 2   |        |      |       |      |         |          |     |
linear equations.
15/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture6 |     |     |     |
| --- | -------------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     |          |          | In general, | given | a     | set of linearly    | independent     |     |       |
| --- | -------- | -------- | ----------- | ----- | ----- | ------------------ | --------------- | --- | ----- |
|     | (cid:20) | (cid:21) | vectorsu    | ,u    | ,...u | ∈ Rn,              | wecanexpressany |     |       |
|     |          | z        |             | 1 2   |       | n                  |                 |     |       |
|     | z =      | 1        |             | Rn    |       |                    |                 |     |       |
|     |          |          | vector z    | ∈     | as a  | linear combination |                 | of  | these |
z 2
vectors.
|     |     |     | z = | α 1 u 1 | +α 2 | u 2 +···+α | n u n |     |     |
| --- | --- | --- | --- | ------- | ---- | ---------- | ----- | --- | --- |
|     |     |     |   |        |     |           |      |     |   |
| u   |     |     | z   |         | u    | u          |       |     | u   |
| 2   |     |     | 1   |         | 11   | 21         |       |     | n1  |
u
|     | 1   |                      | z 2                 | u        | 12  | u 22      |         |          | u n2 |
| --- | --- | -------------------- | --------------------- | --------- | ---- | ----------- | ------- | -------- | ------ |
|     |     |                      |                     |          |     |            |        |          |      |
|     |     |                      | . =                   | α         | .    | +α .        | +...+α  |          | .      |
|     |     |                      |  .                  | 1        | .   | 2  .       |        | n        |  .   |
|     |     |                      |  .                  |          | .   |  .         |        |          |  .   |
|     |     |                      | z                     |           | u    | u           |         |          | u      |
|     |     |                      | n                     |           | 1n   | 2n          |         |          | nn     |
|     |     |                      |                     |          |      |             |       |         |        |
|     |     |                      | z                     | u         | u    | ... u       | α       |          |        |
|     |     |                      | 1                     | 11        | 21   |             | n1      | 1        |        |
|     |     |                      | z 2                 | u 12     | u 22 | ... u       | n2α   | 2       |        |
|     |     |                      |                     |          |      |             |       |         |        |
|     |     |                      |  .  =               |  .       | .    | .           | .     | .       |        |
|     |     |                      | . .                   | . .       | . .  | . .         | . .     | . .      |        |
|     |     |                      |                     |          |      |             |       |         |        |
|     |     |                      | z                     | u         | u    | ... u       | α       |          |        |
|     |     |                      | n                     | 1n        | 2n   |             | nn      | n        |        |
|     |     |                      | (Basically            | rewriting |      | in matrix   | form)   |          |        |
|     |     |                      | We can                | now       | find | the α i     | s using | Gaussian |        |
|     |     |                      | Elimination           | (Time     |      | Complexity: | O(n3))  |          | 16/71  |
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |           |      | Lecture6    |         |          |        |

|     |     |          |          |     | Now | let us see | if we | have | orthonormal |     | basis. |
| --- | --- | -------- | -------- | --- | --- | ---------- | ----- | ---- | ----------- | --- | ------ |
|     |     | (cid:20) | (cid:21) |     |     |            |       |      |             |     |        |
a uT u = 0 ∀i (cid:54)= j and uT u = (cid:107)u (cid:107)2 = 1
|     |     | z = |     |     | i   | j   |     | i   | i   | i   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
b
|     |     |     |     |     | Again | we have: |     |     |     |     |     |
| --- | --- | --- | --- | --- | ----- | -------- | --- | --- | --- | --- | --- |
→ |
|     | z   |     |     |     |     | z = | α 1 u 1 | +α 2 u 2 | + . ..+ | α n u n |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | -------- | ------- | ------- | --- |
| u   | |   |     |     |     |     |     |         |          |         |         |     |
2 u
|     |     | 1   |     |     |     | uTz = | α u Tu | + .. | . + α | uT u  |     |
| --- | --- | --- | --- | --- | --- | ----- | ------ | ---- | ----- | ----- | --- |
|     |     |     |     |     |     | 1     | 1 1    | 1    |       | n 1 n |     |
θ
2 α1
| α              |     |        |     |     |         | =            | α 1 |           |         |            |       |
| -------------- | --- | ------ | --- | --- | ------- | ------------ | --- | --------- | ------- | ---------- | ----- |
|                |     |        |     |     | We      | can directly |     | find each | α       | using      | a dot |
|                |     | zTu    |     |     |         |              |     |           |         | i          |       |
| α = | → z|cosθ | =   | | → z| | 1 = | zTu |         |              |     |           |         |            |       |
| 1              |     | →      |     | 1   | product | between      | z   | and       | u (time | complexity |       |
|                |     | | z||u | |   |     |         |              |     |           | i       |            |       |
1
O(N))
| Similarly, | α = | zTu | .   |     | The | total complexity |     | will | be O(N2) |     |     |
| ---------- | --- | --- | --- | --- | --- | ---------------- | --- | ---- | -------- | --- | --- |
2 2
| When u    | and u       | are unit          | vectors  |          |     |     |     |     |     |     |     |
| --------- | ----------- | ----------------- | -------- | -------- | --- | --- | --- | --- | --- | --- | --- |
| 1         | 2           |                   |          |          |     |     |     |     |     |     |     |
| along the | co-ordinate |                   | axes     |          |     |     |     |     |     |     |     |
| (cid:20)  | (cid:21)    | (cid:20) (cid:21) | (cid:20) | (cid:21) |     |     |     |     |     |     |     |
| a         |             | 1                 | 0        |          |     |     |     |     |     |     |     |
| z =       | = a         |                   | +b       |          |     |     |     |     |     |     |     |
| b         |             | 0                 | 1        |          |     |     |     |     |     |     |     |
17/71
|     |     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |     |     |     |
| --- | --- | --- | ----- | -------------- | --- | --------------------- | --- | -------- | --- | --- | --- |

Remember
An orthogonal basis is the most convenient basis that one can hope for.
18/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

|         |     |     | But what | does any | of this | have | to do with |
| ------- | --- | --- | -------- | -------- | ------- | ---- | ---------- |
| Theorem | 1   |     |          |          |         |      |            |
eigenvectors?
| The eigenvectors | of a            | matrix |       |              |              |     |            |
| ---------------- | --------------- | ------ | ----- | ------------ | ------------ | --- | ---------- |
|                  |                 |        | Turns | out that the | eigenvectors |     | can form a |
| A ∈ Rn×n         | having distinct |        |       |              |              |     |            |
basis.
| eigenvalues | are linearly |     |     |     |     |     |     |
| ----------- | ------------ | --- | --- | --- | --- | --- | --- |
Infact,theeigenvectorsofasquaresymmetric
independent.
|         |          |     | matrix    | are even more | special.        |     |        |
| ------- | -------- | --- | --------- | ------------- | --------------- | --- | ------ |
| Proof:  | See here |     |           |               |                 |     |        |
|         |          |     | Thus they | form a        | very convenient |     | basis. |
| Theorem | 2        |     |           |               |                 |     |        |
Whywouldwewanttousetheeigenvectorsas
The eigenvectors of a square abasisinsteadofthemorenaturalco-ordinate
| symmetric   | matrix are |     | axes?   |             |          |       |     |
| ----------- | ---------- | --- | ------- | ----------- | -------- | ----- | --- |
| orthogonal. |            |     | We will | answer this | question | soon. |     |
| Proof:      | See here   |     |         |             |          |       |     |
19/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |     |     |
| --- | --- | -------------------- | --------------------- | --- | -------- | --- | --- |

| Module | 6.3 : | Eigenvalue | Decomposition |     |
| ------ | ----- | ---------- | ------------- | --- |
20/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

Before proceeding let’s do a quick recap of eigenvalue decomposition.
21/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

Let u ,u ,...,u be the eigenvectors of a matrix A and let λ ,λ ,...,λ be
1 2 n 1 2 n
the corresponding eigenvalues.
Consider a matrix U whose columns are u ,u ,...,u .
1 2 n
Now
(cid:120) (cid:120) (cid:120)  (cid:120) (cid:120) (cid:120) 
     
AU = A u  1 u  2 ... u  n = A  u 1 A  u 2 ... A  u n
(cid:121) (cid:121) (cid:121) (cid:121) (cid:121) (cid:121)
 (cid:120) (cid:120) (cid:120) 
  
= λ 1 u 1 λ 2 u 2 ... λ n u n
  
(cid:121) (cid:121) (cid:121)
 
λ 0 ... 0
1
(cid:120) (cid:120) (cid:120) .
=  u  
(cid:121)
1 u  
(cid:121)
2 ... u  
(cid:121)
n    

0 . .
.
λ 2 ...
0
. .    

= UΛ
0 ... 0 λ
n
where Λ is a diagonal matrix whose diagonal elements are the eigenvalues of A.
22/71
Prof. MiteshM.Khapra CS7015(DeepLearning): Lecture6

|     |     |     |     | AU = | UΛ  |     |     |
| --- | --- | --- | --- | ---- | --- | --- | --- |
U−1
| If exists, | then       | we    | can write, |             |                  |                |       |
| ---------- | ---------- | ----- | ---------- | ----------- | ---------------- | -------------- | ----- |
|            |            | A     | = UΛU−1    | [eigenvalue |                  | decomposition] |       |
|            |            | U−1AU | = Λ        |             | [diagonalization |                | of A] |
| Under what | conditions |       | would U−1  | exist?      |                  |                |       |
If the columns of U are linearly independent [See proof here]
| i.e. if | A has | n linearly | independent |     | eigenvectors. |     |     |
| ------- | ----- | ---------- | ----------- | --- | ------------- | --- | --- |
i.e. if A has n distinct eigenvalues [sufficient condition, proof : Slide 19
| Theorem |     | 1]  |     |     |     |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- |
23/71
|     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |
| --- | --- | ----- | -------------- | --- | --------------------- | --- | -------- |

If A is symmetric then the situation is even more convenient.
| The eigenvectors |     | are | orthogonal | [proof | :   | Slide 19 | Theorem | 2]  |
| ---------------- | --- | --- | ---------- | ------ | --- | -------- | ------- | --- |
Further let’s assume, that the eigenvectors have been normalized [ uTu = 1]
i i
|     |     |     |       |    |      |            |                      |     |
| --- | --- | --- | ----- | --- | ----- | ---------- | -------------------- | --- |
|     |     |     |       | ←   | u →   |            |                      |     |
|     |     |     |       |     | 1     | (cid:120) | (cid:120) (cid:120) |     |
|     |     |     |       |     |       |           |                    |     |
|     |     |     |       |  ← | u →  |            |                      |     |
|     |     | Q = | UTU = |    | 2   | u u        | ... u                |     |
|     |     |     |       |     | ...   |  1        |  2                 | n  |
|     |     |     |       |    |      |            |                      |     |
|     |     |     |       |     |       | (cid:121)  | (cid:121) (cid:121)  |     |
|     |     |     |       | ←   | u →   |            |                      |     |
n
| Each cell | of the | matrix, | Q is  | given | by uTu        |                  |     |     |
| --------- | ------ | ------- | ----- | ----- | ------------- | ---------------- | --- | --- |
|           |        |         | ij    |       | i             | j                |     |     |
|           |        |         | Q     | = uTu | =             | 0 if i (cid:54)= | j   |     |
|           |        |         |       | ij    | i j           |                  |     |     |
|           |        |         |       |       | =             | 1 if i =         | j   |     |
|           |        |         | ∴ UTU | I     |               |                  |     |     |
|           |        |         |       | =     | (the identity | matrix)          |     |     |
UT
| is the | inverse | of  | U (very | convenient | to  | calculate) |     |     |
| ------ | ------- | --- | ------- | ---------- | --- | ---------- | --- | --- |
24/71
|     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |     |
| --- | --- | ----- | -------------- | --- | --------------------- | --- | -------- | --- |

| Something | to think about |         |     |     |
| --------- | -------------- | ------- | --- | --- |
| Given     | the EVD, A     | = UΣUT, |     |     |
what can you say about the sequence x ,Ax ,A2x ,... in terms of the eigen
|        |       |     | 0 0 0 |     |
| ------ | ----- | --- | ----- | --- |
| values | of A. |     |       |     |
(Hint: You should arrive at the same conclusion we saw earlier)
25/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

| Theorem (one | more important | property | of eigenvectors) |     |
| ------------ | -------------- | -------- | ---------------- | --- |
If A is a square symmetric N ×N matrix, then the solution to the following
optimization problem is given by the eigenvector corresponding to the largest
| eigenvalue | of A. |     |      |     |
| ---------- | ----- | --- | ---- | --- |
|            |       | max | xTAx |     |
x
|                  |     | s.t | (cid:107)x(cid:107) = 1 |     |
| ---------------- | --- | --- | ----------------------- | --- |
| and the solution | to  |     |                         |     |
|                  |     | min | xTAx                    |     |
x
|     |     | s.t | (cid:107)x(cid:107) = 1 |     |
| --- | --- | --- | ----------------------- | --- |
is given by the eigenvector corresponding to the smallest eigenvalue of A.
| Proof: Next | slide. |     |     |     |
| ----------- | ------ | --- | --- | --- |
26/71
|     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | ----- | -------------- | --------------------- | -------- |

This is a constrained optimization problem that can be solved using Lagrange
Multipliers:
|     |     | L = xTAx−λ(xTx−1) |     |     |     |
| --- | --- | ----------------- | --- | --- | --- |
∂L
|     |     | = 2Ax−λ(2x) |     | = 0 => | Ax = λx |
| --- | --- | ----------- | --- | ------ | ------- |
∂x
| Hence x must | be an eigenvector |     | of A | with eigenvalue | λ.  |
| ------------ | ----------------- | --- | ---- | --------------- | --- |
xT:
| Multiplying | by  |      |      |           |      |
| ----------- | --- | ---- | ---- | --------- | ---- |
|             |     | xTAx | λxTx | xTx       |      |
|             |     |      | =    | = λ(since | = 1) |
Therefore, the critical points of this constrained problem are the eigenvalues of
A.
The maximum value is the largest eigenvalue, while the minimum value is the
| smallest eigenvalue. |     |     |     |     |     |
| -------------------- | --- | --- | --- | --- | --- |
27/71
|     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | ----- | -------------- | --- | --------------------- | -------- |

| The story so | far... |     |     |     |
| ------------ | ------ | --- | --- | --- |
The eigenvectors corresponding to different eigenvalues are linearly
independent.
The eigenvectors of a square symmetric matrix are orthogonal.
Theeigenvectorsofasquaresymmetricmatrixcanthusformaconvenientbasis.
| We will put | all of this | to use. |     |     |
| ----------- | ----------- | ------- | --- | --- |
28/71
|     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | ----- | -------------- | --------------------- | -------- |

| Module | 6.4 : | Principal | Component | Analysis | and its |
| ------ | ----- | --------- | --------- | -------- | ------- |
Interpretations
29/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| --- | --- | -------------------- | --------------------- | -------- | --- |

The story ahead...
Over the next few slides we will introduce Principal Component Analysis and
| see three different | interpretations | of it |     |
| ------------------- | --------------- | ----- | --- |
30/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | -------------------- | --------------------- | -------- |

y
|     | Consider    | the following  | data         |
| --- | ----------- | -------------- | ------------ |
|     | Each        | point (vector) | here is      |
|     | represented | using          | a linear     |
|     | combination | of the         | x and y axes |
|     | (i.e. using | the point’s    | x and y      |
co-ordinates)
|     | In other     | words we are | using x and y |
| --- | ------------ | ------------ | ------------- |
|     | as the basis |              |               |
x
|     | What if | we choose a | different basis? |
| --- | ------- | ----------- | ---------------- |
31/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| -------------------- | --------------------- | -------- | --- |

y
|     |     |     | For example, | what | if we use u | and |
| --- | --- | --- | ------------ | ---- | ----------- | --- |
1
|     |     |     | u as a | basis instead | of x and y. |     |
| --- | --- | --- | ------ | ------------- | ----------- | --- |
2
|     |     |     | We observe | that all | the points have | a   |
| --- | --- | --- | ---------- | -------- | --------------- | --- |
u
1
verysmallcomponentinthedirection
u
| 2   |     |     | of u 2 (almost | noise)        |            |     |
| --- | --- | --- | -------------- | ------------- | ---------- | --- |
|     |     |     | It seems       | that the same | data which |     |
R2(x,y)
|     |     |     | was originally | in      | can now     | be  |
| --- | --- | --- | -------------- | ------- | ----------- | --- |
|     |     |     | represented    | in R1(u | ) by making | a   |
1
|     |     | x   | smarter | choice for the | basis |     |
| --- | --- | --- | ------- | -------------- | ----- | --- |
32/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |     |     |
| --- | -------------------- | --------------------- | --- | -------- | --- | --- |

y
|     |     | Let’s try | stating this | more formally |     |
| --- | --- | --------- | ------------ | ------------- | --- |
|     |     | Why do    | we not care  | about u 2 ?   |     |
|     | u   | Because   | the variance | in the data   | in  |
1
|     |     | this direction | is very | small (all | data |
| --- | --- | -------------- | ------- | ---------- | ---- |
u
| 2   |     | points have      | almost | the same value | in  |
| --- | --- | ---------------- | ------ | -------------- | --- |
|     |     | the u direction) |        |                |     |
2
|     |     | If we were | to build       | a classifier | on  |
| --- | --- | ---------- | -------------- | ------------ | --- |
|     |     | top of     | this data then | u would      | not |
2
x
|     |     | contribute | to the | classifier as | the |
| --- | --- | ---------- | ------ | ------------- | --- |
y
|     |     | points         | are not distinguishable |     | along |
| --- | --- | -------------- | ----------------------- | --- | ----- |
|     |     | this direction |                         |     |       |
u
1
u
2
33/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |     |
| --- | -------------------- | --------------------- | -------- | --- | --- |
x

y
|     | In general,  | we are    | interested | in    |
| --- | ------------ | --------- | ---------- | ----- |
|     | representing | the data  | using      | fewer |
|     | dimensions   | such that | the data   | has   |
u
| 1   | high variance | along | these dimensions |     |
| --- | ------------- | ----- | ---------------- | --- |
u
| 2   | Is that   | all?            |           |     |
| --- | --------- | --------------- | --------- | --- |
|     | No, there | is something    | else that | we  |
|     | desire.   | Let’s see what. |           |     |
x
34/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |     |
| -------------------- | --------------------- | -------- | --- | --- |

|          |     | Consider    | the following   | data            |      |
| -------- | --- | ----------- | --------------- | --------------- | ---- |
| x y      | z   |             |                 |                 |      |
| 1 1      | 1   | Is z adding | any             | new information |      |
| 0.5 0    | 0   | beyond      | what is already | contained       | in   |
| 0.25 1   | 1   | y?          |                 |                 |      |
| 0.35 1.5 | 1.5 | The two     | columns         | are highly      |      |
| 0.45 1   | 1   | correlated  | (or they        | have a          | high |
| 0.57 2   | 2.1 |             |                 |                 |      |
covariance)
| 0.62 1.1  | 1    |              |       |                |     |
| --------- | ---- | ------------ | ----- | -------------- | --- |
|           |      | In other     | words | the column     | z   |
| 0.73 0.75 | 0.76 |              |       |                |     |
|           |      | is redundant | since | it is linearly |     |
| 0.72 0.86 | 0.87 |              |       |                |     |
|           |      | dependent    | on y. |                |     |
(cid:80)n
| (y i | −y)(z i −z) |     |     |     |     |
| ---- | ----------- | --- | --- | --- | --- |
ρ = i=1
| yz (cid:112)(cid:80)n | (cid:112)(cid:80)n |     |     |     |     |
| --------------------- | ------------------ | --- | --- | --- | --- |
| (y −y)2               | (z −z)2            |     |     |     |     |
| i=1 i                 | i=1 i              |     |     |     |     |
35/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |     |
| --- | -------------------- | --------------------- | -------- | --- | --- |

y
|     | In general,  | we are    | interested in |
| --- | ------------ | --------- | ------------- |
|     | representing | the data  | using fewer   |
|     | dimensions   | such that |               |
u
1
thedatahashighvariancealongthese
u
2 dimensions
|     | the dimensions |                | are linearly   |
| --- | -------------- | -------------- | -------------- |
|     | independent    | (uncorrelated) |                |
|     | (even better   | if they        | are orthogonal |
x
|     | because | that is a very | convenient |
| --- | ------- | -------------- | ---------- |
basis)
36/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| -------------------- | --------------------- | -------- | --- |

Let p ,p ,··· ,p be a set of such n linearly independent orthonormal vectors. Let
| 1   | 2 n |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
P be a n×n matrix such that p ,p ,··· ,p are the columns of P.
|     |     |     |     | 1 2 | n   |     |
| --- | --- | --- | --- | --- | --- | --- |
Let x ,x ,··· ,x ∈ Rn be m data points and let X be a matrix such that
| 1   | 2 m |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
x ,x ,··· ,x are the rows of this matrix. Further let us assume that the data is
| 1 2        | m              |      |           |      |              |      |
| ---------- | -------------- | ---- | --------- | ---- | ------------ | ---- |
| 0-mean and | unit variance. |      |           |      |              |      |
| We want    | to represent   | each | x i using | this | new basis P. |      |
|            |                | x    | = α p     | +α p | +α p +···+α  | p    |
|            |                | i    | i1 1      | i2 2 | i3 3         | in n |
For an orthonormal basis we know that we can find these α(cid:48)s using
i
 
↑
|     |     |     |        | (cid:2) | (cid:3)T |     |
| --- | --- | --- | ------ | ------- | -------- | --- |
|     |     |     | α = xT | p =     | ← x → p | j  |
|     |     |     | ij     | i j     | i        |     |
↓
37/71
|     |     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | --- | --- | -------------------- | --- | --------------------- | -------- |

| In general, | the | transformed | data xˆ is | given by |     |     |
| ----------- | --- | ----------- | ---------- | -------- | --- | --- |
i
|     |     |      |         |         |    |        |
| --- | --- | ---- | ------- | -------- | --- | ------ |
|     |     |      |         | ↑        | ↑   |        |
|     |     |      | (cid:2) | (cid:3)  |     |        |
|     |     | xˆ = | ← xT    | → p ··· | p   | = xT P |
|     |     | i    | i       | 1        | n  | i      |
|     |     |      |         | ↓        | ↓   |        |
and
|     | Xˆ  |      | (Xˆ           |                |     |         |
| --- | --- | ---- | ------------- | -------------- | --- | ------- |
|     |     | = XP | is the matrix | of transformed |     | points) |
38/71
|     |     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |
| --- | --- | ----- | -------------- | --------------------- | --- | -------- |

Theorem:
Xˆ
If X is a matrix such that its columns have zero mean and if = XP then the
Xˆ
| columns | of will also | have | zero mean. |     |     |
| ------- | ------------ | ---- | ---------- | --- | --- |
Proof: For any matrix A, 1TA gives us a row vector with the ith element
containing the sum of the ith column of A. (this is easy to see using the
| row-column | picture | of matrix | multiplication). |     |     |
| ---------- | ------- | --------- | ---------------- | --- | --- |
Consider
|     |     |     | 1TXˆ = 1TXP | = (1TX)P |     |
| --- | --- | --- | ----------- | -------- | --- |
But 1TX is the row vector containing the sums of the columns of X. Thus
1TXˆ
| 1TX = | 0. Therefore,   | =      | 0.       |                  |      |
| ----- | --------------- | ------ | -------- | ---------------- | ---- |
| Hence | the transformed | matrix | also has | columns with sum | = 0. |
Theorem:
XTX
| is     | a symmetric  | matrix. |           |       |     |
| ------ | ------------ | ------- | --------- | ----- | --- |
| Proof: | We can write | (XTX)T  | = XT(XT)T | = XTX |     |
39/71
|     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --- | --------------------- | -------- |

Definition:
If X is a matrix whose columns are zero mean then Σ = 1XTX is the covariance
m
matrix. In other words each entry Σ ij stores the covariance between columns i and
j of X.
Explanation: Let C be the covariance matrix of X. Let µ , µ denote the means
i j
ith jth
of the and column of X respectively. Then by definition of covariance, we
can write :
m
|     | 1   | (cid:88) |        |      |     |     |
| --- | --- | -------- | ------ | ---- | --- | --- |
| C   | =   | (X       | −µ )(X | −µ ) |     |     |
| ij  |     |          | ki i   | kj j |     |     |
m
k=1
|     | 1   | m        |       |     |       |      |
| --- | --- | -------- | ----- | --- | ----- | ---- |
|     |     | (cid:88) |       |     | (∵    |      |
|     | =   | X        | X     |     | µ = µ | = 0) |
|     | m   |          | ki kj |     | i     | j    |
k=1
|     | 1   |     | 1       |     |     |     |
| --- | --- | --- | ------- | --- | --- | --- |
|     | =   | XTX | = (XTX) |     |     |     |
|     |     | i   | j       | ij  |     |     |
|     | m   |     | m       |     |     |     |
40/71
|     |     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| --- | --- | ----- | -------------- | --------------------- | -------- | --- |

|     |     |     |     | Xˆ  | =XP |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
1XˆTXˆ
Using the previous theorem & definition, we get is the covariance matrix of
m
| the | transformed | data. We | can write | :        |     |          |          |       |
| --- | ----------- | -------- | --------- | -------- | --- | -------- | -------- | ----- |
|     |             |          |           |          |     | (cid:18) | (cid:19) |       |
|     | 1           | 1        |           | 1        |     |          | 1        |       |
|     | XˆTXˆ       | = (XP)T  | XP        | = PTXTXP | =PT |          | XTX P    | =PTΣP |
|     | m           | m        |           | m        |     | m        |          |       |
1XˆTXˆ
Each cell i,j of the covariance matrix stores the covariance between columns
m
| i and   | j of Xˆ. |          |          |     |     |     |     |     |
| ------- | -------- | -------- | -------- | --- | --- | --- | --- | --- |
| Ideally | we want, |          |          |     |     |     |     |     |
|         |          | (cid:18) | (cid:19) |     |     |     |     |     |
1 XˆTXˆ
|     |     |     |     | =0  | i(cid:54)=j( | covariance=0) |     |     |
| --- | --- | --- | --- | --- | ------------ | ------------- | --- | --- |
m
ij
|     |     | (cid:18) 1 | (cid:19) |     |     |     |     |     |
| --- | --- | ---------- | -------- | --- | --- | --- | --- | --- |
XˆTXˆ
|     |     |     |     | (cid:54)=0 | i=j( | variance(cid:54)=0) |     |     |
| --- | --- | --- | --- | ---------- | ---- | ------------------- | --- | --- |
m
ij
| In  | other words, | we want |     |     |     |     |     |     |
| --- | ------------ | ------- | --- | --- | --- | --- | --- | --- |
1
|     |     | XˆTXˆ =PTΣP |     |     |           |      |                 |     |
| --- | --- | ----------- | --- | --- | --------- | ---- | --------------- | --- |
|     |     |             | =D  |     | [ where D | is a | diagonal matrix | ]   |
m 41/71
|     |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |     |
| --- | --- | ----- | -------------- | --- | --------------------- | --- | -------- | --- |

We want,
PTΣP
|          |                   |           | = D              |            |     |
| -------- | ----------------- | --------- | ---------------- | ---------- | --- |
| But Σ is | a square matrix   | and P     | is an orthogonal | matrix     |     |
| Which    | orthogonal matrix | satisfies | the following    | condition? |     |
PTΣP
|          |              |            | = D      |              |     |
| -------- | ------------ | ---------- | -------- | ------------ | --- |
| In other | words, which | orthogonal | matrix P | diagonalizes | Σ?  |
Answer: A matrix P whose columns are the eigen vectors of Σ = XTX [By
| Eigen Value | Decomposition] |     |     |     |     |
| ----------- | -------------- | --- | --- | --- | --- |
Thus, the new basis P used to transform X is the basis consisting of the eigen
| vectors | of XTX |     |     |     |     |
| ------- | ------ | --- | --- | --- | --- |
42/71
|     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |
| --- | ----- | -------------- | --------------------- | --- | -------- |

Why is this a good basis?
Because the eigen vectors of XTX are linearly independent (proof : Slide 19
Theorem 1)
And because the eigen vectors of XTX are orthogonal (∵ XTX is symmetric -
saw proof earlier)
This method is called Principal Component Analysis for transforming the data
to a new basis where the dimensions are non-redundant (low covariance) & not
noisy (high variance)
In practice, we select only the top-k dimensions along which the variance is
high (this will become more clear when we look at an alternalte interpretation
of PCA)
43/71
Prof. MiteshM.Khapra CS7015(DeepLearning): Lecture6

| Module | 6.5 : | PCA : Interpretation | 2   |     |
| ------ | ----- | -------------------- | --- | --- |
44/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

Given n orthogonal linearly independent vectors P = p ,p ,··· ,p we can
1 2 n
represent x exactly as a linear combination of these vectors.
i
n
(cid:88)
x = α p [we know how to estimate α(cid:48) s but we will come back to that later]
| i   | ij j |     | ij  |     |
| --- | ---- | --- | --- | --- |
j=1
But we are interested only in the top-k dimensions (we want to get rid of noisy &
| redundant | dimensions) |     |     |     |
| --------- | ----------- | --- | --- | --- |
k
(cid:88)
xˆ = α p
i ik k
j=1
We want to select p(cid:48)s such that we minimise the reconstructed error
i
m
(cid:88)
|     |     | e = | (x −xˆ )T(x −xˆ | )   |
| --- | --- | --- | --------------- | --- |
|     |     |     | i i i           | i   |
i=1
45/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

m n
|          |          |        |          |                   |          | (cid:88)  | (cid:88)   | (cid:0) (cid:1)(cid:0) | (cid:1)    |       |          |
| -------- | -------- | ------ | -------- | ----------------- | -------- | --------- | ---------- | ---------------------- | ---------- | ----- | -------- |
|          |          |        |          |                   |          | =         |            | pTx                    | xTp        |       |          |
|          |          |        |          |                   |          |           |            | j i                    | i j        |       |          |
| (cid:88) | m        |        |          |                   |          | i=        | 1j=k+1     |                        |            |       |          |
| e=       | (x −xˆ   | )T(x   | −xˆ )    |                   |          |           |            |                        |            |       |          |
|          | i        | i      | i i      |                   |          |           | n (cid:32) | m                      | (cid:33)   |       |          |
|          |          |        |          |                   |          | (cid:88)  |            | (cid:88)               |            |       |          |
| i=1      |          |        |          |                   |          | =         | pT         | xxT                    | p          |       |          |
|          |         |        |          | 2                |          |           | j          | i                      | i j        |       |          |
|          | m n      |        | k        |                   |          |           |            |                        |            |       |          |
| (cid:88) | (cid:88) |        | (cid:88) |                   |          | j=k+1     |            | i=1                    |            |       |          |
| =        |          | α p −  | α        | p                 |          |           | n          |                        | (cid:34) m |       | (cid:35) |
|          |         | ij j   |          | ij j             |          | (cid:88)  |            |                        | 1 (cid:88) | XTX   |          |
|          |          |        |          |                   |          | =         | pT mCp     |                        | ∵ x        | xT =  | =C       |
| i=1      | j=1      |        | j=1      |                   |          |           | j          | j                      | m          | i i m |          |
|          |         |        | 2       |                  | T      | j=k+1    |            |                        | i=1        |       |          |
|          | m        | n      |          | m n               |          | n         |            |                        |            |       |          |
| (cid:88) | (cid:88) |        |          | (cid:88) (cid:88) | (cid:88) |           |            |                        |            |       |          |
| =        |         | α ij p | j =     |  α ij p          | j      | α ij p j |            |                        |            |       |          |
| i=1      | j=k+1    |        |          | i=1 j=k+1         | j=k+1    |           |            |                        |            |       |          |
m
| (cid:88) |     |     |     |     | )T(α |     |     |     |     |     |     |
| -------- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
= (α i,k+1 p k+1 +α i,k+2 p k+2 +...+α i,n p n i,k+1 p k+1 +α i,k+2 p k+2 +...+α i,n p n )
i=1
|          | m n      |        |          | m n n                      |        |        |     |     |     |     |     |
| -------- | -------- | ------ | -------- | -------------------------- | ------ | ------ | --- | --- | --- | --- | --- |
| (cid:88) | (cid:88) | pTp    |          | (cid:88) (cid:88) (cid:88) | pTp    |        |     |     |     |     |     |
| =        |          | α ij j | j α ij + |                            | α ij j | L α iL |     |     |     |     |     |
| i=1j=k+1 |          |        |          | i=1j=k+1L=k+1,L(cid:54)=k  |        |        |     |     |     |     |     |
m n
| (cid:88) | (cid:88) | α2  | (∵pTp | =1,pTp |                    |     |     |     |     |     |     |
| -------- | -------- | --- | ----- | ------ | ------------------ | --- | --- | --- | --- | --- | --- |
| =        |          |     |       | j      | j =0 ∀i(cid:54)=j) |     |     |     |     |     |     |
|          |          | ij  |       | j i    |                    |     |     |     |     |     |     |
i=1j=k+1
m n
| (cid:88) | (cid:88) | (cid:0) xTp | (cid:1)2 |     |     |     |     |     |     |     |     |
| -------- | -------- | ----------- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
| =        |          | j           |          |     |     |     |     |     |     |     |     |
i
i=1j=k+1
46/71
|     |     |     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture6 |     |     |
| --- | --- | --- | --- | -------------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

| We want | to minimize | e   |     |     |     |     |     |
| ------- | ----------- | --- | --- | --- | --- | --- | --- |
n
(cid:88)
|     |            | pTmCp |     |      | pTp      |               |     |
| --- | ---------- | ----- | --- | ---- | -------- | ------------- | --- |
|     | min        |       | j   | s.t. | j = 1 ∀j | = k+1,k+2,··· | ,n  |
| p   | ,p ,···,pn | j     |     |      | j        |               |     |
|     | k+1 k+2    |       |     |      |          |               |     |
j=k+1
The solution to the above problem is given by the eigen vectors corresponding to
| the smallest | eigen values | of  | C (Proof | : refer | Slide 26). |     |     |
| ------------ | ------------ | --- | -------- | ------- | ---------- | --- | --- |
Thus we select P = p ,p ,··· ,p as eigen vectors of C and retain only top-k eigen
|     |     | 1 2 | n   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
vectors to express the data [or discard the eigen vectors k+1,··· ,n]
47/71
|     |     | Prof. MiteshM.Khapra |     |     | CS7015(DeepLearning): | Lecture6 |     |
| --- | --- | -------------------- | --- | --- | --------------------- | -------- | --- |

Key Idea
Minimize the error in reconstructing x after projecting the data on to a new basis.
i
48/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

Let’s look at the ‘Reconstruction Error’ in the context of our toy example
49/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

y
Consider the point x = [3.3,3] in the
original data
√
α = xTu = 6.3/ 2
1 1 √
α = xTu = −0.3/ 2
2 2
the perfect reconstruction of x is
(3.3,3)
given by (using n = 2 dimensions)
u u
2 1 (cid:2) (cid:3)
x = α u +α u = 3.3 3
1 1 2 2
x
But we are going to reconstruct it
using fewer (only k = 1 < n
u = [1,1] and u = [−1,1] are the
1 2 dimensions, ignoring the low variance
new basis vectors
u dimension)
2
Let us convert them to unit vectors
u 1 = (cid:104) √1 2 √1 2 (cid:105) & u 2 = (cid:104) √−1 2 √1 2 (cid:105) xˆ = α 1 u 1 = (cid:2) 3.15 3.15 (cid:3)
(reconstruction with minimum error)
50/71
Prof. MiteshM.Khapra CS7015(DeepLearning): Lecture6

Recap
The eigen vectors of a matrix with distinct eigenvalues are linearly independent
The eigen vectors of a square symmetric matrix are orthogonal
PCA exploits this fact by representing the data using a new basis comprising
only the top-k eigen vectors
The n−k dimensions which contribute very little to the reconstruction error
are discarded
These are also the directions along which the variance is minimum
51/71
Prof. MiteshM.Khapra CS7015(DeepLearning): Lecture6

| Module | 6.6 : | PCA : Interpretation | 3   |     |
| ------ | ----- | -------------------- | --- | --- |
52/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

| We started | off | with the following | wishlist |     |     |     |
| ---------- | --- | ------------------ | -------- | --- | --- | --- |
We are interested in representing the data using fewer dimensions such that
| the           | dimensions | have low   | covariance   |        |                |     |
| ------------- | ---------- | ---------- | ------------ | ------ | -------------- | --- |
| the           | dimensions | have high  | variance     |        |                |     |
| So far we     | have       | paid a lot | of attention | to     | the covariance |     |
| It has indeed | played     | a central  | role         | in all | our analysis   |     |
But what about variance? Have we achieved our stated goal of high variance
along dimensions?
To answer this question we will see yet another interpretation of PCA
53/71
|     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |
| --- | --- | -------------------- | --- | --------------------- | --- | -------- |

| The ith dimension | of  | the transformed | data | Xˆ is | given by |     |     |
| ----------------- | --- | --------------- | ---- | ----- | -------- | --- | --- |
Xˆ
|              |       |                |          | = Xp |     |     |     |
| ------------ | ----- | -------------- | -------- | ---- | --- | --- | --- |
|              |       |                | i        | i    |     |     |     |
| The variance | along | this dimension | is given | by   |     |     |     |
XˆTXˆ
1
|     | i i = | pT XTXp |     |     |     |     |     |
| --- | ----- | ------- | --- | --- | --- | --- | --- |
|     |       | i       | i   |     |     |     |     |
m m
|     |     | (cid:124) (cid:123)(cid:122) | (cid:125) |     |     |     |     |
| --- | --- | ---------------------------- | --------- | --- | --- | --- | --- |
1
|     | =   | pTλ p   | [∵  | p is | the eigen vector | of XTX] |     |
| --- | --- | ------- | --- | ---- | ---------------- | ------- | --- |
|     |     | m i i i |     | i    |                  |         |     |
1
|     | =   | λ pTp |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- |
i i i
|     |     | m (cid:124)(cid:123)(cid:122)(cid:125) |     |     |     |     |     |
| --- | --- | -------------------------------------- | --- | --- | --- | --- | --- |
=1
λ
i
=
m
Thus the variance along the ith dimension (ith eigen vector of XTX) is given
| by the | corresponding | (scaled) | eigen | value. |     |     |     |
| ------ | ------------- | -------- | ----- | ------ | --- | --- | --- |
Hence, we did the right thing by discarding the dimensions (eigenvectors)
| corresponding |     | to lower eigen       | values! |                       |     |          | 54/71 |
| ------------- | --- | -------------------- | ------- | --------------------- | --- | -------- | ----- |
|               |     | Prof. MiteshM.Khapra |         | CS7015(DeepLearning): |     | Lecture6 |       |

| A Quick Summary |             |                 |        |     |
| --------------- | ----------- | --------------- | ------ | --- |
| We have seen    | 3 different | interpretations | of PCA |     |
It ensures that the covariance between the new dimensions is minimized
It picks up dimensions such that the data exhibits a high variance across these
dimensions
It ensures that the data can be represented using less number of dimensions
55/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

| Module | 6.7 : | PCA : Practical | Example |     |
| ------ | ----- | --------------- | ------- | --- |
56/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

|     | Consider     | we    | are given    | a          | large       | number  | of  |
| --- | ------------ | ----- | ------------ | ---------- | ----------- | ------- | --- |
|     | images of    | human | faces        | (say,      | m images)   |         |     |
|     | Each image   | is    | 100×100      | [10K       | dimensions] |         |     |
|     | We would     | like  | to represent |            | and         | store   | the |
|     | images using |       | much fewer   | dimensions |             | (around |     |
50-200)
|     | We construct |     | a matrix | X ∈ | Rm×10K |     |     |
| --- | ------------ | --- | -------- | --- | ------ | --- | --- |
Eachrowofthematrixcorrespondsto1image
|     | Each image |     | is represented |     |     | using | 10K |
| --- | ---------- | --- | -------------- | --- | --- | ----- | --- |
dimensions
57/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture6 |     |     |     |
| -------------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

Rm×10K
|     | X ∈ |     | (as explained |     | on the | previous |     |
| --- | --- | --- | ------------- | --- | ------ | -------- | --- |
slide)
|     | We retain     |     | the    | top | 100       | dimensions |     |
| --- | ------------- | --- | ------ | --- | --------- | ---------- | --- |
|     | corresponding |     | to the | top | 100 eigen | vectors    | of  |
XTX
|     | Note that                   | XTX | is a | n×n | matrix | so its     | eigen |
| --- | --------------------------- | --- | ---- | --- | ------ | ---------- | ----- |
|     | vectorswillbendimensional(n |     |      |     | =      | 10K inthis |       |
case)
|     | We can            | convert | each    | eigen       | vector into  | a     | 100×  |
| --- | ----------------- | ------- | ------- | ----------- | ------------ | ----- | ----- |
|     | 100 matrix        | and     | treat   | it as       | an image     |       |       |
|     | Let’s see         | what    | we get  |             |              |       |       |
|     | What we           | have    | plotted | here        | are the      | first | 16    |
|     | eigenvectorsofXTX |         |         | (basically, | treatingeach |       |       |
|     | 10K dimensional   |         | eigen   | vector      | as a         | 100   | × 100 |
|     | dimensional       | image)  |         |             |              |       |       |
58/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture6 |     |     |     |
| -------------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     |     |     |     |     |     | These              | images       | are       | called       | eigenfaces  |
| --- | --- | --- | --- | --- | --- | ------------------ | ------------ | --------- | ------------ | ----------- |
|     |     |     |     |     |     | and form           | a basis      | for       | representing | any         |
|     |     |     |     |     |     | face in            | our database |           |              |             |
|     |     |     |     |     |     | In other           | words,       | we        | can now      | represent   |
|     |     |     |     |     |     | a given            | image        | (face)    |              | as a linear |
|     |     |     |     |     |     | combination        | of           | these     | eigen        | faces       |
|     |     |     |     |     |     | In practice,       |              | we just   | need         | to store    |
|     |     |     |     |     |     | p ,p ,···          | ,p           | (one time | storage)     |             |
|     |     |     |     |     |     | 1 2                | k            |           |              |             |
|     |     |     |     |     |     | Then               | for each     | image     |              | i we just   |
|     |     |     |     |     |     | need               | to store     | the       | scalar       | values      |
|     |     |     |     |     |     | α ,α               | ,··· ,α      |           |              |             |
|     |     |     |     |     |     | i1 i2              |              | ik        |              |             |
|     |     |     |     |     |     | This significantly |              | reduces   |              | the storage |
|     |     |     |     |     |     | cost without       |              | much      | loss         | in image    |
quality
| 1 2               | 4        |      | 8        | 12       |          | 16   |     |     |     |     |
| ----------------- | -------- | ---- | -------- | -------- | -------- | ---- | --- | --- | --- | --- |
| (cid:88) (cid:88) | (cid:88) |      | (cid:88) | (cid:88) | (cid:88) |      |     |     |     |     |
| α p               | α p      | α p  | α        | p        | α p      | α p  |     |     |     |     |
| 1i i              | 1i i     | 1i i |          | 1i i     | 1i i     | 1i i |     |     |     |     |
59/71
| i=1 i=1 | i=1 |       | i=1            | i=1 | i=1                   |     |     |          |     |     |
| ------- | --- | ----- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |
|         |     | Prof. | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture6 |     |     |

| Module | 6.8 : | Singular Value | Decomposition |     |
| ------ | ----- | -------------- | ------------- | --- |
60/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | --- | -------------------- | --------------------- | -------- |

Let us get some more perspective on eigen vectors before moving ahead
61/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |

Let v ,v ,··· ,v be the eigen vectors of A and let λ ,λ ,··· ,λ be
| 1 2           | n            |       |            |           | 1 2 | n   |
| ------------- | ------------ | ----- | ---------- | --------- | --- | --- |
| corresponding | eigen values |       |            |           |     |     |
|               | Av = λ       | v ,Av | = λ v ,··· | ,Av = λ v |     |     |
|               | 1            | 1 1 2 | 2 2        | n n       | n   |     |
Rn
If a vector x in is represented using v ,v ,··· ,v as basis then
|     |     |     | 1 2 | n   |     |     |
| --- | --- | --- | --- | --- | --- | --- |
n
(cid:88)
|     |     | x = | α v |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
i i
i=1
|     |        |          | n      | n        |     |     |
| --- | ------ | -------- | ------ | -------- | --- | --- |
|     |        | (cid:88) |        | (cid:88) |     |     |
|     | Now,Ax | =        | α Av = | α λ v    |     |     |
|     |        |          | i i    | i i i    |     |     |
|     |        | i=1      |        | i=1      |     |     |
The matrix multiplication reduces to a scalar multiplication if the eigen vectors
| of A are used | as a basis. |     |     |     |     |     |
| ------------- | ----------- | --- | --- | --- | --- | --- |
62/71
|     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |     |     |
| --- | -------------------- | --- | --------------------- | -------- | --- | --- |

Rn×n)
So far all the discussion was centered around square matrices (A ∈
Rm×n?
What about rectangular matrices A ∈ Can they have eigen vectors?
| Is it possible | to have A | x =     | x ? Not possible | !   |
| -------------- | --------- | ------- | ---------------- | --- |
|                |           | m×n n×1 | n×1              |     |
The result of A x is a vector belonging to Rm (whereas x ∈ Rn)
m×n n×1
So do we miss out on the advantage that a basis of eigen vectors provides
for square matrices (i.e. converting matrix multiplications into scalar
multiplications)?
We will see the answer to this question over the next few slides
63/71
|     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | -------------------- | --- | --------------------- | -------- |

Rn →Rm
| Note that matrix | A m×n provides | a transformation |     |     |
| ---------------- | -------------- | ---------------- | --- | --- |
What if we could have pairs of vectors (v ,u ),(v ,u ),··· ,(v ,u ) such that v ∈ Rn,
|     |     | 1 1 2 2 | k k | i   |
| --- | --- | ------- | --- | --- |
∈Rm
| u i and | Av i =σ i u i |     |     |     |
| ------- | ------------- | --- | --- | --- |
Rn
Further let’s assume that v 1 ,··· ,v k ,··· ,v n are orthogonal & thus form a basis V in
Similarly let’s assume that u ,··· ,u ,··· ,u are orthogonal & thus form a basis U in Rm
1 k m
Now what if every vector x∈Rn is represented using the basis V
k
(cid:88)
x= α v [note we are using k instead of n ; will clarify this in a minute]
i i
i=1
k
(cid:88)
| Ax= α | Av  |     |     |     |
| ----- | --- | --- | --- | --- |
i i
i=1
| (cid:88) k |     |     |     |     |
| ---------- | --- | --- | --- | --- |
| = α        | σ u |     |     |     |
i i i
i=1
Once again the matrix multiplication reduces to a scalar multiplication
64/71
|     | Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |     |
| --- | -------------------- | --------------------- | -------- | --- |

| Let’s look | at a geometric | interpretation | of this |
| ---------- | -------------- | -------------- | ------- |
65/71
| Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| ----- | -------------- | --------------------- | -------- |

A
R
| Rn   |     | C   | m   |     |
| ---- | --- | --- | --- | --- |
| pace |     |     | olu |     |
m
| w s  |     |     | n sp  |     |
| ---- | --- | --- | ----- | --- |
| Ro A |     |     | of    |     |
| f    |     |     | A ace |     |
o
dim=k=rank(A)
dim=k=rank(A)
Rn
- Space of all vectors which can multiply with A to give Ax [ this is the space of
| inputs of the | function] |     |     |     |
| ------------- | --------- | --- | --- | --- |
Rm
| - Space of        | all vectors which | are outputs | of the function | Ax  |
| ----------------- | ----------------- | ----------- | --------------- | --- |
| We are interested | in finding        | a basis U,  | V such that     |     |
| V - basis         | for inputs        |             |                 |     |
| U - basis         | for outputs       |             |                 |     |
such that if the inputs and outputs are represented using this basis then the operation
| Ax reduces to | a scalar operation |     |     |     |
| ------------- | ------------------ | --- | --- | --- |
66/71
|     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture6 |
| --- | -------------------- | --- | --------------------- | -------- |

What do we mean by saying that dimension of rowspace is k? If x ∈ Rn then
| why is | the dimension | not n. |     |     |     |
| ------ | ------------- | ------ | --- | --- | --- |
It means that of all the possible vectors in Rn only a subspace of vectors lying
in Rk can act as inputs to Ax and produce a non-zero output. The remaining
Rn−k
| vectors  | in will   | produce a    | zero output  |     |     |
| -------- | --------- | ------------ | ------------ | --- | --- |
| Hence we | need only | k dimensions | to represent | x   |     |
k
(cid:88)
|     |     |     | x = α | v   |     |
| --- | --- | --- | ----- | --- | --- |
i i
i=1
67/71
|     |     | Prof. MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture6 |
| --- | --- | -------------------- | --------------------- | --- | -------- |

| Let’s | look at | a way | of writing | this  | as a matrix | operation |       |     |
| ----- | ------- | ----- | ---------- | ----- | ----------- | --------- | ----- | --- |
|       |         |       | Av = σ     | u ,Av | = σ u       | ,··· ,Av  | = σ u |     |
|       |         |       | 1          | 1 1   | 2 2         | 2         | k k   | k   |
|       |         |       | A          | V     | = U         | Σ         |       |     |
|       |         |       | m×n        | n×k   | m×k         | k×k       |       |     |
(cid:124)(cid:123)(cid:122)(cid:125)
diagonalmatrix
| If we | have | k   | orthogonal | vectors | (V  | ) then | using | Gram Schmidt |
| ----- | ---- | --- | ---------- | ------- | --- | ------ | ----- | ------------ |
n×k
orthogonalization, we can find n−k more orthogonal vectors to complete the
Rn
| basis | for  | [We can | do the | same    | for U] |         |      |       |
| ----- | ---- | ------- | ------ | ------- | ------ | ------- | ---- | ----- |
|       |      |         |        | A V     | = U    | Σ       |      |       |
|       |      |         |        | m×n n×n |        | m×m m×n |      |       |
|       | UTAV | =       | Σ [U−1 | = UT]   | A      | = UΣVT  | [V−1 | = VT] |
Σ is a diagonal matrix with only the first k diagonal elements as non-zero
| Now | the question |     | is how do | we find | V, U | and Σ |     |     |
| --- | ------------ | --- | --------- | ------- | ---- | ----- | --- | --- |
68/71
|     |     |     | Prof. MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture6 |     |
| --- | --- | --- | -------------------- | --- | --------------------- | --- | -------- | --- |

| Suppose | V, U and Σ exist, | then |     |     |
| ------- | ----------------- | ---- | --- | --- |
ATA = (UΣVT)T(UΣVT)
VΣTUTUΣVT
=
ATA = VΣ2VT
| What does | this look like? | Eigen Value | decomposition | of ATA |
| --------- | --------------- | ----------- | ------------- | ------ |
| Similarly | we can show     | that        |               |        |
|           |                 | AAT         | UΣ2UT         |        |
=
Thus U and V are the eigen vectors of AAT and ATA respectively and Σ2 = Λ
where Λ is the diagonal matrix containing eigen values of ATA
69/71
|     | Prof. | MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| --- | ----- | -------------- | --------------------- | -------- |

   
↑ ··· ↑    
σ ← v →
1 1
   A    =   u 1 ··· u k      ...     . . .  
σ ← v →
↓ ··· ↓ k k×k k k×n
m×n m×k
k
(cid:88)
= σ u vT
i i i
i=1
Theorem:
σ u vT is the best rank-1 approximation of the matrix A. (cid:80)2 σ u vT is the best
1 1 1 i=1 i i i
rank-2 approximation of matrix A. In general, (cid:80)k σ u vT is the best rank-k
i=1 i i i
approximation of matrix A. In other words, the solution to
min(cid:107)A−B(cid:107)2 is given by :
F
B =U Σ VT (minimizes reconstruction error of A)
.,k k,k k,.
70/71
Prof. MiteshM.Khapra CS7015(DeepLearning): Lecture6

(cid:112)
| σ i = λ   | i = singular value | of A |
| --------- | ------------------ | ---- |
| U = left  | singular matrix    | of A |
| V = right | singular matrix    | of A |
71/71
| Prof. MiteshM.Khapra | CS7015(DeepLearning): | Lecture6 |
| -------------------- | --------------------- | -------- |
