| CS7015 | (Deep Learning) | : Lecture | 8   |
| ------ | --------------- | --------- | --- |
Regularization: Bias Variance Tradeoff, l2 regularization, Early stopping,
Dataset augmentation, Parameter sharing and tying, Injecting noise at input,
|     | Ensemble methods, | Dropout   |     |
| --- | ----------------- | --------- | --- |
|     | Mitesh            | M. Khapra |     |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

Acknowledgements
| Chapter      | 7, Deep | Learning | book               |     |     |
| ------------ | ------- | -------- | ------------------ | --- | --- |
| Ali Ghodsi’s | Video   | Lectures | on Regularizationa |     |     |
Overfittingb
| Dropout: | A Simple        | Way | to Prevent | Neural Networks | from |
| -------- | --------------- | --- | ---------- | --------------- | ---- |
| aLecture | 2.1 and Lecture | 2.2 |            |                 |      |
bDropout
2/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | --- | -------------- | --------------------- | -------- |

| Module | 8.1 : Bias | and Variance |     |
| ------ | ---------- | ------------ | --- |
3/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

We will begin with a quick overview of bias, variance and the trade-off between
them.
4/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

|     |     |     |     | Let us      | consider | the       | problem   | of    | fitting a curve |
| --- | --- | --- | --- | ----------- | -------- | --------- | --------- | ----- | --------------- |
|     |     |     |     | through     | a given  | set       | of points |       |                 |
|     |     |     |     | We consider | two      | models    | :         |       |                 |
|     |     |     |     | Simple      |          | y = fˆ(x) | =         | w x+w |                 |
|     |     |     |     |             |          |           |           | 1     | 0               |
(degree:1)
Simple
25
(cid:88)
|     |     |     |     | Complex     |     | y = fˆ(x) | =   | w   | xi+w |
| --- | --- | --- | --- | ----------- | --- | --------- | --- | --- | ---- |
|     |     |     |     | (degree:25) |     |           |     |     | i 0  |
i=1
Complex
|            |               |      |       | Note that    | in    | both cases    | we       | are      | making an as- |
| ---------- | ------------- | ---- | ----- | ------------ | ----- | ------------- | -------- | -------- | ------------- |
| The points | were drawn    | from | a si- |              |       |               |          |          |               |
|            |               |      |       | sumption     | about | how           | y is     | related  | to x. We      |
| nusoidal   | function (the | true | f(x)) |              |       |               |          |          |               |
|            |               |      |       | have no      | idea  | about         | the true | relation | f(x)          |
|            |               |      |       | The training |       | data consists |          | of 100   | points        |
5/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture8 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     |     |     | We sample | 25 points | from  | the     | training | data |
| --- | --- | --- | --------- | --------- | ----- | ------- | -------- | ---- |
|     |     |     | and train | a simple  | and a | complex | model    |      |
Simple
|     |     |     | We repeat | the process  |       | ‘k’ times |        | to train  |
| --- | --- | --- | --------- | ------------ | ----- | --------- | ------ | --------- |
|     |     |     | multiple  | models (each | model |           | sees a | different |
Complex
|              |               |      | sample  | of the training    | data) |      |       |       |
| ------------ | ------------- | ---- | ------- | ------------------ | ----- | ---- | ----- | ----- |
| The points   | were drawn    | from |         |                    |       |      |       |       |
|              |               |      | We make | a few observations |       | from | these | plots |
| a sinusoidal | function (the | true |         |                    |       |      |       |       |
f(x))
6/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- | --- |

7/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

|     | Simple   | models trained | on different   | samples of |
| --- | -------- | -------------- | -------------- | ---------- |
|     | the data | do not differ  | much from each | other      |
Howevertheyareveryfarfromthetruesinus-
|     | oidal curve | (under | fitting) |     |
| --- | ----------- | ------ | -------- | --- |
Ontheotherhand,complexmodelstrainedon
differentsamplesofthedataareverydifferent
|     | from each | other (high | variance) |     |
| --- | --------- | ----------- | --------- | --- |
8/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |
| -------------- | --------------------- | --- | -------- | --- |

|     |     |     |     | Let f(x) | be   | the true | model         | (sinusoidal |       | in this   |
| --- | --- | --- | --- | -------- | ---- | -------- | ------------- | ----------- | ----- | --------- |
|     |     |     |     | case)    | and  | fˆ(x) be | our estimate  |             | of    | the model |
|     |     |     |     | (simple  | or   | complex, | in this       | case)       | then, |           |
|     |     |     |     |          |      | (fˆ(x))  | E[fˆ(x)]−f(x) |             |       |           |
|     |     |     |     |          | Bias | =        |               |             |       |           |
E[fˆ(x)]
|     |     |     |     |     | is  | the average | (or | expected) |     | value of |
| --- | --- | --- | --- | --- | --- | ----------- | --- | --------- | --- | -------- |
the model
|     |     |     |     | We can | see   | that for | the   | simple  | model | the av-  |
| --- | --- | --- | --- | ------ | ----- | -------- | ----- | ------- | ----- | -------- |
|     |     |     |     | erage  | value | (green   | line) | is very | far   | from the |
fˆ(x)
Green Line: Average value of true value f(x) (sinusoidal function)
| for the simple  | model      |        |          |                 |       |        |       |         |          |        |
| --------------- | ---------- | ------ | -------- | --------------- | ----- | ------ | ----- | ------- | -------- | ------ |
| Blue Curve:     | Average    | value  | of fˆ(x) |                 |       |        |       |         |          |        |
|                 |            |        |          | Mathematically, |       | this   | means |         | that the | simple |
| for the complex | model      |        |          |                 |       |        |       |         |          |        |
|                 |            |        |          | model           | has   | a high | bias  |         |          |        |
| Red Curve:      | True model | (f(x)) |          |                 |       |        |       |         |          |        |
|                 |            |        |          | On the          | other | hand,  | the   | complex | model    | has a  |
low bias
9/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture8 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- | --- |

|     | We  | now define, |            |                      |                  |     |
| --- | --- | ----------- | ---------- | -------------------- | ---------------- | --- |
|     |     |             | (fˆ(x))    | E[(fˆ(x)−E[fˆ(x)])2] |                  |     |
|     |     | Variance    |            | =                    |                  |     |
|     |     | (Standard   | definition |                      | from statistics) |     |
Roughlyspeakingittellsushowmuchthedif-
fˆ(x)’s
|     | ferent |       | (trained    | on   | different | samples of |
| --- | ------ | ----- | ----------- | ---- | --------- | ---------- |
|     | the    | data) | differ from | each | other     |            |
Itisclearthatthesimplemodelhasalowvari-
|     | ance | whereas | the | complex | model has | a high |
| --- | ---- | ------- | --- | ------- | --------- | ------ |
variance
10/1
| MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture8 |     |     |
| -------------- | --- | --------------------- | --- | -------- | --- | --- |

|     | In summary      | (informally) |           |               |          |
| --- | --------------- | ------------ | --------- | ------------- | -------- |
|     | Simple model:   | high         | bias,     | low variance  |          |
|     | Complex         | model: low   | bias,     | high variance |          |
|     | There is always | a            | trade-off | between       | the bias |
and variance
Bothbiasandvariancecontributetothemean
|     | square error. | Let | us see | how |     |
| --- | ------------- | --- | ------ | --- | --- |
11/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

| Module | 8.2 : Train | error vs | Test error |
| ------ | ----------- | -------- | ---------- |
12/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

Consideranewpoint(x,y)whichwasnot
|     | seen during | training |     |     |
| --- | ----------- | -------- | --- | --- |
We can show that
fˆ(x)
|     | If we use | the model | to predict | the |
| --- | --------- | --------- | ---------- | --- |
E[(y−fˆ(x))2] = Bias2 value of y then the mean square error is
given by
+Variance
+σ2 (irreducible error)
E[(y−fˆ(x))2]
See proof here
|     | (average square | error in       | predicting | y for |
| --- | --------------- | -------------- | ---------- | ----- |
|     | many such       | unseen points) |            |       |
13/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |     |
| -------------- | --------------------- | -------- | --- | --- |

