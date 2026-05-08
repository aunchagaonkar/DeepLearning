# Module II: FeedForward Neural Networks - Question Bank

## Q1. Consider an L-layered Feed Forward Neural Network in which all the layers (except output layer) contain (n) neurons each and the output layer contains (k) neurons.
**1. In such a network, what is the dimension of the pre-activation for each hidden layer neuron?**
**2. For the neural network described above, what is the total number of learnable parameters? Note: Bias factor has to be considered.**

**Answer:**

**1. Dimension of pre-activation:**
Let the hidden layers be $h_1, h_2, \dots, h_{L-1}$. Each has $n$ neurons.
The pre-activation $a_i$ at layer $i$ is calculated as $a_i = W_i h_{i-1} + b_i$.
Since the layer has $n$ neurons, the pre-activation vector $a_i$ must have a dimension of $(n \times 1)$.

**2. Total number of learnable parameters:**
Let the input layer have $n$ neurons as well (for simplicity, assuming it matches hidden layers as stated "all layers except output").
Learnable parameters = Weights + Biases.
* **Hidden Layers (Layer 1 to L-1):**
  There are $L-1$ sets of weights. Each weight matrix connects $n$ inputs to $n$ outputs, so size is $(n \times n)$.
  Weights for one hidden layer = $n^2$. Bias for one hidden layer = $n$.
  Total parameters for hidden layers = $(L-1) \times (n^2 + n)$.
* **Output Layer (Layer L):**
  Connects $n$ neurons to $k$ output neurons. Weight matrix size is $(k \times n)$.
  Weights = $n \times k$. Bias = $k$.
  Total parameters for output layer = $nk + k$.
* **Total Parameters:** $(L-1)(n^2 + n) + k(n + 1)$

---

## Q2. Critically analyse Gradient Descent Technique.

**Answer:**

Standard Gradient Descent (Vanilla GD) is an optimization algorithm used to minimize the cost function by iteratively moving in the direction of steepest descent.
Update rule: $w_{t+1} = w_t - \eta \nabla J(w_t)$

**Advantages:**
1. **Guaranteed Convergence (for convex):** If the error surface is strictly convex and learning rate is small enough, GD is mathematically guaranteed to find the global minimum.
2. **Simple to Implement:** The update rules are straightforward and require minimal computational overhead per parameter update.

**Limitations & Critical Analysis:**
1. **Local Minima & Saddle Points:** In highly non-convex surfaces (common in deep learning), GD can easily get stuck in local minima or saddle points where gradients are zero.
2. **Symmetrical Weight Initialization Problem:** If weights are initialized identically, all neurons learn the same features, and the gradient is identical for all.
3. **Choosing Learning Rate:** A learning rate too high causes divergence, and too low causes agonizingly slow convergence.
4. **Computational Cost:** Vanilla GD computes the gradient over the *entire dataset* before a single update. This is computationally prohibitive for large datasets.

---

## Q3. Give the logic behind Adam algorithm.

**Answer:**

Adam (Adaptive Moment Estimation) combines the best properties of **RMSProp** and **Momentum**.
Logic:
1. **Momentum Component (First Moment):** Like Momentum, Adam keeps track of an exponentially decaying average of past gradients ($m_t$). This helps the algorithm build velocity in directions with consistent gradients and dampens oscillations.
2. **RMSProp Component (Second Moment):** Like RMSProp, Adam keeps track of an exponentially decaying average of past *squared* gradients ($v_t$). This scales the learning rate per parameter. Parameters that receive large gradients have their learning rates reduced, and vice-versa, preventing explosive jumps.
3. **Bias Correction:** Adam includes a bias correction mechanism for $m_t$ and $v_t$ because they are initialized as zero vectors, which causes them to be biased toward zero in the initial time steps.

