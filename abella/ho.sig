sig ho.

kind val,expr type.
kind lbl type.

type lam    (val -> expr) -> val.

type ret    val -> expr.
type app    val -> val -> expr.
type let    expr -> (val -> expr) -> expr.
type shift0 ((expr -> expr) -> expr) -> expr.
type delim  expr -> expr.

type redv   val -> val -> o.
type red    expr -> expr -> o.
type oflbl  (expr -> expr) -> lbl -> o.

type z lbl.
type s lbl -> lbl.

%type eqlbl  lbl -> lbl -> o.
type diflbl  lbl -> lbl -> o.

