#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

// lecture 3

= Multipoles and polarisation
== The multipole expansion
We have only considered field configurations in the presence of charges and ideal conductors in empty space. This is unrealistic. We would instead like to describe the behaviour of fields in different types of material. This is made difficult by matter backreacting. We saw a similar phenomenom when considering the surface density of conducting spheres in the presence of a pointlike charge. However, when considering materials these anisotropies are on much smaller scales.

The anisotropies are organised by the multiple expansion, which can be treated as a hierarchy of contributions to the field:

1. (zeroth order): Electric monopole. This corresponds to the contribution of a single charge, which is spherically symmetric.

2. (first order): Electric dipole. This can correspond to the contribution due to two charges of opposite values spaced apart. This has cylindrical symmetry.

3. (higher orders): Electric multipoles. These transform in specific ways under rotations.

=== Pure electric dipole
We start with the simplest non-trivial configuration, namely the electric dipole. Consider two charges $plus.minus q$ spaced apart by a vector $bold(d)$. The dipole moment is defined as#footnote[Taking $abs(bold(d)) -> 0$ and $q -> oo$, while keeping $abs(bold(p))$ fixed we find a "pointlike dipole".]
$
  bold(p) = q bold(d).
$
We compute its potential as
$
  Phi(bold(x)) = q/(4 pi epsilon.alt_0) (1/abs(bold(x)-bold(x)_+) - 1/abs(bold(x)-bold(x)_-)),
$
where $bold(x)_plus.minus = bold(x)_0 plus.minus bold(d)\/2$ with $bold(x)_0$ being the position of the dipole by definition. Now, we expand in small $abs(bold(d))\/abs(bold(x))$
$
  Phi(bold(x)) &= q/(4 pi epsilon.alt_0) (1/abs(bold(x)- bold(x)_0 - bold(d)/2) - 1/abs(bold(x)-bold(x)_0 + bold(d)/2)) \
  &= q/(4 pi epsilon.alt_0) (1/abs(bold(x)-bold(x)_0) + (-bold(d)/2) dot grad 1/abs(bold(x)-bold(x)_0) + dots.c + "the same") \
  &= 1/(4 pi epsilon.alt_0) (bold(p) dot (bold(x)-bold(x)_0))/abs(bold(x) - bold(x)_0)^3 + dots.c \
  &= -1/(4 pi epsilon.alt_0) bold(p) dot grad 1/abs(bold(x)-bold(x)_0) + dots.c
$
Taking $abs(bold(d))\/abs(bold(x)) -> 0$ all higher order terms die, and we find the dipole potential
$
  Phi_"dipole" = -1/(4 pi epsilon.alt_0) bold(p) dot grad 1/abs(bold(x)-bold(x)_0).
$
The corresponding electric field is
$
  bold(E)_"dipole" &= - grad Phi \
  &= -1/(4 pi epsilon.alt_0) grad[(bold(p) dot (bold(x)-bold(x)_0))/abs(bold(x)-bold(x)_0)^3] \
  &= - 1/(4 pi epsilon.alt_0) [bold(p) dot (bold(x)-bold(x)_0) grad 1/abs(bold(x)-bold(x)_0)^3 + 1/abs(bold(x)-bold(x)_0)^3 grad (bold(p) dot (bold(x)-bold(x)_0))] \
  &= - 1/(4 pi epsilon.alt_0) [ bold(p) dot (bold(x)-bold(x)_0) (- (3(bold(x)-bold(x)_0))/abs(bold(x)-bold(x)_0)^5) + bold(p)/abs(bold(x)-bold(x)_0)^3] \
  &= 1/(4 pi epsilon.alt_0) 1/abs(bold(x)-bold(x)_0)^3 [3 ((bold(x)-bold(x)_0))/abs(bold(x)-bold(x)_0) (bold(p) dot (bold(x)-bold(x)_0))/abs(bold(x)-bold(x)_0) - bold(p)] \
  &= (3 bold(n) (bold(p) dot bold(n)) - bold(p))/(4 pi epsilon.alt_0 abs(bold(x)-bold(x)_0)^3),
$
where
$
  bold(n) = (bold(x)-bold(x)_0)/abs(bold(x)-bold(x)_0).
