#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Conservation laws
== Poynting's theorem
When charges particles can move freely under some force $bold(F) = - grad U$, then they will move toward a configuration with lower potential energy. This means $U$ will be converted into kinetic energy of the particles' motion.

Consider a particle with charge $q$. The force due to $bold(E)$ and $bold(B)$ is given by Lorentz' force law
$
  bold(F) = q (bold(E) + bold(v) times bold(B)).
$
The change in energy of the particle will be the work done by the fields on the particle moving along a path $cal(p)$
$
  underbracket(W, dd(E_"mech", d: Delta)) &= integral_cal(p) bold(F) dot dd(bold(l)) \
  &= integral_cal(p) q bold(E) dot dd(bold(l)),
$
where $bold(B)$ does no work since the force is transverse to $dd(bold(l))$. The power (along $cal(p)$) is then
$
  dv(E_"mech", t) = q bold(v) dot bold(E).
$
This generalises to some current distribution contained in some volume $V$ by
$
  dv(E_"mech", t) &= integral_V bold(J) dot bold(E) dd(x, 3) \
  &=^("Ampére-Maxwell") integral_V bold(E) dot [curl bold(H) - pdv(bold(D), t)] dd(x, 3) \
  &= integral_V [bold(H) dot (curl bold(E)) - div (bold(E) times bold(H)) - bold(E) dot pdv(bold(D), t)] dd(x, 3) \
  &=^"Faraday" - integral_V [div (bold(E) times bold(H)) + bold(E) dot pdv(bold(D), t) + bold(H) dot pdv(bold(B), t)] dd(x, 3) \
  &= - integral [div (bold(E) times bold(H)) + pdv(u_"field", t)] dd(x, 3),
$
where we introduce the electromagnetic energy density
$
  u_"field" = 1/2 (bold(E) dot bold(D) + bold(B) dot bold(H)),
$
and assumed:

1. The medium of propagation is linear and dispersionless.#footnote[See later.]

2. This still works with time-dependent fields.

This can be rewritten by defining
$
  dv(E_"mech", t) = integral_V pdv(u_"mech", t) dd(x, 3),
$
and the Poynting vector
$
  bold(S) = bold(E) times bold(H).
$
The equation we find is
$
  pdv(, t) (u_"mech" + u_"field") + div bold(S) =^! 0,
$
which is Poynting's theorem. With (or if)
$
  u_"tot" = underbracket(u_"mech", "of charges") + underbracket(u_"field", "stored in fields"),
$
then Poynting's theorem says the energy density is conserved, with $bold(S)$ being the corresponding energy "current", or intensity of the electromagnetic radiation.

By Poynting's theorem the integral form can be found as
$
  integral_V (pdv(u_"field", t) + bold(J) dot bold(E)) dd(x, 3) = - integral.cont_S bold(n) dot bold(S) dd(a),
$
or simply
$
  dv(, t) (E_"field" + E_"mech") = - phi_S (bold(S)).
$
Hence, the change in total energy stored in the volume $V$ is the same as the flux of Poynting's vector through the surface $S$ bounding $V$ (i.e. energy is transported by radiation!).

=== Dispersive and dissipative media
The $bold(E)$ and $bold(B)$ fields often propagate in "dispersive" media. By dispersion we mean the speed of propagation
$
  v = omega/k,
$
is non-constant and depends on $omega$ or $k = 2 pi\/lambda$. This implies waves with different $omega$ or $k$ will propagate with different speeds. Hence, the shape of a wave packet will change (i.e. disperse).

Dispersive media have $epsilon.alt$ and $mu$ which depend on the frequency
$
  epsilon.alt(omega)",  " mu(omega).
$
This implies
$
  bold(E) dot pdv(bold(D), t) eq.not 1/2 pdv(, t) (bold(E) dot bold(D)),
$
and the energy density $u_"field"$ written above is wrong.

The $bold(E)$ and $bold(B)$ fields also often propagate in "dissipative" media. This simply means Poynting's theorem is wrong in these media. This happens since energy is converted to other forms, e.g. heat in the medium of propagation. These media have a non-vanishing imaginary contribution to $epsilon.alt$ and $mu$
$
  Im epsilon.alt eq.not 0",  " Im mu eq.not 0.
$
One can show this implies "new" forms of energy needs to be added to Poynting's theorem
$
  pdv(, t) (u_"mech" + u_"eff") + div bold(S) = - omega_0 Im epsilon.alt (omega_0) expval(bold(E) dot bold(E)) - omega_0 Im mu(omega_0) expval(bold(H) dot bold(H)),
$
where $omega_0$ is the characteristic frequency of the propagating wave, $expval(dots)$ denotes time-averaging over a period
$
  (2 pi)/omega_0,
$
and $u_"eff"$ is the "effective" energy density of the field.

