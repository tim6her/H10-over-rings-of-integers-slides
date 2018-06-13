---
title: Hilbert's tenth problem
subtitle: over rings of algebraic integers
author: Tim B. Herbstrith
date: 15 June 2018
keywords: [number theory, theoretical computer science, decidability]
---

# Hilbert's tenth problem, Turing machines, and decidability

## Hilbert's tenth problem

<span>
\DeclareMathOperator{\N}{\mathbb{N}}
\DeclareMathOperator{\Z}{\mathbb{Z}}
\DeclareMathOperator{\Q}{\mathbb{Q}}
\DeclareMathOperator{\R}{\mathbb{R}}
\DeclareMathOperator{\C}{\mathbb{C}}
\DeclareMathOperator{\F}{\mathbb{F}}

\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\id}{id}

\DeclareMathOperator{\kernel}{ker}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\rk}{rk}
\DeclareMathOperator{\End}{\mathrm{End}}
\DeclareMathOperator{\Hom}{\mathrm{Hom}}
\DeclareMathOperator{\D}{\mathrm{D}}
\DeclareMathOperator{\lcm}{\mathrm{lcm}}
\DeclareMathOperator{\ord}{\mathrm{ord}}

\newcommand*{\sta}{\texttt{\S}}
\newcommand*{\emp}{{\monomath \_}}
\newcommand*{\zer}{\mathtt 0}
\newcommand*{\one}{\mathtt 1}
\newcommand*{\state}[1]{s_{\text{#1}}}
\newcommand*{\sstart}{\state{start}}
\newcommand*{\shalt}{\state{halt}}
\newcommand*{\scheck}{s_{\text{check}}}
\newcommand*{\enc}[1]{\ulcorner #1 \urcorner}
\newcommand*{\rel}[1]{\mathrel{\MakeUppercase #1}}
\newcommand*{\algint}[1][K]{\mathcal{O}_{#1}}
\newcommand*{\modalgint}[1][K]{\mathfrak{O}_{#1}}
\newcommand*{\Norm}[1][L/K]{\mathrm N_{#1}}
\newcommand*{\px}{\mathrm x}
\newcommand*{\py}{\mathrm y}
\newcommand*{\sigmaK}[1]{{\left(#1\right)}^*}
\newcommand{\set}[1]{\left\lbrace #1 \right\rbrace}
\newcommand*{\seq}[2][n]{{#2}_1, \ldots, {#2}_{#1}}
\newcommand*{\lang}{\mathcal{L}}
\newcommand*{\Quot}{\mathrm{Quot}}
\newcommand*{\Mod}{\mathrel{\mathrm{mod}}}
</span>

:::::::::::::: {.columns}
::: {.column width="70%"}
> Given a Diophantine equation with any number of unknown quantities and with
> <span class="fragment highlight-current-red" data-fragment-index="3">
    rational integral
  </span>
> numerical coefficients: To devise a
> <span class="fragment highlight-current-red" data-fragment-index="1">
    process
  </span>
> according to which it can be
> <span class="fragment highlight-current-red" data-fragment-index="2">
    determined
  </span>
> by a
> <span class="fragment highlight-current-red" data-fragment-index="1">
    finite number of operations
  </span>
> whether the
> <span class="fragment highlight-current-red" data-fragment-index="2">
    equation is solvable
  </span>
> in
> <span class="fragment highlight-current-red" data-fragment-index="3">
    rational integers.
  </span>
>
> – @Hilbert1900
:::
::: {.column width="30%"}
![David Hilbert](imgs/Hilbert.jpg)
:::
::::::::::::::


## Turing machines

:::::::::::::: {.columns}
::: {.column width="70%"}

### Definition

A *Turing machine* $\mathbb{A}$ on the *alphabet*
$A = \lbrace\mathtt{\sta, \_, 0, 1}\rbrace$ is a tuple $(S, δ)$,
where $s_{start}, s_{halt} \in S$ is a finite non-empty set, called
*set of states*, and

$$δ: S \times A \to S \times A \times \lbrace -1, 0, 1 \rbrace$$

is called *transition function*. If $δ(s, a) = (s', b, m)$, one
demands that the following axioms are satisfied

* $a = \sta$ if and only if $b = \mathtt{S}$,
* If $a = \sta$, then $m \neq -1$, and
* If $s = s_{halt}$, then $s' = s_{halt}$, $a = b$ and $m = 0$.

:::
::: {.column width="30%"}
![Alan Turing](imgs/Turing.jpg)
:::
::::::::::::::


## Turing machines

### Example: Adding $1$ to a number in binary encoding

:::::::::::::: {.columns}
::: {.column width="60%"}
```haskell
δ("start",    '§') = ("overflow", '§', 1 )
δ("overflow", '1') = ("overflow", '0', 1 )
δ("overflow", '0') = ("return",   '1', -1)
δ("overflow", '_') = ("return",   '1', -1)
δ("return",   '§') = ("halt",     '§', 0 )
δ("return",   b)   = ("return",   b  , -1)
δ("halt",     b)   = ("halt",     b  , 0 )
```
:::
::: {.column width="40%"}
<div class="image-float">
  <p class="fragment current-visible" data-fragment-index="0" style="position: relative; left:15px; top:15px;">
    <a href="imgs/turing_add1_1.svg">
      <img src="imgs/turing_add1_1.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="1" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_2.svg">
      <img src="imgs/turing_add1_2.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="2" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_3.svg">
      <img src="imgs/turing_add1_3.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="3" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_4.svg">
      <img src="imgs/turing_add1_4.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="4" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_5.svg">
      <img src="imgs/turing_add1_5.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="5" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_6.svg">
      <img src="imgs/turing_add1_6.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment current-visible" data-fragment-index="6" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_7.svg">
      <img src="imgs/turing_add1_7.svg" width="400vh"/>
    </a>
  </p>
  <p class="fragment" data-fragment-index="7" style="position:absolute; left:20px; top:20px;">
    <a href="imgs/turing_add1_8.svg">
      <img src="imgs/turing_add1_8.svg" width="400vh"/>
    </a>
  </p>
</div>
:::
::::::::::::::

. . .

I write $\mathbb{A}(x)$ for the output of Turing machine $\mathbb{A}$ on input
$x$ if $\mathbb{A}$ halts on $x$.

## Decision problems

### Definition

A *decision problem* is a subset of the set of finite $\mathtt 0$-$\mathtt
1$-strings $ω = \lbrace \mathtt{0, 1} \rbrace^*$ including the empty string
$\lambda$.

. . .

<div>
### Example: Connected graphs

The set of all connected graphs can be encoded as the set of the respective
adjacency matrices written as a string

$$b_{00}b_{01} … b_{0n}b_{10} … b_{nn}$$

of length $(n + 1)^2$.
</div>


## Decidability

### Definition

> * A partial function $f: ω \to ω$ is *computable* if there is a Turing machine $\mathbb{A}$ with $\mathbb{A}(x) = f(x)$ for all $x$ in the domain of $f$.
> * A decision problem is *decidable* if its characteristic function is computable.
> * A decision problem $Q$ is *semi-decidable* or *computably enumerable* if there is a Turing machine that returns $\mathtt{1}$ on all members of $Q$.


## Characterizations of semi-decidable sets

### Proposition

Let $Q \subseteq ω$ be a problem. The following are equivalent.

* $Q$ is semi-decidable.
* $Q$ is the range of a computable function.
* There exists a computable binary relation $R$ on $ω^2$ such that
  $$ x \in Q \Leftrightarrow \exists y : R(x, y)$$

## The halting set

### Definition

The *halting set* is the set of all codes of Turing machines $\mathbb{A}$ that halt upon receiving their code as input i.e.

$$\mathcal{K} := \set{\enc{\mathbb{A}} \mid \mathbb{A} \text{ halts on } \enc{\mathbb{A}}}$$

. . .

<div fragment="true">
### Theorem

The halting set is semi-decidable but not decidable.
</div>

---

### Sketch of Proof

Assume $\mathbb{B}$ decides the halting set i.e.

$$\mathbb{B}(\enc{\mathbb{A}}) =
\begin{cases}
  \one & \text{if } \mathbb{A} \text{ halts on } \enc{\mathbb{A}} \\
  \zer & \text{otherwise}
\end{cases}.
$$

. . .

Consider $\mathbb{B}'$ defined by

$$\mathbb{B}'(\enc{\mathbb{A}}) =
\begin{cases}
  \one & \text{if } \mathbb{B}(\enc{\mathbb{A}}) = \zer \\
  \uparrow & \text{otherwise}
\end{cases}.
$$

. . .

What is $\mathbb{B}'(\enc{\mathbb{B}'})$?


## Church-Turing thesis

I will use without hesitation:

>   The class of intuitively computable
>  functions coincides with the class of all Turing computable functions.



# Some number theory

## Number fields

### Definition

A *number field* $K$ is a finite extension of the rationals $ℚ$.

. . .

<div fragment="true">
### Examples

* $ℚ[i] = \set{x + i y \mid x, y ∈ ℚ}$
* $ℚ[\sqrt[3]{2}] = \set{x + \sqrt[3]{2} y + \sqrt[3]{4} z}$
</div>


## Algebraic integers

### Definition

An element $α \in ℂ$ is called *algebraic integer* if there exists a monic polynomial $p \in ℤ[X]$ such that

$$p(α) = α^n + c_{n - 1} α^{n - 1} + … + c_0 = 0$$

> * We write $\algint[]$ for the set of all algebraic integers …
> * … and if $K$ is a number field, we set $\algint = \algint[] ∩ K$.

## Properties of algebraic integers

### Proposition

> * Both $\algint[]$ and $\algint$ are sub-rings of $ℂ$ (for all $K$).
> * $\algint$ is a finitely generated free $ℤ$-module (for all $K$). A basis is
    called *integral basis*.
> * The quotient field of $\algint$ is (isomorphic to) $K$.


# Diophantine sets and variants of Hilbert's tenth problem

## Purely Diophantine sets

### Definition

Let $R$ be a commutative ring with unit. A set $S \subseteq R^n$ is called
*purely Diophantine* if there exists a polynomial $p \in ℤ[\seq{X}, \seq[m]{Y}]$
such that

$$(\seq{α}) \in S \Leftrightarrow \exists \seq[m]{y} \in R^m : p(\seq{α}, \seq[m]{y}) = 0$$


## Examples of purely Diophantine sets

Let $R$ be a commutative ring with unit. Then divisibility is purely Diophantine
over $R$.

. . .

### Proof

We have $a \mid b$ iff $\exists y ∈ R: a y = b$. Choose $p(a, b, y) = a y - b$ and obtain

$$a \mid b \quad ⇔ \quad ∃ y ∈ R: p(a, b, y) = 0.$$


## Alternative characterization

### Definition

The language of rings with unit is $\lang_{ring} = \set{+, -, \cdot, 0, 1}$.

. . .

<div fragment="true">
  <h3>Remark</h3>

  A set $S \subseteq R^n$ is purely Diophantine over the ring structure
  $\mathfrak{R} = ⟨R; +^{\mathfrak{R}}, -^{\mathfrak{R}}, \cdot^{\mathfrak{R}}; 0^{\mathfrak{R}}, 1^{\mathfrak{R}}⟩$ iff

  $$(\seq{α}) ∈ S \quad ⇔ \quad \mathfrak{R} \models ∃ \seq[m]{y}: φ(\seq{α}, \seq[m]{y})$$

  holds for an atomic $\lang_{ring}$-formula $φ$.
</div>


## Diophantine Sets

### Definition

Let $R$ be a commutative ring with unit. A set $S \subseteq R^n$ is called
*Diophantine* if there exists a polynomial $p \in R[\seq{X}, \seq[m]{Y}]$ such
that

$$(\seq{α}) \in S \Leftrightarrow \exists \seq[m]{y} \in R^m : p(\seq{α}, \seq[m]{y}) = 0$$


## Examples of Diophantine Sets

Let $R$ be an integral domain. Then every finite set $S$ is Diophantine.

. . .

### Proof

Take

$$p(X) = \prod_{a ∈ S} (X - a).$$


## Examples of Diophantine sets

The set of natural numbers $ℕ$ is Diophantine over $ℤ$.

. . .

### Proof

Using Minkowski's theorem on convex bodies one can prove that

$$x ∈ ℕ \quad \Leftrightarrow \quad \exists y_1, y_2, y_3, y_4 \in ℤ: x = y_1^2 + y_2^2 + y_3^2 + y_4^2.$$

## Examples of Diophantine sets

Let $K$ be a number field and $\algint$ its ring of algebraic integers.
Then $\algint \setminus \set{0}$ is Diophantine over $\algint$.

. . .

### Proof

Using the Chinese remainder theorem one can prove that

$$α ≠ 0 \quad ⇔ \quad ∃ β, γ ∈ \algint : α β = (2 γ - 1)(3 γ - 1).$$


## Alternative characterization

### Definition

Let $R$ be an at most countable commutative ring with unit.
The $R$-language  is $\lang_{R} = \lang_{ring} ∪ \set{c_r \mid r ∈ R}$.

. . .

<div fragment="true">
  <h3>Remark</h3>

  A set $S \subseteq R^n$ is Diophantine over $R$ iff

  $$(\seq{α}) ∈ S \quad ⇔ \quad \mathfrak{R} \models ∃ \seq[m]{y}: φ(\seq{α}, \seq[m]{y})$$

  holds for an atomic $\lang_{R}$-formula $φ$.
</div>

## Connection to Hilbert's tenth problem

Given a commutative ring with unit $R$ we consider $4$ theories.


|                                | $\lang_{ring}$-theories | $\lang_{R}$-theories |
| ------------------------------ | ----------------------- | -------------------- |
| **$∃$**-quantified            | $\mathtt{Th}_{∃}(R)$    | $D_{∃}(R)$           |
| **$∃$**- or **$∀$**-quantified | $\mathtt{Th}(R)$        | $D^c(R)$             |


---

<div style="font-size: 200%;">
  <strong>
    Which sets are Diophantine?
  </strong>
</div>


## Historical development

TODO: Write some stuff.


# Computable rings and structural methods

## Computable ring

### Definition

> * A ring $R \subseteq ω$ is *computable* if $R$ is
    decidable and all ring operations are computable.
> * A ring $R$ is *computably presentable* if $R$ is isomorphic to a computable
    ring.


## Examples of computably presentable rings

> * $ℤ$ is computably presentable.
> * Using an integral basis, the ring of integers $\algint$ is computably
    presentable.
> * If $R$ is a computable integral domain then the ring of polynomials
    $R[X_1, X_2, …]$ is computably presentable.


## Connection to Hilbert's tenth problem

### Corollary

Let $K$ be a number field. Then Hilbert's tenth problem over $\algint$ is
semi-decidable.

<div class="fragment fade-in">
### Proof

Let $p ∈ \algint [\seq{X}]$ be a polynomial. Interpret $p: R^n → R$, then $p$ is computable.
</div>

<div class="fragment fade-in">
Deciding whether $p$ has roots in $\algint$ is equivalent to deciding

$$∃ \seq{x} : p(\seq{x}) \doteq 0,$$

which is semi-decidable.
</div>

## Computable categoricity

### Proposition

Let $R$ be computably presentable, finitely generated ring. Then between any
pair of computable representations $R_1, R_2$ of $R$ there is a computable
ring-isomorphism $φ: R_1 → R_2$.

. . .

<div fragment="true">
### Corollary

The decidability of Hilbert's tenth problem over $\algint$ does not depend on
the computable representation of $\algint$.
</div>

<div class="notes">
### Sketch of proof

Associate $R = R_1$ and let $R = ⟨\seq{ξ}⟩$. By assumption there is an
isomorphism $φ: R → R_2$ and $R_2 = ⟨φ(ξ_1), …, φ(ξ_n)⟩$.

Now store $φ(ξ_1), …, φ(ξ_n)$ and there multiplication table in memory and
extend $φ$.
</div>

## Unions and conjunctions

### Lemma

If $S_1$ and $S_2$ are Diophantine over $\algint$, so are

$$S_1 ∪ S_2 \quad \text{and} \quad S_1 ∩ S_2.$$

The resp. polynomial identities can be found effectively.

---

### Proof

Let $p_1(X, Y) ∈ \algint[X, Y]$ and $p_2(X, Y) ∈ \algint {[X, Y]}$ give Diophantine definitions of $S_1$ and $S_2$.

. . .

We have
$$S_1 ∪ S_2 = \set{α \mid ∃ y ∈ \algint: p_1(α, y) p_2(α, y) = 0}.$$

---

To prove the claim for intersections of Diophantine sets, let

$$h(T) = a_m T^m + … + a_1 T + a_0 ∈ R[T]$$

be a polynomial of degree $m > 0$ without roots in $\Quot\, \algint = K$. Then
$\overline h(X) = X^m h(X^{-1})$ does not have roots in $K$ either.

. . .

Set

$$H(X, Y_1, Y_2) = \sum_{i=0}^m a_i p_1(X, Y_1)^i p_2(X, Y_2)^{m - i},$$

then

$$∃ y_1, y_2 ∈ \algint : H(α, y_1, y_2) = 0 \quad ⇔$$
$$∃ y_1 ∈ \algint : p_1(α, y_1) = 0 \text{ and } ∃ y_2 ∈ \algint : p_2(α, y_2) = 0$$

<div class="notes">
Divide by $p_1^m$ or $p_2^m$ and find that $h$ or $\overline{h}$ has a root.
</div>


## Going up

### Lemma

Let $L / K$ be an extension of algebraic number fields. If H10 is undecidable over $\algint$ and $\algint$ is Diophantine over $\algint[L]$, then H10 is undecidable over $\algint[L]$.

. . .

<div fragment="true">
### Proof

Assume otherwise and let $p_K ∈ \algint[L][X, Y]$ give a Diophantine definition of $\algint$ over $\algint[L]$.

If $q ∈ \algint[X_1, …, X_n]$, then $p$ has a root in $\algint$ if and only if

$$∃ \seq{x} ∈ \algint[L] \; ∃ \seq{y} ∈ \algint[L] : q(\seq{x}) = 0 ∧ \bigwedge_{i=1}^n p_K(x_i, y_i) = 0$$
</div>


## A Diophantine definition of rational integers is key

### Theorem

Every semi-decidable subset of $\algint$ is Diophantine if and only if $ℤ$ is
Diophantine over $\algint$.


## Strong vertical method of Denef and Lipshitz

### Theorem

Let $L  /K$ be an extension of number fields and $n = [L : ℚ]$. If $x, y ∈
\algint[L]$ and $α ∈ \algint$ satisfy

1. $y$ is not a unit,
2. $|σ_i(x)| ≤ |N_{L/ℚ}(y^c)|$ for all $1 ≤ i ≤ n$,
3. $|σ_i(α)| ≤ |N_{L/ℚ}(y^c)|$ for all $1 ≤ i ≤ n$, and
4. $x \equiv α \Mod \left(2 y^{2cn}\right)$ in $\algint[L]$

where $\seq{σ}$ denote the embeddings of $L$ into  $ℂ$ and $c ∈
ℕ$ is a fixed, then

$$x = α ∈ \algint.$$

## References
