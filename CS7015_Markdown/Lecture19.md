| CS7015 | (Deep Learning) | : Lecture | 19  |
| ------ | --------------- | --------- | --- |
Using joint distributions for classification and sampling, Latent Variables,
Restricted Boltzmann Machines, Unsupervised Learning, Motivation for
Sampling
|     | Mitesh | M. Khapra |     |
| --- | ------ | --------- | --- |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/71
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | -------------- | --------------------- | --------- |

Acknowledgments
Probabilistic Graphical models: Principles and Techniques, Daphne Koller
and Nir Friedman
An Introduction to Restricted Boltzmann Machines, Asja Fischer and
Christian Igel
2/71
MiteshM.Khapra CS7015(DeepLearning): Lecture19

| Module | 19.1: Using | joint distributions |     | for classification |
| ------ | ----------- | ------------------- | --- | ------------------ |
and sampling
3/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

Now that we have some understanding of joint probability distributions and
efficient ways of representing them, let us see some more practical examples where
| we can | use these joint | distributions |     |     |
| ------ | --------------- | ------------- | --- | --- |
4/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Consider | a movie | critic | who writes | reviews |
| --- | -------- | ------- | ------ | ---------- | ------- |
M1: Anunexpectedandnecessarymasterpiece for movies
M2: Delightfullymergedinformationandcomedy
|     | For simplicity | let | us assume | that | he always |
| --- | -------------- | --- | --------- | ---- | --------- |
M3: Director’sfirsttruemasterpiece
M4: Sci-fiperfection,trulymesmerizingfilm. writes reviews containing a maximum of 5
M5: Wasteoftimeandmoney
words
M6: BestLameHistoricalMovieEver
|     | Further,    | let us assume | that       | there      | are a total |
| --- | ----------- | ------------- | ---------- | ---------- | ----------- |
|     | of 50 words | in his        | vocabulary |            |             |
|     | Each of     | the 5 words   | in         | his review | can be      |
treatedasarandomvariablewhichtakesone
|     | of the 50  | values   |           |         |             |
| --- | ---------- | -------- | --------- | ------- | ----------- |
|     | Given many | such     | reviews   | written | by the      |
|     | reviewer   | we could | learn the | joint   | probability |
distribution
|     |     | P(X | ,X ,...,X | )   |     |
| --- | --- | --- | --------- | --- | --- |
|     |     |     | 1 2       | 5   |     |
5/71
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

In fact, we can even think of a very simple
factorization for this model
M1: Anunexpectedandnecessarymasterpiece
(cid:81)
M2: Delightfullymergedinformationandcomedy P(X ,X ,...,X ) = P(X |X ,X )
1 2 5 i i−1 i−2
M3: Director’sfirsttruemasterpiece
M4: Sci-fiperfection,trulymesmerizingfilm. Inotherwords,weareassumingthatthei-th
M5: Wasteoftimeandmoney
word only depends on the previous 2 words
M6: BestLameHistoricalMovieEver
and not anything before that
of and
Let us consider one such factor P(X =
i
time|X = waste,X = of)
i−2 i−1
waste
We can estimate this as
count(waste of time)
time money
count(waste of)
And the two counts mentioned above can be
computed by going over all the reviews
We could similarly compute the
probabilities of all such factors
6/71
MiteshM.Khapra CS7015(DeepLearning): Lecture19

|     |     |     |     |     |     |     | Okay, | so now | what | can we do |
| --- | --- | --- | --- | --- | --- | --- | ----- | ------ | ---- | --------- |
M7: More realistic than real life with this joint distribution?
|     |          |     |          |     |         |     | Given | a review, | classify | if this |
| --- | -------- | --- | -------- | --- | ------- | --- | ----- | --------- | -------- | ------- |
|     | P(Xi=w|, |     | P(Xi=w|, |     | P(Xi=w| |     |       |           |          |         |
w Xi−2=more, Xi−2=realistic, Xi−2=than, ... was written by the reviewer
Xi−1=realistic) Xi−1=than) Xi−1=real) Generate new reviews which
| than |     | 0.61 |     | 0.01 | 0.20 | ... | would | look | like reviews | written |
| ---- | --- | ---- | --- | ---- | ---- | --- | ----- | ---- | ------------ | ------- |
| as   |     | 0.12 |     | 0.10 | 0.16 | ... |       |      |              |         |
by this reviewer
| for  |     | 0.14 |     | 0.09 | 0.05 | ... |          |       |                    |          |
| ---- | --- | ---- | --- | ---- | ---- | --- | -------- | ----- | ------------------ | -------- |
|      |     |      |     |      |      |     | How      | would | you do             | this? By |
| real |     | 0.01 |     | 0.50 | 0.01 | ... |          |       |                    |          |
|      |     |      |     |      |      |     | sampling | from  | this distribution! |          |
| the  |     | 0.02 |     | 0.12 | 0.12 | ... | What     | does  | that mean?         | Let us   |
| life |     | 0.05 |     | 0.11 | 0.33 | ... |          |       |                    |          |
see!
| P(M7)=P(X |                                | =more).P(X |         | =realistic|X   |     | =more).               |     |           |     |      |
| --------- | ------------------------------ | ---------- | ------- | -------------- | --- | --------------------- | --- | --------- | --- | ---- |
|           |                                | 1          |         | 2              |     | 1                     |     |           |     |      |
|           | P(X                            | =than|X    |         | =more,X        |     | =realistic).          |     |           |     |      |
|           |                                | 3          |         | 1              | 2   |                       |     |           |     |      |
|           | P(X                            | =real|X    |         | =realistic,X   |     | =than).               |     |           |     |      |
|           |                                | 4          |         | 2              |     | 3                     |     |           |     |      |
|           |                                | P(X        | =life|X | =than,X        |     | =real)                |     |           |     |      |
|           |                                | 5          |         | 3              |     | 4                     |     |           |     |      |
|           | =0.2×0.25×0.61×0.50×0.33=0.005 |            |         |                |     |                       |     |           |     | 7/71 |
|           |                                |            |         | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |      |

|     |     |     |     |     | How does | the      | reviewer |            | start his |
| --- | --- | --- | --- | --- | -------- | -------- | -------- | ---------- | --------- |
|     |     |     |     |     | reviews  | (what is | the      | first word | that      |
he chooses)?
P(Xi=w|,
Wecouldtakethewordwhichhasthe
P(X2=w|,
| w       | P(X1=w) |         | Xi−2=the,   | ... |                     |        |           |     |           |
| ------- | ------- | ------- | ----------- | --- | ------------------- | ------ | --------- | --- | --------- |
|         |         | X1=the) |             |     | highest probability |        | and       | put | it as the |
|         |         |         | Xi−1=movie) |     | first word          | in our | review    |     |           |
| the     | 0.62    | 0.01    | 0.01        | ... |                     |        |           |     |           |
|         |         |         |             |     | Having selected     |        | this what | is  | the most  |
| movie   | 0.10    | 0.40    | 0.01        | ... |                     |        |           |     |           |
|         |         |         |             |     | likely second       | word   | that      | the | reviewer  |
| amazing | 0.01    | 0.22    | 0.01        | ... |                     |        |           |     |           |
uses?
| useless | 0.01 | 0.20 | 0.03 | ... |                 |          |           |       |       |
| ------- | ---- | ---- | ---- | --- | --------------- | -------- | --------- | ----- | ----- |
|         |      |      |      |     | Having selected |          | the first | two   | words |
| was     | 0.01 | 0.00 | 0.60 | ... |                 |          |           |       |       |
| ...     | ...  | ...  | ...  |     | what is         | the most | likely    | third | word  |
...
|           |     |                |     |     | that the     | reviewer | uses? |     |     |
| --------- | --- | -------------- | --- | --- | ------------ | -------- | ----- | --- | --- |
|           |     |                |     |     | and so on... |          |       |     |     |
| The movie | was | really amazing |     |     |              |          |       |     |     |
8/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): | Lecture19 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --------- | --- | --- | --- |

|     |     |     |     |     | But there | is a catch | here! |
| --- | --- | --- | --- | --- | --------- | ---------- | ----- |
Selectingthemostlikelywordateach
|     |     |     |     |     | time step | will only give | us the same |
| --- | --- | --- | --- | --- | --------- | -------------- | ----------- |
P(Xi=w|,
|     |     |     |     |     | review | again and again! |     |
| --- | --- | --- | --- | --- | ------ | ---------------- | --- |
P(X2=w|,
| w   | P(X1=w) |         | Xi−2=the, | ... |        |            |             |
| --- | ------- | ------- | --------- | --- | ------ | ---------- | ----------- |
|     |         | X1=the) |           |     | But we | would like | to generate |
Xi−1=movie)
|     |      |      |      |     | different | reviews |     |
| --- | ---- | ---- | ---- | --- | --------- | ------- | --- |
| the | 0.62 | 0.01 | 0.01 | ... |           |         |     |
Soinsteadoftakingthemaxvaluewe
| movie   | 0.10 | 0.40 | 0.01 | ... |            |             |              |
| ------- | ---- | ---- | ---- | --- | ---------- | ----------- | ------------ |
|         |      |      |      |     | can sample | from this   | distribution |
| amazing | 0.01 | 0.22 | 0.01 | ... |            |             |              |
|         |      |      |      |     | How?       | Let us see! |              |
| useless | 0.01 | 0.20 | 0.03 | ... |            |             |              |
| was     | 0.01 | 0.00 | 0.60 | ... |            |             |              |
| ...     | ...  | ...  | ...  |     |            |             |              |
...
| The movie | was really | amazing |     |     |     |     |     |
| --------- | ---------- | ------- | --- | --- | --- | --- | --- |
9/71
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- |

