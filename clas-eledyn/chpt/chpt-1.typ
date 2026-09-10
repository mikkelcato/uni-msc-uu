#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Electrostatics
== Coulomb's law
We start our discussion of electrostatics with the hopefully familiar Coulomb's law#footnote[Experimental fact!]
$
  bold(F) = k q_1 q_2 (bold(x)_1 - bold(x)_2)/abs(bold(x)_1 - bold(x)_2)^3,
$<coulombs-law>
which expresses the force on a point charge $q_1$ sitting at $bold(x)_1$ due to another point charge $q_2$ sitting at $bold(x)_2$. Here,
$
  k = 1/(4 pi epsilon.alt_0) tilde.eq 8.99 dot 10^9 ("Nm"^2)/"C"^2,
$
is known as Coulomb's constant, and is related to
$
  epsilon.alt_0 tilde.eq 8.85 dot 10^(-12) ("C"^2)/("Nm"^2),
$
which is the absolute permittivity of vacuum.

Consider a test charge $q$. By this we mean $q$ is infinitesimally small, meaning its presence has no effect on the field configuration sourced by other charges.#footnote[This is the probe approximation.] We define the electric field at the position $bold(x)$ occupied by $q$ as
$
  bold(F) = q bold(E).
$
Taking $bold(E)$ to be sourced by a single charge $q_0$ placed at $bold(x)_0$, we have by Coulomb's law
$
  bold(E) (bold(x)) = k q_0 (bold(x)-bold(x)_0)/abs(bold(x)-bold(x)_0)^3 .
$
With multiple sources electric fields add as vectors.#footnote[Experimental fact!] A discrete set of sources $q_i$ placed at $bold(x)_i$ produces an electric field
$
  bold(E) (bold(x)) = k sum_i q_i (bold(x)-bold(x)_i)/abs(bold(x)-bold(x)_i)^3.
$
Likewise, a continuous charge distribution with density $rho(bold(x))$ produces an electric field
$
  bold(E) (bold(x)) = k integral_(RR^3) rho(bold(x)') (bold(x)-bold(x)')/abs(bold(x)-bold(x)')^3 dd(x', 3).
