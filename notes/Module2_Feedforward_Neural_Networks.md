# Module II: FeedForward Neural Networks

> **Exam Notes** — CS7015 Deep Learning (Lectures 4, 5)

---

## 1. Feedforward Neural Networks (FFNNs)

### 1.1 Architecture

A feedforward neural network processes information in **one direction** — input → hidden layers → output.

$$
\text{Input Layer} \rightarrow \text{Hidden Layer 1} \rightarrow \dots \rightarrow \text{Hidden Layer L-1} \rightarrow \text{Output Layer} \\
(x = h_0) \quad \rightarrow \quad (h_1) \quad \rightarrow \dots \rightarrow \quad (h_{L-1}) \quad \rightarrow \quad (\hat{y} = h_L)
$$

**Key components:**

| Component | Description |
|-----------|-------------|
| **Input layer** | $n$-dimensional vector $x$ (called the 0-th layer) |
| **Hidden layers** | $L-1$ layers, each with $n$ neurons |
| **Output layer** | $L$-th layer with $k$ neurons (e.g., $k$ classes) |
| **Weights** | $W_i \in \mathbb{R}^{n \times n}$ between layers $i-1$ and $i$ ($0 < i < L$); $W_L \in \mathbb{R}^{n \times k}$ for last layer |
| **Biases** | $b_i \in \mathbb{R}^n$ for hidden layers; $b_L \in \mathbb{R}^k$ for output layer |

### 1.2 Pre-activation and Activation

Each neuron computation is split into two parts:

**Pre-activation at layer $i$:**
$$
a_i(x) = b_i + W_i h_{i-1}(x)
$$

**Activation at layer $i$:**
$$
h_i(x) = g(a_i(x))
$$
where **$g$** is the activation function (e.g., logistic sigmoid, tanh, ReLU).

**Output layer activation:**
$$
f(x) = h_L(x) = O(a_L(x))
$$
where **$O$** is the output activation function (e.g., softmax, linear).

### 1.3 Full Model Expression

For a 3-layer network ($L = 3$):
$$
\hat{y}_i = f(x_i) = O(W_3 g(W_2 g(W_1 x + b_1) + b_2) + b_3)
$$

**Parameters:**
$$
\theta = [W_1, W_2, \dots, W_L, b_1, b_2, \dots, b_L]
$$

---

## 2. Output Functions and Loss Functions

### 2.1 Regression ($y \in \mathbb{R}$)

| Component | Choice |
|-----------|--------|
| **Output activation $O$** | **Linear** (so $\hat{y}$ is unbounded) |
| **Loss function** | **Squared Error** |

$$
L(\theta) = \frac{1}{N} \sum_{i=1}^N \sum_{j=1}^k (\hat{y}_{ij} - y_{ij})^2
$$

> Cannot use logistic/sigmoid as output activation because it restricts $\hat{y}$ to $[0, 1]$.

### 2.2 Classification (choose 1 of $K$ classes)

| Component | Choice |
|-----------|--------|
| **Output activation $O$** | **Softmax** |
| **Loss function** | **Cross-Entropy** |

**Softmax function:**
$$
\hat{y}_j = O(a_L)_j = \frac{\exp(a_{L,j})}{\sum_{i=1}^k \exp(a_{L,i})}
$$
- Ensures $\hat{y}$ is a valid **probability distribution** (all values $\in [0,1]$, sum $= 1$)

**Cross-Entropy loss:**
$$
L(\theta) = - \sum_{c=1}^k y_c \cdot \log(\hat{y}_c)
$$

Since $y$ is one-hot ($y_c = 1$ only for true class $\ell$):
$$
L(\theta) = -\log(\hat{y}_\ell)
$$

**Maximizing log ŷ_ℓ** is called maximizing the **log-likelihood** of the data.

### 2.3 Summary Table

| | Real-Valued Outputs | Probabilities |
|---|---|---|
| **Output Activation** | Linear | Softmax |
| **Loss Function** | Squared Error | Cross Entropy |

---

## 3. Backpropagation

### 3.1 Intuition

The loss at the output is propagated backward through the network using the **chain rule**:

