# Module I: Deep Learning Introduction

> **Exam Notes** — CS7015 Deep Learning (Lectures 1, 2, 3)

---

## 1. History (Partial) of Deep Learning

### 1.1 Biological Neurons

- **Reticular Theory (1871–1873):** Joseph von Gerlach proposed the nervous system is a single continuous network (not discrete cells). Camillo Golgi's staining technique supported this view.
- **Neuron Doctrine (1888–1891):** Santiago Ramón y Cajal used Golgi's technique and proposed that the nervous system is made of **discrete individual cells** forming a network.
- **Term "Neuron" (~1891):** Coined by Heinrich Wilhelm Gottfried von Waldeyer-Hartz, who consolidated the Neuron Doctrine.
- **Nobel Prize (1906):** Both Golgi and Cajal jointly received the Nobel Prize for Physiology or Medicine.
- **Confirmation (1950s):** Electron microscopy unambiguously confirmed the Neuron Doctrine — nerve cells are individual cells interconnected through **synapses**.

### 1.2 Timeline of Key Events

| Year | Event |
|------|-------|
| 1847 | Cauchy discovers **Gradient Descent** (motivated by computing orbits of heavenly bodies) |
| 1943 | **McCulloch-Pitts Neuron** proposed |
| 1957–1958 | **Perceptron** proposed by Frank Rosenblatt |
| 1965–1968 | First generation **Multilayer Perceptrons** (Ivakhnenko et al.) |
| 1969 | **Perceptron Limitations** — Minsky & Papert's book "Perceptrons" |
| 1969–1986 | **AI Winter** of connectionism |
| 1986 | **Backpropagation** popularized by Rumelhart, Hinton & Williams |
| 1989 | **Universal Approximation Theorem** (Hornik, Stinchcombe, White) |

### 1.3 The Deep Revival

| Year | Milestone |
|------|-----------|
| 1991–1993 | Unsupervised pre-training for "Very Deep Learner" (Schmidhuber) |
| 2006 | Unsupervised pre-training with Deep Boltzmann Machines (Hinton & Salakhutdinov) |
| 2009 | Handwriting recognition success (Graves et al.) |
| 2010 | Speech recognition gains; new record on MNIST using GPUs (Ciresan et al.) |
| 2011 | First superhuman visual pattern recognition (Ciresan et al. — Traffic Sign Recognition) |
| 2012–2016 | ImageNet breakthroughs: AlexNet (16%), ZFNet (11.2%), VGGNet (7.3%), GoogLeNet (6.7%), **ResNet (3.6%, 152 layers!)** |

---

## 2. Deep Learning Success Stories

- **Handwriting Recognition:** Graves et al. outperformed all entries in Arabic handwriting recognition competition (2009)
- **Speech Recognition:** Dahl et al. showed 16.0% and 23.2% relative error reduction over SOTA (2010)
- **Visual Recognition:** Superhuman performance on traffic sign recognition; progressive improvements on ImageNet
- **Game Playing:** DQNs for Atari (2015), AlphaGo (2015), DeepStack for Poker (2016), Dota2 bots (2017)
- **Language & Vision:** Machine translation, image captioning, visual QA, video summarization
- **Generative Models:** VAEs (2013), GANs (2014), WaveNets (2016), Progressive GANs (2017)

---

## 3. McCulloch-Pitts (MP) Neuron

### 3.1 Model Definition

The **MP Neuron** (1943) is a highly simplified computational model of the biological neuron.

- **Inputs:** $x_1, x_2, \dots, x_n \in \{0, 1\}$ (binary)
- **Aggregation function:** $g(x) = \sum_i x_i$
- **Decision function (Thresholding Logic):**

$$
y = f(g(x)) = \begin{cases} 
1 & \text{if } g(x) \geq \theta \\
0 & \text{if } g(x) < \theta 
\end{cases}
$$

Where **$\theta$** is the **thresholding parameter**.

### 3.2 Key Properties

- Inputs can be **excitatory** or **inhibitory**
- If **any** inhibitory input is 1, the output is 0 (regardless of other inputs)
- The function `g` aggregates inputs; function `f` takes a decision based on the aggregation

