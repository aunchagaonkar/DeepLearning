# Module IV: Regularization

> **Exam Notes** — CS7015 Deep Learning (Lecture 8)

---

## 1. Bias and Variance

### 1.1 Setup

Consider fitting a curve through data drawn from a true (unknown) function $f(x)$:

- **Simple model:** $\hat{y} = \hat{f}(x) = w_1x + w_0$ (degree 1 polynomial)
- **Complex model:** $\hat{y} = \hat{f}(x) = \sum_{i=1}^{25} w_ix^i + w_0$ (degree 25 polynomial)

We train multiple models on different samples of the training data and observe:

| Property | Simple Model | Complex Model |
|----------|-------------|---------------|
| Agreement across samples | Models are very similar (low spread) | Models differ greatly from each other |
| Closeness to true $f(x)$ | Very far from true curve (underfitting) | Close to true curve on average |
| Bias | **High** | **Low** |
| Variance | **Low** | **High** |

### 1.2 Formal Definitions

Let $f(x)$ be the true model and $\hat{f}(x)$ be our estimate:

**Bias:**
$$
\text{Bias}(\hat{f}(x)) = E[\hat{f}(x)] - f(x)
$$
- $E[\hat{f}(x)]$ is the average value of the model across different training samples
- High bias $\rightarrow$ the average model is far from the true function (underfitting)

**Variance:**
$$
\text{Variance}(\hat{f}(x)) = E[(\hat{f}(x) - E[\hat{f}(x)])^2]
$$
- Measures how much the different $\hat{f}(x)$'s (trained on different samples) differ from each other
- High variance $\rightarrow$ models trained on different samples vary greatly

### 1.3 Bias-Variance Decomposition of Error

For a new unseen point $(x, y)$:

$$
E[(y - \hat{f}(x))^2] = \text{Bias}^2 + \text{Variance} + \sigma^2
$$

Where **$\sigma^2$** is the **irreducible error** (noise in the data).

> **Key insight:** Both bias and variance contribute to the mean square error. There is always a **trade-off** — simple models have high bias/low variance, complex models have low bias/high variance. The optimal model complexity is at the **sweet spot** that minimizes the total error.

### 1.4 Train Error vs. Test Error

Let there be $n$ training points and $m$ test (validation) points:

$$
\text{train\_err} = \frac{1}{n} \sum_{i=1}^n (y_i - \hat{f}(x_i))^2
$$
$$
\text{test\_err} = \frac{1}{m} \sum_{i=n+1}^{n+m} (y_i - \hat{f}(x_i))^2
$$

**Using test observations to estimate true error:**
- Test data was NOT used to estimate $\hat{f}(x)$, so $\epsilon_i \perp (\hat{f}(x_i) - f(x_i))$
- The covariance term vanishes $\rightarrow$ **true error $\approx$ empirical test error + small constant**
- Hence we should **always use a validation set** (independent of training set) to estimate error

**Using training observations to estimate true error:**
- Training data WAS used to estimate $\hat{f}(x)$, so $\epsilon_i$ is NOT independent of $\hat{f}(x_i)$
- The covariance term does NOT vanish
- **Train error is smaller than true error** (overly optimistic)

### 1.5 True Error and Model Complexity

Using Stein's Lemma:

$$
\frac{1}{n} \sum_i \epsilon_i(\hat{f}(x_i) - f(x_i)) = \frac{\sigma^2}{n} \sum_i \frac{\partial \hat{f}(x_i)}{\partial y_i}
$$

- **$\frac{\partial \hat{f}(x_i)}{\partial y_i}$** is high when a small change in observation causes a large change in estimation $\rightarrow$ this is characteristic of **complex models**
- A complex model is more sensitive to minor changes in data

Therefore:
$$
\text{true error} = \text{empirical train error} + \text{small constant} + \Omega(\text{model complexity})
$$

**Regularization principle:** Instead of minimizing just $L_{train}(\theta)$, minimize:
$$
L(\theta) = L_{train}(\theta) + \Omega(\theta)
$$

Where $\Omega(\theta)$ is high for complex models and small for simple models. This is the **basis for all regularization methods**.

---

## 2. L2 Regularization

