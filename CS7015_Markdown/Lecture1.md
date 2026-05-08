| CS7015 (Deep    | Learning)  | : Lecture     | 1   |
| --------------- | ---------- | ------------- | --- |
| (Partial/Brief) | History of | Deep Learning |     |
Mitesh M. Khapra
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/81

Acknowledgements
Most of this material is based on the article “Deep Learning in Neural Networks:
Schmidhuber[1]
| An Overview” | by J.       |               |             |          |
| ------------ | ----------- | ------------- | ----------- | -------- |
| The errors,  | if any, are | due to me and | I apologize | for them |
Feel free to contact me if you think certain portions need to be corrected (please
| provide | appropriate references) |     |     |     |
| ------- | ----------------------- | --- | --- | --- |
2/81
|     |     | MiteshM.Khapra | CS7015(DeepLearning):Lecture1 |     |
| --- | --- | -------------- | ----------------------------- | --- |

| Chapter | 1: Biological | Neurons |
| ------- | ------------- | ------- |
3/81
Module1.1

| Reticular   | Theory       |               |          |
| ----------- | ------------ | ------------- | -------- |
| Joseph von  | Gerlach      | proposed that | the ner- |
| vous system | is a single  | continuous    | network  |
| as opposed  | to a network | of many       | discrete |
cells!
1871-1873
Reticulartheory
4/81
Module1.1

| Staining | Technique |     |     |
| -------- | --------- | --- | --- |
CamilloGolgidiscoveredachemicalreaction
| that allowed | him       | to examine   | nervous tissue |
| ------------ | --------- | ------------ | -------------- |
| in much      | greater   | detail than  | ever before    |
| He was a     | proponent | of Reticular | theory.        |
1871-1873
Reticulartheory
5/81
Module1.1

| Neuron          | Doctrine |             |                |            |          |
| --------------- | -------- | ----------- | -------------- | ---------- | -------- |
| Santiago        | Ram´on   | y Cajal     | used           | Golgi’s    | tech-    |
| nique to        | study    | the nervous |                | system and | pro-     |
| posed that      | it       | is actually | made           | up of      | discrete |
| individual      | cells    | formimg     | a              | network    | (as op-  |
| posed to        | a single | continuous  |                | network)   |          |
| 1871-1873       |          |             | 1888-1891      |            |          |
| Reticulartheory |          |             | NeuronDoctrine |            |          |
6/81
Module1.1

| The Term     | Neuron     |                    |          |
| ------------ | ---------- | ------------------ | -------- |
| The term     | neuron was | coined             | by Hein- |
| rich Wilhelm | Gottfried  | von Waldeyer-Hartz |          |
around 1891.
| He further | consolidated | the Neuron | Doc- |
| ---------- | ------------ | ---------- | ---- |
trine.
| 1871-1873       |                | 1888-1891 |     |
| --------------- | -------------- | --------- | --- |
| Reticulartheory | NeuronDoctrine |           |     |
7/81
Module1.1

| Nobel | Prize |     |     |     |
| ----- | ----- | --- | --- | --- |
BothGolgi(reticulartheory)andCajal(neu-
| ron doctrine) | were | jointly | awarded | the 1906 |
| ------------- | ---- | ------- | ------- | -------- |
NobelPrizeforPhysiologyorMedicine,that
| resulted        | in lasting | conflicting    | ideas       | and con-   |
| --------------- | ---------- | -------------- | ----------- | ---------- |
| troversies      | between    | the two        | scientists. |            |
| 1871-1873       |            | 1888-1891      |             | 1906       |
| Reticulartheory |            | NeuronDoctrine |             | NobelPrize |
8/81
Module1.1

| The Final       | Word          |                      |          |            |         |     |
| --------------- | ------------- | -------------------- | -------- | ---------- | ------- | --- |
| In 1950s        | electron      | microscopy           |          | finally    | con-    |     |
| firmed          | the neuron    |                      | doctrine | by         | unam-   |     |
| biguously       | demonstrating |                      | that     | nerve      | cells   |     |
| were individual |               | cells interconnected |          |            | through |     |
| synapses        | (a network    | of                   | many     | individual | neu-    |     |
rons).
| 1871-1873       |     | 1888-1891      |     |     | 1906       | 1950    |
| --------------- | --- | -------------- | --- | --- | ---------- | ------- |
| Reticulartheory |     | NeuronDoctrine |     |     | NobelPrize | Synapse |
9/81
Module1.1

| Chapter | 2: From | Spring | to Winter | of AI |
| ------- | ------- | ------ | --------- | ----- |
10/81
Module2

| McCulloch      | Pitts            | Neuron              |
| -------------- | ---------------- | ------------------- |
| McCulloch      | (neuroscientist) | and Pitts (logi-    |
| cian) proposed | a highly         | simplified model of |
| the neuron     | (1943)[2]        |                     |
1943
MPNeuron
11/81
Module2

Perceptron
| “the perceptron | may        | eventually be | able to |
| --------------- | ---------- | ------------- | ------- |
| learn, make     | decisions, | and translate | lan-    |
| guages” -Frank  | Rosenblatt |               |         |
|                 | 1943       | 1957-1958     |         |
|                 | MPNeuron   | Perceptron    |         |
12/81
Module2

Perceptron
| “the embryo        | of an     | electronic | computer that       |
| ------------------ | --------- | ---------- | ------------------- |
| the Navy           | expects   | will be    | able to walk, talk, |
| see, write,        | reproduce | itself     | and be conscious    |
| of its existence.” |           | -New York  | Times               |
|                    | 1943      |            | 1957-1958           |
|                    | MPNeuron  |            | Perceptron          |
13/81
Module2

| First generation | Multilayer |     |
| ---------------- | ---------- | --- |
Perceptrons
Ivakhnenko et. al.[3]
| 1943     | 1957-1958  | 1965-1968 |
| -------- | ---------- | --------- |
| MPNeuron | Perceptron | MLP       |
14/81
Module2

| Perceptron       | Limitations     |                |                |
| ---------------- | --------------- | -------------- | -------------- |
| In their         | now famous book | “Perceptrons”, |                |
| Minsky and       | Papert outlined | the limits     | of             |
| what perceptrons | could do[4]     |                |                |
|                  | 1943            | 1957-1958      | 1965-19681969  |
|                  | MPNeuron        | Perceptron     | MLPLimitations |
15/81
Module2

| AI Winter   | of connectionism   |            |     |     |
| ----------- | ------------------ | ---------- | --- | --- |
| Almost lead | to the abandonment | of connec- |     |     |
tionist AI
|     | 1943     | 1957-1958  | 1965-19681969  | 1969-1986 |
| --- | -------- | ---------- | -------------- | --------- |
|     | MPNeuron | Perceptron | MLPLimitations | AIWinter  |
16/81
Module2

Backpropagation
| Discovered       | and rediscovered | several    |     |     |     |
| ---------------- | ---------------- | ---------- | --- | --- | --- |
| times throughout | 1960’s           | and 1970’s |     |     |     |
Werbos(1982)[5]
|            | first         | used it in      | the            |           |      |
| ---------- | ------------- | --------------- | -------------- | --------- | ---- |
| context    | of artificial | neural networks |                |           |      |
| Eventually | popularized   | by the work     | of             |           |      |
| Rumelhart  | et. al. in    | 1986[6]         |                |           |      |
|            | 1943          | 1957-1958       | 1965-19681969  | 1969-1986 | 1986 |
|            | MPNeuron      | Perceptron      | MLPLimitations | AIWinter  |      |
Backpropagation
17/81
Module2

