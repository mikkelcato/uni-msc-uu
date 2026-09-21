#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= On waveguides
== Fields in a waveguide
Consider a hollow cylinder with some arbitrary (and unchanging) cross-section. We'll assume the walls are ideal conductors.#footnote[When the ends are open this is a waveguide, while this is a cavity when they are closed.] We consider electromagnetic waves with frequency $omega$ propagating inside (no sources). Hence, the Helmholtz equations describe $bold(E)$ and $bold(B)$
$
  (laplacian + omega^2 mu epsilon.alt) bold(E) & = 0 \
  (laplacian + omega^2 mu epsilon.alt) bold(B) & = 0.
$
By symmetry we can choose the waveguide to be along the $z$-axis. Then#footnote[Here, $k$ is arbitrary in $z$. However, for a cavity $k$ will be quantised.]
$
  bold(E) & = bold(E) (x,y) e^(plus.minus i k z - i omega t) \
  bold(B) & = bold(B) (x,y) e^(plus.minus i k z - i omega t),
$
and the Helmholtz equation can be written as
$
  [laplacian_t + (omega^2 mu epsilon.alt - k^2)] bold(E) & = 0 \
  [laplacian_t + (omega^2 mu epsilon.alt - k^2)] bold(B) & = 0,
$
with $laplacian_t = laplacian - partial_z^2$.

We define
$
  bold(E)_t = vecrow(E_x, E_y, 0)",  " bold(E)_z = vecrow(0, 0, E_z),
$
so $bold(E) = bold(E)_t + bold(E)_z$ and similarly for $bold(B)$. Recall Maxwell's equations
$
                                             div bold(E)(bold(x)) & = 0 \
                 curl bold(E)(bold(x)) - i omega bold(B)(bold(x)) & = 0 \
                                             div bold(B)(bold(x)) & = 0 \
  curl bold(B)(bold(x)) + i mu epsilon.alt omega bold(E)(bold(x)) & = 0,
$
which become#footnote[We use $ grad = grad_t + bold(hat(z)) pdv(, z). $]
$
  grad_t dot bold(E)_t + pdv(E_z, z) & = 0 \
  grad_t dot bold(B)_t + pdv(B_z, z) & = 0,
$
and
$
  pdv(bold(E)_t, z) - grad_t E_z + i omega bold(hat(z)) times bold(B)_t &= 0 \
  bold(hat(z)) dot (grad_t times bold(E)_t) - i omega B_z &= 0 \
  pdv(bold(B)_t, z) - grad_t B_z - i mu epsilon.alt omega bold(hat(z)) times bold(E)_t &= 0 \
  bold(hat(z)) dot (grad_t times bold(B)_t) + i mu epsilon.alt omega E_z &= 0.
$
With our ansatz for $bold(E)$ and $bold(B)$ we find
$
  plus.minus i k bold(E)_t - grad_t E_z + i omega bold(hat(z)) times bold(B)_t &= 0 \
  plus.minus i k bold(B)_t - grad_t B_z - i mu epsilon.alt omega bold(hat(z)) times bold(E)_t &= 0,
$
which can be solved for $bold(E)_t$ and $bold(B)_t$
$
  bold(E)_t &= i/(mu epsilon.alt omega^2 - k^2) [plus.minus k grad_t E_z - omega bold(hat(z)) times grad_t B_z] \
  bold(B)_t &= i/(mu epsilon.alt omega^2 - k^2) [plus.minus k grad_t B_z + mu epsilon.alt omega bold(hat(z)) times grad_t E_z].
$
This shows $bold(E)_t$ and $bold(B)_t$ are determined by $E_z$ and $B_z$.

== Applying boundary conditions
By the above we only need to determine the boundary conditions for $E_z$ and $B_z$. With $bold(n)$ being the normal of the waveguide boundary $S$ we have ($bold(E) = 0$ and $bold(B) = 0$ in a conductor)
$
  bold(n) times bold(E) = 0",  " bold(n) dot bold(B) = 0,
