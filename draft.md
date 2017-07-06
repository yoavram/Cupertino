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

# Introduction

According to the _reduction principle_, in populations near equilibrium between constant viability-selection and variation production, modifiers that decrease the rate of variation production will increase in frequency.
The _reduction principle_ was first proposed for modifiers of the recombination rate [@Feldman1972], mutation, and migration or dispersal rates [@Liberman1986a; @Altenberg1987], and these separate principles were recently unified [@Altenberg2009; @Altenberg2017]. 

@Altenberg2017 lay down the assumptions and conditions for the validity of the _unified reduction principle_: effectively infinite population size, constant-viability selection, a population at an equilibrium, and _linear variation_  -- the equal scaling of transition probabilities by the modifier.
The latter can be violated if two variation producing processes interact [@Altenberg2012], or if there are biases in the mutation or migration process, such that ... 

Another violation to the _linear variation_ assumption of _reduction principle_for mutation rates involves a mechanism commoly called _stress-induced mutagenesis_, in which the mutation rate increases in individuals with poor fitness, which is at least partially determined by poor fit between the genotype and the environment.
Indeed, @Ram2012 demonstrated that modifiers that increase the mutation rate of individuals with below average fitness actually _increase_ the population mean fitness, rather than decrease it.
The analysis included an infinite population size and constant-viability selection, such that the only departure from the _reduction principle_ assumptions is due to the differential effect the modifier has on different types.
@Ram2012 stated that their result represents a departure from the _reduction principle_, but did not explain this departure
Moreover, their analysis was limited to low mutation rates as it assumed that the number of mutations per individual per generation is less than one.
These limitations are covered by the analysis presented here.

Here, we present a general model for modifiers that differentialy control the variation production rate, including mutation and migration or dispersal, and show a stronger result, based on optimization of the _reproductive value_ rather then the mean fitness.

# Results

