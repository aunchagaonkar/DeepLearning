| CS7015 | (Deep Learning) | : Lecture | 12  |
| ------ | --------------- | --------- | --- |
Object Detection: R-CNN, Fast R-CNN, Faster R-CNN, You Only Look Once
(YOLO)
|     | Mitesh | M. Khapra |     |
| --- | ------ | --------- | --- |
DepartmentofComputerScienceandEngineering
IndianInstituteofTechnologyMadras
1/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | -------------- | --------------------- | --------- |

Acknowledgements
Some images borrowed from Ross Girshick’s original slides on RCNN, Fast
RCNN, etc.
| Some ideas    | borrowed  | from the presentation | of Kaustav | Kundu∗ |
| ------------- | --------- | --------------------- | ---------- | ------ |
| ∗ Deep Object | Detection |                       |            |        |
2/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

| Module | 12.1 : Introduction | to object | detection |
| ------ | ------------------- | --------- | --------- |
3/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | -------------- | --------------------- | --------- |

| So far we have | looked at Image | Classification |     |
| -------------- | --------------- | -------------- | --- |
We will now move on to another Image Processing Task - Object Detection
4/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | -------------- | --------------------- | --------- |

| Task   | Image classification |     | Object          | Detection |
| ------ | -------------------- | --- | --------------- | --------- |
| Output | Car                  |     | Car,exactbound- |           |
|        |                      |     | ing box         | contain-  |
|        |                      |     | ing car         |           |
5/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Region | proposals | Feature extraction |            | Classifier |      |
| --- | ------ | --------- | ------------------ | ---------- | ---------- | ---- |
|     |        |           |                    | personflag |            | none |
ball
...
|        |               |              | x 1 x 2          | x d |     |     |
| ------ | ------------- | ------------ | ---------------- | --- | --- | --- |
| Let us | see a typical | pipeline for | object detection |     |     |     |
It starts with a region proposal stage where we identify potential regions which
| may contain | objects        |                |                       |             |     |      |
| ----------- | -------------- | -------------- | --------------------- | ----------- | --- | ---- |
| We could    | think of       | these regions  | as mini-images        |             |     | 6/47 |
|             |                | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12   |     |      |
| We extract  | features(SIFT, | HOG,           | CNNs) from these      | mini-images |     |      |
Pass these through a standard image classifer to determine the class

|     | Region proposals |     | Feature extraction | Bounding box | regression |
| --- | ---------------- | --- | ------------------ | ------------ | ---------- |
h
h∗
...
|     |     |     | x 1 x 2 | x d w∗ |     |
| --- | --- | --- | ------- | ------ | --- |
w
|     |     | h   |     | h∗  |     |
| --- | --- | --- | --- | --- | --- |
w∗
w
h∗
h
w∗
w
In addition we would also like to correct the proposed bounding boxes
This is posed as a regression problem (for example, we would like to predict w∗,
| h∗ from | the proposed | w and h) |     |     |     |
| ------- | ------------ | -------- | --- | --- | --- |
7/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Regionproposals | Featureextraction | Classifier |           |               |         |         |
| --------------- | ----------------- | ---------- | --------- | ------------- | ------- | ------- |
|                 |                   |            | Let us    | see how these | three   | compon- |
|                 |                   |            | ents have | evolved over  | time    |         |
|                 |                   |            | Propose   | all possible  | regions | in the  |
Pre2012
|      |     |     | image of        | varying sizes | (almost  | brute  |
| ---- | --- | --- | --------------- | ------------- | -------- | ------ |
| RCNN |     |     | force)          |               |          |        |
|      |     |     | Use handcrafted |               | features | (SIFT, |
FastRCNN
HOG)
| FasterRCNN |     |     | Train a | linear classifier | using | these |
| ---------- | --- | --- | ------- | ----------------- | ----- | ----- |
features
Wewillnowseethreealgorithmsthat
|     |     |     | progressively | improve | these | compon- |
| --- | --- | --- | ------------- | ------- | ----- | ------- |
ents
8/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

| Module | 12.2 : RCNN | model for | object detection |
| ------ | ----------- | --------- | ---------------- |
9/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | -------------- | --------------------- | --------- |