### 2.1 Formulation

The regularized objective:
$$
\tilde{L}(w) = L(w) + \frac{\alpha}{2} \|w\|^2
$$

**Gradient:**
$$
\nabla \tilde{L}(w) = \nabla L(w) + \alpha w
$$

**Update rule (SGD):**
$$
w_{t+1} = w_t - \eta \nabla L(w_t) - \eta \alpha w_t \\
       = (1 - \eta \alpha)w_t - \eta \nabla L(w_t)
$$

> **Note:** The term $(1 - \eta \alpha)$ shrinks the weight before applying the gradient update. This is why L2 regularization is also called **weight decay**.

### 2.2 Geometric Interpretation (Eigenvalue Analysis)

Let w* be the optimal solution **without** regularization (∇L(w*) = 0).

**Taylor series approximation** around $w^*$:
$$
L(w) \approx L(w^*) + \frac{1}{2}(w - w^*)^T H (w - w^*) \quad [\text{since } \nabla L(w^*) = 0]
$$
$$
\nabla L(w) = H(w - w^*)
$$

Where $H$ is the **Hessian matrix**.

**Gradient of regularized loss:**
$$
\nabla \tilde{L}(w) = H(w - w^*) + \alpha w
$$

**Setting $\nabla \tilde{L}(\tilde{w}) = 0$** to find the regularized optimum $\tilde{w}$:
$$
H(\tilde{w} - w^*) + \alpha \tilde{w} = 0 \\
(H + \alpha I)\tilde{w} = Hw^* \\
\tilde{w} = (H + \alpha I)^{-1}Hw^*
$$

**Using eigendecomposition** $H = Q\Lambda Q^T$ ($H$ symmetric PSD):
$$
\tilde{w} = Q(\Lambda + \alpha I)^{-1}\Lambda Q^T w^* \\
  = QDQ^T w^*
$$

Where **$D = (\Lambda + \alpha I)^{-1}\Lambda$** is a diagonal matrix with entries:

$$
D_{ii} = \frac{\lambda_i}{\lambda_i + \alpha}
$$

### 2.3 Key Observations

| Condition | Scaling Factor $D_{ii}$ | Effect |
|-----------|----------------------|--------|
| $\lambda_i \gg \alpha$ | $\frac{\lambda_i}{\lambda_i + \alpha} \approx \textbf{1}$ | Direction **retained** (important feature) |
| $\lambda_i \ll \alpha$ | $\frac{\lambda_i}{\lambda_i + \alpha} \approx \textbf{0}$ | Direction **shrunk** (unimportant feature) |

**What happens geometrically:**
1. $w^*$ gets **rotated** by $Q^T$
2. Each component gets **scaled** by $\frac{\lambda_i}{\lambda_i + \alpha}$
3. Result is **rotated back** by $Q$

> **Summary:** L2 regularization **shrinks all weight components** but shrinks less important directions (smaller eigenvalues) more aggressively. Only **significant directions** (larger eigenvalues) are retained.

**Effective number of parameters:**
$$
\text{Effective parameters} = \sum_{i=1}^n \frac{\lambda_i}{\lambda_i + \alpha} < n
$$

This is always less than the total number of parameters n, confirming that regularization reduces model complexity.

**Special case:** If α → 0, then w̃ → w* (no regularization).

---

## 3. Dataset Augmentation

### 3.1 Concept

- Exploit the fact that certain **transformations** to input data do not change the label
- Generate new training examples from existing ones using domain knowledge
- **More data = better learning** (reduces overfitting)

### 3.2 Techniques (Image Classification)

| Transformation | Description |
|---------------|-------------|
| **Rotation** | Rotate image by various angles (e.g., 20°, 65°) |
| **Translation** | Shift image horizontally or vertically |
| **Flipping** | Mirror the image |
| **Pixel modification** | Change some pixels randomly |
| **Blurring** | Apply blur filters |
| **Scaling** | Resize the image |

### 3.3 Applicability

- Works very well for **image classification / object recognition** tasks
- Also shown to work well for **speech**
- For some tasks, it may **not be clear** how to generate such augmented data

---

## 4. Parameter Sharing and Tying

### 4.1 Parameter Sharing

