% vim: et
sig fc.

kind val, expr  type.

type lam        (val -> expr) -> val.
type ret        val -> expr.
type app        val -> val -> expr.
type let        expr -> (val -> expr) -> expr.
type shift0     ((expr -> expr) -> expr) -> expr.
type delim      expr -> expr.

%type step       expr -> expr -> o.
%type stepc      expr -> ((expr -> expr) -> expr) -> o.
%
%type steps      expr -> expr -> o.

kind nat type.
type z nat.
type s nat -> nat.

type is_nat nat -> o.
type add nat -> nat -> nat -> o.
type mult nat -> nat -> nat -> o.
type lt nat -> nat -> o.
type le nat -> nat -> o.

kind arith type.
type plus arith -> arith -> arith.
type times arith -> arith -> arith.
type lit nat -> arith.
type eval arith -> nat -> o.