Classifier
...
FeatureExtrac-
Input RegRioengiPonroPporosaplossals
tion
BoundingBox
|     |                   | 10 5   |            |        |                  |
| --- | ----------------- | ------ | ---------- | ------ | ---------------- |
|     | 10                | 5      | Regression |        |                  |
|     | Selective         | Search | for        | region | proposals        |
|     | Does hierarchical |        | clustering | at     | different scales |
Forexamplethefiguresfromlefttorightshow
|     | clusters  | of increasing | sizes      |         |              |
| --- | --------- | ------------- | ---------- | ------- | ------------ |
|     | Such a    | hierarchical  | clustering |         | is important |
|     | as we may | find          | different  | objects | at different |
scales
10/47
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture12 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

Classifier
...
FeatureExtrac-
Input RegRioengiPonroPporosaplossals
tion
BoundingBox
10 5
|     | 10 5 | Regression |
| --- | ---- | ---------- |
Proposedregionsarecroppedtoformminiim-
ages
EachminiimageisscaledtomatchtheCNN’s
|     | (feature extractor) | input size |
| --- | ------------------- | ---------- |
11/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| -------------- | --------------------- | --------- |

Classifier
...
FeatureExtrac-
Input RegionProposals
tion
BoundingBox
10 5
|      |     | 10 5        | Regression |                |              |
| ---- | --- | ----------- | ---------- | -------------- | ------------ |
|      |     | For feature | extraction |                | any CNN      |
|      |     | trained     | for Image  | Classification | can          |
|      | fc7 | be used     | (AlexNet/  | VGGNet         | etc.)        |
|      |     | Outputs     | from fc7   | layer          | are taken as |
| 10 5 |     | features    |            |                |              |
10 5
CNNisfinetunedusinggroundtruth
|     |     | (cropped) | object | images |     |
| --- | --- | --------- | ------ | ------ | --- |
12/47
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture12 |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- |

Classifier
FeatureExtrac-
...
Input RegionProposals
tion
BoundingBox
10 10 5 5 Regression
...
Linear models (SVMs) are used for classification (1 model per class)
13/47
MiteshM.Khapra CS7015(DeepLearning): Lecture12

Classifier
...
| Input RegionProposals | FeatureExtrac- |     |     |     |     |
| --------------------- | -------------- | --- | --- | --- | --- |
tion
BoundingBox
|     |     | 10 55 | Regression |     |     |
| --- | --- | ----- | ---------- | --- | --- |
10
N
|     |     | (cid:88) | x∗−x |     |     |
| --- | --- | -------- | ---- | --- | --- |
−wTz
min
|     |     |     | w   | 1   |     |
| --- | --- | --- | --- | --- | --- |
i=1
| The proposed |     | regions | may not | be perfect |     |
| ------------ | --- | ------- | ------- | ---------- | --- |
h h∗
(x,y) (x∗,y∗)
| We want | to learn | four | regression | models | which will |
| ------- | -------- | ---- | ---------- | ------ | ---------- |
w w∗
| learn to | predict   | x∗, y∗,    | w∗, h∗    |           |     |
| -------- | --------- | ---------- | --------- | --------- | --- |
| We will  | see their | respective | objective | functions |     |
ProposedBox TrueBox
z: featuresfrompool5layerofthenetwork N (cid:16)x∗−x (cid:17)2
|     |     | (cid:88) |     | −wTz |     |
| --- | --- | -------- | --- | ---- | --- |
min
|     |     |     | w   | 1   |     |
| --- | --- | --- | --- | --- | --- |
14/47
i=1
| MiteshxM∗−.Kxhaipsrathe | nCSo7r0m15a(DliezeepdLeadrinffineg)re:nLcecetubree1t2ween |     |     |     |     |
| ----------------------- | --------------------------------------------------------- | --- | --- | --- | --- |
proposed x
w
| and true | x∗  |     |     |     |     |
| -------- | --- | --- | --- | --- | --- |
x∗
| If we can | predict  | this | difference | we can compute |     |
| --------- | -------- | ---- | ---------- | -------------- | --- |
| The model | predicts | wTz  | as this    | difference     |     |
1
| The above | objective     |     | function | minimize     | the difference |
| --------- | ------------- | --- | -------- | ------------ | -------------- |
| between   | the predicted |     | and the  | actual value |                |
N
|     |     | (cid:88) (cid:16)y∗−y |     | (cid:17)2 |     |
| --- | --- | --------------------- | --- | --------- | --- |
−wTz
min
|     |     |     | h   | 2   |     |
| --- | --- | --- | --- | --- | --- |
i=1
| Similarly | for y |            |                    |           |     |
| --------- | ----- | ---------- | ------------------ | --------- | --- |
|           |       | N (cid:16) | (cid:16)w∗(cid:17) | (cid:17)2 |     |
(cid:88)
|     | min |     | ln  | −wTz |     |
| --- | --- | --- | --- | ---- | --- |
|     |     |     | w   | 3    |     |
i=1
| Similarly | for w |     |     |     |     |
| --------- | ----- | --- | --- | --- | --- |
N
|     |     | (cid:88) (cid:16) | (cid:16)h∗(cid:17) | (cid:17)2 |     |
| --- | --- | ----------------- | ------------------ | --------- | --- |
|     | min |                   | ln                 | −wTz      |     |
4
h
i=1
| Similarly | for h |     |     |     |     |
| --------- | ----- | --- | --- | --- | --- |