$<electric-field-coulomb>
These are of course the same when $rho(bold(x')) tilde sum_i q_i delta^((3)) (bold(x)'-bold(x)_i)$.

== Gauss' law
Applying Coulomb's law we can derive Gauss' law.

Let $S$ be an oriented surface in $RR^3$, and denote the unit normal to $S$ by $bold(n)$. Consider an infinitesimal piece $sigma$ of $S$, along which $bold(n)$ is approximately constant, and denote the area element by $dd(a)$.#footnote[$bold(n)$ is normal to $dd(a)$.] We define the infinitesimal flux (through $sigma$) of the electric field as
$
  phi_sigma (bold(E)) equiv bold(E) dot bold(n) dd(a).
$
Now, suppose the electric field is sourced by a single point particle of charge $q$, and let $bold(r)$ be the distance between the source and $sigma$. Then
$
  phi_sigma (bold(E)) =^"Coulomb's" k q (bold(r) dot bold(n))/abs(bold(r))^3 dd(a) = k q (cos theta)/abs(bold(r))^2 dd(a) = k q (dd(a_perp))/abs(bold(r))^2 = k q dd(Omega),
$
where $theta$ is the angle between $bold(E)$ and $bold(n)$, we also used $dd(a_perp) = abs(bold(r))^2 dd(Omega)$.#footnote[Only the transverse area $dd(a_perp)$ contributes to $dd(Omega)$ and $dd(a_"sphere") prop r^2$.] Here, $dd(Omega) = sin theta' dd(theta', phi.alt')$ is the solid angle subtended by $dd(a)$ as seen by an observer sitting at the point charge.

The total flux is found by integrating over $S$. Hence, over the solid angle as measured in coordinates centered at $q$. When $S$ encloses the charge $q$, the total solid angle is $4 pi$. However, if $q$ is outside $S$ the total solid angle is $0$. The total flux is then
$
  phi_S (bold(E)) = integral.cont_S bold(E) dot bold(n) dd(a) = cases(display(4 pi k q)"   " &q "enclosed,", 0"  " &q "outside.")
$
For a discrete set of charges, the right-hand side becomes a sum over all charges enclosed by $S$. For a continuous charge distribution with density $rho(bold(x)')$ we have
$
  rho_S (bold(E)) = integral.cont_S bold(E) dot bold(n) dd(a) = 1/epsilon.alt_0 integral_V rho(bold(x)) dd(x, 3),
$<gauss-law-integral>
where $V$ is a volume such that $dd(V, d: partial) = S$. This is the integral form of Gauss' law.

Using the divergence theorem
$
  integral.cont_S bold(A) dot bold(n) dd(a) = integral_V div bold(A) dd(x, 3),
$
we can rewrite the surface integral
$
  integral.cont_S bold(E) dot bold(n) dd(a) = integral_V div bold(E) dd(x, 3),
$
giving
$
  integral_V div bold(E) dd(x, 3) = 1/epsilon.alt_0 integral_V rho(bold(x)) dd(x, 3).
$
Since the volume $V$ is arbitrary we obtain the differential form of Gauss' law
$
  div bold(E) = rho/epsilon.alt_0.
$<gauss-law-differential>
This equation can be used to compute the electric field from a known charge distribution. Thus we have found an alternative to @electric-field-coulomb. However, Gauss' law provides a solution up to addition of some divergenceless background field $bold(E) tilde bold(E) + bold(E)_0$.#footnote[Specified by boundary conditions.] Such ambiguitites are commonplace in physics and should be familiar.

== The scalar potential $Phi$
The electric field $bold(E) (bold(x))$ is a vector field, which is specified by three functions $E_i (bold(x))$. This is #strike[sometimes] annoying, hence we switch to a description in terms of a single function, the scalar potential $Phi(bold(x))$
$
  bold(E) (bold(x)) = - grad Phi(bold(x)).
$<scalar-potential>
This being possible is non-obvious. However, in electrostatics (important!) this follows from Coulomb's law since
$
  grad 1/abs(bold(x)-bold(x)') = - (bold(x)-bold(x)')/abs(bold(x)-bold(x)')^3,
$
meaning we can write
$
  bold(E) (bold(x)) = -k grad integral_(RR^3) rho(bold(x)') 1/abs(bold(x)-bold(x)') dd(x', 3),
$
which implies
$
  Phi(bold(x)) = k integral_(RR^3) rho(bold(x)') 1/abs(bold(x)-bold(x)') dd(x', 3).
$<coulomb-potential>
This reduces to the familiar Coulomb potential for a single pointlike source placed at $bold(x)_0$
$
  Phi(bold(x)) = k q_0 1/abs(bold(x)-bold(x)_0).
$
The existence of the scalar potential immediately implies $bold(E)$ has zero curl#footnote[Since $curl (grad f) = 0$.]
$
  curl bold(E) = 0.
$<field-no-curl>

The scalar potential is related to the electrostatic potential energy of a pointlike particle with charge $q$ in the electric field. The well-defined quantity is the difference between potential energies of the charged particle, at two points $bold(x)_1$ and $bold(x)_2$. The difference corresponds to the work done by us (opposite the work done by $bold(E)$) to move the particle from $bold(x)_1$ to $bold(x_2)$ along some path
$
  W = overbracket(-, "since opposite") integral_(bold(x)_1)^(bold(x)_2) bold(F) dot dd(bold(l)) = - q integral_(bold(x)_1)^(bold(x)_2) bold(E) dot dd(bold(l)) = q integral_(bold(x)_1)^(bold(x)_2) grad Phi dot dd(bold(l)) =^"by definition" q integral_(bold(x)_1)^(bold(x)_2) dd(Phi).
$
This is a position-dependent quantity associated to some probe charge, which stores the energy we put into moving it around in the electric field. This means we can interpret $q Phi$ as the potential energy of the charged particle in the field $bold(E)$
$
  U(bold(x)) = q Phi(bold(x)).
$
Since moving a probe charge in an electric field costs energy, then creating a given charge configuration costs energy. The work done is the total potential energy of the charge configuration. This can be computed by summing the work needed to carry a charge $q_i$ from infinity to its position $bold(x)_i$ in the final configuration, one-by-one
$
  U = k sum_(i=1)^n sum_(j<i) underbracket((q_i q_j)/abs(bold(x)_i - bold(x)_j), q_i Phi("from" q_j)) = k/2 sum_(i eq.not j)^n (q_i q_j)/abs(bold(x)_i-bold(x)_j).
$
The potential energy of a continuous charge distribution is
$
  U = k/2 integral.double (rho(bold(x)) rho(bold(x)'))/abs(bold(x)-bold(x)') dd(x, x', [3,3]),
$<energy-charge-configuration>
where regularisation is required to avoid divergences.#footnote[From integration along $bold(x) = bold(x)'$, corresponding to the infinite self-enery of a charge in its own potential.] This expression can be rewritten as
$
  U & = 1/2 integral rho(bold(x)) Phi(bold(x)) dd(x, 3) \
  & =^"Gauss' law" epsilon.alt_0/2 integral (div bold(E)) Phi dd(x, 3) \
  & = - epsilon.alt_0/2 integral (laplacian Phi) Phi dd(x, 3) \
  & =^((#footnote[Consider $div (Phi grad Phi) = (grad Phi) dot (grad Phi) + Phi laplacian Phi$ and use the divergence theorem.])) epsilon.alt_0/2 integral (grad Phi) dot (grad Phi) dd(x, 3) \
  & = epsilon.alt_0/2 integral abs(bold(E))^2 dd(x, 3).
$
This tells us $abs(bold(E))^2$ can be thought of as the electrostatic energy density!

Going back to the definition of work we find an expression for a finite variation of the scalar potential along a path $cal(p)$
$
  dd(Phi, d: Delta) = - integral_cal(p) bold(E) dot dd(bold(l)).
$

Up to an overall shift by a constant $Phi -> Phi + c$, the scalar potential is a single-valued function of $bold(x)$. This means the variation must vanish for closed $cal(p)$
$
  0 = integral.cont_cal(p) bold(E) dot dd(bold(l)).
$
Using Stokes' theorem
$
  phi_S (curl bold(A)) = integral_S (curl bold(A)) dot bold(n) dd(a) = integral.cont_gamma bold(A) dot dd(bold(l)),
$
this implies the flux vanishes
$
  0 = integral.cont_S (curl bold(E)) dot bold(n) dd(a),
$
integrated over an arbitrary surface $S$ with boundary $dd(S, d: partial) = cal(p)$. This is comforting since we know $curl bold(E) = 0$.#footnote[This leads credence to the scalar potential being single-valued.]

Gauss' law can also be expressed in terms of the scalar potential
$
  laplacian Phi (bold(x)) = - (rho(bold(x)))/epsilon.alt_0,
$<poisson>
which is the Poisson equation. This becomes the Laplace equation when there are no sources
$
  laplacian Phi (bold(x)) = 0.
$<laplace>

== Green's functions
We have already seen some ways to compute $Phi$. However, none of these know how to handle things like discontinuities or boundary conditions (which is a problem!).

So we need more general tools to describe the scalar potential. One way to proceed is based on Green's theorem, which given two arbitrary functions $phi.alt$ and $psi$ says#footnote[The normal derivative is defined as $ pdv(f, n) = bold(n) dot grad f. $ Where $bold(n)$ is the normal to $S$ at $bold(x)$. The theorem can be derived by applying the divergence theorem to $bold(A) = phi.alt grad psi$.]
$
  integral_V (phi.alt laplacian psi - psi laplacian phi.alt) dd(x, 3) = integral.cont_S (phi.alt pdv(psi, n) - psi pdv(phi.alt, n)) dd(a).
$

Applying this with $phi.alt = Phi(bold(x)')$ and $psi = 1\/abs(bold(x)-bold(x)')$ we obtain#footnote[Here, $bold(x)$ is the "observation-point", i.e. we want an expression for $Phi(bold(x))$.]
$
  &integral_V (Phi (bold(x)') nabla'^2 1/abs(bold(x)-bold(x)') - 1/abs(bold(x)-bold(x)') nabla'^2 Phi(bold(x)')) dd(x', 3) \
  &#h(5em)=integral.cont_S (Phi (bold(x)') pdv(, n') 1/abs(bold(x)-bold(x)') - 1/abs(bold(x)-bold(x)') pdv(Phi (bold(x)'), n')) dd(a')
$
Now, using the Poisson equation, the identity $ nabla'^2 1/abs(bold(x-bold(x)')) = - 4 pi delta^((3)) (bold(x)-bold(x)'), $
and taking $bold(x) in V$, the left-hand side becomes
$
  integral_V (-4 pi Phi(bold(x)') delta(bold(x)-bold(x)') + (rho(bold(x)'))/(epsilon.alt_0 abs(bold(x)-bold(x)'))) dd(x', 3) = underbracket(- 4 pi Phi (bold(x)), "vanishes when" bold(x) in.not V) + integral_V (rho(bold(x)'))/(epsilon.alt_0 abs(bold(x)-bold(x)')) dd(x', 3).
$
So we obtain an equation for the scalar potential#footnote[Taking $S$ to infinity we the surface integral vanishes.]
$
  Phi(bold(x)) &= 1/(4 pi epsilon.alt_0) integral_V (rho (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3) \
  &+ 1/(4 pi) integral.cont_S (1/abs(bold(x)-bold(x)') pdv(Phi (bold(x)'), n') - Phi (bold(x)') pdv(, n') 1/abs(bold(x)-bold(x)')) dd(a'). #<potential-green>
$

This expression says we can compute $Phi(bold(x))$ if we know

1. The charge distribution within a given volume $V$.

2. The scalar potential on the surface $S$ bounding $V$.

3. The normal electric field on the surface $S$ bounding $V$.

The latter two are needed to account for the effect of all charges lying outside $V$. So we only need to know the charge distribution inside $V$ to compute the scalar potential, as long as we know the boundary behaviour!#footnote[This is wild since $V$ is completely arbitrary.]

When $rho(bold(x)') = 0$, meaning there are no charges in $V$, then the scalar potential satisfies the Laplace equation in $V$. When this is the case, our equation says the scalar potential is fully determined by the boundary behaviour (specifying $Phi$ and $dd(Phi, d: partial)\/dd(n, d: partial)$ on $S$ is known as a Cauchy boundary condition). This turns out to overconstrain the Laplace equation. So our equation does not express $Phi(bold(x))$ in terms of the boundary values, but only expresses a relation between several pieces of a consistent solution to the Poisson equation. Then, when supplying the values of $Phi$ and its normal derivative on $S$, one needs to make sure these are compatible, meaning they correspond to the same solution to the Poisson equation. This makes the equation less useful.

However, in order to specify a unique solution to the Poisson equation, we only need to specify either boundary conditions for the potential (known as Dirichlet boundary conditions), or for its normal derivative (known as Neumann boundary conditions).#footnote[This can be shown using Green's theorem, see Jackson.] Our equation would then become immensely more useful if it involves Dirichlet or Neumann boundary conditions (not both!).

This can be solved by using the Green's function for the Laplacian
$
  nabla'^2 G(bold(x),bold(x)') = - 4 pi delta^((3)) (bold(x)-bold(x)').
$<laplacian-green>
Now, when deriving our equation for the scalar potential the important property of $psi$ we needed was
$
  nabla'^2 psi = - 4 pi delta^((3)) (bold(x)-bold(x)').
$
So the derivation is completely analogous if we replaced $psi$ by the Green's function. However, the Green's function works up to addition by an arbitrary function which solves the Laplace equation
$
  G(bold(x),bold(x)') tilde G(bold(x),bold(x)') + F(bold(x),bold(x)')",  " nabla'^2 F(bold(x),bold(x)') = 0.
$
This is nice since we can pick $F(bold(x),bold(x)')$ to remove either $Phi(bold(x)')$ or $dd(Phi(bold(x')), d: partial)\/dd(n', d: partial)$ at $S$!#footnote[These $F(bold(x),bold(x)')$ represent the contribution to the scalar potential inside $V$ due to sources outside $V$.]

We consider
$
  Phi(bold(x)) &= 1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G(bold(x),bold(x)') dd(x', 3) \
  &+ 1/(4 pi) integral.cont_S (G(bold(x),bold(x)') pdv(Phi(bold(x)'), n') - Phi(bold(x')) pdv(, n') G(bold(x),bold(x'))) dd(a').
$
Picking $F(bold(x),bold(x)')$ such that $ G_D (bold(x),bold(x)') = 0",  for" bold(x)' in S $<dirichlet-green> we find an equation for the scalar potential only in terms of $Phi$ on $S$ (Dirichlet boundary condition)
$
  Phi(bold(x)) = 1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G_D (bold(x),bold(x)') dd(x', 3) - 1/(4 pi) integral.cont_S Phi(bold(x)') pdv(, n') G_D (bold(x),bold(x)') dd(a').
$<dirichlet-potential>

While picking $F(bold(x),bold(x)')$ such that#footnote[Picking $ pdv(G_N, n') (bold(x),bold(x)') = 0, $ leads to issues, immediate by Gauss' theorem.]
$
  pdv(G_N, n') (bold(x),bold(x)') = - (4 pi)/A_S",  for" bold(x)' in S,
$<neumann-green>
where $A_S$ is the area of $S$, we find an equation for the scalar potential only in terms of $dd(Phi, d: partial)\/dd(n', d: partial)$ on $S$ (Neumann boundary condition), and the average of the potential on $S$
$
  Phi(bold(x)) &= 1/(4 pi epsilon.alt_0) integral_V rho(bold(x)') G_N (bold(x),bold(x)') dd(x', 3) \
  &+ expval(Phi)_S + 1/(4 pi) integral.cont_S G_N (bold(x),bold(x)') pdv(Phi(bold(x)'), n') dd(a'). #<neumann-potential>
$
However, since the scalar potential is only defined up to a constant the term $expval(Phi)_S$ is meaningless, so we simply ignore it.

The main problem now is of course determining $G(bold(x),bold(x)')$.
