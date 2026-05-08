# Module V: Convolutional Neural Networks & Deep Learning for NLP

> **Exam Notes** — CS7015 Deep Learning (Lectures 10, 11)

---

## Part A: Convolutional Neural Networks

---

## 1. The Convolution Operation

### 1.1 1D Convolution

- **Motivation:** Tracking a noisy signal (e.g., aeroplane position via laser sensor). To obtain a less noisy estimate, take a **weighted average** of measurements where more recent ones are weighted higher.
- **Formula (1D):**
$$
s_t = \sum_{a=0}^{\infty} x_{t-a} \cdot w_{-a} \quad (input * kernel)_t
$$
- In practice, we sum over a **small window** (finite support).
- The weight array **$w$** is called the **filter** (or **kernel**).
- We **slide** the filter over the input and compute one output value per position.

### 1.2 2D Convolution

- Images are 2D inputs; we use a **2D filter** of size $m \times n$.
- **Formula:**
$$
S_{ij} = (I * K)_{ij} = \sum_{a} \sum_{b} I_{i+a, j+b} \cdot K_{a,b}
$$
  (We assume the kernel is centered on the pixel of interest, looking at both preceding and succeeding neighbours.)

### 1.3 Examples of 2D Kernels

| Kernel | Effect |
|--------|--------|
| All 1s (e.g., 3×3 of 1s) | **Blurring** |
| `[[0, -1, 0], [-1, 5, -1], [0, -1, 0]]` | **Sharpening** |
| `[[1, 1, 1], [1, -8, 1], [1, 1, 1]]` | **Edge detection** |

### 1.4 Key Terminology

| Term | Definition |
|------|-----------|
| **Feature map** | The output produced by sliding a kernel over the input |
| **Multiple filters** | We apply K different kernels $\rightarrow$ K feature maps |
| **3D Convolution** | For RGB images (3 channels), the filter extends to the full depth of the input. The filter moves along H and W only $\rightarrow$ output is 2D per filter |

---

## 2. Relation Between Input, Output, and Filter Sizes

### 2.1 Key Quantities

| Symbol | Meaning |
|--------|---------|
| $W_1, H_1, D_1$ | Width, Height, Depth of original input |
| $F$ | Spatial extent (size) of filter |
| $S$ | Stride |
| $P$ | Zero-padding |
| $K$ | Number of filters |

### 2.2 Output Dimension Formulas

$$
W_2 = \frac{W_1 - F + 2P}{S} + 1
$$
$$
H_2 = \frac{H_1 - F + 2P}{S} + 1
$$
$$
D_2 = K
$$

**Important Cases:**
- **No padding, stride 1:** $W_2 = W_1 - F + 1$ (output shrinks)
- **Same padding:** Choose $P$ such that $W_2 = W_1$ (preserves spatial dims)
- **Stride > 1:** Skips pixels $\rightarrow$ further reduction in output size

### 2.3 Worked Examples

**Example 1: AlexNet Layer 1**
- Input: $227 \times 227 \times 3$, $F = 11$, $S = 4$, $P = 0$, $K = 96$
- $W_2 = \frac{227 - 11 + 0}{4} + 1 = \mathbf{55}$
- Output: $55 \times 55 \times 96$

**Example 2:**
- Input: $32 \times 32 \times 3$, $F = 5$, $S = 1$, $P = 0$, $K = 6$
- $W_2 = \frac{32 - 5 + 0}{1} + 1 = \mathbf{28}$
- Output: $28 \times 28 \times 6$

---

## 3. Convolutional Neural Networks — Architecture

### 3.1 Key Idea

Instead of using **handcrafted kernels** (edge detectors, SIFT, HOG), we **learn meaningful kernels/filters** by treating them as parameters and training via **backpropagation**, alongside the weights of the classifier.

### 3.2 Sparse Connectivity

