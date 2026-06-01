module

public import Mathlib.Algebra.Order.Group.Nat
public import Mathlib.Algebra.Tropical.Basic

@[expose] public section

/-!
# The tropical semiring N̄

We define the tropical semiring `N̄ = ℕ ∪ {+∞}` with min-plus
structure. This is the structure sheaf of the Arithmetic Site.

In Mathlib, this is `Tropical (WithTop ℕ)`:
- Addition is `min` (tropical addition), with identity `⊤ = +∞`
- Multiplication is `+` (ordinary addition), with identity `0`
-/

namespace ArithmeticSite

/-- The tropical semiring ℕ ∪ {+∞} with min-plus structure. -/
abbrev NBar := Tropical (WithTop ℕ)

/-- NBar is a commutative semiring. -/
instance : CommSemiring NBar := inferInstance

lemma NBar_add_idempotent (a : NBar) : a + a = a := by
  simp only [Std.le_refl, Tropical.add_eq_left]

open Tropical

example (a b : Tropical (WithTop ℕ)) : a * b = trop (untrop a + untrop b) := by
  simp only [trop_add, trop_untrop]

/-- The Frobenius endomorphism φ_n on N̄, given by tropical multiplication by n.
    On finite elements this is x ↦ n + x, and φ_n(+∞) = +∞. -/
def frobeniusEndomorphism (n : ℕ+) : NBar →+* NBar where
  toFun x := (trop (n : WithTop ℕ)) * x
  map_one' := by simp [Tropical.trop_one]
  map_mul' := by simp [mul_comm, mul_assoc]
  map_zero' := by simp [Tropical.trop_zero]
  map_add' := by simp [Tropical.add_def, min_add_add_left]

end ArithmeticSite
