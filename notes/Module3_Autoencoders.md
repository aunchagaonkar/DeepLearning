# Module III: Autoencoders

> **Exam Notes** — CS7015 Deep Learning (Lectures 6, 7)

---

## 1. Introduction to Autoencoders

### 1.1 Definition

An **autoencoder** is a special type of feedforward neural network that:

1. **Encodes** its input $x_i$ into a hidden representation **h**
2. **Decodes** (reconstructs) the input again from this hidden representation as **$\hat{x}_i$**

The model is trained to minimize a loss function that ensures $\hat{x}_i$ is close to $x_i$.

**Mathematical formulation:**

$$
\text{Encoder:} \quad h = g(W \cdot x_i + b) \\
\text{Decoder:} \quad \hat{x}_i = f(W^* \cdot h + c)
$$

Where:
- **$W$** = encoder weight matrix
- **$W^*$** = decoder weight matrix
- **$b$** = encoder bias, **$c$** = decoder bias
- **$g(\cdot)$** = encoder activation (typically sigmoid)
- **$f(\cdot)$** = decoder activation (depends on input type)

### 1.2 Undercomplete vs Overcomplete Autoencoders

| Type | Condition | Behavior |
|------|-----------|----------|
| **Undercomplete** | $\dim(h) < \dim(x_i)$ | If we can still reconstruct $\hat{x}_i$ perfectly from $h$, then $h$ is a **loss-free encoding** of $x_i$ — it captures all important characteristics. Analogous to **PCA**. |
| **Overcomplete** | $\dim(h) \geq \dim(x_i)$ | The autoencoder could learn a **trivial identity encoding** — simply copying $x_i$ into $h$ and then $h$ into $\hat{x}_i$. This is **useless** as it reveals nothing about important data characteristics. |

---

## 2. Choice of Decoder Activation & Loss Function

### 2.1 Binary Inputs ($x_{ij} \in \{0, 1\}$)

**Decoder activation:** Logistic sigmoid

$$
\hat{x}_i = \sigma(W^* \cdot h + c)
$$

> Logistic is most apt because it naturally restricts all outputs to be between 0 and 1.

**Loss function:** Cross-entropy loss (for a single $n$-dimensional input):

$$
L = -\sum_{j=1}^n \left[ x_{ij} \cdot \log(\hat{x}_{ij}) + (1 - x_{ij}) \cdot \log(1 - \hat{x}_{ij}) \right]
$$

**Key property:** This loss is minimized when $\hat{x}_{ij} = x_{ij}$ (reconstructed = original).

**Gradients for backpropagation:**

$$
\frac{\partial L(\theta)}{\partial h_{2j}} = -\frac{x_{ij}}{\hat{x}_{ij}} + \frac{1 - x_{ij}}{1 - \hat{x}_{ij}}
$$

$$
\frac{\partial h_{2j}}{\partial a_{2j}} = \sigma(a_{2j})(1 - \sigma(a_{2j}))
$$

### 2.2 Real-Valued Inputs ($x_{ij} \in \mathbb{R}$)

**Decoder activation:** Linear (identity)

$$
\hat{x}_i = W^* \cdot h + c
$$

> Logistic or tanh would restrict $\hat{x}_i$ to $[0,1]$ or $[-1,1]$, but we need $\hat{x}_i \in \mathbb{R}^n$.

**Loss function:** Mean squared error:

$$
L = \frac{1}{m} \sum_{i=1}^m \sum_{j=1}^n (\hat{x}_{ij} - x_{ij})^2
$$

Equivalently: 
$$
L = \frac{1}{m} \sum_{i=1}^m (\hat{x}_i - x_i)^T(\hat{x}_i - x_i)
$$

**Gradients:**

$$
\frac{\partial L(\theta)}{\partial \hat{x}_i} = 2(\hat{x}_i - x_i)
$$

> The autoencoder is trained just like a regular feedforward network using **backpropagation**. We need formulas for $\frac{\partial L(\theta)}{\partial W^*}$ and $\frac{\partial L(\theta)}{\partial W}$, which follow the standard chain rule through the network layers.

