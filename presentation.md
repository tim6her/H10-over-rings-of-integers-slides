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
\DeclareMathOperator{\Mod}{\mathrm{mod}}
\DeclareMathOperator{\D}{\mathrm{D}}
\DeclareMathOperator{\lcm}{\mathrm{lcm}}
\DeclareMathOperator{\ord}{\mathrm{ord}}
\DeclareMathOperator{\Quot}{Quot}

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
</span>

:::::::::::::: {.columns}
::: {.column width="70%"}
> Given a Diophantine equation with any number of unkown quantities and with
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
> in rational integers.
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
```
:::
::: {.column width="40%"}
<div class="image-float">
  <p class="fragment current-visible" data-fragment-index="0" style="position: relative; left:20px; top:20px;">
  <a href="imgs/turing_add1_1.svg"><img src="imgs/turing_add1_1.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="1" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_2.svg"><img src="imgs/turing_add1_2.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="2" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_3.svg"><img src="imgs/turing_add1_3.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="3" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_4.svg"><img src="imgs/turing_add1_4.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="4" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_5.svg"><img src="imgs/turing_add1_5.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="5" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_6.svg"><img src="imgs/turing_add1_6.svg" width="400vh"/></a></p>
  <p class="fragment current-visible" data-fragment-index="6" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_7.svg"><img src="imgs/turing_add1_7.svg" width="400vh"/></a></p>
  <p class="fragment" data-fragment-index="7" style="position:absolute; left:20px; top:20px;">
  <a href="imgs/turing_add1_8.svg"><img src="imgs/turing_add1_8.svg" width="400vh"/></a></p>
</div>
:::
::::::::::::::

. . .

I write $\mathbb{A}(x)$ for the output of Turing machine $\mathbb{A}$ on input
$x$.

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

* A partial function $f: ω \to ω$ is *computable* if there is a Turing machine $\mathbb{A} with $\mathbb{A}(x) = f(x)$ for all $x$ in the domain of $f$.
* A decision problem is *decidable* if its characteristic function is computable.
* A decision problem $Q$ is *semi-decidable* or *computably enumerable* if there is a Turing machine that returns $\mathtt{1}$ on all members of $Q$.


## The mother of all undecidablility

### Definition

The *halting set* is the set of all codes of Turing machines $\mathbb{A}$ that halt upon receiving their code as input i.e.

$$\mathcal{K} := \set{\enc{\mathbb{A}} | \mathbb{A} \text{ halts on } \enc{\mathbb{A}}}$$

### Theorem

The halting set is semi-decidable but not decidable.


## References
