#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Wave propagation
== The Helmholtz equation
Consider propagation in a non-conducting linear medium with isotropic $epsilon.alt$ and $mu$. Then
$
  bold(D) = epsilon.alt bold(E)",  " bold(H) = bold(B)/mu,
$
and assuming $bold(J) = 0$ and $rho = 0$ we can write Maxwell's equations as
$
                     div bold(D) & = 0 \
  curl bold(E) + pdv(bold(B), t) & = 0 \
                     div bold(B) & = 0 \
  curl bold(H) - pdv(bold(D), t) & = 0.
$
We will consider solutions with a fixed frequency $omega$
$
  bold(E) (bold(x),t) & = e^(-i omega t) bold(E) (bold(x)) \
  bold(D) (bold(x),t) & = e^(-i omega t) bold(D)(bold(x)) \
  bold(B) (bold(x),t) & = e^(-i omega t) bold(B) (bold(x)) \
  bold(H) (bold(x),t) & = e^(-i omega t) bold(H) (bold(x)).
$
There is no loss of generality when doing this, since Maxwell's equations are linear and homogeneous.#footnote[All solutions can be found by summing different $omega$.] With our ansatz we obtain
$
                               div bold(D) (bold(x)) & = 0 \
  curl bold(E) (bold(x)) - i omega bold(B) (bold(x)) & = 0 \
                                div bold(B)(bold(x)) & = 0 \
  curl bold(H) (bold(x)) + i omega bold(D) (bold(x)) & = 0.
$
The equations with $curl$ imply $bold(B)(bold(x))$ and $bold(D)(bold(x))$ are curls of some vector. This implies the equations with $div$ are trivially satisfied and ignorable.

Writing everything in terms of $bold(E)$ and $bold(B)$ we have
$
                  curl bold(E) (bold(x)) - i omega bold(B)(bold(x)) & = 0 \
  curl bold(B) (bold(x)) + i omega mu epsilon.alt bold(E) (bold(x)) & = 0.
$
These are nice and symmetric. We can solve for $bold(B)$ in terms of $bold(E)$
$
  bold(B) = -i/omega curl bold(E).
$
Using this in the second equation gives
$
  0 &= - i/omega curl (curl bold(E)) + i omega mu epsilon.alt bold(E) \
  &=^(div bold(E) = 0) i/omega laplacian bold(E) + i omega mu epsilon.alt bold(E).
$
Hence, we find (no mixing, i.e. we lose information!)
$
  (laplacian + omega^2 mu epsilon.alt) bold(E) & = 0 \
  (laplacian + omega^2 mu epsilon.alt) bold(B) & = 0,
$
which are examples of the Helmholtz equation. This tells us $bold(E)$ and $bold(B)$ are waves.

== Plane waves
The simplest solutions to the Helmholtz equation are
$
  e^(i bold(k) dot bold(x)),
$
with $k^2 = omega^2 mu epsilon.alt$. By symmetry we may take $bold(k) = plus.minus k bold(hat(x))$. Then including time-dependence we obtain
$
  e^(plus.minus i k (x minus.plus v t)),
$
which describes a plane wave travelling along the $x$-direction with "phase" velocity
$
  v = omega/k = 1/sqrt(mu epsilon.alt) = c/n,
$
where we have defined the refraction index $n$ (of the medium) by#footnote[This is why $c = (mu_0 epsilon.alt_0)^(-1\/2)$ is the speed of light.]
$
  n = sqrt((mu epsilon.alt)/(mu_0 epsilon.alt_0)).
$

1. The Helmholtz equation implies a relation between $omega$ and $k$.

2. The two plane waves above travel in opposite directions, along the $x$-axis, with speed $v <= c$. However, there is no dependence on the transverse coordinates!

3. Generally plane waves can travel in any direction in $RR^3$ with $bold(k) = k(omega) bold(n)$. Any solution is an arbitrary superposition of plane waves.

4. With dispersive media $epsilon.alt$ and $mu$ depend on $omega$, implying $v(omega)$ also does. This means the shape of a (complicated) wave varies over time.

5. With non-dispersive media a (complicated) wave preserves its shape.

=== Linear polarisation
Our description of $bold(E)$ and $bold(B)$ is still incomplete. Here, we consider plane waves with linear polarisation. These are described by
$
  bold(E) (bold(x),t) & = bold(scr(E)) e^(i (k bold(n) dot bold(x) - omega t)) \
  bold(B) (bold(x),t) & = bold(scr(B)) e^(i (k bold(n) dot bold(x)- omega t)),
