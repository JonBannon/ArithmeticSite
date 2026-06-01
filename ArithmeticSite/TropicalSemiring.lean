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

lemma NBar_add_idempotent (a : NBar) : a + a = a := by
  simp only [Std.le_refl, Tropical.add_eq_left]

open Tropical

def frobeniusEndomorphism (n : ℕ+) : AddMonoid.End NBar where
  toFun x := trop (n : WithTop ℕ) * x
  map_zero' := by rfl
  map_add' x y := by
    change trop (↑n : WithTop ℕ) * (x + y) =
         trop (↑n : WithTop ℕ) * x + trop (↑n : WithTop ℕ) * y
    rw [left_distrib]

lemma frobenius_comp (m n : ℕ+) :
    frobeniusEndomorphism (m + n) =
    (frobeniusEndomorphism m).comp (frobeniusEndomorphism n) := by
  ext x
  change trop (↑↑(m + n) : WithTop ℕ) * x = trop (↑↑m : WithTop ℕ) * (trop (↑↑n : WithTop ℕ) * x)
  rw [← mul_assoc]
  congr 1

/-- The Frobenius endomorphisms form a semigroup homomorphism from (ℕ+, +)
    into AddMonoid.End NBar. -/
lemma frobenius_map_add (m n : ℕ+) :
    frobeniusEndomorphism (m + n) =
    (frobeniusEndomorphism m).comp (frobeniusEndomorphism n) :=
  frobenius_comp m n



end ArithmeticSite