**Encoder activation:** Typically chosen as the **sigmoid function** for both binary and real-valued input cases.

---

## 3. Link Between PCA and Autoencoders

### 3.1 PCA Recap (from Lecture 6)

**Principal Component Analysis** transforms data to a new basis where:
- Dimensions have **high variance** (informative)
- Dimensions are **uncorrelated** (non-redundant)
- The basis vectors are **orthogonal** (convenient)

Given data matrix X (m×n, zero-mean, unit variance), PCA finds projection matrix P whose columns are eigenvectors of XᵀX (the covariance matrix).

**Key PCA properties:**
- Transformed data: X̂ = XP
- Covariance of transformed data: (1/m)X̂ᵀX̂ = PᵀΣP = D (diagonal)
- P diagonalizes the covariance matrix Σ = (1/m)XᵀX
- Select **top-k** eigenvectors to minimize reconstruction error

### 3.2 Equivalence Theorem

> The encoder of a **linear autoencoder** is equivalent to PCA if we:
> 1. Use a **linear encoder** (no nonlinear activation)
> 2. Use a **linear decoder** (no nonlinear activation)
> 3. Use a **squared error** loss function
> 4. **Normalize** the inputs to zero mean and unit variance

### 3.3 Proof Outline

**Setup:** We want to minimize:

$$
\min_{W,W^*} \|X - HW^*\|_F^2
$$
where $H$ is the encoded representation and $\|A\|_F$ is the Frobenius norm.

**Step 1: SVD Solution**

From SVD, the optimal solution to the above problem is:

$$
HW^* = U_{\cdot,\leq k}\,\Sigma_{k\times k}\,V^T_{\cdot,\leq k}
$$

By matching variables, one possible solution is:
$$
H = U_{\cdot,\leq k}\,\Sigma_{k\times k}, \qquad W^* = V^T_{\cdot,\leq k}
$$

**Step 2: Show H is a linear transformation of X**

Starting from H = U_{.,≤k} · Σ_{k,k} and using X = UΣVᵀ (SVD of X):

$$
\begin{aligned}
H &= (XX^T)(XX^T)^{-1}\,U_{\cdot,\leq k}\,\Sigma_{k,k} \\
  &= (XV\Sigma U^T)(U\Sigma V^T V\Sigma^T U^T)^{-1}\,U_{\cdot,\leq k}\,\Sigma_{k,k} \\
  &= XV\Sigma^T U^T \cdot U(\Sigma\Sigma^T)^{-1}U^T \cdot U_{\cdot,\leq k}\,\Sigma_{k,k} \\
  &= XV\Sigma^T(\Sigma\Sigma^T)^{-1} \cdot U^T U_{\cdot,\leq k}\,\Sigma_{k,k} \\
  &= XV\Sigma^{-T}\Sigma^{-1}\Sigma_{k,k} \\
  &= XV_{\cdot,\leq k}
\end{aligned}
$$

Therefore: $H = X \cdot V_{\cdot,\leq k}$

Thus **H is a linear transformation** of X and the **encoder weight matrix W = V_{.,≤k}**.

**Step 3: Connect to PCA**

- From SVD: **V** is the matrix of eigenvectors of **XᵀX**
- From PCA: **P** is the matrix of eigenvectors of the **covariance matrix**
- If entries of X are normalized such that:

$$
\hat{x}_{ij} = \frac{1}{\sqrt{m}}\left(x_{ij} - \frac{1}{m}\sum_k x_{kj}\right)
$$

then **XᵀX is indeed the covariance matrix**.

**Conclusion:** The encoder matrix W of a linear autoencoder and the projection matrix P of PCA are the same — both are eigenvectors of XᵀX. **Hence proved.** ✓

---

## 4. Regularization in Autoencoders

### 4.1 Motivation

- Poor generalization can happen even in **undercomplete** autoencoders
- It is an even **more serious problem** for **overcomplete** autoencoders where the model can simply learn to copy xᵢ to h and then h to x̂ᵢ (identity function)
- **Regularization** is needed to avoid poor generalization