### 3.3 Boolean Function Examples with MP Neuron

| Function | $\theta$ | Notes |
|----------|---|-------|
| AND (3 inputs) | 3 | All inputs must be 1 |
| OR (3 inputs) | 1 | At least one input must be 1 |
| NOR | 0 | Output 1 only when all inputs are 0 |
| NOT (1 input) | 0 | Output is complement of input |
| $x_1$ AND $\neg x_2$ | 1 | $x_2$ is inhibitory |

---

## 4. Thresholding Logic & Geometric Interpretation

### 4.1 Linear Separability

A single MP neuron splits the input space into **two halves** using a **line** (2D) or **plane** (higher-D):

- Points on or above the line: $\sum x_i - \theta = 0 \rightarrow$ output **1**
- Points below the line $\rightarrow$ output **0**

**Linear Separability Definition (Boolean Functions):**
> A boolean function is linearly separable if there exists a line (or hyperplane) such that all inputs producing output 1 lie on one side, and all inputs producing output 0 lie on the other side.

### 4.2 Important Result

- A single MP neuron can represent **only** linearly separable boolean functions
- **XOR is NOT linearly separable** — cannot be represented by a single MP neuron (or single perceptron)

---

## 5. Perceptrons

### 5.1 Model Definition

The **Perceptron** (Rosenblatt, 1958; analyzed by Minsky & Papert, 1969) extends the MP neuron:

**Key differences from MP Neuron:**
1. **Numerical weights** for inputs (not all inputs treated equally)
2. **A mechanism for learning** these weights
3. Inputs are **not limited to boolean values** — can be real-valued

**Mathematical formulation:**

$$
y = \begin{cases} 
1 & \text{if } \sum_{i=1}^n w_i \cdot x_i \geq \theta \\
0 & \text{if } \sum_{i=1}^n w_i \cdot x_i < \theta 
\end{cases}
$$

**Bias formulation** (absorb threshold into weights):
- Set $x_0 = 1$ and $w_0 = -\theta$ (called the **bias**)

$$
y = \begin{cases} 
1 & \text{if } \sum_{i=0}^n w_i \cdot x_i \geq 0 \\
0 & \text{if } \sum_{i=0}^n w_i \cdot x_i < 0 
\end{cases}
$$

### 5.2 Why Weights Matter (Movie Example)

Consider predicting whether we'd like a movie based on:
- x₁ = isActorDamon, x₂ = isGenreThriller, x₃ = isDirectorNolan

**Weights** allow assigning different importance to inputs. A Nolan fan might assign high weight to x₃ so that even if the actor isn't Matt Damon and the genre isn't thriller, the threshold is crossed.

**Bias (w₀)** represents **prior prejudice**:
- Movie buff → low threshold (θ ≈ 0), watches anything
- Selective viewer → high threshold (θ = 3), very picky

### 5.3 Perceptron vs. MP Neuron

| Feature | MP Neuron | Perceptron |
|---------|-----------|------------|
| Inputs | Binary {0,1} | Real-valued |
| Weights | All equal (1) | Different weights per input |
| Threshold | Hand-coded | Learnable |
| Output | Binary | Binary |
| Separability | Linearly separable only | Linearly separable only |

---

## 6. Perceptron Learning Algorithm

### 6.1 Algorithm

$$
\begin{aligned}
&P \leftarrow \text{inputs with label } 1,\quad N \leftarrow \text{inputs with label } 0 \\
&\text{Initialize } w \text{ randomly} \\
&\textbf{while } !\text{convergence:} \\
&\quad \text{Pick random } x \in P \cup N \\
&\quad \textbf{if } x \in P \text{ and } w \cdot x < 0: \quad w \leftarrow w + x \\
&\quad \textbf{if } x \in N \text{ and } w \cdot x \geq 0: \quad w \leftarrow w - x
\end{aligned}
$$

### 6.2 Geometric Intuition

The algorithm works by adjusting the angle between the weight vector **w** and data points:

