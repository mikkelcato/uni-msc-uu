#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Maxwell's equations
== Faraday's law
We have seen the following-ish:
$
  bold(E) ->^"force" q "moves" -> bold(J) -> bold(B),
$
or briefly
$
  bold(E) "induces" bold(B).
$

Consider a closed path $C$. We have seen
$
  integral.cont_C bold(E) dot dd(bold(l)) =^"electrostatics" 0.
$
This is related to the existence of a single-valued(!) potential $Phi$ with
$
  bold(E) = - grad Phi.
$
However, if the circulation is non-zero there will be a drop in potential
$
  scr(E) = dd(Phi(C), d: Delta) = integral.cont_C bold(E) dot dd(bold(l)).
$
This implies any charge placed on $C$ will feel a force pushing it toward lower values of $q Phi$. Hence, we call $scr(E)$ the electromotive force.

The observed violation of the single-valuedness of $Phi$ (in the presence of non-stationary currents#footnote[Here, both conditions defining electrostatics and magnetostatics are violated.]) is the birth of electrodynamics! Faraday noticed a linear correlation between the $scr(E)$ around $C$, and the change in $phi_S (bold(B))$ across the surface $S$ subtended by $C$
$
  scr(E) & = integral.cont_C bold(E) dot dd(bold(l)) \
         & = - dv(, t) integral_S bold(B) dot bold(n) dd(a) \
         & = - dv(phi_S (bold(B)), t),
$
which is Faraday's law. Note, the change in $phi_S (bold(B))$ can be due to motion of $C$, time-dependence of $bold(B)$, or both. Applying Stokes' theorem one finds
$
  curl bold(E) = - pdv(bold(B), t),
$
which is the differential form of Faraday's law.

One way to view Faraday's law is
$
  bold(B) "induces" bold(E).
$
However, this is somewhat naïve.

== Observer-dependence of Faraday's law
Suppose the path $C$ is in motion with velocity $bold(v)$ with respect to the lab, where a background field $bold(B)$ is present. Then the electric field seen in the moving frame is (due to induction)
$
  integral.cont_C bold(E)_"mov" dot dd(bold(l)) &= - dv(, t) integral_S bold(B) dot bold(n) dd(a) \
  &=^(S "comoving") - integral_S dv(bold(B), t) dot bold(n) dd(a) \
  &= - integral_S [pdv(bold(B), t) + underbracket((bold(v) dot grad) bold(B), "since" bold(B) "may be inhomogeneous")] dot bold(n) dd(a) \
  &= - integral_S [pdv(bold(B), t) + curl (bold(B) times bold(v)) + bold(v) (div bold(B))] dot bold(n) dd(a).
$
Applying $div bold(B) = 0$ and using Stokes' theorem we find
$
  integral.cont_C [bold(E)_"mov" + bold(B) times bold(v)] dot dd(bold(l)) = - integral_S pdv(bold(B), t) dot bold(n) dd(a),
$
which is Faraday's law in the moving frame.

An observer in the lab frame, however, sees
$
  integral.cont_C bold(E)_"lab" dot dd(bold(l)) = - integral_S pdv(bold(B), t) dot bold(n) dd(a),
$
since $bold(B)$ only varies with time. Hence, we find
$
  bold(E)_"mov" = bold(E)_"lab" + bold(v) times bold(B).
$
This is precisely Lorentz' force law upon multiplying with $q$! This additional term is what breaks the single-valuedness of $Phi$, implying Coulomb's law is wrong.

== Maxwell's equations
We know Faraday's law only plays a role when $bold(B)$ is time-dependent. Therefore, induction as above only occurs in settings outside the domain of magnetostatics, where $div bold(J) eq.not 0$. This follows immediately by considering the divergence of Ampére's law
$
  underbracket(div (curl bold(H)), "always" 0) = div bold(J) eq.not 0.
$
Hence, we need to modify Ampére's law. The necessary modification simply turns out be consistency with Gauss' law. Assuming $div bold(D) = rho$ is still valid (i.e. taking Gauss' law as a definition), we find by charge conservation
$
  div (bold(J) + pdv(bold(D), t)) =^! 0.
$
This means we can "fix" Ampére's law by addition of $dd(bold(D), d: partial)\/dd(t, d: partial)$
$
  curl bold(H) = bold(J) + underbracket(pdv(bold(D), t), "displacement" #linebreak() "current").
$
This was proposed by Maxwell, and the equation is typically called  Ampére-Maxwell's law. With this additional term we see a magnetic field can be induced by a time-varying electric field (even if no charges are moving!).

Now, we have found the four equations of electrodynamics or Maxwell's equations
$
   div bold(D) & = rho "                 (Gauss' law)" \
   div bold(B) & = 0 "                 (no monopoles)" \
  curl bold(H) & = bold(J) + pdv(bold(D), t) "       (Ampére-Maxwell's law)" \
  curl bold(E) & = - pdv(bold(B), t). "          (Faraday's law)"
$
Alongside Lorentz' force law (on a single charged particle) these describe all phenomena in classical electrodynamics.

== Potentials and wave equations
We already know
$
  bold(B) = curl bold(A),
$
since $div bold(B) = 0$. Then by Faraday's law
$
  curl (bold(E) + pdv(bold(A), t)) = 0,
$
implying
$
  bold(E) = underbracket(-grad Phi, "old definition") - pdv(bold(A), t).
$
This is the "true" definition of the scalar potential in electrodynamics. This definition is again well-defined and single-valued everywhere!

These new potentials again have an intrinsic ambiguity, since
$
  bold(A) tilde bold(A) + grad Lambda",  " Phi tilde Phi - pdv(Lambda, t),
$
leaves both $bold(E)$ and $bold(B)$ unchanged. The choice of $Lambda(bold(x), t)$ is a redundancy in our description of the physical fields in terms of potentials. This is usually called gauge freedom.

Using $bold(A)$ and $Phi$ we immediately obtain the homogeneous Maxwell equations by definition. The inhomogeneous Maxwell equations become (in vacuum)
$
  laplacian Phi + pdv(, t) (div bold(A)) &= -rho/epsilon.alt_0 \
  laplacian bold(A) - 1/c^2 pdv(bold(A), t, 2) - grad (div bold(A) + 1/c^2 pdv(Phi, t)) &= - mu_0 bold(J).
$
Lorenz noticed these become nice if one applies gauge freedom to transform $bold(A)$ and $Phi$ by $Lambda$ with#footnote[Here, $square$ is the D'Alembertian $ square Lambda = laplacian Lambda - 1/c^2 pdv(Lambda, t, 2). $]
$
  square Lambda = - (div bold(A) + 1/c^2 pdv(Phi, t)).
$
This is called the Lorenz gauge, and the resulting potentials satisfy
$
  div bold(A) + 1/c^2 pdv(Phi, t) =^! 0.
$
This gauge is useful since the equations for $bold(A)$ and $Phi$ decouple, while simultaneously reducing both to wave equations
$
      square Phi & = - rho/epsilon.alt_0 \
  square bold(A) & = - mu_0 bold(J).
$
Then solving Maxwell's equation has been reduced to solving four copies of the wave equation! However, the Lorenz gauge is still semi-ambiguous since
$
  Lambda tilde Lambda + dd(Lambda, d: delta),
$
if $square dd(Lambda, d: delta) = 0$.

Note, the potentials obeying wave equations should not(!) be confused with the occurence of electromagnetic waves.

Another useful gauge is (again) the Coulomb gauge
$
  div bold(A) = 0.
$
This recovers Gauss' law (or the Poisson equation for $Phi$)
$
  laplacian Phi = - rho/epsilon.alt_0,
$
meaning $Phi$ is determined by Coulomb's law (namesake). Now, this is understood to hold also for a time-dependent charge distribution
$
  Phi(bold(x), t) = 1/(4 pi epsilon.alt_0) integral (rho(bold(x)', t))/abs(bold(x)-bold(x)') dd(x', 3).
$
This is strange since it appears to say a change in $rho$ propagates immediately to $Phi$ (over arbitrary distances!).

With no sources $bold(J) = 0$ we find in the Coulomb gauge
$
  Phi = 0",  " square bold(A) = 0,
$
while the physical fields are simply
$
  bold(E) = - pdv(bold(A), t)",  " bold(B) = curl bold(A).
$

== Green's function for the D'Alembertian
Maxwell's equations in the Lorenz gauge have the form
$
  square Psi = - 4 pi f(bold(x),t).
$
We would like to determine the Green's function for $square$
$
  square G(bold(x),t; bold(x)',t') = - 4 pi delta^((3)) (bold(x)-bold(x)') delta(t-t'),
$
with "no boundary" conditions.#footnote[Neumann boundary conditions at infinity]

By symmetry $G$ can only depend on distances
$
  G=G(R;tau),
$
with $R = abs(bold(x)-bold(x)')$ and $tau = t-t'$.

We Fourier transform using
$
    G(R,tau) & = 1/(2 pi) integral G_k (R) e^(-i omega tau) dd(omega) \
  delta(tau) & = 1/(2 pi) integral e^(-i omega tau) dd(omega),
$
where $omega = c k$. Then the wave equation for modes with frequency $omega$ becomes#footnote[This is simply the Helmholtz equation (with a $delta$-source).]
$
  (laplacian + k^2) G_k (R) = - 4 pi delta^((3))(bold(R)),
$
which defines $G_k (R)$. The solutions are#footnote[Note, when $k = 0$ we recover the Poisson equation for a pointlike particle. This is also similar to the Yukawa potential.]
$
  G_k^((plus.minus)) (R) = 1/R e^(plus.minus i k R).
$
Then transforming back we find
$
  G^((plus.minus)) (bold(R),tau) &= 1/(2 pi) integral G_k^((plus.minus)) (R) e^(-i omega tau) dd(omega) \
  &= 1/(2 pi) integral 1/R e^(i (plus.minus k R - omega tau)) dd(omega) \
  &= 1/R delta(plus.minus R/c - tau) \
  &= 1/abs(bold(x)-bold(x)') delta(t-t' minus.plus abs(bold(x)-bold(x)')/c).
$

1. By definition, then these Green's functions describe the potentials $Phi$ or $bold(A)$ at the point $(bold(x),t)$ if a source $rho$ or $bold(J)$ is turned on for an instant(!) at a point $(bold(x)',t')$.

2. Correlation is non-trivial when wave propagation occurs with the speed of light $ G^((plus.minus)) (bold(R),tau) = 0",   if" abs(dd(bold(x), d: Delta)) eq.not c dd(t, d: delta). $

3. Since $ abs(bold(x)-bold(x)')/c > 0, $ we have $ G^((+)) (bold(R),tau) = 0",   if" t < t'. $ There is no signal propagation for times $t$ before a source at $t'$, only afterwards! This is why $G^((+))$ is called the retarded Green's function (what happens after the impulse?).

4. Likewise $ G^((-)) (bold(R),tau) = 0",   if" t > t'. $ There is no signal propagation for times $t$ after a source at $t'$, only before. This is why $G^((-))$ is called the advanced Green's function (what happens before the impulse?).

To see how this works consider a localised source $f(bold(x),t)$. We assume
$
  f(bold(x), t) = 0",   " t<t_"in" "or" t > t_"out",
$
meaning $f(bold(x),t)$ is "on" between $t_"in"$ and $t_"out"$. Suppose we know the solution $Psi_"in" (bold(x),t)$ of $square Psi_"in" = 0$ before the source is activated. Then the overall solution is
$
  Psi(bold(x), t) = Psi_"in" (bold(x),t) + integral dd(x', 3) integral dd(t') G^((+)) (bold(x),t; bold(x)',t') f(bold(x)',t').
$

1. This obeys the wave equation with sources for all $bold(x)$ and $t$ $ square Psi (bold(x),t) = - 4 pi f(bold(x),t)",  " t >= t_"in", $ which is obvious (by definition).

2. When $t < t_"in"$ we have $Psi(bold(x), t) = Psi_"in"$ as we would expect.

3. However, after activation we find $ Psi(bold(x), t) &= Psi_"in" + integral dd(x', 3) integral dd(t') G^((+)) (bold(x),t ; bold(x)',t') f(bold(x)',t') \
  &= Psi_"in" + integral dd(x', 3) integral dd(t') 1/abs(bold(x)-bold(x)') delta(t-t'- abs(bold(x)-bold(x)')/c) f(bold(x)',t') \
  &= Psi_"in" + integral dd(x', 3) 1/abs(bold(x)-bold(x)') f(bold(x)', t - abs(bold(x)-bold(x)')/c). $ We add contributions from the source evaluated at points $bold(x)'$ at a previous(!) time $t' = t-abs(dd(bold(x), d: Delta))\/c$ corresponding to the time taken for the signal to propagate to $bold(x)$. We evaluate the source using the "retarded time".

4. The strength of the signal decays as $1\/abs(bold(x)-bold(x)')$. This is the same behaviour as Coulomb's law for $Phi$ (and Biot-Savart's law for $bold(A)$). This means the Green's function tells us the potentials (and fields) take time to propagate, and a change in sources causes a change in the fields propagating with the speed of light.

A similar expression with $Phi_"out"$ and $G^((-))$ can also be found.

When doing electrodynamics in the Lorenz gauge, we are (usually) interested in situations where $Psi_"in" = 0$. Then applying the above we find
$
  Phi (bold(x),t) &= 1/(4 pi epsilon.alt) integral dd(x', 3) 1/R [rho(bold(x)', t')]_"ret" \
  bold(A) (bold(x),t) &= mu_0/(4 pi) integral dd(x', 3) 1/R [bold(J) (bold(x)',t')]_"ret",
$
where $[dots]_"ret"$ means we evalute the term with $ t' = t-abs(bold(x)-bold(x)')/c = t- R/c. $

// måske Jefimenko.


== Appendix: The Helmholtz equation
The Helmholtz equation is
$
  (laplacian + k^2) G_k (r) = -4 pi delta^((3)) (bold(r)).
$
This equation is spherically symmetric (only depends on $r$)
$
  1/r pdv(, r, 2) (r G(r)) + k^2 G_k (r) = - 4 pi delta(r).
$
Away from $r = 0$ we have
$
  pdv(, r, 2) (r G(r)) + k^2 r G_k (r) = 0",  " r>0.
$
Hence, the function $f_k (r) = r G_k (r)$ is harmonic
$
  pdv(, r, 2) f_k (r) = - k^2 f_k (r)",  " r>0,
$
with solutions
$
  f_k^((plus.minus)) (r) = e^(plus.minus i k r)",  " r> 0,
$
and we immediately find two solutions for $G_k$ aswell
$
  G_k^((plus.minus)) (r) = e^(plus.minus i k r)/r",  " r>0.
$
Now, we need to consider $r = 0$. The $f_k^((plus.minus))$ are functions of $k r$, so in the limit $r -> 0$ all functions behave in the same way (for all values of $k$!). This means we are free to use any value of $k$, including $k = 0$. Then $G_k$ becomes the Coulomb Green's function, and both $f_k^((plus.minus)) -> 1/r$ which is the Coulomb potential. We conclude our found solutions also hold for $r = 0$. Hence, for all $r$
$
  G_k^((plus.minus)) (r) = 1/r e^(plus.minus i k r).
$