Classifier
WCONV Wclassifier
...
FeatureExtrac-
| Input | RegRioengiPonroPporosaplossals |     |     |     |
| ----- | ------------------------------ | --- | --- | --- |
tion
BoundingBox
10 5
10 5 Regression
Wregression
| What are | the parameters | of this model? |     |     |
| -------- | -------------- | -------------- | --- | --- |
W is taken as it is from a CNN trained for Image classification (say on
CONV
ImageNet)
W is then fine tuned using ground truth (cropped) object images
CONV
| W   | is learned | using ground | truth (cropped) | object images |
| --- | ---------- | ------------ | --------------- | ------------- |
classifier
| W   | is learned | using ground | truth bounding | boxes |
| --- | ---------- | ------------ | -------------- | ----- |
regression
15/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

Classifier
...
FeatureExtrac-
|     | Input | RegRioengiPonroPporosaplossals |     |     |
| --- | ----- | ------------------------------ | --- | --- |
tion
BoundingBox
10 5
|     |     |     | 10 5 | Regression |
| --- | --- | --- | ---- | ---------- |
What is the computational cost for processing one image at test time?
Inference Time = Proposal Time + # Proposals × Convolution Time + #
| Proposals | × classification | + # Proposals | × regression |     |
| --------- | ---------------- | ------------- | ------------ | --- |
16/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

On average selective search
gives 2K region proposal
Each of these pass through
the CNN for feature extrac-
tion
Followed by classification
and regression
Source: Ross Girshick
17/47
MiteshM.Khapra CS7015(DeepLearning): Lecture12

|     | No  | joint      | learning |            |      |         |
| --- | --- | ---------- | -------- | ---------- | ---- | ------- |
|     | Use | ad hoc     | training | objectives |      |         |
|     |     | Fine       | tune     | network    | with | softmax |
|     |     | classifier | (log     | loss)      |      |         |
|     |     | Train      | post-hoc | linear     | SVMs | (hinge  |
loss)
|     |          | Train    | post-hoc   | bounding-box |         | re-  |
| --- | -------- | -------- | ---------- | ------------ | ------- | ---- |
|     |          | gressors | (squared   | loss)        |         |      |
|     | Training |          | (≈ 3 days) | and          | testing | (47s |
slow1.
|     | per   | image) | is      |       |     |     |
| --- | ----- | ------ | ------- | ----- | --- | --- |
|     | Takes | a lot  | of disk | space |     |     |
1Source:
Ross Girshick
1Using VGG-Net 18/47
| MiteshM.Khapra | CS7015(DeepLearning): |     | Lecture12 |     |     |     |
| -------------- | --------------------- | --- | --------- | --- | --- | --- |

| Regionproposals | Featureextraction | Classifier |                   |           |
| --------------- | ----------------- | ---------- | ----------------- | --------- |
|                 |                   |            | Region Proposals: | Selective |
Search
|     |     |     | Feature | Extraction: CNNs |
| --- | --- | --- | ------- | ---------------- |
Pre2012
|     |     |     | Classifier: | Linear |
| --- | --- | --- | ----------- | ------ |
RCNN
19/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

| Module | 12.3 : | Fast RCNN | model for | object detection |
| ------ | ------ | --------- | --------- | ---------------- |
20/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

