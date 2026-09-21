#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= On dispersion


== Simple model of $epsilon.alt(omega)$
We previously "defined" or viewed $epsilon.alt$ as a number summarising the backreaction of a dielectric material to an applied external electric field $bold(E)$, with this being caused by induced dipoles in the material. We'll now consider this model in detail and eventually derive an expression for $epsilon.alt (omega)$.

Consider an electron with charge $-e$ and mass $m$ bound to a lattice site at $bold(x) = bold(0)$ by an harmonic force
$
  bold(F)_"binding" = -m omega_0^2 bold(x),
$
and affected by a damping force
$
  bold(F)_"damping" = - m gamma dot(bold(x)),
$
where $gamma$ is the effective friction coefficient. Applying an external electric field $bold(E)$ the equation of motion is
$
  m dot.double(bold(x)) = - m gamma dot(bold(x)) - m omega_0^2 bold(x) - e bold(E),
$
where we ignore magnetic forces.

Assuming the amplitude for $bold(x)$ is much smaller than for $bold(E)$ we can write
$
  bold(E)(bold(x),t) tilde.eq bold(E)(t),
$
and taking the time-dependence to be harmonic
$
  bold(E)(t) = bold(E)_0 e^(-i omega t),
$
implying $bold(x) = bold(x)_0 e^(-i omega t)$ and#footnote[The time-dependence on $bold(x)$ is inherited by $bold(E)$. However, there will be a phase difference since $bold(x)_0 eq.not bold(E)_0$.]
$
  bold(x)_0 = - e/m (omega_0^2 - omega^2 - i omega gamma)^(-1) bold(E)_0,
$
which is nice.

The displacement of the electron (from neutral position) will induce a dipole with
$
  bold(p) & = q bold(x) \
          & = e^2/m (omega_0^2 - omega^2 - i omega gamma)^(-1) bold(E) \
          & tilde "linear response",
$
and taking $n$ to be the density of electrons this induces a polarisation density
$
  bold(P) = n bold(p).
$
Typically there are multiple species of electrons in a material. We'll denote the molecule density by $N$ and the number of electrons of type $j$ in a molecule by $f_j$. Summing over all species we find
$
  bold(P) &= [e^2/m sum_j underbracket(N f_j, n_j) (omega_j^2 -omega^2 - i omega gamma_j)^(-1)] bold(E),
$
where $n_j$ is the density of electrons of type $j$.

Recall the definition of electric susceptibility $chi_e$
$
  bold(P) = epsilon.alt_0 chi_e bold(E),
$
implying
$
  chi_e = N/epsilon.alt_0 e^2/m sum_j f_j (omega_j^2 - omega^2 - i omega gamma_j)^(-1).
$
This immediately gives $epsilon.alt (omega)$ as
$
  epsilon.alt/epsilon.alt_0 &= 1 + chi_e \
  &= 1 + N/epsilon.alt_0 e^2/m sum_j f_j [underbracket(omega_j^2 - omega^2, "resonance") - overbracket(i omega gamma_j, "dissipation")]^(-1).
$
This implies (with $mu tilde.eq mu_0$)
$
  n(omega) &= Re sqrt(epsilon.alt/epsilon.alt_0) + i Im sqrt(epsilon.alt/epsilon.alt_0),
$
with the imaginary contribution coming from the damping term.

Likewise,
$
  k = k_r + i k_i,
$
where
$
  k_r = omega/c Re sqrt(epsilon.alt/epsilon.alt_0)",  " k_i = omega/c Im sqrt(epsilon.alt/epsilon.alt_0).
$
This implies the intensity decays (or grows) exponentially#footnote[The $2 k_i$ for water is $tilde 10^(4) m^(-1)$ for microwaves, which is why microwaves work.]
$
  abs(bold(E))^2 tilde e^(-2 k_i z),
$
with $bold(hat(k)) = bold(hat(z))$. This is called absorption.

The damping coefficients $gamma_j$ are usually small compared with the resonant frequencies $omega_j$
$
  gamma_j << omega_j,
$
implying $k_i << k_r$ unless(!) $omega tilde.eq omega_j$ where the imaginary contribution will dominate. This means electromagnetic waves with frequencies near resonance
$
  omega tilde.eq omega_j,
$
have maximal absorption.

This phenomenom leads to a weird alternating behaviour between

1. "normal" dispersion, where $ dv(Re epsilon.alt, omega) > 0, $ away from resonance.

2. "anomalous" dispersion, where $ dv(Re epsilon.alt, omega) < 0, $ near resonance.

== Some limits
We'll now consider some limits of our model. Consider $omega -> 0$.

1. Suppose $omega_j eq.not 0$ for all $j$, implying no electrons are free. This is the definition of a dielectric. Taking $omega -> 0$ our model becomes $ epsilon.alt/epsilon.alt_0 = 1 + N/epsilon.alt_0 e^2/m sum_j f_j/omega_j^2, $ and clearly $epsilon.alt > epsilon.alt_0$.