$
or
$
  evaluated(E_z)_S = 0",  " evaluated(bold(n) dot bold(B)_t)_S = 0.
$
We can massage the condition on $bold(B)_t$ by
$
  0 &= evaluated(plus.minus i k underbracket(bold(n) dot bold(B)_t, 0) - bold(n) dot grad_t B_z - i mu epsilon.alt omega bold(n) dot (bold(hat(z)) times bold(E)_t))_S \
  &=^"cyclicity" evaluated(- bold(n) dot grad_t B_z - i mu epsilon.alt omega underbracket(bold(hat(z)) dot (bold(E)_t times bold(n)), 0))_S \
  &= - evaluated(bold(n) dot grad_t B_z)_S,
$
implying
$
  evaluated(E_z)_S & = 0",  " evaluated(pdv(B_z, n))_S = 0.
$
Here, one is a Dirichlet boundary condition, while the other is a Neumann boundary condition. This is strange since these are typically satisfied for different values of $omega$ and $k$. However, we assume $bold(E)$ and $bold(B)$ have the same frequency and wavenumber. This is useful since we can pick $E_z = 0$ or $B_z = 0$.

1. Suppose $B_z = 0$ and $ evaluated(E_z)_S = 0. $ This is called a TM wave.

2. Suppose $E_z = 0$ and $ evaluated(pdv(B_z, n))_S = 0. $ This is called a TE wave.

3. Suppose both $E_z = 0$ and $B_z = 0$. This implies $ grad_t dot bold(E)_t = 0",  " grad_t times bold(E)_t = 0. $ Hence, $bold(E)_t$ is the solution to an electrostatic problem. This is non-trivial and is still a plane wave travelling along $z$ due to time-dependence. This is called a TEM wave.

The TEM waves are weird.

1. We find $bold(E)_t = 0$ and $bold(B)_t = 0$ using our "naïve" expressions. However, since $laplacian_t bold(E)_t = 0$ we obtain#footnote[i.e. no transverse momentum.] $ omega^2 mu epsilon.alt - k^2 = 0, $ and the denominator in our expressions for $bold(E)_t$ and $bold(B)_t$ diverge.

2. With $B_z = 0$ we find $ plus.minus i k bold(B)_t - i mu epsilon.alt omega bold(hat(z)) times bold(E)_t &= 0, $ or $ bold(B)_t = plus.minus sqrt(mu epsilon.alt) bold(hat(z)) times bold(E)_t. $ This implies $bold(E)$ and $bold(B)$ are mutually orthogonal and also orthogonal to the direction of propagation. Hence, TEM waves are plane waves.

3. TEM waves are not allowed in a single hollow cylindrical conductor. The boundary condition for $Phi$ defined by $bold(E)_t = -grad_t Phi$ and satisfying $laplacian_t Phi = 0$ is Dirichlet $Phi_S = C$. Taking $Phi = C$ inside is clearly a solution, and by uniqueness this is the only solution. Thus $bold(E)_t = 0$ everywhere. With two cylinders with differing $Phi_S$ other solutions are possible.

== On cutoffs and modes
With either $B_z = 0$ or $E_z = 0$ we find
$
  bold(H)_t = plus.minus 1/Z bold(hat(z)) times bold(E)_t,
$
where
$
  Z & =^"TM" k/(epsilon.alt omega) \
    & =^"TE" (mu omega)/k,
$
and $plus.minus$ depends on $e^(plus.minus i k z)$.

Recall our ansatz
$
  bold(E) = bold(E)(x,y) e^(plus.minus i k z - i omega t),
$
we will define $psi$ by
$
  E_z & =^"TM" psi(x, y) e^(plus.minus i k z) \
  H_z & =^"TE" psi(x, y) e^(plus.minus i k z).
$
Then we eventually find
$
  bold(E)_t (x,y) & =^"TM" plus.minus (i k)/gamma^2 grad_t psi \
  bold(H)_t (x,y) & =^"TE" plus.minus (i k)/gamma^2 grad_t psi,