|     | Suppose | we apply | a 3 × 3 kernel | on  |
| --- | ------- | -------- | -------------- | --- |
an image
Whatistheregionofinfluenceofeach
|     | pixel in   | the resulting | output ? |     |
| --- | ---------- | ------------- | -------- | --- |
|     | Each pixel | contributes   | to a 5×5 | re- |
gion
Supposeweagainapplya3×3kernel
|     | on this                    | output?    |              |        |
| --- | -------------------------- | ---------- | ------------ | ------ |
|     | What is                    | the region | of influence | of the |
|     | originalpixelfromtheinput? |            |              | (a7×7  |
region)
21/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

softmax
| 224     | 224 112 | 112 | 56  | 56 28 |     | 28      |     | 14   |
| ------- | ------- | --- | --- | ----- | --- | ------- | --- | ---- |
|         |         |     |     |       |     | 14      |     | 7    |
|         | 211     | 211 | 65  | 65 82 |     | 82 41   |     | 41 7 |
| 422 422 |         |     |     |       |     |         |     | 512  |
|         |         |     |     | 256   |     | 512 512 |     | 512  |
maxpool
|     |         | 128         |      | 256 maxpool | Conv | maxpool | Conv |     |
| --- | ------- | ----------- | ---- | ----------- | ---- | ------- | ---- | --- |
|     | 64      | 128 maxpool | Conv |             |      |         |      |     |
| 64  | maxpool | Conv        |      |             |      |         |      |     |
Input Conv 1000
fc fc
40964096
22/47
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture12 |     |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --------- | --- |

|              |          |     | Using this    | idea we could     | get a bound-     |         |
| ------------ | -------- | --- | ------------- | ----------------- | ---------------- | ------- |
|              |          |     | ing box’s     | region of         | influence on     | any     |
|              |          |     | layer in      | the CNN           |                  |         |
|              |          |     | The projected | Region            | of Interest      |         |
|              |          |     | (RoI) may     | be of different   | sizes            |         |
|              |          |     | Divide        | them into k       | equally sized    | re-     |
|              |          |     | gions of      | dimension         | H × W and        | do      |
|              |          |     | max pooling   | in each           | of those regions |         |
|              |          |     | to construct  | a k dimensional   | vector           |         |
| Source: Ross | Girshick |     | Connect       | the k dimensional | vector           | to      |
|              |          |     | a fully       | connected layer   |                  |         |
|              |          |     | This max      | pooling           | operation        | is call |
|              |          |     | RoI pooling   |                   |                  |         |
23/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| --- | --- | -------------- | --------------------- | --------- | --- | --- |

|     | Once we            | have the | FC layer | it     | gives us |
| --- | ------------------ | -------- | -------- | ------ | -------- |
|     | the representation |          | of this  | region | pro-     |
posal
|     | We can       | then add      | a softmax    |               | layer on |
| --- | ------------ | ------------- | ------------ | ------------- | -------- |
|     | top of       | it to compute |              | a probability |          |
|     | distribution | over          | the possible |               | object   |
classes
|     | Similarly | we can            | add           | a regression |         |
| --- | --------- | ----------------- | ------------- | ------------ | ------- |
|     | layer on  | top of            | it to predict |              | the new |
|     | bounding  | box (w∗,h∗,x∗,y∗) |               |              |         |
Source: Ross Girshick
24/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |     |
| -------------- | --------------------- | --------- | --- | --- | --- |

|     | Recall | that the last | pooling | layer of |
| --- | ------ | ------------- | ------- | -------- |
W
|     | VGGNet-16    | results | in an output | of  |
| --- | ------------ | ------- | ------------ | --- |
|     | size 512×7×7 |         |              |     |
ROI
Wereplacethelastmaxpoolinglayer
|          | by a RoI | pooling   | layer            |      |
| -------- | -------- | --------- | ---------------- | ---- |
| Max-pool | We set   | H = W =   | 7 and divide     | each |
|          | of these | RoIs into | (k = 49) regions |      |
Conv
|     | We do  | this for every | feature map    | res- |
| --- | ------ | -------------- | -------------- | ---- |
|     | ulting | in an ouput    | of size 512×49 |      |
Input
|     | This output | is of           | the same size | as the  |
| --- | ----------- | --------------- | ------------- | ------- |
|     | output      | of the original | max           | pooling |
layer
|     | It is thus | compatible | with the          | dimen- |
| --- | ---------- | ---------- | ----------------- | ------ |
|     | sions of   | the weight | matrix connecting |        |
first25/47
|                | the original          | pooling   | layer to | the |
| -------------- | --------------------- | --------- | -------- | --- |
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |          |     |
|                | FC layer              |           |          |     |
Wecanjustretainthatweightmatrix
|     | and fine | tune it |     |     |
| --- | -------- | ------- | --- | --- |

