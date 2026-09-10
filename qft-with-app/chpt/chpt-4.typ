#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Correlators
We would like to compute integrals of the form
$
  expval(x^(i_1) dots x^(i_k)) = (integral_(RR^n) x^(i_1) dots x^(i_k) exp[-1/2 bold(x)^TT B bold(x)] dd(x, [n]))/(integral_(RR^n) exp[-1/2 bold(x)^TT B bold(x)] dd(x, [n])),
$
which we call a "correlator".

== Wick's theorem
We can again compute $expval(x^(i_1) dots x^(i_k))$ using a generating function
$
  Z[J] &= integral_(RR^n) exp[-1/2 x^i B_(i j) x^j + x^i J_i] dd(x, [n]) \
  &= integral_(RR^n) exp[-1/2 bold(x)^TT B bold(x) + J^TT bold(x)] dd(x, [n]).
$
Then
$
  expval(x^(i_1) dots x^(i_k)) &= underbracket(1/Z[0], "normalisation") evaluated(pdv(, J_(i_1) dots, J_(i_k), [1,1], total: k) Z[J])_(J=0).
$
$Z[J]$ can be written as
$
  Z[J] &= exp[1/2 J^TT B^(-1) J] integral_(RR^n) exp[-1/2 (bold(x) - B^(-1) J)^TT B (bold(x) - B^(-1) J)] dd(x, [n]) \
  &= exp[1/2 J^TT B^(-1) J] underbracket(integral_(RR^n) exp[-1/2 bold(y)^TT B bold(y)] dd(y, [n]), display(=(2 pi)^(n\/2)/sqrt(det B))),
$
or simply
$
  Z[J] & = Z[0] exp[1/2 J^TT B^(-1) J] \
       & = Z[0] exp[1/2 J_i B^(i j) J_j].
$
Here, $Z[0]$ cancels which is nice. Then
$
  expval(x^(i_1) dots x^(i_k)) = evaluated(pdv(, J_(i_1) dots, J_(i_k), [1,1], total: k) exp[1/2 J_i B^(i j) J_j])_(J=0).
$
Now, we will compute some examples:

1. Consider $ expval(x^l) & = evaluated(pdv(, J_l) exp[1/2 J_i B^(i j) J_j])_(J=0) \
              & = evaluated(B^(l s) J_s exp[1/2 J_i B^(i j) J_i])_(J=0) \
              & = 0. $

2. Consider $ expval(x^l x^p) &= evaluated(pdv(, J_l, J_p) exp[1/2 J_i B^(i j) J_j])_(J=0) \
  &= evaluated(B^(l p) exp[1/2 J_i B^(i j) J_j] + B^(l s) J_s B^(p k) J_k exp[1/2 J_i B^(i j) J_j])_(J=0) \
  &= B^(l p). $

3. Consider $ expval(x^l x^p x^n) &= evaluated(pdv(, J_l, J_p, J_n) exp[1/2 J_i B^(i j) J_j])_(J=0) \
  &= 0. $

4. Consider $ expval(x^l x^p x^n x^r) &= evaluated(pdv(, J_l, J_p, J_n, J_r) exp[1/2 J_i B^(i j) J_j])_(J=0) \
  &= B^(l p) B^(n r) + B^(l n) B^(p r) + B^(l r) B^(p n). $

We see all "odd" correlators vanish, and all "even" correlators equal all unique combinations of $B^(i j)$ (all Wick contractions). This is Wick's theorem!

Applying Wick's theorem we immediately know e.g.
$
  expval(x^l x^p x^n x^s x^n x^r) & = B^(l n) B^(p s) B^(n r) + 14 "other terms",
$
where the number of terms is found by
$
  expval(x^(2 n)) &= expval(x dots x) \
  &=^("all" B^(i j) = 1) underbracket(1/sqrt(2 pi), "normalisation") integral_(RR) x^(2 n) exp[-1/2 x^2] dd(x) \
  &= (2 n)!/(2^n n!) \
  &= "number of terms".
$

== Feynman diagrams
The application of Wick's theorem is usually done diagrammatically using "Feynman diagrams".

Consider again $expval(x^l x^p x^n x^r)$. We find three diagrams as in @fig1.

#let feyn1 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $l$, radius: 0.2em),
  node((1, 0), $p$, radius: 0.2em),
  node((0, 1), $n$, radius: 0.2em),
  node((1, 1), $r$, radius: 0.2em),
  edge((0, 0), (1, 0), label: $B^(l p)$),
  edge((0, 1), (1, 1), label: $B^(n r)$),
)

