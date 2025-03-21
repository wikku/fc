# A Fine Calculus for Static Delimited Control

We consider a variant of the call-by-value $λμ$-calculus extended with control delimiters, in which $μ$ becomes the static delimited control operator `shift0`. We propose new reduction rules for cases where the captured continuation can be determined statically. We let delimiters carry data (resulting in a form of dynamic binding), which lets us express deep effect handlers. We propose an encoding of return clauses, letting us omit them to simplify syntax. We prove that the reductions preserve semantics. We describe the problems with proving confluence and prove it only for a subcalculus. The proofs are verified in the Abella proof assistant. We argue that the calculus is stronger than previous results in the literature and could form basis for reasoning and optimizations for the aforementioned forms of control.

## Abella formalization

Version: `c17cb187` (https://github.com/abella-prover/abella/tree/c17cb18730c57467af91a78adf538ade9dfeb424)