- In a regular feedforward network: **all** input neurons contribute to each hidden neuron → **dense** connections.
- In a CNN: **only a few local neurons** participate in computing each output neuron → **sparse** connections.
- Advantage: Exploits the spatial structure of images (local pixel interactions are most informative).
- **Reduces number of parameters** significantly.
- Information is **not lost**: neurons that don't directly interact at one layer can interact **indirectly** at deeper layers (through expanding receptive fields).

### 3.3 Weight Sharing

- The **same kernel** is applied at **all spatial locations** in the image.
- Motivation: An edge detector should detect edges everywhere, not just at one location.
- We can have **many different kernels**, but each kernel is shared across all positions.
- Further **reduces parameters** compared to dense layers.

### 3.4 CNN as Feedforward Network

A CNN can be viewed as a feedforward neural network where:
- Only a few weights (colored/active) are non-zero → sparse connections
- The rest of the weights are zero
- We can thus train it using **standard backpropagation**

---

## 4. Pooling Layers

### 4.1 Max Pooling

- Slide a window (e.g., 2 × 2 with stride 2) over the feature map.
- Take the **maximum value** in each window.
- **Effect:** Reduces spatial dimensions, provides some translation invariance.

### 4.2 Average Pooling

- Same sliding window approach, but take the **average** instead of the max.
- Used in GoogLeNet to replace the final fully connected layer.

---

## 5. CNN Architectures (ImageNet Success Stories)

### 5.1 LeNet-5 (1998) — Handwritten Character Recognition

**Architecture:**
$$
\text{Input}(32\times32) \to \text{Conv1}(F{=}5, K{=}6) \to \text{Pool1}(F{=}2) \to \text{Conv2}(F{=}5, K{=}16) \to \text{Pool2}(F{=}2) \to \text{FC}(120) \to \text{FC}(84) \to \text{Output}(10)
$$

**Key Properties:**
- Alternates **convolution** and **pooling** layers.
- Final layers are fully connected.
- Parameters per layer:
  - Conv1: 150
  - Pool1: 0 (no learnable params)
  - Conv2: 2400
  - Pool2: 0
  - FC1: 48,120 → 10,164 → FC2: 850

### 5.2 AlexNet (2012) — ILSVRC'12 Winner

**Architecture:**
$$
\text{Input}(227\times227\times3) \to \text{Conv}(96,F{=}11,S{=}4) \to \text{MaxPool} \to \text{Conv}(256,F{=}5) \to \text{MaxPool} \to \text{Conv}(384,F{=}3)\times3 \to \text{MaxPool} \to \text{FC}(4096)\times2 \to \text{FC}(1000)
$$

**Key Properties:**
- **8 layers** (5 conv + 3 FC)
- **Total parameters: ~27.55M**
- Used **ReLU** activation (first major CNN to do so — faster convergence)
- Top-5 error: **16.4%** on ImageNet
- The last convolution/maxpool output is flattened into a 1D vector, then densely connected to FC layers

### 5.3 ZF-Net (2013) — ILSVRC'13 Winner

**Key Differences from AlexNet:**
- Used **7×7 filters** in the first layer instead of 11×11 (with stride 2 instead of 4)
- Better hyperparameter tuning
- Top-5 error: **11.7%**
- **Total parameters: ~1.45M** (significant reduction)
- Used **deconvolution (transposed convolution)** to visualize what features each layer learns

### 5.4 VGGNet (2014) — ILSVRC'14 Runner-up

**Architecture (VGG-16):**
$$
\begin{aligned}
&\text{Input}(224\times224\times3) \\
&\to [\text{Conv3}\times3, 64]\times2 \to \text{MaxPool} \\
&\to [\text{Conv3}\times3, 128]\times2 \to \text{MaxPool} \\
&\to [\text{Conv3}\times3, 256]\times3 \to \text{MaxPool} \\
&\to [\text{Conv3}\times3, 512]\times3 \to \text{MaxPool} \\
&\to [\text{Conv3}\times3, 512]\times3 \to \text{MaxPool} \\
&\to \text{FC}(4096) \to \text{FC}(4096) \to \text{FC}(1000)
\end{aligned}
$$