1. We get a loss at the output and ask "who is responsible?"
2. The output layer says: "I take responsibility but I'm only as good as the hidden layers and weights below me"
3. This continues backward — each layer passes responsibility to the one below it
4. The chain rule formalizes this: we "talk" to each layer through the layers above it

$$
\frac{\partial L(\theta)}{\partial W_{111}} = \frac{\partial L(\theta)}{\partial \hat{y}} \cdot \frac{\partial \hat{y}}{\partial a_3} \cdot \frac{\partial a_3}{\partial h_2} \cdot \frac{\partial h_2}{\partial a_2} \cdot \frac{\partial a_2}{\partial h_1} \cdot \frac{\partial h_1}{\partial a_1} \cdot \frac{\partial a_1}{\partial W_{111}}
$$

### 3.2 Gradient w.r.t. Output Units

For **cross-entropy loss** with **softmax output**:

**Partial derivative w.r.t. $\hat{y}_i$:**
$$
\frac{\partial L(\theta)}{\partial \hat{y}_i} = -\frac{\mathbb{1}(\ell=i)}{\hat{y}_\ell}
$$

**Gradient vector w.r.t. $\hat{y}$:**
$$
\nabla_{\hat{y}} L(\theta) = -\left(\frac{1}{\hat{y}_\ell}\right) e(\ell)
$$
where $e(\ell)$ is a $k$-dimensional one-hot vector with 1 at position $\ell$.

**Gradient w.r.t. pre-activation $a_L$ (combining softmax derivative):**
$$
\frac{\partial L(\theta)}{\partial a_{L,i}} = -(\mathbb{1}(\ell=i) - \hat{y}_i)
$$

**In vector form:**
$$
\nabla_{a_L} L(\theta) = -(e(\ell) - \hat{y}) = \hat{y} - e(y)
$$

> This is an elegant result: the gradient at the output is simply **(predicted − actual)**.

### 3.3 Gradient w.r.t. Hidden Units

Using the **chain rule along multiple paths:**
$$
\frac{\partial L(\theta)}{\partial h_{ij}} = \sum_{m=1}^k \frac{\partial L(\theta)}{\partial a_{i+1,m}} \cdot W_{i+1,m,j}
$$

**In vector/matrix form:**
$$
\nabla_{h_i} L(\theta) = (W_{i+1})^T \cdot \nabla_{a_{i+1}} L(\theta)
$$