- **Same filter/weight matrix** applied at different positions or to different inputs
- Used extensively in **Convolutional Neural Networks (CNNs)**
- The same filter slides across different positions of the image
- Reduces the number of free parameters → acts as regularization

### 4.2 Parameter Tying

- Typically used in **Autoencoders**
- The **encoder** weights W and **decoder** weights W* are tied: **W* = Wᵀ**
- This effectively reduces the capacity of the autoencoder
- Acts as a form of regularization by constraining the model

---

## 5. Injecting Noise at Input

### 5.1 Concept

- Add **Gaussian noise** to the input before feeding it to the network
- Can be viewed as a form of **data augmentation**
- For a simple input-output neural network, adding Gaussian noise to the input is **equivalent to L2 regularization (weight decay)**

### 5.2 Mathematical Proof (Equivalence to L2)

For a linear model $\hat{y} = \sum_i w_i x_i$, with corrupted inputs $\tilde{x}_i = x_i + \epsilon_i$ where $\epsilon \sim N(0, \sigma^2)$:

$$
E[(y - \tilde{y})^2] \quad \text{where} \quad \tilde{y} = \hat{y} + \sum_i w_i \epsilon_i
$$

Expanding:
$$
= E[(\hat{y} - y + \sum w_i \epsilon_i)^2]
$$

$$
= E[(\hat{y} - y)^2] + 2E[(\hat{y} - y) \cdot \sum w_i \epsilon_i] + E[(\sum w_i \epsilon_i)^2]
$$

Since $\epsilon_i$ is independent of $(\hat{y} - y)$ and $\epsilon_i \perp \epsilon_j$:
$$
= E[(\hat{y} - y)^2] + 0 + E[\sum w_i^2 \epsilon_i^2]
$$

$$
= E[(\hat{y} - y)^2] + \sigma^2 \sum w_i^2
$$

> **Result:** Minimizing the expected loss with noisy inputs is equivalent to minimizing the original loss **plus an L2 penalty** $\sigma^2 \|w\|^2$. The noise variance $\sigma^2$ plays the role of the regularization coefficient $\alpha$.

---

## 6. Adding Noise to Outputs (Label Smoothing)

### 6.1 Hard Targets vs. Soft Targets

**Hard targets (standard one-hot encoding):**
$$
p = \{0, 0, 1, 0, 0, 0, 0, 0, 0, 0\} \quad (\text{for class "2"})
$$

**Soft targets (label smoothing):**
$$
p = \left\{\frac{\epsilon}{9}, \frac{\epsilon}{9}, 1-\epsilon, \frac{\epsilon}{9}, \frac{\epsilon}{9}, \frac{\epsilon}{9}, \frac{\epsilon}{9}, \frac{\epsilon}{9}, \frac{\epsilon}{9}, \frac{\epsilon}{9}\right\}
$$
Where $\epsilon$ is a small positive constant.

### 6.2 Intuition

- **Do not trust the true labels** — they may be noisy
- Instead, use **soft targets** that distribute a small probability to incorrect classes
- The cross-entropy loss becomes:
$$
\text{minimize: } -\sum_i p_i \log(q_i)
$$
- This prevents the model from becoming **overconfident** in its predictions
- Acts as a regularizer by penalizing extreme predictions

---

## 7. Early Stopping

### 7.1 Algorithm

$$
\begin{aligned}
&\text{1. Track the validation error during training} \\
&\text{2. Set a patience parameter } p \\
&\text{3. If at step } k \text{ there was no improvement in validation error} \\
&\quad \text{in the previous } p \text{ steps} \to \text{stop training} \\
&\text{4. Return the model stored at step } k-p
\end{aligned}
$$

**Key idea:** Stop training **before** it drives the training error to 0 and blows up the validation error.

### 7.2 Properties

- **Very effective** and the most widely used form of regularization
- Can be used **in combination** with other regularizers (e.g., L2)
- Simple to implement — just needs a validation set

### 7.3 How Early Stopping Acts as a Regularizer

**Intuitive explanation:**

Recall the SGD update rule:
$$w_{t+1} = w_0 - \eta\sum_{i=1}^t \nabla w_i$$