**Key Properties:**
- Uses **only 3×3 kernels** throughout (key insight!)
- **19 layers** deep
- Top-5 error: **7.3%**
- Total parameters:
  - Non-FC layers: **~16M**
  - FC layers: **~122M** (dominated by first FC layer: 512×7×7×4096 ≈ 102M)
  - Most parameters are in the **first FC layer**
- **Why 3×3?** Two stacked 3×3 conv layers have the same receptive field as one 5×5 layer, but with fewer parameters and more non-linearities.

### 5.5 GoogLeNet / Inception (2014) — ILSVRC'14 Winner

#### 5.5.1 The Inception Module

**Motivation:** At each layer, why choose between 1×1, 3×3, 5×5 convolution, or max pooling? Apply **all of them** simultaneously and **concatenate** the feature maps.

**Problem:** Naive inception is computationally expensive.  
**Solution:** Use **1×1 convolutions** for **dimensionality reduction** before the expensive 3×3 and 5×5 convolutions.

**What does a 1×1 convolution do?**
- Aggregates along the **depth** dimension.
- Convolving a D × W × H input with D₁ (where D₁ < D) 1×1 filters results in a D₁ × W × H output.
- Reduces computations from O(F × F × D) to O(F × F × D₁).

**Inception Module Structure:**
```
Input
  ├── 1×1 conv (direct) ─────────────────────────────────┐
  ├── 1×1 conv (reduce) → 3×3 conv ─────────────────────┤
  ├── 1×1 conv (reduce) → 5×5 conv ─────────────────────┤ → Concatenation
  └── 3×3 max pool → 1×1 conv (reduce) ─────────────────┘
```

#### 5.5.2 GoogLeNet Architecture

- **22 layers** deep
- Contains **9 Inception modules** stacked together
- Uses **average pooling** instead of FC layers at the end:
  - Last layer output: 7 × 7 × 1024
  - Average pool (7 × 7): produces 1024-d vector
  - FC(1024 → 1000) + softmax
  - If FC were used directly: 7 × 7 × 1024 × 1000 = **49M parameters** (avoided!)

**Key Results:**
- Top-5 error: **6.7%**
- **12× fewer parameters** than AlexNet
- **2× more computations** than AlexNet

### 5.6 ResNet (2015) — ILSVRC'15 Winner

#### 5.6.1 Motivation

- **Observation:** A deeper network should perform at least as well as a shallower one (the extra layers can just learn identity mappings).
- **Problem:** In practice, deeper networks have **higher** error rates — the identity mapping is hard to learn explicitly.

#### 5.6.2 Residual Learning

Instead of learning a mapping H(x) directly, learn the **residual** F(x) = H(x) − x.

**Residual Block:**

$$H(x) = F(x) + x$$

> **Structure:** Input $x$ passes through two conv-BN layers to produce $F(x)$, then added back via **identity shortcut**: $H(x) = F(x) + x$, followed by ReLU.

**Why does this help?**
- The **identity shortcut** allows the network to retain a copy of the input.
- If the optimal function is close to identity, the network only needs to push F(x) → 0, which is easier than learning identity from scratch.
- Gradient can flow directly through the shortcut → mitigates **vanishing gradient** problem in very deep networks.

#### 5.6.3 ResNet Architecture & Results

- **152 layers** deep
- Top-5 error: **3.57%** on ImageNet
- **1st place** in all five main tracks:
  - ImageNet Classification
  - ImageNet Detection (16% better than 2nd)
  - ImageNet Localization (27% better than 2nd)
  - COCO Detection (11% better than 2nd)
  - COCO Segmentation (12% better than 2nd)

#### 5.6.4 Bag of Tricks (Training Details)