| rorre High | bias        | High variance |     |     |     |     |     |
| ---------- | ----------- | ------------- | --- | --- | --- | --- | --- |
|            | Sweet spot- |               |     |     |     |     |     |
fˆ(x)
|     |          |          | The parameters |     | of  | (all w | ’s) are trained |
| --- | -------- | -------- | -------------- | --- | --- | ------ | --------------- |
|     | -perfect | tradeoff |                |     |     |        | i               |
)}n
|     | -ideal model |     | using a | training | set {(x | i ,y i |     |
| --- | ------------ | --- | ------- | -------- | ------- | ------ | --- |
i=1
complexity
However,attesttimeweareinterestedineval-
|     |     |     | uating    | the model | on a | validation | (unseen) set |
| --- | --- | --- | --------- | --------- | ---- | ---------- | ------------ |
|     |     |     | which was | not used  | for  | training   |              |
model complexity This gives rise to the following two entities of
interest:
|     |     |     | train | (say, mean | square | error) |     |
| --- | --- | --- | ----- | ---------- | ------ | ------ | --- |
err
|     |     |     | test | (say, mean | square | error) |     |
| --- | --- | --- | ---- | ---------- | ------ | ------ | --- |
err
E[(y−fˆ(x))2]
= Bias2
Typicallytheseerrorsexhibitthetrendshown
+Variance
|     |     |     | in the adjacent |     | figure |     |     |
| --- | --- | --- | --------------- | --- | ------ | --- | --- |
+σ2
(irreducible error)
14/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

| Intuitions developed | so  | far |     |     |
| -------------------- | --- | --- | --- | --- |
Let there be n training points and m test (validation) points
n
1 (cid:88)
|     | train | = (y  | −fˆ(x ))2 |     |
| --- | ----- | ----- | --------- | --- |
|     |       | err i | i         |     |
n
i=1
1 n+m
|     |      | (cid:88) | −fˆ(x ))2 |     |
| --- | ---- | -------- | --------- | --- |
|     | test | =        | (y        |     |
|     |      | err m    | i i       |     |
i=n+1
As the model complexity increases train becomes overly optimistic and gives
err
fˆis
| us a wrong | picture | of how close | to f |     |
| ---------- | ------- | ------------ | ---- | --- |
The validation error gives the real picture of how close fˆis to f
We will concretize this intuition mathematically now and eventually show how
| to account | for the | optimism in the | training error |     |
| ---------- | ------- | --------------- | -------------- | --- |
15/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|             |           |          |     | Further      | we use fˆ to   | approximate | f       |
| ----------- | --------- | -------- | --- | ------------ | -------------- | ----------- | ------- |
| Let D={x    | ,y }m+n,  | then for | any |              |                |             |         |
|             | i i i=1   |          |     | and estimate | the parameters |             | using T |
| point (x,y) | we have,  |          |     |              |                |             |         |
|             |           |          |     | ⊂ D          | such that      |             |         |
|             | y i = f(x | i )+ε i  |     |              | y = fˆ(x       | )           |         |
|             |           |          |     |              | i              | i           |         |
which means that y i is related to x i We are interested in knowing
| by some   | true function | f but        | there is |     |               |      |     |
| --------- | ------------- | ------------ | -------- | --- | ------------- | ---- | --- |
| also some | noise ε in    | the relation |          |     | E[(fˆ(x )−f(x | ))2] |     |
|           |               |              |          |     | i             | i    |     |
For simplicity, we assume but we cannot estimate this directly
|     |     |     |     | because | we do not know | f   |     |
| --- | --- | --- | --- | ------- | -------------- | --- | --- |
N(0,σ2)
ε ∼
|        |              |          |     | We will    | see how to estimate   |     | this em- |
| ------ | ------------ | -------- | --- | ---------- | --------------------- | --- | -------- |
|        |              |          |     | pirically  | using the observation |     | y &      |
| and of | course we do | not know | f   |            |                       |     | i        |
|        |              |          |     | prediction | yˆ i                  |     |          |
16/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture8 |     |     |
| --- | --- | -------------- | --- | --------------------- | -------- | --- | --- |

|           |       |      | )2] E[(fˆ(x |     |           | )2]   |       |       |           |      |
| --------- | ----- | ---- | ----------- | --- | --------- | ----- | ----- | ----- | --------- | ---- |
|           | E[(yˆ | −y   | =           |     | )−f(x )−ε |       | (y    | = f(x | )+ε       | )    |
|           |       | i i  |             |     | i i       | i     | i     |       | i i       |      |
|           |       |      | E[(fˆ(x     |     | ))2−2ε    |       | (fˆ(x |       | ))+ε2]    |      |
|           |       |      | =           |     | )−f(x     |       |       | )−f(x |           |      |
|           |       |      |             |     | i i       |       | i     | i     | i         | i    |
|           |       |      | E[(fˆ(x     |     | ))2]−2E[ε |       | (fˆ(x |       | ))]+E[ε2] |      |
|           |       |      | =           |     | )−f(x     |       |       | )−f(x |           |      |
|           |       |      |             |     | i i       |       | i     | i     | i         | i    |
| ∴ E[(fˆ(x |       | ))2] |             |     | )2]       | E[ε2] |       | (fˆ(x |           |      |
|           | )−f(x |      | = E[(yˆ     |     | −y −      |       | + 2E[ | ε     | )−f(x     | )) ] |
|           | i     | i    |             | i   | i         | i     |       | i     | i         | i    |
17/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

We will take a small detour to understand how to empirically estimate an
| Expectation | and then return | to our derivation |     |     |
| ----------- | --------------- | ----------------- | --- | --- |
18/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Suppose | we have observed | the goals    | scored(z) | in k matches | as  |
| ------- | ---------------- | ------------ | --------- | ------------ | --- |
| z = 2,  | z = 1, z =       | 0, ... z = 2 |           |              |     |
| 1       | 2 3              | k            |           |              |     |
Now we can empirically estimate E[z] i.e. the expected number of goals scored
as
k
1 (cid:88)
E[z] = z
i
k
i=1
Analogy with our derivation: We have a certain number of observations y &
i
| predictions | yˆ using | which we can | estimate |     |     |
| ----------- | -------- | ------------ | -------- | --- | --- |
i
m
1 (cid:88)
|     |     | E[(yˆ −y | )2] = | (yˆ −y | )2  |
| --- | --- | -------- | ----- | ------ | --- |
|     |     | i        | i     | i i    |     |
m
i=1
19/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |
| --- | --- | -------------- | --------------------- | --- | -------- |

| ... returning | back to | our derivation |     |     |
| ------------- | ------- | -------------- | --- | --- |
20/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

E[(fˆ(x )−f(x ))2] = E[(yˆ −y )2] − E[ε2] + 2E[ ε (fˆ(x )−f(x )) ]
|     | i i |     | i   | i   | i   |     |     | i i | i   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
We can empirically evaluate R.H.S using training observations or test observa-
tions
| Case    | 1: Using   | test observations |     |          |       |     |            |        |       |       |      |
| ------- | ---------- | ----------------- | --- | -------- | ----- | --- | ---------- | ------ | ----- | ----- | ---- |
|         |            |                   | n+m |          |       |     | n+m        |        |       |       |      |
| E[(fˆ(x |            |                   | 1   | (cid:88) |       |     | 1 (cid:88) |        | (fˆ(x |       |      |
|         | )−f(x ))2] | =                 |     | (yˆ      | −y )2 | −   |            | ε2 + 2 | E[ ε  | )−f(x | )) ] |
|         | i i        |                   | m   |          | i i   |     | m          | i      | i     | i     | i    |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     | trueerror |     | i=n+1 |     |     |     | i=n+1 |     |     |     |     |
| --- | --------- | --- | ----- | --- | --- | --- | ----- | --- | --- | --- | --- |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125) =covariance(εi,fˆ(xi)−f(xi))
|     |     |     | empiricalestimationof |     |     | error | smallconstant |     |     |     |     |
| --- | --- | --- | --------------------- | --- | --- | ----- | ------------- | --- | --- | --- | --- |
∵
|     | covariance(X,Y) |     | = E[(X       | −µ  | )(Y | −µ    | )]      |        |        |       |     |
| --- | --------------- | --- | ------------ | --- | --- | ----- | ------- | ------ | ------ | ----- | --- |
|     |                 |     |              |     | X   |       | Y       |        |        |       |     |
|     |                 |     | = E[(X)(Y    |     | −µ  | )](if | µ =     | E[X] = | 0)     |       |     |
|     |                 |     |              |     | Y   |       | X       |        |        |       |     |
|     |                 |     | = E[XY]−E[Xµ |     |     | ] =   | E[XY]−µ |        | E[X] = | E[XY] |     |
|     |                 |     |              |     |     | Y     |         | Y      |        |       |     |
21/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

| E[(fˆ(x   |     |                    | ))2]      |     |     |     |     |     |     |     |
| --------- | --- | ------------------ | --------- | --- | --- | --- | --- | --- | --- | --- |
|           |     | i )−f(x i          |           |     |     |     |     |     |     |     |
| (cid:124) |     | (cid:123)(cid:122) | (cid:125) |     |     |     |     |     |     |     |
trueerror
|     |     | 1 n+m    |     |     | 1 n+m    |     |           |                    |           |     |
| --- | --- | -------- | --- | --- | -------- | --- | --------- | ------------------ | --------- | --- |
|     |     | (cid:88) | )2  |     | (cid:88) | ε2  | (fˆ(x     |                    |           |     |
|     | =   | (yˆ      | −y  | −   |          | + 2 | E[ ε      | )−f(x              | )) ]      |     |
|     |     | m        | i i |     | m        | i   | i         | i                  | i         |     |
|     |     |          |     |     |          |     | (cid:124) | (cid:123)(cid:122) | (cid:125) |     |
|     |     | i=n+1    |     |     | i=n+1    |     |           |                    |           |     |
=covariance(εi,fˆ(xi)−f(xi))
|     |                       | (cid:124) (cid:123)(cid:122) | (cid:125) |               | (cid:124) (cid:123)(cid:122) | (cid:125) |     |     |     |     |
| --- | --------------------- | ---------------------------- | --------- | ------------- | ---------------------------- | --------- | --- | --- | --- | --- |
|     | empiricalestimationof |                              | error     | smallconstant |                              |           |     |     |     |     |
None of the test observations participated in the estimation of fˆ(x)[the para-
fˆ(x)
| meters | of        | were              | estimated | only       | using    | training       | data]    |     |       |         |
| ------ | --------- | ----------------- | --------- | ---------- | -------- | -------------- | -------- | --- | ----- | ------- |
| ∴      | ε ⊥ (fˆ(x | )−f(x             | ))        |            |          |                |          |     |       |         |
|        |           | i                 | i         |            |          |                |          |     |       |         |
|        | ·(fˆ(x    |                   |           |            | ]·E[fˆ(x |                | 0·E[fˆ(x |     |       |         |
| ∴      | E[ε       | )−f(x             | ))]       | = E[ε      |          | )−f(x          | ))] =    |     | )−f(x | ))] = 0 |
|        | i         | i                 | i         | i          |          | i              | i        |     | i     | i       |
| ∴      | true      | error = empirical |           | test error | +        | small constant |          |     |       |         |
Hence, we should always use a validation set(independent of the training set)
| to  | estimate | the error |     |     |     |     |     |     |     |     |
| --- | -------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
22/1
|     |     |     | MiteshM.Khapra |     |     | CS7015(DeepLearning): |     | Lecture8 |     |     |
| --- | --- | --- | -------------- | --- | --- | --------------------- | --- | -------- | --- | --- |

