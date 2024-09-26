module fc.

step (let (ret V) T) (T V).
step (app (lam E) V) (E V).
step (delim (ret V)) (ret V).
step (delim E) (E' delim) :- stepc E E'.

step (delim E) (delim E') :- step E E'.
step (let E T) (let E' T) :- step E E'.

stepc (shift0 E) E.
stepc (let E T) (k\ E' (o\ k (let o T))) :- stepc E E'.

steps E E.
steps E E' :- step E E'', steps E'' E'.
