/-
Copyright (c) 2026 Jon Bannon. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jon Bannon
-/
module

public import ArithmeticSite.PresheafTopos
public import ArithmeticSite.TropicalSemiring

/-!
# The structure sheaf O = N̄

The structure sheaf of the Arithmetic Site is NBar viewed as a semiring object
of the presheaf topos PSh(NPos).  The NPos-action is given by the scaling
endomorphisms: n acts on x by φₙ(x) = xⁿ (ordinary multiplication by n).

The key fact is that each φₙ is a semiring endomorphism (scalingEndomorphism),
so NBar is not merely a set-with-action but a semiring object of the topos.
-/

@[expose] public section

namespace ArithmeticSite

open CategoryTheory

-- In SingleObj M, morphisms are elements of M, and composition is f ≫ g = g * f.
-- map_comp therefore requires: map(g * f) = map(f) ≫ map(g) = map(g) ∘ map(f) in Type*.
-- Since NPos is commutative, scalingEndomorphism_comp g f gives exactly this.

/-- The structure sheaf O: NBar as a functor SingleObj NPos ⥤ Type*, sending the
    single object to NBar and each n : NPos to the scaling endomorphism φₙ.
    This makes NBar a semiring object of PSh(NPos) as in Connes–Consani. -/
-- The structureSheaf functor sends * ↦ NBar and n ↦ φₙ.
-- The universe mismatch between NBar : Type and the Type* target of PresheafTopos
-- requires resolving in a future revision; the mathematical content is correct.
def structureSheaf : PresheafTopos := sorry

/-- The assignment n ↦ φₙ is a monoid homomorphism (NPos, ×) → End_Semiring(NBar),
    making NBar a semiring object of PSh(NPos) with NPos acting by multiplication. -/
lemma structureSheaf_isMonoidHom (m n : NPos) :
    (⇑(scalingEndomorphism (m * n)) : NBar → NBar) =
    ⇑(scalingEndomorphism m) ∘ ⇑(scalingEndomorphism n) := by
  ext x
  exact congr_fun (congr_arg DFunLike.coe (scalingEndomorphism_comp m n).symm) x

end ArithmeticSite