$
where $bold(scr(E))$ and $bold(scr(B))$ are complex-valued vectors, and $bold(n)$ (which is real) is the direction of propagation. The physical quantities $bold(E)$ and $bold(B)$ are the real parts of these equations(!). We define the polarisation vector $bold(epsilon.alt)$ by
$
  bold(epsilon.alt) = bold(scr(E))/abs(bold(scr(E))),
$
and the phase $alpha$ by
$
  scr(E)_k = e^(i alpha)abs(scr(E)_k).
$
Then any linearly polarised wave is characterised by ${bold(n), omega, abs(bold(scr(E))), bold(epsilon.alt), alpha}$.

Likewise, by Maxwell's equations $bold(scr(B))$ is fixed in terms of $bold(scr(E))$, $bold(n)$ and $omega$. This can be seen by considering
$
  div bold(D) &= epsilon.alt bold(scr(E)) dot (i k bold(n)) e^(i (k bold(n) dot bold(x)- omega t)) =^! 0 \
  div bold(B) &= bold(scr(B)) dot (i k bold(n)) e^(i (k bold(n) dot bold(x) - omega t)) =^! 0,
$
which implies
$
  bold(n) dot bold(scr(E)) & = 0 \
  bold(n) dot bold(scr(B)) & = 0.
$
This tells us both $bold(E)$ and $bold(B)$ oscillate in a plane which is transverse to the direction of propagation $bold(n)$. Also, by Faraday's law
$
  curl bold(E) - i omega bold(B) &= [(i k bold(n)) times bold(scr(E)) - i omega bold(scr(B))] e^(i (k bold(n) dot bold(x) - omega t)) =^! 0,
$
implying
$
  scr(bold(B)) = 1/v bold(n) times bold(scr(E)).
$
Hence,

1. $abs(v bold(B)) = abs(bold(E))$.

2. $bold(B) perp bold(E)$.

3. $arg bold(scr(E)) = arg bold(scr(B))$.

Because $bold(scr(E))$ lies in a plane we find two linearly independent plane wave polarisations. They can be described by picking an orthonormal basis (completing $bold(n)$)
$
  (bold(epsilon.alt)_1, bold(epsilon.alt)_2, bold(n))",  " bold(epsilon.alt)_1 dot bold(epsilon.alt)_2 = 0",  " bold(epsilon.alt)_i dot bold(n) = 0",  " bold(epsilon.alt)_i^2 = bold(n)^2 = 0.
$
The two polarisations are (with $E_1, E_2 in CC$)
$
  bold(scr(E)) &= bold(epsilon.alt)_1 E_1",  " bold(scr(B)) &= bold(epsilon.alt)_2 sqrt(mu epsilon.alt) E_1, \
  bold(scr(E)) &= bold(epsilon.alt)_2 E_2",  " bold(scr(B)) &= - bold(epsilon.alt)_1 sqrt(mu epsilon.alt) E_2,
$
which form a basis for all linear polarisations.

Any (monochromatic) linearly polarised plane wave can then be written as
$
  bold(E) = (E_1 bold(epsilon.alt)_1 + E_2 bold(epsilon.alt)_2) e^(i (bold(k) dot bold(x) - omega t)),
$
with $arg E_1 = arg E_2$.

=== Inhomogeneous plane waves
Consider
$
  bold(n) = bold(n)_r + i bold(n)_i,
$
which is allowed. The normalisation condition becomes
$
  bold(n)_r dot bold(n)_r - bold(n)_i dot bold(n)_i + 2 i bold(n)_r dot bold(n)_i =^! 1,
$
or
$
  bold(n)_r dot bold(n)_r - bold(n)_i dot bold(n)_i = 1",  " bold(n)_r dot bold(n)_i = 0,
$
implying the imaginary and real waves are perpendicular!

The introduction of '$i$' means the plane wave now has exponential decay (or growth) along $bold(n)_i$
$
  e^(i (k bold(n) dot bold(x) - omega t)) &= underbracket(e^(-k bold(n)_i dot bold(x)), "attentuation") e^(i (k bold(n)_r dot bold(x) - omega t)),
$
which is called an inhomogeneous plane wave.