#let feyn2 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $l$, radius: 0.2em),
  node((1, 0), $p$, radius: 0.2em),
  node((0, 1), $n$, radius: 0.2em),
  node((1, 1), $r$, radius: 0.2em),
  edge((0, 0), (0, 1), label: $B^(l n)$),
  edge((1, 0), (1, 1), label: $B^(p r)$),
)

#let feyn3 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $l$, radius: 0.2em),
  node((1, 0), $p$, radius: 0.2em),
  node((0, 1), $n$, radius: 0.2em),
  node((1, 1), $r$, radius: 0.2em),
  edge((0, 0), (1, 1), label: $B^(l r)$, label-pos: 70%, label-sep: -0.15em),
  edge((1, 0), (0, 1), label: $B^(p n)$, label-pos: 70%, label-sep: -0.2em),
)

#figure(
  grid(
    columns: 3,
    rows: 1,
    column-gutter: 5em,
    feyn1, feyn2, feyn3,
  ),
  caption: [Feynman diagrams for $expval(x^l x^p x^n x^r)$.],
)<fig1>

Here, each $x^(i)$ adds an additional vertex. Then all (unique) ways of connecting the vertices give the terms in our correlator.

== With interactions
Having computed the "free" correlator we would like to include "interactions". This is done with a correlator of the form
$
  expval(x^(i_1) dots x^(i_k)) = (integral_(RR^n) x^(i_1) dots x^(i_k) exp[-1/hbar S(bold(x))] dd(x, [n]))/(integral_(RR^n) exp[-1/hbar S(bold(x)) ] dd(x, [n])),
$
where
$
  S(bold(x)) = 1/2 bold(x)^TT B bold(x) + underbracket(sum_(r>=3) 1/r! B_r (bold(x),dots ,bold(x)), "cubic" + "above" #linebreak() "interactions"),
$
with
$
  B_r (bold(x),dots,bold(x)) = (B_r)_(j_1 dots j_r) x^(j_1) dots x^(j_r).
$
We ignore $hbar$ for now and consider the following integral
$
  cal(I)_"cubic" &= integral_(RR^n) exp[-1/2 bold(x)^TT B bold(x) - 1/3! B_3 (bold(x),bold(x),bold(x))] dd(x, [n]).
$
This can be solved quickly using a trick which we illustrate with the much simpler integral
$
  cal(I)_"ex" = integral_RR f(x) exp[-1/2 x^2] dd(x),
$
expanding $f(x)$ we find
$
  cal(I)_"ex" &= sum_(n=0)^oo (f^((n)) (0))/n! integral_RR x^n exp[-1/2 x^2] dd(x) \
  &= evaluated(sum_(n=0)^oo (f^((n)) (0))/n! dv(, J, n) Z[J])_(J=0),
$
which can formally be written as
$
  cal(I)_"ex" & = evaluated(f(dv(, J)) Z[J])_(J=0).
$
Hence,
$
  cal(I)_"cubic" &= evaluated(exp[-1/3! B_3 (pdv(, J), dots, pdv(, J))] underbracket(Z[0] exp[1/2 J^TT B^(-1) J], Z[J]))_(J=0) \
  &= evaluated(exp[-1/3! (B_3)_(i j k) pdv(, J_i, J_j, J_k)] Z[0] exp[1/2 J^TT B^(-1) J])_(J=0) \
  &= [1 - 1/3! (B_3)_(i j k) pdv(, J_i, J_j, J_k) + 1/2 1/(3!)^2 (B_3)_(i j k) pdv(, dots, total: 3) (B_3)_(l m n) pdv(, dots, total: 3) + dots] \
  &#h(4em) times Z[0] evaluated({1 + 1/2 J_rho B^(rho r) J_r + 1/2 1/2^2 (J^TT B^(-1) J)^2 + dots})_(J=0) \
  &= 1 + underbracket(0, "since" 3 partial_J) + (B_3 B_3 "contracted with" 3 B^(a b)) + dots.c
$
Here, the second term vanishes since all terms in ${dots.c}$ have an even number of $J$'s. Likewise, all terms with an odd number of $B_3$'s also vanish. The $B_3 B_3$ term is only non-vanishing when acting on the $(J^TT B^(-1) J)^3$ term (i.e. why $B_3 B_3$ is contracted with $3 B^(a b)$). All higher terms will have leftover $J$'s and all lower terms are killed by the derivatives.

Now, to determine the specific terms we again use Feynman diagrams. All $B_3$ will contribute a vertex of valence three. Hence, the $B_3 B_3$ term has two possible (types of) diagrams shown in @fig2.

#let loop(v, angle, loop-radius: 0.2pt, ..args) = {
  let delta = 1e-2pt
  let b = 90deg + calc.acos(delta / loop-radius)
  edge(
    (rel: (angle + 90deg, delta), to: v),
    (rel: (angle - 90deg, delta), to: v),
    bend: b,
    ..args,
  )
}