| Regionproposals | Featureextraction | Classifier |        |            |           |
| --------------- | ----------------- | ---------- | ------ | ---------- | --------- |
|                 |                   |            | Region | Proposals: | Selective |
Search
|     |     |     | Feature | Extraction: CNN |     |
| --- | --- | --- | ------- | --------------- | --- |
Pre2012
|     |     |     | Classifier: | CNN |     |
| --- | --- | --- | ----------- | --- | --- |
RCNN
FastRCNN
26/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Module | 12.4 : Faster | RCNN | model for | object detection |
| ------ | ------------- | ---- | --------- | ---------------- |
27/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

| classifier | So far   | the region proposals | were be-       |
| ---------- | -------- | -------------------- | -------------- |
|            | ing made | using Selective      | Search al-     |
| RoIpooling | gorithm  |                      |                |
|            | Idea:    | Can we use a         | CNN for making |
|            | region   | proposals also?      |                |
proposals
|     | How?    | Well it’s slightly | tricky     |
| --- | ------- | ------------------ | ---------- |
|     | We will | illustrate         | this using |
Region Proposal Network
VGGNet
feature maps
conv layers
image
28/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| -------------- | --------------------- | --------- | --- |

|     | Consider   | the output      | of the last con- |
| --- | ---------- | --------------- | ---------------- |
|     | volutional | layer of VGGNet |                  |
h
|     | Now consider | one cell | in one of the |
| --- | ------------ | -------- | ------------- |
512
|     | 512 feature | maps         |             |
| --- | ----------- | ------------ | ----------- |
|     | If we apply | a 3×3 kernel | around this |
w
|     | cell then | we will get | a 1D representa- |
| --- | --------- | ----------- | ---------------- |
|     | tion for  | this cell   |                  |
Ifwerepeatthisforallthe512feature
x1 x2 x5·······12
|     | maps then             | we will | get a 512 dimen-  |
| --- | --------------------- | ------- | ----------------- |
|     | sional representation |         | for this position |
x1 x2 x5·······12
|     | We use    | this process   | to get a 512 di- |
| --- | --------- | -------------- | ---------------- |
|     | mensional | representation | for each of      |
|     | the w×h   | positions      |                  |
x1 x2 x5·······12
29/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| -------------- | --------------------- | --------- | --- |

x1x2 · · · · ·x512
|     |     | We now | consider | k bounding |     | boxes |
| --- | --- | ------ | -------- | ---------- | --- | ----- |
(calledanchorboxes)ofdifferentsizes
|     |     | & aspect | ratio |     |     |     |
| --- | --- | -------- | ----- | --- | --- | --- |
Weareinterestedinthefollowingtwo
questions:
|     |     | Given the | 512d | representation |     | of a |
| --- | --- | --------- | ---- | -------------- | --- | ---- |
Max-pool
|     |     | position, | what   | is the probability |     | that    |
| --- | --- | --------- | ------ | ------------------ | --- | ------- |
|     |     | a given   | anchor | box centered       |     | at this |
Conv
|     |     | position | contains | an object? |     |     |
| --- | --- | -------- | -------- | ---------- | --- | --- |
(Classification)
|       |     | How do  | you predict | the    | true | bound- |
| ----- | --- | ------- | ----------- | ------ | ---- | ------ |
| Input |     | ing box | from this   | anchor | box? | (Re-   |
gression)
30/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- | --- |

x1x2 · · · · ·x512
|     | We train | a classification | model and | a   |
| --- | -------- | ---------------- | --------- | --- |
regressionmodeltoaddressthesetwo
questions
Max-pool
Howdowegetthegroundtruthdata?
Conv
|     | What is       | the objective | function | used |
| --- | ------------- | ------------- | -------- | ---- |
|     | for training? |               |          |      |
Input
31/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