1. The direction of propagation is still(!) given by $bold(n)_r$.

2. Along $bold(n)_i$ the amplitude of the wave increases or decreases in either direction.

The $bold(n)_r$ and $bold(n)_i$ are orthogonal as above. We may align these with the coordinate unit vectors $bold(e)_1$ and $bold(e)_2$. They also satisfy $bold(n)_r dot bold(n)_r - bold(n)_i dot bold(n)_i = 1$ so we can parametrise $bold(n)$ by an angle $theta in RR$ as
$
  bold(n) = cosh theta bold(e)_1 + i sinh theta bold(e)_2.
$
By Gauss' law we had $bold(n) dot bold(scr(E)) = 0$ implying $bold(scr(E))$ lies in a plane spanned by $bold(e)_3$ and the linear combination of $bold(e)_1$ and $bold(e)_2$ orthogonal to $bold(n)$
$
  bold(scr(E)) = A (i sinh theta bold(e)_1 - cosh theta bold(e)_2) + A' bold(e)_3,
$
with $A, A' in CC$ and $arg A = arg A'$.

Now, unlike "homogeneous" plane waves where $bold(E) perp bold(n)_r$ we have (since $bold(n) eq.not bold(n)_r$)
$
  bold(scr(E)) dot bold(n)_r & = i A sinh theta cosh theta \
  bold(scr(E)) dot bold(n)_i & = -i A sinh theta cosh theta,
$
meaning $bold(E)$ can oscillate along $bold(n)_r$ and $bold(n)_i$.

=== Circular and elliptic polarisation
Consider again
$
  bold(E) = (E_1 bold(epsilon.alt)_1 + E_2 bold(epsilon.alt)_2) e^(i(bold(k) dot bold(x)- omega t)),
$
with $arg E_1 eq.not arg E_2$. The components along the $bold(epsilon.alt)_1$- and $bold(epsilon.alt)_2$-axes can be written as
$
  (bold(E))_1 & = A_1 e^(i (bold(k) dot bold(x) - omega t + alpha_1)) \
  (bold(E))_2 & = A_2 e^(i (bold(k) dot bold(x) - omega t + alpha_2)),
$
with $E_k = A_k e^(i alpha_k)$. Suppose we observe the wave when $bold(x) = 0$, and measure time from some reference
$
  t_0 = alpha_1/omega.
$
Then shifting $t -> t + t_0$ we find
$
  (bold(E))_1 & = A_1 cos omega t \
  (bold(E))_2 & = A_2 cos (omega t - dd(alpha, d: delta)),
$
where $dd(alpha, d: delta) = alpha_2-alpha_1$. This describes an electric field rotating in the $x y$-plane over time.

1. Consider fixing $dd(alpha, d: delta)$. When $dd(alpha, d: delta) = {0, pi}$ we recover linear polarisation $ bold(E) = (A_1 bold(epsilon.alt)_1 plus.minus A_2 bold(epsilon.alt)_2) cos omega t, $ with oscillation in the $bold(epsilon.alt)_1 bold(epsilon.alt)_2$-plane.

2. Consider $dd(alpha, d: delta) = plus.minus pi\/2$ and $A_1 = A_2 = A$ $ (bold(E))_1 & = A cos omega t \
  (bold(E))_2 & = plus.minus A sin omega t, $ which is circular polarisation. This can also be written as $ bold(E) &= A (bold(epsilon.alt)_1 plus.minus i bold(epsilon.alt)_2) e^(i (k bold(epsilon.alt_3 dot bold(x) - omega t))) \ &= sqrt(2) A bold(epsilon.alt)_plus.minus e^(i (k bold(epsilon.alt)_3 dot bold(x) - omega t)), $ where we defined $ bold(epsilon.alt)_plus.minus &= 1/sqrt(2) (bold(epsilon.alt)_1 plus.minus i bold(epsilon.alt)_2). $ Here, $bold(epsilon.alt)_+$ describes a circularly polarised wave circling counterclockwise and vice versa for $bold(epsilon.alt)_-$.