| Technique | Detail |
|-----------|--------|
| Normalization | Batch Normalization after every conv layer |
| Initialization | Xavier/2 initialization (He et al.) |
| Optimizer | SGD + Momentum (0.9) |
| Learning rate | 0.1, divided by 10 when validation error plateaus |
| Mini-batch size | 256 |
| Weight decay | 1e-5 |
| Dropout | **Not used** |

---

### 5.7 Summary: ImageNet Evolution

| Year | Network | Layers | Top-5 Error | Key Innovation |
|------|---------|--------|-------------|----------------|
| 2012 | AlexNet | 8 | 16.4% | ReLU, dropout, GPU training |
| 2013 | ZF-Net | 8 | 11.7% | Visualization, smaller first-layer filters |
| 2014 | VGGNet | 19 | 7.3% | 3×3 filters only, deeper |
| 2014 | GoogLeNet | 22 | 6.7% | Inception module, 1×1 conv, no FC |
| 2015 | ResNet | 152 | 3.57% | Residual connections, very deep |

---

## Part B: Deep Learning for Natural Language Processing — Learning Vectorial Representations of Words

---

## 6. Motivation for Word Representations

### 6.1 Problem with One-Hot Vectors

Given a vocabulary V of |V| unique words, each word can be represented as a **one-hot vector** of size |V|.

**Problems:**
1. **Very high dimensional** — |V| can be 50K (PTB corpus) to 13M (Google 1T corpus).
2. **No notion of similarity:**
   - Euclidean distance between **any** two words = √2
   - Cosine similarity between **any** two words = 0
   - Cannot capture that "cat" and "dog" (both domestic animals) are more related than "cat" and "truck".

### 6.2 Distributional Hypothesis

> *"You shall know a word by the company it keeps."* — Firth, J. R. (1957)

Key idea: Words that appear in similar **contexts** have similar **meanings**.

---

## 7. Count-Based Methods

### 7.1 Co-occurrence Matrix

- A **terms × terms** matrix X where X_{ij} = number of times word i appears in the context of word j.
- **Context** is defined as a window of k words around the target word.
- Each **row** (or column) gives a vectorial representation of the corresponding word.

### 7.2 Improving the Co-occurrence Matrix

| Problem | Solution |
|---------|----------|
| Stop words dominate counts | **Ignore** very frequent words (or remove from vocabulary) |
| Very high counts | Use a **threshold** t: X_{ij} = min(count(w_i, c_j), t) |
| Raw counts are noisy | Use **PMI** (Pointwise Mutual Information): PMI(w, c) = log[p(c|w) / p(c)] = log[count(w,c) × N / (count(c) × count(w))] |
| PMI can be −∞ | Use **PPMI**: PPMI(w, c) = max(PMI(w, c), 0) |

### 7.3 Severe Problems

- Co-occurrence matrix is **very high dimensional** (|V| dimensions)
- **Very sparse**
- Grows with the size of the vocabulary

**Solution: SVD (Singular Value Decomposition)**

---

## 8. SVD for Word Representations

### 8.1 SVD Decomposition

Given the PPMI co-occurrence matrix $X \in \mathbb{R}^{m \times n}$:

$$
X \approx \hat{X} = U_{m \times k} \cdot \Sigma_{k \times k} \cdot V^T_{k \times n}
$$

- **Best rank-k approximation** of X (by SVD theorem).
- Discovers **latent semantics** in the corpus.
- Reduces dimensionality from |V| to k.

### 8.2 Word Representation from SVD

**Conventionally:**
- **W_word = UΣ ∈ ℝ^{m×k}** → representation of the m words in the vocabulary (each row is a k-dimensional word vector)
- **W_context = V** → representation of the context words

**Key Property:**
- The dot product between rows of W_word preserves the similarity structure of the original matrix.
- After SVD reconstruction, latent co-occurrences (e.g., between "system" and "user") **become visible** even if the original counts were zero.

---

## 9. Prediction-Based Methods

### 9.1 Continuous Bag of Words (CBOW)

**Task:** Predict the target word given its context (surrounding words).