**Gradient w.r.t. pre-activation $a_i$:**
$$
\nabla_{a_i} L(\theta) = \nabla_{h_i} L(\theta) \odot [\dots, g'(a_{ik}), \dots]
$$
where $\odot$ is element-wise multiplication and $g'$ is the derivative of the activation function.

### 3.4 Gradient w.r.t. Weights and Biases

Since $a_k = b_k + W_k h_{k-1}$:

**Weights:**
$$
\frac{\partial a_{ki}}{\partial W_{kij}} = h_{k-1,j}
$$
$$
\nabla_{W_k} L(\theta) = \nabla_{a_k} L(\theta) \cdot h_{k-1}^T
$$

**Biases:**
$$
\nabla_{b_k} L(\theta) = \nabla_{a_k} L(\theta)
$$

### 3.5 Activation Function Derivatives

| Activation | $g(z)$ | $g'(z)$ |
|-----------|------|-------|
| **Logistic sigmoid** | $\sigma(z) = \dfrac{1}{1+e^{-z}}$ | $g(z)\cdot(1 - g(z))$ |
| **Tanh** | $\tanh(z) = \dfrac{e^z - e^{-z}}{e^z + e^{-z}}$ | $1 - (g(z))^2$ |

### 3.6 Full Algorithm — Pseudocode

**Main training loop:**

$$
\begin{aligned}
&\textbf{Algorithm: } \text{gradient\_descent()} \\
&t \leftarrow 0, \quad \text{max\_iterations} \leftarrow 1000 \\
&\text{Initialize } \theta_0 = [W_1^0, \dots, W_L^0,\; b_1^0, \dots, b_L^0] \\
&\textbf{while } t\mathrel{++} < \text{max\_iterations: } \\
&\quad h_1,\dots,h_{L-1},\; a_1,\dots,a_L,\; \hat{y} = \text{forward\_propagation}(\theta_t) \\
&\quad \nabla\theta_t = \text{backward\_propagation}(h_1,\dots,h_{L-1},\; a_1,\dots,a_L,\; y,\; \hat{y}) \\
&\quad \theta_{t+1} \leftarrow \theta_t - \eta \nabla\theta_t
\end{aligned}
$$

**Forward propagation:**

$$
\begin{aligned}
&\textbf{Algorithm: } \text{forward\_propagation}(\theta) \\
&\textbf{for } k = 1 \text{ to } L-1: \\
&\quad a_k = b_k + W_k h_{k-1} \\
&\quad h_k = g(a_k) \\
&a_L = b_L + W_L h_{L-1} \\
&\hat{y} = O(a_L)
\end{aligned}
$$

**Backward propagation:**

$$
\begin{aligned}
&\textbf{Algorithm: } \text{backward\_propagation}(h_1,\dots,h_{L-1},\; a_1,\dots,a_L,\; y,\; \hat{y}) \\
&\nabla_{a_L} L(\theta) = -(e(y) - \hat{y}) \\
&\textbf{for } k = L \text{ to } 1: \\
&\quad \nabla_{W_k} L(\theta) = \nabla_{a_k} L(\theta) \cdot h_{k-1}^T \quad \text{(gradient w.r.t. weights)} \\
&\quad \nabla_{b_k} L(\theta) = \nabla_{a_k} L(\theta) \quad \text{(gradient w.r.t. biases)} \\
&\quad \nabla_{h_{k-1}} L(\theta) = W_k^T \cdot \nabla_{a_k} L(\theta) \quad \text{(gradient w.r.t. layer below)} \\
&\quad \nabla_{a_{k-1}} L(\theta) = \nabla_{h_{k-1}} L(\theta) \odot [\dots, g'(a_{k-1,j}), \dots]
\end{aligned}
$$

---

## 4. Gradient Descent (GD)

### 4.1 Derivation from Taylor Series

For a move from $\theta$ to $\theta + \eta u$:
$$
L(\theta + \eta u) \approx L(\theta) + \eta \cdot u^T \nabla L(\theta) \quad [\text{since } \eta^2 \rightarrow 0 \text{ for small } \eta]
$$

The move is **favorable** only if: $L(\theta + \eta u) - L(\theta) < 0$, i.e.:
$$
u^T \nabla L(\theta) < 0
$$

Since $u^T \nabla L(\theta) = \|u\| \cdot \|\nabla L(\theta)\| \cdot \cos(\beta)$, this is **most negative** when $\cos(\beta) = -1$, i.e., **$\beta = 180^\circ$**.

> **$\rightarrow$ Move in the direction opposite to the gradient!**

### 4.2 Update Rule

$$
w_{t+1} = w_t - \eta \cdot \nabla w_t \\
b_{t+1} = b_t - \eta \cdot \nabla b_t
$$
Or more concisely: **$\theta_{t+1} = \theta_t - \eta \nabla\theta_t$**

Where **$\eta$** is the **learning rate** (small positive scalar).

### 4.3 Key Observations

- When the curve is **steep**, the gradient is **large** $\rightarrow$ large updates
- When the curve is **gentle**, the gradient is **small** $\rightarrow$ small updates $\rightarrow$ **progress slows down**
- Gradient descent takes a lot of time navigating regions with gentle slopes

---

## 5. Momentum-Based Gradient Descent

### 5.1 Intuition

> "If I am repeatedly being asked to move in the same direction then I should probably gain some confidence and start taking bigger steps in that direction"
>
> — Just as a ball gains momentum while rolling down a slope.

### 5.2 Update Rule

$$
\text{update}_t = \gamma \cdot \text{update}_{t-1} + \eta \nabla w_t \\
w_{t+1}  = w_t - \text{update}_t
$$

where **$\gamma$** is the momentum coefficient (typically ~0.9).

### 5.3 History Expansion

$$
\begin{aligned}
\text{update}_0 &= 0 \\
\text{update}_1 &= \eta\nabla w_1 \\
\text{update}_2 &= \gamma\eta\nabla w_1 + \eta\nabla w_2 \\
\text{update}_3 &= \gamma^2\eta\nabla w_1 + \gamma\eta\nabla w_2 + \eta\nabla w_3 \\
&\vdots \\
\text{update}_t &= \gamma^{t-1}\eta\nabla w_1 + \gamma^{t-2}\eta\nabla w_2 + \cdots + \eta\nabla w_t
\end{aligned}
$$

The update is an **exponentially weighted sum** of all past gradients. Recent gradients have higher weight.

### 5.4 Behavior

- ✅ **Advantage:** Able to take large steps even in regions with gentle slopes (momentum carries it along)
- ⚠️ **Disadvantage:** May **oscillate** in and out of the minima valley — takes many U-turns before converging
- Despite U-turns, still **converges faster** than vanilla GD

---

## 6. Nesterov Accelerated Gradient Descent (NAG)

### 6.1 Intuition

> **"Look before you leap"**

We know we're going to move by at least γ · update_{t-1}. Why not compute the gradient at this **partially updated** (look-ahead) position instead of the current position?

### 6.2 Update Rule

$$
\begin{aligned}
w_{\text{lookahead}} &= w_t - \gamma \cdot \text{update}_{t-1} \\
\text{update}_t &= \gamma \cdot \text{update}_{t-1} + \eta \cdot \nabla w_{\text{lookahead}} \\
w_{t+1} &= w_t - \text{update}_t
\end{aligned}
$$

### 6.3 Key Observations

- Looking ahead helps NAG **correct its course quicker** than standard momentum
- Oscillations are **smaller** and chances of escaping the minima valley are **also smaller**
- NAG takes **relatively shorter U-turns** compared to momentum

---

## 7. Stochastic Gradient Descent (SGD)

### 7.1 Vanilla (Batch) GD vs. SGD

| Property | Batch GD | Stochastic GD | Mini-Batch GD |
|----------|----------|---------------|---------------|
| **Gradient computed over** | All N points | 1 point | B points (batch) |
| **Steps per epoch** | 1 | N | N/B |
| **Gradient quality** | True gradient | Approximate | Better approximation |
| **Guarantee per step** | Loss decreases | **No guarantee** | No guarantee |
| **Speed per epoch** | Slow for large N | Fast | Moderate |

### 7.2 Why SGD?

- Batch GD: To make **1 update**, must process **all N points** — very slow for large datasets
- SGD: Updates parameters **after every single data point** — N updates per epoch

### 7.3 Mini-Batch GD

- Compromise: update parameters after seeing **B** data points (typically B = 16, 32, 64)
- Better gradient estimates than single-point SGD
- Reduces oscillations compared to SGD

### 7.4 Terminology

| Term | Definition |
|------|-----------|
| **1 epoch** | 1 pass over the entire data |
| **1 step** | 1 update of the parameters |
| **N** | Number of data points |
| **B** | Mini-batch size |

### 7.5 Oscillation Behavior

- SGD has **many oscillations** — each point pushes parameters in its own greedy direction
- A parameter update favorable to one point may **harm other points**
- No guarantee that each local greedy move reduces the global error
- Mini-batch SGD has **fewer oscillations** (better gradient estimates)

---

## 8. AdaGrad (Adaptive Gradient)

### 8.1 Motivation

If a feature x₂ is **sparse** (value = 0 for most inputs), then:
- ∇w₂ will be 0 for most inputs → w₂ gets very few updates
- If x₂ is sparse **and important**, we want a **higher learning rate** for w₂

> **Intuition:** Decay the learning rate for parameters in proportion to their update history (more updates → more decay).

### 8.2 Update Rule

$$
\begin{aligned}
v_t &= v_{t-1} + (\nabla w_t)^2 \qquad \text{(accumulate squared gradients)} \\
w_{t+1} &= w_t - \frac{\eta}{\sqrt{v_t + \varepsilon}} \cdot \nabla w_t
\end{aligned}
$$

- **vₜ** accumulates the sum of squared gradients for each parameter
- Parameters with **frequent large gradients** get a **smaller effective learning rate**
- Parameters with **infrequent gradients** (sparse features) get a **larger effective learning rate**

### 8.3 Behavior

- ✅ Ensures sparse features get higher learning rates and larger updates
- ✅ Dense features see their effective learning rate decrease (growing denominator)
- ⚠️ **Flipside:** Over time, vₜ grows monotonically → effective learning rate **decays to zero** → no further updates

> Note: The square root in the denominator is crucial. Without it, AdaGrad does not work well in practice.

---

## 9. RMSProp (Root Mean Square Propagation)

### 9.1 Motivation

> AdaGrad decays the learning rate very aggressively. Can we **prevent the rapid growth** of the denominator?

**Solution:** Use an **exponentially decaying average** of squared gradients instead of the full sum.

### 9.2 Update Rule

$$
\begin{aligned}
v_t &= \beta \cdot v_{t-1} + (1-\beta) \cdot (\nabla w_t)^2 \qquad \text{(exponential moving average)} \\
w_{t+1} &= w_t - \frac{\eta}{\sqrt{v_t + \varepsilon}} \cdot \nabla w_t
\end{aligned}
$$

- **β** controls the decay rate (typically β = 0.9)
- Unlike AdaGrad, vₜ does **not grow monotonically** — it can decrease if recent gradients are small

### 9.3 Key Advantage

- RMSProp overcomes AdaGrad's problem of getting stuck near convergence
- It is **less aggressive on the decay** of the learning rate
- The denominator can shrink if recent gradients are small

---

## 10. Adam (Adaptive Moment Estimation)

### 10.1 Intuition

> Do everything RMSProp does **plus** use a **cumulative history of gradients** (like momentum).

### 10.2 Update Rule

$$
\begin{aligned}
m_t &= \beta_1 \cdot m_{t-1} + (1-\beta_1) \cdot \nabla w_t \qquad \text{(1st moment: mean of gradients)} \\
v_t &= \beta_2 \cdot v_{t-1} + (1-\beta_2) \cdot (\nabla w_t)^2 \qquad \text{(2nd moment: mean of squared gradients)} \\[6pt]
\hat{m}_t &= \frac{m_t}{1-\beta_1^t} \qquad \text{(bias-corrected 1st moment)} \\
\hat{v}_t &= \frac{v_t}{1-\beta_2^t} \qquad \text{(bias-corrected 2nd moment)} \\[6pt]
w_{t+1} &= w_t - \frac{\eta}{\sqrt{\hat{v}_t + \varepsilon}} \cdot \hat{m}_t
\end{aligned}
$$

### 10.3 Default Hyperparameters

| Hyperparameter | Default Value |
|---------------|---------------|
| β₁ | 0.9 |
| β₂ | 0.999 |
| ε | 1e−8 |
| η | 0.001 or 0.0001 (for sequence problems) |

### 10.4 Why Bias Correction?

We compute mₜ as an **exponentially moving average**, but we want E[m̂ₜ] = E[∇wₜ].

**Without correction:**
$$
\begin{aligned}
m_1 &= (1-\beta)g_1 \\
m_2 &= \beta(1-\beta)g_1 + (1-\beta)g_2 \\
&\vdots \\
m_t &= (1-\beta)\sum_{i=1}^{t} \beta^{t-i} g_i \\
E[m_t] &= E[g] \cdot (1-\beta^t) \quad \leftarrow \text{biased!}
\end{aligned}
$$

**With correction:**
$$
\hat{m}_t = \frac{m_t}{1-\beta^t} \implies E[\hat{m}_t] = E[g] \quad \checkmark
$$

This is important especially in early timesteps when β₁ᵗ and β₂ᵗ are not negligible.

### 10.5 Behavior

- Cumulative gradient history gives a **speed up** (like momentum)
- Adaptive per-parameter learning rates (like RMSProp)
- Adam is generally the **default choice** in practice

---

## 11. Comparison of All Optimizers

| Algorithm | Update Rule | Key Feature |
|-----------|------------|-------------|
| **Vanilla GD** | $w \leftarrow w - \eta\nabla w$ | Simplest; slow on gentle slopes |
| **Momentum** | $\text{upd} = \gamma\cdot\text{upd} + \eta\nabla w;\; w \leftarrow w - \text{upd}$ | Accumulates velocity; faster but oscillates |
| **NAG** | Look-ahead then update | Corrects course quicker; fewer oscillations |
| **SGD** | Same as GD but per-point gradient | Fast steps; noisy; no decrease guarantee |
| **Mini-Batch** | Same as GD but per-batch gradient | Balance between GD and SGD |
| **AdaGrad** | $w \leftarrow w - \dfrac{\eta}{\sqrt{\sum(\nabla w)^2}}\nabla w$ | Good for sparse features; lr decays to 0 |
| **RMSProp** | $w \leftarrow w - \dfrac{\eta}{\sqrt{\text{EMA}(\nabla w)^2}}\nabla w$ | Fixes AdaGrad's aggressive decay |
| **Adam** | Momentum + RMSProp + bias correction | Best of both worlds; default choice |

---

## 12. Practical Tips

### 12.1 Learning Rate

- **Tune on log scale:** Try 0.0001, 0.001, 0.01, 0.1, 1.0
- **Fine search:** Once a good range is found, search within (e.g., if 0.1 works, try 0.05, 0.2, 0.3)
- **Annealing strategies:**
  - **Step decay:** Halve every 5 epochs, or halve if validation error increases
  - **Exponential decay:** $\eta = \eta_0 \cdot e^{-kt}$
  - **1/t decay:** $\eta = \dfrac{\eta_0}{1 + kt}$

### 12.2 Momentum Schedule (Sutskever et al., 2013)

$$
\gamma_t = \min\!\left(1 - 2^{-1-\log_2(\lfloor t/250 \rfloor + 1)},\; \gamma_{\max}\right)
$$
where $\gamma_{\max} \in \{0.999, 0.995, 0.99, 0.9, 0\}$

### 12.3 Which Optimizer to Use?

- **Adam** is the default choice (β₁ = 0.9, β₂ = 0.999, ε = 1e-8)
- SGD + Momentum (Nesterov or classical) with learning rate annealing also works well
- For sequence generation: η = 0.001 or 0.0001 typically best
- Some recent work suggests Adam may not converge in certain edge cases

---

## Quick Revision Checklist

- [ ] FFNN: input → hidden layers → output, pre-activation $a_i = b_i + W_i h_{i-1}$, activation $h_i = g(a_i)$
- [ ] Regression: linear output + squared error; Classification: softmax output + cross-entropy
- [ ] Softmax: $\hat{y}_j = \exp(a_j)/\sum\exp(a_i)$; Cross-entropy: $L = -\log(\hat{y}_\ell)$
- [ ] Backprop output gradient: $\nabla_{a_L} L = -(e(y) - \hat{y}) = \hat{y} - \text{one-hot}(y)$
- [ ] Backprop hidden gradient: $\nabla_{h_i} = W_{i+1}^T \cdot \nabla_{a_{i+1}}$; then $\nabla_{a_i} = \nabla_{h_i} \odot g'(a_i)$
- [ ] Weight gradient: $\nabla_{W_k} = \nabla_{a_k} \cdot h_{k-1}^T$; Bias gradient: $\nabla_{b_k} = \nabla_{a_k}$
- [ ] Sigmoid derivative: $\sigma(z)(1-\sigma(z))$; Tanh derivative: $1-\tanh^2(z)$
- [ ] GD: move opposite to gradient (from Taylor series, $\beta = 180^\circ$ is optimal)
- [ ] Momentum: exponentially weighted sum of past gradients; faster but oscillates
- [ ] NAG: compute gradient at look-ahead position; reduces oscillations
- [ ] SGD: update per point (noisy); Mini-batch: update per $B$ points (better estimate)
- [ ] AdaGrad: per-parameter lr using $\sum(\nabla w)^2$; good for sparse features; lr $\to 0$
- [ ] RMSProp: exponential moving average of squared gradients; fixes AdaGrad decay
- [ ] Adam: momentum + RMSProp + bias correction; default choice; $\beta_1=0.9,\; \beta_2=0.999$