| Gradient          | Descent             |               |                |           |      |
| ----------------- | ------------------- | ------------- | -------------- | --------- | ---- |
| Cauchy discovered | Gradient            | Descent moti- |                |           |      |
| vated by          | the need to compute | the orbit     | of             |           |      |
| heavenly          | bodies              |               |                |           |      |
| 1847              | 1943                | 1957-1958     | 1965-19681969  | 1969-1986 | 1986 |
| GradientDescent   | MPNeuron            | Perceptron    | MLPLimitations | AIWinter  |      |
Backpropagation
18/81
Module2

| Universal | Approximation | The- |     |     |     |
| --------- | ------------- | ---- | --- | --- | --- |
orem
| A multilayered | network   | of neurons with     | a   |     |     |
| -------------- | --------- | ------------------- | --- | --- | --- |
| single hidden  | layer can | be used to approxi- |     |     |     |
mateanycontinuousfunctiontoanydesired
precision[7]
| 1847 | 1943 | 1957-1958 | 1965-19681969 | 1969-1986 | 1986 1989 |
| ---- | ---- | --------- | ------------- | --------- | --------- |
GradientDescent MPNeuron Perceptron MLPLimitations AIWinter UAT
Backpropagation
19/81
Module2

| Chapter | 3: The | Deep Revival |
| ------- | ------ | ------------ |
20/81
Module3

| Unsupervised | Pre-Training        |          |           |         |
| ------------ | ------------------- | -------- | --------- | ------- |
| Hinton       | and Salakhutdinov   |          | described | an ef-  |
| fective      | way of initializing | the      | weights   | that    |
| allows deep  | autoencoder         | networks | to        | learn a |
data.[8]
| low-dimensional | representation |     | of  |     |
| --------------- | -------------- | --- | --- | --- |
2006
UnsupervisedPre-Training
21/81
Module3

| Unsupervised | Pre-Training      |                  |       |
| ------------ | ----------------- | ---------------- | ----- |
| The idea     | of unsupervised   | pre-training     | actu- |
| ally dates   | back to 1991-1993 | (J. Schmidhu-    |       |
| ber) when    | it was used       | to train a “Very | Deep  |
Learner”
| 1991-1993 | 2006 |     |     |
| --------- | ---- | --- | --- |
UnsupervisedPre-Training
VeryDeepLearner
22/81
Module3

More insights (2007-2009)
Further Investigations into the effectiveness
of Unsupervised Pre-training
1991-1993 2006-2009
VeryDeepLearner UnsupervisedPretraining
23/81
Module3

| Success | in Handwriting | Recog- |     |
| ------- | -------------- | ------ | --- |
nition
| Graves et. | al. outperformed | all entries | in an |
| ---------- | ---------------- | ----------- | ----- |
internationalArabichandwritingrecognition
competition[9]
|                 | Dahl et.           | al. showed relative |        |
| --------------- | ------------------ | ------------------- | ------ |
| error reduction | of 16.0%           | and 23.2%           | over a |
| state of        | the art system[10] |                     |        |
| 1991-1993       | 2006-2009          | 2009                |        |
Handwriting
| VeryDeepLearner | UnsupervisedPretraining |     |     |
| --------------- | ----------------------- | --- | --- |
24/81
Module3

| Success  | in         | Speech   | Recognition |            |
| -------- | ---------- | -------- | ----------- | ---------- |
| Dahl et. | al. showed | relative | error       | reduction  |
| of 16.0% | and 23.2%  | over     | a state     | of the art |
system[10]
| 1991-1993       |     | 2006-2009            | 2009                | 2010 |
| --------------- | --- | -------------------- | ------------------- | ---- |
|                 |     |                      | H a ndwritingSpeech |      |
| VeryDeepLearner |     | UnsupervisedPretrain | in g                |      |
25/81
Module3

| New record      |      | on MNIST             |            |                       |
| --------------- | ---- | -------------------- | ---------- | --------------------- |
| Ciresan et.     | al.  | set a                | new record | on the                |
| MNIST dataset   |      | using good           | old        | backpropa-            |
| gation on       | GPUs | (GPUs                | enter the  | scene)[11]            |
| 1991-1993       |      | 2006-2009            | 2009       | 2010                  |
|                 |      |                      | H a nd w   | r i ti n g S pe ec h  |
| VeryDeepLearner |      | UnsupervisedPretrain | in g R     | e c o r d o n M N IST |
26/81
Module3

| First | Superhuman |     | Visual | Pat- |
| ----- | ---------- | --- | ------ | ---- |
tern Recognition
| D. C. Ciresan | et.       | al.     | achieved | 0.56% error |
| ------------- | --------- | ------- | -------- | ----------- |
| rate in       | the IJCNN | Traffic | Sign     | Recognition |
Competition[12]
| 1991-1993       |     | 2006-2009            | 2009     | 2010 2011             |
| --------------- | --- | -------------------- | -------- | --------------------- |
|                 |     |                      | H a nd w | r i ti n g S pe ec h  |
| VeryDeepLearner |     | UnsupervisedPretrain | in g R   | e c o r d o n M N IST |
VisualPattern
Recognition 27/81
Module3

| Winning |     | more | visual | recogni- |     |
| ------- | --- | ---- | ------ | -------- | --- |
tion challenges
|     | Network     |     | Error | Layers |     |
| --- | ----------- | --- | ----- | ------ | --- |
|     | AlexNet[13] |     | 16.0% | 8      |     |
|     | ZFNet[14]   |     | 11.2% | 8      |     |
|     | VGGNet[15]  |     | 7.3%  | 19     |     |
GoogLeNet[16]
|     |     |     | 6.7% | 22  |     |
| --- | --- | --- | ---- | --- | --- |
ResNet[17]
|     | MS        |     | 3.6%      | 152!!                       |           |
| --- | --------- | --- | --------- | --------------------------- | --------- |
|     | 1991-1993 |     | 2006-2009 | 2009 2010 2011              | 2012-2016 |
|     |           |     | H         | a nd w r i ti n g S pe ec h |           |
VeryDeepLearner UnsupervisedPretrain in g R e c o r d o n M N IST SuccessonImageNet
VisualPattern
Recognition 28/81
Module3

| Chapter | 4: From | Cats | to Convolutional | Neural Networks |
| ------- | ------- | ---- | ---------------- | --------------- |
29/81
Module4

| Hubel | and Wiesel | Experiment |     |
| ----- | ---------- | ---------- | --- |
Experimentallyshowedthateachneuronhas
| a fixed   | receptive field | - i.e. a neuron     | will |
| --------- | --------------- | ------------------- | ---- |
| fire only | in response     | to a visual stimuli | in a |
space[18]
| specific | region in the | visual |     |
| -------- | ------------- | ------ | --- |
1959
HandWexperiment
30/81
Module4

Neocognitron
| Used for Handwritten |             | character recogni- |     |
| -------------------- | ----------- | ------------------ | --- |
| tion and pattern     | recognition | (Fukushima         | et. |
al.)[19]
1959 1980
| HandWexperiment |     |     | Neocognitron |
| --------------- | --- | --- | ------------ |
31/81
Module4