```mermaid
graph TD
    A[Compute Gradient g_t] --> B[Update 1st Moment: m_t = beta1*m_{t-1} + (1-beta1)g_t]
    A --> C[Update 2nd Moment: v_t = beta2*v_{t-1} + (1-beta2)g_t^2]
    B --> D[Bias Correction: m_hat = m_t / (1 - beta1^t)]
    C --> E[Bias Correction: v_hat = v_t / (1 - beta2^t)]
    D --> F[Update Weights: w = w - lr * m_hat / (sqrt(v_hat) + eps)]
    E --> F
```

---

## Q4. Critically analyse the intuition behind Momentum Based Gradient Descent & Nesterov Accelerated Gradient Descent (NAG) techniques. Why prefer NAG over MGD?

**Answer:**

**Momentum Based Gradient Descent (MGD):**
* **Intuition:** MGD simulates a ball rolling down a hill. Instead of strictly following the current gradient, it maintains a 'velocity' of past gradients.
* **Advantage:** If consecutive gradients point in the same direction, momentum builds up, accelerating convergence across flat regions (plateaus). It also dampens oscillations in ravines.

**Nesterov Accelerated Gradient (NAG):**
* **Intuition:** NAG is a 'look-ahead' version of MGD. Instead of computing the gradient at the current position, NAG computes the gradient at the *projected future position* (where the momentum would take us).
* **Why prefer NAG over MGD?** MGD is blind; it builds up speed and can easily overshoot the minimum, requiring several oscillating corrections. NAG looks ahead; if the slope at the projected point starts going upwards, the gradient will point backward, effectively acting as a 'brake' to slow down the momentum before it overshoots. Therefore, NAG provides faster and more stable convergence with fewer oscillations than MGD.

---

## Q5. Give the equations involved in Momentum Based Gradient Descent.

**Answer:**

In Momentum Based GD, we update a velocity vector $v_t$ and use it to update parameters.
Let $\eta$ be the learning rate, $\gamma$ be the momentum term (usually 0.9), and $\nabla J(w_t)$ be the gradient.

1.  **Velocity Update:**
    $v_t = \gamma v_{t-1} + \eta \nabla J(w_t)$
2.  **Parameter Update:**
    $w_{t+1} = w_t - v_t$

*(Alternative formulation common in deep learning frameworks)*:
1.  $v_t = \gamma v_{t-1} + (1-\gamma) \nabla J(w_t)$
2.  $w_{t+1} = w_t - \eta v_t$

---

## Q6. Give logic behind using Batch SGD.

**Answer:**

Vanilla Gradient Descent computes gradients using the *entire* dataset (Batch GD), which is extremely slow and memory-intensive. Stochastic Gradient Descent (SGD) uses *one* example per update, which is fast but very noisy, leading to erratic convergence.

**Mini-Batch SGD** strikes a balance.
*   **Logic:** It computes the gradient over a small, random subset (mini-batch) of size $k$ (e.g., 32, 64, 128) from the training data.
*   **Benefits:**
    1.  **Vectorization:** Mini-batches can be heavily parallelized and optimized on GPUs using matrix multiplication.
    2.  **Smoother Convergence:** Averaging gradients over a mini-batch provides a much less noisy estimate of the true gradient than SGD.
    3.  **Memory Efficiency:** It easily fits into GPU VRAM compared to Full Batch GD.

---

## Q7. How are the oscillations in MGD at the end different from oscillations obtained when learning rate is high?

**Answer:**

*   **Oscillations due to High Learning Rate:** These oscillations are chaotic and divergent. Because the step size is too large, the algorithm constantly overshoots the minimum and bounces between the walls of the error surface, often causing the error to *increase* (divergence). The vector constantly changes direction wildly.
*   **Oscillations in Momentum GD (MGD) at the end:** These are convergent oscillations. Because momentum builds up high velocity down the slope, the ball "rolls" past the minimum, and then rolls back. The oscillations are rhythmic, and the amplitude strictly decays over time due to the friction/momentum decay factor ($\gamma$). The model eventually settles at the minimum.
