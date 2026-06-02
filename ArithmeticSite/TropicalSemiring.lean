module

public import Mathlib.Algebra.Order.Group.Nat
public import Mathlib.Algebra.Tropical.Basic
public import ArithmeticSite.Monoid

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

open Tropical

/-- The action of n ∈ ℕ+ on NBar by scaling: x ↦ xⁿ (n-fold tropical
    multiplication, i.e. ordinary multiplication of the underlying element by n).
    This is a semiring endomorphism, making NBar into a semiring object of
    the presheaf topos over BNPos with NPos acting by multiplication,
    as in Connes–Consani "On the Arithmetic Site". -/
def scalingEndomorphism (n : ℕ+) : NBar →+* NBar where
  toFun x := x ^ (n : ℕ)
  map_one' := one_pow _
  map_mul' x y := mul_pow x y _
  map_zero' := zero_pow n.ne_zero
  map_add' x y := by
    apply untrop_injective
    simp only [untrop_add, untrop_pow]
    rcases le_total (untrop x) (untrop y) with h | h
    · simp [inf_eq_left.mpr h, inf_eq_left.mpr (nsmul_le_nsmul_right h _)]
    · simp [inf_eq_right.mpr h, inf_eq_right.mpr (nsmul_le_nsmul_right h _)]

/-- The scaling endomorphisms compose multiplicatively:
    applying scalingEndomorphism n then scalingEndomorphism m
    equals scalingEndomorphism (m * n). -/
lemma scalingEndomorphism_comp (m n : ℕ+) :
    (scalingEndomorphism m).comp (scalingEndomorphism n) = scalingEndomorphism (m * n) := by
  ext x
  simp only [RingHom.comp_apply, scalingEndomorphism, RingHom.coe_mk,
             MonoidHom.coe_mk, OneHom.coe_mk]
  rw [← pow_mul]
  congr 1
  exact mul_comm _ _

end ArithmeticSite
