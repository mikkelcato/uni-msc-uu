#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Spherical harmonics
== The spherical Laplace equation
The Laplace equation in spherical coordinates  is
$
  laplacian f = 1/r pdv(, r, 2) (r f) + 1/(r^2 sin theta) pdv(, theta) (sin theta pdv(f, theta)) + 1/(r^2 sin^2 theta) pdv(f, phi.alt, 2) =^! 0.
$
Applying separation of variables with an ansatz
$
  f(r,theta,phi.alt) = (U(r))/r P(theta) Q(phi.alt),
$
and multiplying by $r^2 sin^2 theta\/f$ we find
$
  r^2 sin^2 theta [1/U dv(U, r, 2) + 1/(P r^2 sin theta) dv(, theta) (sin theta dv(P, theta))] + underbracket(1/Q dv(Q, phi.alt, 2), - m^2) =^! 0.
$
The $phi.alt$-dependence has been isolated, and we obtain the equation
$
  dv(Q, phi.alt, 2) = -m^2 Q.
$
This has solutions
$
  Q(phi.alt) = e^(plus.minus i m phi.alt),
$
and if $Q$ is single-valued (i.e. well-defined), then $m$ is an integer.

The other equation we find is
$
  underbracket((r^2)/U dv(U, r, 2), l(l+1)) + (1)/(P sin theta) dv(, theta) (sin theta dv(P, theta)) - m^2/(sin^2 theta) =^! 0,
$
which separates as
$
  1/(sin theta) dv(, theta) (sin theta dv(P, theta)) + [l(l+1) - m^2/(sin^2 theta)] P &= 0 \
  dv(U, r, 2) - (l(l+1))/r^2 U &= 0.
$
The radial equation is solved by
$
  U(r) = A r^(l+1) + B r^(-l),
$
with $l$ unknown.

== The Legendre equation
The $theta$ equation is usually written in terms of $x = cos theta$
$
  dv(, x) [(1-x^2) dv(P, x)] + [l(l+1) - m^2/(1-x^2)] P = 0,
$
which is called the generalised Legendre equation, and its solutions are the associated Legendre functions.

Consider the case $m^2 = 0$
$
  dv(, x) [(1-x^2) dv(P, x)] + l(l+1)P = 0,
$
which is called the ordinary Legendre equation. We seek a single-valued and "nice" solution in the range $-1 <= x <= 1$.#footnote[Otherwise, the solution is unphysical.] This can be found by assuming the solution is a power series of the form#footnote[Method of Frobenius.]
$
  P(x) = x^alpha sum_(j=0)^oo a_j x^j.
$
The resulting polynomials are called the Legendre polynomials of order $l$.#footnote[Where $l = 0, 1, dots.c$] These are typically represented by Rodrigues' formula
$
  P_l (x) = 1/(2^l l!) dv(, x, l) (x^2-1)^l.
$
These are orthogonal
$
  integral_(-1)^1 P_(l') (x) P_l (x) dd(x) = 2/(2 l +1) delta_(l' l),
$
and complete. This implies any function $f(x)$ can be represented by a Legendre series
$
  f(x) = sum_(l=0)^oo A_l P_l (x).
$
For more details, see Jackson.

The solutions to the generalised Legendre equation ($m^2 eq.not 0$) are the associated Legendre functions#footnote[Where $m = -l, dots.c, 0, dots.c, l$.]
$
  P_l^m (x) =^(m > 0) (-1)^m (1-x^2)^(m\/2) dv(, x, m) P_l (x).
$
Using Rodrigues' formula we have
$
  P_l^m (x) =^("any" m) (-1)^m/(2^l l!) (1-x^2)^(m\/2) dv(, x, l+m) (x^2-1)^l.
$
The generalised Legendre equation only depends on $m^2$, meaning $P_l^(-m)$ and $P_l^m$ are proportional
$
  P_l^(-m) (x) = (-1)^m ((l-m)!)/((l+m)!) P_l^m (x).
$
These are orthogonal (in $l$)
$
  integral_(-1)^1 P_(l')^m (x) P_l^m (x) dd(x) = 2/(2l+1) ((l+m)!)/((l-m)!) delta_(l' l).