**Lemma.** _Caswell's formula [@Caswell1978]:
Let _A_ be a matrix with eigenvalue $\lambda$ and left and right eigenvectors _u_ and _v_ such that $\sum{v_i}=1$ and $u\tr v = \sum{u_i v_i} = 1$, then the sensitivity of $\lambda$ to changes in any parameter _x_ of the matrix _A_ is
$$
\frac{\partial \lambda}{\partial x} = u\tr \frac{\partial A}{\partial x} v
$$ {#eq:Caswells_formula}
_

**Proof.**
Using the lemma assumptions, $\lambda = \lambda u\tr v = u\tr \lambda v = u\tr A v$ and differentiating both sides we get $\partial \lambda = \partial (u\tr A v)$.
Using the product rule (once in each direction), 
\begin{multline*}
\partial (u\tr A v) = \\
\partial u\tr A v + u\tr \partial A v + u\tr A \partial v = \\
u\tr \partial A v + \partial u\tr \lambda v  + \lambda u\tr \partial v = \\
u\tr \partial A v + \lambda(\partial u\tr v  + u\tr \partial v) = \\
u\tr \partial A v + \lambda \partial(u\tr v).
\end{multline*}

Because $u\tr v = 1$, we have $\partial (u\tr v) = 0$ and 
$\partial \lambda = u\tr \partial A v$.
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
v_k D_k (u\tr [M]_k - u_k),
$$ {#eq:theorem}
where $\lambda^*$ is the leading eigenvalue of $(I-C+MC)D$, _u_ and _v_ are the corresponding left and right eigenvectors, and $[M]_k$ is the $k$-th column of $M$.
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
u\tr \frac{\partial (I-C+MC)D}{\partial C_k} v.
$$

Let $e_k$ and $e\tr_k$ be the column and row vectors with 1 at position _k_ and 0 elsewhere,
$A_k = e_k e\tr_k$ the matrix with 1 at position _(k,k)_ and 0 elsewhere,
and $[M]_k$ the $k$-th column of $M$.

Then,
\begin{multline*}
u\tr \frac{\partial}{\partial C_k}[(I-C+MC)D] v = \\
u\tr (0 - A_k + M A_k)D v = \\
-u_k D_k v_k + v_k D_k u\tr[M]_k = \\
v_k D_k (u\tr[M]_k - u_k),
\end{multline*}

which gives 
$$
\frac{\partial}{\partial C_k} \lambda^* = 
v_k D_k (u\tr[M]_k - u_k). \;\;\; \blacksquare
$$

**Corrolary.**
$$
\frac{\partial \lambda^*}{\partial C_k} = 
\sum_i{u_i M_{i,k}} - u_k
$$

**Corrolary.**
$$
sign \frac{\partial \lambda^*}{\partial C_k} = 
sign (u\tr [M]_k - u_k)
$$

## Fisher's reproductive value
The left Perron eigenvector _u_ of matrix _MD_ comprises what is called _Fisher's reproductive value_.  These values can be understood as follows.  

Let us look at the dynamics not of frequencies but of absolute population sizes, $n_i(t)$.  Let the vector of the number of each type at time _t_ be $n(t)$.
The dynamics are
$$
n(t) = (MD)^t n(0) 
$$

Let $n(j, t)$ be the vector when the initial population is a single individual of type _j_.
The dynamics are
$$
n(j,t) = (MD)^t e_j
$$
where $e_i$ is a vector with 1 at position _i_ and 0 elsewhere.

The total population size at time _t_ starting with type _j_ is then 
$$
N(j,t) = e\tr n(j,t) = e\tr (MD)^t e_j
$$

Now we can compare the population sizes based on what type they start with:
$$
\frac{N(j,t)}{N(k,t)} = \frac{e\tr (MD)^t e_j}{e\tr (MD)^t e_k}
$$

To further evaluate, we write _MD_ as its Jordan canonical form,
$$
A = V \Lambda U\tr,
$$
where $V$ is the matrix of right column eigenvectors of _MD_, $U\tr$ is the matrix of left row eigenvectors of _MD_, $V U\tr = U\tr V = I$, and $\Lambda$ is the diagonal matrix of eigenvalues of _A_ (for a nongeneric set of matrices _M_, the geometric and algebraic multiplicities of the eigenvalues of $MD$ differ, and $\Lambda$ will not be a diagonal matrix, a case we can ignore).  

Hence,
\begin{multline*}
N(i, t) = 
e\tr n(t) = \\
e\tr (MD)^t e_i =
e\tr  (V \Lambda U\tr)^t e_i = \\
e\tr V \Lambda^t U\tr e_i.
\end{multline*}

For the ratio, we can divide $\Lambda$ by $\lambda_1 = \rho(MD)$:
\begin{multline*}
\frac{N(j,t)}{N(k,t)} =
\frac{ e\tr V \Lambda^t U\tr e_j}{ e\tr V \Lambda^t U\tr e_k} = \\
\frac{ e\tr V \diag{1, (\frac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_j} { e\tr V \diag{1,(\frac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_k}.
\end{multline*}

Then now take the long term limit.
By assumption _MD_ is irreducible, hence $\lambda_i < \lambda_1$ for all $i > 1$.
Hence $\lim_{t \goesto \infty} \lambda_i / \lambda_1 = 0$ for all $i > 1$.
Thus:
\begin{multline*}
\lim_{t \goesto \infty}\frac{N(j,t)}{N(k,t)} =
\lim_{t \goesto \infty} \frac{ e\tr V \Lambda^t U\tr e_j}{ e\tr V \Lambda^t U\tr e_k} = \\
\lim_{t \goesto \infty} \frac{ e\tr V diag {1, (\dspfrac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_h} { e\tr V diag {1,(\dspfrac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_k} = \\
\frac{e\tr V (e_1 e_1\tr) U\tr e_j} { e\tr V (e_1 e_1\tr) U\tr e_k} = \\
\frac{ e\tr v u_j} { e\tr v  u_k} =
\frac{u_j} {u_k}.
\end{multline*}

The vector _u_ is the left Perron eigenvector of _MD_, and $u_i$ is element _i_ of _u_.
This is why the value $u_i$ can be interpreted as the _reproductive value_ of type _i_, as it is a weight for the size of the population generated by a single individual of type _i_. 

If we begin with a population at the stationary distribution _v_, and ask what fraction of long-term descendants descended from type _i_ at that time, we weight $v_i$ by the reproductive value $u_i$, to get $u_i v_i$.
We note that $\{u_i v_i\}$ is a normalized probability distribution, since 
$$
\sum_i {u_i v_i} = u\tr v = 1.
$$
This is what @Hermisson2002 call the _ancestor_ or  _ancestral distribution_; it is the distribution among descendants of each type.

# TODO

$\bar{\omega}$ turns out to be the population mean fitness $\sum_i{f_i D_i}$ by expanding $\bar{\omega} \sum_i{f'_i} = 1$.

_v_ is the stationary distribution such that 
$$\bar{\omega} v = (I-C+MC)D v$$
and $u$ is _Fisher's reproductive value_ [@Grafen2006].

$M_{i,j}$ describes the transition from type $j$ to type $i$,
and $u_k$ describes the reproductive value of type $k$.

By the theorem, increasing $C_k$ will increase the leading eigenvalue _iff_ $u\tr[M]k-u_k > 0$. 

Therefore, the derivative of the leading eigenvalue with respect to the increase in the total rate of leaving type $k$
will be positive if the reproductive value of type $k$, $u_k$, is less than the reproductive value expected by leaving type $k$.

If $C_k = 1$ for all _k_, then @Eq:model becomes $\lambda f' = MDf$.

# References