$
where
$
  gamma^2 = mu epsilon.alt omega^2 - k^2.
$
This implies $gamma^2$ is the eigenvalue of $laplacian_t$
$
  (laplacian_t + gamma^2) psi & = 0.
$
Here, $gamma$ measures the transverse momentum of a TE or TM wave. Then in addition to propagating along $z$ with momentum $k$ these waves also "bounce around" in the transverse direction.#footnote[TEM waves have $gamma = 0$ which matches them only "moving" longitudinally.]

This relation also constrains $k$ since
$
  k^2 = mu epsilon.alt omega^2 - gamma^2,
$
which only depends on $gamma$ (i.e. the boundary conditions and geometry) since $omega$ is fixed.

1. The spectrum of $gamma$ is usually discrete. We will denote the spectrum of eigenfunctions and eigenvalues by $psi_lambda$ and $gamma_lambda$ with $lambda = 1,2,dots$ These determine $k_lambda$ for various modes $lambda$ $ k_lambda^2 = mu epsilon.alt omega^2 - gamma_lambda^2. $ Here, $k_lambda in RR$ if $omega$ is above some cutoff frequency $ omega_lambda = gamma_lambda/sqrt(mu epsilon.alt). $ Any modes with $omega < omega_lambda$ will decay exponentially along $z$ since $k_lambda in i RR$.

2. TM and TE waves generally have $ {k_lambda^"TM"} eq.not {k_lambda^"TE"}. $

3. The $lambda$-mode with $omega_1$ (i.e. $lambda = 1$) is called the fundamental mode, and typically waveguides are operated with $omega_1 < omega < omega_2$. This means all modes except the fundamental mode will decay exponentially (evanescent modes).

4. We have $ abs(k_lambda) < sqrt(mu epsilon.alt) omega, $ implying modes inside a waveguide travel quicker(!) than their corresponding free wave $ v_p = omega/k_lambda > 1/sqrt(mu epsilon.alt). $ When $k_lambda -> 0$ we even have $v_p -> oo$!

=== An example
Consider TE waves in a rectangular waveguide with $0 <= x <= a$ and $0 <= y <= b$. The equation for $psi = H_z e^(plus.minus i k z)$ is
$
  0 & = (laplacian_t + gamma^2) psi \
    & = (pdv(, x, 2) + pdv(, y, 2) + gamma^2) psi,
$
with Neumann boundary conditions
$
  evaluated(pdv(psi, n))_S = 0.
$
Applying separation of variables with $psi = X(x) Y(y)$ we obtain
$
  1/X dv(X, x, 2) + 1/Y dv(Y, y, 2) + gamma^2 = 0,
$
or
$
  dv(X, x, 2) = - alpha^2 X",  " dv(Y, y, 2) = - beta^2 Y.
$
Consider the $x$-equation which is solved by
$
  X = A sin alpha x + B cos alpha x.
$
The boundary condition requires
$
  0 & = evaluated(pdv(X, x))_(x = 0)",  " 0 & = - evaluated(pdv(X, x))_(x = a).
$
These imply
$
  0 & = alpha A,
$
or $A = 0$ and
$
  0 & = alpha B sin alpha a,
$
or
$
  alpha = (pi m)/a.
$
Hence,
$
  X = X_0 cos ((pi m x)/a),
$
and similarly for $Y$
$
  Y = Y_0 cos ((pi n y)/b).
$
Then our $psi$ is
$
  psi_(m n) (x,y) = H_0 cos ((m pi x)/a) cos((n pi y)/b),
$
with
$
  gamma_(m n)^2 & = ((pi m)/a)^2 + ((pi n)/b)^2,
$
and
$
  omega_(m n) & = pi/sqrt(mu epsilon.alt) sqrt(m^2/a^2 + n^2/b^2).