|     |     |     |     | Suppose |     | there | are | 10 words |     | in the |
| --- | --- | --- | --- | ------- | --- | ----- | --- | -------- | --- | ------ |
P(Xi=w|,
P(X2=w|,
| w P(X1=w) |     |     | ... | vocabulary |     |     |     |     |     |     |
| --------- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- |
Xi−2=the,
|     | X1=the) |     |     | We  | have |     | computed | the | probability |     |
| --- | ------- | --- | --- | --- | ---- | --- | -------- | --- | ----------- | --- |
Xi−1=movie)
| the 0.62 | 0.01 | 0.01 | ... | distribution |     | P(X | =word) |     |     |     |
| -------- | ---- | ---- | --- | ------------ | --- | --- | ------ | --- | --- | --- |
1
|                  |      |      |     | P(X        | =       | the)    | is the       | fraction | of      | reviews |
| ---------------- | ---- | ---- | --- | ---------- | ------- | ------- | ------------ | -------- | ------- | ------- |
| movie 0.10       | 0.40 | 0.01 | ... |            | 1       |         |              |          |         |         |
| amazing 0.01     | 0.22 | 0.01 | ... | having     | the     | as      | the first    | word     |         |         |
| useless 0.01     | 0.20 | 0.03 | ... | Similarly, |         | we have | computed     |          |         |         |
| was 0.01         | 0.00 | 0.60 | ... | P(X        | =word   |         | |X =word     | )        | and     |         |
|                  |      |      |     |            | 2       |         | 2 1          | 1        |         |         |
| is 0.01          | 0.00 | 0.30 | ... |            |         |         |              |          |         |         |
|                  |      |      |     | P(X        | 3 =word |         | 3 |X 1 =word | 1 ,X     | 2 =word | 2 )     |
| masterpiece 0.01 | 0.11 | 0.01 | ... |            |         |         |              |          |         |         |
| I 0.21           | 0.00 | 0.01 | ... |            |         |         |              |          |         |         |
| liked 0.01       | 0.01 | 0.01 | ... |            |         |         |              |          |         |         |
| decent 0.01      | 0.02 | 0.01 | ... |            |         |         |              |          |         |         |
10/71
|     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     | Now consider | that we want | to generate | the 3rd word |
| --- | --- | ------------ | ------------ | ----------- | ------------ |
The movie ... in the review given the first 2 words of the review
|     |          | We can think                                  | of the 10             | words as forming | a 10 sided |
| --- | -------- | --------------------------------------------- | --------------------- | ---------------- | ---------- |
|     |          | dice where                                    | each side corresponds | to a word        |            |
|     | P(Xi=w|, | Theprobabilityofeachsideshowingupisnotuniform |                       |                  |            |
Index Word Xi−2=the, ... but as per the values given in the table
Xi−1=movie) We can select the next word by rolling this dice and
| 0 the   | 0.01 ... |            |                |          |     |
| ------- | -------- | ---------- | -------------- | -------- | --- |
| 1 movie | 0.01 ... | picking up | the word which | shows up |     |
2 amazing 0.01 ... You can write a python program to roll such a biased
| 3 useless | 0.03 ... |     |     |     |     |
| --------- | -------- | --- | --- | --- | --- |
dice
| 4 was         | 0.60 ... |     |     |     |     |
| ------------- | -------- | --- | --- | --- | --- |
| 5 is          | 0.30 ... |     |     |     |     |
| 6 masterpiece | 0.01 ... |     |     |     |     |
| 7 I           | 0.01 ... |     |     |     |     |
| 8 liked       | 0.01 ... |     |     |     |     |
| 9 decent      | 0.01 ... |     |     |     |     |
11/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | -------------- | --------------------- | --- | --------- | --- |

|     |     |     | Now, | at each timestep | we do not |
| --- | --- | --- | ---- | ---------------- | --------- |
Generated Reviews
|             |                 |     | pick the | most likely       | word but all |
| ----------- | --------------- | --- | -------- | ----------------- | ------------ |
| the movie   | is liked decent |     | words    | are possible      | depending on |
|             |                 |     | their    | probability (just | as rolling   |
| I liked the | amazing movie   |     |          |                   |              |
|             |                 |     | a biased | dice or tossing   | a biased     |
| the movie   | is masterpiece  |     |          |                   |              |
coin)
| the movie | I liked useless |     |       |              |           |
| --------- | --------------- | --- | ----- | ------------ | --------- |
|           |                 |     | Every | run will now | give us a |
different review!
12/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Returning | back to | our story.... |     |     |
| --------- | ------- | ------------- | --- | --- |
13/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     |     |     |     | Okay, | so now | what | can | we do |
| --- | --- | --- | --- | --- | --- | --- | ----- | ------ | ---- | --- | ----- |
M7: More realistic than real life with this joint distribution?
|     |          |     |          |     |         |     | Given | a review, | classify |     | if this |
| --- | -------- | --- | -------- | --- | ------- | --- | ----- | --------- | -------- | --- | ------- |
|     | P(Xi=w|, |     | P(Xi=w|, |     | P(Xi=w| |     |       |           |          |     |         |
w Xi−2=more, Xi−2=realistic, Xi−2=than, ... was written by the reviewer
Xi−1=realistic) Xi−1=than) Xi−1=real) Generate new reviews which
| than |     | 0.61 |     | 0.01 | 0.20 | ... | would | look | like reviews |     | written |
| ---- | --- | ---- | --- | ---- | ---- | --- | ----- | ---- | ------------ | --- | ------- |
| as   |     | 0.12 |     | 0.10 | 0.16 | ... |       |      |              |     |         |
by this reviewer
| for  |     | 0.14 |     | 0.09 | 0.05 | ... |            |       |            |         |          |
| ---- | --- | ---- | --- | ---- | ---- | --- | ---------- | ----- | ---------- | ------- | -------- |
|      |     |      |     |      |      |     | Correct    | noisy | reviews    | or      | help in  |
| real |     | 0.01 |     | 0.50 | 0.01 | ... |            |       |            |         |          |
|      |     |      |     |      |      |     | completing |       | incomplete | reviews |          |
| the  |     | 0.02 |     | 0.12 | 0.12 | ... |            |       |            |         |          |
| life |     | 0.05 |     | 0.11 | 0.33 | ... |            |       |            |         |          |
|      |     |      |     |      |      |     | argmax     | P(X   | 1 = the,X  | 2       | = movie, |
X5
| P(M7)=P(X |     | =more).P(X |     | =realistic|X |     | =more).      |     |     |                |     |     |
| --------- | --- | ---------- | --- | ------------ | --- | ------------ | --- | --- | -------------- | --- | --- |
|           |     | 1          |     | 2            |     | 1            |     |     | X 3 = was,     |     |     |
|           | P(X | =than|X    |     | =more,X      |     | =realistic). |     |     |                |     |     |
|           |     | 3          |     | 1            | 2   |              |     |     | X = amazingly, |     |     |
4
|     |     | P(X =real|X |     | =realistic,X |     | =than). |     |     |       |     |     |
| --- | --- | ----------- | --- | ------------ | --- | ------- | --- | --- | ----- | --- | --- |
|     |     | 4           |     | 2            |     | 3       |     |     | X =?) |     |     |
5
|     |                                | P(X | =life|X | =than,X        |     | =real)                |     |           |     |     |       |
| --- | ------------------------------ | --- | ------- | -------------- | --- | --------------------- | --- | --------- | --- | --- | ----- |
|     |                                | 5   |         | 3              |     | 4                     |     |           |     |     |       |
|     | =0.2×0.25×0.61×0.50×0.33=0.005 |     |         |                |     |                       |     |           |     |     | 14/71 |
|     |                                |     |         | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |     |       |

| Let us take | an example | from another | domain |     |
| ----------- | ---------- | ------------ | ------ | --- |
15/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Consider | images | which | contain | m×n | pixels |
| --- | -------- | ------ | ----- | ------- | --- | ------ |
(say 32×32)
|     | Each pixel              | here         | is        | a random | variable     | which        |
| --- | ----------------------- | ------------ | --------- | -------- | ------------ | ------------ |
|     | can take                | values       | from      | 0 to     | 255 (colors) |              |
|     | Wethushaveatotalof32×32 |              |           |          | =            | 1024random   |
|     | variables               | (X           | ,X ,...,X |          | )            |              |
|     |                         | 1            | 2         | 1024     |              |              |
|     | Together                | these        | pixels    | define   | the          | image and    |
|     | different               | combinations |           | of pixel | values       | lead to      |
|     | different               | images       |           |          |              |              |
|     | Given many              | such         | images    | we       | want         | to learn the |
|     | joint distribution      |              | P(X       | ,X       | ,...,X       | )            |
|     |                         |              |           | 1        | 2            | 1024         |
16/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | We can assume | each | pixel | is dependent |     | only |
| --- | ------------- | ---- | ----- | ------------ | --- | ---- |
on its neighbors
Inthiscasewecouldfactorizethedistribution
|     | over a Markov | network |     |     |     |     |
| --- | ------------- | ------- | --- | --- | --- | --- |
(cid:89)
φ(D )
i
|     | where D | is a | set | of variables |     | which |
| --- | ------- | ---- | --- | ------------ | --- | ----- |
i
|     | form a maximal |         | clique | (basically, | groups | of  |
| --- | -------------- | ------- | ------ | ----------- | ------ | --- |
|     | neighboring    | pixels) |        |             |        |     |
17/71
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- | --- |

|     | Again, what | can we | do with this | joint |
| --- | ----------- | ------ | ------------ | ----- |
distribution?
|     | Given a new | image, | classify if is indeed | a   |
| --- | ----------- | ------ | --------------------- | --- |
bedroom
|     | Generate new  | images   | which would           | look like |
| --- | ------------- | -------- | --------------------- | --------- |
|     | bedrooms(say, | ifyouare | an interior designer) |           |
|     | Correct noisy | images   | or help in completing |           |
|     | incomplete    | images   |                       |           |
18/71
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Such models which try to estimate the probability P(X) from a large number
| of samples | are called | generative models |     |     |
| ---------- | ---------- | ----------------- | --- | --- |
19/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

| Module | 19.2: The | concept | of a latent | variable |
| ------ | --------- | ------- | ----------- | -------- |
20/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     | We now | introduce | the | concept | of a latent |
| --- | ------ | --------- | --- | ------- | ----------- |
variable
|     | Recall that | earlier | we    | mentioned | that the      |
| --- | ----------- | ------- | ----- | --------- | ------------- |
|     | neighboring | pixels  | in an | image     | are dependent |
on each other
|     | Why is it    | so? (intuitively, |           | because | we expect       |
| --- | ------------ | ----------------- | --------- | ------- | --------------- |
|     | them to      | have the          | same      | color,  | texture, etc.?) |
|     | Let us probe | this              | intuition | a bit   | more and try    |
|     | to formalize | it                |           |         |                 |
21/71
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

