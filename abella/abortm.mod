module abortm.


redv (lam E1) (lam E2) :- pi x\ red (E1 x) (E2 x).

red (app (lam E) V) (E V).
red (let (ret V) E) (E V).
red (delim L (ret V)) (ret V).
red (delim L (letcc L E)) (delim L (E empty)).
red (let (letcc L E1) E2) (letcc L (k\ let (E1 (kons (letk E2) k)) E2)).
red (let E1 x\ letcc L (E2 x)) (letcc L k\ let E1 x\ (E2 x k)).
red (delim L' (letcc L E)) (letcc L k\ delim L (E (kons (delimk L) k))) :- diflbl L L'.
red (plug (letcc L E) K) (letcc L k\ plug (E (kons (plugk K) k)) K) :- oflbl K L.
red (let (abortm L E1) E2) (abortm L E1).
red (delim L' (abortm L E)) (abortm L E) :- diflbl L L'.
red (delim L (abortm L E)) (delim L E).
red (plug (abortm L E) K) E :- oflbl K L.

% congruence
red (letcc L E) (letcc L E') :- pi k\ oflbl k L => red (E k) (E' k).
red (let E1 E2) (let E1' E2) :- red E1 E1'.
red (let E1 E2) (let E1 E2') :- pi x\ red (E2 x) (E2' x).
red (delim L E) (delim L E') :- red E E'.
red (abortm L E) (abortm L E') :- red E E'.
red (plug E K) (plug E' K) :- red E E'.
red (ret V) (ret V') :- redv V V'.

% explicit cont substitution
red (plug E empty) E.
red (plug E1 (kons (letk E2) K)) (plug (let E1 E2) K).
red (plug E (kons (delimk L) K)) (plug (delim L E) K).
red (plug E (kons (plugk K') K)) (plug (plug E K') K).
red (plug E K) (plug E K') :- redk K K'.
redkf (letk E) (letk E') :- pi x\ red (E x) (E' x).
redkf (plugk K) (plugk K') :- redk K K'.
redk (kons F K) (kons F' K) :- redkf F F'.
redk (kons F K) (kons F K') :- redk K K'.

% red (let (let E1 E2) E3) (let E1 (x\ let (E2 x) E3)).