$
Using polar coordinates $(r, theta, z)$ with $bold(n) = bold(hat(r))$ and $bold(p) = p bold(hat(z))$ we have#footnote[With $bold(hat(z)) = cos theta bold(hat(r)) - sin theta bold(hat(theta))$.]
$
  Phi_"dipole" &= 1/(4 pi epsilon.alt_0) (p cos theta)/r^3 \
  bold(E)_"dipole" &= (2 p cos theta)/(4 pi epsilon.alt_0 r^3) bold(hat(r)) + (p sin theta)/(4 pi epsilon.alt_0 r^3) bold(hat(theta)).
$
Hence, $E_phi.alt = 0$ implying cylindrical symmetry.


=== The expansion
When a material is effected by an external field $bold(E)$, the charges inside move and rearrange on a microscopic scale. This will change the electric field from the material. When viewed from far away the distribution "collapses" to a single point, and these contributions resemble a superposition of multipoles.

Suppose we have a charge distribution $rho(bold(x))$ confined in a region of radius $R$
$
  rho(bold(x)) = 0",  if" abs(bold(x)) > R .
$
Outside this ball of radius $R$ the potential satisfies the Laplace equation. Hence, we can write
$
  Phi(r, theta, phi.alt) = sum_(l=0)^oo sum_(m=-l)^l (f_(l,m) r^l + g_(l,m) r^(-l-1)) Y_l^m (theta, phi.alt).
$
This expression provides the basis for the multipole expansion of $Phi$. With $f_(l,m)$ and $g_(l,m)$ known we are done!

By Coulomb's formula we know $Phi$ is related to $rho$ by
$
  Phi(bold(x)) = 1/(4 pi epsilon.alt_0) integral (rho(bold(x)'))/abs(bold(x)-bold(x)') dd(x', 3).
$
Using the expansion for $1\/abs(bold(x)-bold(x)')$ we find (with $abs(bold(x)')$ smaller)
$
  Phi(bold(x)) &= 1/(4 pi epsilon.alt_0) integral rho(bold(x)') [4 pi sum_(l=0)^oo sum_(m=-l)^l 1/(2 l +1) (r'^l)/r^(l+1) Y_(l m)^* (theta',phi.alt') Y_(l m) (theta, phi.alt)] dd(x', 3) \
  &= 1/epsilon.alt_0 sum_(l=0)^oo sum_(m=-l)^l 1/(2 l +1) [integral Y_(l m)^* (theta',phi.alt') r'^l rho(bold(x)') dd(x', 3)] (Y_(l m) (theta,phi.alt))/r^(l+1) \
  &= 1/epsilon.alt_0 sum_(l=0)^oo sum_(m=-l)^l q_(l m)/(2l+1) (Y_(l m) (theta,phi.alt))/r^(l+1),
$
which is the multipole expansion!

1. All $f_(l, m)$ vanish. This is expected since the potential decays as $r -> oo$.

2. There is no dependence on $R$, all information about $rho$ is carried by $q_(l m)$.

3. The entire charge distribution is "squeezed at $r= 0$", meaning $Phi = Phi(r, theta, phi.alt)$.

We find the monopole moment ($l=0$) is the electric charge
$
  q_00 = 1/sqrt(4 pi) integral rho(bold(x)') dd(x', 3) = q/sqrt(4 pi),
$
while the dipole moments ($l=1$) corresponds to components of the electric dipole $bold(p)$
$
                q_10 & = sqrt(3/(4 pi)) p_z \
  q_(1 plus.minus 1) & = - sqrt(3/(8 pi)) (p_x minus.plus i p_y).
$
The multipole expansion becomes
$
  Phi(bold(x)) &= 1/epsilon.alt_0 [underbracket((q_00 Y_00)/r, "pointlike charge") + underbracket(1/3 (q_10 Y_10 + q_11 Y_11 + q_(1-1) Y_(1-1))/r^2, "pointlike dipole") + dots.c] \
  &= Phi_"monopole" + Phi_"dipole" + Phi_"quadropole" + dots.c
$

1. The multipole moments $q_(l m)$ depend on the choice of origin. Placing a single pointlike charge at $r_0 = 0$ would only have $q_00 eq.not 0$, while placing the charge at $r_0 > 0$ will have infinitely many non-vanishing $q_(l m)$. This is due to symmetry.#footnote[Just use $rho tilde delta^((3))$ as a check. Here, $r'^l = 0$ for all $l > 0$.]