Consider a ground truth object and
its corresponding bounding box
Consider the projection of this image
Classification Regression
onto the conv5 layer
x1x2· · · · · · Consider one such cell in the output
Thiscellcorrespondstoapatchinthe
original image
Consider the center of this patch
We consider anchor boxes of different
Max-pool
sizes
Conv
For each of these anchor boxes, we
would want the classifier to predict
1 if this anchor box has a reason-
IIInnnpppuuuttt
ableoverlap(IoU>0.7)withthetrue
grounding box
32/47
MiteshM.Khapra CS7015(SDiemepiLlaearrlnyingw):eLewctouruel1d2 want the regres-
sion model to predict the true box
(red) from the anchor box (pink)

Classification Regression
x1x2· · · · · ·
|     | We train | a classification | model and | a   |
| --- | -------- | ---------------- | --------- | --- |
regressionmodeltoaddressthesetwo
questions
Max-pool Howdowegetthegroundtruthdata?
Conv
|     | What is       | the objective | function | used |
| --- | ------------- | ------------- | -------- | ---- |
|     | for training? |               |          |      |
Input
33/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

| The | full network | is            | trained | using the    | following | objective. |          |         |
| --- | ------------ | ------------- | ------- | ------------ | --------- | ---------- | -------- | ------- |
|     |              |               | 1       | (cid:88)     |           | λ          | (cid:88) |         |
|     | L(p          | ,t )          | =       | L (p         | ,p∗)+     |            | p∗L      | (t ,t∗) |
|     |              | i i           |         | cls          | i i       |            | i        | reg i i |
|     |              |               | N       |              |           | N          |          |         |
|     |              |               | cls     |              |           | reg        |          |         |
|     |              |               |         | i            |           |            | i        |         |
|     | p∗           | = 1 if anchor |         | box contains | ground    | truth      | object   |         |
i
|     |     | = 0 otherwise |             |     |        |     |            |           |
| --- | --- | ------------- | ----------- | --- | ------ | --- | ---------- | --------- |
|     | p   | = predicted   | probability | of  | anchor | box | containing | an object |
i
|     | N   | = batch-size |     |     |     |     |     |     |
| --- | --- | ------------ | --- | --- | --- | --- | --- | --- |
cls
|     | N reg | = batch-size×k |       |     |     |     |     |     |
| --- | ----- | -------------- | ----- | --- | --- | --- | --- | --- |
|     | k     | = anchor       | boxes |     |     |     |     |     |
34/47
|     |     |     | MiteshM.Khapra |     | CS7015(DeepLearning): |     |     | Lecture12 |
| --- | --- | --- | -------------- | --- | --------------------- | --- | --- | --------- |

|          |     | So far          | we have seen a CNN   | based ap-  |
| -------- | --- | --------------- | -------------------- | ---------- |
| FastRCNN |     | proach          | for region proposals | instead of |
|          |     | using selective | search               |            |
RegionProposals
Wecannowtaketheseregionpropos-
Regression
| Classification |     | als and  | then add fast RCNN | on top        |
| -------------- | --- | -------- | ------------------ | ------------- |
|                |     | of it to | predict the class  | of the object |
x x · · · · ·x512
1 2
|     |     | And regress | the proposed | bounding |
| --- | --- | ----------- | ------------ | -------- |
box
Max-pool
Conv
Input
35/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| --- | -------------- | --------------------- | --------- | --- |

|          | But the  | fast RCNN    | would again use |
| -------- | -------- | ------------ | --------------- |
| FastRCNN | a VGG    | Net          |                 |
|          | Can’t we | use a single | VGG Net and     |
RegionProposals
|     | share the | parameters | of RPN and |
| --- | --------- | ---------- | ---------- |
Regression
Classification RCNN
|     | Yes, we | can |     |
| --- | ------- | --- | --- |
x x · · · · ·x512
1 2
|     | In practice, | we use  | a 4 step alternat- |
| --- | ------------ | ------- | ------------------ |
|     | ing training | process |                    |
Max-pool
Conv
Input
36/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| -------------- | --------------------- | --------- | --- |

