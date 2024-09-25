% vim: et
sig fc.

kind val, expr      type.

type lam        (val -> expr) -> val.
type ret        val -> expr.
type app        val -> val -> expr.
type let        expr -> (val -> expr) -> expr.
type shift0     ((expr -> expr) -> expr) -> expr.
type delim      expr -> expr.




