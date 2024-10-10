module fc.

%step (let (ret V) T) (T V).
%step (app (lam E) V) (E V).
%step (delim (ret V)) (ret V).
%step (delim E) (E' delim) :- stepc E E'.
%
%step (delim E) (delim E') :- step E E'.
%step (let E T) (let E' T) :- step E E'.
%
%stepc (shift0 E) E.
%stepc (let E T) (k\ E' (o\ k (let o T))) :- stepc E E'.
%
%steps E E.
%steps E E' :- step E E'', steps E'' E'.

is_nat z.
is_nat (s N) :- is_nat N.

add z N N :- is_nat N.
add (s N) M (s L) :- add N M L.

mult z N z :- is_nat N.
mult (s N) M L :- mult N M NM, add M NM L.

eval (lit N) N :- is_nat N.
eval (plus N M) L :- eval N N', eval M M', add N' M' L.
eval (times N M) L :- eval N N', eval M M', mult N' M' L.

lt z (s N) :- is_nat N.
lt (s N) (s M) :- lt N M.

le N M :- lt N M.
lt N N :- is_nat N.