2. The multipole expansion can also be written in Cartesian coordinates $ Phi(bold(x)) = 1/(4 pi epsilon.alt) [q/r + (bold(p) dot bold(x))/r^3 + 1/2 sum_(i,j) Q_(i j) (x_i x_j)/r^5 + dots.c], $ where (usually taken as a definition) $ bold(p) = integral bold(x)' rho(bold(x)') dd(x', 3), $ is the electric dipole moment of the charge distribution $rho$, and $ Q_(i j) = integral (3 x'_i x'_j - r'^2 delta_(i j)) rho(bold(x)') dd(x', 3), $ is the electric quadropole tensor. Clearly $Q_(i j)$ has five independent components.

== Polarisation
Electric fields in materials are complicated. However, the dominant effects usually come from:

1. The "monopole density" $rho(bold(x))$ (usually vanishing).

2. The "dipole density" $bold(P)(bold(x))$. This arises because external fields cause negative- and positive particles to get displaced in opposite directions, meaning we achieve a distribution of microscopic dipoles. This is polarisation!

The potential in a medium with only these is ($q -> rho$ and $bold(p) -> bold(P)$#footnote[Compare with the Cartesian expansion.])
$
  Phi(bold(x)) &= 1/(4 pi epsilon.alt_0) integral dd(x', 3) [(rho(bold(x)'))/abs(bold(x)-bold(x)') + bold(P) (bold(x)') dot grad' 1/abs(bold(x)-bold(x)')] \
  &=^"integration by parts" 1/(4 pi epsilon.alt_0) integral dd(x', 3) 1/abs(bold(x)-bold(x)') [rho(bold(x)') - grad' dot bold(P)(bold(x)')] \
  &= 1/(4 pi epsilon.alt_0) integral dd(x', 3) (rho_"eff" (bold(x)'))/abs(bold(x)-bold(x)').
$
We have managed to rewrite the potential in Coulomb form! (with the sacrifice being $rho -> rho_"eff"$)

Applying $laplacian$ we find the polarisation-corrected Poisson equation
$
  div bold(E) = 1/epsilon.alt_0 (rho - div bold(P)),
$
which can be written in terms of the electric displacement
$bold(D) = epsilon.alt_0 bold(E) + bold(P)$
$
  div bold(D) = rho,
$
where $rho$ is the free charge! The idea is to combine the external field $bold(E)$ with the polarisation field $bold(P)$ caused by the response of the medium. The displacement $bold(D)$ is necessarily less fundamental then the field $bold(E)$, since everything microscopically is fields $bold(E)$. However, on macroscopic scales all the microscopic details are averaged, and all the small changes in $bold(E)$ due to non-trivial "micro-dynamics" leads to an effective description in terms of pointlike multipoles. The monopole moment is the zeroth order contribution, while the dipole moment (responsible for $bold(P)$) is the first order contribution, and so on. The addition of these contributions is the macroscopic $bold(D)$.

== Electrostatics in macroscopic media
We have found the laws of elecrostatic in macroscopic media are
$
  div bold(D) = rho",  " curl bold(E) = 0.
$
However, since we made no assumptions regarding the polarisation density, these laws are extremely general.

These imply the following#footnote[The proof is identical to the case with $bold(P) = 0$.]
$
    (bold(D)_2 - bold(D)_1) dot bold(n) & = sigma \
  bold(n) times (bold(E)_2 - bold(E)_1) & = 0,
$
which generalises our previous behaviour for $bold(E)$ at interfaces.

== Linear dielectrics
With weak fields one can assume the polarisation response is linear
$
  bold(P) = epsilon.alt_0 chi_e bold(E),
$
where $chi_e$ is the electric susceptibility. Then the displacement is itself proportional to the field
$
  bold(D) = epsilon.alt bold(E)",  " epsilon.alt = epsilon.alt_0 underbracket((1 + chi_e), "dielectric constant"),
$
and a generalisation of Gauss' law holds in dielectrics
$
  div bold(E) = rho/epsilon.alt.
$
This is huge, since everything we have done so far still holds (upon $epsilon.alt_0 -> epsilon.alt$).

We have e.g.
$
  U & = 1/2 integral rho Phi dd(x', 3) \
    & = 1/2 integral (div bold(D)) Phi dd(x', 3) \
    & = - 1/2 integral bold(D) dot (grad Phi) dd(x', 3) \
    & = 1/2 integral bold(D) dot bold(E) dd(x', 3) \
    & = epsilon.alt/2 integral abs(bold(E))^2 dd(x', 3),
$
which differs from our previous result by an overall factor of $epsilon.alt\/epsilon.alt_0$. This occurs since energy is stored by $bold(P)$.

We are now done with electrostatics, yay!
