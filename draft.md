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

According to the _reduction principle_, in populations that evolv near an equilibrium between natural selection and production of variation (i.e. mutation, migration, or recombination), natural selection favors modifiers that decrease the rate of variation production .
The _reduction principle_ was first proposed for modifiers of the recombination [@Feldman1972], mutation, and migration [@Liberman1986a], and dispersal rates [@Altenberg1987].

These separate principles were recently unified by @Altenberg2017 [@Altenberg2009], which laid down the assumptions and conditions for the validity of the _unified reduction principle_: effectively infinite population size, constant-viability selection, a population at an equilibrium, and _linear variation_  -- the equal scaling of transition probabilities by the modifier.
The latter can be violated if two variation producing processes interact [@Altenberg2012], or if there are biases in the mutation or migration process, such that ... 

Another violation of the _linear variation_ assumption of the _reduction principle_ for mutation rates involves a mechanism commoly called _stress-induced mutagenesis_, in which the mutation rate increases in individuals with poor fitness.
@Ram2012 demonstrated that modifiers that increase the mutation rate of individuals with below average fitness actually _increase_ the population mean fitness, rather than decrease it.
Their analysis included an infinite population size and constant-viability selection, such that the only departure from the _reduction principle_ assumptions is due to the differential effect the modifier has on different genotypes.
@Ram2012 stated that their result represents a departure from the _reduction principle_, but did not explain this departure.
Moreover, their analysis was limited to low mutation rates as it assumed that the number of mutations per individual per generation is very low.

Here, we present a general evolutionary model where the rate of variation production can be different for each type of individual.
This model generalizes both mutation and migration or dispersal models.
Our result shows that low fitness individuals should produce more variation then high fitness individuals. 

# Model