### 4.2 L₂ Regularization (Weight Decay)

The simplest solution — add an L₂ penalty to the objective function:

$$
\min_{\theta,W,W^*,b,c} \frac{1}{m}\sum_{i=1}^m \sum_{j=1}^n (\hat{x}_{ij}-x_{ij})^2 + \lambda\|\theta\|^2
$$

**Implementation:** Very easy — just adds a term **λW** to the gradient ∂L(θ)/∂W (and similarly for other parameters).

### 4.3 Weight Tying

Another regularization trick — **tie the weights** of the encoder and decoder:

$$W^* = W^T$$

This effectively **reduces the capacity** of the autoencoder and acts as a **regularizer** by constraining the decoder to use the transpose of the encoder weights.

---

## 5. Denoising Autoencoders

### 5.1 Core Idea

A denoising autoencoder **corrupts the input** data using a probabilistic process **before** feeding it to the network, while the objective remains to reconstruct the **original (uncorrupted)** input.

### 5.2 Corruption Process

**Masking noise (most common):**

$$
\begin{aligned}
P(\tilde{x}_{ij} = 0 \mid x_{ij}) &= q \\
P(\tilde{x}_{ij} = x_{ij} \mid x_{ij}) &= 1-q
\end{aligned}
$$

**Gaussian noise (alternative):**
$$\tilde{x}_{ij} = x_{ij} + \mathcal{N}(0,1)$$

### 5.3 Objective Function

$$
\mathop{\arg\min}_{\theta}\; \frac{1}{m}\sum_{i=1}^m \sum_{j=1}^n (\hat{x}_{ij}-x_{ij})^2
$$

> Note: x̂ᵢⱼ is reconstructed from the **corrupted** x̃ᵢ, but the loss is computed against the **original** xᵢ.

### 5.4 Why Denoising Works

- It **no longer makes sense** for the model to copy the corrupted x̃ᵢ into h(x̃ᵢ) and then into x̂ᵢ — the objective function will **not be minimized** by doing so
- Instead, the model must learn to **reconstruct corrupted inputs correctly** by relying on **interactions between input elements**
- The model must **capture the true characteristics** of the data to undo the corruption

### 5.5 Visualization & Filter Analysis

Each hidden neuron can be viewed as a **filter** that gets maximally activated for certain input configurations:

$$h_1 = \sigma(W_1^T x_i)$$

The input $x_i$ that maximally activates neuron 1 (subject to $\|x_i\| = 1$) is:

$$x_i = \frac{W_1}{\sqrt{W_1^T W_1}}$$

**Comparing autoencoders using filter visualization (MNIST):**

| Autoencoder | Observation |
|-------------|------------|
| **Vanilla AE** (no noise) | Does **not** learn many meaningful patterns |
| **Denoising AE** (q = 0.25) | Hidden neurons act like **pen-stroke detectors** |
| **Denoising AE** (q = 0.5) | Filters become **wider** — neuron relies on more adjacent pixels to feel confident about a stroke |

**Key findings:**
- Denoising AE neurons behave like **edge detectors**
- As noise increases, filters become more spatially extended
- PCA does **not** produce such meaningful edge detectors
- Weight decay alone also does not produce filters as meaningful as denoising

### 5.6 Practical Application: MNIST Feature Learning

| Approach | Description |
|----------|-------------|
| **Basic approach** | Use raw 784-dimensional pixel data (28×28) directly as input features to a classifier |
| **AE approach (Step 1)** | Train an autoencoder to learn important characteristics → hidden representation h ∈ ℝᵈ (where d ≪ 784) |
| **AE approach (Step 2)** | Train a classifier on top of the learned hidden representation h |

---

## 6. Sparse Autoencoders

### 6.1 Concept

A **sparse autoencoder** tries to ensure that each hidden neuron is **inactive most of the time**.

- A hidden neuron with sigmoid activation has values between 0 and 1
- **Activated** = output close to 1; **Not activated** = output close to 0
- Sparsity means encouraging neurons to remain near 0 on average

