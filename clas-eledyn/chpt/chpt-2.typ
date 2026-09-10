#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Finding $Phi$ and boundary-value problems
== Electric fields across surface distributions
Let $S$ be a surface with normal $bold(n)$ directed from "side 1" toward "side 2"#footnote[Think of $bold(n)$ as piercing the surface.], and suppose there is a charge density $sigma(bold(x))$ on the surface. By this we mean an area $dd(A, d: delta)$ carries charge $dd(Q, d: delta)$ given by
$
  dd(Q, d: delta) = integral_(dd(A, d: delta)) sigma(bold(x)) dd(x, 2).
$
Now, consider a small cylinder $C$ with circular area $dd(A, d: delta)$. The cylinder has a small enough height, such that the two circular faces lie on opposite sides of $S$.

Applying Gauss' law one obtains
$
  phi_C (bold(E)) = integral.cont_C bold(E) dot bold(n) dd(a) tilde.eq dd(A, d: delta) (bold(E)_2 dot bold(n) - bold(E)_1 dot bold(n)) = dd(Q, d: delta)/epsilon.alt_0 = (sigma dd(A, d: delta))/epsilon.alt_0.
$
We only include contributions from the circular faces, and take $dd(A, d: delta)$ small enough, such that the fields $bold(E)_i$ are approximately constant across the faces.#footnote[The minus sign comes from $bold(n)_1 = - bold(n)_2$.] Taking $dd(A, d: delta) -> dd(A)$ we find an equation for the discontinuity of $E_perp$ across surface distributions
$
  (bold(E)_2 (bold(x)) - bold(E)_1 (bold(x))) dot bold(n) = E_(2,perp) (bold(x)) - E_(1,perp) (bold(x)) = (sigma (bold(x)))/epsilon.alt_0,
$
which holds for any $bold(x) in S$.

However, the parallel component of $bold(E)$ is continuous across $S$. This can be seen by considering a small rectangle across $S$ with two longs sides, and negligible height.#footnote[This rectangle "pops" out of $S$.] Then single-valuedness of the scalar potential implies continuity of $E_parallel$
$
  0 =^"well-defined" integral.cont bold(E) dot dd(bold(l)) tilde.eq (bold(E)_2-bold(E)_1) dot underbracket(bold(t) L, bold(L)),
$
where $bold(t)$ is the unit tangent to the rectangle's sides running parallel to $S$, and $L$ is the length of the rectangle. We are free to change the orientation, meaning $bold(t)$ is an arbitrary tangent to $S$. This implies the electric field along any direction tangent to $S$ is continuous across $S$
$
  bold(E)_(2,parallel) = bold(E)_(1,parallel).
$

== Conductors as Dirichlet boundaries
Conductors are materials capable of storing charge, inside which the electric field vanishes. This is the case since if $bold(E) eq.not 0$ there would be a force $bold(F) = q bold(E)$ on the charges inside the conductor, leading to a redistribution of charge (since charges can move in a conductor). This means any (small) electric field inside a conductor will immediately be counterbalanced by such a redistribution. An immediate consequence of this is all points are equipotential
$
  Phi(bold(x)) = "constant.   (in conductors)"
$
The presence of a conductor is therefore equivalent to the presence of a surface $S$ where the potential has some fixed value. This makes conductors a typical example of Dirichlet boundary conditions.

The above immediately implies the electric field at the surface of a conductor has no component parallel to the surface, otherwise we would have a variation of the scalar potential $E_parallel = - grad_parallel Phi eq.not 0$, which is a contradiction. The electric field at the surface must therefore be normal to the surface
$
  bold(E)_parallel = 0",  " bold(E) = bold(E)_perp".   (outside a conductor's surface)"
$
Now, to compute the potential (in the presence of conductors) we only need to know the Green's function $G_D$! This guy depends on the shape of our conductor, and can only be found on a case-by-case basis.

== Method of images
The method of images is based on the idea that the presence of a conductor on a surface $S$ can be "simulated" by some appropriate configuration of charges $rho(bold(x))$
$
  "conductor on" S arrow.dotted rho(bold(x)) "with" Phi(S) = "constant".
