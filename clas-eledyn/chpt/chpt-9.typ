#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Waves and interfaces
Consider a planar interface ($z = 0$) between two media with the normal $ bold(n) = (0,0,1)^TT. $ The media will be characterised by $epsilon.alt$ and $mu$ for $z < 0$ and $epsilon.alt'$ and $mu'$ for $z > 0$.

Consider a linearly polarised incoming plane wave with polarisation $bold(E)_0 = bold(scr(E))$. This incoming wave will be refracted ($'$) and reflected ($''$) "producing" more waves. These are summarised as
$
  bold(E) &= bold(E)_0 e^(i (bold(k) dot bold(x) - omega t))",  " bold(E)' &= bold(E)'_0 e^(i (bold(k)' dot bold(x) - omega' t))",  " bold(E)'' &= bold(E)''_0 e^(i (bold(k)'' dot bold(x) - omega'' t)), \
  bold(B) &= sqrt(mu epsilon.alt)k bold(k) times bold(E)",  " bold(B)' &= sqrt(mu' epsilon.alt')/k' bold(k)' times bold(E)'",  " bold(B)'' &= sqrt(mu epsilon.alt)/k'' bold(k)'' times bold(E)'',
$
with angles ${theta, theta', theta''}$ taken with respect to the "midline".

We would like a relation between the incoming parameters and the "outgoing" parameters.

== Snell's law
We can immediately infer
$
  omega = omega' = omega'',
$
since all waves should oscillate simultaneously on the interface. This implies the wavenumbers $k_i$ are
$
    k & = omega sqrt(mu epsilon.alt) \
   k' & = omega sqrt(mu' epsilon.alt') = n'/n k \
  k'' & = k.
$
Now, we assume for all $t$
$
  evaluated(bold(alpha) dot bold(E) + bold(alpha)' dot bold(E)' + bold(alpha)'' dot bold(E)'')_(z=0) = 0,
$
with $bold(alpha)_i$ being independent of $bold(x)$ and $t$. This can only be true if
$
  evaluated(e^(i (bold(k) dot bold(x) - omega t)))_(z=0) = evaluated(e^(i (bold(k)' dot bold(x) - omega t)))_(z=0) = evaluated(e^(i(bold(k)'' dot bold(x) - omega t)))_(z=0),
$
implying
$
  evaluated(bold(k) dot bold(x))_(z = 0) = evaluated(bold(k)' dot bold(x))_(z=0) = evaluated(bold(k)'' dot bold(x))_(z=0).
$
Requiring this holds for all $x$ and $y$ we find
$
  k_x = k'_x = k''_x",  " k_y = k'_y = k''_y,
$
or simply
$
  bold(k)_parallel = bold(k)'_parallel = bold(k)''_parallel.
$
Hence, all the waves in question will lie in the plane spanned by $bold(k)_parallel$ and $bold(k)_perp tilde bold(n)$. We call this the incidence plane.

Using ${theta, theta', theta''}$ we can write
$
  k sin theta = k' sin theta' = k'' sin theta'',
$
implying $theta'' = theta$ and
$
  n' sin theta' = n sin theta,
$
which is Snell's law.#footnote[This derivation works without invoking Maxwell's equations.]

== Total internal reflection
By Snell's law we have
$
  theta' > theta,
$
if $n > n'$. This means we can have a refraction angle $theta' = pi\/2$ with a finite incidence angle
$
  theta_0 = arcsin n'/n,
$
and the refracted wave travels parallel to the interface(!). This is total internal reflection.

Beyond the critical angle $theta > theta_0$ we find
$
  cos theta' & = sqrt(1- sin^2 theta') \
             & = sqrt(1 - n^2/n'^2 sin^2 theta) \
             & = sqrt(1 - (sin^2 theta)/(sin^2 theta_0)) \
             & = i sqrt((sin^2 theta)/(sin^2 theta_0) - 1).
$
This is interesting since
$
  sin theta' = abs(bold(k)'_parallel)/k'",  "cos theta' = abs(bold(k)'_perp)/k'.
$
Assuming $k_y = 0$ the refracted (transmitted) wave is
$
  e^(i bold(k)' dot bold(x)) &= exp[i k' x (sin theta)/(sin theta_0)] underbracket(exp[-k' z sqrt((sin^2 theta)/(sin^2 theta_0) - 1)], "attentuation"),
$
meaning the ampltiude decays exponentially in the direction normal to the interface. Hence, beyond the angle of total reflection the wave still contributes an exponentially decaying field to the other side of the interface(!). However, there is no energy flow.

Recall $bold(E)$ and $bold(B)$ are complex. This is nice since we can easily add them and use linear(!) superposition. However, this is less nice when dealing with non-linear equations. Consider
$
  bold(E) & = bold(scr(E)) e^(i (k bold(n) dot bold(x)- omega t)) = bold(epsilon.alt)_1 E e^((dots.c)) \
  bold(B) & = bold(scr(B)) e^(i (k bold(n) dot bold(x)- omega t)) = bold(epsilon.alt)_2 sqrt(mu epsilon.alt) E e^((dots.c)),
$
where $E = A e^(i alpha)$. The "real" fields are then
$
  Re bold(E) & = bold(epsilon.alt)_1 A cos (dots.c) \
  Re bold(B) & = bold(epsilon.alt)_2 sqrt(mu epsilon.alt) A cos (dots.c),
$
and we can compute $bold(S)$ directly by
$
  bold(S) & = Re bold(E) times Re bold(H) = bold(epsilon.alt)_3 sqrt(epsilon.alt/mu) A^2 cos^2 (dots.c).
$
We could also try computing $bold(S)$ directly as
$
  Re (bold(E) times bold(H)) &= bold(epsilon.alt)_3 sqrt(epsilon.alt/mu) A^2 cos 2 (dots.c).
$
These are clearly different(!). This happens since
$
  Re bold(E) times bold(H) eq.not Re bold(E) times Re bold(H).
$
We can avoid this problem by using time-averaged quantities. Suppose $F_k (t) = f_k e^(-i omega t)$ with $f_k in CC$ then
$
  Re F_1 Re F_2 = 1/2 Re (F_1^* F_2 + f_1 f_2 e^(-2 i omega t)).
$
Taking the time-average over a period $2 pi \/omega$ the second term vanishes
$
  expval(Re F_1 Re F_2) & = 1/T integral_0^T dd(t) Re F_1 Re F_2 \
                        & = 1/2 Re F_1^* F_2,
$
which allows the computation of time-averaged quantities directly! Applying this to $bold(S)$ we find
$
  expval(bold(S)) & = 1/2 Re bold(E) times bold(H)^* \
                  & = 1/2 bold(epsilon.alt)_3 sqrt(mu epsilon.alt) A^2,
$
which agrees with the time-average of our previous expression.

The flow of energy across an interface can then be computed as
$
  expval(bold(S)') dot bold(n) &= 1/2 Re [(bold(E)' times bold(H)'^*) dot bold(n)] \
  &= 1/2 Re [(bold(E)' times [(bold(k)' times bold(E)')/(omega mu')]^*) dot bold(n)] \
  &=^(bold(E)' dot bold(k)' = 0) 1/(2 omega mu') Re [(bold(k)' dot bold(n)) abs(bold(E)')^2] \
  &= k'/(2 omega mu') Re [cos theta' abs(bold(E)')^2] \
  &=^(cos theta' in i RR) 0.
$
Hence, energy only flows parallel to the interface.#footnote[This is also true below the interface!]

=== Goos-Hänchen effect
Recall a refracted wave decays exponentially with amplitude $tilde e^(-z\/delta)$ where
$
  1/delta & = k' sqrt((sin^2 theta)/(sin^2 theta_0) - 1) \
          & = k sqrt(sin^2 theta- sin^2 theta_0),
$
is the characteristic length of decay. The idea of the Goos-Hänchen effect is that reflection occurs at the depth $delta$. The apparent displacement of the reflected image from the optical line of reflection is then
$
  D & tilde.eq 2 delta sin theta \
    & tilde.eq (2 sin theta)/(k sqrt(sin^2 theta - sin^2 theta_0)).
$
The effect is largest when $theta tilde.eq theta_0$.

== Fields and interfaces
Recall we found
$
    (bold(D)_2 - bold(D)_1) dot bold(n) & = sigma \
    (bold(E)_2-bold(E)_1) times bold(n) & = 0 \
    (bold(B)_2 - bold(B)_1) dot bold(n) & = 0 \
  (bold(H)_2 - bold(H)_1) times bold(n) & = bold(K),
$
within electro- and magnetostatics respectively. These still hold in electrodynamics.

Consider an interface between macroscopic media with surface charge density $sigma$ and surface current density $bold(K)$. Recall Gauss' law(s)
$
  div bold(D) & = rho \
  div bold(B) & = 0,
$
and consider an infinitesimally small cylinder with base area $dd(a, d: Delta)$ placed "across" the interface. With $V$ being the enclosed volume we have
$
  underbracket(integral_V rho dd(x, 3), q_V = sigma dd(a, d: Delta)) &= integral_V div bold(D) dd(x, 3) \
  &= integral.cont_(dd(V, d: partial)) bold(D) dot bold(n) dd(a) \
  &tilde.eq^("ignoring sides") (bold(D)_2 - bold(D)_1) dot bold(n) dd(a, d: Delta),
$
where $bold(n)$ is the normal of the interface from $1 -> 2$. Hence,
$
  (bold(D)_2-bold(D)_1) dot bold(n) = sigma.
$
Likewise, we find for $bold(B)$
$
  (bold(B)_2 - bold(B)_1) dot bold(n) = 0.
$
Recall the final Maxwell's equations
$
  curl bold(H) & = bold(J) + pdv(bold(D), t) \
  curl bold(E) & = - pdv(bold(B), t),
$
and consider a rectangular loop "across" the interface, with infinitesimal sides normal to the interface (and finite sides parallel to the interface). With $S$ being the enclosed surface, and $bold(t)$ being the normal (i.e. parallel to interface), we have
$
  integral_S (curl bold(E)) dot bold(t) dd(a) &= integral.cont_(dd(S, d: partial)) bold(E) dot dd(bold(l)) \
  &=^"ignoring short sides" (bold(E)_2 - bold(E)_1) dot (bold(t) times bold(n)) dd(l, d: Delta),
$
and
$
  integral_S pdv(bold(B), t) dot bold(t) dd(a) & =^"vanishing area" 0.
$
The rectangle can be oriented in any direction along the interface so we conclude
$
  (bold(E)_2 - bold(E)_1) times bold(n) = 0.
$
Likewise, we find for $bold(H)$
$
  (bold(H)_2 - bold(H)_1) times bold(n) = bold(K).
$

== Fresnel's formulae
Suppose $sigma = 0$ and $bold(K)= bold(0)$ with both media being linear and dispersionless (simpleness!)
$
  bold(D) = epsilon.alt bold(E)",  " bold(B) = mu bold(H).
$
Comparing fields we have
$
  bold(E)_1 & = bold(E) + bold(E)'' \
  bold(E)_2 & = bold(E)',
$
with all (linearly polarised) $bold(E)$ being defined previously.

We know the phases are the same when $z = 0$. The condition on $bold(D)_perp$ becomes
$
  0 &= [epsilon.alt (bold(E)_0 + bold(E)''_0) - epsilon.alt' bold(E)'_0] dot bold(n),
$
and the condition on $bold(B)_perp$ becomes
$
  0 & = [bold(B)_0 + bold(B)''_0 - bold(B)'_0] dot bold(n) \
  &= 1/omega (bold(k) times bold(E)_0 + bold(k)'' times bold(E)''_0 - bold(k)' times bold(E)'_0) dot bold(n).
$
Likewise, the condition on $bold(E)_parallel$ becomes
$
  0 & = (bold(E)_0 + bold(E)''_0 - bold(E)'_0) times bold(n),
$
and the condition on $bold(H)_parallel$ becomes
$
  0 &= [1/mu (bold(B)_0 + bold(B)''_0) - 1/mu' bold(B)'_0] times bold(n) \
  &= 1/omega [1/mu (bold(k) times bold(E)_0 + bold(k)'' times bold(E)''_0) - 1/mu' bold(k)' times bold(E)'_0] times bold(n).
$
These equation encode all dynamical information on the reflected and refracted waves!

1. Consider $bold(E)_0$ perpendicular to the plane of incidence. One can eventually obtain (after substituting everything into "parallel" equations) $ E'_0/E_0 &= (2 n cos theta)/(n cos theta + mu/mu' sqrt(n'^2 - n^2 sin^2 theta)) \
  E''_0/E_0 &= (n cos theta - mu/mu' sqrt(n'^2 - n^2 sin^2 theta))/(n cos theta + mu/mu' sqrt(n'^2 - n^2 sin^2 theta)). $ These are Fresnel's formulae for perpendicular polarisation.

  2. Consider $bold(E)_0$ parallel to the plane of incidence. One eventually finds $ E'_0/E_0 &= (2 n n' cos theta)/(mu/mu' n'^2 cos theta + n sqrt(n'^2 - n^2 sin^2 theta)) \ E''_0/E_0 &= (mu/mu' n'^2 cos theta - n sqrt(n'^2 - n^2 sin^2 theta))/(mu/mu' n'^2 cos theta + n sqrt(n'^2 - n^2 sin^2 theta)). $ These are Fresnel's formulare for parallel polarisation.

When $theta = 0$ these are equivalent(!).

=== Reflection phase shift
Recall if $n > n'$ there is some critical angle $theta_0$ beyond which the refracted wave decays exponentially. This is non-obvious from Fresnel's formulae since $E'_0$ is non-vanishing for all $theta$. This is because total reflection involves exponential decay.

Using $k'_z = k' cos theta' in i RR$ we find by Fresnel
$
  abs(E''_0/E_0) = 1,
$
and the intensity of the incoming wave goes entirely to the reflected wave. This allows for a phase shift by reflection
$
  dd(alpha, d: delta) = arg E''_0/E_0 eq.not 0"  "(mod 2 pi),
$
and generally $dd(alpha_perp, d: delta) eq.not dd(alpha_parallel, d: delta)$.

Fresnel used this to produce a circularly polarised wave by using a beam of linearly polarised plane wave with $E_(0,perp) = E_(0,parallel)$. This beam can be reflected keeping
$
  E''_(0, perp) = E''_(0,parallel),
$
while producing a phase shift $dd(alpha_perp, d: delta) - dd(alpha_parallel, d: delta) = plus.minus pi\/2$.

=== Brewster's angle
There is an incidence angle $theta = theta_B$ where the (parallel part of) reflected wave vanishes
$
  E''_(0,parallel) = 0.
$
This angle is called is Brewster's angle.

With $mu' = mu$ we find by Fresnel
$
  sin theta_B = n'/sqrt(n'^2 + n^2),
$
or simply
$
  tan theta_B = n'/n.
$
Since $E''_(0,parallel)$ vanishes we know the reflected wave is linearly polarised along the direction perpendicular to the plane of incidence.
