module shift0.


redv (lam E1) (lam E2) :- pi x\ red (E1 x) (E2 x).

red (app (lam E) V) (E V).
red (let (ret V) E) (E V).
red (delim L (ret V)) (ret V).
red (plug K (shift0 L E)) (E K) :- oflbl K L.
%red (let (shift0 L E1) E2) (shift0 L k\ E1 (kons (klet E2) k)).
%red (let E1 E2) E1' :- prs0 lnil E1 (x\ x) (k\ (kons (klet E2) k)) E1'.
%red (delim L (shift0 L E)) (E (kons (kdelim L) empty)).
%red (delim L E) (delim L E') :- prs0 lnil E (x\ shift0 L k\ x) (k\ kdelim L) E'.
%red (let (let E1 E2) E3) (let E1 (x\ let (E2 x) E3)).
% not finished

% congruence
red (shift0 L E) (shift0 L E') :- pi k\ oflbl k L => red (E k) (E' k).
red (let E1 E2) (let E1' E2) :- red E1 E1'.
red (let E1 E2) (let E1 E2') :- pi x\ red (E2 x) (E2' x).
red (delim L E) (delim L E') :- red E E'.
red (plug K E) (plug K E') :- red E E'.
red (ret V) (ret V') :- redv V V'.

% explicit cont substitution
red (plug kempty E) E.
red (plug (kons (klet E2) K) E1) (plug K (let E1 E2)).
red (plug (kons (kdelim L) K) E) (plug K (delim L E)).
%red (plug E (kons (plugk K') K)) (plug (plug E K') K).
%red (plug E K) (plug E K') :- redk K K'.


diflbl z (s N).
diflbl (s N) z.
diflbl (s N1) (s N2) :- diflbl N1 N2.