Let $\tau$ be the maximum value of $|\nabla w_i|$, then:
$$|w_{t+1} - w_0| \leq \eta\, t\, |\tau|$$

- **t controls how far w can go** from the initial w₀
- In other words, t controls the **space of exploration**
- Stopping early limits the parameter space the model can explore

### 7.4 Mathematical Analysis (Equivalence to L2)

Using Taylor series approximation and eigendecomposition:

**SGD update (starting from w₀ = 0):**
$$w_t = Q\bigl[I - (I - \eta\Lambda)^t\bigr]Q^T w^*$$

**Compare with L2 regularization:**
$$\tilde{w} = Q\bigl[I - (\Lambda + \alpha I)^{-1}\alpha\bigr]Q^T w^*$$

**These are equivalent when:**
$$(I - \eta\Lambda)^t = (\Lambda + \alpha I)^{-1}\alpha$$

> **Key insight:** Early stopping with t steps is mathematically equivalent to L2 regularization with a specific value of α. Both effectively **shrink parameters** corresponding to less important directions.

### 7.5 Intuition for Why Early Stopping = Weight Decay

- If a parameter w corresponds to a dimension **important** for L(θ), then ∂L(θ)/∂w will be **large** → the parameter gets updated significantly even in t steps
- If a parameter is **not important** (∂L(θ)/∂w is small), its updates will be small and it **cannot grow large** in t steps
- Early stopping thus **effectively shrinks parameters** corresponding to less important directions — same behavior as weight decay

---

## 8. Ensemble Methods

### 8.1 Basic Idea

Combine the output of **different models** to reduce generalization error.

**Types of ensembles:**

| Approach | Description |
|----------|-------------|
| **Different classifiers** | Combine LR, SVM, Naive Bayes, etc. |
| **Same classifier, different hyperparameters** | Train same model with varied settings |
| **Same classifier, different features** | Use different feature subsets |
| **Same classifier, different data samples** | Bagging approach |

### 8.2 Bagging (Bootstrap Aggregating)

**Procedure:**
1. From a given dataset, construct multiple training sets by **sampling with replacement**: T₁, T₂, ..., Tₖ
2. Train the iᵗʰ instance of the classifier using training set Tᵢ
3. At test time, combine predictions (e.g., majority vote or averaging)

### 8.3 Mathematical Analysis of Bagging

The average prediction error: $\bar{\varepsilon} = \frac{1}{k}\sum_i \varepsilon_i$

**Expected mean squared error:**
$$\text{mse} = E\!\left[\left(\frac{1}{k}\sum_i \varepsilon_i\right)^{\!2}\right]$$

Let:
- **$V = E[\varepsilon_i^2]$** — Variance of individual model errors
- **$C = E[\varepsilon_i \varepsilon_j]$** — Covariance between model errors ($i \neq j$)

$$
\text{mse} = \frac{1}{k^2}(kV + k(k-1)C) = \frac{V}{k} + \frac{k-1}{k}\cdot C
$$

### 8.4 When Does Bagging Work?

| Condition | C value | MSE | Interpretation |
|-----------|---------|-----|----------------|
| Errors perfectly **correlated** | C = V | mse = **V** | Bagging does NOT help; ensemble is as bad as individual models |
| Errors **independent/uncorrelated** | C = 0 | mse = **V/k** | Bagging helps greatly; error reduces by factor k |

> **Key result:** On average, the ensemble will **perform at least as well** as its individual members. The more independent (uncorrelated) the errors, the greater the benefit.

---

## 9. Dropout

### 9.1 Motivation

- Model averaging (bagging/ensemble) **always helps** generalization
- But training several large neural networks for an ensemble is **prohibitively expensive**
- Two expensive options:
  - **Option 1:** Train several networks with different architectures
  - **Option 2:** Train multiple instances of the same network on different training samples
- Even if we manage training, combining several models **at test time is infeasible** for real-time applications

> **Dropout** addresses both problems — trains exponentially many networks efficiently and provides an efficient way to combine them.

### 9.2 How Dropout Works

**During training:**
- **Dropout** = temporarily removing a node and all its incoming/outgoing connections
- Each node is **retained** with a fixed probability:
  - **p = 0.5** for hidden nodes
  - **p = 0.8** for visible (input) nodes