Supposeweaskedafriendtosendusagoodwallpaper
|     | and he/she | thinks | a   | bit about | it  | and sends | us this |
| --- | ---------- | ------ | --- | --------- | --- | --------- | ------- |
image
Whyareallthepixelsinthetopportionoftheimage
blue? (becauseourfrienddecidedtoshowusanimage
|     | of the sky                 | as opposed |     | to mountains |                   | or green | fields) |
| --- | -------------------------- | ---------- | --- | ------------ | ----------------- | -------- | ------- |
|     | Butthenwhybluewhynotblack? |            |     |              | (becauseourfriend |          |         |
decidedtoshowusanimagewhichdepictsdaytimeas
|     | opposed        | to night | time)   |            |                 |       |           |
| --- | -------------- | -------- | ------- | ---------- | --------------- | ----- | --------- |
|     | Okay, But      | why      | is it   | not cloudy | (gray)?(because |       | our       |
|     | friend decided |          | to show | us an      | image           | which | depicts a |
sunny day)
|     | These decisions |          | made   | by                | our friend | (sky,   | sunny,  |
| --- | --------------- | -------- | ------ | ----------------- | ---------- | ------- | ------- |
|     | daytime,        | etc)     | arenot | explicitlyknownto |            | us(they | are     |
|     | hidden from     | us)      |        |                   |            |         |         |
|     | We only         | observe  | the    | images            | but        | what we | observe |
|     | depends         | on these | latent | (hidden)          | decisions  |         |         |
22/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | So what    | exactly         | are    | we trying | to say          | here?     |
| --- | ---------- | --------------- | ------ | --------- | --------------- | --------- |
|     | We are     | saying          | that   | there     | are             | certain   |
|     | underlying |                 | hidden | (latent)  | characteristics |           |
|     | which      | are determining |        | the       | pixels          | and their |
Latent Variable=daytime
interactions
|     | We could    | think      | of these   | as               | additional | (latent)    |
| --- | ----------- | ---------- | ---------- | ---------------- | ---------- | ----------- |
|     | random      | variables  | in         | our distribution |            |             |
|     | These       | are latent | because    | we               | do         | not observe |
|     | them unlike |            | the pixels | which            | are        | observable  |
|     | random      | variables  |            |                  |            |             |
Latent Variable=night
Thepixelsdependonthechoiceoftheselatent
variables
Latent Variable=cloudy
23/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | More formally | we             | now          | have     | visible (observed) |        |
| --- | ------------- | -------------- | ------------ | -------- | ------------------ | ------ |
|     | variables     | or pixels      | (V           | = {V     | ,V ,V ,...,V       | })     |
|     |               |                |              | 1        | 2 3                | 1024   |
|     | and hidden    | variables      | (H           | ={H      | ,H ,...,H          | })     |
|     |               |                |              |          | 1 2                | n      |
|     | Can you       | now think      | of           | a Markov | network            | to     |
|     | represent     | the joint      | distribution |          | P(V,H)?            |        |
|     | Our original  | Markov         |              | Network  | suggested          | that   |
|     | the pixels    | were dependent |              | on       | neighboring        | pixels |
|     | (forming      | a clique)      |              |          |                    |        |
ButnowwecouldhaveabetterMarkovNetwork
|     | involving   | these latent | variables  |              |           |            |
| --- | ----------- | ------------ | ---------- | ------------ | --------- | ---------- |
|     | This Markov | Network      |            | suggests     | that      | the pixels |
|     | (observed   | variables)   | are        | dependent    | on        | the latent |
|     | variables   | (which       | is exactly | the          | intuition | that we    |
|     | were trying | to build     | in         | the previous | slides)   |            |
Theinteractionsbetweenthepixelsarecaptured
|     | through | the latent | variables |     |     |     |
| --- | ------- | ---------- | --------- | --- | --- | --- |
24/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

Before we move on to more formal definitions and equations, let us probe the
| idea of using | latent    | variables a bit       | more           |     |
| ------------- | --------- | --------------------- | -------------- | --- |
| We will talk  | about two | concepts: abstraction | and generation |     |
25/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     | First let    | us talk      | about  | abstraction |          |           |
| --- | ------------ | ------------ | ------ | ----------- | -------- | --------- |
|     | Suppose,     | we           | are    | able        | to learn | the joint |
|     | distribution |              | P(V,H) |             |          |           |
|     | Using this   | distribution |        | we          | can find |           |
P(V,H)
|     |     | P(H|V) |     | =   |     |     |
| --- | --- | ------ | --- | --- | --- | --- |
(cid:80)
P(V,H)
H
|     | In other              | words, | given          | an            | image,            | we can find |
| --- | --------------------- | ------ | -------------- | ------------- | ----------------- | ----------- |
|     | the most              | likely | latent         | configuration |                   | (H = h)     |
|     | that generated        |        | this           | image         | (of course,       | keeping     |
|     | the computational     |        |                | cost aside    | for               | now)        |
|     | Whatdoesthishcapture? |        |                |               | Itcapturesalatent |             |
|     | representation        |        | or abstraction |               | of the            | image!      |
26/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | In other     | words,     |     | it           | captures  | the      | most  |
| --- | ------------ | ---------- | --- | ------------ | --------- | -------- | ----- |
|     | important    | properties |     | of           | the image |          |       |
|     | For example, |            | if  | you were     | to        | describe | the   |
|     | adjacent     | image      |     | you wouldn’t |           | say      | “I am |
lookingatanimagewherepixel1isblue,pixel
|     | 2 is blue,     | ...,    | pixel   | 1024 is     | beige” |            |     |
| --- | -------------- | ------- | ------- | ----------- | ------ | ---------- | --- |
|     | Instead        | you     | would   | just        | say “I | am looking | at  |
|     | an image       | of      | a sunny | beach       | with   | an ocean   | in  |
|     | the background |         | and     | beige       | sand”  |            |     |
|     | This is        | exactly | the     | abstraction |        | captured   | by  |
|     | the vector     | h       |         |             |        |            |     |
27/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | Under this          | abstraction |                | all                  | these   | images would |
| --- | ------------------- | ----------- | -------------- | -------------------- | ------- | ------------ |
|     | look very           | similar     | (i.e.,         | they                 | would   | have very    |
|     | similar             | latent      | configurations |                      | h)      |              |
|     | Even though         |             | in the         | original             | feature | space        |
|     | (pixels)            | there       | is             | a significant        |         | difference   |
|     | betweentheseimages, |             |                | inthelatentspacethey |         |              |
|     | would be            | very        | close          | to each              | other   |              |
|     | This is             | very        | similar        | to the               | idea    | behind PCA   |
and autoencoders
28/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | Of course,      | we     | still   | need | to figure | out         | a way of |
| --- | --------------- | ------ | ------- | ---- | --------- | ----------- | -------- |
|     | computing       | P(H|V) |         |      |           |             |          |
|     | In the          | case   | of PCA, |      | learning  | such        | latent   |
|     | representations |        | boiled  |      | down      | to learning | the      |
X(cid:62)X
|     | eigen vectors |         | of            | (using                  |      | linear algebra) |      |
| --- | ------------- | ------- | ------------- | ----------------------- | ---- | --------------- | ---- |
|     | In the        | case of | Autoencoders, |                         | this | boiled          | down |
|     | to learning   | the     | parameters    |                         | of   | the feedforward |      |
|     | network(W     |         | ,W            | )(usinggradientdescent) |      |                 |      |
end dec
|     | We still   | haven’t   |        | seen | how     | to learn | the    |
| --- | ---------- | --------- | ------ | ---- | ------- | -------- | ------ |
|     | parameters | of        | P(H,V) |      | (we are | far from | it but |
|     | we will    | get there | soon!) |      |         |          |        |
29/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     | Ok,Iamjustgoingtodragthisabitmore! |     |     |     |     | (bearwith |     |
| --- | ---------------------------------- | --- | --- | --- | --- | --------- | --- |
me)
Rememberthatinpracticewehavenocluewhatthese
|     | hidden variables | are!      |        |       |     |                |     |
| --- | ---------------- | --------- | ------ | ----- | --- | -------------- | --- |
|     | Even in          | PCA, once | we are | given | the | new dimensions |     |
wehavenocluewhatthesedimensionsactuallymean
|     | We cannot     | interpret     | them        | (for        | example, | we        | cannot |
| --- | ------------- | ------------- | ----------- | ----------- | -------- | --------- | ------ |
|     | say dimension | 1             | corresponds | to          | weight,  | dimension | 2      |
|     | corresponds   | to height     | and         | so on!)     |          |           |        |
|     | Even here,    | we just       | assume      | there       | are      | some      | latent |
|     | variables     | which capture |             | the essence | of       | the data  | but    |
wedonotreallyknowwhattheseare(becausenoone
|     | ever tells | us what      | these are) |     |            |      |     |
| --- | ---------- | ------------ | ---------- | --- | ---------- | ---- | --- |
|     | Only for   | illustration | purpose    |     | we assumed | that | h   |
1
|     | correspondstosunny/cloudy,h |     |     |     | correspondstobeach |     |     |
| --- | --------------------------- | --- | --- | --- | ------------------ | --- | --- |
2
and so on
30/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

Justtoreiterate,rememberthatwhilesending
|     | us the         | wallpaper  | images      | our           | friend     | never told |
| --- | -------------- | ---------- | ----------- | ------------- | ---------- | ---------- |
|     | us what        | latent     | variables   | he/she        | considered |            |
|     | Maybe          | our friend | had         | the           | following  | latent     |
|     | variables      | in         | mind:       | h =           | cheerful,  | h =        |
|     |                |            |             | 1             |            | 2          |
|     | romantic,      | and        | so on       |               |            |            |
|     | In fact,       | it doesn’t |             | really matter |            | what the   |
|     | interpretation |            | of these    | latent        | variable   | is         |
|     | All we         | care about | is          | that they     | should     | help us    |
|     | learn a        | good       | abstraction | of the        | data       |            |
|     | How? (we       | will       | get there   | eventually)   |            |            |
31/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | We will                          | now talk     | about another    | interesting |
| --- | -------------------------------- | ------------ | ---------------- | ----------- |
|     | conceptrelatedtolatentvariables: |              |                  | generation  |
|     | Once again,                      | assume       | that we are able | to learn    |
|     | the joint                        | distribution | P(V,H)           |             |
|     | Using this                       | distribution | we can find      |             |
P(V,H)
|     |     | P(V|H) | =   |     |
| --- | --- | ------ | --- | --- |
(cid:80)
P(V,H)
V
|     | Why is | this interesting? |     |     |
| --- | ------ | ----------------- | --- | --- |
32/71
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| -------------- | --------------------- | --- | --------- | --- |

|     | Well, I can     | now           | say              | “Create     | an image      |          | which |
| --- | --------------- | ------------- | ---------------- | ----------- | ------------- | -------- | ----- |
|     | is cloudy,      | has           | a beach          | and depicts |               | daytime” |       |
|     | Or given        | h =           | [....] find      | the         | corresponding |          | V     |
|     | which maximizes |               | P(V|H)           |             |               |          |       |
|     | In other        | words,        | I can            | now         | generate      | images   |       |
|     | given certain   |               | latent variables |             |               |          |       |
|     | The hope        | is that       | I should         | be          | able          | to ask   | the   |
|     | model to        | generate      | very             | creative    | images        |          | given |
|     | some latent     | configuration |                  | (we         | will          | come     | back  |
to this later)
33/71
| MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