| Convolutional   | Neural               | Network     |              |      |
| --------------- | -------------------- | ----------- | ------------ | ---- |
| Handwriting     | digit recognition    | using back- |              |      |
| propagation     | over a Convolutional | Neural      |              |      |
| Network         | (LeCun et. al.)[20]  |             |              |      |
| 1959            |                      |             | 1980         | 1989 |
| HandWexperiment |                      |             | Neocognitron | CNN  |
32/81
Module4

LeNet-5
| Introduced      | the (now     | famous) MNIST |              |      |         |
| --------------- | ------------ | ------------- | ------------ | ---- | ------- |
| dataset (LeCun  | et. al.)[21] |               |              |      |         |
| 1959            |              |               | 1980         | 1989 | 1998    |
| HandWexperiment |              |               | Neocognitron | CNN  | LeNet-5 |
33/81
Module4

| An algorithm | inspired       | by an     | experiment | on cats | is today |
| ------------ | -------------- | --------- | ---------- | ------- | -------- |
| used         | to detect cats | in videos | :-)        |         |          |
34/81
Module4

| Chapter | 5: Faster, | higher, stronger |
| ------- | ---------- | ---------------- |
35/81
Module5

Better Optimization Methods
Faster convergence, better accuracies
| 1983 | 2011 2012 2015 | 2016 2018 |
| ---- | -------------- | --------- |
Adagrad Adam/BatchNormBeyondAdam
| Nesterov | RMSProp | Eve |
| -------- | ------- | --- |
36/81
Module5

| Chapter | 6: The | Curious | Case | of Sequences |
| ------- | ------ | ------- | ---- | ------------ |
37/81
Module6

Sequences
| They are     | everywhere      |                    |
| ------------ | --------------- | ------------------ |
| Time series, | speech,         | music, text, video |
| Each unit    | in the sequence | interacts          |
| with other   | units           |                    |
| Need models  | to capture      | this               |
interaction
38/81
Module6

| Hopfield Network       |                |     |
| ---------------------- | -------------- | --- |
| Content-addressable    | memory systems | for |
| storing and retrieving | patterns[22]   |     |
1982
Hopfield
39/81
Module6

| Jordan        | Network           |                 |           |
| ------------- | ----------------- | --------------- | --------- |
| The output    | state of each     | time step       | is fed to |
| the next      | time step thereby | allowing        | interac-  |
| tions between | time steps        | in the sequence |           |
| 1982          | 1986              |                 |           |
| Hopfield      | Jordan            |                 |           |
40/81
Module6

| Elman         | Network           |                 |           |
| ------------- | ----------------- | --------------- | --------- |
| The hidden    | state of each     | time step       | is fed to |
| the next      | time step thereby | allowing        | interac-  |
| tions between | time steps        | in the sequence |           |
| 1982          | 1986              | 1990            |           |
| Hopfield      | Jordan            | Elman           |           |
41/81
Module6

| Drawbacks  | of             | RNNs             |         |
| ---------- | -------------- | ---------------- | ------- |
| Hochreiter | et. al.        | and Bengio       | et. al. |
| showed     | the difficulty | in training RNNs | (the    |
| problem    | of exploding   | and vanishing    | gradi-  |
ents)
| 1982     | 1986   | 1990 1991-1994     |     |
| -------- | ------ | ------------------ | --- |
| Hopfield | Jordan | Elman RNNdrawbacks |     |
42/81
Module6

| Long Short       | Term       | Memory   |        |
| ---------------- | ---------- | -------- | ------ |
| Showed thatLSTMs | cansolve   | complex  | long   |
| time lag tasks   | that could | never be | solved |
before
| 1982     | 1986 1990    | 1991-1994    | 1997  |
| -------- | ------------ | ------------ | ----- |
| Hopfield | Jordan Elman | RNNdrawbacks | LSTMs |
43/81
Module6

| Sequence | To Sequence | Learn- |     |     |
| -------- | ----------- | ------ | --- | --- |
ing
| Initial      | success in using  | RNNs/LSTMs   |       |                   |
| ------------ | ----------------- | ------------ | ----- | ----------------- |
| for large    | scale Sequence    | To Sequence  |       |                   |
| Learning     | Problems          |              |       |                   |
| Introduction | of Attention      | which        |       |                   |
| inspired     | a lot of research | over the     | next  |                   |
| two years    |                   |              |       |                   |
| 1982         | 1986 1990         | 1991-1994    | 1997  | 2014              |
| Hopfield     | Jordan Elman      | RNNdrawbacks | LSTMs | Seq2Seq-Attention |
44/81
Module6

| RL for            | Attention        |           |       |     |
| ----------------- | ---------------- | --------- | ----- | --- |
| Schmidhuber       | & Huber proposed | RNNs      | that  |     |
| use reinforcement | learning         | to decide | where |     |
to look
| 1982     | 1986 1990 19911991-1994 |              | 1997  | 2014              |
| -------- | ----------------------- | ------------ | ----- | ----------------- |
| Hopfield | Jordan Elman            | RNNdrawbacks | LSTMs | Seq2Seq-Attention |
RL-Attention
45/81
Module6

| Beating | humans | at their | own game | (literally) |
| ------- | ------ | -------- | -------- | ----------- |
46/81
Module7

| Playing Atari | Games           |             |
| ------------- | --------------- | ----------- |
| Human-level   | control through | deep        |
| reinforcement | learning        | for playing |
Atari Games[23]
2015
DQNs
47/81
Module7

Let’s GO
| Alpha Go   | Zero - Best        | Go player   | ever,  |
| ---------- | ------------------ | ----------- | ------ |
| surpassing | human              | players[24] |        |
| GO is more | complex            | than chess  |        |
| because    | of number          | of possible | moves  |
| No brute   | force backtracking |             | unlike |
| previous   | chess agents       |             |        |
22001155
DQNs/AlphaGO
48/81
Module7

| Taking       | a shot           | at Poker        |           |
| ------------ | ---------------- | --------------- | --------- |
| DeepStack    | defeated         | 11 professional | poker     |
| players with | only one         | outside the     | margin of |
| statistical  | significance[25] |                 |           |
| 22001155     |                  |                 | 2016      |
| DQNs/AlphaGO |                  |                 | Poker     |
49/81
Module7

| Defense of         | the Ancients |          |       |       |
| ------------------ | ------------ | -------- | ----- | ----- |
| Widely popular     | game, with   | complex  |       |       |
| strategies, large  | visual space |          |       |       |
| Bot was undefeated | against      | many top |       |       |
| professional       | players      |          |       |       |
| 22001155           |              |          | 2016  | 2017  |
| DQNs/AlphaGO       |              |          | Poker | Dota2 |
50/81
Module7

| Chapter | 8: The | Madness | (2013-) |
| ------- | ------ | ------- | ------- |
51/81
Module8

Language Modeling
He sat on a chair.
Mikolov et al. (2010)[26]
Kiros et al. (2015)[27]
Kim et al. (2015)[28]
52/81
Module8

Speech Recognition
Hinton et al. (2012)[29]
Graves et al. (2013)[30]
Chorowski et al. (2015)[31]
Sak et al. (2015)[32]
53/81
Module8