== Maxwell's stress tensor
By Newton's law we have
$
  dv(bold(P)_"mech", t)= q (bold(E) + bold(v) times bold(B)),
$
or generalising to a distribution of moving charges in some volume $V$
$
  dv(bold(P)_"mech", t) &= integral_V (rho bold(E) + bold(J) times bold(B)) dd(x, 3) \
  &=^("Gauss and Ampére-Maxwell") integral_V [epsilon.alt_0 (div bold(E)) bold(E) + (curl bold(H) - epsilon.alt_0 pdv(bold(E), t)) times bold(B)] dd(x, 3) \
  &=^"Faraday" integral_V [epsilon.alt_0 (div bold(E)) bold(E) + 1/mu_0 (curl bold(B)) times bold(B) \ &#h(10em)- epsilon.alt_0 mu_0 pdv(, t) (bold(E) times bold(H)) - epsilon.alt_0 bold(E) times (curl bold(E))] dd(x, 3) \
  &=^(#footnote[$(curl bold(A)) times bold(A) &= (bold(A) dot grad) bold(A) - 1/2 grad (bold(A) dot bold(A))$ and $div (bold(A) bold(A)) = (div bold(A)) bold(A) + (bold(A) dot grad) bold(A)$.]) integral_V [epsilon.alt_0 div (bold(E) bold(E)) - epsilon.alt_0(bold(E) dot grad) bold(E) + 1/mu_0 (bold(B) dot grad) bold(B) - 1/(2 mu_0) grad (bold(B) dot bold(B)) \ &#h(6em)- epsilon.alt_0 mu_0 pdv(, t) (bold(E) times bold(H)) + epsilon.alt_0 (bold(E) dot grad) bold(E) - epsilon.alt_0/2 grad (bold(E) dot bold(E))] dd(x, 3) \
  &=^(div bold(B) = 0) integral_V [1/mu_0 div (bold(B) bold(B)) + epsilon.alt_0 div (bold(E) bold(E)) \ &#h(6em)- 1/(2 mu_0) grad (bold(B) dot bold(B)) - epsilon.alt_0/2 grad (bold(E) dot bold(E)) - epsilon.alt_0 mu_0 pdv(, t) (bold(E) times bold(H))] dd(x, 3).
$
The Poynting vector is essentially a momentum density. Hence, we define
$
  bold(P)_"field" = epsilon.alt_0 mu_0 integral_V bold(E) times bold(H) dd(x, 3),
$
and obtain
$
  dv(, t) (bold(P)_"mech" + bold(P)_"field") &= integral_V epsilon.alt_0 {1/(epsilon.alt_0 mu_0) div (bold(B) bold(B) + bold(E) bold(E)) \ &#h(5em)- 1/2 [ 1/(epsilon.alt_0 mu_0) grad (bold(B) dot bold(B)) + grad (bold(E) dot bold(E))]} dd(x, 3).
$
This can be rewritten as a surface integral using the trick
$
  grad (bold(A) dot bold(A)) = div [(bold(A) dot bold(A)) bold(1)],
$
where $bold(1)$ is the identity. Then
$
  dots &= integral_V epsilon.alt_0 {div (1/(epsilon.alt_0 mu_0) bold(B) bold(B) + bold(E) bold(E)) - 1/2 div [ 1/(epsilon.alt_0 mu_0) (bold(B) dot bold(B)) bold(1) + (bold(E) dot bold(E)) bold(1)]} dd(x, 3) \
  &= integral.cont_S epsilon.alt_0 {1/(epsilon.alt_0 mu_0) bold(B) bold(B) + bold(E) bold(E) - 1/2 [1/(epsilon.alt_0 mu_0) bold(B) dot bold(B) + bold(E) dot bold(E)] bold(1)} dot bold(n) dd(a).
$
We find
$
  dv(, t) (bold(P)_"mech" + bold(P)_"field")_i &= integral.cont_S T_(i j)^((M)) n_j dd(a),
$
where
$
  T_(i j)^((M)) = epsilon.alt_0 {E_i E_j + 1/(epsilon.alt_0 mu_0) B_i B_j - 1/2 [bold(E) dot bold(E) + 1/(epsilon.alt_0 mu_0) bold(B) dot bold(B)] delta_(i j)},
$
is Maxwell's stress tensor and plays the role of "momentum current". This equation tells us momentum is conserved.

The differential form is trivially found by the divergence theorem
$
  pdv(, t) (bold(p)_"mech" + bold(p)_"field")_i - grad_j T_(i j)^((M)) = 0,
$
with
$
   bold(p)_"mech" & = rho bold(E) + bold(J) times bold(B) \
  bold(p)_"field" & = epsilon.alt_0 mu_0 bold(E) times bold(H).
$