The story ahead...
We have tried to understand the intuition behind latent variables and how
they could potenatially allow us to do abstraction and generation
We will now concretize these intuitions by developings equations (models) and
| learning algoritms |         |                   |                     |     |
| ------------------ | ------- | ----------------- | ------------------- | --- |
| And of course,     | we will | tie all this back | to neural networks! |     |
34/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

For the remainder of this discussion we will assume that all our variables take
only boolean values
Thus, the vector V will be a boolean vector ∈ {0,1}m (there are a total of 2m
values that V can take)
And the vector H will be a boolean vector ∈ {0,1}n (there are a total of 2n
values that H can take)
35/71
MiteshM.Khapra CS7015(DeepLearning): Lecture19

| Module | 19.3: Restricted | Boltzmann |     | Machines |
| ------ | ---------------- | --------- | --- | -------- |
36/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|         |     | We return  | back   | to our Markov | Network |         |
| ------- | --- | ---------- | ------ | ------------- | ------- | ------- |
|         |     | containing | hidden | variables     | and     | visible |
| h h ··· | h   |            |        |               |         |         |
| 1 2     | n   |            |        |               |         |         |
variables
|     |     | We will    | get rid of    | the image and | just keep        | the |
| --- | --- | ---------- | ------------- | ------------- | ---------------- | --- |
|     |     | hidden and | latent        | variables     |                  |     |
|     |     | We have    | edges between | each          | pair of (hidden, |     |
visible) variables.
| v v ··· | v   |         |               |               |           |     |
| ------- | --- | ------- | ------------- | ------------- | --------- | --- |
| 1 2     | m   | We do   | not have      | edges between | (hidden,  |     |
|         |     | hidden) | and (visible, | visible)      | variables |     |
37/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|         |     | Earlier,   | we saw       | that given  | such         | a Markov     |
| ------- | --- | ---------- | ------------ | ----------- | ------------ | ------------ |
|         |     | network    | the joint    | probability | distribution | can          |
| h h ··· | h   |            |              |             |              |              |
| 1 2     | n   |            |              |             |              |              |
|         |     | be written | as a product | of          | factors      |              |
|         |     | Can you    | tell how     | many        | factors      | are there in |
this case?
|     |     | Recall | that factors | correspond |     | to maximal |
| --- | --- | ------ | ------------ | ---------- | --- | ---------- |
cliques
| v v ··· | v   |            |                 |            |      |            |
| ------- | --- | ---------- | --------------- | ---------- | ---- | ---------- |
| 1 2     | m   | What       | are the maximal | cliques    | in   | this case? |
|         |     | every pair | of visible      | and hidden | node | forms a    |
clique
|     |     | How many | such cliques | do  | we have? | (m×n) |
| --- | --- | -------- | ------------ | --- | -------- | ----- |
38/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     | So we can | write | the joint | pdf | as a | product | of the |
| --- | --- | --- | --------- | ----- | --------- | --- | ---- | ------- | ------ |
following factors
| h h | ··· | h   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 2 |     | n   |     |     |     |     |     |     |     |
1 (cid:89)(cid:89)
|     |     |     |     | P(V,H)= |     |     | φ (v ,h | )   |     |
| --- | --- | --- | --- | ------- | --- | --- | ------- | --- | --- |
|     |     |     |     |         |     |     | ij i    | j   |     |
Z
i j
|     |     |     | In fact,                              | we can             | also      | add           | additional |              | factors |
| --- | --- | --- | ------------------------------------- | ------------------ | --------- | ------------- | ---------- | ------------ | ------- |
|     |     |     | corresponding                         | to                 | the nodes | and           | write      |              |         |
|     |     |     |                                       | 1 (cid:89)(cid:89) |           |               | (cid:89)   | (cid:89)     |         |
| v v | ··· | v   | P(V,H)=                               |                    | φ         | (v ,h         | ) ψ        | (v ) ξ       | (h )    |
| 1 2 |     | m   |                                       | Z                  |           | ij i j        | i          | i            | j j     |
|     |     |     |                                       | i                  | j         |               | i          | j            |         |
|     |     |     | Itislegaltodothis(i.e.,addfactorsforψ |                    |           |               |            | (v )ξ        | (h ))   |
|     |     |     |                                       |                    |           |               |            | i i          | j j     |
|     |     |     | as long as                            | we ensure          | that      | Z is adjusted |            | in a way     | that    |
|     |     |     | the resulting                         | quantity           | is        | a probability |            | distribution |         |
|     |     |     | Z is the                              | partition          | function  | and           | is given   | by           |         |
|     |     |     | (cid:88)(cid:88)(cid:89)(cid:89)      |                    |           | (cid:89)      |            | (cid:89)     |         |
|     |     |     |                                       |                    | φ (v      | ,h )          | ψ (v )     | ξ (h         | )       |
|     |     |     |                                       |                    | ij        | i j           | i i        | j            | j       |
|     |     |     | V                                     | H i j              |           | i             |            | j            |         |
39/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | Let us | understand | each | of these |     | factors in |
| --- | --- | --- | --- | ------ | ---------- | ---- | -------- | --- | ---------- |
more detail
| h   | h          | ··· | h   |                                        |            |            |           |          |           |
| --- | ---------- | --- | --- | -------------------------------------- | ---------- | ---------- | --------- | -------- | --------- |
| 1   | 2          |     | n   |                                        |            |            |           |          |           |
|     |            |     |     | For example,                           | φ          | (v ,h      | ) is      | a factor | which     |
|     |            |     |     |                                        |            | 11 1       | 1         |          |           |
|     |            |     |     | takes the                              | values     | of v ∈     | {0,1}     | and h    | ∈ {0,1}   |
|     |            |     |     |                                        |            | 1          |           |          | 1         |
|     |            |     |     | and returns                            | a value    | indicating |           | the      | affinity  |
|     |            |     |     | between                                | these two  | variables  |           |          |           |
|     |            |     |     | The adjoining                          | table      | shows      | one       | such     | possible  |
| v   | v          | ··· | v   | instantiation                          | of the     | φ          | function  |          |           |
| 1   | 2          |     | m   |                                        |            | 11         |           |          |           |
|     |            |     |     | Similarly,                             | ψ 1 (v 1 ) | takes      | the value | of v     | 1 ∈ {0,1} |
|     | φ11(v1,h1) |     |     | andgivesusanumberwhichroughlyindicates |            |            |           |          |           |
0 0 30
|     | 0   | 1 5 |     | the possibility | of  | v taking | on  | the value | 1 or 0 |
| --- | --- | --- | --- | --------------- | --- | -------- | --- | --------- | ------ |
1
1 0 1
|     | 1   | 1 10 |     | The adjoining | table  | shows | one      | such | possible |
| --- | --- | ---- | --- | ------------- | ------ | ----- | -------- | ---- | -------- |
|     |     |      |     | instantiation | of the | ψ     | function |      |          |
11
ψ1(v1)
|     | 0   | 10  |     | A similar | interpretation |     | can | be  | made for |
| --- | --- | --- | --- | --------- | -------------- | --- | --- | --- | -------- |
1 2
ξ (h )
1 1
40/71
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

Just to be sure that we understand this correctly let us take a small example
where |V| = 3 (i.e., V ∈ {0,1}3) and |H| = 2 (i.e., H ∈ {0,1}2)
41/71
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| -------------- | --------------------- | --------- |

|     |     |     |     |     | Suppose |     | we are  | now interested |     | in P(V =<     |
| --- | --- | --- | --- | --- | ------- | --- | ------- | -------------- | --- | ------------- |
|     |     |     |     |     | 0,0,0   | >,H | =<      | 1,1 >)         |     |               |
|     |     | h   | h   |     |         |     |         |                |     |               |
|     |     | 1   | 2   |     | We      | can | compute | this using     |     | the following |
function
|     |     |     |     |     |     | P(V | =<  | 0,0,0 >,H | =<  | 1,1 >) |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | ------ |
1
|     |     |     |     |     |     |     | = φ | (0,1)φ (0,1)φ |     | (0,1) |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------- | --- | ----- |
|     |     |     |     |     |     |     | 11  | 12            | 21  |       |
Z
|            | v          |            | v          | v                     |     |     |             |           |          |     |
| ---------- | ---------- | ---------- | ---------- | --------------------- | --- | --- | ----------- | --------- | -------- | --- |
|            | 1          |            | 2          | 3                     |     |     | φ 22 (0,1)φ | 31 (0,1)φ | 32 (0,1) |     |
|            |            |            |            |                       |     |     | ψ (0)ψ      | (0)ψ (0)ξ | (1)ξ     | (1) |
|            |            |            |            |                       |     |     | 1           | 2 3       | 1        | 2   |
| φ11(v1,h1) | φ12(v1,h2) | φ21(v2,h1) | φ22(v2,h2) | φ31(v3,h1) φ32(v3,h2) |     |     |             |           |          |     |
| 0 0        | 20 0 0     | 6 0 0      | 3 0 0 2    | 0 0 6 0 0 3           |     |     |             |           |          |     |
| 0 1        | 3 0 1      | 20 0 1     | 3 0 1 1    | 0 1 3 0 1 1           |     |     |             |           |          |     |
1 0 5 1 0 10 1 0 2 1 0 10 1 0 5 1 0 10 and the partition function will be given by
| 1 1 | 10 1 1 | 2 1 1    | 10 1 1 10     | 1 1 10 1 1 10 |     |     |     |     |     |     |
| --- | ------ | -------- | ------------- | ------------- | --- | --- | --- | --- | --- | --- |
|     | ψ1(v1) | ψ2(v2)   | ψ3(v3) ξ1(h1) | ξ2(h2)        |     |     |     |     |     |     |
|     | 0      | 30 0 100 | 0 1 0 100     | 0 10          |     | 1 1 | 1   | 1 1 |     |     |
1 1 1 1 1 100 1 1 1 10 (cid:88) (cid:88) (cid:88) (cid:88) (cid:88)
v1=0v2=0v3=0h1=0h2=1
|     |     |     |     |     |     | P(V | =< v | ,v ,v >,H | =<  | h ,h >) |
| --- | --- | --- | --- | --- | --- | --- | ---- | --------- | --- | ------- |
|     |     |     |     |     |     |     |      | 1 2 3     |     | 1 2     |
42/71
|     |     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|            |             | How do           | we learn       | these clique       | potentials: |
| ---------- | ----------- | ---------------- | -------------- | ------------------ | ----------- |
|            |             | φ (v ,h          | ),ψ (v ),ξ     | (h )?              |             |
| H ∈ {0,1}n |             | ij i             | j i i          | j j                |             |
| c c        | c           | Whenever         | we want        | to learn something | what        |
| 1 2        | n           |                  |                |                    |             |
|            |             | do we introduce? |                | (parameters)       |             |
| h h ···    | h           |                  |                |                    |             |
| 1 2        | n           | So we            | will introduce | a parametric       | form for    |
|            |             | these clique     | potentials     | and then           | learn these |
| w          | w           | parameters       |                |                    |             |
| 1,1        | m,n W ∈Rm×n |                  |                |                    |             |
ThespecificparametricformchosenbyRBMs
is
| v 1 v 2 ··· | v m |     |     |     |     |
| ----------- | --- | --- | --- | --- | --- |
ewijvihj
|     |     |     | φ ij (v | i ,h j ) = |     |
| --- | --- | --- | ------- | ---------- | --- |
| b b | b   |     |         |            |     |
| 1 2 | m   |     | ψ (v    | ) = ebivi  |     |
{0,1}m i i
V ∈
ecjhj
ξ (h ) =
j j
43/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | -------------- | --------------------- | --- | --------- | --- |