- The line **wᵀx = 0** divides input space into two halves
- **w** is perpendicular to this decision boundary
- For **positive** points (x ∈ P): want angle between w and x to be **< 90°** (i.e., wᵀx ≥ 0)
- For **negative** points (x ∈ N): want angle between w and x to be **> 90°** (i.e., wᵀx < 0)

**Why corrections work:**

For $x \in P$ with $w \cdot x < 0$ (misclassified):
$$
w_{\text{new}} = w + x \\
\cos(\alpha_{\text{new}}) \propto w_{\text{new}}^T x = w^T x + x^T x > w^T x = \cos(\alpha)
$$
$\rightarrow \alpha_{\text{new}} < \alpha$ (angle decreases) ✓

For $x \in N$ with $w \cdot x \geq 0$ (misclassified):
$$
w_{\text{new}} = w - x \\
\cos(\alpha_{\text{new}}) \propto w_{\text{new}}^T x = w^T x - x^T x < w^T x = \cos(\alpha)
$$
$\rightarrow \alpha_{\text{new}} > \alpha$ (angle increases) ✓

### 6.3 Convergence Proof (Key Steps)

**Theorem:** If sets P and N are finite and linearly separable, the perceptron learning algorithm converges in a finite number of steps.

**Proof sketch:**
1. **Setup:** Convert to single set P' = P ∪ N⁻ (negate points in N). Normalize all points (||p|| = 1). Let w* be the optimal solution (exists by linear separability).
2. **Numerator bound:** At step t with k corrections made:
   - w* · w_{t+1} ≥ w* · w₀ + kδ, where δ = min{w* · pᵢ} > 0
3. **Denominator bound:**
   - ||w_{t+1}||² ≤ ||w₀||² + k (since ||pᵢ|| = 1 and wᵀpᵢ ≤ 0 at correction step)
4. **Conclusion:** cos(β) ≥ (w* · w₀ + kδ) / √(||w₀||² + k) grows proportional to √k
   - Since cos(β) ≤ 1, **k must be bounded** → finite number of corrections → convergence! ✓

---

## 7. Multilayer Perceptrons (MLPs)

### 7.1 Structure

A network containing:
- **Input layer:** receives inputs (x₁, x₂, ..., xₙ)
- **Hidden layer(s):** one or more layers of perceptrons
- **Output layer:** produces final output y

**Terminology:**
- Hidden layer outputs are denoted h₁, h₂, ...
- Weights between input → hidden layer = "layer 1 weights"
- Weights between hidden → output layer = "layer 2 weights"

### 7.2 XOR Example

XOR is not linearly separable, but a network of perceptrons can implement it:

**Architecture:** 2 inputs → 4 hidden perceptrons → 1 output perceptron

- Each hidden perceptron fires for exactly **one specific input combination** (using +1/-1 encoding with bias = -2)
- The output weights w₁, w₂, w₃, w₄ can be set to produce any desired output for each input

**For XOR:**
- Need: w₁ < w₀, w₂ ≥ w₀, w₃ ≥ w₀, w₄ < w₀
- Unlike single perceptron, **no contradictions** arise!

---

## 8. Representation Power of MLPs

### 8.1 Theorem (Boolean Functions)

> **Any boolean function** of n inputs can be represented **exactly** by a network of perceptrons containing **1 hidden layer** with **2ⁿ perceptrons** and **1 output perceptron**.

**Proof idea:**
- Each hidden perceptron fires for exactly one of the 2ⁿ possible inputs
- Each output weight controls the output for its corresponding input independently
- No contradictions can arise since each weight handles one input exclusively

**Note:** 2ⁿ + 1 perceptrons is **sufficient** but not necessary (e.g., AND needs only 1 perceptron).

**Catch:** The number of hidden perceptrons grows **exponentially** with n.

### 8.2 Counting Boolean Functions

- For n inputs: **2^(2ⁿ)** possible boolean functions
- For 2 inputs: 16 functions total, **14 are linearly separable** (all except XOR and XNOR)

---

## 9. Sigmoid Neurons

### 9.1 Motivation