2. Suppose $omega_0 = 0$ for some $j = 0$. Then a fraction $f_0$ of the electrons are "free", and the limit is singular. However, we can write $ epsilon.alt & = epsilon.alt_"bound" + i (N e^2 f_0)/(m omega(gamma_0-i omega)), $ where $epsilon.alt_"bound"$ is the contribution from all other dipoles.

  Consider Amperé-Maxwell's law $ curl bold(H) = bold(J) + pdv(bold(D), t), $ assuming the medium obeys Ohm's law $bold(J) = sigma bold(E)$ and is a "normal" dielectric with $bold(D) = epsilon.alt_"bound" bold(E)$ we find $ curl bold(H) = -i omega [epsilon.alt_"bound" + i sigma/omega] bold(E). $ However, assuming everything is "caused" by $epsilon.alt$  we would identify $ epsilon.alt_"bound" + i sigma/omega = epsilon.alt_"bound" + i (N e^2 f_0)/(m omega (gamma_0 - i omega)), $ or simply $ sigma = (N e^2 f_0)/(m(gamma_0 - i omega)), $ which is essentially Drude's model of conductivity.

Consider $omega >> omega_j$ for all $j$.

1. Here, all terms become negative and we find $ epsilon.alt/epsilon.alt_0 &tilde.eq 1 - N/epsilon.alt_0 (e^2)/(m) sum_j f_j/omega^2 \
  &eq 1 - (N Z e^2)/(epsilon.alt_0 m) 1/omega^2 \
  &eq 1 - omega_p^2/omega^2, $ where $Z$ is the number of electrons in each molecule, and $omega_p$ is the plasma frequency of the medium $ omega_p^2 = (N Z e^2)/(epsilon.alt_0 m). $
  Taking this limit corresponds to binding- and damping forces becoming negligible, and all electron species act as if they were free.

  The wavenumber becomes $ k & tilde.eq omega/c sqrt(epsilon.alt/epsilon.alt_0) \
    & tilde.eq 1/c sqrt(omega^2 - omega_p^2). $ One can have $omega < omega_p$ and $omega_j << omega$ for all $j$ implying $k in i RR$. This means there'll be total reflection, since the electric field decays exponentially inside the plasma.

2. Consider a metal. We can describe metals by  $ epsilon.alt = epsilon.alt_"bound" + i (N e^2 f_0)/(m omega (gamma_0 - i omega)). $ Taking $omega >> gamma_0$ we find $ epsilon.alt tilde.eq epsilon.alt_"bound" - omega_p^2/omega^2 epsilon.alt_0. $ When $omega << omega_p$ this again leads to $k in i RR$ and total reflection.#footnote[This is why mirrors work.]

== Wavepackets
We'll work in one-dimension and assume our medium is non-dissipative ($k, omega in RR$).

Recall a wave propagating is described by the Helmholtz equation (no sources)
$
  [pdv(, x, 2) + omega^2 mu epsilon.alt] u(x,t) = 0.
$
Any solution takes the form
$
  u(x,t) & = 1/sqrt(2 pi) integral_RR A(k) e^(i (k x - omega t)) dd(k),
$
with
$
  k = omega sqrt(mu epsilon.alt).
$
This is simply a linear superposition of monochromatic waves. Here, $A(k)$ is the distribution of wavenumbers $k$, and can be found by an inverse Fourier transform ($t = 0$)
$
  A(k) = 1/sqrt(2 pi) integral_RR u(x,0) e^(-i k x) dd(x).
$

Consider an $A(k)$ which is sharply peaked around $k_0$. Then our solution is dominated by the region around $k_0$. We can expand $omega(k)$ around $omega_0 = omega(k_0)$ as
$
  omega(k) = omega_0 + evaluated(dv(omega, k))_(k_0) (k-k_0) + dots.c
$
implying
$
  u(x,t) &tilde.eq 1/sqrt(2 pi) exp[i (omega_0 - k_0 evaluated(dv(omega, k))_(k_0)) t] integral_RR A(k) exp[i (x - evaluated(dv(omega, k))_(k_0) t) k] dd(k) \
  &tilde.eq 1/sqrt(2 pi) exp[i (omega_0 - k_0 evaluated(dv(omega, k))_(k_0)) t] u(x- evaluated(dv(omega, k))_(k_0) t, 0).
$
This shows the wavepacket has an effective speed
$
  v_g = evaluated(dv(omega, k))_(k_0),
$
called the group velocity.

With a Gaussian wavepacket of characteristic width $2L$ ($t = 0$)
$
  u(x,0) = exp[- x^2/(2 L^2)] cos k_0 x,
$
one can compute
$
  L(t) = [L^2 + ((a^2 nu t)/L)^2]^(1\/2),
$
meaning the Gaussian spreads over time.
