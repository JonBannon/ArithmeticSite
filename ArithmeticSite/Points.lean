/-
Copyright (c) 2026 Jon Bannon. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jon Bannon
-/
module

public import Mathlib.CategoryTheory.Limits.Shapes.Terminal
public import ArithmeticSite.TheArithmeticSite

/-!
# Points of the Arithmetic Site

A point of a topos E is a geometric morphism p : Set → E.  For the presheaf
topos PSh(NPos), points correspond to flat NPos-sets — sets X with a NPos-action
that arises as a filtered colimit of free NPos-sets.

The remarkable theorem of Connes–Consani (Theorem 2.2) is that the space of
isomorphism classes of points of PSh(NPos) is canonically isomorphic to the
adèle class space Q×₊ \ A_f / Ẑ*.
-/

@[expose] public section

namespace ArithmeticSite

/-- The adèle ring A_f of ℚ (finite adèles).  Full formalization requires
    Mathlib's adèle theory. -/
noncomputable def FiniteAdeles : Type* := sorry

/-- The group Q×₊ = ℚ× ∩ ℝ>0 of positive rationals under multiplication. -/
noncomputable def PositiveRationals : Type* := sorry

/-- The group Ẑ* = (lim ← Z/nZ)× of units of the profinite completion of ℤ. -/
noncomputable def ZhatUnits : Type* := sorry

/-- The adèle class space Q×₊ \ A_f / Ẑ*: the double quotient that parametrises
    the isomorphism classes of points of PSh(NPos).
    This is a piece of the full adèle class space of ℚ. -/
noncomputable def AdeleClassSpace : Type* := sorry

/-- The space of isomorphism classes of points of PSh(NPos) is canonically
    isomorphic to the adèle class space Q×₊ \ A_f / Ẑ*.
    This is Theorem 2.2 of Connes–Consani (2014).  The proof identifies
    points with flat NPos-sets, classifies these as non-trivial subgroups
    of (ℚ, ℚ₊), and identifies the space of isomorphism classes with the
    double quotient. -/
theorem points_are_adeleClasses :
    -- Placeholder: the type of isomorphism classes of points of PSh(NPos)
    -- is isomorphic to AdeleClassSpace
    True := by
  sorry

end ArithmeticSite