| Case 2: | Using training | observations |     |     |     |     |     |
| ------- | -------------- | ------------ | --- | --- | --- | --- | --- |
E[(fˆ(x
)−f(x ))2]
i i
| (cid:124) | (cid:123)(cid:122) | (cid:125) |     |     |     |     |     |
| --------- | ------------------ | --------- | --- | --- | --- | --- | --- |
trueerror
|     | 1 n      |       |     | 1 n      |        |                              |           |
| --- | -------- | ----- | --- | -------- | ------ | ---------------------------- | --------- |
|     | (cid:88) |       |     | (cid:88) |        | (fˆ(x                        |           |
| =   | (yˆ      | −y )2 | −   |          | ε2 + 2 | E[ ε )−f(x                   | )) ]      |
|     | n i      | i     |     | n        | i      | i i                          | i         |
|     |          |       |     |          |        | (cid:124) (cid:123)(cid:122) | (cid:125) |
|     | i=1      |       |     | i=1      |        |                              |           |
=covariance(εi,fˆ(xi)−f(xi))
|                       | (cid:124) (cid:123)(cid:122) | (cid:125) |     | (cid:124) (cid:123)(cid:122) | (cid:125) |     |       |
| --------------------- | ---------------------------- | --------- | --- | ---------------------------- | --------- | --- | ----- |
| empiricalestimationof |                              | error     |     | smallconstant                |           |     |       |
|                       | fˆ(x)                        |           |     |                              |           |     | fˆ(x) |
Now, ε (cid:54)⊥ because ε was used for estimating the parameters of
|     | ∴ ·(fˆ(x |     |     |     | ]·E[fˆ(x |     |     |
| --- | -------- | --- | --- | --- | -------- | --- | --- |
E[ε i i )−f(x i ))] (cid:54)= E[ε i i )−f(x i ))] (cid:54)= 0
Hence, the empirical train error is smaller than the true error and does not give
| a true picture | of the          | error    |             |     |        |     |     |
| -------------- | --------------- | -------- | ----------- | --- | ------ | --- | --- |
| But how        | is this related | to model | complexity? |     | Let us | see |     |
23/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture8 |     |
| --- | --- | -------------- | --- | --------------------- | --- | -------- | --- |

| Module | 8.3 : True | error and | Model | complexity |
| ------ | ---------- | --------- | ----- | ---------- |
24/1
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |
| --- | -------------- | --------------------- | --- | -------- |

| Using Stein’s | Lemma | (and some trickery) | we can show | that  |
| ------------- | ----- | ------------------- | ----------- | ----- |
|               |       | n                   | σ2 n        | ∂fˆ(x |
|               | 1     | (cid:88)            | (cid:88)    | )     |
|               |       | ε (fˆ(x )−f(x       | )) =        | i     |
|               |       | i i                 | i           |       |
|               | n     |                     | n           | ∂y i  |
|               |       | i=1                 | i=1         |       |
∂fˆ(xi)
When will be high? When a small change in the observation causes a
∂yi
| large change | in the estimation(fˆ) |             |     |     |
| ------------ | --------------------- | ----------- | --- | --- |
| Can you link | this to model         | complexity? |     |     |
Yes, indeed a complex model will be more sensitive to changes in observations
whereas a simple model will be less sensitive to changes in observations
| Hence, we | can say that |     |     |     |
| --------- | ------------ | --- | --- | --- |
true error = empirical train error + small constant + Ω(model complexity)
25/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

26/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

|     | Let us   | verify that   | indeed a |
| --- | -------- | ------------- | -------- |
|     | complex  | model is more | sens-    |
|     | itive to | minor changes | in the   |
data
|     | We have     | fitted           | a simple |
| --- | ----------- | ---------------- | -------- |
|     | and complex | model            | for some |
|     | given data  |                  |          |
|     | We now      | change one       | of these |
|     | data points |                  |          |
|     | The simple  | model            | does not |
|     | change      | much as compared | to       |
|     | the complex | model            |          |
27/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| -------------- | --------------------- | -------- | --- |

Hence while training, instead of minimizing the training error L (θ) we
train
should minimize
|     |     | L         |          | L(θ) |     |
| --- | --- | --------- | -------- | ---- | --- |
|     |     | min train | (θ)+Ω(θ) | =    |     |
w.r.t θ
Where Ω(θ) would be high for complex models and small for simple models
σ2 (cid:80)n ∂fˆ(xi)
| Ω(θ) acts | as an approximate | for |     |     |     |
| --------- | ----------------- | --- | --- | --- | --- |
n i=1 ∂yi
| This is | the basis for | all regularization | methods |     |     |
| ------- | ------------- | ------------------ | ------- | --- | --- |
We can show that l 1 regularization, l 2 regularization, early stopping and inject-
ing noise in input are all instances of this form of regularization.
28/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |
| --- | --- | -------------- | --------------------- | --- | -------- |

rorre High variance
High bias
σ2 (cid:80)n ∂fˆ(xi)
| Sweet spot |     |     |
| ---------- | --- | --- |
n i=1 ∂yi
| model | complexity |     |
| ----- | ---------- | --- |
Ω(θ) should ensure
that model has reas-
onable complexity
29/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

Why do we care about this Deep Neural networks are highly complex
| bias variance     | tradeoff | and | models.          |      |                  |
| ----------------- | -------- | --- | ---------------- | ---- | ---------------- |
| model complexity? |          |     | Many parameters, | many | non-linearities. |
Itiseasyforthemtooverfitanddrivetraining
|     |     |     | error to 0.   |           |                    |
| --- | --- | --- | ------------- | --------- | ------------------ |
|     |     |     | Hence we need | some form | of regularization. |
30/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Different forms | of regularization |     |     |     |
| --------------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
31/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 8.4 : | l regularization |     |
| ------ | ----- | ---------------- | --- |
2
32/1
| MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture8 |
| -------------- | --- | --------------------- | -------- |

| Different forms | of regularization |     |     |     |
| --------------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
33/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| For l | regularization | we have, |     |     |     |
| ----- | -------------- | -------- | --- | --- | --- |
2
α
|     |     | L (cid:102)(w) | = L(w)+ | (cid:107)w(cid:107)2 |     |
| --- | --- | -------------- | ------- | -------------------- | --- |
2
| For SGD | (or its variants), | we are       | interested | in  |     |
| ------- | ------------------ | ------------ | ---------- | --- | --- |
|         |                    | ∇L           | ∇L(w)+αw   |     |     |
|         |                    | (cid:102)(w) | =          |     |     |
Update rule:
|          |                   | w =            | w −η∇L(w | )−ηαw |     |
| -------- | ----------------- | -------------- | -------- | ----- | --- |
|          |                   | t+1            | t        | t     | t   |
| Requires | a very small      | modification   | to the   | code  |     |
| Let us   | see the geometric | interpretation | of       | this  |     |
34/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |
| --- | --- | -------------- | --------------------- | --- | -------- |

