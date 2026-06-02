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

In SingleObj NPos, morphisms are elements of NPos and composition satisfies
f ≫ g = g * f (comp_as_mul).  `CategoryTheory.asHom` embeds NBar → NBar into
NBar ⟶ NBar; one has asHom id = 𝟙 NBar and asHom h ≫ asHom k = asHom (k ∘ h),
both by rfl.
-/

@[expose] public section

namespace ArithmeticSite

open CategoryTheory SingleObj TypeCat

/-- The structure sheaf O: NBar as a functor SingleObj NPos ⥤ Type, sending the
    single object to NBar and each n : NPos to the scaling endomorphism φₙ.
    This makes NBar a semiring object of PSh(NPos) as in Connes–Consani. -/
def structureSheaf : PresheafTopos where
  obj _ := NBar
  map f := ofHom (scalingEndomorphism f)
  map_id x := by
    cases x  -- SingleObj NPos has one object; unfold it
    simp only [id_as_one]
    have h : ⇑(scalingEndomorphism (1 : NPos)) = @id NBar := by
      funext x; simp [scalingEndomorphism]
    rw [h]; rfl
  map_comp f g := by
    -- Collapse all three objects to star NPos (SingleObj NPos has one object)
    rename_i X Y Z
    obtain rfl : X = star NPos := Subsingleton.elim _ _
    obtain rfl : Y = star NPos := Subsingleton.elim _ _
    obtain rfl : Z = star NPos := Subsingleton.elim _ _
    -- Now f g : NPos; asHom h ≫ asHom k = asHom (k ∘ h) by rfl
    rw [show (ofHom (scalingEndomorphism f) ≫ ofHom ⇑(scalingEndomorphism g)) =
          ofHom ((scalingEndomorphism g) ∘ (scalingEndomorphism f)) from rfl]
    congr 1
    -- f ≫ g = g * f definitionally; chain scalingEndomorphism_comp and RingHom.coe_comp
    exact (congr_arg DFunLike.coe (scalingEndomorphism_comp g f).symm).trans
          (RingHom.coe_comp _ _)

/-- The assignment n ↦ φₙ is a monoid homomorphism (NPos, ×) → End_Semiring(NBar),
    making NBar a semiring object of PSh(NPos) with NPos acting by multiplication. -/
lemma structureSheaf_isMonoidHom (m n : NPos) :
    (⇑(scalingEndomorphism (m * n)) : NBar → NBar) =
    ⇑(scalingEndomorphism m) ∘ ⇑(scalingEndomorphism n) := by
  ext x
  exact congr_fun (congr_arg DFunLike.coe (scalingEndomorphism_comp m n).symm) x

end ArithmeticSite
