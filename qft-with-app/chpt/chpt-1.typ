#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Review of "axiomatic" quantum mechanics
== Observables and states
All states $ket(Psi)$ in quantum mechanics live in a Hilbert space $scr(H)$, which for our purposes is $CC^oo$ with an inner product. The states
$
  ket(Psi) in scr(H) "and" ket(Psi') = a ket(Psi) in scr(H) "with" a eq.not 0 in CC,
$
are said to describe the same physical state. We will typically assume our states are normalised
$
  braket(Psi) = 1.
$
There is still an ambiguity up to an overall phase, since $ket(Psi)$ and $e^(i theta) ket(Psi)$ described the same physcial state.

All observables $hat(A)_1, hat(A)_2, dots.c$ are represented by operators. We assume these are self-adjoint
$
  hat(A)^dagger = hat(A).
$
This implies
$
  braket(hat(A) Psi, chi) = braket(Psi, hat(A) chi).
$
When performing measurements of an observable $hat(A)$, the possible measuremnent outcomes are its eigenvalues $lambda$
$
  hat(A) ket(Psi_a) = lambda ket(Psi_a).
$
Since $hat(A)$ is self-adjoint, its eigenvalues are real $lambda in RR$.#footnote[and orthogonality when the eigenvalues are distinct.] We say that observables are simultaneous when they commute
$
  [hat(A)_i, hat(A)_j] = 0.
$
When this is the case $hat(A)_i$ and $hat(A)_j$ are said to be compatible observables, meaning we can find a shared eigenbasis, allowing the observables to be measured simultaneously.

We can define the $E_lambda$-projector, which projects a state $ket(Psi)$ onto the $lambda$-eigenspace#footnote[Think $ket(Psi) = sum_lambda sum_a c_(lambda, a) ket(Psi_(lambda,a))$.]
$
  E_lambda ket(Psi) = sum_a c_(lambda,a) ket(Psi_(lambda,a)).
$
Obtaining the value $lambda$ in a measurement projetcs the state onto the $lambda$-eigenspace.#footnote[This is the state "collapsing".] The probability of obtaining the eigenvalue $lambda$ when measuring $hat(A)$ in the state $ket(Psi)$ is#footnote[We use $E_lambda^2 = E_lambda$ and $E_lambda^dagger = E_lambda$.]
$
  P_lambda (ket(Psi)) = braket(Psi, E_lambda Psi) = norm(E_lambda ket(Psi))^2,
$
which is the Born rule.

== Dynamics
There is one observable above all others, namely the Hamiltonian $hat(H)$, which enters into the Schrödinger equation
$
  i hbar pdv(, t) ket(Psi) = hat(H) ket(Psi),
$
which is the equation of motion in quantum mechanics.#footnote[Or, one of the equations of motion.] The Schrödinger equation has a formal solution in terms of the unitary time-evolution operator $hat(U)(t)$
$
  ket(Psi(t)) = hat(U)(t) ket(Psi(0)),
$
with
$
  hat(U)(t) = exp[-(i hat(H) t)/hbar].
$
The time-evolution operator satisfies
$
  hat(U)^dagger hat(U) = 1",  " hat(U)(t_1+t_2) = hat(U)(t_1) hat(U)(t_2),
$
implying $norm(ket(Psi(t))) = norm(ket(Psi(0)))$.

This formalism is very complicated, and when combined with special relativity particle number is no longer conserved. Hence, we would like a "simpler" reformulation which works.