#let feyn4 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $(B_3)_(i j k)$, radius: 0.2em),
  node((2, 0), $(B_3)_(l m n)$, radius: 0.2em),
  edge((0, 0), (2, 0), $B^(i l)$, bend: 90deg),
  edge((0, 0), (2, 0), $B^(k n)$, bend: -90deg),
  edge((0, 0), (2, 0), $B^(j m)$),
)

#let feyn5 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $(B_3)_(i j k)$, radius: 0.2em),
  node((2, 0), $(B_3)_(l m n)$, radius: 0.2em),
  edge((0, 0), (2, 0), $B^(k n)$),
  loop((0, 0), 180deg, label: $B^(i j)$),
  loop((2, 0), 0deg, label: $B^(l m)$),
)

#figure(
  grid(
    columns: 1,
    rows: 2,
    row-gutter: 1em,
    feyn4,
    feyn5,
  ),
  caption: [Feynman diagrams for $B_3 B_3$.],
)<fig2>

The shown diagrams contribute
$
  "circle" & = (B_3)_(i j k) (B_3)_(l m n) B^(i l) B^(j m) B^(k n),
$
and
$
  "loops" & = (B_3)_(i j k) (B_3)_(l m n) B^(i j) B^(l m) B^(k n),
$
respectively. Here, there is clearly an ambiguity in the naming (or labeling) of the propagators.

There are no viable diagrams for $(B_3)^3$ meaning this term is zero as argued above by more "direct" means. There are many viable diagrams for $(B_3)^4$, one is shown in @fig3.

#let feyn6 = diagram(
  node-fill: black,
  spacing: 7.5em,
  node-inset: 1em,
  node((0, 0), radius: 0.2em),
  node((1, 0), radius: 0.2em),
  node((0, 1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  edge((0, 0), (0, 1)),
  edge((0, 0), (1, 0)),
  edge((0, 1), (1, 1)),
  edge((1, 0), (1, 1)),
  edge((0, 0), (1, 1)),
  edge((1, 0), (0, 1)),
)

#figure(
  feyn6,
  caption: [Example Feynman diagram for $(B_3)^4$.],
)<fig3>

== With $hbar$ and graphs
We consider $hbar$ again
$
  expval(x^(i_1) dots x^(i_k)) &= (integral_(RR^n) x^(i_1) dots x^(i_k) exp[-1/hbar S(bold(x))] dd(x, [n]))/(integral_(RR^n) exp[-1/hbar S(bold(x))] dd(x, [n])),
$
with
$
  evaluated(pdv(S, x^i))_(x=c) = 0",  " evaluated(pdv(S, x^i, x^j))_(x=c) > 0,
$
i.e. $c$ is a minima of $S(bold(x))$.#footnote[We take $c = 0$ for simplicity.] With our expression for $S(bold(x))$ we find (after $bold(x) = sqrt(hbar) bold(y)$)
$
  expval(x^(i_1) dots x^(i_k)) = hbar^(k\/2) (display(integral_(RR^n) y^(i_1) dots y^(i_k) exp[-1/2 bold(y)^TT B bold(y) - sum_(r>=3) (hbar^(r\/2-1))/r! B_r (bold(y),dots,bold(y))] dd(y, [n])))/(display(integral_(RR^n) exp[-1/2 bold(y)^TT B bold(y) - sum_(r>=3) (hbar^(r\/2-1))/r! B_r (bold(y),dots,bold(y))] dd(y, [n]))).
$
This can also be computed by
$
  expval(x^(i_1) dots x^(i_k)) &= sum_(Gamma in G_(>= 3) (k)) (hbar^(b(Gamma)))/abs("Aut" Gamma) F_Gamma (x^(i_1) dots x^(i_k)),