The perceptron's **step function** output is too harsh:
- Small change in input near the threshold causes **abrupt** change in output (0 → 1)
- Example: criticsRating = 0.51 → like, but 0.49 → dislike (with θ = 0.5)
- We need a **smoother** decision function

### 9.2 Logistic Sigmoid Function

$$
y = \sigma(z) = \frac{1}{1 + e^{-z}}
$$
$$
\text{where } z = w_0 + \sum_{i=1}^n w_i x_i = w^T x + b
$$

### 9.3 Properties

| Property | Perceptron | Sigmoid Neuron |
|----------|-----------|----------------|
| Output | Binary {0, 1} | Continuous [0, 1] |
| Interpretation | Hard decision | **Probability** |
| Smoothness | Not smooth, not continuous at w₀ | **Smooth, continuous, differentiable** |
| Transition | Abrupt step at threshold | Gradual transition |

### 9.4 Key Observation

The output of a sigmoid neuron can be interpreted as a **probability** (e.g., probability of liking a movie).

---

## 10. Gradient Descent

### 10.1 Supervised ML Setup

| Component | Description |
|-----------|-------------|
| **Data** | {xᵢ, yᵢ}ᵢ₌₁ⁿ — input-output pairs |
| **Model** | ŷ = f(x; w, b) — our approximation (e.g., sigmoid neuron) |
| **Parameters** | w, b — to be learned from data |
| **Loss function** | L(w, b) = Σᵢ (ŷᵢ - yᵢ)² — guides learning |
| **Learning algorithm** | Gradient Descent — minimizes the loss |

### 10.2 Derivation from Taylor Series

For a move from $\theta$ to $\theta + \eta u$:

$$
L(\theta + \eta u) \approx L(\theta) + \eta \cdot u^T \nabla_\theta L(\theta) \quad [\text{since } \eta^2 \rightarrow 0 \text{ for small } \eta]
$$

The move is **favorable** only if: $L(\theta + \eta u) - L(\theta) < 0$, which requires:

$$
u^T \nabla_\theta L(\theta) < 0
$$

Since $u^T \nabla_\theta L(\theta) = \|u\| \cdot \|\nabla_\theta L(\theta)\| \cdot \cos(\beta)$, this is **most negative** when $\cos(\beta) = -1$, i.e., **$\beta = 180^\circ$**.

**$\rightarrow$ Move in the direction opposite to the gradient!**

### 10.3 Update Rule

$$
w_{t+1} = w_t - \eta \cdot \frac{\partial L}{\partial w} \bigg|_{w=w_t} \\
b_{t+1} = b_t - \eta \cdot \frac{\partial L}{\partial b} \bigg|_{b=b_t}
$$

Where **$\eta$** is the **learning rate** (small positive scalar for conservative moves).

### 10.4 Gradient Derivation for Sigmoid Neuron

For a single data point (x, y) with f(x) = 1/(1 + e^(-(wx+b))):

$$L(w,b) = \tfrac{1}{2}(f(x)-y)^2$$

**Gradient w.r.t. $w$:**
$$\nabla w = (f(x)-y)\cdot f(x)\cdot(1-f(x))\cdot x$$

**Gradient w.r.t. $b$:**
$$\nabla b = (f(x)-y)\cdot f(x)\cdot(1-f(x))$$

For **$N$ data points:**
$$\begin{aligned}
\nabla w &= \sum_{i=1}^N (f(x_i)-y_i)\cdot f(x_i)\cdot(1-f(x_i))\cdot x_i \\
\nabla b &= \sum_{i=1}^N (f(x_i)-y_i)\cdot f(x_i)\cdot(1-f(x_i))
\end{aligned}$$

### 10.5 Algorithm

$$
\begin{aligned}
&t \leftarrow 0, \quad \text{max\_iterations} \leftarrow 1000 \\
&\textbf{while } t < \text{max\_iterations:} \\
&\quad w_{t+1} \leftarrow w_t - \eta\,\nabla w_t \\
&\quad b_{t+1} \leftarrow b_t - \eta\,\nabla b_t \\
&\quad t \leftarrow t+1
\end{aligned}
$$

---

## 11. Feedforward Neural Networks

