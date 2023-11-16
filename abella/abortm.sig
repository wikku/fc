sig abortm.

kind val,expr,kontf,kont type.
kind lbl type.

type diflbl lbl -> lbl -> o.

type lam    (val -> expr) -> val.

type ret    val -> expr.
type app    val -> val -> expr.
type let    expr -> (val -> expr) -> expr.
type letcc  lbl -> (kont -> expr) -> expr.
type abortm lbl -> expr -> expr.
type delim  lbl -> expr -> expr.
type plug   expr -> kont -> expr.

type letk   (val -> expr) -> kontf.
type delimk lbl -> kontf.
type plugk  kont -> kontf.

type empty kont.
type kons kontf -> kont -> kont.

type redv   val -> val -> o.
type red    expr -> expr -> o.
type redkf  kontf -> kontf -> o.
type redk   kont -> kont -> o.
type oflbl  kont -> lbl -> o.
