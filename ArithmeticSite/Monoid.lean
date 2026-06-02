module

public import Mathlib.Data.PNat.Basic

@[expose] public section

/-!
# The multiplicative monoid ℕˣ

We record that `ℕ+` (the positive natural numbers) forms a
commutative monoid under multiplication. This is the monoid
whose classifying topos is the Arithmetic Site.
-/

namespace ArithmeticSite

/-- The multiplicative monoid of positive integers. -/
abbrev NPos := ℕ+

instance NPos_commMonoid : CommMonoid NPos := inferInstance

end ArithmeticSite