### 6.2 Average Activation

The **average activation** of neuron l across all m training examples:

$$
\hat{\rho}_l = \frac{1}{m}\sum_{i=1}^{m} h(x_i)_l
$$

If neuron l is sparse (mostly inactive), then **ρ̂ₗ → 0**.

### 6.3 Sparsity Constraint (KL Divergence)

A **sparsity parameter ρ** (typically very close to 0, e.g., 0.005) is used, and we enforce the constraint **ρ̂ₗ = ρ** by adding the following penalty to the loss:

$$
\Omega(\theta) = \sum_{l=1}^k \left[\rho\log\frac{\rho}{\hat{\rho}_l} + (1-\rho)\log\frac{1-\rho}{1-\hat{\rho}_l}\right]
$$

> This is the **KL divergence** between two Bernoulli distributions with parameters ρ and ρ̂ₗ respectively.

**Minimum:** The function reaches its **minimum value when ρ̂ₗ = ρ** (exactly as desired).

### 6.4 Combined Objective

$$\hat{L}(\theta) = L(\theta) + \Omega(\theta)$$

Where L(θ) is the squared error loss or cross-entropy loss, and Ω(θ) is the sparsity constraint.

### 6.5 Gradient Computation

**Expanding Ω(θ):**

$$
\Omega(\theta) = \sum_{l=1}^k \left[\rho\ln\rho - \rho\ln\hat{\rho}_l + (1-\rho)\ln(1-\rho) - (1-\rho)\ln(1-\hat{\rho}_l)\right]
$$

**By chain rule:**

$$
\frac{\partial\Omega(\theta)}{\partial W} = \frac{\partial\Omega(\theta)}{\partial\hat{\rho}} \cdot \frac{\partial\hat{\rho}}{\partial W}
$$

**For each neuron l ∈ {1, ..., k}:**

$$
\frac{\partial\Omega(\theta)}{\partial\hat{\rho}_l} = -\frac{\rho}{\hat{\rho}_l} + \frac{1-\rho}{1-\hat{\rho}_l}
$$

**Derivative of ρ̂ₗ w.r.t. a single weight Wⱼₗ:**

$$
\frac{\partial\hat{\rho}_l}{\partial W_{jl}} = \frac{1}{m}\sum_{i=1}^m g'(W_{\cdot,l}^T x_i + b_l)\cdot x_{ij}
$$

**In matrix notation:**