$
The fundamental mode (or smallest $omega_(m n)$) depends on $a$ and $b$. Whatever the case then the TM modes have higher frequencies than their corresponding TE modes. Hence, the TE modes are "more" useful.#footnote[This occurs since $cos -> sin$ when switching from Neumann to Dirichlet BC.]

== On power
The power of a $lambda$-mode in the waveguide is given by the time-averaged Poynting vector
$
  P & = integral_A expval(bold(S)) dot bold(hat(z)) dd(a) \
    & = 1/2 integral_A Re [(bold(E) times bold(H)^*) dot bold(hat(z))] dd(a)
$
where $A$ is the waveguide cross-section.

Consider a TM mode with $H_z = 0$. Here,
$
  bold(E) times bold(H)^* &= (bold(E)_t + E_z bold(hat(z))) times (bold(H)_t^* + H_z^* bold(hat(z))) \
  &= bold(E)_t times bold(H)_t^* + H_z^* bold(E)_t times bold(hat(z)) + E_z bold(hat(z)) times bold(H)_t^* + E_z H_z^* bold(hat(z)) times bold(hat(z)) \
  &= bold(E)_t times bold(H)_t^* + H_z^* bold(E)_t times bold(hat(z)),
$
and acting with $dot bold(hat(z))$ kills the second term. Hence,
$
  (bold(E) times bold(H)^*) dot bold(hat(z)) = (bold(E)_t times bold(H)_t^*) dot bold(hat(z)).
$
Then for a TM mode
$
  bold(E)_t times bold(H)_t^* &= [plus.minus (i k_lambda)/gamma_lambda^2 grad_t psi] times [plus.minus (epsilon.alt omega)/k_lambda bold(hat(z)) times bold(E)_t^*] \
  &= [i (epsilon.alt omega)/gamma_lambda^2 grad_t psi ] times [bold(hat(z)) times minus.plus (i k_lambda)/gamma_lambda^2 (grad_t psi)^*] \
  &= plus.minus (epsilon.alt omega k_lambda)/gamma_lambda^4 grad_t psi times [bold(hat(z)) times (grad_t psi)^*],
$
acting with $dot bold(hat(z))$ we obtain
$
  (bold(E)_t times bold(H)^*_t) dot bold(hat(z)) = plus.minus (epsilon.alt omega k_lambda)/gamma_lambda^4 abs(grad_t psi)^2,
$
implying
$
  P & =^"TM" plus.minus (epsilon.alt omega k_lambda)/(2 gamma_lambda^4) integral_A abs(grad_t psi)^2 dd(a).
$
By definition
$
  psi^* laplacian_t psi = - gamma_lambda^2 abs(psi)^2,
$
and by Green's theorem
$
  integral_A psi^* laplacian_t psi dd(a) &= underbracket(integral.cont_(dd(A, d: partial)) psi^* pdv(psi, n) dd(l), 0 "by BC") - integral_A abs(grad_t psi)^2 dd(a).
$
Hence#footnote[Here, the $+$ corresponds to TM waves propagating "forward".],
$
  P =^"TM" plus.minus (epsilon.alt omega k_lambda)/(2 gamma_lambda^2) integral_A abs(psi)^2 dd(a),
$
and similarly TE modes
$
  P & =^"TE" plus.minus (omega k_lambda)/(2 mu gamma_lambda^2) integral_A abs(psi)^2 dd(a).
$
Likewise, we can find the energy density per length by considering
$
  expval(u) = 1/4 (epsilon.alt abs(bold(E))^2 + mu abs(bold(H))^2),
$
and computing
$
  U & = integral_A expval(u) dd(a).
$
Consider a TM mode with $H_z = 0$. Here,
$
  abs(bold(E))^2 & = abs(psi)^2 + k_lambda^2/gamma_lambda^4 abs(grad_t psi)^2 \
  abs(bold(H))^2 & = (epsilon.alt^2 omega^2)/gamma_lambda^4 abs(grad_t psi)^2.
