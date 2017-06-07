
Consider a mutation or dispersal model given by:
$$
\omega f' = (I-C+MC)D \cdot f
$$

where:

- $f$ is a stochastic vector
- $M$ is a stochastic matrix
- $C$ is a diagonal non-negative matrix with elements $C_k$
- $D$ is a diagonal non-negative matrix with elements $D_k$
- $I$ is the identity matrix
- $\omega$ is a normalizing factor

We analyze the effect of a modifier that controls $C_k$, the elements on the diagonal of $C$.

We are interested in the sign of the derivative of the leading eigenvalue of the matrix $(I-C+MC)D$ with respect to $C_k$.

It is easy to show that:

$$
\frac{\partial}{\partial C_k} \rho((I-C+MC)D) = 
u^T \frac{\partial}{\partial C_k}[(I-C+MC)D] v
$$

where $u$ and $v$ are the left and right eigenvectors of the leading eigenvalue, which are both non-negative by the Perron-Frobenius theorem, and we set $\sum{v_i} = 1$, $\sum{u_i v_i} = 1$.
$v$ is therefore the stationary distribution such that 
$\omega v = (I-C+MC)D \cdot v$
and $u$ is the reproductive value (Grafen, 2006).

To continue, set 
$$
A(k)_{i,j} = \begin{cases}1, & i=j=k \\ 0, & otherwise\end{cases},
$$ 
and $[M]_k$ is the $k$-th column of $M$:

\begin{multline}
\frac{\partial}{\partial C_k} \rho((I-C+MC)D) = \\
u^T \frac{\partial}{\partial C_k}[(I-C+MC)D] v = \\
u^T (0 - A(k) + M A(k))D v = \\
-u_k D_k v_k + v_k D_k u^T[M]_k = \\
v_k D_k (u^T[M]_k - u_k)
\end{multline}

Therefore, increasing $C_k$ will increase the leading eigenvalue _iff_ $u^T[M]k-u_k > 0$.

$M_{i,j}$ describes the transition from type $j$ to type $i$,
and $u_k$ describes the reproductive value of type $k$.
Therefore, the derivative of the leading eigenvalue with respect to the increase in the total rate of leaving type $k$
will be positive if the reproductive value of type $k$, $u_k$, is less than the reproductive value expected by leaving type $k$.

# References

- Grafen, A. J. Math. Biol. (2006) 53: 15. doi:10.1007/s00285-006-0376-4