Withthisparametricform,letusseewhatthe
|     |          |     |     | joint  | distribution |                    | looks like |          |            |            |
| --- | -------- | --- | --- | ------ | ------------ | ------------------ | ---------- | -------- | ---------- | ---------- |
| H   | ∈ {0,1}n |     |     |        |              |                    |            |          |            |            |
| c   | c        |     | c   |        |              |                    |            |          |            |            |
| 1   | 2        |     | n   |        |              | 1 (cid:89)(cid:89) |            | (cid:89) | (cid:89)   |            |
|     |          |     |     | P(V,H) | =            |                    | φ ij (v    | i ,h j ) | ψ i (v i ) | ξ j (h j ) |
Z
| h   | h   | ··· | h   |     |                    |          |          |          |     |     |
| --- | --- | --- | --- | --- | ------------------ | -------- | -------- | -------- | --- | --- |
| 1   | 2   |     | n   |     |                    | i        | j        |          | i   | j   |
|     |     |     |     |     | 1 (cid:89)(cid:89) |          | (cid:89) | (cid:89) |     |     |
|     |     |     |     | =   |                    | ewijvihj | ebivi    | ecjhj    |     |     |
Z
| w   |     |     | w           |     |                     |          |          |          |     |     |
| --- | --- | --- | ----------- | --- | ------------------- | -------- | -------- | -------- | --- | --- |
| 1,1 |     |     | m,n W ∈Rm×n |     | i j                 |          | i        | j        |     |     |
|     |     |     |             |     | 1 (cid:80) (cid:80) |          | (cid:80) | (cid:80) |     |     |
|     |     |     |             | =   | e                   | wijvihje | bivie    | cjhj     |     |     |
|     |     |     |             |     | i                   | j        | i        | j        |     |     |
Z
|     |     |     |     |     | 1 (cid:80) (cid:80) | wijvihj+(cid:80) | bivi+(cid:80) |      |     |     |
| --- | --- | --- | --- | --- | ------------------- | ---------------- | ------------- | ---- | --- | --- |
| v 1 | v 2 | ··· | v m | =   | e                   |                  |               | cjhj |     |     |
|     |     |     |     |     | i                   | j                | i             | j    |     |     |
Z
| b   | b      |     | b   |        | 1        |                  |      |          |          |     |
| --- | ------ | --- | --- | ------ | -------- | ---------------- | ---- | -------- | -------- | --- |
| 1   | 2      |     | m   |        | e−E(V,H) |                  |      |          |          |     |
|     | {0,1}m |     |     | =      |          | where,           |      |          |          |     |
| V   | ∈      |     |     |        | Z        |                  |      |          |          |     |
|     |        |     |     |        |          | (cid:88)(cid:88) |      | (cid:88) | (cid:88) |     |
|     |        |     |     | E(V,H) | =        | −                | w v  | h −      | b v −    | c h |
|     |        |     |     |        |          |                  | ij i | j        | i i      | j j |
|     |        |     |     |        |          | i                | j    |          | i        | j   |
44/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- | --- |

|     |             |     |             |        |              | (cid:88)(cid:88) |        |              | (cid:88) | (cid:88)  |          |
| --- | ----------- | --- | ----------- | ------ | ------------ | ---------------- | ------ | ------------ | -------- | --------- | -------- |
|     | H ∈ {0,1}n  |     |             | E(V,H) | =            | −                | w ij v | i h j −      | b i      | v i −     | c j h j  |
|     | c c         |     | c           |        |              |                  |        |              |          |           |          |
|     | 1 2         |     | n           |        |              | i                | j      |              | i        |           | j        |
|     | h h ···     |     | h           |        |              |                  |        |              |          |           |          |
|     | 1 2         |     | n           |        | Because      | of the           | above  | form,        | we       | refer     | to these |
|     |             |     |             |        | networks     | as (restricted)  |        | Boltzmann    |          | machines  |          |
| w   |             | w   |             |        | The term     | comes            | from   | statistical  |          | mechanics |          |
| 1,1 |             |     | m,n W ∈Rm×n |        |              |                  |        |              |          |           |          |
|     |             |     |             |        | where the    | distribution     |        | of particles |          | in a      | system   |
|     |             |     |             |        | over various | possible         |        | states       | is given | by        |          |
|     | v 1 v 2 ··· |     | v m         |        |              |                  |        |              |          |           |          |
E
|     |     |     |     |     |     |     | F(state) | ∝ e− |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | ---- | --- | --- | --- |
k t
|     | b b |     | b   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | 1 2 |     | m   |     |     |     |     |     |     |     |     |
{0,1}m
|     | V ∈ |     |     |     | which is  | called       | the Boltzmann |     | distribution |     | or  |
| --- | --- | --- | --- | --- | --------- | ------------ | ------------- | --- | ------------ | --- | --- |
|     |     |     |     |     | the Gibbs | distribution |               |     |              |     |     |
45/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

| Module | 19.4: RBMs | as Stochastic | Neural | Networks |
| ------ | ---------- | ------------- | ------ | -------- |
46/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

But what is the connection between this and deep neural networks?
| We will | get to it over | the next few | slides! |     |
| ------- | -------------- | ------------ | ------- | --- |
47/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | We will start | by  | deriving | a formula | for | P(V|H) | and |
| --- | --- | --- | ------------- | --- | -------- | --------- | --- | ------ | --- |
P(H|V)
H ∈ {0,1}n
| c c |     | c   | Inparticular,letustakethel-thvisibleunitandderive |         |       |     |     |     |     |
| --- | --- | --- | ------------------------------------------------- | ------- | ----- | --- | --- | --- | --- |
| 1 2 |     | n   |                                                   |         |       |     |     |     |     |
|     |     |     | a formula                                         | for P(v | =1|H) |     |     |     |     |
l
h h ··· h We will first define V as the state of all the visible
| 1 2 |     | n           |               |     | −l        |            |     |     |     |
| --- | --- | ----------- | ------------- | --- | --------- | ---------- | --- | --- | --- |
|     |     |             | units except  | the | l-th unit |            |     |     |     |
|     |     |             | We now define | the | following | quantities |     |     |     |
| w   |     | w           |               |     |           |            |     |     |     |
| 1,1 |     | m,n W ∈Rm×n |               |     |           |            |     |     |     |
(cid:88) n
|     |     |     | α(H)=− | w   | h −b |     |     |     |     |
| --- | --- | --- | ------ | --- | ---- | --- | --- | --- | --- |
|     |     |     | l      |     | il i | l   |     |     |     |
i=1
|         |     |     |             | (cid:88) n         | (cid:88) m |      | (cid:88)        | m   | (cid:88) n |
| ------- | --- | --- | ----------- | ------------------ | ---------- | ---- | --------------- | --- | ---------- |
| v 1 v 2 | ··· | v m | β(V ,H)=−   |                    |            | w h  | v −             | b v | − c h      |
|         |     |     | −l          |                    |            | ij i | j               | i   | i i i      |
|         |     |     |             | i=1j=1,j(cid:54)=l |            |      | j=1,j(cid:54)=l |     | i=1        |
| b b     |     | b   |             |                    |            |      |                 |     |            |
| 1 2     |     | m   |             |                    |            |      |                 |     |            |
| {0,1}m  |     |     | Notice that |                    |            |      |                 |     |            |
V ∈
|     |     |     |     | E(V,H)=vα(H)+β(V |     |     |     | ,H) |     |
| --- | --- | --- | --- | ---------------- | --- | --- | --- | --- | --- |
|     |     |     |     |                  | l   |     | −l  |     |     |
48/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     |     | We  | can now | write | P(v | = 1|H) | as  |
| --- | --- | --- | --- | --- | ------- | ----- | --- | ------ | --- |
l
|     | H ∈ {0,1}n |     |     |     |        |       |       |         |     |
| --- | ---------- | --- | --- | --- | ------ | ----- | ----- | ------- | --- |
|     |            |     |     | p(v | = 1|H) | =     | P(v = | 1|V ,H) |     |
|     | c c        |     | c   |     | l      |       | l     | −l      |     |
|     | 1 2        |     | n   |     |        |       |       |         |     |
|     |            |     |     |     | p(v    | = 1,V | ,H)   |         |     |
|     |            |     |     |     |        | l     | −l    |         |     |
=
|     | h h | ··· | h   |     |     | p(V | ,H)        |     |     |
| --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- |
|     | 1 2 |     | n   |     |     | −l  |            |     |     |
|     |     |     |     |     |     |     | e−E(v =1,V | ,H) |     |
l −l
=
| w   |     |     | w           |     | e−E(v | l =1,V | −l ,H)+e−E(v |            | l =0,V −l ,H) |
| --- | --- | --- | ----------- | --- | ----- | ------ | ------------ | ---------- | ------------- |
| 1,1 |     |     | m,n W ∈Rm×n |     |       |        |              |            |               |
|     |     |     |             |     |       |        | e−β(V        | −l ,H)−1·α | l (H)         |
=
|     |         |     |     |     | e−β(V | −l ,H)−1·α | l (H)+e−β(V |     | −l ,H)−0·α l (H) |
| --- | ------- | --- | --- | --- | ----- | ---------- | ----------- | --- | ---------------- |
|     | v 1 v 2 | ··· | v m |     |       | e−β(V      | −l ,H)·e−α  |     | l (H)            |
=
|     |        |     |     |     | e−β(V | −l ,H)·e−α |      | l (H)+e−β(V | −l ,H) |
| --- | ------ | --- | --- | --- | ----- | ---------- | ---- | ----------- | ------ |
|     | b b    |     | b   |     |       |            |      |             |        |
|     | 1 2    |     | m   |     |       |            |      |             |        |
|     | {0,1}m |     |     |     |       | e−α l (H)  |      | 1           |        |
|     | V ∈    |     |     |     | =     |            | =    |             |        |
|     |        |     |     |     | e−α   | (H)+1      | 1+eα |             | (H)    |
|     |        |     |     |     |       | l          |      | l           |        |
n
(cid:88)
|     |     |     |     |     | = σ(−α | (H)) | = σ( | w   | h i +b ) |
| --- | --- | --- | --- | --- | ------ | ---- | ---- | --- | -------- |
|     |     |     |     |     |        | l    |      |     | il l     |
i=1
49/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- | --- |