|     |     |     | L(w) | L   |     |     |
| --- | --- | --- | ---- | --- | --- | --- |
Assume w∗ is the optimal solution for [not (cid:102)(w)] i.e. the solution in
|             |                   | (w∗ |         | ∇L(w∗) |      |     |
| ----------- | ----------------- | --- | ------- | ------ | ---- | --- |
| the absence | of regularization |     | optimal | →      | = 0) |     |
Consider u = w−w∗. Using Taylor series approximation (upto 2nd order)
1
| L(w∗+u) |     | L(w∗)+uT∇L(w∗)+ |     | uTHu |     |     |
| ------- | --- | --------------- | --- | ---- | --- | --- |
=
2
1
|     | L(w) = | L(w∗)+(w−w∗)T∇L(w∗)+ |     |     | (w−w∗)TH(w−w∗) |     |
| --- | ------ | -------------------- | --- | --- | -------------- | --- |
2
1
|     | =   | L(w∗)+ | (w−w∗)TH(w−w∗) |     | (∵ ∇L(w∗) | = 0 ) |
| --- | --- | ------ | -------------- | --- | --------- | ----- |
2
| ∇L(w) | =   | ∇L(w∗)+H(w−w∗) |     |     |     |     |
| ----- | --- | -------------- | --- | --- | --- | --- |
H(w−w∗)
=
Now,
|     |     | ∇L (cid:102)(w) | = ∇L(w)+αw |     |     |     |
| --- | --- | --------------- | ---------- | --- | --- | --- |
H(w−w∗)+αw
=
35/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- |