Faster RCNN:Training
FastRCNN
|     |     | Fine-tune | RPN     | using a pre-trained |     |
| --- | --- | --------- | ------- | ------------------- | --- |
|     |     | ImageNet  | network |                     |     |
RegionProposals
|     |     | Fine-tune | fast | RCNN from | a pre- |
| --- | --- | --------- | ---- | --------- | ------ |
Regression
| Classification |     | trained  | ImageNet | network     | using |
| -------------- | --- | -------- | -------- | ----------- | ----- |
|                |     | bounding | boxes    | from step 1 |       |
x x · · · · ·x512
1 2
|     |     | Keeping    | common    | convolutional | layer    |
| --- | --- | ---------- | --------- | ------------- | -------- |
|     |     | parameters | fixed     | from step     | 2, fine- |
|     |     | tune RPN   | (post     | conv5 layers) |          |
|     |     | Keeping    | common    | convolution   | layer    |
|     |     | parameters | fixed     | from step     | 3, fine- |
|     |     | tune fc    | layers of | fast RCNN     |          |
Max-pool
Conv
Input
37/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| --- | -------------- | --------------------- | --------- | --- | --- |

Faster RCNN and RPN are the basis of several 1st place entries in the ILSVRC
and COCO tracks on :
Imagenet detection
COCO Segmentation
Imagenet localization
COCO detection
38/47
MiteshM.Khapra CS7015(DeepLearning): Lecture12

| Regionproposals | Featureextraction | Classifier |             |                 |
| --------------- | ----------------- | ---------- | ----------- | --------------- |
|                 |                   |            | Region      | Proposals: CNN  |
|                 |                   |            | Feature     | Extraction: CNN |
| Pre2012         |                   |            | Classifier: | CNN             |
RCNN
FastRCNN
FasterRCNN
39/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | --- | -------------- | --------------------- | --------- |

| Object Detection | Performance |     |
| ---------------- | ----------- | --- |
Source: Ross Girshick
40/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| -------------- | --------------------- | --------- |

| Module | 12.5 : YOLO | model for | object detection |
| ------ | ----------- | --------- | ---------------- |
41/47
|     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |
| --- | -------------- | --------------------- | --------- |

|     | The approaches | that | we have | seen so |
| --- | -------------- | ---- | ------- | ------- |
classifier
|     | far are two  | stage approaches |          |       |
| --- | ------------ | ---------------- | -------- | ----- |
|     | They involve | a region         | proposal | stage |
RoIpooling
|     | and then | a classification   | stage |           |
| --- | -------- | ------------------ | ----- | --------- |
|     | Can we   | have an end-to-end |       | architec- |
proposals
|     | ture which     | does both      | proposal | and |
| --- | -------------- | -------------- | -------- | --- |
|     | classification | simultaneously |          | ?   |
Region Proposal Network
|     | This is | the idea behind | YOLO-You |     |
| --- | ------- | --------------- | -------- | --- |
feature maps
|     | Only Look | Once. |     |     |
| --- | --------- | ----- | --- | --- |
conv layers
image
42/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

PP((ccooww)) PP((ttrruucckk)) Divide an image into S × S grids
yy ·· ··
cc ww hh xx (S=7)
PP((ddoogg))
Foreachsuchcellweareinterestedin
|     | predicting  | 5+k quantities |                  |      |
| --- | ----------- | -------------- | ---------------- | ---- |
|     | Probability | (confidence)   | that this        | cell |
|     | is indeed   | contained      | in a true bound- |      |
|     | ing box     |                |                  |      |
Bounding boxes + confidence
|     | Width  | of the bounding       | box |     |
| --- | ------ | --------------------- | --- | --- |
|     | Height | of the bounding       | box |     |
|     | Center | (x,y) of the bounding | box |     |
S × S grid on input ProbabilityFinaol dfetetchtieonsobject in the
kth
|                       | bounding   | box belonging | to the   |     |
| --------------------- | ---------- | ------------- | -------- | --- |
|                       | class (k   | - values)     |          |     |
|                       | The output | layer thus    | contains | S × |
| Class probability map | S ×(5+k)   | elements      |          |     |
43/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |     |
| -------------- | --------------------- | --------- | --- | --- |

HowdoweinterpretthisS×S×(5+k)
|     | dimensional | output?             |             |
| --- | ----------- | ------------------- | ----------- |
|     | For each    | cell, we are        | computing a |
|     | bounding    | box, its confidence | and the     |
Bounding boxes + confidence BBoouunnddiinngg  bbooxxeess  ++  ccoonnofifibddeejnenccceet in it
|     | We then    | retain the most | confident   |
| --- | ---------- | --------------- | ----------- |
|     | bounding   | boxes and the   | correspond- |
|     | ing object | label           |             |
SS F ××in  SSa  glg rdriided t oeoncn t iiinonpnpusutt FFiinnaall  ddeetteeccttiioonnss
S × S grid on input
Input Image
Bounding Boxes & Confidence
CCllaassss  pprroobbaabbiilliittyy  mmaapp
Class probability map 44/47
| MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| -------------- | --------------------- | --------- | --- |

