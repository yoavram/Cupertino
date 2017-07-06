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
\frac{ e\tr V \Lambda^t U\tr e_j}{ e\tr V \Lambda^t U\tr e_k} =
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
We note that $\{u_i v_i\}_{i}$ is a normalized probability distribution, since 
$$
\sum_i {u_i v_i} = u\tr v = 1.
$$
This is what @Hermisson2002 call the _ancestor_ or  _ancestral distribution_; it is the distribution among descendants of each type.

**TODO cite @Grafen2006?**

## General principle

**Theorem.**
_
Consider the transformation $f \to f'$ defined by
$$
\lambda f' = (I-C+MC)D f
$$ {#eq:model}
where $f$ is a stochastic vector ($\sum_i{f_i} = 1$),
$M$ is a stochastic matrix ($\sum_i {M_{i,j}} = 1$ for any column _j_),
$C$ is a diagonal non-negative matrix with diagonal elements $C_k$,
$D$ is a diagonal non-negative matrix with diagonal elements $D_k \le 1$,
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
u\tr \frac{\partial (I-C+MC)D}{\partial C_k} v = \\
u\tr (0 - A_k + M A_k)D v = \\
-u_k D_k v_k + v_k D_k u\tr[M]_k = \\
v_k D_k (u\tr[M]_k - u_k),
\end{multline*}

which gives 
$$
\frac{\partial \lambda^*}{\partial C_k} = 
v_k D_k (u\tr[M]_k - u_k). \;\;\; \blacksquare
$$

If the modifier has the same effect on all types, i.e. $C_k = \alpha$ for all _k_ (including the previous case, then @Eq:model becomes $\lambda f' = ((1-\alpha)I + \alpha M)Df$, and the  _unified reduction principle_ is in effect [@Altenberg2017, see eqs. 65, 72].
Therefore, we can expect modifiers that reduce $\alpha$ to be favored by natural selection.
Indeed, setting $C = \alpha I$ in @Eq:model and proceeding as in the proof, we get 
$$\frac{\partial \lambda^*}{\partial \alpha} = 
\lambda^* - 1 = 
\bar{\omega}^* - 1 \le 0,
$$
because $D_k \le 1$ for all _k_.

In addition, without modification, $C_k = 1$ for all _k_, and @Eq:model becomes $\lambda f' = MDf$ which is a standard mutation-selection model [@Johnson1999a; @Gordo2005].

### Reproductive value interpretation
A corrolary of @Eq:theorem is 
$$
\frac{\partial \lambda^*}{\partial C_k} = 
D_k (\sum_i{u_i M_{i,k} v_k} - u_k v_k).
$$
Recall that $u_k v_k$ is the _ancestor frequnecy_ (@Hermisson2002; see above) for type _k_, or the fraction of the future population descended from individuals that are currently of type _k_. 
The sum $\sum_i{u_i M_{i,k} v_k}$ can be similarly interpreted as the fraction of the future population descended from individuals that transition from type _k_ to another type (via the _k_ column of the transition matrix $M$).
In this case, the role fitness $D_k$ of type _k_ is to discount types with fitness 0 (i.e. will not reproduce), and to reverse the relation for individuals with negative fitness.
So @Eq:theorem means that increasing the overall transition rate from type _k_ to other types ($C_k$) will increase the population mean fitness _iff_ the fraction of the future population descendend from type _k_ is expected to increase due to a transition to another type.

Of course, given $0 < D_k \le 1$, we can simplify the mathematical notation to
$$
sign \frac{\partial \lambda^*}{\partial C_k} = 
sign (u\tr [M]_k - u_k),
$$
where the RHS only deals with the difference between the reproductive value of type _k_ and the reproductive value that can be expected if transitioning to another type.

### Mean fitness interpretation

By definition, $\lambda$ is a normalizing factor such that $\sum_i{f'_i}=1$.
Therefore, using $e\tr M = e\tr$ and $e\tr I = e\tr$, we have
\begin{multline}\label{eq:mean_fitness}
\lambda = 
e\tr (I - C + M C) D v = \\
(e\tr I - e\tr C + e\tr M C) D v = \\
(e\tr - \diag{C} + e\tr C) D v = \\
e\tr D v = \\
\diag{D} v = \\
\sum_k{D_k v_k} = \bar{\omega},
\end{multline}
where $\bar{\omega}$ is the population mean fitness.
Therefore, the leading eigenvalue is the stable population mean fitness: $\bar{\omega}^*=\lambda^*$.

@Ram2012 have demonstrated a weaker version of the above theorem.
Translated to the notation presented here, they modeled a population at the mutation-selection balance in which no more than one mutation occurs per individual per generation:
$$
M_{i,j} = \begin{cases}
\beta \mu & i = j-1 \\
(1-\beta-\delta) \mu & i = j \\
\delta \mu & i = j+1 \\
(1-\delta \mu) & i=j=0 \\
0 & otherwise
\end{cases}.
$$

Using @Eq:Caswells_formula and a recursion on the ratios of the reproductive values (see eqs. A5-6), they concluded that at the mutation-selection balance, if individuals with below-average fitness ($D_k < \bar{\omega}^*$) increase their mutation rate, then the population mean fitness will increase.

The same conclusion can be made for a general transition matrix _M_.
A similar equation to @Eq:model_equilibrium for the left eigenvector _u_ is
$$
u\tr \bar{\omega}^* = u\tr (I - C + MC) D,
$$
which gives us a relation between $\bar{\omega}^*$ and the _k_ element of _u_:
$$
u_k \bar{\omega}^* = (1-C_k) u_k D_k + C_k D_k u\tr [M]_k.
$$
Multiplying both sides by $v_k$ and rearranging, we get 
$\frac{u_k v_k}{C_k} (\bar{\omega}^* - D_k) = v_k D_k(u\tr [M]_k - u_k)$, which yields the corrolary:
$$
\frac{\partial \bar{\omega}^*}{\partial C_k} = 
\frac{u_k v_k}{C_k} (\bar{\omega}^* - D_k),
$$ {#eq:corrolary_mean_fitness}

This is a generalization of [@Ram2012, Eq. 4], which means that increasing the transition out from type _k_ will increase the population mean fitness _iff_ the mean fitness of type _k_ is below average.

## Threshold modifier

We can turn our attention to a modifier that controls the transition out of types $\mathbb{K}$.
For example, Appendix B in (@Ram2012) considers individuals that are grouped by the number of accumulated deleterious mutations, _k_, and a modifier that regulates the mutation rates in individuals with at least $\pi$ deleterious mutations.

Similarly, if the transition rates are controled by a threshold rule
$$
C_k = \begin{cases}
\tau, & k \in \mathbb{K} \\
1, & k \not\in \mathbb{K}
\end{cases},
$$
then the sensitivity of the population mean fitness to changes in the mutation rate of 
\begin{multline*}
\frac{\partial \bar{\omega}^*}{\partial \tau} = 
u\tr \Big( \sum_{k \in \mathbb{K{}}}{\frac{\partial (I - C + MC)D}{\partial \tau}} \Big) v = \\
\frac{1}{\tau} \sum_{k \in \mathbb{K}}{u_k v_k (\bar{\omega}^* - D_k)}.
\end{multline*}

# Appendix A

@Caswell1978 presented a _formula for the sensitivity of the population growth rate to changes in life history parameters_.
In this formula, the population growth rate is the leading eigenvalue of the population transformation matrix _A_, the life history parameters are elements of _A_, and the _sensitivity_ is the derivative of the former with respect to the latter.
This is a useful formula, used for example in [@Ram2012, Appendix A; @Hermisson2002].

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

# References