**Architecture (simple case, window = 1):**
$$
\begin{aligned}
\text{Input: } & x \in \mathbb{R}^{|V|} \quad (\text{one-hot of context word } c) \\
& \quad \downarrow \\
\text{Hidden: } & h = W_{\text{context}} \cdot x = u_c \quad (\text{selects } c\text{-th column of } W_{\text{context}}) \\
& \quad \downarrow \\
\text{Output: } & \hat{y}_w = \operatorname{softmax}(W_{\text{word}}^T \cdot h) \\
& \quad \downarrow \\
& P(\text{word} = i \mid \text{context} = c)
\end{aligned}
$$

**Parameters:**
- W_context ∈ ℝ^{k × |V|} — i-th column is the representation of context word i
- W_word ∈ ℝ^{k × |V|} — i-th column is the representation of word i

**Loss Function:**
$$
L(\theta) = -\log \hat{y}_w = -\log P(w \mid c) \\
     = -(u_c \cdot v_w - \log \sum_{w'\in V} \exp(u_c \cdot v_{w'}))
$$

**Analogy with SVD:** Both produce W_context and W_word; the i-th column of W_word corresponds to the representation of word i.

**For window size d:**
$$
h = \sum_{i=1}^{d-1} u_{c_i} \quad (\text{sum of context word vectors})
$$

### 9.2 Update Rule Interpretation

$$
v_w = v_w + \eta \cdot u_c \cdot (1 - \hat{y}_w)
$$

- If ŷ_w → 1: already predicting correctly → v_w **not updated**.
- If ŷ_w → 0: incorrect prediction → v_w gets updated by **adding a fraction of u_c** to it.
- This **increases cosine similarity** between v_w and u_c.
- Words appearing in **similar contexts** will have **similar representations** (transitively).

---

## 10. Skip-Gram Model (word2vec)

### 10.1 Key Difference from CBOW

- CBOW: Predict output word given context.
- **Skip-gram:** Predict **context words** given an input word.

**Loss Function:**
$$
L(\theta) = - \sum_{i=1}^{d-1} \log \hat{y}_{w_i}
$$
(Sum of cross-entropy errors for each context word.)

### 10.2 Computational Problem

The **softmax** denominator requires summation over **all words in the vocabulary** — computationally very expensive.

**Solutions:**
1. **Negative Sampling**
2. **Contrastive Estimation**
3. **Hierarchical Softmax**

---

## 11. Negative Sampling

### 11.1 Setup

- **D** = set of all correct (word, context) pairs from the corpus.
- **D'** = set of incorrect (word, random) pairs — constructed by randomly sampling a context word r that never appeared with w.

### 11.2 Objective

