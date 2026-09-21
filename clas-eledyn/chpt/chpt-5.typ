#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

// lec 3 + 4
= Magnetostatics
We have known for a long time that magnetic fields are sourced by electric charges in motion. However, a corresponding "magnetic charge" has never been found! This fundamental observation is what underlies all differences between electro- and magnetostatics.

== Current and charge conservation
We define a current density $bold(J)$, which is related to the current through a surface $S$ as
$
  I(S) = dv(q(S), t) = integral_S bold(n) dot bold(J) dd(a) = phi_S (bold(J)).
$
When the surface is closed, and $S$ bounds a volume $V$, then the current measures how much charge leaves $V$. Also, by the divergence theorem we can write
$
  overbracket(-, "leaving" V)dv(, t) underbracket(integral_V rho(bold(x)) dd(x, 3), q "in" V) = integral_V div bold(J) dd(x, 3).
$
This holds for arbitrary $V$ implying
$
  pdv(rho, t) + div bold(J) = 0,
$
which is the continuity equation. By definiton of magnetostatics $(rho "time-independent")$, we find
$
  div bold(J) = 0.
$
So we do allow moving charges if and only if there are no sinks or sources! Requiring no moving charges would be $bold(J) =^! 0$.

== Biot-Savart and Ampére's laws
=== Biot-Savart's law
Consider a (steady) $bold(J)$ flowing in space. We imagine a small cylinder, of height $dd(l)$ and base area $dd(S)$, which is aligned (i.e. parallel) with the flow lines of the current. We will denote the infinitesimal line element by $dd(bold(l))$.

The current through $dd(S)$ is
$
  I = bold(J) dot bold(n) dd(S) = J dd(S),
$
and the contribution to the magnetic flux density $bold(B)$ from the current through the cylinder $dd(bold(l)) times dd(S)$ is given by Biot-Savart's law
$
  dd(bold(B)) = mu_0/(4 pi) ((I dd(bold(l))) times bold(x))/abs(bold(x))^3,
$
with the cylinder placed at $bold(x) = 0$. This law resembles Coulomb's law, with some obvious differences.

=== Infinite wire
For an infinitely long and thin wire, the magnetic flux density at a distance $R$ is given by
$
  abs(bold(B)) &= mu_0/(4 pi) integral_RR abs((I dd(bold(l))) times bold(x))/abs(bold(x))^3 \
  &= mu_0/(4 pi) integral_RR ((I dd(l)) times x sin theta)/x^3 \
  &= mu_0/(4 pi) integral_RR (I R)/(R^2+l^2)^(3\/2) dd(l) \
  &= mu_0/(2 pi) I/R,
$
with the direction given by the right-hand rule.

=== The vector potential
Computing $bold(B)$ requires integrating the Biot-Savart law (as in the example) over all line elements. However, typically one deals with current distributions $bold(J)$, describing charges moving in space. Here, $bold(J)$ is a vector field over $RR^3$, and denoting the line elements along the flow lines of $bold(J)$ by $dd(bold(l))$ we can write
$
  I dd(bold(l)) = bold(J) dd(S) dot dd(l) = bold(J) dd(x, 3),
$
implying
$
  bold(B) (bold(x)) = mu_0/(4 pi) integral (bold(J) (bold(x)') times (bold(x)-bold(x)'))/abs(bold(x)-bold(x)')^3 dd(x', 3).