Let w be the optimal solution for L(cid:101)(w) [i.e regularized loss]
(cid:101)
|     |     |     | ∵   | ∇L(cid:101)(w ) = 0 |     |
| --- | --- | --- | --- | ------------------- | --- |
(cid:101)
H(w−w∗)+αw
= 0
|     |     |     | (cid:101) | (cid:101) |     |
| --- | --- | --- | --------- | --------- | --- |
|     |     |     | ∴(H +αI)w | = Hw∗     |     |
(cid:101)
|     |     |     | ∴w  | +αI)−1Hw∗ |     |
| --- | --- | --- | --- | --------- | --- |
= (H
(cid:101)
w∗
| Notice that | if α → | 0 then | w → | [no regularization] |     |
| ----------- | ------ | ------ | --- | ------------------- | --- |
(cid:101)
| But we         | are interested | in the    | case when     | α (cid:54)= 0 |     |
| -------------- | -------------- | --------- | ------------- | ------------- | --- |
| Let us analyse | the            | case when | α (cid:54)= 0 |               |     |
36/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --- | --------------------- | -------- |

| If H is symmetric |     | Positive | Semi Definite |             |     |            |
| ----------------- | --- | -------- | ------------- | ----------- | --- | ---------- |
|                   | H = | QΛQT     | [Q is         | orthogonal, | QQT | = QTQ = I] |
+αI)−1Hw∗
|     |     | w = (H |     |     |     |     |
| --- | --- | ------ | --- | --- | --- | --- |
(cid:101)
|     |     | = (QΛQT | +αI)−1QΛQTw∗    |     |     |     |
| --- | --- | ------- | --------------- | --- | --- | --- |
|     |     | = (QΛQT | +αQIQT)−1QΛQTw∗ |     |     |     |
[Q(Λ+αI)QT]−1QΛQTw∗
=
|     |     | = QT−1           | (Λ+αI)−1Q−1QΛQTw∗ |     |         |      |
| --- | --- | ---------------- | ----------------- | --- | ------- | ---- |
|     |     | = Q(Λ+αI)−1ΛQTw∗ |                   |     | (∵ QT−1 | = Q) |
QDQTw∗
w =
(cid:101)
(Λ+αI)−1Λ,
where D = is a diagonal matrix which we will see in more detail
soon
37/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture8 |
| --- | --- | -------------- | --- | --------------------- | --- | -------- |

|     | w = Q(Λ+αI)−1ΛQTw∗ |     |     | So  | what | is happening | here? |     |
| --- | ------------------ | --- | --- | --- | ---- | ------------ | ----- | --- |
(cid:101)
|     | QDQTw∗ |     |     | w∗  | first gets | rotated | by QT | to give |
| --- | ------ | --- | --- | --- | ---------- | ------- | ----- | ------- |
=
|     |    |     |    | QTw∗ |     |     |     |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | --- |
1
λ1+α
|     |     |     |     | However |     | if α = | 0 then Q | rotates |
| --- | --- | --- | --- | ------- | --- | ------ | -------- | ------- |
|     |    | 1   |    |         |     |        |          |         |
λ2+α
| (Λ+αI)−1 | =  |     |    | QTw∗ | back        | to give  | w∗          |     |
| -------- | --- | --- | --- | ---- | ----------- | -------- | ----------- | --- |
|          |    | ... |    |      |             |          |             |     |
|          |    |     |    |      |             |          |             |     |
|          |     |     |     | If α | (cid:54)= 0 | then let | us see what | D   |
1
|     |     | λn+α |     | looks | like |     |     |     |
| --- | --- | ---- | --- | ----- | ---- | --- | --- | --- |
D = (Λ+αI)−1Λ
|     |     |     |     | So  | what | is happening | now? |     |
| --- | --- | --- | --- | --- | ---- | ------------ | ---- | --- |
|     |    |     |    |     |      |              |      |     |
λ1
λ1+α
λ2
|           |    |      |    |     |     |     |     |     |
| --------- | --- | ---- | --- | --- | --- | --- | --- | --- |
| (Λ+αI)−1Λ |     | λ2+α |     |     |     |     |     |     |
|           | =  |      |    |     |     |     |     |     |
|           |    | ...  |    |     |     |     |     |     |
|           |    |      |    |     |     |     |     |     |
λn
λn+α
38/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture8 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | -------- | --- | --- |

|     | w   | = Q(Λ+αI)−1ΛQTw∗ |     |     |     |     | Each element |     | i of QTw∗ | gets scaled |     |
| --- | --- | ---------------- | --- | --- | --- | --- | ------------ | --- | --------- | ----------- | --- |
(cid:101)
|     |     | QDQTw∗ |     |     |     |     | by λi | before | it is | rotated back | by  |
| --- | --- | ------ | --- | --- | --- | --- | ----- | ------ | ----- | ------------ | --- |
|     |     | =      |     |     |     |     | λi+α  |        |       |              |     |
|     |     |       |     |     |    |     | Q     |        |       |              |     |
1
λ1+α
|          |     |     |       |     |     |     | i f λ > > | α t h | e n λ i | = 1 |     |
| -------- | --- | --- | ----- | --- | --- | --- | --------- | ----- | ------- | --- | --- |
|          |     |    | 1     |     |    |     | i         |       | λ +     | α   |     |
|          |     |     | λ2 +α |     |     |     |           |       | i       |     |     |
| (Λ+αI)−1 |     | =  |       |     |    |     |           |       | λ       |     |     |
|          |     |    |       | ... |    |     | i f λ < < | α t h | e n i   | = 0 |     |
|          |     |    |       |     |    |     | i         |       | λ +     | α   |     |
i
|     |     |     |     |     | 1   |     | Thus only | significant |     | directions |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | ----------- | --- | ---------- | --- |
λn+α
|     |     |     |     |     |     |     | (larger | eigen | values) | will be retained. |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | ----- | ------- | ----------------- | --- |
D = (Λ+αI)−1Λ
|     |     |     |     |     |    |     |           |            |     | n          |       |
| --- | --- | ---- | --- | --- | --- | --- | --------- | ---------- | --- | ---------- | ----- |
|     |     | λ 1  |     |     |     |     |           |            |     | (cid:88) λ |       |
|     |     | λ1 + | α   |     |     |     | Effective | parameters |     | =          | i < n |
λ
|           |     |    | 2    |     |    |     |     |     |     | λ +α |     |
| --------- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | ---- | --- |
| (Λ+αI)−1Λ |     |     | λ2 + | α   |     |     |     |     |     | i    |     |
|           |     | =  |      |     |    |     |     |     |     | i=1  |     |
|           |     |    |      | ... |    |     |     |     |     |      |     |
|           |     |    |      |     |    |     |     |     |     |      |     |
λn
λn+α
39/1
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

vector(w∗)
| The weight | is getting rotated | to (w˜) |     |
| ---------- | ------------------ | ------- | --- |
All of its elements are shrinking but some are shrinking more than the others
This ensures that only important features are given high weights
40/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Module | 8.5 : Dataset | augmentation |     |
| ------ | ------------- | ------------ | --- |
41/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Different forms | of regularization |     |     |     |
| --------------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
42/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|         | 20◦ |            | 65◦     |            |
| ------- | --- | ---------- | ------- | ---------- |
| rotated | by  | rotated by | shifted | vertically |
label = 2
[given training data]
We exploit the fact that
| shifted | horizontally |     | changed some | pixels |
| ------- | ------------ | --- | ------------ | ------ |
certain transformations blurred
to the image do not
|     |     | label = | 2   |     |
| --- | --- | ------- | --- | --- |
change the label of the
| [augmented | data | = created using | some knowledge | of the |
| ---------- | ---- | --------------- | -------------- | ------ |
image.
task]
43/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |
| -------------- | --------------------- | --- | -------- | --- |

| Typically, | More data | = better learning |     |     |
| ---------- | --------- | ----------------- | --- | --- |
Works well for image classification / object recognition tasks
| Also shown | to work  | well for speech  |                 |           |
| ---------- | -------- | ---------------- | --------------- | --------- |
| For some   | tasks it | may not be clear | how to generate | such data |
44/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 8.6 : Parameter | Sharing | and tying |
| ------ | --------------- | ------- | --------- |
45/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
46/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

xˆ
h(x)
x
Parameter Sharing
Used in CNNs
|             |               |              | Parameter Tying |                      |         |
| ----------- | ------------- | ------------ | --------------- | -------------------- | ------- |
| Same filter | applied       | at different |                 |                      |         |
|             |               |              | Typically       | used in autoencoders |         |
| positions   | of the image  |              |                 |                      |         |
|             |               |              | The encoder     | and decoder          | weights |
| Or same     | weight matrix | acts on      |                 |                      |         |
are tied.
| different | input neurons |     |     |     |     |
| --------- | ------------- | --- | --- | --- | --- |
47/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| --- | --- | -------------- | --------------------- | -------- | --- |

| Module | 8.7 : Adding | Noise | to the inputs |
| ------ | ------------ | ----- | ------------- |
48/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
49/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|     | We saw     | this in Autoencoder |                 |
| --- | ---------- | ------------------- | --------------- |
|     | We can     | show that for       | a simple input  |
|     | output     | neural network,     | adding Gaus-    |
|     | sian noise | to the input        | is equivalent   |
|     | to weight  | decay (L            | regularisation) |
| xˆ  |            | 2                   |                 |
|     | Can be     | viewed as data      | augmentation    |
h(x)
x˜
P(x˜|x) ←noise process
x
50/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| -------------- | --------------------- | -------- | --- |

E[(y−y)2]
|     |     |     | We  | are interested |     | in  |     |     |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- |
(cid:101)
|     |     |     |     |     | (cid:34) |     |     | (cid:35) |     |     |     |
| --- | --- | --- | --- | --- | -------- | --- | --- | -------- | --- | --- | --- |
n
|             |     |             | (cid:104) (y−y)2 | (cid:105) | (cid:16) | (cid:88) | (cid:17)2 |     |     |     |     |
| ----------- | --- | ----------- | ---------------- | --------- | -------- | -------- | --------- | --- | --- | --- | --- |
|             | ... | ...         | E                | =E        | y+       | w ε      | −y        |     |     |     |     |
|             |     |             | (cid:101)        |           | (cid:98) | i        | i         |     |     |     |     |
| x1+ε1 x2+ε2 |     | xk+εk xn+εn |                  |           |          |          |           |     |     |     |     |
i=1
|     |        |     |     |     | (cid:32) |          |                  |           |    |     |     |
| --- | ------ | --- | --- | --- | --------- | -------- | ---------------- | --------- | --- | --- | --- |
|     |        |     |     |     |           |          | n                | (cid:33)2 |     |     |     |
|     |        | σ2) |     |     | (cid:16)  | (cid:17) | (cid:16)(cid:88) | (cid:17)  |     |     |     |
|     | ε∼N(0, |     |     | =E | y         | −y +     | w                | ε         |    |     |     |
|     |        |     |     |     | (cid:98)  |          |                  | i i       |     |     |     |
i=1
x (cid:101)i =x i +ε i (cid:34) n (cid:35) (cid:34) n (cid:35)
|           |          |                 |     |     | (cid:104)      | (cid:105) |              | (cid:88)     |                | (cid:16)(cid:88) | (cid:17)2  |
| --------- | -------- | --------------- | --- | --- | -------------- | --------- | ------------ | ------------ | -------------- | ---------------- | ---------- |
|           | n        |                 |     | =E  | (y−y)2         | +E        | 2(y−y)       |              | w ε            | +E               | w ε        |
|           | (cid:88) |                 |     |     | (cid:98)       |           | (cid:98)     |              | i i            |                  | i i        |
| y=        | w        | x               |     |     |                |           |              |              |                |                  |            |
| (cid:98)  |          | i i             |     |     |                |           |              | i=1          |                |                  | i=1        |
|           |          |                 |     |     |                |           | (cid:34)     |              | (cid:35)       |                  |            |
|           | i=1      |                 |     |     | (cid:104)      | (cid:105) |              | n            |                |                  |            |
|           | n        |                 |     |     | −y)2           |           |              | (cid:88) 2ε2 |                |                  |            |
|           | (cid:88) |                 |     | =E  | (y (cid:98)    | +0+E      |              | w i          | i              |                  |            |
| y=        | w        | x               |     |     |                |           |              |              |                |                  |            |
| (cid:101) |          | i(cid:101)i     |     |     |                |           |              | i=1          |                |                  |            |
|           | i=1      |                 |     | (∵ε | is independent |           | of ε         | and ε        | is independent |                  | of (y-y) ) |
|           |          |                 |     |     | i              |           | j            | i            |                |                  | (cid:98)   |
|           | n        | n               |     |     |                |           |              |              |                |                  |            |
|           | (cid:88) | (cid:88)        |     |     |                |           |              |              |                |                  |            |
| =         | w        | i x i + w i ε i |     |     | (cid:104)      | (cid:105) | σ2(cid:88) n |              |                |                  |            |
|           |          |                 |     |     | (y−y)2         |           |              | w2           |                |                  |            |
|           | i=1      | i=1             |     | =(E | (cid:98)       | +         |              | i (same      | as             | L 2 norm         | penalty)   |
|           | n        |                 |     |     |                |           | i=1          |              |                |                  |            |
(cid:88)
| =y+ |          | w ε |     |     |     |     |     |     |     |     |     |
| --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | (cid:98) | i i |     |     |     |     |     |     |     |     |     |
51/1
i=1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- | --- |

| Module | 8.8 : Adding | Noise | to the outputs |
| ------ | ------------ | ----- | -------------- |
52/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
53/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|     | 0 0 | 1   | 0 0 | 0 0 0 | 0 0 Hard | targets |
| --- | --- | --- | --- | ----- | -------- | ------- |
9
(cid:88)
|     |     | minimize | :   | p logq |     |     |
| --- | --- | -------- | --- | ------ | --- | --- |
i i
i=0
|     |           | true distribution | :   | p = {0,0,1,0,0,0,0,0,0,0} |     |     |
| --- | --------- | ----------------- | --- | ------------------------- | --- | --- |
|     | estimated | distribution      | :   | q                         |     |     |
Intuition
| Do not   | trust the | true labels, | they may | be noisy |     |     |
| -------- | --------- | ------------ | -------- | -------- | --- | --- |
| Instead, | use soft  | targets      |          |          |     |     |
54/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture8 |     |
| --- | --- | -------------- | --- | --------------------- | -------- | --- |

| ε ε | ε ε | ε ε                | ε ε      | ε            |
| --- | --- | ------------------ | -------- | ------------ |
| 1−ε |     |                    |          | Soft targets |
| 9 9 | 9 9 | 9 9                | 9 9      | 9            |
|     |     | ε = small positive | constant |              |
9
(cid:88)
|     | minimize | : p logq |     |     |
| --- | -------- | -------- | --- | --- |
|     |          | i        | i   |     |
i=0
|                   |              | (cid:110)ε | ε ε        | (cid:111) |
| ----------------- | ------------ | ---------- | ---------- | --------- |
| true distribution | + noise      | : p = ,    | ,1−ε, ,... |           |
|                   |              | 9          | 9 9        |           |
| estimated         | distribution | : q        |            |           |
55/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| --- | -------------- | --------------------- | -------- | --- |

| Module | 8.9 : Early | stopping |     |
| ------ | ----------- | -------- | --- |
56/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |
| -------------- | --------------------- | --- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
57/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|     |     | Track the | validation | error |     |
| --- | --- | --------- | ---------- | ----- | --- |
Error
|     |     | Have a        | patience parameter | p           |         |
| --- | --- | ------------- | ------------------ | ----------- | ------- |
|     |     | If you        | are at step        | k and there | was     |
|     |     | noimprovement | in                 | validation  | errorin |
|     |     | the previous  | p steps            | then stop   | train-  |
Validationerror
|     |     | ing and    | return the | model stored   | at  |
| --- | --- | ---------- | ---------- | -------------- | --- |
|     |     | step k−p   |            |                |     |
|     |     | Basically, | stop the   | training early | be- |
Trainingerror
|                 |         | fore it   | drives the        | training error | to 0 |
| --------------- | ------- | --------- | ----------------- | -------------- | ---- |
| k−p             | k Steps | and blows | up the validation | error          |      |
| returnthismodel | stop    |           |                   |                |      |
58/1
| MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture8 |     |     |
| -------------- | --- | --------------------- | -------- | --- | --- |

|     | Very effective | and the mostly | widely |
| --- | -------------- | -------------- | ------ |
Error
|     | used form   | of regularization    |          |
| --- | ----------- | -------------------- | -------- |
|     | Can be      | used even with other | regular- |
|     | izers (such | as l )               |          |
2
|     | How does | it act as a regularizer | ?   |
| --- | -------- | ----------------------- | --- |
Validationerror
|     | We will   | first see an intuitive | explan- |
| --- | --------- | ---------------------- | ------- |
|     | ation and | then a mathematical    | ana-    |
lysis
Trainingerror
| k−p k Steps |     |     |     |
| ----------- | --- | --- | --- |
returnthismodel stop
59/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| -------------- | --------------------- | -------- | --- |

|     |     | Recall that | the | update | rule | in SGD is |
| --- | --- | ----------- | --- | ------ | ---- | --------- |
Error
w = w −η∇w
|     |     |     | t+1 | t   | t   |     |
| --- | --- | --- | --- | --- | --- | --- |
t
(cid:88)
|     |                 |          | =           | w 0 −η | ∇w    | i     |
| --- | --------------- | -------- | ----------- | ------ | ----- | ----- |
|     | Validationerror |          |             |        | i=1   |       |
|     |                 | Let τ be | the maximum |        | value | of ∇w |
i
then
Trainingerror
|                 |         |         | |w       | −w | | ≤ ηt|τ| |          |
| --------------- | ------- | ------- | -------- | ---- | ------- | -------- |
| k−p             | k Steps |         | t+1      | 0    |         |          |
| returnthismodel | stop    |         |          |      |         |          |
|                 |         | Thus, t | controls | how  | far     | w can go |
t
|     |     | from the | initial | w 0         |     |           |
| --- | --- | -------- | ------- | ----------- | --- | --------- |
|     |     | In other | words   | it controls |     | the space |
of exploration
60/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |     |     |
| --- | -------------- | --------------------- | -------- | --- | --- | --- |

| We will now | see a mathematical | analysis | of this |     |
| ----------- | ------------------ | -------- | ------- | --- |
61/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Recall | that | the | Taylor series approximation | for | L(w) | is  |     |     |
| ------ | ---- | --- | --------------------------- | --- | ---- | --- | --- | --- |
1
| L(w) | =   | L(w∗)+(w−w∗)T∇L(w∗)+ |     | (w−w∗)TH(w−w∗) |     |     |     |     |
| ---- | --- | -------------------- | --- | -------------- | --- | --- | --- | --- |
2
1
|     |     | L(w∗)+ | (w−w∗)TH(w−w∗) |     | w∗  |            | ∇L(w∗) |        |
| --- | --- | ------ | -------------- | --- | --- | ---------- | ------ | ------ |
|     | =   |        |                |     | [   | is optimal | so     | is 0 ] |
2
| ∇(L(w)) |     | H(w−w∗) |     |     |     |     |     |     |
| ------- | --- | ------- | --- | --- | --- | --- | --- | --- |
=
| Now the | SGD | update | rule is: |     |     |     |     |     |
| ------- | --- | ------ | -------- | --- | --- | --- | --- | --- |
−η∇L(w
|     |     |     | w t = w t−1 | t−1 | )   |     |     |     |
| --- | --- | --- | ----------- | --- | --- | --- | --- | --- |
−w∗)
|     |     |     | = w −ηH(w |     |     |     |     |     |
| --- | --- | --- | --------- | --- | --- | --- | --- | --- |
t−1 t−1
|     |     |     | = (I −ηH)w | +ηHw∗ |     |     |     |     |
| --- | --- | --- | ---------- | ----- | --- | --- | --- | --- |
t−1
62/1
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

|     |     | w = (I −ηH)w | +ηHw∗ |     |
| --- | --- | ------------ | ----- | --- |
|     |     | t            | t−1   |     |
QΛQT,
| Using EVD | of H as | H =      | we get: |          |
| --------- | ------- | -------- | ------- | -------- |
|           |         | −ηQΛQT)w |         | +ηQΛQTw∗ |
w = (I
|             |        | t           | t−1           |                |
| ----------- | ------ | ----------- | ------------- | -------------- |
| If we start | with w | = 0 then we | can show that | (See Appendix) |
0
|     |     | w = Q[I | −(I −εΛ)t]QTw∗ |     |
| --- | --- | ------- | -------------- | --- |
t
ComparethiswiththeexpressionwehadforoptimumW˜
withL 2 regularization
−(Λ+αI)−1α]QTw∗
w˜ = Q[I
| We observe | that w | = w˜, if we choose | ε,t and | α such that |
| ---------- | ------ | ------------------ | ------- | ----------- |
t
|     |     | (I −εΛ)t | = (Λ+αI)−1α |     |
| --- | --- | -------- | ----------- | --- |
63/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Things to be   | remember |                  |                    |     |
| -------------- | -------- | ---------------- | ------------------ | --- |
| Early stopping | only     | allows t updates | to the parameters. |     |
If a parameter w corresponds to a dimension which is important for the loss
| L(θ) | ∂L(θ) |          |     |     |
| ---- | ----- | -------- | --- | --- |
| then | will  | be large |     |     |
∂w
∂L(θ)
However if a parameter is not important ( is small) then its updates will
∂w
be small and the parameter will not be able to grow large in ‘t(cid:48) steps
Early stopping will thus effectively shrink the parameters corresponding to less
| important | directions | (same as weight | decay). |     |
| --------- | ---------- | --------------- | ------- | --- |
64/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Module | 8.10 : Ensemble |     | methods |
| ------ | --------------- | --- | ------- |
65/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | -------------- | --------------------- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
66/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

y
final
|     |     |     | Combine             | the output     | of different | models       | to re- |
| --- | --- | --- | ------------------- | -------------- | ------------ | ------------ | ------ |
|     |     |     | duce generalization |                | error        |              |        |
| y   | y   | y   |                     |                |              |              |        |
| lr  | svm | nb  | The models          | can correspond |              | to different | clas-  |
sifiers
| y   |     |     | Itcouldbedifferentinstancesofthesameclas- |       |     |     |     |
| --- | --- | --- | ----------------------------------------- | ----- | --- | --- | --- |
|     |     |     | sifier trained                            | with: |     |     |     |
y
|     |     |     | different | hyperparameters |                 |      |     |
| --- | --- | --- | --------- | --------------- | --------------- | ---- | --- |
|     |     |     | different | features        |                 |      |     |
|     |     |     | different | samples         | of the training | data |     |
x 1 x 2 x 3 x 4
| LogisticRegression | SVM | NaiveBayes |     |     |     |     |     |
| ------------------ | --- | ---------- | --- | --- | --- | --- | --- |
67/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |
| --- | --- | -------------- | --------------------- | --- | -------- | --- | --- |

y
final
|            |                    |             | Bagging:         | form an ensemble | using          | dif-       |
| ---------- | ------------------ | ----------- | ---------------- | ---------------- | -------------- | ---------- |
|            |                    |             | ferent instances | of the           | same           | classifier |
| y lr1      | y lr2              | y lr3       |                  |                  |                |            |
|            |                    |             | From a given     | dataset,         | construct      | mul-       |
| y          | y                  | y           | tiple training   | sets by          | sampling       | with       |
|            |                    |             | replacement      | (T 1 ,T 2 ,...,T | k )            |            |
|            |                    |             | Train ith        | instance of      | the classifier | us-        |
|            |                    |             | ing training     | set T i          |                |            |
| Logistic   | Logistic           | Logistic    |                  |                  |                |            |
| Regression | Regression         | Regression  |                  |                  |                |            |
| Each model | trained with       | a different |                  |                  |                |            |
| sample of  | the data (sampling | with        |                  |                  |                |            |
replacement)
68/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |     |
| --- | --- | -------------- | --------------------- | -------- | --- | --- |

| The        | error | made by    | the    | average |     | When     | would | bagging |         | work? |
| ---------- | ----- | ---------- | ------ | ------- | --- | -------- | ----- | ------- | ------- | ----- |
| prediction |       | of all the | models | is      |     |          |       |         |         |       |
|            |       |            |        |         |     | Consider |       | a set   | of k LR | mod-  |
1 (cid:80)
|     | ε i |     |     |     |     | els |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
k i
| The     | expected  | squared | error | is : |     |         |     |       |      |        |
| ------- | --------- | ------- | ----- | ---- | --- | ------- | --- | ----- | ---- | ------ |
|         |           |         |       |      |     | Suppose |     | that  | each | model  |
|         |           |         |       |      |     | makes   | an  | error | ε on | a test |
|         | 1(cid:88) |         |       |      |     |         |     |       | i    |        |
| mse=E[( |           | ε )2]   |       |      |     |         |     |       |      |        |
|         |           | i       |       |      |     | example |     |       |      |        |
k
i
|     |      |                  |                  |               |     | Let  | ε    | be drawn     |     | from a |
| --- | ---- | ---------------- | ---------------- | ------------- | --- | ---- | ---- | ------------ | --- | ------ |
|     | 1    | (cid:88)(cid:88) | (cid:88)(cid:88) |               |     |      | i    |              |     |        |
|     | = E[ | εε               | +                | εε ]          |     |      |      |              |     |        |
|     | k2   | i                | j                | i j           |     | zero | mean | multivariate |     | nor-   |
|     |      | i i=j            |                  | i i(cid:54)=j |     |      |      |              |     |        |
mal distribution
|     | 1    | (cid:88) | (cid:88)(cid:88) |       |     |          |     |        |     |     |
| --- | ---- | -------- | ---------------- | ----- | --- | -------- | --- | ------ | --- | --- |
|     | = E[ | ε2 +     |                  | ε ε ] |     |          |     |        |     |     |
|     | k2   | i        |                  | i j   |     | Variance |     | = E[ε2 | ] = | V   |
i
|     |            | i      | i i(cid:54)=j    |         |     |            |     |     |       |       |
| --- | ---------- | ------ | ---------------- | ------- | --- | ---------- | --- | --- | ----- | ----- |
|     |            |        |                  |         |     | Covariance |     | =   | E[ε ε | ] = C |
|     | 1 (cid:88) |        | (cid:88)(cid:88) |         |     |            |     |     | i j   |       |
|     | = (        | E[ε2]+ |                  | E[εε ]) |     |            |     |     |       |       |
|     | k2         | i      |                  | i j     |     |            |     |     |       |       |
|     |            | i      | i i(cid:54)=j    |         |     |            |     |     |       |       |
1
|     | = (kV | +k(k−1)C) |     |     |     |     |     |     |     |     |
| --- | ----- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
k2
|     | 1     | k−1 |     |     |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | = V + | C   |     |     |     |     |     |     |     |     |
|     | k     | k   |     |     |     |     |     |     |     |     |
69/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- | --- |

| 1 k−1     |     | When | would bagging | work ? |     |
| --------- | --- | ---- | ------------- | ------ | --- |
| mse = V + | C   |      |               |        |     |
k k
Iftheerrorsofthemodelareperfectly
|     |     | correlated           | then V =  | C and mse         | = V |
| --- | --- | -------------------- | --------- | ----------------- | --- |
|     |     | [baggingdoesnothelp: |           | themseofthe       |     |
|     |     | ensemble             | is as bad | as the individual |     |
models]
|     |     | If the  | errors of the   | model are        | inde- |
| --- | --- | ------- | --------------- | ---------------- | ----- |
|     |     | pendent | or uncorrelated | then C           | = 0   |
|     |     | and the | mse of the      | ensemble reduces |       |
1V
to
k
|     |     | On average, | the ensemble  | will              | per- |
| --- | --- | ----------- | ------------- | ----------------- | ---- |
|     |     | form at     | least as well | as its individual |      |
members
70/1
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |     |
| --- | -------------- | --------------------- | -------- | --- | --- |

| Module 8.11 | : Dropout |     |
| ----------- | --------- | --- |
71/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

| Other forms | of regularization |     |     |     |
| ----------- | ----------------- | --- | --- | --- |
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
72/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|     | Typically       | model        |            | averaging(bagging |            |         |
| --- | --------------- | ------------ | ---------- | ----------------- | ---------- | ------- |
|     | ensemble)       | always       |            | helps             |            |         |
|     | Training        | several      |            | large             | neural     | net-    |
|     | works for       | making       |            | an ensemble       |            | is pro- |
|     | hibitively      | expensive    |            |                   |            |         |
|     | Option          | 1:           | Train      | several           |            | neural  |
|     | networks        | having       |            | different         | architec-  |         |
|     | tures(obviously |              | expensive) |                   |            |         |
|     | Option          | 2: Train     |            | multiple          | instances  |         |
|     | of the          | same         | network    | using             | different  |         |
|     | training        | samples      | (again     |                   | expensive) |         |
|     | Even if         | we manage    |            | to train          | with       | op-     |
|     | tion 1 or       | option       | 2,         | combining         |            | several |
|     | models          | at test      | time       | is                | infeasible | in      |
|     | real time       | applications |            |                   |            |         |
73/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- | --- |

|     | Dropout           | is a technique     | which ad-        |
| --- | ----------------- | ------------------ | ---------------- |
|     | dresses           | both these issues. |                  |
|     | Effectively       | it allows          | training several |
|     | neural networks   | without            | any signific-    |
|     | ant computational | overhead.          |                  |
|     | Also gives        | an efficient       | approximate      |
wayofcombiningexponentiallymany
|     | different | neural networks. |     |
| --- | --------- | ---------------- | --- |
74/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| -------------- | --------------------- | -------- | --- |

| Dropout | refers to | dropping out units |     |     |
| ------- | --------- | ------------------ | --- | --- |
Temporarily remove a node and all its incoming/outgoing connections
| resulting | in a thinned | network |     |     |
| --------- | ------------ | ------- | --- | --- |
Each node is retained with a fixed probability (typically p = 0.5) for hidden
| nodes and | p = 0.8 | for visible nodes |     |     |
| --------- | ------- | ----------------- | --- | --- |
75/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

| Suppose   | a neural | network | has       | n nodes |             |     |            |
| --------- | -------- | ------- | --------- | ------- | ----------- | --- | ---------- |
| Using the | dropout  | idea,   | each node | can     | be retained |     | or dropped |
For example, in the above case we drop 5 nodes to get a thinned network
Given a total of n nodes, what are the total number of thinned networks that
| can be | formed? | 2n  |     |     |     |     |     |
| ------ | ------- | --- | --- | --- | --- | --- | --- |
Of course, this is prohibitively large and we cannot possibly train so many
networks
| Trick:     | (1) Share   | the weights | across  | all      | the networks |          |     |
| ---------- | ----------- | ----------- | ------- | -------- | ------------ | -------- | --- |
| (2) Sample | a different |             | network | for each | training     | instance |     |
| Let us     | see how?    |             |         |          |              |          |     |
76/1
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture8 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | -------- |

We initialize all the parameters (weights) of the network and start training
For the first training instance (or mini-batch), we apply dropout resulting in
| the thinned      | network      |               |            |                  |
| ---------------- | ------------ | ------------- | ---------- | ---------------- |
| We compute       | the loss and | backpropagate |            |                  |
| Which parameters | will         | we update?    | Only those | which are active |
77/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

For the second training instance (or mini-batch), we again apply dropout res-
| ulting in | a different | thinned | network |     |
| --------- | ----------- | ------- | ------- | --- |
We again compute the loss and backpropagate to the active weights
If the weight was active for both the training instances then it would have
| received | two updates | by now |     |     |
| -------- | ----------- | ------ | --- | --- |
If the weight was active for only one of the training instances then it would
| have received | only | one updates | by now |     |
| ------------- | ---- | ----------- | ------ | --- |
Each thinned network gets trained rarely (or even never) but the parameter
sharing ensures that no model has untrained or poorly trained parameters
78/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

|              |              |             | w       | w           | w w     |          | pw pw pw     | pw  |
| ------------ | ------------ | ----------- | ------- | ----------- | ------- | -------- | ------------ | --- |
|              |              |             | 1       | 2           | 3 4     |          | 1 2 3        | 4   |
|              |              | Present     | with    |             |         | Always   |              |     |
|              |              | probability |         | p           |         | present  |              |     |
|              |              |             |         | At training | time    |          | At test time |     |
| What happens | at test      | time?       |         |             |         |          |              |     |
| Impossible   | to aggregate | the         | outputs | of 2n       | thinned | networks |              |     |
Instead we use the full Neural Network and scale the output of each node by
| the fraction | of times | it was | on during | training |     |     |     |     |
| ------------ | -------- | ------ | --------- | -------- | --- | --- | --- | --- |
79/1
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture8 |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | -------- | --- |

Dropoutessentiallyappliesamasking
|     | noise to | the hidden units |          |
| --- | -------- | ---------------- | -------- |
|     | Prevents | hidden units     | from co- |
adapting
|     | Essentially | a hidden       | unit cannot rely |
| --- | ----------- | -------------- | ---------------- |
|     | too much    | on other units | as they may      |
|     | get dropped | out any        | time             |
|     | Each hidden | unit has       | to learn to be   |
|     | more robust | to these       | random dro-      |
pouts
80/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |     |
| -------------- | --------------------- | -------- | --- |

|     | Here is  | an example |            | of how | dropout |
| --- | -------- | ---------- | ---------- | ------ | ------- |
|     | helps in | ensuring   | redundancy |        | and ro- |
bustness
|     | Suppose | h learns | to  | detect | a face by |
| --- | ------- | -------- | --- | ------ | --------- |
i
|     | firing on | detecting              | a   | nose |     |
| --- | --------- | ---------------------- | --- | ---- | --- |
|     | Droppingh | thencorrespondstoeras- |     |      |     |
h i
i
|     | ing the   | information |        | that a   | nose exists |
| --- | --------- | ----------- | ------ | -------- | ----------- |
|     | The model | should      | then   | learn    | another     |
|     | h i which | redundantly |        | encodes  | the         |
|     | presence  | of a        | nose   |          |             |
|     | Or the    | model       | should | learn    | to detect   |
|     | the face  | using       | other  | features |             |
81/1
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture8 |     |     |
| -------------- | --------------------- | --- | -------- | --- | --- |

Recap
l regularization
2
| Dataset   | augmentation |           |     |     |
| --------- | ------------ | --------- | --- | --- |
| Parameter | Sharing      | and tying |     |     |
| Adding    | Noise to the | inputs    |     |     |
| Adding    | Noise to the | outputs   |     |     |
Early stopping
| Ensemble | methods |     |     |     |
| -------- | ------- | --- | --- | --- |
Dropout
82/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

Appendix
83/1
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| -------------- | --------------------- | -------- |

| To prove: | The below | two equations   | are equivalent |     |
| --------- | --------- | --------------- | -------------- | --- |
|           |           | w = (I −ηQΛQT)w | +ηQΛQTw∗       |     |
|           |           | t               | t−1            |     |
−εΛ)t]QTw∗
w = Q[I −(I
t
| Proof by   | induction: |       |     |     |
| ---------- | ---------- | ----- | --- | --- |
| Base case: | t = 1 and  | w =0: |     |     |
0
| w according | to the | first equation: |     |     |
| ----------- | ------ | --------------- | --- | --- |
1
|     |     | w = (I −ηQΛQT)w | +ηQΛQTw∗ |     |
| --- | --- | --------------- | -------- | --- |
|     |     | 1               | 0        |     |
ηQΛQTw∗
=
| w 1 according | to the | second equation: |     |     |
| ------------- | ------ | ---------------- | --- | --- |
−ηΛ)1)QTw∗
|     |     | w 1 = Q(I | −(I |     |
| --- | --- | --------- | --- | --- |
= ηQΛQTw∗
84/1
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture8 |
| --- | --- | -------------- | --------------------- | -------- |

tth
| Induction  | step:       | Let the   | two equations   | be equivalent | for step |
| ---------- | ----------- | --------- | --------------- | ------------- | -------- |
|            |             | ∴         | w = (I −ηQΛQT)w |               | +ηQΛQTw∗ |
|            |             |           | t               | t−1           |          |
|            |             |           | = Q[I −(I       | −εΛ)t]QTw∗    |          |
| Proof that | this        | will hold | for (t+1)th     | step          |          |
| w =        | (I −ηQΛQT)w |           | +ηQΛQTw∗        |               |          |
| t+1        |             |           | t               |               |          |
−εΛ)t]QTw∗)
| (using | w   | = Q[I | −(I |     |     |
| ------ | --- | ----- | --- | --- | --- |
t
| (using | w   | = Q[I | −(I −εΛ)t]QTw∗) |     |     |
| ------ | --- | ----- | --------------- | --- | --- |
t
|          | −ηQΛQT)Q(I    |                     | −ηΛ)t)QTw∗+ηQΛQTw∗     |     |                        |
| -------- | ------------- | ------------------- | ---------------------- | --- | ---------------------- |
| =        | (I            |                     | −(I                    |     |                        |
|          | −ηQΛQT)Q(I    |                     | −ηΛ)t)QTw∗+ηQΛQTw∗     |     |                        |
| =        | (I            |                     | −(I                    |     |                        |
| =        | (I −ηQΛQT)Q(I |                     | −(I −ηΛ)t)QTw∗+ηQΛQTw∗ |     |                        |
| (Opening |               | this bracket)       |                        |     |                        |
| =        | IQ(I −(I      | −ηΛ)t)QTw∗−ηQΛQTQ(I |                        |     | −(I −ηΛ)t)QTw∗+ηQΛQTw∗ |
85/1
−ηΛ)Mt)itQesThMw.∗K−hapηraQΛQCTS7Q01(5I(D−eep(ILea−rniηngΛ)):tL)eQctuTrwe8∗+ηQΛQTw∗
| =   | Q(I −(I |     |     |     |     |
| --- | ------- | --- | --- | --- | --- |

Continuing
| w   | = Q(I | −(I | −ηΛ)t)QTw∗−ηQΛQTQ(I |     |     |     | −(I | −ηΛ)t)QTw∗+ηQΛQTw∗ |     |     |
| --- | ----- | --- | ------------------- | --- | --- | --- | --- | ------------------ | --- | --- |
t+1
|     |       |               | −ηΛ)t)QTw∗−ηQΛ(I |            |              |                       | −ηΛ)t)QTw∗+ηQΛQTw∗(∵ |              | QTQ |      |
| --- | ----- | ------------- | ---------------- | ---------- | ------------ | --------------------- | -------------------- | ------------ | --- | ---- |
|     | = Q(I | −(I           |                  |            |              | −(I                   |                      |              |     | = I) |
|     | = Q(I | −(I           | −ηΛ)t)QTw∗−ηQΛ(I |            |              | −(I                   | −ηΛ)t)QTw∗+ηQΛQTw∗   |              |     |      |
|     |       | (cid:2)       | −ηΛ)t)−ηΛ(I      |            |              | −ηΛ)t)+ηΛ             |                      | (cid:3) QTw∗ |     |      |
|     | = Q   | (I −(I        |                  |            | −(I          |                       |                      |              |     |      |
|     | = Q(I | −(I           | −ηΛ)t)QTw∗−ηQΛ(I |            |              | −(I                   | −ηΛ)t)QTw∗+ηQΛQTw∗   |              |     |      |
|     |       | (cid:2)       |                  |            |              |                       |                      | (cid:3)      |     |      |
|     | = Q   | (I −(I        | −ηΛ)t)−ηΛ(I      |            | −(I          | −ηΛ)t)+ηΛ             |                      | QTw∗         |     |      |
|     |       | (cid:2)       | −ηΛ)t)−ηΛ(I      |            |              | −ηΛ)t)+ηΛ             |                      | (cid:3) QTw∗ |     |      |
|     | = Q   | (I −(I        |                  |            | −(I          |                       |                      |              |     |      |
|     |       | (cid:2)       |                  |            | −ηΛ)t(cid:3) |                       |                      |              |     |      |
|     | = Q   | I −(I         | −ηΛ)t+ηΛ(I       |            |              | QTw∗                  |                      |              |     |      |
|     |       | (cid:2)       | −ηΛ)t+ηΛ(I       |            | −ηΛ)t(cid:3) | QTw∗                  |                      |              |     |      |
|     | = Q   | I −(I         |                  |            |              |                       |                      |              |     |      |
|     | = Q   | (cid:2) I −(I | −ηΛ)t+ηΛ(I       |            | −ηΛ)t(cid:3) | QTw∗                  |                      |              |     |      |
|     |       | (cid:2)       |                  |            | (cid:3)      |                       |                      |              |     |      |
|     | = Q   | I −(I         | −ηΛ)t(I          | −ηΛ)       | QTw∗         |                       |                      |              |     |      |
|     |       | (cid:2)       | −ηΛ)t(I          |            | (cid:3) QTw∗ |                       |                      |              |     |      |
|     | = Q   | I −(I         |                  | −ηΛ)       |              |                       |                      |              |     | 86/1 |
|     |       |               |                  | Mt+it1es h | MT. Kh∗apra  | CS7015(DeepLearning): |                      | Lecture8     |     |      |
|     | = Q(I | −(I           | −ηΛ)             | ) Q        | w            |                       |                      |              |     |      |
Hence, proved!