Machine Translation
Kalchbrenner et al. (2013)[33]
Cho et al. (2014)[34]
Bahdanau et al. (2015)[35]
Jean et al. (2015)[36]
Gulcehre et al. (2015)[37]
Sutskever et al. (2014)[38]
Luong et al. (2015)[39]
Zheng et al. (2017)[40]
Cheng et al. (2016)[41]
Chen et al. (2017)[42]
Firat et al. (2016)[43]
54/81
Module8

Conversation Modeling
Shang et al. (2015)[44]
Vinyals et al. (2015)[45]
Lowe et al. (2015)[46]
Dodge et al. (2015)[47]
Weston et al. (2016)[48]
Serban et al. (2016)[49]
Bordes et al. (2017)[50]
Serban et al. (2017)[51]
55/81
Module8

Question Answering
Hermann et al. (2015)[52]
Chen et al. (2016)[53]
Xiong et al. (2016)[54]
Seo et al. (2016)[55]
Dhingra et al. (2017)[56]
Wang et al. (2017)[57]
Hu et al. (2017)[58]
56/81
Module8

Object Detection/Recognition
| Semantic | Segmentation | (Long et al, |
| -------- | ------------ | ------------ |
2015)[59]
| Recurrent | CNNs (Liang | et al., |
| --------- | ----------- | ------- |
2015)[60]
| Faster RCNN    | (Ren et   | al., 2015)[61] |
| -------------- | --------- | -------------- |
| Inside-Outside | Net (Bell | et al.,        |
2015)[62]
2016)[63]
| YOLO9000     | (Redmon                | et al.,        |
| ------------ | ---------------------- | -------------- |
| R-FCN        | (Dai et al., 2016)[64] |                |
| Mask R-CNN   | (He at                 | al., 2017)[65] |
| Video Object | segmentation           | (Caelles et    |
al., 2017)[66]
57/81
Module8

Visual Tracking
Choi et al. (2017)[67]
Yun et al. (2017)[68]
Alahi et al. (2017)[69]
58/81
Module8

Image Captioning
Mao et al. (2014)[70]
Mao at al. (2015)[71]
Kiros et al. (2015)[72]
Donahue et al. (2015)[73]
Vinyals et al. (2015)[74]
Karpathy et al. (2015)[75]
Fang et al. (2015)[76]
Chen et al. (2015)[77]
59/81
Module8

Video Captioning
Donahue et al. (2014)[78]
Venugopalan at al. (2014)[79]
Pan et al. (2015)[80]
Yao et al. (2015)[81]
Rohrbach et al. (2015)[82]
Zhu et al. (2015)[83]
Cho et al. (2015)[34]
60/81
Module8

Visual Question Answering
Santoro et al. (2017)[84]
Hu at al. (2017)[85]
Johnson et al. (2017)[86]
Ben-younes et al. (2017)[87]
Malinowski et al. (2017)[88]
Kazemi et al. (2016)[89]
61/81
Module8

Video Question Answering
Tapaswi et. al. 2016[90]
Zeng et. al. 2016[91]
Maharaj et. al. 2017[92]
Zhao et. al. 2017[93]
Yu Youngjae et. al. 2017[94]
Xue Hongyang et. al.
2017[95]
Mazaheri et. al. 2017[96]
62/81
Module8

Video Summarization
Chheng 2007[97]
Ajmal 2012[98]
Zhang Ke 2016[99]
Zhong Ji 2017[100]
Panda 2017[101]
63/81
Module8

| Generating Authentic | Photos              |          |
| -------------------- | ------------------- | -------- |
| Variational          | Autoencoders        |          |
| (Kingma              | et. al., 2013)[102] |          |
| Generative           | Adversarial         |          |
| Networks             | (Goodfellow         | et. al., |
2014)[103]
| Plug &      | Play generative    | nets    |
| ----------- | ------------------ | ------- |
| (Nguyen     | et al., 2016)[104] |         |
| Progressive | Growing            | of GANs |
| (Karras     | et al., 2017)[105] |         |
64/81
Module8

Generating Raw Audio
Wavenets (Oord et. al.,
2016)[106]
65/81
Module8

Pixel RNNs
(Oord et al., 2016)[107]
(Oord et al., 2016)[108]
(Salimans et al., 2017)[109]
66/81
Module8

| Chapter | 9: (Need | for) Sanity |
| ------- | -------- | ----------- |
67/81
Module9

| The Paradox   |             | of           | Deep                 | Learning        |     |     |
| ------------- | ----------- | ------------ | -------------------- | --------------- | --- | --- |
| Why does deep | learning    | work         | so                   | well despite    |     |     |
| high capacity |             | (susceptible |                      | to overfitting) |     |     |
| numerical     | instability |              | (vanishing/exploding |                 |     |     |
gradients)
| sharp            | minima       | (leading        | to overfitting) |                  |                 |     |
| ---------------- | ------------ | --------------- | --------------- | ---------------- | --------------- | --- |
| non-robustness   |              | (see            | figure)         |                  |                 |     |
| No clear answers | yet          | but             | ...             |                  |                 |     |
| Slowly           | but steadily |                 | there is        | increasing       | emphasis        | on  |
| explainability   |              | and theoretical |                 | justifications!∗ |                 |     |
| Hopefully        | this         | will bring      | sanity          | to               | the proceedings | !   |
∗https://arxiv.org/pdf/1710.05468.pdf
68/81
Module9

https://github.com/kjw0612/awesome-rnn
69/81
Module9

iSource: https://www.cbinsights.com/blog/deep-learning-ai-startups-market-map-company-list/ 70/81
Module9

References I
[1] Ju¨rgenSchmidhuber.Deeplearninginneuralnetworks:Anoverview.NeuralNetworks,61:85–117,2015.
[2] W.S.McCullochandW.Pitts.Alogivalcalculusoftheideasimminentinnervousactivity.1943.
[3] A.G.IvakhnenkoandV.G.Lapa.Cyberneticpredictingdevices.1965.
[4] M.MinskyandS.Papert.Perceptrons.1969.
[5] P.J.Werbos.Applicationsofadvancesinnonlinearsensitivityanalysis.InProceedingsofthe10thIFIPConference,31.8-4.9,NYC,pages
762–770,1981.
[6] D.E.Rumelhart,G.E.Hinton,andR.J.Williams.Learninginternalrepresentationsbyerrorpropagation.InD.E.RumelhartandJ.L.
McClelland,editors,ParallelDistributedProcessing,volume1,pages318–362.MITPress,1986.
[7] KurtHornik,MaxwellStinchcombe,andHalbertWhite.Multilayerfeedforwardnetworksareuniversalapproximators.NeuralNetworks,
2(5):359–366,1989.
[8] RuslanSalakhutdinovandGeoffreyHinton.Anefficientlearningprocedurefordeepboltzmannmachines.NeuralComput.,24(8):1967–2006,
August2012.
[9] AlexGravesandJu¨rgenSchmidhuber.Offlinehandwritingrecognitionwithmultidimensionalrecurrentneuralnetworks.InD.Koller,
D.Schuurmans,Y.Bengio,andL.Bottou,editors,AdvancesinNeuralInformationProcessingSystems21,pages545–552.CurranAssociates,
Inc.,2009.
[10] G.E.Dahl,DongYu,LiDeng,andA.Acero.Context-dependentpre-traineddeepneuralnetworksforlarge-vocabularyspeechrecognition.
Trans.Audio,SpeechandLang.Proc.,20(1):30–42,January2012.
[11] DanClaudiuCiresan,UeliMeier,LucaMariaGambardella,andJu¨rgenSchmidhuber.Deepbigsimpleneuralnetsexcelonhandwrittendigit
recognition.CoRR,abs/1003.0358,2010.
[12] DanC.Ciresan,UeliMeier,andJu¨rgenSchmidhuber.Multi-columndeepneuralnetworksforimageclassification.CoRR,abs/1202.2745,
2012.
71/81
Module9

References II
[13] AlexKrizhevsky,IlyaSutskever,andGeoffreyEHinton.Imagenetclassificationwithdeepconvolutionalneuralnetworks.InF.Pereira,C.J.C.
Burges,L.Bottou,andK.Q.Weinberger,editors,AdvancesinNeuralInformationProcessingSystems25,pages1097–1105.Curran
Associates,Inc.,2012.
[14] MatthewD.ZeilerandRobFergus.Visualizingandunderstandingconvolutionalnetworks.CoRR,abs/1311.2901,2013.
[15] KarenSimonyanandAndrewZisserman.Verydeepconvolutionalnetworksforlarge-scaleimagerecognition.CoRR,abs/1409.1556,2014.
[16] ChristianSzegedy,WeiLiu,YangqingJia,PierreSermanet,ScottE.Reed,DragomirAnguelov,DumitruErhan,VincentVanhoucke,and
AndrewRabinovich.Goingdeeperwithconvolutions.CoRR,abs/1409.4842,2014.
[17] KaimingHe,XiangyuZhang,ShaoqingRen,andJianSun.Deepresiduallearningforimagerecognition.CoRR,abs/1512.03385,2015.
[18] D.H.WieselandT.N.Hubel.Receptivefieldsofsingleneuronesinthecat’sstriatecortex.J.Physiol.,148:574–591,1959.
[19] K.Fukushima.Neocognitron:Aself-organizingneuralnetworkforamechanismofpatternrecognitionunaffectedbyshiftinposition.
BiologicalCybernetics,36(4):193–202,1980.
[20] Y.LeCun,B.Boser,J.S.Denker,D.Henderson,R.E.Howard,W.Hubbard,andL.D.Jackel.Back-propagationappliedtohandwrittenzip
coderecognition.NeuralComputation,1(4):541–551,1989.
[21] Y.LeCun,L.Bottou,Y.Bengio,andP.Haffner.Gradient-basedlearningappliedtodocumentrecognition.ProceedingsoftheIEEE,
86(11):2278–2324,November1998.
[22] J.J.Hopfield.Neuralnetworksandphysicalsystemswithemergentcollectivecomputationalabilities.Proc.oftheNationalAcademyof
Sciences,79:2554–2558,1982.
[23] VolodymyrMnih,KorayKavukcuoglu,DavidSilver,AlexGraves,IoannisAntonoglou,DaanWierstra,andMartinRiedmiller.Playingatari
withdeepreinforcementlearning.arXivpreprintarXiv:1312.5602,2013.
[24] DavidSilver,AjaHuang,ChrisJMaddison,ArthurGuez,LaurentSifre,GeorgeVanDenDriessche,JulianSchrittwieser,IoannisAntonoglou,
VedaPanneershelvam,MarcLanctot,etal.Masteringthegameofgowithdeepneuralnetworksandtreesearch.nature,529(7587):484–489,
2016.
[25] MatejMoravc´ık,MartinSchmid,NeilBurch,ViliamLis´y,DustinMorrill,NolanBard,TrevorDavis,KevinWaugh,MichaelJohanson,and
MichaelH.Bowling.Deepstack:Expert-levelartificialintelligenceinno-limitpoker.CoRR,abs/1701.01724,2017.
72/81
Module9

References III
[26] TomasMikolov,MartinKarafi´at,Luk´asBurget,JanCernock´y,andSanjeevKhudanpur.Recurrentneuralnetworkbasedlanguagemodel.In
INTERSPEECH2010,11thAnnualConferenceoftheInternationalSpeechCommunicationAssociation,Makuhari,Chiba,Japan,September
26-30,2010,pages1045–1048,2010.
[27] RyanKiros,YukunZhu,RuslanSalakhutdinov,RichardS.Zemel,RaquelUrtasun,AntonioTorralba,andSanjaFidler.Skip-thoughtvectors.
InAdvancesinNeuralInformationProcessingSystems28:AnnualConferenceonNeuralInformationProcessingSystems2015,December
7-12,2015,Montreal,Quebec,Canada,pages3294–3302,2015.
[28] YoonKim,YacineJernite,DavidSontag,andAlexanderM.Rush.Character-awareneurallanguagemodels.CoRR,abs/1508.06615,2015.
[29] Deepneuralnetworksforacousticmodelinginspeechrecognition:Thesharedviewsoffourresearchgroups.IEEESignalProcess.Mag.,
29(6):82–97,2012.
[30] AlexGraves,Abdel-rahmanMohamed,andGeoffreyE.Hinton.Speechrecognitionwithdeeprecurrentneuralnetworks.InIEEEInternational
ConferenceonAcoustics,SpeechandSignalProcessing,ICASSP2013,Vancouver,BC,Canada,May26-31,2013,pages6645–6649,2013.
[31] JanChorowski,DzmitryBahdanau,DmitriySerdyuk,KyunghyunCho,andYoshuaBengio.Attention-basedmodelsforspeechrecognition.In
AdvancesinNeuralInformationProcessingSystems28:AnnualConferenceonNeuralInformationProcessingSystems2015,December7-12,
2015,Montreal,Quebec,Canada,pages577–585,2015.
[32] HasimSak,AndrewW.Senior,KanishkaRao,andFran¸coiseBeaufays.Fastandaccuraterecurrentneuralnetworkacousticmodelsforspeech
recognition.InINTERSPEECH2015,16thAnnualConferenceoftheInternationalSpeechCommunicationAssociation,Dresden,Germany,
September6-10,2015,pages1468–1472,2015.
[33] NalKalchbrennerandPhilBlunsom.Recurrentcontinuoustranslationmodels.InProceedingsofthe2013ConferenceonEmpiricalMethods
inNaturalLanguageProcessing,EMNLP2013,18-21October2013,GrandHyattSeattle,Seattle,Washington,USA,AmeetingofSIGDAT,
aSpecialInterestGroupoftheACL,pages1700–1709,2013.
[34] KyunghyunCho,BartvanMerrienboer,C¸aglarGu¨l¸cehre,DzmitryBahdanau,FethiBougares,HolgerSchwenk,andYoshuaBengio.Learning
phraserepresentationsusingRNNencoder-decoderforstatisticalmachinetranslation.InProceedingsofthe2014ConferenceonEmpirical
MethodsinNaturalLanguageProcessing,EMNLP2014,October25-29,2014,Doha,Qatar,AmeetingofSIGDAT,aSpecialInterestGroup
oftheACL,pages1724–1734,2014.
73/81
Module9

References IV
[35] DzmitryBahdanau,KyunghyunCho,andYoshuaBengio.Neuralmachinetranslationbyjointlylearningtoalignandtranslate.CoRR,
abs/1409.0473,2014.
[36] S´ebastienJean,KyungHyunCho,RolandMemisevic,andYoshuaBengio.Onusingverylargetargetvocabularyforneuralmachine
translation.InProceedingsofthe53rdAnnualMeetingoftheAssociationforComputationalLinguisticsandthe7thInternationalJoint
ConferenceonNaturalLanguageProcessingoftheAsianFederationofNaturalLanguageProcessing,ACL2015,July26-31,2015,Beijing,
China,Volume1:LongPapers,pages1–10,2015.
[37] C¸aglarGu¨lc¸ehre,OrhanFirat,KelvinXu,KyunghyunCho,Lo¨ıcBarrault,Huei-ChiLin,FethiBougares,HolgerSchwenk,andYoshuaBengio.
Onusingmonolingualcorporainneuralmachinetranslation.CoRR,abs/1503.03535,2015.
[38] IlyaSutskever,OriolVinyals,andQuocV.Le.Sequencetosequencelearningwithneuralnetworks.InAdvancesinNeuralInformation
ProcessingSystems27:AnnualConferenceonNeuralInformationProcessingSystems2014,December8-132014,Montreal,Quebec,Canada,
pages3104–3112,2014.
[39] ThangLuong,HieuPham,andChristopherD.Manning.Effectiveapproachestoattention-basedneuralmachinetranslation.InProceedings
ofthe2015ConferenceonEmpiricalMethodsinNaturalLanguageProcessing,EMNLP2015,Lisbon,Portugal,September17-21,2015,
pages1412–1421,2015.
[40] HaoZheng,YongCheng,andYangLiu.Maximumexpectedlikelihoodestimationforzero-resourceneuralmachinetranslation.InProceedings
oftheTwenty-SixthInternationalJointConferenceonArtificialIntelligence,IJCAI2017,Melbourne,Australia,August19-25,2017,pages
4251–4257,2017.
[41] YongCheng,QianYang,YangLiu,MaosongSun,andWeiXu.Jointtrainingforpivot-basedneuralmachinetranslation.InProceedingsof
theTwenty-SixthInternationalJointConferenceonArtificialIntelligence,IJCAI2017,Melbourne,Australia,August19-25,2017,pages
3974–3980,2017.
[42] YunChen,YangLiu,YongCheng,andVictorO.K.Li.Ateacher-studentframeworkforzero-resourceneuralmachinetranslation.In
Proceedingsofthe55thAnnualMeetingoftheAssociationforComputationalLinguistics,ACL2017,Vancouver,Canada,July30-August4,
Volume1:LongPapers,pages1925–1935,2017.
74/81
Module9

References V
[43] OrhanFirat,BaskaranSankaran,YaserAl-Onaizan,FatosT.Yarman-Vural,andKyunghyunCho.Zero-resourcetranslationwithmulti-lingual
neuralmachinetranslation.InProceedingsofthe2016ConferenceonEmpiricalMethodsinNaturalLanguageProcessing,EMNLP2016,
Austin,Texas,USA,November1-4,2016,pages268–277,2016.
[44] LifengShang,ZhengdongLu,andHangLi.Neuralrespondingmachineforshort-textconversation.InProceedingsofthe53rdAnnualMeeting
oftheAssociationforComputationalLinguisticsandthe7thInternationalJointConferenceonNaturalLanguageProcessingoftheAsian
FederationofNaturalLanguageProcessing,ACL2015,July26-31,2015,Beijing,China,Volume1:LongPapers,pages1577–1586,2015.
[45] OriolVinyalsandQuocV.Le.Aneuralconversationalmodel.CoRR,abs/1506.05869,2015.
[46] RyanLowe,NissanPow,IulianSerban,andJoellePineau.Theubuntudialoguecorpus:Alargedatasetforresearchinunstructuredmulti-turn
dialoguesystems.InProceedingsoftheSIGDIAL2015Conference,The16thAnnualMeetingoftheSpecialInterestGrouponDiscourseand
Dialogue,2-4September2015,Prague,CzechRepublic,pages285–294,2015.
[47] JesseDodge,AndreeaGane,XiangZhang,AntoineBordes,SumitChopra,AlexanderH.Miller,ArthurSzlam,andJasonWeston.Evaluating
prerequisitequalitiesforlearningend-to-enddialogsystems.CoRR,abs/1511.06931,2015.
[48] JasonWeston,AntoineBordes,SumitChopra,andTomasMikolov.Towardsai-completequestionanswering:Asetofprerequisitetoytasks.
CoRR,abs/1502.05698,2015.
[49] IulianVladSerban,AlessandroSordoni,RyanLowe,LaurentCharlin,JoellePineau,AaronC.Courville,andYoshuaBengio.Ahierarchical
latentvariableencoder-decodermodelforgeneratingdialogues.CoRR,abs/1605.06069,2016.
[50] AntoineBordesandJasonWeston.Learningend-to-endgoal-orienteddialog.CoRR,abs/1605.07683,2016.
[51] IulianVladSerban,ChinnadhuraiSankar,MathieuGermain,SaizhengZhang,ZhouhanLin,SandeepSubramanian,TaesupKim,Michael
Pieper,SarathChandar,NanRosemaryKe,SaiMudumba,AlexandredeBr´ebisson,JoseSotelo,DendiSuhubdy,VincentMichalski,Alexandre
Nguyen,JoellePineau,andYoshuaBengio.Adeepreinforcementlearningchatbot.CoRR,abs/1709.02349,2017.
[52] KarlMoritzHermann,Tom´asKocisk´y,EdwardGrefenstette,LasseEspeholt,WillKay,MustafaSuleyman,andPhilBlunsom.Teaching
machinestoreadandcomprehend.InAdvancesinNeuralInformationProcessingSystems28:AnnualConferenceonNeuralInformation
ProcessingSystems2015,December7-12,2015,Montreal,Quebec,Canada,pages1693–1701,2015.
75/81
Module9

References VI
[53] DanqiChen,JasonBolton,andChristopherD.Manning.Athoroughexaminationofthecnn/dailymailreadingcomprehensiontask.In
Proceedingsofthe54thAnnualMeetingoftheAssociationforComputationalLinguistics,ACL2016,August7-12,2016,Berlin,Germany,
Volume1:LongPapers,2016.
[54] CaimingXiong,VictorZhong,andRichardSocher.Dynamiccoattentionnetworksforquestionanswering.CoRR,abs/1611.01604,2016.
[55] MinJoonSeo,AniruddhaKembhavi,AliFarhadi,andHannanehHajishirzi.Bidirectionalattentionflowformachinecomprehension.CoRR,
abs/1611.01603,2016.
[56] BhuwanDhingra,HanxiaoLiu,ZhilinYang,WilliamW.Cohen,andRuslanSalakhutdinov.Gated-attentionreadersfortextcomprehension.In
Proceedingsofthe55thAnnualMeetingoftheAssociationforComputationalLinguistics,ACL2017,Vancouver,Canada,July30-August4,
Volume1:LongPapers,pages1832–1846,2017.
[57] WenhuiWang,NanYang,FuruWei,BaobaoChang,andMingZhou.Gatedself-matchingnetworksforreadingcomprehensionandquestion
answering.InProceedingsofthe55thAnnualMeetingoftheAssociationforComputationalLinguistics,ACL2017,Vancouver,Canada,July
30-August4,Volume1:LongPapers,pages189–198,2017.
[58] MinghaoHu,YuxingPeng,andXipengQiu.Mnemonicreaderformachinecomprehension.CoRR,abs/1705.02798,2017.
[59] JonathanLong,EvanShelhamer,andTrevorDarrell.Fullyconvolutionalnetworksforsemanticsegmentation.InIEEEConferenceon
ComputerVisionandPatternRecognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages3431–3440,2015.
[60] MingLiangandXiaolinHu.Recurrentconvolutionalneuralnetworkforobjectrecognition.InIEEEConferenceonComputerVisionand
PatternRecognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages3367–3375,2015.
[61] ShaoqingRen,KaimingHe,RossB.Girshick,andJianSun.FasterR-CNN:towardsreal-timeobjectdetectionwithregionproposalnetworks.
IEEETrans.PatternAnal.Mach.Intell.,39(6):1137–1149,2017.
[62] SeanBell,C.LawrenceZitnick,KavitaBala,andRossB.Girshick.Inside-outsidenet:Detectingobjectsincontextwithskippoolingand
recurrentneuralnetworks.CoRR,abs/1512.04143,2015.
[63] JosephRedmonandAliFarhadi.YOLO9000:better,faster,stronger.CoRR,abs/1612.08242,2016.
76/81
Module9

References VII
[64] JifengDai,YiLi,KaimingHe,andJianSun.R-FCN:objectdetectionviaregion-basedfullyconvolutionalnetworks.InAdvancesinNeural
InformationProcessingSystems29:AnnualConferenceonNeuralInformationProcessingSystems2016,December5-10,2016,Barcelona,
Spain,pages379–387,2016.
[65] KaimingHe,GeorgiaGkioxari,PiotrDoll´ar,andRossB.Girshick.MaskR-CNN.InIEEEInternationalConferenceonComputerVision,ICCV
2017,Venice,Italy,October22-29,2017,pages2980–2988,2017.
[66] SergiCaelles,Kevis-KokitsiManinis,JordiPont-Tuset,LauraLeal-Taix´e,DanielCremers,andLucVanGool.One-shotvideoobject
segmentation.In2017IEEEConferenceonComputerVisionandPatternRecognition,CVPR2017,Honolulu,HI,USA,July21-26,2017,
pages5320–5329,2017.
[67] JanghoonChoi,JunseokKwon,andKyoungMuLee.Visualtrackingbyreinforceddecisionmaking.CoRR,abs/1702.06291,2017.
[68] SangdooYun,JongwonChoi,YoungjoonYoo,KiminYun,andJinYoungChoi.Action-decisionnetworksforvisualtrackingwithdeep
reinforcementlearning.In2017IEEEConferenceonComputerVisionandPatternRecognition,CVPR2017,Honolulu,HI,USA,July21-26,
2017,pages1349–1358,2017.
[69] AmirSadeghian,AlexandreAlahi,andSilvioSavarese.Trackingtheuntrackable:Learningtotrackmultiplecueswithlong-termdependencies.
CoRR,abs/1701.01909,2017.
[70] JunhuaMao,WeiXu,YiYang,JiangWang,andAlanL.Yuille.Deepcaptioningwithmultimodalrecurrentneuralnetworks(m-rnn).CoRR,
abs/1412.6632,2014.
[71] JunhuaMao,XuWei,YiYang,JiangWang,ZhihengHuang,andAlanL.Yuille.Learninglikeachild:Fastnovelvisualconceptlearningfrom
sentencedescriptionsofimages.InTheIEEEInternationalConferenceonComputerVision(ICCV),December2015.
[72] RyanKiros,RuslanSalakhutdinov,andRichardS.Zemel.Unifyingvisual-semanticembeddingswithmultimodalneurallanguagemodels.
CoRR,abs/1411.2539,2014.
[73] JeffDonahue,LisaAnneHendricks,SergioGuadarrama,MarcusRohrbach,SubhashiniVenugopalan,TrevorDarrell,andKateSaenko.
Long-termrecurrentconvolutionalnetworksforvisualrecognitionanddescription.InIEEEConferenceonComputerVisionandPattern
Recognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages2625–2634,2015.
77/81
Module9

References VIII
[74] OriolVinyals,AlexanderToshev,SamyBengio,andDumitruErhan.Showandtell:Aneuralimagecaptiongenerator.InIEEEConferenceon
ComputerVisionandPatternRecognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages3156–3164,2015.
[75] AndrejKarpathyandFei-FeiLi.Deepvisual-semanticalignmentsforgeneratingimagedescriptions.InIEEEConferenceonComputerVision
andPatternRecognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages3128–3137,2015.
[76] HaoFang,SaurabhGupta,ForrestN.Iandola,RupeshKumarSrivastava,LiDeng,PiotrDoll´ar,JianfengGao,XiaodongHe,Margaret
Mitchell,JohnC.Platt,C.LawrenceZitnick,andGeoffreyZweig.Fromcaptionstovisualconceptsandback.InIEEEConferenceon
ComputerVisionandPatternRecognition,CVPR2015,Boston,MA,USA,June7-12,2015,pages1473–1482,2015.
[77] KanChen,JiangWang,Liang-ChiehChen,HaoyuanGao,WeiXu,andRamNevatia.ABC-CNN:anattentionbasedconvolutionalneural
networkforvisualquestionanswering.CoRR,abs/1511.05960,2015.
[78] JeffDonahue,LisaAnneHendricks,SergioGuadarrama,MarcusRohrbach,SubhashiniVenugopalan,KateSaenko,andTrevorDarrell.
Long-termrecurrentconvolutionalnetworksforvisualrecognitionanddescription.CoRR,abs/1411.4389,2014.
[79] SubhashiniVenugopalan,HuijuanXu,JeffDonahue,MarcusRohrbach,RaymondJ.Mooney,andKateSaenko.Translatingvideostonatural
languageusingdeeprecurrentneuralnetworks.InNAACLHLT2015,The2015ConferenceoftheNorthAmericanChapteroftheAssociation
forComputationalLinguistics:HumanLanguageTechnologies,Denver,Colorado,USA,May31-June5,2015,pages1494–1504,2015.
[80] YingweiPan,TaoMei,TingYao,HouqiangLi,andYongRui.Jointlymodelingembeddingandtranslationtobridgevideoandlanguage.
CoRR,abs/1505.01861,2015.
[81] LiYao,AtousaTorabi,KyunghyunCho,NicolasBallas,ChristopherJ.Pal,HugoLarochelle,andAaronC.Courville.Describingvideosby
exploitingtemporalstructure.In2015IEEEInternationalConferenceonComputerVision,ICCV2015,Santiago,Chile,December7-13,2015,
pages4507–4515,2015.
[82] AnnaRohrbach,MarcusRohrbach,WeiQiu,AnnemarieFriedrich,ManfredPinkal,andBerntSchiele.Coherentmulti-sentencevideo
descriptionwithvariablelevelofdetail.InPatternRecognition-36thGermanConference,GCPR2014,Mu¨nster,Germany,September2-5,
2014,Proceedings,pages184–195,2014.
[83] LinchaoZhu,ZhongwenXu,YiYang,andAlexanderG.Hauptmann.Uncoveringtemporalcontextforvideoquestionandanswering.CoRR,
abs/1511.04670,2015.
78/81
Module9

References IX
[84] AdamSantoro,DavidRaposo,DavidG.T.Barrett,MateuszMalinowski,RazvanPascanu,PeterBattaglia,andTimLillicrap.Asimpleneural
networkmoduleforrelationalreasoning.InAdvancesinNeuralInformationProcessingSystems30:AnnualConferenceonNeuralInformation
ProcessingSystems2017,4-9December2017,LongBeach,CA,USA,pages4974–4983,2017.
[85] RonghangHu,JacobAndreas,MarcusRohrbach,TrevorDarrell,andKateSaenko.Learningtoreason:End-to-endmodulenetworksforvisual
questionanswering.InIEEEInternationalConferenceonComputerVision,ICCV2017,Venice,Italy,October22-29,2017,pages804–813,
2017.
[86] JustinJohnson,BharathHariharan,LaurensvanderMaaten,LiFei-Fei,C.LawrenceZitnick,andRossB.Girshick.CLEVR:Adiagnostic
datasetforcompositionallanguageandelementaryvisualreasoning.In2017IEEEConferenceonComputerVisionandPatternRecognition,
CVPR2017,Honolulu,HI,USA,July21-26,2017,pages1988–1997,2017.
[87] HediBen-younes,R´emiCad`ene,MatthieuCord,andNicolasThome.MUTAN:multimodaltuckerfusionforvisualquestionanswering.In
IEEEInternationalConferenceonComputerVision,ICCV2017,Venice,Italy,October22-29,2017,pages2631–2639,2017.
[88] MateuszMalinowski,MarcusRohrbach,andMarioFritz.Askyourneurons:Aneural-basedapproachtoansweringquestionsaboutimages.In
2015IEEEInternationalConferenceonComputerVision,ICCV2015,Santiago,Chile,December7-13,2015,pages1–9,2015.
[89] VahidKazemiandAliElqursh.Show,ask,attend,andanswer:Astrongbaselineforvisualquestionanswering.CoRR,abs/1704.03162,2017.
[90] MakarandTapaswi,YukunZhu,RainerStiefelhagen,AntonioTorralba,RaquelUrtasun,andSanjaFidler.Movieqa:Understandingstoriesin
moviesthroughquestion-answering.In2016IEEEConferenceonComputerVisionandPatternRecognition,CVPR2016,LasVegas,NV,
USA,June27-30,2016,pages4631–4640,2016.
[91] Kuo-HaoZeng,Tseng-HungChen,Ching-YaoChuang,Yuan-HongLiao,JuanCarlosNiebles,andMinSun.Leveragingvideodescriptionsto
learnvideoquestionanswering.CoRR,abs/1611.04021,2016.
[92] TeganMaharaj,NicolasBallas,AnnaRohrbach,AaronC.Courville,andChristopherJosephPal.Adatasetandexplorationofmodelsfor
understandingvideodatathroughfill-in-the-blankquestion-answering.In2017IEEEConferenceonComputerVisionandPatternRecognition,
CVPR2017,Honolulu,HI,USA,July21-26,2017,pages7359–7368,2017.
[93] ZhouZhao,QifanYang,DengCai,XiaofeiHe,andYuetingZhuang.Videoquestionansweringviahierarchicalspatio-temporalattention
networks.InProceedingsoftheTwenty-SixthInternationalJointConferenceonArtificialIntelligence,IJCAI2017,Melbourne,Australia,
August19-25,2017,pages3518–3524,2017.
79/81
Module9

References X
[94] YoungjaeYu,HyungjinKo,JongwookChoi,andGunheeKim.End-to-endconceptworddetectionforvideocaptioning,retrieval,andquestion
answering.In2017IEEEConferenceonComputerVisionandPatternRecognition,CVPR2017,Honolulu,HI,USA,July21-26,2017,pages
3261–3269,2017.
[95] HongyangXue,ZhouZhao,andDengCai.Theforgettable-watchermodelforvideoquestionanswering.CoRR,abs/1705.01253,2017.
[96] AmirMazaheri,DongZhang,andMubarakShah.Videofillintheblankwithmerginglstms.CoRR,abs/1610.04062,2016.
[97] TommyChheng.Videosummarizationusingclustering.
[98] MuhammadAjmal,MuhammadHusnainAshraf,MuhammadShakir,YasirAbbas,andFaizAliShah.Videosummarization:Techniquesand
classification.InComputerVisionandGraphics-InternationalConference,ICCVG2012,Warsaw,Poland,September24-26,2012.
Proceedings,pages1–13,2012.
[99] KeZhang,Wei-LunChao,FeiSha,andKristenGrauman.Videosummarizationwithlongshort-termmemory.InComputerVision-ECCV
2016-14thEuropeanConference,Amsterdam,TheNetherlands,October11-14,2016,Proceedings,PartVII,pages766–782,2016.
[100] ZhongJi,KailinXiong,YanweiPang,andXuelongLi.Videosummarizationwithattention-basedencoder-decodernetworks.CoRR,
abs/1708.09545,2017.
[101] RameswarPanda,NiluthpolChowdhuryMithun,andAmitK.Roy-Chowdhury.Diversity-awaremulti-videosummarization.IEEETrans.Image
Processing,26(10):4712–4724,2017.
[102] DiederikP.KingmaandMaxWelling.Auto-encodingvariationalbayes.CoRR,abs/1312.6114,2013.
[103] IanJ.Goodfellow,JeanPouget-Abadie,MehdiMirza,BingXu,DavidWarde-Farley,SherjilOzair,AaronC.Courville,andYoshuaBengio.
Generativeadversarialnets.InAdvancesinNeuralInformationProcessingSystems27:AnnualConferenceonNeuralInformationProcessing
Systems2014,December8-132014,Montreal,Quebec,Canada,pages2672–2680,2014.
[104] AnhNguyen,JasonYosinski,YoshuaBengio,AlexeyDosovitskiy,andJeffClune.Plug&playgenerativenetworks:Conditionaliterative
generationofimagesinlatentspace.CoRR,abs/1612.00005,2016.
[105] TeroKarras,TimoAila,SamuliLaine,andJaakkoLehtinen.Progressivegrowingofgansforimprovedquality,stability,andvariation.CoRR,
abs/1710.10196,2017.
80/81
Module9

References XI
[106] A¨aronvandenOord,SanderDieleman,HeigaZen,KarenSimonyan,OriolVinyals,AlexanderGraves,NalKalchbrenner,AndrewSenior,and
KorayKavukcuoglu.Wavenet:Agenerativemodelforrawaudio.InArxiv,2016.
[107] AaronvandenOord,NalKalchbrenner,andKorayKavukcuoglu.Pixelrecurrentneuralnetworks.arXivpreprintarXiv:1601.06759,2016.
[108] AaronvandenOord,NalKalchbrenner,LasseEspeholt,koraykavukcuoglu,OriolVinyals,andAlexGraves.Conditionalimagegenerationwith
pixelcnndecoders.InD.D.Lee,M.Sugiyama,U.V.Luxburg,I.Guyon,andR.Garnett,editors,AdvancesinNeuralInformationProcessing
Systems29,pages4790–4798.CurranAssociates,Inc.,2016.
[109] TimSalimans,AndrejKarpathy,XiChen,andDiederikPKingma.Pixelcnn++:Improvingthepixelcnnwithdiscretizedlogisticmixture
likelihoodandothermodifications.arXivpreprintarXiv:1701.05517,2017.
81/81
Module9