- This produces a **thinned network** for each training instance

**Number of possible thinned networks:** Given n nodes → **2ⁿ** possible thinned networks

### 9.3 Training Procedure

1. Initialize all parameters of the full network
2. For each training instance (or mini-batch):
   - Apply dropout → sample a **thinned network**
   - Compute the loss and backpropagate
   - Update **only the active weights** (those in the thinned network)
3. Repeat for next instance with a **different** thinned network

**Key trick: Weight sharing** — all thinned networks **share** the same weight parameters

- Each thinned network gets trained **rarely** (or even never individually)
- But parameter sharing ensures no model has untrained or poorly trained parameters
- If a weight was active for both training instances → receives two updates
- If active for only one → receives one update

### 9.4 Test Time

- **Impossible** to aggregate outputs of 2ⁿ thinned networks
- Instead: use the **full neural network** and **scale** the output of each node by the fraction of times it was on during training

```
Test-time weights = p · w    (where p is the retention probability)
```

| Phase | Network | Weight |
|-------|---------|--------|
| **Training** | Present with probability $p$ | $w_1, w_2, w_3, w_4$ |
| **Testing** | Always present | $pw_1, pw_2, pw_3, pw_4$ |

### 9.5 Why Dropout Works

**Prevents co-adaptation:**
- Hidden units **cannot rely** too much on other units (they may get dropped anytime)
- Each hidden unit must learn to be **more robust** to random dropouts

**Encourages redundancy:**
- Example: Suppose hidden unit hᵢ learns to detect a face by firing on detecting a nose
- Dropping hᵢ corresponds to **erasing** the information that a nose exists
- The model must then:
  - Learn **another hidden unit** that redundantly encodes the nose, OR
  - Learn to detect the face using **other features** (eyes, ears, etc.)

**Connection to ensemble methods:**
- Dropout effectively **applies masking noise** to hidden units
- Each different dropout mask produces a different thinned network
- Training with dropout ≈ training an exponential number of networks with shared weights
- Test-time scaling ≈ geometric mean of all thinned network predictions

---

## Quick Revision Checklist

- [ ] **Bias-Variance Tradeoff:** Simple model = high bias, low variance; Complex model = low bias, high variance; True error $= \text{Bias}^2 + \text{Variance} + \sigma^2$
- [ ] **Train error is optimistic:** Does not give true picture of error ($\varepsilon_i$ not independent of $\hat{f}(x_i)$)
- [ ] **Regularization principle:** Minimize $L_{\text{train}}(\theta) + \Omega(\theta)$ where $\Omega$ penalizes complexity
- [ ] **L2 Regularization:** $\tilde{L}(w) = L(w) + (\alpha/2)\|w\|^2$; update: $w \leftarrow (1-\eta\alpha)w - \eta\nabla L$; shrinks less important directions (small eigenvalues) more
- [ ] **Effective parameters:** $\sum \lambda_i/(\lambda_i + \alpha) < n$ — always fewer than total parameters
- [ ] **Dataset augmentation:** Transform inputs without changing labels (rotation, translation, flipping, etc.)
- [ ] **Parameter sharing:** Same weights at different positions (CNNs); **Tying:** $W^* = W^T$ (autoencoders)
- [ ] **Noise injection at input:** Gaussian noise $\varepsilon \sim \mathcal{N}(0,\sigma^2)$ added to inputs is equivalent to L2 penalty $\sigma^2\sum w_i^2$
- [ ] **Label smoothing:** Replace hard targets with soft targets to prevent overconfident predictions
- [ ] **Early stopping:** Stop when validation error hasn't improved for $p$ steps; mathematically equivalent to L2 regularization; controls exploration space via $t$
- [ ] **Ensemble/Bagging:** $\text{mse} = V/k + ((k-1)/k)\cdot C$; works best when errors are uncorrelated ($C \to 0$)
- [ ] **Dropout:** Retain each node with probability $p$ (0.5 hidden, 0.8 visible); at test time scale weights by $p$; prevents co-adaptation; creates redundancy; equivalent to training $2^n$ networks with shared weights