$$
\text{maximize} \quad \sum_{(w,c) \in D} \log \sigma(v_c^T \cdot v_w) + \sum_{(w,r) \in D'} \log \sigma(-v_r^T \cdot v_w)
$$

where $\sigma(x) = 1/(1 + e^{-x})$ is the sigmoid function.

### 11.3 Key Details

- For each positive pair (w, c), sample **k negative pairs** (w, r).
- Size of D' = k × size of D.
- Random context word r is drawn from a **modified unigram distribution:**
$$
r \sim \frac{p(r)^{3/4}}{N}
$$
where N = total number of words in the corpus.

---

## 12. Contrastive Estimation

- Score function s(w, c) computed using a neural network.
- For positive pair: want s(w, c) to be **high**.
- For negative pair: want s(w, r) to be **low**.
- **Margin-based objective:**
$$
\max(0,\; s - (s_c + m))
$$
where $m$ is the margin. If $s > s_c + m$, no update needed.

---

## 13. Hierarchical Softmax

### 13.1 Key Idea

- Construct a **binary tree** with |V| leaf nodes (one per word).
- Each internal node has a learnable vector u_i.
- The probability of a word w given context v_c is computed along the **unique path** from root to w:

$$
P(w \mid v_c) = \prod_{k=1}^{|\pi(w)|} P(\pi(w)_k \mid v_c)
$$

where:
- $\pi(w)$ is a binary vector encoding left/right turns on the path
- $P(\pi(w)_k = 1) = \sigma(v_c^T \cdot u_k)$ [branch left]
- $P(\pi(w)_k = 0) = 1 - \sigma(v_c^T \cdot u_k)$ [branch right]

### 13.2 Complexity

- Computation: O(|π(w)|) = O(log |V|) instead of O(|V|) for softmax.
- Even a **random arrangement** of words on leaf nodes works well in practice.
- Same total number of parameters as original softmax.

---

## 14. GloVe (Global Vectors)

### 14.1 Motivation

- **Count-based methods** (SVD): Use global co-occurrence statistics.
- **Prediction-based methods** (word2vec): Learn representations from local context.
- **GloVe:** Combine both — learn word vectors that are **faithful to global co-occurrence statistics**.

### 14.2 Derivation

Starting from:
$$v_i^T \cdot v_j = \log X_{ij} - b_i - b_j$$

**Objective:**
$$
\min_{v_i, v_j, b_i, b_j} \sum_{i,j} f(X_{ij})\cdot(v_i^T v_j + b_i + b_j - \log X_{ij})^2
$$

### 14.3 Weighting Function

To avoid over-weighting rare or very frequent co-occurrences:
$$
f(x) = \begin{cases}(x/x_{\max})^\alpha & \text{if } x < x_{\max} \\ 1 & \text{otherwise}\end{cases}
$$
where $\alpha$ is tunable per dataset.

---

## 15. Evaluating Word Representations

### 15.1 Intrinsic Evaluation Methods

| Method | Description |
|--------|-------------|
| **Semantic Relatedness** | Compare model's cosine similarity with human judgments of word relatedness. Compute correlation. |
| **Synonym Detection** | Given a term and 4 candidates, pick the one with highest cosine similarity. Measure accuracy. |
| **Analogy** | *Semantic:* brother:sister :: grandson:? → Find nearest neighbor of v_sister − v_brother + v_grandson. *Syntactic:* work:works :: speak:? → Find nearest neighbor of v_works − v_work + v_speak. |

### 15.2 Key Findings

- **Baroni et al. [2014]:** Prediction models consistently outperform count models in all tasks.
- **Levy et al. [2015]:** SVD does better than prediction-based models on **similarity** tasks, but not on **analogy** tasks.

---

## 16. Relation Between SVD and word2vec

- Word2vec **implicitly performs matrix factorization** (Levy et al., 2015).
- The factorized matrix M satisfies:
$$M = W_{\text{context}} \times W_{\text{word}}$$
$$M_{ij} = \text{PMI}(w_i, c_j) - \log(k)$$
($k$ = number of negative samples)

- This is very similar to what SVD does on the PPMI co-occurrence matrix.
- Both approaches are fundamentally performing **low-rank factorization** of a co-occurrence-related matrix.

---

## Quick Reference: Key Formulas

| Topic | Formula |
|-------|---------|
| **Conv output size** | $W_2 = (W_1 - F + 2P)/S + 1$ |
| **ResNet** | $H(x) = F(x) + x$ |
| **Softmax** | $P(w\mid c) = \exp(u_c \cdot v_w) / \sum_{w'} \exp(u_c \cdot v_{w'})$ |
| **Negative sampling** | $\max \sum \log\sigma(v_c^T v_w) + \sum \log\sigma(-v_r^T v_w)$ |
| **GloVe** | $\min \sum f(X_{ij})(v_i^T v_j + b_i + b_j - \log X_{ij})^2$ |
| **PMI** | $\text{PMI}(w,c) = \log[\text{count}(w,c)\cdot N / (\text{count}(c)\cdot\text{count}(w))]$ |
| **SVD word rep** | $W_{\text{word}} = U\Sigma \in \mathbb{R}^{m\times k}$ |

---