3. Consider $dd(alpha, d: delta)$ generic and (or) $A_1 eq.not A_2$. This is elliptic polarisation. Using the polarisation basis $bold(epsilon.alt)_plus.minus$ we can write $ bold(E) (bold(x),t) = (E_+ bold(epsilon.alt)_+ + E_- bold(epsilon.alt)_-) e^(i (bold(k) dot bold(x) - omega t)), $ where $ E_plus.minus = 1/sqrt(2) (E_1 minus.plus i E_2). $ Consider $ E_-/E_+ = r e^(i alpha), $ with $r$ and $alpha$ being the relative magnitude and phase of $E_minus.plus$. Then for $bold(x)=0$ the field $bold(E) (bold(0),t)$ describes an ellipse in the $bold(epsilon.alt)_1 bold(epsilon.alt)_2$-plane with $ (1+r)/(1-r) & = "ratio of principal semiaxes" \
      alpha/2 & = "angle of orientation of the semiaxes," $ which can easily be seen by expanding $bold(E)(bold(0),t)$.

=== Stokes parameters
Typically one needs to determine the polarisation of an electromagnetic wave from observation. This is hard.

Consider the following
$
                  bold(epsilon.alt)_(1,2) dot bold(epsilon.alt)_(1,2) & = 1 \
  bold(epsilon.alt)_(plus.minus)^* dot bold(epsilon.alt)_(plus.minus) & = 1 \
                  bold(epsilon.alt)_(1,2) dot bold(epsilon.alt)_(2,1) & = 0 \
  bold(epsilon.alt)_(plus.minus)^* dot bold(epsilon.alt)_(minus.plus) & = 0.
$
Using these we can find the projection of $bold(E)$ along the linear polarisation vectors $bold(epsilon.alt)_(1,2)$ or the circular polarisation vectors $bold(epsilon.alt)_(plus.minus)$ by

$
  bold(epsilon.alt)_(1,2) dot bold(E)",  " bold(epsilon.alt)_(plus.minus)^* dot bold(E),
$
which is trivially seen.

Consider the general polarisation vector
$
  bold(epsilon.alt) = E_1 bold(epsilon.alt)_1 + E_2 bold(epsilon.alt)_2,
$
with $E_k = A_k e^(alpha_k)$. Both $E_1$ and $E_2$ can be recovered by
$
  A_1^2 + A_2^2 &= abs(bold(epsilon.alt)_1 dot bold(E))^2 + abs(bold(epsilon.alt)_2 dot bold(E))^2 \
  A_1^2 - A_2^2 &= abs(bold(epsilon.alt)_1 dot bold(E))^2 - abs(bold(epsilon.alt)_2 dot bold(E))^2 \
  2 A_1 A_2 cos (alpha_2 - alpha_1) &= 2 Re[(bold(epsilon.alt)_1 dot bold(E))^* (bold(epsilon.alt)_2 dot bold(E))] \
  underbracket(2 A_1 A_2 sin(alpha_2 - alpha_1), "encode" E_1 "and" E_2) &= underbracket(2 Im[(bold(epsilon.alt)_1 dot bold(E))^* (bold(epsilon.alt)_2 dot bold(E))], "all measurable"),
$
which are known as the Stokes parameters for linear polarisation.

Likewise, with $ bold(epsilon.alt) = E_+ bold(epsilon.alt)_+ + E_- bold(epsilon.alt)_-, $ where $E_plus.minus = A_plus.minus e^(alpha_plus.minus)$ both $E_+$ and $E_-$ can be recovered by
$
  A_+^2 + A_-^2 &= abs(bold(epsilon.alt)_+^* dot bold(E))^2 + abs(bold(epsilon.alt)_-^* dot bold(E))^2 \
  2 A_+ A_- cos (alpha_- - alpha_+) &= 2 Re[(bold(epsilon.alt)_+^* dot bold(E))^* (bold(epsilon.alt)_-^* dot bold(E))] \
  2 A_+ A_- sin(alpha_- - alpha_+) &= 2 Im[(bold(epsilon.alt)_+^* dot bold(E))^* (bold(epsilon.alt)_-^* dot bold(E))] \
  underbracket(A_+^2 - A_-^2, "encode" E_+ "and" E_-) &= underbracket(abs(bold(epsilon.alt)_+^* dot bold(E))^2 - abs(bold(epsilon.alt)_-^* dot bold(E))^2, "all measurable"),
$
which are known as the Stokes parameters for circular polarisation.

1. The Stokes parameters for linear- and circular polarisation are identical(!) in the order written above.

2. The Stokes parameters are four functions of three quantities. They satisfy a relation of the form $ ("first")^2 = ("second")^2 + ("third")^2 + ("fourth")^2. $


