---
title: TITLE
author:
- Yoav Ram^[Department of Biology, Stanford University, Stanford, CA 94305-5020, yoav@yoavram.com]
- Lee Altenberg^[Information and Computer Sciences, University of Hawaii atM¯anoa, Honolulu, HI 96822, altenber@hawaii.edu]
- Marcus W. Feldman^[Corresponding author; Department of Biology, Stanford University, Stanford, CA 94305-5020, mfeldman@stanford.edu]
year: 2017
abstract: |
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
chapters: True
chaptersDepth: 1
chapDelim: ""
link-citations: true
header-includes:
    - \usepackage[switch]{lineno}
    - \linenumbers
---

**Lemma.** _Caswell's formula [@Caswell1978]:
Let _A_ be a matrix with eigenvalue $\lambda$ and left and right eigenvectors _u_ and _v_ such that $\sum{v_i}=1$ and $u\tran v = \sum{u_i v_i} = 1$, then the sensitivity of $\lambda$ to changes in any parameter _x_ of the matrix _A_ is
$$
\frac{\partial \lambda}{\partial x} = u\tran \frac{\partial A}{\partial x} v
$$ {#eq:Caswells_formula}
_

**Proof.**
Using the lemma assumptions, $\lambda = \lambda u\tran v = u\tran \lambda v = u\tran A v$ and differentiating both sides we get $\partial \lambda = \partial (u\tran A v)$.
Using the product rule (once in each direction), 
\begin{multline*}
\partial (u\tran A v) = \\
\partial u\tran A v + u\tran \partial A v + u\tran A \partial v = \\
u\tran \partial A v + \partial u\tran \lambda v  + \lambda u\tran \partial v = \\
u\tran \partial A v + \lambda(\partial u\tran v  + u\tran \partial v) = \\
u\tran \partial A v + \lambda \partial(u\tran v).
\end{multline*}

Because $u\tran v = 1$, we have $\partial (u\tran v) = 0$ and 
$\partial \lambda = u\tran \partial A v$.
$\blacksquare$

**Theorem.**
_
Consider the transformation $f \to f'$ defined by
$$
\lambda f' = (I-C+MC)D f
$$ {#eq:model}
where $f$ is a stochastic vector ($\sum_i{f_i} = 1$),
$M$ is a stochastic matrix ($\sum_i {M_{i,j}} = 1$ for any column _j_),
$C$ is a diagonal non-negative matrix with diagonal elements $C_k$,
$D$ is a diagonal non-negative matrix with diagonal elements $D_k$,
$I$ is the identity matrix, and
$\lambda$ is a normalizing factor such that $\sum_i{f'_i}=1$.
Then 
$$
\frac{\partial \lambda^*}{\partial C_k} = 
v_k D_k (u\tran [M]_k - u_k),
$$ {#eq:theorem}
where $\lambda^*$ is the leading eigenvalue of $(I-C+MC)D$, _u_ and _v_ are the corresponding left and right eigenvectors, and $[M]_k$ is the $k$-th column of $M$.
Specifically,
$$
sign \frac{\partial \lambda^*}{\partial C_k} = 
sign (u\tran [M]_k - u_k),
$$ {#eq:theorem_sign}
_

**Proof.**
The equilibrium the transformation @Eq:model is defined by the eigenvalue $\lambda^*$ and right eigenvector _v_:
$$
\lambda^* v = (I-C+MC)D v
$$ {#eq:model_equilibrium}

Let _v_ be the corresponding left eigenvector.
By the _Perron-Frobenius theorem_ [@Otto2007, Appendix A],
$\lambda^*$ is the leading real positive eigenvalue, 
and _u_ and _v_ are both non-negative, 
uniquely defined by $\sum_i{v_i} = 1$ and $\sum_i{u_i v_i} = 1$.

Using _Caswell's formula_ (@Eq:Caswells_formula),
$$
\frac{\partial \lambda^*}{\partial C_k} = 
u\tran \frac{\partial (I-C+MC)D}{\partial C_k} v.
$$

Let $e_k$ and $e\tran_k$ be the column and row vectors with 1 at position _k_ and 0 elsewhere,
$A_k = e_k e\tran_k$ the matrix with 1 at position _(k,k)_ and 0 elsewhere,
and $[M]_k$ the $k$-th column of $M$.

Then,
\begin{multline*}
u\tran \frac{\partial}{\partial C_k}[(I-C+MC)D] v = \\
u\tran (0 - A_k + M A_k)D v = \\
-u_k D_k v_k + v_k D_k u\tran[M]_k = \\
v_k D_k (u\tran[M]_k - u_k),
\end{multline*}

which gives 
$$
\frac{\partial}{\partial C_k} \lambda^* = 
v_k D_k (u\tran[M]_k - u_k). \;\;\; \blacksquare
$$

$\bar{\omega}$ turns out to be the population mean fitness $\sum_i{f_i D_i}$ by expanding $\bar{\omega} \sum_i{f'_i} = 1$.

_v_ is the stationary distribution such that 
$$\bar{\omega} v = (I-C+MC)D v$$
and $u$ is _Fisher's reproductive value_ [@Grafen2006].

$M_{i,j}$ describes the transition from type $j$ to type $i$,
and $u_k$ describes the reproductive value of type $k$.

By the theorem, increasing $C_k$ will increase the leading eigenvalue _iff_ $u\tran[M]k-u_k > 0$. 

Therefore, the derivative of the leading eigenvalue with respect to the increase in the total rate of leaving type $k$
will be positive if the reproductive value of type $k$, $u_k$, is less than the reproductive value expected by leaving type $k$.

# References