### 11.1 Definition

A feedforward neural network is a multilayer network where:
- Information flows in **one direction** — from input layer through hidden layers to output layer
- No cycles or loops in the connections
- Each layer is **fully connected** to the next layer

### 11.2 Architecture

$$
\text{Input } (x) \;\rightarrow\; \text{Hidden}_1\,(h_1) \;\rightarrow\; \cdots \;\rightarrow\; \text{Hidden}_L\,(h_L) \;\rightarrow\; \text{Output }(\hat{y})
$$

- **Depth:** Number of hidden layers
- **Width:** Number of neurons per layer
- Information is processed through successive layers of nonlinear transformations

---

## 12. Representation Power of Feedforward Neural Networks

### 12.1 Universal Approximation Theorem

> A multilayer network of sigmoid neurons with a **single hidden layer** can approximate **any continuous function** f: ℝⁿ → ℝᵐ to **any desired precision** ε.

That is, for any $f(x)$ and $\varepsilon > 0$, there exists a network $g(x)$ such that:
$$|g(x) - f(x)| < \varepsilon \quad \text{for all } x$$
**(Cybenko, 1989; Hornik, 1991)**

### 12.2 Illustrative Proof Idea

**Key insight:** Any arbitrary function can be approximated by a **sum of "tower" functions**.

**1D Case — Constructing a tower:**
1. A sigmoid function with **very large w** approximates a **step function**
2. The bias **b** controls the **position** of the step on the x-axis
3. **Subtracting** two step functions (with different b values) creates a **tower function**
4. Summing many towers of appropriate heights and positions → approximates any function

**2D Case — Constructing a 3D tower:**
1. Set w₂ = 0, use large w₁ → 2D step function (ridge along x₂)
2. Subtract two such ridges (different b) → "open tower" (open from 2 sides)
3. Repeat with w₁ = 0, large w₂ → another open tower with different orientation
4. **Add** both open towers → tower on elevated base
5. Pass through another sigmoid → clean tower
6. Sum many towers → approximate any 2D function

**Neuron count for towers:**
| Input dimension | Neurons needed for one tower |
|----------------|------------------------------|
| 1D | 2 neurons |
| 2D | 4 neurons |
| nD | 2n neurons |

### 12.3 Comparison: MLP Perceptrons vs. MLP Sigmoid Neurons

| MLP of Perceptrons | MLP of Sigmoid Neurons |
|---|---|
| Can represent any **boolean function** exactly | Can approximate any **continuous function** to arbitrary precision |
| 1 hidden layer with 2ⁿ perceptrons | 1 hidden layer with enough neurons |
| No error guarantee for real-valued functions | ε-approximation guarantee |

### 12.4 Application to Classification

The proof tells us that a neural network with two hidden layers can approximate any complex decision boundary (e.g., separating blue and red points that are not linearly separable) by constructing a sum of tower functions.

---

## Quick Revision Checklist

- [ ] MP Neuron: binary inputs, aggregation + thresholding, linearly separable functions only
- [ ] Perceptron: weighted inputs, bias, real-valued inputs, still linearly separable
- [ ] Perceptron Learning Algorithm: update rule $w \leftarrow w \pm x$, convergence proof ($\cos\beta$ grows as $\sqrt{k}$)
- [ ] XOR problem: not linearly separable $\rightarrow$ need multi-layer network
- [ ] MLP Representation Theorem: any boolean function with $2^n$ hidden perceptrons + 1 output
- [ ] Sigmoid neuron: smooth, differentiable, output = probability, $\sigma(z) = 1/(1+e^{-z})$
- [ ] Gradient Descent: move opposite to gradient, $\eta$ controls step size, derived from Taylor series
- [ ] Gradient formulas: $\nabla w = (f(x)-y)\cdot f(x)\cdot(1-f(x))\cdot x$
- [ ] Universal Approximation Theorem: 1 hidden layer of sigmoid neurons $\rightarrow$ approximate any continuous function
- [ ] Tower function construction: subtract two step functions $\rightarrow$ tower $\rightarrow$ sum of towers $\approx$ any function