$$
\frac{\partial\hat{\rho}_l}{\partial W} = x_i \cdot (g'(W^T x_i + b))^T
$$

**Final gradient:**

$$
\frac{\partial\hat{L}(\theta)}{\partial W} = \frac{\partial L(\theta)}{\partial W} + \frac{\partial\Omega(\theta)}{\partial W}
$$

We already know how to calculate both terms on the R.H.S.

---

## 7. Contractive Autoencoders

### 7.1 Core Idea

A contractive autoencoder also tries to prevent an overcomplete autoencoder from learning the identity function. It does so by adding a **Jacobian-based** regularization term.

### 7.2 Regularization Term

$$
\Omega(\theta) = \|J_x(h)\|_F^2
$$

Where $J_x(h)$ is the **Jacobian matrix** of the encoder:

$$
J_x(h) = \begin{pmatrix}
\partial h_1/\partial x_1 & \cdots & \partial h_1/\partial x_n \\
\vdots & \ddots & \vdots \\
\partial h_k/\partial x_1 & \cdots & \partial h_k/\partial x_n
\end{pmatrix}
$$

- If input has **n** dimensions and hidden layer has **k** dimensions → Jacobian is **k × n**
- Entry (l, j) captures the **variation in the lᵗʰ hidden neuron output** with a **small variation in the jᵗʰ input**

**Frobenius norm of the Jacobian:**

$$
\|J_x(h)\|_F^2 = \sum_{j=1}^n \sum_{l=1}^k \left(\frac{\partial h_l}{\partial x_j}\right)^2
$$

### 7.3 Intuition

**What does ∂h₁/∂x₁ = 0 mean?**
- Hidden neuron 1 is **not very sensitive** to variations in input x₁

**The contradiction:**
- **L(θ)** wants h to **capture variations** in the input (for good reconstruction)
- **Ω(θ)** wants h to **not capture variations** in the data (for insensitivity)

**The resolution — a productive tradeoff:**
- By putting these **two contradicting objectives** against each other, we ensure that h is **sensitive to only the very important variations** as observed in the training data
- Unimportant variations (noise) are suppressed

| Objective | Goal |
|-----------|------|
| **L(θ)** | Capture important variations in data |
| **Ω(θ)** | Do not capture variations in data |
| **Tradeoff** | Capture **only very important** variations in the data |

### 7.4 Geometric Illustration

Consider data with variations along directions u₁ and u₂:

- **u₁:** High variance, important direction → neuron should be **sensitive** to this
- **u₂:** Low variance, likely noise → neuron should be **insensitive** to this

By balancing good reconstruction (L) and low sensitivity (Ω), the contractive autoencoder learns to focus on directions of genuine variation and ignore noise — reminiscent of **PCA** selecting high-variance principal components.

---

## 8. Summary of Autoencoder Variants

| Variant | Regularizer $\Omega(\theta)$ | Key Idea |
|---------|-------------------|----------|
| **Vanilla** (undercomplete) | None ($\dim(h) < \dim(x)$ acts as implicit regularizer) | Bottleneck forces compression |
| **Weight Decay** | $\lambda\|\theta\|^2$ | Penalize large weights |
| **Weight Tying** | $W^* = W^T$ (structural constraint) | Reduce capacity |
| **Denoising** | Corrupt input, reconstruct original | Learn to denoise; forces learning of data structure |
| **Sparse** | $\sum_l\left[\rho\log\tfrac{\rho}{\hat\rho_l} + (1-\rho)\log\tfrac{1-\rho}{1-\hat\rho_l}\right]$ | KL divergence forces $\hat\rho_l \to \rho \approx 0$ |
| **Contractive** | $\sum_j\sum_l(\partial h_l/\partial x_j)^2$ | Penalize Jacobian; insensitive to unimportant input variations |

---

## Quick Revision Checklist

- [ ] Autoencoder: encoder $h = g(Wx + b)$, decoder $\hat{x} = f(W^*h + c)$, trained to minimize reconstruction loss
- [ ] Undercomplete ($\dim h < \dim x$) vs overcomplete ($\dim h \geq \dim x$) — identity copy problem
- [ ] Binary inputs $\to$ sigmoid decoder + cross-entropy loss; real inputs $\to$ linear decoder + MSE loss
- [ ] Linear autoencoder $\equiv$ PCA when: linear encoder, linear decoder, squared error, normalized inputs
- [ ] Proof: encoder $W = V_{\cdot,\leq k}$ from SVD; eigenvectors of $X^TX$ = PCA projection matrix $P$
- [ ] Regularization: L₂ weight decay (adds $\lambda W$ to gradient), weight tying ($W^* = W^T$)
- [ ] Denoising AE: corrupt input with masking noise ($P(\tilde{x}=0|x) = q$) or Gaussian noise, reconstruct original
- [ ] Denoising prevents identity copying; forces learning of data structure; produces pen-stroke/edge detector filters
- [ ] Sparse AE: average activation $\hat\rho_l = (1/m)\sum h(x_i)_l$; KL divergence penalty enforces $\hat\rho_l = \rho \approx 0.005$
- [ ] Sparse AE gradient: $\partial\Omega/\partial\hat\rho_l = -\rho/\hat\rho_l + (1-\rho)/(1-\hat\rho_l)$
- [ ] Contractive AE: $\Omega = \|J_x(h)\|_F^2$; penalizes sensitivity of $h$ to input variations
- [ ] Contractive tradeoff: $L(\theta)$ wants sensitivity, $\Omega(\theta)$ wants insensitivity $\to$ captures only important variations
