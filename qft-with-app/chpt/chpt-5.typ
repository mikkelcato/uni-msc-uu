#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Quantum mechanics ($d=1$ QFT)
With the machinery in place we are ready to tackle quantum mechanics as a one dimensional quantum field theory. The idea is to take everything we did in $n$ dimensions  and "assume" similar things still hold in infinite dimensions.

== Wick rotation
Consider
$
  S[q] & = integral_RR (1/2 dot(q)^2 - U(q)) dd(t),
$
with
$
  U(0) = 0",  " U'(0) = 0",  " U''(0) = m^2,
$
where $m > 0$ is called the mass.

By analogy with the $n$ dimensional cases above the correlator is
$
  expval(q(t_1) dots q(t_n)) = (integral q(t_1) dots q(t_n) exp[i/hbar S[q]] dd(q, d: cal(D)))/(integral exp[i/hbar S[q]] dd(q, d: cal(D))) = underbracket(G^M (t_1, dots, t_n), "Minkowski Green's function").
$
Here, '$i$' is annoying and makes everything we have done so far ill-defined. This is solved by doing a Wick rotation
$
  tau -> i t,
$
or analytically continuing to imaginary time. Then
$
  i S[q] & = i integral (1/2 (dv(q, t))^2 - U(q)) dd(t) \
         & = - integral (1/2 (dv(q, tau))^2 + U(q)) dd(tau) \
         & = - S^E [q],
$
where $S^E [q]$ is the Euclidean action. Hence, the Euclidean Green's function is
$
  G^E (t_1, dots, t_n) = (integral q(t_1) dots q(t_n) exp[-1/hbar S^E [q]] dd(q, d: cal(D)))/(integral exp[-1/hbar S^E [q]] dd(q, d: cal(D))),
$
with
$
  G^M (t_1,dots,t_n) = G^E (i t_1, dots, i t_n).
$
We will always(!) use $G^E$.

== Feynman rules in configuration space
Suppose $U(q)$ is of the form
$
  U(q) = 1/2 m^2 q^2 + sum_(n = 3)^oo a_n/n! q^n,
$
meaning
$
  S[q] = integral [underbracket(1/2 dot(q)^2 + 1/2 m^2 q^2, bold(x)^TT B bold(x)) + underbracket(sum_(n=3)^oo a_n/n! q^n, sum_(r>=3) 1/r! B_r)] dd(t).
$
We can determine $B$ by
$
  integral (1/2 dot(q)^2 + 1/2 q^2 m^2) dd(t) &=^"integration by parts" integral 1/2 q(t) underbracket([-pdv(, t, 2) + m^2], B) q(t) dd(t).
$
$B^(-1)$ (which we actually need) is found by (on $RR$)
$
  [-pdv(, t, 2) + m^2] underbracket(G (t), B^(-1)) = delta(t).
$
The solution is simple#footnote[Here, including '$i$' implies there is no solution.]
$
  G(t) = 1/(2 m) exp(-m abs(t)).
$
We will assume
$
  expval(q(t_1) dots q(t_n)) = sum_(Gamma in G_(>= 3) (k)) hbar^(b(Gamma))/abs("Aut" Gamma) F_Gamma (t_1,dots, t_n),
$
which has no proof. This is simply a qualified guess from the $n$ dimensional case.

Computing the Feynman amplitude $F_Gamma$ is done by

1. All external vertices are labelled by $t_i$.

2. All internal vertices are labelled by $s_i$.

3. All internal edges carry $G(s_i-s_j)$.

4. All external edges carry $G(s_i-t_j)$.

5. Finally integrate over all $s_i$.

Also, all internal vertices carry their interaction strength.

== An example
We compute the correlator
$
  expval(q(t_1) q(t_2)),
$
with
$
  U(q) = 1/2 m^2 q^2 + g/24 q^4.
$
There is one graph with no interaction ($tilde g^0$), and one graph with one interaction vertex ($tilde g$). These are shown in @fig9.

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



#let f1 = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,

  node((0, 0), $t_1$, radius: 0.2em),
  node((1, 0), $t_2$, radius: 0.2em),
  edge((0, 0), (1, 0)),

  node((1.5, 0), $+ g times$, fill: none),

  node((2, 0), $t_1$, radius: 0.2em),
  node((4, 0), $t_2$, radius: 0.2em),
  node((3, 0), radius: 0.1em),
  edge((2, 0), (4, 0)),
  loop((3, 0), 90deg),

  node((4.5, 0), $+ g^2 times (dots.c)$, fill: none),

  node((0, .5)),
)

#figure(
  f1,
  caption: [Graphs contributing to $expval(q(t_1) q(t_2))$.],
)<fig9>

The "trivial" graph carries
$
  F_Gamma = 1/(2 m) exp(-m abs(t_1-t_2)),
$
and the $tilde g$ graph carries
$
  F_Gamma & = g integral [G(t_1-s) G(s-s) G(s-t_2)] dd(s) \
  & = g/(8 m^3) integral exp[-m (abs(s-t_1) + abs(s-t_2))] dd(s) \
  & =^(t_1 >= t_2) - g/(16 m^4) exp(-m abs(t_1-t_2)) [1/m + abs(t_1-t_2)].
$
Hence,
$
  F_Gamma = 1/(2 m) exp(-m abs(t_1-t_2)) [1- g/(8 m^3) (1/m + abs(t_1-t_2)) + dots.c].
$
Note, as $abs(t_1-t_2) -> oo$ then
$
  expval(q(t_1) q(t_2)) -> 0,
$
which is called the clustering property. This holds more generally
$
  lim_(zeta -> oo) G(t_1,dots.c, t_r, t_(r+1) + zeta, dots.c, t_n + zeta) = G(t_1,dots.c, t_r) G(t_(r+1), dots.c, t_n),
$
while the "connected Green's function" vanishes
$
  lim_(zeta -> oo) G^"connected" (dots.c) = 0.
$
This is expected(!).

== Divergences
Consider the vacuum graph in @fig10.

#let vacd = diagram(
  node-fill: black,
  spacing: 5em,
  node-inset: 1em,

  node((0, 0), radius: 0.2em),
  loop((0, 0), 180deg),
  loop((0, 0), 0deg),
)

#figure(
  vacd,
  caption: [A vacuum graph.],
)<fig10>

This graph carries
$
  F_Gamma & = integral_RR G(s-s) G(s-s) dd(s) \
          & = 1/(4 m^2) integral_RR dd(s) \
          & -> oo,
$
i.e. the amplitude diverges. This is an example of an IR divergence (long range). This is easily solved by either ignoring such graphs or by limiting the range as
$
  RR -> [-L, L].
$
Hence, IR divergences are able to be dealt with.

UV divergences (short range) are trouble. Luckily, these are nowhere to be found in quantum mechanics.

== Feynman rules in momentum space
Recall,
$
  [-pdv(, t, 2) + m^2] G(t) = delta(t).
$
On $RR$ the solution was found above
$
  G(t) = 1/(2 m) exp(-m^2 abs(t)).
$
On $S^1$ the solution would be periodic
$
  G(t+2 pi) = G(t),
$
and thereby different (i.e. boundary conditions matter).

Consider the Fourier transform of $G(t)$
$
  G(t) = 1/sqrt(2 pi) integral_RR e^(-i t E) G(E) dd(E),
$
and of $delta(t)$
$
  delta(t) = 1/sqrt(2 pi) integral_RR e^(-i t E) dd(E).
$
Hence, we find
$
  (E^2 + m^2) G(E) = 1,
$
or simply
$
  G(E) = 1/(E^2 + m^2).
$
This is one way to derive $G(t)$.