$

== The spherical harmonics
We have found our solution to the Laplace equation can be written as
$
  f(r,theta,phi.alt) = U(r)/r P_l^m (cos theta) Q_m (phi.alt).
$
Recall the $Q_m (phi.alt)$ are complete and orthogonal in $m$ on $0 <= phi.alt <= 2 pi$, while the $P_l^m (cos theta)$ are complete and orthogonal in $l$ (for each $m$) on $-1 <= cos theta <= 1$. This implies the $P_l^m Q_m$ are complete and orthogonal on the unit-sphere in $l$ and $m$.

The normalised $P_l^m Q_m$ are called the spherical harmonics
$
  Y_(l m) (theta, phi.alt) = sqrt((2 l + 1)/(4 pi) ((l-m)!)/((l+m)!)) P_l^m (cos theta) e^(i m phi.alt).
$
Or, for negative $m$
$
  Y_(l, -m) (theta, phi.alt) = (-1)^m Y_(l m)^* (theta, phi.alt).
$
These are orthogonal
$
  integral_0^(2 pi) dd(phi.alt) integral_0^pi sin theta dd(theta) Y_(l' m')^* Y_(l m) = delta_(l' l) delta_(m' m),
$
and complete
$
  sum_(l=0)^oo sum_(m=-l)^l Y_(l m)^* (theta', phi.alt') Y_(l m) (theta, phi.alt) = delta(phi.alt-phi.alt') delta(cos theta - cos theta').
$
This implies any function $g(theta,phi.alt)$ can be represented as
$
  g(theta,phi.alt) = sum_(l=0)^oo sum_(m=-l)^l A_(l m) Y_(l m) (theta,phi.alt),
$
where
$
  A_(l m) = integral dd(Omega) Y_(l m)^* (theta,phi.alt) g(theta,phi.alt).
$

== The addition theorem and Green's functions
Consider two points $bold(x)$ and $bold(x)'$, with an angle $gamma$ between them. Then
$
  P_l (cos gamma) = (4 pi)/(2 l + 1) sum_(m=-l)^l Y_(l m)^* (theta', phi.alt') Y_(l m) (theta,phi.alt),
$
which is the addition theorem, see Jackson for a proof.

Now, we would like an expansion of
$
  G_D (bold(x),bold(x)') = 1/abs(bold(x)-bold(x)').
$
We will show
$
  1/abs(bold(x)-bold(x)') = sum_(l=0)^oo (r^l_<)/r_>^(l+1) P_l (cos gamma).
$
We can rotate our axes until $bold(x)'$ lies along the $z$-axis. Then the potential satisfies the Laplace equation (unless $bold(x) = bold(x)'$ where we find a $delta$-function), and has azimuthal symmetry ($m=0$). This means we can expand the potential as
$
  1/abs(bold(x)-bold(x)') = sum_(l=0)^oo (A_l r^l + B_l r^(-(l+1))) P_l (cos gamma).
$
Take $bold(x)$ to be on the $z$-axis then
$
  1/abs(bold(x)-bold(x)') =^(bold(x) "on" z"-axis") sum_(l=0)^oo (A_l r^l + B_l r^(-(l+1))),
$
while
$
  1/abs(bold(x)-bold(x)') = 1/(r^2+r'^2 - 2 r r' cos gamma)^(1\/2) -> 1/abs(r-r'),
$
which can be expanded
$
  1/abs(bold(x)-bold(x)') = 1/r_> sum_(l=0)^oo (r_</r_>)^l.
$
When $bold(x)$ is off the $z$-axis we simply multiply by $P_l (cos gamma)$ (since the coefficients $A_l$ and $B_l$ are unchanged), and we are done.

Then by the addition theorem we obtain
$
  1/abs(bold(x)-bold(x)') = 4 pi sum_(l=0)^oo sum_(m=-l)^l 1/(2 l + 1) r_<^l/r_>^(l+1) Y_(l m)^* (theta',phi.alt') Y_(l m) (theta,phi.alt),
$
which can be generalised using the method of images.