$
We can rearrange this as
$
  bold(B) (bold(x)) &= mu_0/(4 pi) curl integral (bold(J) (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3) \
  &= curl bold(A) (bold(x)),
$
with $bold(A)$ being the magnetic vector potential.

The vector potential is unchanged under gauge transformations, since
$
  bold(A) tilde bold(A) + grad Psi,
$
lead to the same $bold(B)$. Hence,
$
  bold(A) eq.not mu_0/(4 pi) integral (bold(J) (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3).
$

=== Ampére's law
Taking the divergence and curl of the equation for $bold(B)$ we find the two fundamental equation of magnetostatics in vacuum#footnote[Using $curl (curl bold(A)) = grad (div bold(A)) - laplacian bold(A)$.]
$
  div bold(B) & = 0",  " curl bold(B) = mu_0 bold(J).
$
The first is a trivial consequence of the existence of $bold(A)$, and can be seen as the "Gauss' law for magnetism". This equation tells us there are no magnetic charges, since
$
  q_m = mu_0 phi_S (bold(B)) = mu_0 integral_V div bold(B) = 0.
$
The second equation is Ampére's law, which plays the role of Gauss' law, since it relates the field $bold(B)$ to the sources. We can rewrite this equation by considering an open surface $S$ with some boundary $dd(S, d: partial)$. Then integrating we find
$
  integral_S (curl bold(B)) dot bold(n) dd(a) &= mu_0 underbracket(integral_S bold(J) dot bold(n) dd(a), I(S)),
$
and using Stokes' theorem
$
  underbracket(chi_dd(S, d: partial) (bold(B)), "circulation of" bold(B)) = integral.cont_dd(S, d: partial) bold(B) dot dd(bold(l)) = mu_0 I(S).
$
This relates the circulation of $bold(B)$ to the current through the surface $S$, and usually provides a quicker way to compute $bold(B)$.

We can also write Ampére's law in terms of $bold(A)$. Using the Coulomb gauge (i.e. gauge fixing)
$
  div bold(A) = 0,
$
we have
$
  mu_0 bold(J) = - laplacian bold(A).
$
This tells us each $A_i$ satisfies the Poisson equation, and therefore "acts like" the scalar potential. Hence, we may deduce
$
  bold(A) (bold(x)) =^"Coulomb" mu_0/(4 pi) integral (bold(J) (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3),
$
which can be written as
$
  bold(A) (bold(x)) =^"Coulomb" (mu_0 I)/(4 pi) integral_C (dd(bold(l)))/abs(bold(x)-bold(x)'),
$
when considering a thin wire carrying $I$.

== "Multipole expansion"
We can find a multipole expansion for $bold(A)(bold(x))$ as we did for the scalar potential. However, in this case things are annoying, since the $A_i$ are coupled due to our choice of gauge. Hence, we will approach the problem differently.

Consider a localised (in small region) distribution $bold(J)(bold(x)')$, which will induce a field at $bold(x)$. Assuming $abs(bold(x)) >> abs(bold(x)')$ we expand
$
  1/abs(bold(x)-bold(x)') = 1/abs(bold(x)) + (bold(x) dot bold(x)')/abs(bold(x))^3 + dots.c
$
Then each $A_i$ becomes
$
  A_i (bold(x)) &= mu_0/(4 pi) [1/abs(bold(x)) integral J_i (bold(x)') dd(x', 3) + bold(x)/abs(bold(x))^3 dot integral J_i (bold(x)') bold(x)' dd(x', 3) + dots.c]
$
Since $bold(J) (bold(x)')$ is localised we have the following identity
$
  integral (f bold(J) dot grad' g+g bold(J) dot grad' f + f g grad' dot bold(J)) dd(x', 3) = 0,
$
where $f$ and $g$ are "nice" functions of $bold(x)'$. Using $f = 1$ and $g = x'_i$, we have
$
  0 & = integral bold(J)(bold(x)') dot bold(hat(x)_i) dd(x', 3) \
    & = integral J_i (bold(x)') dd(x', 3).
$
Hence, the term corresponding to a monopole vanishes. With $f = x'_i$ and $g = x'_j$, we have
$
  0 & = integral x'_i J_j (bold(x)') + x'_j J_i (bold(x)') dd(x', 3).
$
The second term can then be written as
$
  bold(x) dot integral J_i bold(x)' dd(x', 3) &= sum_j x_j integral x'_j J_i dd(x', 3) \
  &= -1/2 sum_j x_j integral (x'_i J_j - x'_j J_i) dd(x', 3) \
  &= -1/2 sum_j sum_k epsilon.alt_(i j k) x_j integral (bold(x)' times bold(J))_k dd(x', 3) \
  &= - 1/2 [bold(x) times integral (bold(x)' times bold(J)) dd(x', 3)]_i
$
One typically defines the magnetic dipole moment
$
  bold(m) & = 1/2 integral bold(x)' times bold(J) dd(x', 3) \
          & = I/2 integral.cont bold(x)' times dd(bold(l)).
$
Then $bold(A)(bold(x))$ can be written as
$
  bold(A)(bold(x)) & = mu_0/(4 pi) (bold(m) times bold(x))/abs(bold(x))^3.
$
Taking the curl one immediately finds
$
  bold(B) &= mu_0/(4 pi) (3 bold(n) (bold(n) dot bold(m)) - bold(m))/abs(bold(x))^3.
$

/*
This can be found by considering a loop of current in the $x y$-plane placed along a circle of radius $a$. Here, the current is (in polar coordinates)
$
  J_r & = 0",  " J_theta = 0",  " J_phi.alt = I/a delta(theta-pi/2) delta(r-a),
$
and one finds using the integral form of Biot-Savart's law (for $r >> a$)
$
  B_r &= mu_0/(2 pi) (I pi a^2) (cos theta)/r^3",  " B_theta = mu_0/(4 pi) (I pi a^2) (sin theta)/r^3",  " B_phi.alt = 0.
$
This field is a magnetic dipole!
*/

1. This is an approximation only valid when far away! Otherwise, one finds a multipole-like expansion.

2. Viewing $bold(J)$ as a vector field, each flow line can be regarded as an infinitesimally thin current loop. When a current loop is planar, the magnetic dipole is orthogonal to the plane, with size $ dd(abs(bold(m)), d: delta) = dd(I, d: delta) times "Area", $ regardless of the loop shape. These loops can be used as a model for magnetic dipoles.

3. For a distribution of charges with $ bold(J) = sum_i q_i bold(v)_i delta^((3)) (bold(x) - bold(x)_i) $ we have $ bold(m) = 1/2 sum_i q_i (bold(x)_i times bold(v)_i) = 1/2 sum_i q_i/M_i bold(L)_i. $ When all charges have the same $q\/M$, then $ bold(m) = q/(2 M) bold(L), $ implying the magnetic dipole moment is proportional to angular momentum!

== Magnetic forces
Ampére observed that a wire carrying an electric current $I$ in a magnetic flux density $bold(B)$ is affected by a force
$
  dd(bold(F)) = underbracket((I dd(bold(l))), "probe current") times bold(B),
$
which is the magnetic analogue to $bold(F) = q bold(E)$. Applying this to a point particle of charge $q$, where $I dd(bold(l)) = q bold(v)$, we have
$
  bold(F) = q bold(v) times bold(B),
$
which is Lorentz' force law.

The force on a "probe distribution" due to a background field $bold(B)$ (with $I dd(bold(l)) = bold(J) dd(x, 3)$) is
$
  bold(F) = integral underbracket(bold(J) times bold(B), "force density") dd(x, 3).
$
The torque density is defined by $bold(x) times (bold(J) times bold(B))$. Hence, the overall torque is
$
  bold(N) = integral bold(x) times (bold(J) times bold(B)) dd(x, 3).
$
Assume the probe distribution is localised. We can expand a component of $bold(B)$ as
$
  B_k (bold(x)) = B_k (0) + bold(x) dot grad B_k (0) + dots.c
$
Then $F_i$ becomes
$
  F_i &= sum_(j, k) epsilon.alt_(i j k) [B_k (0) underbracket(integral J_i (bold(x)') dd(x', 3), 0) + integral J_j (bold(x)') bold(x)' dot grad B_k (0) dd(x', 3) + dots.c] \
  &=^"as before" sum_(j, k) epsilon.alt_(i j k) (bold(m) times grad)_j B_k (bold(x)),
$
which can be written as (using $div bold(B) = 0$)
$
  bold(F) = grad (bold(m) dot bold(B)).
$
The torque can similarly be found
$
  bold(N) &= integral bold(x)' times [bold(J) times bold(B) (0)] dd(x', 3) \
  &= integral [(bold(x)' dot bold(B)) bold(J) - underbracket((bold(x)' dot bold(J)) bold(B), 0)] dd(x', 3) \
  &= bold(m) times bold(B) (0).
$
Now, we can define the potential energy a magnetic dipole
$
  U = - bold(m) dot bold(B).
$

/*


=== Between parallel wires
The force between parallel wires can be shown to be
$
dv(F,l) = mu_0/(2 pi) (I_1 I_2)/d,
$
where $d$ is the distance between the wires.
*/

== Magnetisation
Whenever a field $bold(B)$ propagates through a medium, there is a backreaction due to the interaction between $bold(B)$ and electrons. This induces microscopic currents, whose macroscopic effect is producing anisotropies in the magnetic flux $bold(B)$.

There are no monopoles, so the leading contribution in the multipole expansion comes from the magnetic dipole density or magnetisation $bold(M)(bold(x))$. The vector potential is then a superposition of the contribution from external $bold(J)$ and the "internal" $bold(M)$. Using the Coulomb gauge we have
$
  bold(A) (bold(x)) &= mu_0/(4 pi) integral [underbracket((bold(J)(bold(x)'))/abs(bold(x)-bold(x)'), "current density") + underbracket((bold(M) (bold(x)') times (bold(x)-bold(x)'))/abs(bold(x)-bold(x)')^3, "dipole density")] dd(x', 3) \
  &= mu_0/(4 pi) integral [(bold(J)(bold(x)'))/abs(bold(x)-bold(x)') - bold(M) (bold(x)') times grad' 1/abs(bold(x)-bold(x)')] dd(x', 3) \
  &= mu_0/(4 pi) integral (bold(J) (bold(x)') + grad' times bold(M) (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3) \
  &= mu_0/(4 pi) integral (bold(J)_"eff" (bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3).
$
Hence, we need to "change" Ampére's law
$
  curl bold(B) = mu_0 bold(J)_"eff",
$
with $bold(J)_"eff" = bold(J) + curl bold(M)$. We can finally(!) define the magnetic field by
$
  bold(H) = 1/mu_0 bold(B) - bold(M),
$
making Ampére's law (with $bold(J)$ free)
$
  curl bold(H) = bold(J).
$

== Magnetostatics in macroscopic media
We have found the laws of magnetostatics in macroscopic media are
$
  curl bold(H) = bold(J)",  " div bold(B) = 0.
$
Again, since we made no assumptions regarding the magnetisation, these laws are extremely general.

These imply the following
$
  (bold(B)_2 - bold(B)_1) dot bold(n) & = 0 \
  bold(n) times (bold(H)_2-bold(H)_1) & = bold(K),
$
where $bold(K)$ is the surface current density on the interface.

The magnetic energy density stored by the magnetic field in macroscopic media is
$
  U & = 1/2 integral bold(H) dot bold(B) dd(x, 3) \
    & = 1/2 integral bold(J) dot bold(A) dd(x, 3),
$
which is also completely general.

=== Types of magnetisation
We have three broad classes of material responses to an external field $bold(B)$:

1. Paramagnetism is characterised by a positive linear response $ bold(B) = mu bold(H)",  " mu/mu_0 > 1. $

2. Diamagnetism is characterised by a negative linear response $ bold(B) = mu bold(H)",  " mu/mu_0 < 1. $

3. Ferromagnetism is characterised by a nonlinear response $ bold(B) = bold(F) (bold(H)), $ where $bold(F)$ may be multivalued.

The parameter $mu$ describing the linear response is known as magnetic permeability. The usual laws apply to these materials after $mu_0 -> mu$. We can also define a magnetic susceptibility by
$
  bold(M) = chi_m bold(H),
$
implying $mu = mu_0 (1+ chi_m)$.

We are now done with magnetostatics, yay!