$
which we will assume without proof (there is one!). The following explains all parts of this equation.

The $G_(>=3) (k)$ is a set of isomorphism classes of graphs with $k$ valence one "external" vertices labelled by $i_1 dots i_k$, and a finite number of "internal" unlabelled vertices of any valence larger than three. An example of such a graph is shown in @fig4.

#let feyn7 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $i_1$, radius: 0.2em),
  node((3, 0), $i_2$, radius: 0.2em),
  node((1, 0), radius: 0.1em),
  node((2, 0), radius: 0.1em),
  edge((0, 0), (1, 0)),
  edge((2, 0), (3, 0)),
  edge((1, 0), (2, 0), bend: 90deg),
  edge((1, 0), (2, 0), bend: -90deg),
)

#figure(
  feyn7,
)<fig4>



Here, the isomorphism class of a graph $Gamma$ are all graphs "similar" to $Gamma$. This means we can move vertices around and stretch edges, if we preserve which vertices are connected to which. With our Feynman diagrams the external labels need also be preserved, while the unlabelled can be renamed freely.

A graph in general is simply a collection of vertices in a plane with edges. Some examples are shown in @fig5.

#let g1 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), radius: 0.2em),
  node((1, 0), radius: 0.2em),
  edge((0, 0), (1, 0)),
  edge((0, 0), (1, 0), bend: 90deg),
  edge((0, 0), (1, 0), bend: -90deg),
)

#let g2 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $1$, radius: 0.2em),
  node((1, 0), $2$, radius: 0.2em),
  edge((0, 0), (1, 0)),
  edge((0, 0), (1, 0), bend: 90deg),
  edge((0, 0), (1, 0), bend: -90deg),
)

#let g3 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), $2$, radius: 0.2em),
  node((1, 0), $1$, radius: 0.2em),
  edge((0, 0), (1, 0)),
  edge((0, 0), (1, 0), bend: 90deg),
  edge((0, 0), (1, 0), bend: -90deg),
)

#figure(
  grid(
    columns: 3,
    rows: 1,
    column-gutter: 5em,
    g1, g2, g3,
  ),
  caption: [A free graph (unlabelled) and two labelled graphs (which are different!).],
)<fig5>

Consider a graph with vertices $1, dots n$. We define the adjacency matrix of the graph by $ m_(i j) =^(i eq.not j) "number of edges between" i "and" j = m_(j i), $ and $ m_(i i) = 2 l_i, $ where $l_i = "number of loops for" i$. The adjacency matrix for the graphs in @fig5 is
$
  A = mat(0, 3; 3, 0).
$
Consider exchanging vertices $i$ and $j$ then
$
  A' = P^TT A P,
$
with $P$ being the permutation matrix
$
  P = mat(0, dots, 1, dots; dots.v, dots.down, , ; 1, , dots.down, ; dots.v, , , 0),
$
where $P_(j i) = 1$ and all other $P_(i j) = 0$. We define
$
  "Aut"_v (A) = "group of all" P "which leave" A "unchanged".
$
Now, the $A$'s for the second and third graph in @fig5 are the same, implying the permutation
$
  P_12 = mat(0, 1; 1, 0),
$
is a symmetry (of both). Hence,
$
  "Aut"_v (A) = {e, P_(12)}.
$
For some general unlabelled graph we can also define an adjacency matrix by using some arbitrary labels $1, dots n$. Then $"Aut"_v (A)$ gives us all possible permutations of vertices leaving the graph unchanged.

