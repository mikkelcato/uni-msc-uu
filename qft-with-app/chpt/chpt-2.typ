#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= The "heuristic" path integral
== The propagator
We consider a Hamiltonian of the form
$
  hat(H) = hat(p)^2/(2 m) + V(q),
$
i.e. that of a single particle in some potential $V(q)$.  We seek a way to compute the probability of this particle moving from $(q_0,t_0)$ to $(q_1,t_1)$.

By definition, and using $hat(H) ket(Psi_n) = E_n ket(Psi_n)$, we have#footnote[We expand $ket(Psi(0)) = sum_(n=0)^oo c_n ket(Psi_n (0))$]
$
  ket(Psi(t)) & = hat(U)(t) ket(Psi(0)) \
              & = exp[-(i hat(H) t)/hbar] sum_(n=0)^oo c_n ket(Psi_n) \
              & = sum_(n=0)^oo c_n exp[-(i E_n t)/hbar] ket(Psi_n)
$
Also, we have
$
  c_n & = braket(Psi_n, Psi(0)),
$
meaning
$
  ket(Psi(t)) = sum_(n=0)^oo exp[- (i E_n t)/hbar] ket(Psi_n) braket(Psi_n, Psi(0)).
$
We insert the identity
$
  hat(I) = integral_RR dd(tilde(q)) ketbra(tilde(q)),
$
and obtain
$
  ket(Psi(t)) & = integral_RR dd(tilde(q)) [sum_(n=0)^oo exp[-(i E_n t)/hbar] ket(Psi_n) braket(Psi_n, tilde(q))] underbracket(braket(tilde(q), Psi(0)), Psi(tilde(q), 0)).
$
We project onto the state $bra(q)$
$
  Psi(q, t) &= braket(q, Psi(t)) \
  &= integral_RR dd(tilde(q)) [sum_(n=0)^oo exp[-(i E_n t)/hbar] braket(q, Psi_n) braket(Psi_n, tilde(q)) ] Psi(tilde(q), 0) \
  &= integral_RR dd(tilde(q)) [sum_(n=0)^oo exp[-(i E_n t)/hbar] Psi_n (q) Psi_n^* (tilde(q)) ] Psi(tilde(q), 0) \
  &= integral_RR K(q,t;tilde(q),0) Psi(tilde(q), 0) dd(tilde(q)),
$

where
$
  K(q,t;tilde(q),tilde(t)) = braket(q, hat(U)(t,tilde(t)), tilde(q))
$
is the propagator.#footnote[This is immediate upon inserting $ hat(I) = sum_(n=0)^oo ketbra(Psi_n). $] This can be written as $braket(q","t, tilde(q)","tilde(t))$ if one defines
$
  bra(q","t) = bra(q) hat(U) (t,t_0),
$
where $t_0$ is some reference time. We can think of the propagator as a transition amplitude.

== The "path integral"
With the propagator defined we can evolve stepwise $(tilde(q),0) -> (q_1,t_1) -> (q_2,t_2)$ as
$
  Psi(q_2, t_2) &= integral_RR K(q_2,t_2;q_1,t_1) Psi(q_1, t_1) dd(q_1) \
  &= integral_RR K(q_2,t_2;q_1,t_1) underbracket(integral_RR K(q_1,t_1;tilde(q),0) Psi(tilde(q), 0) dd(tilde(q)), Psi(q_1, t_1)) dd(q_1).
$
Taking this to infinity one essentially-ish obtains the path integral in $RR^oo$. However, we still need an expression for the propagator.

Consider a single free particle
$
  hat(H)_0 = hat(p)^2/(2 m).