$
Hence,
$
  U &= epsilon.alt/4 integral_A (abs(psi)^2 + (k_lambda^2 + mu epsilon.alt omega^2)/gamma_lambda^4 abs(grad_t psi)^2) dd(a) \
  &=^"Green's" epsilon.alt/4 (1 + (k_lambda^2 + mu epsilon.alt omega^2)/gamma_lambda^2) integral_A abs(psi)^2 dd(a),
$
with $gamma_lambda^2 = mu epsilon.alt omega^2 - k_lambda^2$ this simplifies as
$
  U & =^"TM" epsilon.alt/2 (omega/omega_lambda)^2 integral_A abs(psi)^2 dd(a),
$
and similarly for TE modes
$
  & =^"TE" 1/(2 mu) (omega/omega_lambda)^2 integral_A abs(psi)^2 dd(a),
$

Combining these we can determine the "speed" with which energy flows
$
  P/U = k_lambda/omega 1/(epsilon.alt mu).
$


1. This is the group velocity of the $lambda$-mode $ v_g^((lambda)) &= evaluated(dv(omega, k))_(k=k_lambda) \
  &= 1/sqrt(epsilon.alt mu) evaluated(dv(, k) sqrt(k^2+gamma_lambda^2))_(k=k_lambda) \
  &= k_lambda/omega 1/(epsilon.alt mu). $

2. We have $ abs(k_lambda) < sqrt(mu epsilon.alt) omega, $ implying this speed is smaller(!) than the speed a corresponding wave would have outside the waveguide.

3. Taking $k_lambda -> 0$ implies $P -> 0$ and $v_g^((lambda)) -> 0$. This is what we'd expect, since the $lambda$-mode deactives and becomes evanescent.

== Non-ideal conductors
We'll now assume the walls of our waveguide is a non-ideal conductor. This simply means there'll be an electric field
$
  bold(E) eq.not 0,
$
inside the conducting walls. This non-zero electric field induces a current density determined by Ohm's law
$
  bold(J) = sigma bold(E),
$
where the conductivity $sigma$ depends on the conductor.

Consider an ideal conductor. We'll denote fields inside the conductor by $bold(E)_c$ and fields outside by $bold(E)$. With an ideal conductor we have $bold(E)_c = 0$ and $bold(B)_c = 0$. Recall,
$
      (bold(D)-bold(D)_c) dot bold(n) & = Sigma \
    (bold(E)-bold(E)_c) times bold(n) & = 0 \
    (bold(B) - bold(B)_c) dot bold(n) & = 0 \
  (bold(H) - bold(H)_c) times bold(n) & = bold(K),
$
where $Sigma$ is the surface charge density, and $bold(K)$ is the surface current. Then outside an ideal conductor we'll have
$
  abs(bold(D)_perp) = sigma",  " abs(bold(H)_parallel) = abs(bold(K))",  " bold(D)_parallel &= 0",  " bold(H)_perp = 0.
$

Consider instead a "good" conductor. This essentially means we'll allow small deviations from the above. There'll typically be a thin layer near the "top" where fields are non-zero and decay exponentially
$
  abs(bold(E)_c) tilde e^(-xi\/delta),
$
where $xi$ measures the distance from the interface, and $delta$ is the skin depth.

To proceed we'll assume only $bold(E)_perp$ and $bold(H)_parallel$ are non-zero (as with ideal conductors). We'll also assume $bold(K) = 0$ implying
$
  bold(n) times (bold(H) - bold(H)_c) = 0.
$
Then if there is some $bold(H)_parallel eq.not 0$ outside, the same field will also be inside (near the surface). This is also true for $bold(E)_parallel$. Maxwell's equations then become
$
  bold(E)_c & tilde.eq^"Ohm's" bold(J)/sigma \
  & tilde.eq^(J_"displacement" tilde.eq 0) 1/sigma curl bold(H)_c \
  & tilde.eq^(grad tilde.eq - bold(n) partial_xi) - 1/sigma bold(n) times pdv(bold(H)_c, xi),