$
This allows one to replace the potentially annoying boundary condition for $Phi(bold(x))$ with new "imaginary" sources whose contribution to $Phi(bold(x))$ is easily computed.#footnote[e.g. by Coulomb's.] We will now cover some simple examples.

=== Grounded conducting sphere
Consider a spherical conductor centered at the origin with radius $a$, in presence of a pointlike charge $q$ located at $bold(y)$ with $abs(bold(y)) > a$ (so $q$ is outside). We assume the sphere is grounded, meaning
$
  Phi(abs(bold(x)) = a) = 0.
$
To determine the potential elsewhere, we make the ansatz that the conducting sphere can be modeled by a single pointlike charge $q'$ at some $bold(y)'$. By symmetry we take $bold(y)' = c bold(y)$ for some $0 < c < 1$, meaning both lie along the same ray. Let $bold(n)_q$ be the unit vector of this ray.

The potential would then be
$
  Phi(bold(x)) &= q/(4 pi epsilon.alt_0) 1/abs(bold(x)-bold(y)) + (q')/(4 pi epsilon.alt_0) 1/abs(bold(x)-bold(y)') \
  &= q/(4 pi epsilon.alt_0) 1/(x abs(bold(n)- y/x bold(n)_q)) + (q')/(4 pi epsilon.alt_0) 1/(y' abs(x/y' bold(n) - bold(n)_q)),
$
where $bold(n)$ is the unit vector for the observation point $bold(x)$. Requiring this vanishes at $abs(bold(x)) = a$ leads to
$
  q/a = - q'/y'",  " y/a = a/y',
$
or
$
  q' = - a/y q",  " y' = a^2/y.
$
With the potential found we can determine $bold(E)$ by taking the gradient. Likewise, we can determine the surface charge density (since $bold(E)_"in" = 0$ and $E_parallel = 0$ on the conductor)
$
  sigma = epsilon.alt_0 underbracket((- pdv(Phi, n))_(x=a), display(bold(E)_"out" dot bold(n))) = - q/(4 pi a^2) q/y (1- a^2\/y^2)/(1+a^2\/y^2 - 2 a/y cos gamma)^(3\/2),
$
where $gamma$ is the angle between $bold(x)$ (on the sphere) and the direction of $bold(y)$ ($bold(n) dot bold(n)_q = cos gamma$).

1. We find $q$ induces a charge distribution on the grounded sphere of opposite sign. We would expect this from Coulomb's law, since the charges of opposite sign would be the ones moving around in the conductor to come closer to $q$, until reaching equilibrium.

2. The total induced charge on the sphere is $ integral.cont_S sigma dd(a) = integral.cont_S epsilon.alt_0 (-pdv(Phi, n))_(x=a) dd(a) = integral.cont_S epsilon.alt_0 bold(E) dot bold(n) dd(a) = epsilon.alt_0 phi_S (bold(E)) =^"Gauss' law" q', $ where we apply Gauss' law on the field configuration including the image charge.

3. The distribution peaks when $gamma = 0$, meaning charges confined to the conductor try to be as close as possible to $q$. The spread of the peak is determined by the coefficient of $cos gamma$. When $a\/y$ is large the angular dependence becomes more important. This is the case when the charge is close to the conductor.

The charge inducing a charge distribution on the conductor leads to a backreaction on the charge. This occurs since the induced distribution produces its own electric field $bold(E)_sigma$, which exerts a force $bold(F) = q bold(E)_sigma$ on the pointlike charge. The field is trivial to compute since it is equivalent to the one produced by the pointlike image charge. We find
$
  abs(bold(F)) & = 1/(4 pi epsilon.alt_0) (q q')/(y-y')^2 = 1/(4 pi epsilon.alt_0) q^2/a^2 (a/y)^3 (1- a^2/y^2)^(-2).
$
Consider two limits:

1. When $y >> a$ $ abs(bold(F)) tilde y^(-3), $ which is not Coulomb's law! This is the case because the sphere is grounded, meaning $q'$ depends on $y$.

2. When $y tilde a$ the force becomes Coulomb-like $ abs(bold(F)) tilde (y-a)^(-2). $ This makes sense considering the induces charge distribution becomes highly peaked whenever $q$ is close to the sphere.#footnote[The distribution resembles a pointlike charge.]

=== Charged insulated conducting sphere
Consider a spherical conductor as before, but now we take it to be insulated (as opposed to grounded). This implies that the charge $Q eq.not 0$ stored in the conductor is conserved, although it can still move around on $S$ to achieve $bold(E)_parallel = 0$.

The solution to this can be found from the grounded case. Starting with a grounded sphere, then the presence of a pointlike charge $q$ at $bold(y)$ induces a charge $q'$ over $S$ as before. Now, we disconnect the conductor from ground, and add charge $Q - q'$ to the conductor. The total charge on the conductor is then $q' + (Q-q') = Q$ as required. The charge $Q-q'$ will distribute itself uniformly over $S$, since the induced $q'$ on the sphere is already in equilibrium with $q$. We can therefore model the additional charge as a pointlike charge $Q-q'$ placed at the origin
$
  Phi(bold(x)) = 1/(4 pi epsilon.alt_0) [q/abs(bold(x)-bold(y)) - (a q)/(y abs(bold(x) - a^2/y^2 bold(y))) + (Q + a/y q) 1/abs(bold(x))].
$
Likewise, the force on $q$ is (probe approximation for $q$)
$
  bold(F) = q bold(E)_"sphere" = 1/(4 pi epsilon.alt_0) q/y^2 [Q- (q a^3 (2 y^2 - a^2))/(y(y^2-a^2)^2)] bold(y)/y,
$
where $bold(E)_"sphere"$ is sourced by the two image charges. There are some notable difference as compared to the grounded sphere:#footnote[When $Q = 0$ some things change, importantly the Coulomb potential disappears.]

1. When $y >> a$ this agrees with Coulomb's law $ abs(bold(F)) tilde (k q Q)/y^2, $ since the sphere resembles a point charge $Q$.

2. When $Q q < 0$ the force is always attractive.

3. When $Q q > 0$ the force is repulsive beyond a certain distance. There is an unstable equilibrium $y_*$ where $bold(F) = 0$. The induced distribution (dipole-ish) dominates when $y tilde a$.

=== Conducting sphere in uniform electric field
Consider a spherical conductor of radius $a$ in a uniform electric field $bold(E) = (0,0,E_0)$. We model the background field by introducing pointlike charges $plus.minus Q$ placed at $z = minus.plus R$. Taking $R$ to be large, then this gives a field along the $z$-axis with
$
  E_0 tilde.eq 2 1/(4 pi epsilon.alt_0) Q/R^2.
$
Now, we place a conducting sphere of radius $a << R$ at the origin. The effect of the background can be computed using the method of images, since we model the field by pointlike charges#footnote[The $q'$ and $bold(y)'$ are analogous to the conducting sphere with a pointlike charge $q$.]
$
  plus.minus Q "at" bold(y)_plus.minus = (0,0,minus.plus R) arrow.dotted^"images" minus.plus Q a/R "at" bold(y)'_plus.minus = (0,0,minus.plus a^2/R).
$
We use coordinates $bold(x) tilde (r,theta)$, with $r$ being the distance from the origin, and $theta$ being the angle between $bold(x)$ and the $z$-axis. The total potential is then the sum of our four charges
$
  Phi = 1/(4 pi epsilon.alt_0) [&Q/(r^2 + R^2 + 2 r R cos theta)^(1\/2) - Q/(r^2 + R^2 - 2 r R cos theta)^(1\/2) \
    &- (a Q)/(R(r^2 + a^4/R^2 + (2 a^2 r)/R cos theta)^(1\/2)) + (a Q)/(R (r^2 + a^4/R^2 - (2 a^2 r)/R cos theta)^(1\/2))].
$
Our approximation where the background created by $plus.minus Q$ is uniform is only valid when $r <<R$. Hence, we expand the above for $r << R$
$
  Phi & = - 1/(4 pi epsilon.alt_0) (2 Q)/R^2 r cos theta (1 - a^3/r^3) + dots \
  & = underbracket(- E_0 r cos theta, "pure background field") overbracket((1 - a^3/r^3), "distortion from sphere" #linebreak() "dipole-like") + dots
$
The distortion is caused by an induced charge density $sigma(bold(x))$ on the sphere
$
  sigma = epsilon.alt_0 (-pdv(Phi, n))_(x=a) = 3 epsilon.alt_0 E_0 cos theta.
$
This charge distribution is a dipole, since $sigma tilde cos theta$. By symmetry (or Gauss' law) the total charge on the conductor vanishes, meaning an insulated sphere would lead to the same conclusions.#footnote[Grounding the sphere does nothing, since no charges need to move from "ground" to the conductor in order to balance $bold(E)$.]

== Green's function for the sphere
Consider a spherical surface of radius $a$ centered at $bold(x)_0 = bold(0)$ with a given potential $Phi_S (theta,phi.alt)$ (on the surface). Suppose there is a charge distribution $rho(bold(x))$ outside the sphere. We would like to determine the potential outside the sphere: $abs(bold(x)-bold(x)_0) > a$, imposing Dirichlet boundary conditions $Phi(abs(bold(x)-bold(x)_0) = a) = Phi_S$. The missing piece is the Dirichlet Green's function $G_D$.

The defining equation for the Green's function is
$
  nabla'^2 G(bold(x),bold(x)') = - 4 pi delta^((3)) (bold(x)-bold(x)').
$
This says $G(bold(x),bold(x)')$ is a solution to the Poisson equation with a pointlike source in the region $V$ (outside the sphere in this case). The Green's function is simply the potential at $bold(x)$ due to a pointlike source at $bold(x)'$ (with suitable boundary conditions on some surface $S$). We require homogeneous Dirichlet boundary conditions: $G_D (bold(x),bold(x)') = 0$ whenever $abs(x) = a$.#footnote[This should be the case even if the potential has non-zero boundary values. The Poisson equation is a linear equation, meaning if $Phi_1$ and $Phi_2$ are solutions, then any linear combination of them is also a solution $ nabla'^2 underbracket([sum_i q_i G_D (bold(x),bold(x)'_i)], Phi) = - 4 pi underbracket(sum_i q_i delta^((3)) (bold(x)-bold(x)'_i), rho). $ The total potential $Phi$ satisfies the Dirichlet boundary condition if each Green's function does. Hence, the potential $Phi$ with multiple sources is simply the sum of the Green's functions $G_D (bold(x),bold(x)'_i)$ for each pointlike source. However, boundary conditions also add up. When $Phi_i (S) = 0$ then their sum satisfies the same condition (obviously). This is why these Green's functions are useful. When $Phi_i (S) = c$ the problem can be treated by adding an overall background constant. ]


Then solving for $G_D (bold(x),bold(x)')$ is equivalent to computing the potential outside a grounded conducting sphere with a pointlike charge of magnitude $q = 4 pi epsilon.alt_0$ at $bold(x)'$!#footnote[Compare with $ laplacian Phi = - rho/epsilon.alt_0 =^"pointlike particle" - q/epsilon.alt_0 delta^((3)) (bold(x)-bold(x)') $] We have already solved this problem (our first example)
$
  G_D (bold(x),bold(x)') &= 1/abs(bold(x)-bold(x)') - a/(x' abs(bold(x) - a^2/(x'^2) bold(x)')) \
  &= 1/(x^2+x'^2 - 2 x x' cos gamma)^(1\/2) - 1/[((x x')/a)^2 + a^2 - 2 x x' cos gamma]^(1\/2),
$
where $gamma$ is the angle between $bold(x)$ and $bold(x)'$.

Now, we can compute the potential using
$
  Phi(bold(x)) = 1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G_D (bold(x),bold(x)') dd(x', 3) - 1/(4 pi) integral.cont_S Phi_S (bold(x)') pdv(, n') G_D (bold(x),bold(x)') dd(a').
$
As a warmup, consider the case when $Phi_S = 0$
$
  Phi(bold(x)) = 1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G_D (bold(x),bold(x)') dd(x', 3).
$
One easily sees this potential satsifies (using the definition of $G_D$)
$
  laplacian Phi = - rho/epsilon.alt_0",  " Phi_S = 0,
$
as desired.

Now, consider the more general Dirichlet boundary conditions
$
  Phi (abs(x) = a) = Phi_S (a, theta,phi.alt).
$
We find
$
  Phi(bold(x)) = underbracket(1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G_D (bold(x),bold(x)') dd(x', 3), "potential in" V "due to conductor at" S) - underbracket(1/(4 pi) integral.cont_S Phi_S (a, theta',phi.alt') pdv(, n') G_D (bold(x),bold(x)') dd(a'), "correction term"),
$
which can be evaluated by noting#footnote[This becomes a delta function (ish) in $theta$ and $phi.alt$ as $abs(bold(x)) -> a$.]
$
  (pdv(G_D, n'))_(abs(bold(x)')=a) = - (x^2-a^2)/(a(x^2 + a^2 - 2 a x cos gamma)^(3\/2)),
$
and $dd(a') = a^2 dd(Omega')$, where $dd(Omega')$ is the solid angle at a point $(a, theta', phi.alt')$ and
$
  cos gamma = cos theta cos theta' + sin theta sin theta' cos(phi.alt - phi.alt').
$

== Separation of variables
Another technique we could use is separation of variables. However, this typically requires our problem has symmetry. The main idea is to exchange a single PDE in several variables to several (solvable) single-variable ODEs. This being possible depends on the given PDE, however, the Laplace equation has this property.

The Laplace equation is (in Cartesian coordinates)
$
  pdv(Phi, x, 2) + pdv(Phi, y, 2) + pdv(Phi, z, 2) = 0.
$
There is a class of solutions in the form
$
  Phi(x, y, z) = X(x) Y(y) Z(z),
$
for which the Laplace equation becomes
$
  1/X dv(X, x, 2) + 1/Y dv(Y, y, 2) + 1/Z dv(Z, z, 2) = 0.
$
This should hold for arbitrary $x, y, z$ implying
$
  dv(X, x, 2) = - alpha^2 X",  " dv(Y, y, 2) = -beta^2 Y",  " dv(Z, z, 2) = gamma^2 Z,
$
with $alpha^2 + beta^2 = gamma^2$. The solution is given by
$
  X = e^(plus.minus i alpha x)",  " Y = e^(plus.minus i beta y)",  " Z = e^(plus.minus i gamma z),
$
with the allowed frequencies depending on the boundary conditions. This solution is special, however, it can be shown that the general solution to the Laplace equation is a linear combination of such "product solutions".#footnote[Orthonormality and completeness is a general property of higher-dimensional Sturm-Liouville problems (like the Laplace equation).]

=== 3D box with conducting boundaries
Consider a rectangular box of sides $(a, b, c)$, where the boundaries are conductors with $Phi = 0$ except for the top one ($z = c$) which has
$
  Phi(x, y, c) = V(x,y),
$
for some arbitrary function $V(x,y)$.

Applying separation of variables, we find (using $Phi(x=0) = Phi(x=a) = 0$ etc.)
$
  X & = sin alpha_n x",  " alpha_n = (n pi)/a \
  Y & = sin beta_m x",  " beta_m = (m pi)/b \
  Z & = sinh gamma_(n m) z = sinh(sqrt(alpha_n^2 + beta_m^2) z).
$
Then by linearity, a linear combination of these is also a solution. We demand this general linear combination, with coefficients $A_(n m)$, satisfies the final boundary condition
$
  Phi(x, y, c) = sum_(n, m = 1)^oo A_(n m) sin (alpha_n x) sin (beta_m y) sinh(gamma_(n m) c) = V (x,y).
$
This is a Fourier series in $(x, y)$, meaning it can be inverted to identify $A_(n m) sinh(gamma_(n m) c)$ as the Fourier coefficients of $V(x,y)$
$
  A_(n m) sinh(gamma_(n m) c) = 2/a 2/b integral_0^a dd(x) integral_0^b dd(y) V(x,y) sin(alpha_n x) sin(beta_m y).
$
When there is a non-trivial potential on each wall we can use linearity to only consider one non-trivial wall at a time, and then sum our solutions
$
  Phi = Phi_(x=a) + Phi_(x=0) + dots
$

=== Corners and edges in 2D
Consider conducting plates meeting at an angle $0 < beta < 2pi$. Using polar coordinates $(rho, phi.alt)$ we use the following boundary conditions for the potential (our plates)
$
  Phi (rho >= 0,0) = Phi(rho >= 0, beta) = V.
$
The Laplace equation in polar coordinates is#footnote[Can be seen by using $rho^2 = x^2 + y^2$ and $phi.alt=arctan y/x$.]
$
  [(rho pdv(, rho))^2 + 1/rho^2 pdv(, phi.alt, 2)] Phi = 0.
$
Applying separation of variables with $Phi(rho, phi.alt) = R(rho) F(phi.alt)$ we obtain two independent ODEs
$
  1/R (rho dv(, rho))^2 R = nu^2",  " 1/F dv(, phi.alt, 2) F = - nu^2.
$
The solutions are known
$
  R(rho) &= a rho^nu + b rho^(-nu)",  " F(phi.alt) = A cos(nu phi.alt) + B sin(nu phi.alt)",  " (nu eq.not 0) \
  R(rho) &= a_0 + b_0 ln rho",  " F(phi.alt) = A_0 + B_0 phi.alt".                  " (nu = 0)
$
The boundary conditions require
$
  b_0 = B_0 = b = A = 0",  " nu = (m pi)/beta",  " m = 1, 2, dots.c
$
Hence, the general solution becomes
$
  Phi(rho, phi.alt) &= V + sum_(m >= 1) a_m rho^(m pi \/beta) sin ((m pi phi.alt)/beta) \
  &=^("near" rho = 0) V + a_1 rho^(pi\/beta) sin((pi phi.alt)/beta) + dots.c
$
We expand near $rho = 0$ since we would like the behaviour near the vertex. Here, there is still an ambiguity ($a_1, a_2, dots.c$) because we have not imposed any boundary conditions away from the vertex.

Now, we can read off the components of the electric field
$
  E_rho &= - pdv(Phi, rho) = - (pi a_1)/beta rho^(pi\/beta -1) sin((pi phi.alt)/beta) \
  E_phi.alt &= - 1/rho pdv(Phi, phi.alt) = - (pi a_1)/beta rho^(pi\/beta -1) cos((pi phi.alt)/beta),
$
and the charge distribution near the tip from $E_perp$ at $phi.alt = 0$
$
  sigma(rho) = epsilon.alt_0 E_phi.alt (rho, 0) tilde.eq - (pi a_1)/beta rho^(pi\/beta -1).
$
This depends on the angle:

1. When $beta < pi$ the charge density goes to zero (at the vertex).

2. When $beta = pi$ the charge density is constant across the boundary (plane conductor).

3. When $beta > pi$ the charge density goes to infinity (at the vertex).

4. When $beta tilde 2 pi$ the corner becomes a "stick". The charge density grows maximally $sigma(rho) tilde rho^(-1\/2)$.#footnote[This is why lighting rods work.]

== Appendix: Deriving the Coulomb Green's function
Without boundary conditions and with a single pointlike charge the Green's function for the Laplacian is given by the Coulomb potential. We would like to show this (with $bold(x)' = 0$)
$
  laplacian 1/r = - 4 pi delta(r).
$
This holds in three spatial dimensions.

Observe that $delta^((3)) (bold(x)) = delta(r)$ is a distribution, defined by
$
  integral_V delta(r) = cases(0"   if" 0 in.not V, 1"   if" 0 in V)
$
So we need to show
$
  integral_V laplacian 1/r = cases(0"  "&"if" 0 in.not V, -4 pi"   "&"if" 0 in V)
$
Now, we have
$
  laplacian 1/r = 1/r^2 pdv(, r) (r^2 pdv(, r) 1/r) = - 1/r^2 pdv(, r) (r^2 1/r^2),
$
which vanishes if $r eq.not 0$. So we have shown the top line. To show the bottom line we apply the divergence theorem
$
  integral_V laplacian 1/r &= integral_V div (grad 1/r) \
  &= integral.cont_dd(V, d: partial) bold(hat(r)) dot (grad 1/r) dd(a) \
  &= integral.cont_dd(V, d: partial) bold(hat(r)) dot (bold(hat(r)) pdv(, r) 1/r) dd(a) \
  &= integral.cont_dd(V, d: partial) underbracket(bold(hat(r)) dot bold(hat(r)), 1) underbracket((pdv(, r) 1/r) r^2, -1) dd(Omega) \
  &=^("any surface enclosing origin has" Omega = 4 pi) - 4 pi,
$
which shows the bottom line. This could also be used to show the top line. The final integral vanishes when $0 in.not V$ since $Omega = 0$ in this case.