Hence, we have
$
  abs("Aut" Gamma) = underbracket(abs("Aut"_v (A)), "internal vertices") times underbracket(product_(i < j) m_(i j) !, "edge permutations") times underbracket(product_i 2^(l_i) l_i !, "loops" #linebreak() "flipping and permutations"),
$
for vacuum graphs (no external vertices!).

When considering graphs with external vertices we need to make sure $A$ respects them. This could be quantified by defining an attachment map
$
  l:{1,dots,k} -> "internal vertices",
$
where $l(i)$ is the internal vertex to which the external vertex $i$ is attached. Then the allowed permutations are
$
  "Aut"_v (A; l) = {p in "Aut"_v (A): p compose l = l},
$
and
$
  abs("Aut" Gamma) = abs("Aut"_v (A; l)) product_(i<j) m_(i j) ! product_i 2^(l_i) l_i ! tilde "symmetry factor of" Gamma.
$


The $b(Gamma)$ is the Betti number of the graph $Gamma$. We define this as
$
  b(Gamma) = "number of edges" - "number of internal vertices".
$
The graph in @fig4 has
$
  b(Gamma) = 2,
$
implying this Feynman diagram is of order $hbar^2$.

The $F_Gamma (x^(i_1) dots x^(i_k))$ is the Feynman amplitude of the graph $Gamma$, which we compute using Feynman rules. As an example the Feynman diagram in @fig4 has
$
  F_Gamma = (B_3)_(l m n) (B_3)_(s p k) B^(l s) B^(m p) underbracket(B^(n i) B^(k j), "external propagators"),
$
where we apply the rules we have learned so far.

== Connected and disconnected graphs
All graphs shown so far have been connected graphs. An example of a disconnected graph is shown in @fig6.

#let g4 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,
  node((0, 0), radius: 0.2em),
  edge(),
  node((1, 0), radius: 0.2em),
  edge(),
  node((0, 1), radius: 0.2em),
  edge((0, 0), (0, 1)),

  node((2, 0), radius: 0.2em),
  edge(),
  node((3, 0), radius: 0.2em),
  edge(),
  node((3, 1), radius: 0.2em),
  edge((2, 0)),
)

#figure(
  g4,
  caption: [A disconnected graph.],
)<fig6>

We would like to only worry about connected graphs. When using
$
  Z[J] = integral_(RR^n) exp[-1/hbar S(bold(x)) + J^TT bold(x)] dd(x, [n]),
$
and computing
$
  expval(x^(i_1) dots x^(i_k)) = 1/Z[0] evaluated(pdv(, dots, total: k) Z[J])_(J=0),
$
we include all graphs. However, to find all connected graphs we can compute#footnote[Some define $W[J] = log Z[J]$.]
$
  expval(x^(i_1) dots x^(i_k))_c = evaluated(pdv(, dots, total: k) log Z[J])_(J=0).
$
This can be seen by computing an example
$
  expval(x^i x^j)_c &= evaluated(pdv(, J_i, J_j) log Z[J])_(J=0) \
  &= evaluated(pdv(, J_i) 1/Z[J] pdv(Z[J], J_j))_(J=0) \
  &= evaluated(1/Z[J]^2 [pdv(Z[J], J_i, J_j) Z[J] - pdv(Z[J], J_i) pdv(Z[J], J_j)])_(J=0) \
  &= evaluated(1/Z[0] pdv(Z[J], J_i, J_j) - 1/Z[0]^2 pdv(Z[J], J_i) pdv(Z[J], J_j))_(J=0) \
  &= expval(x^i x^j) - underbracket(expval(x^i) expval(x^j), "disconnected parts").
$
This suggests the general relationship
$
  "all graphs" = exp("connected graphs").
$
To see this consider a disconnected graph $Gamma_"disc"$. Any such graph can be decomposed into a collection of connected graphs
$
  Gamma_"disc" = (Gamma_1, dots, Gamma_m).
$
The Betti number is additive over connected components
$
  b(Gamma_"disc") & = b(Gamma_1) + dots.c + b(Gamma_m),
$
and the Feynman amplitude factorises
$
  F_Gamma_"disc" & = F_Gamma_1 dots.c F_Gamma_m.
$
Hence, the contribution of a disconnected graph factorises into the contributions of its connected components.

We define
$
  C & = sum_(Gamma "connected") (hbar^(b(Gamma)))/abs("Aut" Gamma) F_Gamma \
    & = underbracket(C_(Gamma_1), "connected graph 1") + C_(Gamma_2) + dots.c
$
Any graph with $m$ connected components (e.g. $Gamma_"disc"$) is an unordered collection of $m$ connected graphs. So when we form $C^m$, each collection is counted $m!$ times, corresponding to the possible orderings of its components. Hence, the contribution from graphs with $m$ connected components is (since $b(Gamma_"disc")$ is additive and $F_Gamma_"disc"$ is multiplicative)
$
  1/m! C^m.