Consider a large population with an arbitrary set of types $A_1, A_2, ...$.
The change in the frequencies of these types is described by the transformation $f \to f'$:
$$
\bar{\omega} f' = (I-C+MC)D f
$$ {#eq:model}
where $f_i$ is the frequency if type $A_i$, such that $f$ is a stochastic vector ($\sum_i{f_i} = 1$);
$C_i$ is the probability that an individual of type $A_i$ will transition to another type ($C$ is a diagonal non-negative matrix with diagonal elements $C_i$),
$M_{i,j}$ is the transition probability from type $A_j$ to type $A_i$ given that an individual of type $A_j$ is transitioning ($M$ is a stochastic matrix; $\sum_i {M_{i,j}} = 1$ for any column _j_);
$D_i$ is the relative fitness of type $A_i$ ($D$ is a diagonal matrix with diagonal elements $0 < D_k \le 1$);
$I$ is the identity matrix, and
$\bar{\omega}$ is a normalizing factor such that $\sum_i{f'_i}=1$, which turns out to be the population mean fitness (see @Sec:AppA).

The types $A_i$ can be encoded by a single or multiple genetic loci or non-genetic trait (behaviour, technology. etc.).
The important constrain is that the type is transmitted from a single parent to the offspring, and the transmition infidelity casues type transition (via mutation, migration, innovation, etc.). 
More formally, type transmission must vertical and uni-parental, independent of the frequencies of the other types, and fully described by the matrix $M$.
Therefore, this model precludes recombination, social learning, sexual outcrossing, and any horizontal or oblique transmission mode [@Cavalli-Sforza1981, pg.54].

Transition between types is determned by a combination of two effects: (i)
the probability to transition *out* of type $A_j$ is determined by $C_j$; (ii) the distribution of the destination types $A_i$ is given by $M_{i,j}$. 
We focus on a modifier [@Altenberg2017] that has no direct effect on fitness and whose sole function is to determine the rate of transition out of the different types. 
Importantly, this modifier can determine different rates for different types, therefore $C$ is a diagonal matrix rather than a scalar (the latter is the case in the _reduction principle_ [@Altenberg2017]).

**TODO** Next, we present three interpretations of this model for mutation, migration, and cultural evolution.

# Results

## Mean fitness principle

The equilibrium of @Eq:model, given by the stationary type distribution $v$ and the stable population mean fitness $\bar{\omega}^*$, is described by
$$
\bar{\omega}^* v = (I-C+MC)D v
$$ {#eq:model_equilibrium}

The following theorem presents a _mean fitness principle_ for the sensitivity of the population mean fitness $\bar{\omega}^*$ to changes in $C_k$ the rate of transition out of $A_k$.

**Theorem.**
_Let $\bar{\omega}^*$ be the leading eigenvalue of $(I-C+MC)D$, 
_u_ and _v_ be the corresponding left and right eigenvectors,
and $[M]_k$ the $k$-th column of $M$.
Then
$$
\frac{\partial \bar{\omega}^*}{\partial C_k} = 
\frac{u_k v_k}{C_k} (\bar{\omega}^* - D_k),
$$ {#eq:theorem}
or in simpler terms,
$$
sign\frac{\partial \bar{\omega}^*}{\partial C_k} = 
sign(\bar{\omega}^* - D_k), 
$$
and therefore increased transition out of type _k_ will increase the stable population mean fitness if and only if the fitness of type _k_ is below the stable population mean fitness.
_

**Proof.**
By the _Perron-Frobenius theorem_ [@Otto2007, Appendix A],
$\bar{\omega}^*$ is the leading real positive eigenvalue of $(I-C+MC)D$, 
and the corresponding left and right eigenvectors _u_ and _v_ are both non-negative and uniquely defined by $\sum_i{v_i} = 1$ and $\sum_i{u_i v_i} = 1$.

Using _Caswell's formula_ (@Eq:Caswells_formula in @Sec:AppB),
$$
\frac{\partial \bar{\omega}^*}{\partial C_k} = 
u\tr \frac{\partial (I-C+MC)D}{\partial C_k} v.
$$

Let $e_k$ and $e\tr_k$ be the column and row vectors with 1 at position _k_ and 0 elsewhere,
$Z_k = e_k e\tr_k$ the matrix with 1 at position _(k,k)_ and 0 elsewhere,
and $[M]_k$ the $k$-th column of $M$.

Then,
\begin{multline}\label{eq:theorem_intermediate}
u\tr \frac{\partial (I-C+MC)D}{\partial C_k} v = \\
u\tr (0 - Z_k + M Z_k)D v = \\
-v_k u_k D_k + v_k D_k u\tr[M]_k = \\
v_k D_k (u\tr[M]_k - u_k). 
\end{multline}

A similar equation to @Eq:model_equilibrium for the left eigenvector _u_ is
$$
u\tr \bar{\omega}^* = u\tr (I - C + MC) D,
$$
which gives us a relation between $\bar{\omega}^*$ and the _k_ element of _u_:
$$
u_k \bar{\omega}^* = (1-C_k) D_k u_k + C_k D_k u\tr [M]_k.
$$
Multiplying both sides by $v_k$ (which is positive if $D_k>0$) and rearranging, we get 
$\frac{u_k v_k}{C_k} (\bar{\omega}^* - D_k) = v_k D_k(u\tr [M]_k - u_k)$.
Plugging this in @eq:theorem_intermediate yields:
$$
\frac{\partial \bar{\omega}^*}{\partial C_k} = 
\frac{u_k v_k}{C_k} (\bar{\omega}^* - D_k) \;\;\; \blacksquare
$$

Note that if the modifier has the same effect on all types -- $C_k = \alpha$ for all _k_ -- then @Eq:model_equilibrium becomes $\bar{\omega}^* v = ((1-\alpha)I + \alpha M)Dv$, and the  _unified reduction principle_ is in effect [@Altenberg2017, see eqs. 65, 72].
Therefore, we can expect modifiers that reduce $\alpha$ to be favored by natural selection.
Indeed, setting $C = \alpha I$ in @Eq:model_equilibrium and proceeding as in the proof, we get 
$$\frac{\partial \bar{\omega}^*}{\partial \alpha} = 
\bar{\omega}^* - 1 \le 0,
$$
because $\bar{\omega}^* = \sum_i{v_i D_i}$ (see @Sec:AppA) and $D_i \le 1$ for all _i_.

In addition, without modification, $C_i = 1$ for all _i_, and @Eq:model becomes $\bar{\omega} f' = MDf$ which is a standard mutation-selection model [@Johnson1999a; @Gordo2005].

## Reproductive value principle
A corollary of @Eq:theorem appears in @Eq:theorem_intermediate:
\begin{multline}\label{eq:corollary_reproductive_value}
\frac{\partial \bar{\omega}^*}{\partial C_k} = 
v_k D_k (u\tr[M]_k - u_k) = \\
D_k (\sum_i{u_i M_{i,k} v_k} - u_k v_k).
\end{multline}

$u_k$ is the _Fisher's reproductive value_ of type _k_ (see @Sec:AppC), which gives the relative contribution of type _k_ to the long-term population.
Subsequently, $u_k v_k$ is the _ancestor frequnecy_ (@Hermisson2002; @Sec:AppC) of type _k_, which is the fraction of the equilibirum population descended from type _k_. 
The sum $\sum_i{u_i M_{i,k} v_k}$ can be similarly interpreted as the fraction of the equilibirum population descended from individuals that transitioned from type _k_ to another type (via the _k_ column of the transition matrix $M$).

Given $0 < D_k \le 1$, we can simplify the mathematical notation to
$$
sign \frac{\partial \bar{\omega}^*}{\partial C_k} = 
sign (u\tr [M]_k - u_k),
$$
which means that increasing the overall transition rate $C_k$ from type _k_ to other types will increase the population mean fitness if and only if the fraction of the population descendend from type _k_ is expected to increase due to a transition to another type.

## Threshold modifier

We can turn our attention to a modifier that concurrently controls the transition out of a subset of types, $K$.
For example, Appendix B in (@Ram2012) considers individuals that are grouped by the number of their accumulated deleterious mutations, _k_, and a modifier that regulates the mutation rates in individuals with at least $\pi$ deleterious mutations.

Similarly, if the transition rates are controled by a threshold rule
$$
C_k = \begin{cases}
\tau, & k \in K \\
1, & k \not\in K
\end{cases},
$$
then the sensitivity of the population mean fitness to changes in the rate of transition out of types $K$ is 
\begin{multline*}
\frac{\partial \bar{\omega}^*}{\partial \tau} = 
u\tr \Big( \sum_{k \in \mathbb{K{}}}{\frac{\partial (I - C + MC)D}{\partial \tau}} \Big) v = \\
\frac{1}{\tau} \sum_{k \in \mathbb{K}}{u_k v_k (\bar{\omega}^* - D_k)}.
\end{multline*}

# Discussion

## Violation of the _reduction principle_

## Extension of @Ram2012

The theorem @Eq:theorem is a generalization of a result from @Ram2012 (eq. 4).
Translated to the notation presented here, @Ram2012 modeled a population at the mutation-selection balance in which no more than one mutation occurs per individual per generation:
$$
M_{i,j} = \begin{cases}
\beta \mu, & i = j-1 \\
(1-\beta-\delta) \mu, & i = j \\
\delta \mu, & i = j+1 \\
(1-\delta \mu), & i=j=0 \\
0, & \text{otherwise}
\end{cases}.
$$

Using @Eq:Caswells_formula (@Sec:AppB) and a recursion on the ratios of the reproductive values (see eqs. A5-6 in [@Ram2012]), they concluded that at the mutation-selection balance, if individuals with below-average fitness ($D_k < \bar{\omega}^*$) increase their mutation rate, then the population mean fitness will increase.

## Evidence

**TODO** evidence for faster production of variation in low fitness individuals.

## Conclusions

# Appendix A: The population mean fitness is an eigenvalue {#sec:AppA}

Given @Eq:model, we show that the normalizing factor is the population mean fitness, i.e. $\bar{\omega} = \sum_i{f_i D_i}$.

Denote $e = (1, ..., 1)$ the vector with ones at all positions.
$e\tr M = e\tr$ because _M_ is a stochastic matrix.
Together with $e\tr I = e\tr$, we have
\begin{multline}\label{eq:mean_fitness}
\lambda = 
e\tr (I - C + M C) D f = \\
(e\tr I - e\tr C + e\tr M C) D f = \\
(e\tr - e\tr C + e\tr C) D f = \\
e\tr D f = \\
\diag{D} f = \\
\sum_i{D_i f_i} = \bar{\omega} \;\;\; \blacksquare
\end{multline}

# Appendix B: Caswell's formula {#sec:AppB}

@Caswell1978 presented a _formula for the sensitivity of the population growth rate to changes in life history parameters_.
In this formula, the population growth rate is the leading eigenvalue of the population transformation matrix _T_, the life history parameters are elements of _T_, and the _sensitivity_ is the derivative of the former with respect to the latter.
This is a useful formula [@Ram2012, Appendix A; @Hermisson2002].

**Lemma.** _Caswell's formula [@Caswell1978]:
Let _T_ be a matrix with eigenvalue $\lambda$ and left and right eigenvectors _u_ and _v_ such that $\sum{v_i}=1$ and $u\tr v = \sum{u_i v_i} = 1$, then the sensitivity of $\lambda$ to changes in any parameter _x_ of the matrix _T_ is
$$
\frac{\partial \lambda}{\partial x} = u\tr \frac{\partial T}{\partial x} v
$$ {#eq:Caswells_formula}
_

**Proof.**
Using the lemma assumptions, $\lambda = \lambda u\tr v = u\tr \lambda v = u\tr T v$ and differentiating both sides we get $\partial \lambda = \partial (u\tr T v)$.
Using the product rule (once in each direction), 
\begin{multline*}
\partial (u\tr T v) = \\
\partial u\tr T v + u\tr \partial T v + u\tr T \partial v = \\
u\tr \partial T v + \partial u\tr \lambda v  + \lambda u\tr \partial v = \\
u\tr \partial T v + \lambda(\partial u\tr v  + u\tr \partial v) = \\
u\tr \partial T v + \lambda \partial(u\tr v).
\end{multline*}

Because $u\tr v = 1$, we have $\partial (u\tr v) = 0$ and 
$\partial \lambda = u\tr \partial T v$.
$\blacksquare$

# Appendix C: Fisher's reproductive value {#sec:AppC}

Let _M_ be a stochastic matrix and _D_ be a diagonal matrix with positive diagonal elements.
The left Perron eigenvector _u_ of matrix _MD_ comprises what is called _Fisher's reproductive value_.  
These values can be understood as follows.  

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

For the ratio, we can divide $\Lambda$ by $\lambda_1 = \rho(MD)$, the spectral radius of _MD_:
\begin{multline*}
\frac{N(j,t)}{N(k,t)} =
\frac{ e\tr V \Lambda^t U\tr e_j}{ e\tr V \Lambda^t U\tr e_k} = \\
\frac{ e\tr V \diag{1, (\frac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_j} { e\tr V \diag{1,(\frac{\lambda_2}{\lambda_1})^t, \cdots} U\tr e_k}.
\end{multline*}

Now take the long term limit.
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
This is what @Hermisson2002 called the _ancestor_ or  _ancestral distribution_.

**TODO cite @Grafen2006?**

# References
