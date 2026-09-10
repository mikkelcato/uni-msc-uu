#import "../../temp.typ": *
#show: chpt-note.with()
#set enum(numbering: "(i)")

= Gaussian integrals
To compute the path integral we consider a much simpler problem, namely integrals of the form
$
  cal(I) = integral_RR g(x) exp[-1/hbar f(x)] dd(x),
$
and analogous integrals for $dd(x, [n])$. The idea is then to "remove" the dependence on $n$, and take $n -> oo$.

== The saddle-point method
We will take $hbar$ to be a "small" number. This makes the minima of $f(x)$ interesting. Suppose $c$ is a non-degerate minimum. Then
$
  f'(c) = 0",  " f''(c) > 0.
$
We expand $f(x)$ around $c$
$
  f(x) = f(c) + 1/2 f''(c) (x-c)^2 + dots.c.
$
Hence,
$
  cal(I) = exp[-1/hbar f(c)] integral_RR g(x) exp[-1/(2 hbar) f''(c) (x-c)^2 + dots.c] dd(x).
$
We substitute (to remove $hbar$)
$
  y = (x-c)/sqrt(hbar)",  " x = c + sqrt(hbar) y",  " dd(x) = sqrt(hbar) dd(y),
$
and obtain
$
  cal(I) = exp[-1/hbar f(c)] sqrt(hbar) integral_RR g(c+sqrt(hbar)y) exp[-1/2 f''(c) y^2 -1/3! sqrt(hbar) f^((3)) (c) y^3+ dots.c] dd(y).
$
We expand both $g(dots)$ and $exp(y^3 +"higher orders")$ as
$
    g(dots) & = sum_(k=0)^oo (g^((k)) (c))/k! (sqrt(hbar) y)^k \
  exp(dots) & = sum_(k=0)^oo 1/k! (- 1/3! sqrt(hbar) f^((3)) (c) y^3)^k.
$

After substituting these we will find integrals of the form
$
  cal(I)_"Gaussian" = integral_RR y^k exp[-1/2 y^2] dd(y)
$

== Gaussian integrals in one dimension
We can compute $cal(I)_"Gaussian"$ with the help of the generating function
$
  Z[J] = integral_RR exp[-1/2 y^2 + J y] dd(y).
$
$Z[J]$ is defined such that
$
  dv(Z[J], J, k) = integral_RR y^k exp[-1/2 y^2 + J y] dd(y),
$
implying
$
  cal(I)_"Gaussian" = evaluated(dv(Z[J], J, k))_(J=0).
$
We can rewrite $Z[J]$ as
$
  Z[J] & = integral_RR exp[-1/2 (y^2 - 2 y J + J^2) + 1/2 J^2] dd(y) \
       & = exp[1/2 J^2] integral_RR exp[-1/2 (y-J)^2] dd(y) \
       & = exp[1/2 J^2] integral_RR exp[-1/2 tilde(y)^2] dd(tilde(y)) \
       & = sqrt(2 pi) exp[1/2 J^2] \
       & = sqrt(2 pi) sum_(n=0)^oo 1/(2^n n!) J^(2 n).
$
This can be compared with
$
  Z[J] & = integral_RR exp[-1/2 y^2 + J y] dd(y) \
       & = sum_(k=0)^oo 1/k! J^k integral_RR y^k exp[-1/2 y^2] dd(y) \
       & = sum_(k=0)^oo 1/k! J^k cal(I)_"Gaussian".
$
Then comparing coefficients of $J^k$ we find for $k$ odd
$
  cal(I)_"Gaussian" = 0,
$
and for $k = 2 n$
$
  cal(I)_"Gaussian" & = integral_RR y^(2 n) exp[-1/2 y^2] dd(y) \
                    & = sqrt(2 pi) (2n)!/(2^n n!) in ZZ.
$

As a simple example consider
$
  cal(I)_"ex" = integral_RR exp[-1/hbar (1/2 x^2 + 1/4! x^4)] dd(x).
$
We do $x = sqrt(hbar) y$
$
  cal(I)_"ex" &= sqrt(h) integral_RR exp[-1/2 y^2 - 1/4! hbar y^4 ] dd(y) \
  &= sqrt(hbar) sum_(k=0)^oo hbar^k/(4!)^k integral_RR y^(4 k) exp[-1/2 y^2] dd(y) \
  &tilde "asymptotic expansion. "
$
Hence, we will find (or similar, compare with previous $cal(I)$)
$
  cal(I) &= sqrt(hbar) underbracket(exp[-1/hbar f(c)], "non-analytic") underbracket((a_0 + hbar a_1 + hbar^2 a_2 + dots), "asymptotic expansion") \
  &= "non-analytic piece" times "nice piece,"
$
where the non-analytic piece is a source of pain.

== Gaussian integrals in $n$ dimensions
Recall
$
  integral_RR exp[-1/2 alpha x^2] dd(x) = sqrt((2 pi)/alpha),
$
with $alpha > 0$ (we assumed $alpha = 1$ above).

Considering integrals in $RR^n$ we have an analogous integral
$
  cal(I)_n & = integral_(RR^n) exp[-1/2 x^i B_(i j) x^j] dd(x, [n]) \
           & = integral_(RR^n) exp[-1/2 bold(x)^TT B bold(x)] dd(x, [n]),
$
where $B$ is a positive-definite symmetric $n times n$ matrix. This implies $B$ can be diagonalised
$
  B = O^TT D O,
$
where $O$ is an orthogonal matrix and $D$ is the diagonal matrix
$
  D = diagonalmatrix(lambda_1, dots.down, lambda_n).
$
Then
$
  cal(I)_n &= integral_(RR^n) exp[-1/2 bold(x)^TT O^TT D O bold(x)] dd(x, [n]) \
  &= integral_(RR^n) exp[-1/2 (O bold(x))^TT D (O bold(x))] dd(x, [n]) \
  &=^(det O = 1) integral_(RR^n) exp[-1/2 bold(y)^TT D bold(y)] dd(y, [n]) \
  &=^(D "diagonal") integral_(RR^n) exp[-1/2 sum_(i=1)^n lambda_i y_i^2] dd(y, [n]) \
  &= product_(i=1)^n sqrt((2 pi)/lambda_i).
$
Using
$
  det B = product_(i=1)^n lambda_i,
$
we find
$
  cal(I)_n = integral_(RR^n) exp[-1/2 bold(x)^TT B bold(x)] dd(x, [n]) = (2 pi)^(n\/2)/sqrt(det B).
$