$
Then we find
$
  sum_(Gamma "all") (hbar^(b(Gamma)))/abs("Aut" Gamma) F_Gamma &= 1 + underbracket(C, "all connected") + 1/2! underbracket(C^2, "all graphs with" #linebreak() "two connected components") + dots \
  &= exp(C),
$
or
$
  sum_(Gamma "all") (hbar^(b(Gamma)))/abs("Aut" Gamma) F_Gamma = exp[sum_(Gamma "connected") (hbar^(b(Gamma)))/abs("Aut" Gamma) F_Gamma].
$
This is why $log Z[J]$ is the generating functional for connected graphs. Also, evidently the disconnected graphs are redundant, which is why we only care about connected graphs.

== Vacuum graphs
Computing vacuum graphs corresponds to computing
$
  expval(1) = Z,
$
which is the partition function.

With vacuum graphs our definition of the Betti number changes slightly
$
  b(Gamma) = "number of edges" - "number of vertices",
$
which is the same as
$
  b(Gamma) = "number of loops" - 1.
$
Hence, we can characterise (vacuum) graphs according to the number of loops.

Graphs with zero loops are called tree graphs. An example is shown in @fig7.

#let gtree = diagram(
  edge((0, 0), (1, 0)),
  edge((1, 0), (2, 1)),
  edge((1, 0), (2, -1)),
  edge((0, 0), (-1, -1)),
  edge((0, 0), (-1, 1)),
)

#figure(
  gtree,
  caption: [A tree graph.],
)<fig7>

These have $b(Gamma) = -1$ implying
$
  "number of edges" = "number of vertices" - 1.
$
Graphs with one loop are called one-loop graphs. An example is shown in @fig8.

#let feyn8 = diagram(
  edge((0, 0), (2, 0)),
  edge((0, 0), (2, 0), bend: 90deg),
)

#figure(
  feyn8,
  caption: [A one-loop graph.],
)<fig8>

These have $b(Gamma) = 0$ implying
$
  "number of edges" = "number of vertices",
$
and so on.

When computing $expval(1)$ we will then obtain an expression like
$
  expval(1) tilde underbracket(h^(-1) (dots.c), "tree graphs") + underbracket(hbar^0 (dots.c), "one-loop graphs") + underbracket(hbar^1 (dots.c), "two-loop graphs") + dots.c
$
This is nice since tree graphs are (relatively) simple.

== An example
Consider the vacuum correlator for $n = 1$
$
  Z = underbracket(1/sqrt(2 pi), 1\/Z[0]) integral_RR exp[-1/2 x^2 + underbracket(g e^(zeta x), "interaction term")] dd(x)
$
We expand the interaction term as
$
  Z &= 1/sqrt(2 pi) integral_RR exp[-1/2 x^2 + g sum_s 1/s! zeta^s x^s] dd(x) \
  &=^(y = zeta x) 1/sqrt(2 pi) 1/zeta integral_RR exp[- 1/2 y^2/zeta^2 + g sum_s 1/s! y^s] dd(y).
$
Now, compare $exp(dots.c)$ with
$
  exp[-1/2 bold(y)^TT B bold(y) - sum_(r>=3) (hbar^(r\/2-1))/r! B_r (bold(y),dots.c, bold(y))],
$
ignoring $hbar$ we see
$
  B^(-1) -> zeta^2",  " B_r ->^"all vertices" g.
$
Hence, all edges have $zeta^2$ attached, while all vertices (regardless of valence) have $g$ attached. Then
$
  Z = sum_(n=0)^oo g^n sum_(k=0)^oo zeta^(2 k) sum_(Gamma in G (n, k)) 1/abs("Aut" Gamma),
$
where $G(n,k)$ is the set of all graphs with $n$ vertices and $k$ edges.

We can compute the final sum by expanding in another way
$
  Z & = 1/sqrt(2 pi) sum_n g^n/n! integral_RR exp[-1/2 x^2 + zeta n x] \
    & = sum_n g^n/n! exp[1/2 x^2 zeta^2] \
    & = sum_n g^n/n! sum_k (n^(2 k) zeta^(2 k))/(2^k k!),
$
implying
$
  sum_(Gamma in G(n,k)) 1/abs("Aut" Gamma) = (n^(2 k))/(n! k! 2^k).
$
We could also imagine another system with
$
  Z = integral_RR exp[-1/2 x^2/circle.small.filled + underbracket(g_1 x^3 + g_2 x^4, "interaction terms")] dd(x),
$
where $circle.small.filled$ would be attached to edges, $g_1$ would be attached to vertices with valence three, and $g_2$ would be attached to vertices with valence four. The guy in the exponential will eventually become the Lagrangian $cal(L)$.