|            |     |     | Okay, | so we arrived | at  |     |     |     |
| ---------- | --- | --- | ----- | ------------- | --- | --- | --- | --- |
| H ∈ {0,1}n |     |     |       |               |     |     | n   |     |
(cid:88)
| c c |     | c   |     | p(v | l =1|H)=σ( |     | w il h i +b) l |     |
| --- | --- | --- | --- | --- | ---------- | --- | -------------- | --- |
| 1 2 |     | n   |     |     |            |     |                |     |
i=1
| h h | ··· | h   | Similarly, | we  | can show | that |     |     |
| --- | --- | --- | ---------- | --- | -------- | ---- | --- | --- |
| 1 2 |     | n   |            |     |          |      |     |     |
m
(cid:88)
|     |     |             |         | p(h | l =1|V)=σ( |                | w il v i +c) l  |     |
| --- | --- | ----------- | ------- | --- | ---------- | -------------- | --------------- | --- |
| w   |     | w           |         |     |            |                |                 |     |
| 1,1 |     | m,n W ∈Rm×n |         |     |            |                | i=1             |     |
|     |     |             | The RBM | can | thus       | be interpreted | as a stochastic |     |
neuralnetwork,wherethenodesandedgescorrespond
v 1 v 2 ··· v m to neurons and synaptic connections, respectively.
|     |     |     | The conditional                                   |     | probability |     | of a single (hidden | or  |
| --- | --- | --- | ------------------------------------------------- | --- | ----------- | --- | ------------------- | --- |
| b b |     | b   |                                                   |     |             |     |                     |     |
| 1 2 |     | m   | visible)variablebeing1canbeinterpretedasthefiring |     |             |     |                     |     |
{0,1}m
| V ∈ |     |     | rate of | a (stochastic) |     | neuron | with sigmoid activation |     |
| --- | --- | --- | ------- | -------------- | --- | ------ | ----------------------- | --- |
function
50/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     |     |     | Given this | neural    | network | view | of RBMs, | can       |
| --- | --- | --- | ---------- | --------- | ------- | ---- | -------- | --------- |
|     |     |     | you say    | something | about   | what | h is     | trying to |
H ∈ {0,1}n
| c c         |     | c           | learn?                                 |          |          |                |                  |      |
| ----------- | --- | ----------- | -------------------------------------- | -------- | -------- | -------------- | ---------------- | ---- |
| 1 2         |     | n           |                                        |          |          |                |                  |      |
|             |     |             | It is learning                         | an       | abstract | representation |                  | of V |
| h h ···     |     | h           |                                        |          |          |                |                  |      |
| 1 2         |     | n           | Thislookssimilartoautoencodersbuthowdo |          |          |                |                  |      |
|             |     |             | we train                               | such an  | RBM?     | What           | is the objective |      |
| w           | w   |             | function?                              |          |          |                |                  |      |
| 1,1         |     | m,n W ∈Rm×n |                                        |          |          |                |                  |      |
|             |     |             | We will                                | see this | in the   | next           | lecture!         |      |
| v 1 v 2 ··· |     | v m         |                                        |          |          |                |                  |      |
| b b         |     | b           |                                        |          |          |                |                  |      |
| 1 2         |     | m           |                                        |          |          |                |                  |      |
{0,1}m
V ∈
51/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

| Module | 19.5: Unsupervised |     | Learning | with RBMs |
| ------ | ------------------ | --- | -------- | --------- |
52/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|             |     |             | So far,   | we have   | mainly |        | dealt with | supervised |       |
| ----------- | --- | ----------- | --------- | --------- | ------ | ------ | ---------- | ---------- | ----- |
|             |     |             | learning  | where     | we     | are    | given      | {x ,y }n   | for   |
| H ∈ {0,1}n  |     |             |           |           |        |        |            | i i i=1    |       |
| c c         |     | c           | training  |           |        |        |            |            |       |
| 1 2         |     | n           |           |           |        |        |            |            |       |
|             |     |             | In other  | words,    | for    | every  | training   | example    | we    |
| h h ···     |     | h           |           |           |        |        |            |            |       |
| 1 2         |     | n           | are given | a label   | (or    | class) | associated | with       | it    |
|             |     |             | Our job   | was       | then   | to     | learn      | a model    | which |
| w           | w   |             | predicts  | yˆ such   | that   | the    | difference | between    | y     |
| 1,1         |     | m,n W ∈Rm×n |           |           |        |        |            |            |       |
|             |     |             | and yˆ is | minimized |        |        |            |            |       |
| v 1 v 2 ··· |     | v m         |           |           |        |        |            |            |       |
| b b         |     | b           |           |           |        |        |            |            |       |
| 1 2         |     | m           |           |           |        |        |            |            |       |
{0,1}m
V ∈
53/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     | But in        | the case of | RBMs,    | our     | training data |
| --- | --- | --- | ------------- | ----------- | -------- | ------- | ------------- |
|     |     |     | only contains | x (for      | example, | images) |               |
H ∈ {0,1}n
| c c |     | c   | There | is no explicit | label | (y) associated | with |
| --- | --- | --- | ----- | -------------- | ----- | -------------- | ---- |
| 1 2 |     | n   |       |                |       |                |      |
the input
| h h ··· |     | h           |            |             |       |           |            |
| ------- | --- | ----------- | ---------- | ----------- | ----- | --------- | ---------- |
| 1 2     |     | n           | Of course, | in addition | to    | x we have | the latent |
|         |     |             | variable   | h but we    | don’t | know what | these h’s  |
| w       | w   |             | are        |             |       |           |            |
| 1,1     |     | m,n W ∈Rm×n |            |             |       |           |            |
WeareinterestedinlearningP(x,h)whichwe
|             |     |     | have parameterized |                | as       |                  |               |
| ----------- | --- | --- | ------------------ | -------------- | -------- | ---------------- | ------------- |
| v 1 v 2 ··· |     | v m |                    |                |          |                  |               |
|             |     |     |                    | 1 e−(−(cid:80) | (cid:80) | wijvihj−(cid:80) | bivi−(cid:80) |
|             |     |     | P(V,H)             | =              |          |                  | cjhj)         |
|             |     |     |                    |                | i j      |                  | i j           |
| b b         |     | b   |                    | Z              |          |                  |               |
| 1 2         |     | m   |                    |                |          |                  |               |
{0,1}m
V ∈
54/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |          |     |             | What      | is the  | objective | function      | that      | we       | should use?  |
| --- | -------- | --- | ----------- | --------- | ------- | --------- | ------------- | --------- | -------- | ------------ |
| H   | ∈ {0,1}n |     |             | First     | note    | that      | if we have    | learnt    | P(x,h)   | we can       |
| c   | c        |     | c           | compute   |         | P(x)      |               |           |          |              |
| 1   | 2        |     | n           |           |         |           |               |           |          |              |
|     |          |     |             | What      | would   | we        | want P(X      | =         | x) to    | be for any x |
| h   | h        | ··· | h           | belonging |         | to our    | training      | data?     |          |              |
| 1   | 2        |     | n           |           |         |           |               |           |          |              |
|     |          |     |             | We        | would   | want      | it to be high |           |          |              |
|     |          |     |             | So        | now can | you       | think of an   | objective | function |              |
| w   |          |     | w           |           |         |           |               |           |          |              |
| 1,1 |          |     | m,n W ∈Rm×n |           |         |           |               |           |          |              |
(cid:89) N
|     |     |     |     |     |     | maximize |     | P(X | =x ) |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- | ---- | --- |
i
i=1
| v 1 | v 2 | ··· | v m |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Or, log-likelihood
| b   | b      |     | b   |       |           |         |            |      |          |     |
| --- | ------ | --- | --- | ----- | --------- | ------- | ---------- | ---- | -------- | --- |
| 1   | 2      |     | m   |       |           |         |            |      |          |     |
|     | {0,1}m |     |     |       |           |         | l          |      | l        |     |
| V   | ∈      |     |     |       |           |         | (cid:89)   |      | (cid:88) |     |
|     |        |     |     |       | lnL(θ)=ln |         | p(x        | |θ)= | lnp(x    | |θ) |
|     |        |     |     |       |           |         |            | i    |          | i   |
|     |        |     |     |       |           |         | i=1        |      | i=1      |     |
|     |        |     |     | where | θ         | are the | parameters |      |          |     |
55/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- |

|     |     | Okay so | we have | the objective | function now! |
| --- | --- | ------- | ------- | ------------- | ------------- |
What next?
H ∈ {0,1}n
| c c | c   | We need | a learning | algorithm |     |
| --- | --- | ------- | ---------- | --------- | --- |
| 1 2 | n   |         |            |           |     |
Wecanjustusegradientdescentifweareable
| h h ···     | h           |            |               |         |                   |
| ----------- | ----------- | ---------- | ------------- | ------- | ----------------- |
| 1 2         | n           | to compute | the gradient  | of      | the loss function |
|             |             | w.r.t. the | parameters    |         |                   |
| w           | w           | Let us     | see if we can | do that |                   |
| 1,1         | m,n W ∈Rm×n |            |               |         |                   |
| v 1 v 2 ··· | v m         |            |               |         |                   |
| b b         | b           |            |               |         |                   |
| 1 2         | m           |            |               |         |                   |
{0,1}m
V ∈
56/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | -------------- | --------------------- | --- | --------- | --- |