$
and
$
  bold(H)_c & eq^"Faraday's" - i/(mu_c omega) curl bold(E)_c \
            & tilde.eq i/(mu_c omega) bold(n) times pdv(bold(E)_c, xi).
$
These imply
$
  [pdv(, xi, 2) + (2 i)/delta^2] (bold(n) times bold(H)_c) tilde.eq 0",  " bold(n) dot bold(H)_c tilde.eq 0,
$
with
$
  delta = (2/(mu_c omega sigma))^(1\/2).
$
One solution is
$
  bold(H)_c = bold(H)_parallel e^(-xi\/delta) e^(i xi\/delta),
$
where $bold(H)_parallel$ is evaluated at $xi = 0$. We also obtain
$
  bold(E)_c = sqrt((mu_c omega)/(2 sigma)) (1 - i)(bold(n) times bold(H)_parallel) e^(-xi\/delta) e^(i xi\/delta).
$

1. Both $bold(E)_c$ and $bold(H)_c$ decay exponentially inside the conductor.

2. They differ by a phase.

3. The field $abs(bold(H)_c)$ is much larger than $abs(bold(E)_c)$.

By the boundary conditions there is also a small field $bold(E)_parallel$ outside the conductor equal to $bold(E)_c$ evaluated at $xi = 0$
$
  bold(E)_parallel = sqrt((mu_c omega)/(2 sigma)) (1-i) (bold(n) times bold(H)_parallel).
$
We've only assumed $bold(H)_parallel eq.not 0$ (on the surface) and found there is also a non-zero $bold(E)_parallel$. Hence, the Poynting vector is non-zero on the surface
$
  bold(S) dot bold(n) eq.not 0,
$
implying there is some flow of energy through the surface. We find
$
  dv(P, a) & = - expval(bold(S)) dot bold(n) \
           & = - 1/2 Re [(bold(E) times bold(H)^*) dot bold(n)] \
           & = (mu_c omega delta)/4 abs(bold(H)_parallel)^2.
$
Consider Ohm's law
$
  bold(J) &= sigma bold(E)_(c,parallel) \
  &= (1-i)/delta (bold(n) times bold(H)_(c,parallel)) e^(-xi\/delta) e^(i xi\/delta).
$
By integrating over all $delta$ we find $bold(K)_"eff"$
$
  bold(K)_"eff" & = integral_0^oo bold(J) dd(xi) \
                & = bold(n) times bold(H)_parallel,
$
implying#footnote[This agrees with Ohm's law $P = I^2 R$.]
$
  dv(P, a) & = underbracket(1/(2 sigma delta), "surface resistance") abs(bold(K)_"eff")^2.
$
This also tells us a "good" conductor behaves like an ideal conductor with $bold(K) -> bold(K)_"eff"$.

== Loss in waveguides
Recall $P$ depends on the fields $psi$, which lose energy as they propagate. This implies the power also experiences some decay along $z$
$
  P(z) = P_0 e^(-2 beta_lambda z),
$
where $beta_lambda$ is a decay constant, which could depend on the specific $lambda$-mode propagating.

We can determine $beta_lambda$ by solving
$
  beta_lambda = - 1/(2 P) dv(P, z).
$
This is computed as
$
  -dv(P, z) & = - integral.cont_C dv(P, a) dd(l) \
  &= - integral.cont_C 1/(2 sigma delta) abs(bold(K)_"eff")^2 dd(l) \
  &=^#footnote[This follows from $bold(K)_"eff" = bold(n) times bold(H)_parallel$.] 1/(2 sigma delta) integral.cont_C abs(bold(n) times bold(H))^2 dd(l) \
  &=^"TM" 1/(2 sigma delta) (omega^2 epsilon.alt^2)/(gamma_lambda^4) integral.cont_C abs(bold(n) dot grad_t E_z)^2 dd(l),
$
where $C$ is a slice of the boundary.