$
We have
$
  K(q',t';q,t) & = braket(q', hat(U)(t',t), q) \
  & = integral_RR bra(q') exp[- (i hat(H)_0 (t'-t))/hbar] ket(p) braket(p, q) dd(p) \
  & = integral_RR exp[- (i E_p (t'-t))/hbar] braket(q', p) braket(p, q) dd(p),
$
where ($hat(H)_0 ket(p) = E_p ket(p)$)
$
  E_p = p^2/(2 m),
$
and#footnote[Consider $braket(q, hat(p), p)$, and $braket(p, p') = delta(p-p')$.]
$
  braket(q', p) & = 1/sqrt(2 pi hbar) exp[(i p q')/hbar] \
   braket(p, q) & = 1/sqrt(2 pi hbar) exp[- (i p q)/hbar].
$
Hence, we find
$
  K(q',t';q,t) &= 1/(2 pi hbar) integral_RR exp{i/hbar [p (q'-q) - p^2/(2 m) (t'-t)]} dd(p),
$
which is nice.

When dealing with more complicated Hamiltonians
$
  hat(H) = hat(p)^2/(2 m) + V(q),
$
we quickly run into problems since
$
  hat(p) = - i hbar pdv(, q),
$
implying $[hat(p)^2, V(q)] eq.not 0$. This is problematic since $e^(A+B) = e^A e^B$ requires $[A,B] = 0$. We could write
$
  exp[-(i hat(H) t)/hbar] = sum_n^(oo) 1/n! (-i/hbar)^n underbracket((hat(H) t)^n, "not useful" #linebreak() "since non-commuting").
$
However, what if $t -> dd(t, d: Delta)$ small? We hope
$
  exp[- (i hat(H) dd(t, d: Delta))/hbar] tilde.eq exp[- (i hat(p)^2 dd(t, d: Delta))/(2 m hbar)] exp[- (i V(q) dd(t, d: Delta))/hbar],
$
since this would allow us to write for $T$ large
$
  exp[-(i hat(H) T)/hbar] = lim_(n -> oo) { exp[- (i hat(p)^2 dd(t, d: Delta))/(2 m hbar)] exp[- (i V(q) dd(t, d: Delta))/hbar]}^n.
$
Recall, Baker-Campbell-Hausdorff#footnote[This can be proven by considering $e^(x A) e^(x B) = e^(C(x))$.]
$
  e^A e^B = e^(A + B + 1/2 [A,B] + dots.c).
$
Using this we immediately find
$
  e^(A + B) = lim_(n -> oo) [e^(A\/n) e^(B\/n)]^n,
$
since the "correction"-terms are suppressed by $n$. Which is what we need!

Then for small $dd(t, d: Delta)$ we have
$
  K(q',t+dd(t, d: Delta); q, t) tilde.eq 1/(2 pi hbar) integral_RR exp{i/hbar [p(q'-q) - underbracket((p^2/(2 m) + V(q)), H(p,q)) dd(t, d: Delta)]} dd(p).
$
Then evolving stepwise (using $n$ steps) we find (with $q_0 = q$ and $q_n = q'$)
$
  K_n (q',t';q,t) = integral_RR dd(q_1) dots.c dd(q_(n-1)) product_(k=0)^(n-1) K(q_(k+1), t_(k+1); q_k, t_k),
$
Taking $n -> oo$ and using the expression for small $dd(t, d: Delta)$
$
  K (q',t';q,t) &= lim_(n -> oo) integral_RR product_(k=0)^(n-1) dd(q_k) product_(k=0)^(n-1) dd(p_k)/(2 pi hbar) exp{i/hbar sum_(k=0)^(n-1) [p_k (q_(k+1)-q_k) - H(p_k,q_k) dd(t, d: Delta)]}.
$
Note,
$
  q_(k+1)-q_k tilde.eq dot(q) (t_k) dd(t, d: Delta),
$
implying the continuum limit is
$
  K(q',t';q,t) = integral dd(p, q, d: cal(D)) exp{i/hbar integral_t^(t') dd(tau) [p(tau) dot(q) (tau) - H(p(tau),q(tau))]},
$
up to the "precise" meaning of the path-integral measure.

With the (classical) Hamiltonian
$
  H(p,q) = p^2/(2 m) + V(q),
$
we find
$
  K(q',t';q,t) = integral dd(p, q, d: cal(D)) exp{i/hbar integral_t^(t') dd(tau) [p dot(q) - p^2/(2 m) - V(q)]}.
$
The $p$-integrals can be done by noting
$
  p dot(q) - p^2/(2 m) = - 1/(2 m) (p-m dot(q))^2 + m/2 dot(q)^2.
$
We find the $p$-integrals are Gaussian, meaning their contribution is eaten by the normalisation. Hence,
$
  K(q',t';q,t) &tilde integral dd(q, d: cal(D)) exp{i/hbar integral_t^(t') dd(tau) underbracket([m/2 dot(q)^2 - V(q)], "Lagrangian")} \
  &tilde integral_(q(t)=q)^(q(t')=q') dd(q, d: cal(D)) exp[(i S[q])/hbar],
$
where $S[q]$ is the classical action! This equation tells us to "sum over all paths (connecting the endpoints), weighted by the action" when computing the propagator.

The path integral as written above is typically taken as a definition#footnote[There is no non-heuristic derivation].