| Module | 19.6: Computing |     | the gradient | of the log |
| ------ | --------------- | --- | ------------ | ---------- |
likelihood
57/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     |     | We will | just consider |     | the loss for | a single training |     |
| --- | --- | --- | --- | ------- | ------------- | --- | ------------ | ----------------- | --- |
example
| H   | ∈ {0,1}n |     |     |                    |     |     |            |          |     |
| --- | -------- | --- | --- | ------------------ | --- | --- | ---------- | -------- | --- |
|     |          |     |     |                    |     |     | 1 (cid:88) | e−E(V,H) |     |
| c   | c        |     | c   | lnL(θ)=lnp(V|θ)=ln |     |     |            |          |     |
| 1   | 2        |     | n   |                    |     |     | Z          |          |     |
H
|     |     |     |     |         |     | (cid:88) e−E(V,H)−ln |             | (cid:88) e−E(V,H) |          |
| --- | --- | --- | --- | ------- | --- | -------------------- | ----------- | ----------------- | -------- |
| h   | h   | ··· | h   |         | =ln |                      |             |                   |          |
| 1   | 2   |     | n   |         |     |                      |             |                   |          |
|     |     |     |     |         |     | H                    |             | V,H               |          |
|     |     |     |     | ∂lnL(θ) |     | (cid:18)             |             |                   | (cid:19) |
|     |     |     |     |         | ∂   | (cid:88)             | e−E(V,H)−ln | (cid:88) e−E(V,H) |          |
= ln
| w   |     |     | w           | ∂θ  | ∂θ  |     |     |         |     |
| --- | --- | --- | ----------- | --- | --- | --- | --- | ------- | --- |
| 1,1 |     |     | m,n W ∈Rm×n |     |     | H   |     | V,H     |     |
|     |     |     |             |     |     | 1   |     | ∂E(V,H) |     |
(cid:88) e−E(V,H)
|     |     |     |     |     | =− (cid:80) |          |          |          |     |
| --- | --- | --- | --- | --- | ----------- | -------- | -------- | -------- | --- |
|     |     |     |     |     |             | e−E(V,H) |          | ∂θ       |     |
|     |     |     |     |     | H           |          | H        |          |     |
| v 1 | v 2 | ··· | v m |     |             | 1        | (cid:88) | ∂E(V,H)  |     |
|     |     |     |     |     | +           |          |          | e−E(V,H) |     |
|     |     |     |     |     | (cid:80)    | e−E(V,H) |          |          | ∂θ  |
V,H
| b   | b      |     | b   |     |          |          | V,H     |     |     |
| --- | ------ | --- | --- | --- | -------- | -------- | ------- | --- | --- |
| 1   | 2      |     | m   |     |          |          |         |     |     |
|     | {0,1}m |     |     |     | (cid:88) | e−E(V,H) | ∂E(V,H) |     |     |
| V   | ∈      |     |     |     | =−       |          |         |     |     |
(cid:80)
|     |     |     |     |     |     | e−E(V,H) |     | ∂θ  |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- |
H H
|     |     |     |     |     | (cid:88) | e−E(V,H) |     | ∂E(V,H) |     |
| --- | --- | --- | --- | --- | -------- | -------- | --- | ------- | --- |
+
|     |     |     |     |     |     | (cid:80) | e−E(V,H) | ∂θ  |     |
| --- | --- | --- | --- | --- | --- | -------- | -------- | --- | --- |
V,H
V,H
58/71
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

Now,
| H   | ∈ {0,1}n |     |     |     |     |          |         |     |
| --- | -------- | --- | --- | --- | --- | -------- | ------- | --- |
| c   | c        |     | c   |     |     | e−E(V,H) |         |     |
| 1   | 2        |     | n   |     |     |          | =p(V,H) |     |
(cid:80) e−E(V,H)
V,H
| h   | h   | ··· | h   |     |          |     |           |     |
| --- | --- | --- | --- | --- | -------- | --- | --------- | --- |
| 1   | 2   |     | n   |     |          |     |           |     |
|     |     |     |     |     | e−E(V,H) |     | 1e−E(V,H) |     |
= Z
|     |     |     |             |     | (cid:80) |     | 1 (cid:80) |          |
| --- | --- | --- | ----------- | --- | -------- | --- | ---------- | -------- |
|     |     |     |             |     | e−E(V,H) |     |            | e−E(V,H) |
| w   |     |     | w           |     | H        |     | Z H        |          |
| 1,1 |     |     | m,n W ∈Rm×n |     |          |     | p(V,H)     |          |
|     |     |     |             |     |          |     | =          | =p(H|V)  |
p(V)
| v 1 | v 2 | ··· | v m | ∂lnL(θ) | (cid:88) | e−E(V,H) |     | ∂E(V,H) |
| --- | --- | --- | --- | ------- | -------- | -------- | --- | ------- |
=−
(cid:80)
|     |        |     |     | ∂θ  |     |          | e−E(V,H) | ∂θ      |
| --- | ------ | --- | --- | --- | --- | -------- | -------- | ------- |
| b   | b      |     | b   |     |     | H H      |          |         |
| 1   | 2      |     | m   |     |     |          |          |         |
|     | {0,1}m |     |     |     |     | (cid:88) | e−E(V,H) | ∂E(V,H) |
| V   | ∈      |     |     |     |     | +        |          |         |
(cid:80)
|     |     |     |     |     |     |     | e−E(V,H) | ∂θ  |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- |
V,H V,H
|     |     |     |     | (cid:88) |        | ∂E(V,H) | (cid:88) | ∂E(V,H) |
| --- | --- | --- | --- | -------- | ------ | ------- | -------- | ------- |
|     |     |     |     | =−       | p(H|V) |         | +        | p(V,H)  |
|     |     |     |     |          |        | ∂θ      |          | ∂θ      |
|     |     |     |     |          | H      |         | V,H      |         |
59/71
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

|            |     |     | Okay, so | we have, |          |        |         |     |
| ---------- | --- | --- | -------- | -------- | -------- | ------ | ------- | --- |
| H ∈ {0,1}n |     |     | ∂lnL(θ)  |          |          |        |         |     |
|            |     |     |          |          | (cid:88) |        | ∂E(V,H) |     |
| c c        |     | c   |          | =        | −        | p(H|V) |         |     |
| 1 2        |     | n   |          |          |          |        |         |     |
|            |     |     |          | ∂θ       |          |        | ∂θ      |     |
H
| h h | ··· | h   |     |     |          | ∂E(V,H) |     |     |
| --- | --- | --- | --- | --- | -------- | ------- | --- | --- |
| 1 2 |     | n   |     |     | (cid:88) |         |     |     |
|     |     |     |     | +   | p(V,H)   |         |     |     |
∂θ
V,H
| w       |     | w           |             |            |             |            |              |      |
| ------- | --- | ----------- | ----------- | ---------- | ----------- | ---------- | ------------ | ---- |
| 1,1     |     | m,n W ∈Rm×n |             |            |             |            |              |      |
|         |     |             | Remember    | that       | θ is a      | collection | of all       | the  |
|         |     |             | parameters  | in our     | model,      | i.e.,      | W ,b ,c      | ∀i ∈ |
|         |     |             |             |            |             |            | ij i         | j    |
|         |     |             | {1,...,m}   | and ∀j     | ∈ {1,...,n} |            |              |      |
| v 1 v 2 | ··· | v m         |             |            |             |            |              |      |
|         |     |             | We will     | follow our | usual       | recipe     | of computing |      |
| b b     |     | b           | the partial | derivative |             | w.r.t. one | weight       | w    |
| 1 2     |     | m           |             |            |             |            |              | ij   |
{0,1}m
| V ∈ |     |     | and then      | generalize | to  | the gradient | w.r.t. | the |
| --- | --- | --- | ------------- | ---------- | --- | ------------ | ------ | --- |
|     |     |     | entire weight | matrix     | W   |              |        |     |
60/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- | --- |

∂L(θ)
H ∈ {0,1}n
| c c         | c           | ∂w  | ij           |           |          |         |          |         |        |
| ----------- | ----------- | --- | ------------ | --------- | -------- | ------- | -------- | ------- | ------ |
| 1 2         | n           |     |              |           |          |         |          |         |        |
|             |             |     | (cid:88)     |           | ∂E(V,H)  |         | (cid:88) | ∂E(V,H) |        |
|             |             | =   | −            | p(H|V)    |          | +       | p(V,H)   |         |        |
| h h ···     | h           |     |              |           |          |         |          |         |        |
| 1 2         | n           |     |              |           | ∂w       |         |          |         | ∂w     |
|             |             |     | H            |           |          | ij      | V,H      |         | ij     |
|             |             |     | (cid:88)     |           | (cid:88) |         |          |         |        |
|             |             | =   | p(H|V)h      |           | i v j −  | p(V,H)h | i v j    |         |        |
| w           | w           |     |              |           |          |         |          |         |        |
| 1,1         | m,n W ∈Rm×n |     |              |           |          |         |          |         |        |
|             |             |     | H            |           | V,H      |         |          |         |        |
|             |             | =   | E            | [v h      | ]−E      | [v      | h ]      |         |        |
|             |             |     | p(H|V)       | i j       | p(V,H)   | i       | j        |         |        |
| v 1 v 2 ··· | v m         |     |              |           |          |         |          |         |        |
| b b         | b           |     | We           | can write | the      | above   | as a     | sum     | of two |
| 1 2         | m           |     |              |           |          |         |          |         |        |
| {0,1}m      |             |     | expectations |           |          |         |          |         |        |
V ∈
61/71
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture19 |     |     |     |
| --- | -------------- | --- | --------------------- | --- | --- | --------- | --- | --- | --- |

|     |     |     | How do | we compute | these | expectations? |     |
| --- | --- | --- | ------ | ---------- | ----- | ------------- | --- |
∂L(θ)
| = E    | [v h ]−E   | [v h ] | The first  | summation | can actually | be           |     |
| ------ | ---------- | ------ | ---------- | --------- | ------------ | ------------ | --- |
| p(H|V) | i j p(V,H) | i j    |            |           |              |              |     |
| ∂w ij  |            |        | simplified | (we will  | come back    | and simplify | it  |
later)
|     |     |     | However,    | the second  | summation | contains  | an  |
| --- | --- | --- | ----------- | ----------- | --------- | --------- | --- |
|     |     |     | exponential | number      | of terms  | and hence |     |
|     |     |     | intractable | in practice |           |           |     |
|     |     |     | So how      | do we deal  | with this | ?         |     |
62/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| Module | 19.7: Motivation |     | for Sampling |     |
| ------ | ---------------- | --- | ------------ | --- |
63/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |

|     |     |     | The trick | is to approximate | the sum | by using |
| --- | --- | --- | --------- | ----------------- | ------- | -------- |
∂L(θ)
|        |            |        | a few samples | instead           | of an exponential |          |
| ------ | ---------- | ------ | ------------- | ----------------- | ----------------- | -------- |
| = E    | [v h ]−E   | [v h ] |               |                   |                   |          |
| p(H|V) | i j p(V,H) | i j    |               |                   |                   |          |
| ∂w ij  |            |        | number        | of samples        |                   |          |
|        |            |        | We will       | try to understand | this with         | the help |
of an analogy
64/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |
| --- | --- | -------------- | --------------------- | --- | --------- | --- |

