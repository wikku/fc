sig shift0.

kind val,expr,kontf,kont type.
kind lbl type.

type lam    (val -> expr) -> val.

type ret    val -> expr.
type app    val -> val -> expr.
type let    expr -> (val -> expr) -> expr.
type shift0 lbl -> (kont -> expr) -> expr.
type delim  lbl -> expr -> expr.
type plug   kont -> expr -> expr.

type klet   (val -> expr) -> kontf.
type kdelim lbl -> kontf.
%type kplug  kont -> kontf.

type kempty kont.
type kons   kontf -> kont -> kont.

type redv   val -> val -> o.
type red    expr -> expr -> o.
type oflbl  kont -> lbl -> o.

type z lbl.
type s lbl -> lbl.

%type eqlbl  lbl -> lbl -> o.
type diflbl  lbl -> lbl -> o.