P(cow)
|     |     |     | How do | we train this | network ? |     |
| --- | --- | --- | ------ | ------------- | --------- | --- |
P(truck)
|             |                             |                 | Consider    | a cell such | that the center |     |
| ----------- | --------------------------- | --------------- | ----------- | ----------- | --------------- | --- |
| ccˆ wwˆ hhˆ | xxˆ yyˆ (cid:96)ˆ (cid:96)ˆ | ·· ·· (cid:96)ˆ |             |             |                 |     |
|             | 1 2                         | k               | of the true | bonding box | lies in it      |     |
P(dog)
|     |     |     | The network | is initialized | randomly      |     |
| --- | --- | --- | ----------- | -------------- | ------------- | --- |
|     |     |     | and it      | will predict   | some values   | for |
|     |     |     | c,w,h,x,y   | & (cid:96)     |               |     |
|     |     |     | We can      | then compute   | the following |     |
losses
BBoouunnddiinngg  bbooxxeess  ++  ccoonnfifiddeennccee
(x−xˆ)2
(y−yˆ)2
√ √
|     |     |     | ( w− | wˆ)2 |     |     |
| --- | --- | --- | ---- | ---- | --- | --- |
SS  ××  SS  ggrriidd  oonn  iinnppuutt √ (cid:112)FFiinnaall  ddeetteeccttiioonnss
hˆ)2
( h−
(1−cˆ)2
|     |     |     | (cid:80)k ((cid:96) | −(cid:96)ˆ)2 |     |     |
| --- | --- | --- | ------------------- | ------------ | --- | --- |
|     |     |     |                     | i i          |     |     |
i=1
CCllaassss  pprroobbaabbiilliittyy  mmaapp
|     |     |                                                                  | And train | the network | to minimize | 45/47 |
| --- | --- | ---------------------------------------------------------------- | --------- | ----------- | ----------- | ----- |
|     |     | MiteshM.Khapra CS7015t(hDeeepsuLmearnoinfg)t:hLeesceturleo1s2ses |           |             |             |       |

| cˆ wˆ hˆ | xˆ yˆ (cid:96)ˆ (cid:96)ˆ | · · (cid:96)ˆ |              |            |                |
| -------- | ------------------------- | ------------- | ------------ | ---------- | -------------- |
|          | 1 2                       | k             |              |            |                |
|          |                           |               | Now consider | a grid     | which does not |
|          |                           |               | contain      | any object |                |
Forthisgridwedonotcareaboutthe
|     |     |     | predictions | w,h,x,y             | & (cid:96) |
| --- | --- | --- | ----------- | ------------------- | ---------- |
|     |     |     | But we      | want the confidence | to be low  |
Bounding boxes + confidenceSoweminimizeonlythefollowingloss
(0−cˆ)2
| S × S grid on input |     |     |     | Final detections |     |
| ------------------- | --- | --- | --- | ---------------- | --- |
Class probability map
46/47
|     |     | MiteshM.Khapra | CS7015(DeepLearning): | Lecture12 |     |
| --- | --- | -------------- | --------------------- | --------- | --- |

| Method      | Pascal | 2007 | mAP |          | Speed             |
| ----------- | ------ | ---- | --- | -------- | ----------------- |
| DPM v5      |        | 33.7 |     | 0.07 FPS | — 14 sec/ image   |
| RCNN        |        | 66.0 |     | 0.05 FPS | — 20 sec/ image   |
| Fast RCNN   |        | 70.0 |     | 0.5 FPS  | — 2 sec/ image    |
| Faster RCNN |        | 73.2 |     | 7 FPS    | — 140 msec/ image |
| YOLO        |        | 69.0 |     | 45 FPS   | — 22 msec/ image  |
47/47
|     | MiteshM.Khapra |     | CS7015(DeepLearning): |     | Lecture12 |
| --- | -------------- | --- | --------------------- | --- | --------- |