| Suppose | you | live in | a city | which |     |     |     |     |     |
| ------- | --- | ------- | ------ | ----- | --- | --- | --- | --- | --- |
(cid:88)
|                  |         |     |         |     | E[weight(X)] |     | =     | p(x)weight(x) |     |
| ---------------- | ------- | --- | ------- | --- | ------------ | --- | ----- | ------------- | --- |
| has a population |         | of  | 10M and | you |              |     |       |               |     |
| want to          | compute | the | average |     |              |     | (x∈P) |               |     |
weight of this population Of course, it is going to be hard to get the
|         |       |      |             |     | weights | of every | person | in the | population |
| ------- | ----- | ---- | ----------- | --- | ------- | -------- | ------ | ------ | ---------- |
| You can | think | of X | as a random |     |         |          |        |        |            |
variable which denotes a person and hence in practice we approximate the
|           |          |                 |         |     | above sum    | by         | sampling    | only few        | subjects |
| --------- | -------- | --------------- | ------- | --- | ------------ | ---------- | ----------- | --------------- | -------- |
| The value | assigned |                 | to this |     |              |            |             |                 |          |
|           |          |                 |         |     | from the     | population |             | (say 10000)     |          |
| random    | variable | can             | be any  |     |              |            |             |                 |          |
|           |          |                 |         |     |              |            | (cid:80)    | [p(x)weight(x)] |          |
| person    | from     | your population |         |     |              |            |             |                 |          |
|           |          |                 |         |     | E[weight(X)] | ≈          | x∈P[:10000] |                 |          |
(cid:80)
| For each | person | you | have | an  |     |     |     |     | p(x) |
| -------- | ------ | --- | ---- | --- | --- | --- | --- | --- | ---- |
x∈P[:10000]
| associated | value | denoted |     | by  |          |            |     |           |           |
| ---------- | ----- | ------- | --- | --- | -------- | ---------- | --- | --------- | --------- |
|            |       |         |     |     | Further, | you assume |     | that P(X) | = 1 = 1 , |
N 10K
weight(X)
|         |      |            |     |     | i.e., every | person | in  | your population | is  |
| ------- | ---- | ---------- | --- | --- | ----------- | ------ | --- | --------------- | --- |
| You are | then | interested | in  |     |             |        |     |                 |     |
equally likely
| computing | the | expected | value | of  |     |     | (cid:80) |     |     |
| --------- | --- | -------- | ----- | --- | --- | --- | -------- | --- | --- |
[weight(x)]
|           |     |       |        |     | E[weight(X)] |     | x∈Persons[:10000] |     |     |
| --------- | --- | ----- | ------ | --- | ------------ | --- | ----------------- | --- | --- |
| weight(X) | as  | shown | on the | RHS |              | ≈   |                   |     |     |
104
65/71
|     |     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |
| --- | --- | --- | --- | -------------- | --------------------- | --- | --- | --------- | --- |

|     |     | This looks | easy, | why | can’t | we do | the same |
| --- | --- | ---------- | ----- | --- | ----- | ----- | -------- |
(cid:88)
| E[X] |     | for our | task ? |     |     |     |     |
| ---- | --- | ------- | ------ | --- | --- | --- | --- |
= xp(x)
|     |     | Why can’t | we  | simply | approximate |     | the sum |
| --- | --- | --------- | --- | ------ | ----------- | --- | ------- |
(x∈P)
|     |     | by using       | some | samples?     |     |            |         |
| --- | --- | -------------- | ---- | ------------ | --- | ---------- | ------- |
|     |     | What does      | that | mean?        | It  | means that | instead |
|     |     | of considering |      | all possible |     | values of  |         |
2m+n
|     |     | {v,h} ∈    |          | let us           | just consider |          | some        |
| --- | --- | ---------- | -------- | ---------------- | ------------- | -------- | ----------- |
|     |     | samples    | from     | this population  |               |          |             |
|     |     | Analogy:   | Earlier  | we               | had 10M       | samples  | in the      |
|     |     | population | from     | which            | we            | drew 10K |             |
|     |     | samples,   | now      | we have          | 2m+n          | samples  | in the      |
|     |     | population | from     | which            | we            | need to  | draw a      |
|     |     | reasonable | number   |                  | of samples    |          |             |
|     |     | Why is     | this not | straightforward? |               |          | Let us see! |
66/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|            |     |     | For simplicity,   |           | first let | us just     | focus     | on the  |
| ---------- | --- | --- | ----------------- | --------- | --------- | ----------- | --------- | ------- |
|            |     |     | visible variables |           | (V ∈      | 2m) and     | let us    | see     |
| H ∈ {0,1}n |     |     |                   |           |           |             |           |         |
| c c        |     | c   | what it means     |           | to draw   | samples     | from      | P(V)    |
| 1 2        |     | n   |                   |           |           |             |           |         |
|            |     |     | Well, we          | know      | that V    | = v         | ,v ,...,v | where   |
|            |     |     |                   |           |           | 1           | 2         | m       |
| h h        | ··· | h   |                   |           |           |             |           |         |
| 1 2        |     | n   | each v i ∈        | {0,1}     |           |             |           |         |
|            |     |     | Suppose           | we decide | to        | approximate |           | the sum |
2m
| w   |     | w           | by 10K | samples | instead | of  | the full |     |
| --- | --- | ----------- | ------ | ------- | ------- | --- | -------- | --- |
| 1,1 |     | m,n W ∈Rm×n |        |         |         |     |          |     |
samples
|         |     |     | It is easy | to create | these   | samples | by  |     |
| ------- | --- | --- | ---------- | --------- | ------- | ------- | --- | --- |
|         |     |     | assigning  | values    | to each | v       |     |     |
| v 1 v 2 | ··· | v m |            |           |         | i       |     |     |
For example,
| b b |     | b   |                     |     |     |                  |     |     |
| --- | --- | --- | ------------------- | --- | --- | ---------------- | --- | --- |
| 1 2 |     | m   | V = 11111...11111,V |     |     | = 00000...0000,V |     | =   |
{0,1}m
V ∈
|     |     |     | 00110011...00110011,...V |         |           |             | = 0101...0101 |     |
| --- | --- | --- | ------------------------ | ------- | --------- | ----------- | ------------- | --- |
|     |     |     | are all samples          |         | from this | population  |               |     |
|     |     |     | So which                 | samples | do        | we consider | ?             |     |
67/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): |     |     | Lecture19 |     |     |
| --- | --- | -------------- | --------------------- | --- | --- | --------- | --- | --- |

|     | Well, that’s | where          | the   | catch is! |            |
| --- | ------------ | -------------- | ----- | --------- | ---------- |
|     | Unlike,      | our population |       | analogy,  | here we    |
|     | cannot       | assume that    | every | sample    | is equally |
likely
|     | Why? | (Hint: consider |     | the case | that visible |
| --- | ---- | --------------- | --- | -------- | ------------ |
Likely
|     | variables | correspond | to  | pixels from | natural |
| --- | --------- | ---------- | --- | ----------- | ------- |
images)
|     | Clearly | some images | are | more | likely than the |
| --- | ------- | ----------- | --- | ---- | --------------- |
others!
|     | Hence, | we cannot | assume | that | all samples |
| --- | ------ | --------- | ------ | ---- | ----------- |
2m)
|     | from the | population | (V  | ∈   | are equally |
| --- | -------- | ---------- | --- | --- | ----------- |
likely
Unlikely
68/71
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

|                      |     | Let us      | see this in     | more detail  |             |           |
| -------------------- | --- | ----------- | --------------- | ------------ | ----------- | --------- |
|                      |     | In our      | analogy, every  | person       | was         | equally   |
|                      |     | likely so   | we could        | just sample  | people      |           |
|                      |     | uniformly   | randomly        |              |             |           |
|                      |     | However,    | now if we       | sample       | people      | uniformly |
| Uniform distribution |     | randomly    | then we         | will not     | get the     | true      |
|                      |     | picture     | of the expected | value        |             |           |
|                      |     | We need     | to draw         | more samples | from        | the high  |
|                      |     | probability | region          | and fewer    | samples     | from      |
|                      |     | the low     | probability     | region       |             |           |
|                      |     | In other    | words each      | sample       | needs       | to be     |
|                      |     | drawn       | in proportion   | to its       | probability | and       |
not uniformly
Multimodal distribution
69/71
|     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | -------------- | --------------------- | --- | --------- | --- | --- |

|     |     |     |     | That is | where | the problem | lies! |     |
| --- | --- | --- | --- | ------- | ----- | ----------- | ----- | --- |
∂L(θ|V)
|       | = E    | [v h ]−E | [v h ]     | To draw         | a sample | (V,H),       | we   | need to know |
| ----- | ------ | -------- | ---------- | --------------- | -------- | ------------ | ---- | ------------ |
|       | p(H|V) | i j      | p(V,H) i j |                 |          |              |      |              |
| ∂w ij |        |          |            | its probability |          | P(V,H)       |      |              |
|       |        |          |            | And of          | course,  | we also need | this | P(V,H)to     |
(cid:88)(cid:88)(cid:16)(cid:89)(cid:89)
|     |          |                   |        | compute            | the expectation |           |                  |           |
| --- | -------- | ----------------- | ------ | ------------------ | --------------- | --------- | ---------------- | --------- |
|     | Z =      | φ ij (v i         | ,h j ) |                    |                 |           |                  |           |
|     | V H      | i j               |        |                    |                 |           |                  |           |
|     |          |                   |        | But, unfortunately |                 | computing |                  | P(V,H) is |
|     | (cid:89) | (cid:89) (cid:17) |        |                    |                 |           |                  |           |
|     | ψ (v )   | ξ (h )            |        | intractable        | because         | of the    | partition        | function  |
|     | i i      | j j               |        |                    |                 |           |                  |           |
|     | i        | j                 |        | Z                  |                 |           |                  |           |
|     |          |                   |        | Hence,             | approximating   | the       | summation        | by        |
|     |          |                   |        | using a            | few samples     | is not    | straightforward! |           |
|     |          |                   |        | (or rather         | drawing         | a few     | samples          | from the  |
|     |          |                   |        | distribution       | is              | hard!)    |                  |           |
70/71
|     |     |     | MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture19 |     |     |
| --- | --- | --- | -------------- | --------------------- | --- | --------- | --- | --- |

| The story so | far |     |     |     |
| ------------ | --- | --- | --- | --- |
Conclusion: Okay, I get it that drawing samples from this distribution P is
hard.
Question: Is it possible to draw samples from an easier distribution (say, Q) as
long as I am sure that if I keep drawing samples from Q eventually my
| samples will | start looking | as if they | were drawn from | P!  |
| ------------ | ------------- | ---------- | --------------- | --- |
Answer: Well if you can actually prove this then why not? (and that’s what
| we do in | Gibbs Sampling) |     |     |     |
| -------- | --------------- | --- | --- | --- |
71/71
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture19 |
| --- | --- | -------------- | --------------------- | --------- |
