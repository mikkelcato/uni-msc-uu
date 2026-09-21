#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= On cavities
== Cylindrical cavity
Consider a cavity created by closing the two ends $z = 0$ and $z = d$ of a waveguide. We'll have two new boundary conditions, corresponding to the usual boundary conditions applied to each end of the cavity.

1. Consider a TM wave with $H_z = 0$. We require ($bold(n) -> bold(hat(z))$) $ bold(hat(z)) times bold(E) = 0, $ or $bold(E)_t = 0$ when $z = 0$ and $z = d$.

2. Consider a TE wave with $E_z = 0$. We require ($bold(n) -> bold(hat(z))$) $ bold(hat(z)) dot bold(H) = 0, $ or $H_z = 0$ when $z = 0$ and $z = d$.

Before we used an ansatz of the form
$
  E_z & =^"TM" psi(x, y) e^(plus.minus i k z) \
  H_z & =^"TE" psi(x, y) e^(plus.minus i k z).
$
We'll instead use an ansatz of the form
$
  E_z & =^"TM" psi(x, y) (A sin k z + B cos k z),
$
implying
$
  bold(E)_t =^"TM" 1/gamma_lambda^2 grad_t (pdv(E_z, z)).
$
Hence,
$
  A & = 0",  " k_p = (p pi)/d,
$
and
$
        E_z & =^"TM" psi(x, y) cos ((p pi z)/d) \
  bold(E)_t & =^"TM" 1/gamma_lambda^2 grad_t (pdv(E_z, z)) \
            & = - (p pi)/(gamma_lambda^2 d) sin((p pi z)/d) grad_t psi.
$
Likewise,
$
              H_z & =^"TE" psi(x, y) sin((p pi z)/d) \
  bold(H)_t (x,y) & =^"TE" 1/gamma_lambda^2 grad_t (pdv(H_z, z)) \
                  & = (p pi)/(gamma_lambda^2 d) cos((p pi z)/d) grad_t psi.
$

With $k_p$ being quantised we have
$
  omega_(lambda p)^2 & = 1/(mu epsilon.alt) (k_p^2 + gamma_lambda^2) \
                     & = 1/(mu epsilon.alt) ((pi^2 p^2)/d^2 + gamma_lambda^2).
$
Here, the dependence on $d$ is nice and can be used to "tune" the resonance frequencies $omega_(lambda p)$.

=== An example
Consider a cavity created from a waveguide with circular cross-section of radius $R$. We would like to compute $omega_(lambda p)$. One way to do this is by ignoring the cavity the part and simply quantising $k_p$ when we have an expression for $omega_lambda$. Hence, we consider TE modes satisfying
$
  evaluated(pdv(H_z, n))_S = 0,
$
and
$
  H_z = psi(x, y) e^(plus.minus i k z).
$
With cylindrical coordinates the eigenfunctions of the Laplacian are usually written in terms of the Bessel functions
$
  psi(rho, phi.alt) = E_0 J_m (gamma_(m n) rho) e^(plus.minus i m phi.alt),
$
where
$
  gamma_(m n) = x'_(m n)/R,
$
is the $n$th root of $J'_m = 0$.

The resonance frequencies are then
$
  omega_(m n p) = 1/sqrt(mu epsilon.alt) ((x'_(m n))^2/R^2 + (p^2 pi^2)/d^2)^(1\/2),
$
with $m >= 0$ and $n, p >= 1$. The "minimal" TE mode has $m = n = p = 1$, and
$
  omega_111 & = (1.841)/(sqrt(mu epsilon.alt) R) (1 + 2.912 R^2/d^2)^(1\/2).
$

== "Thickening" and loss
An ideal cavity has oscillations with $omega_(lambda p)$. However, real cavities have oscillations around the ideal $omega_(lambda p)$. This "thickening" is (partly) due to losses in the conducting walls, analogous to waveguides.

Consider an electric field subject to losses (schematically)
$
  E(t) = E_0 e^(-i (omega_0 + dd(omega, d: Delta) )t) e^(- omega_0 t\/2 Q),
$
where $omega_0$ is the ideal frequency, $dd(omega, d: Delta)$ quantifies the shift in frequency, and $Q$ determines the decay over time. All oscillations eventually die as $t -> oo$ because of $Q$.

We Fourier transform the above and find
$
  E(omega) & tilde 1/(-omega\/(2 Q) + i (omega-omega_0 - dd(omega, d: Delta))),
$
implying
$
  abs(E(omega))^2 &tilde 1/((omega-omega_0 - dd(omega, d: Delta))^2 + (omega_0\/2Q)^2).
$
Then measuring the frequency distribution can be used to deduce $Q$ by noting the width $Gamma$ at half-maximum is $omega_0\/Q$. Hence,
$
  Q = omega_0/Gamma,
$
describes both the "thickness" of the frequency distribution and the power loss. This is why some call $Q$ the "quality" parameter.

One can show
$
  Q = mu/mu_c (V/(S_A delta)) times "some geometric factor".
$
