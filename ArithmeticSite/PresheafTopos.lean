/-
Copyright (c) 2026 Jon Bannon. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jon Bannon
-/
module

public import Mathlib.CategoryTheory.SingleObj
public import Mathlib.CategoryTheory.Functor.Category
public import ArithmeticSite.Monoid


/-!
# The presheaf topos PSh(N+)

Objects are sets equipped with a left NPos-action by arbitrary (not necessarily
invertible) functions. Morphisms are NPos-equivariant maps.  This is the topos
underlying the Arithmetic Site.

Connes–Consani note that PSh(NPos) ≃ Sh(NPos, J) where J is the chaotic topology,
so every presheaf is automatically a sheaf.
-/

@[expose] public section

namespace ArithmeticSite

open CategoryTheory

/-- The classifying category B(NPos): the single-object category whose
    endomorphisms are NPos under multiplication. -/
abbrev BNplus := SingleObj NPos

/-- The presheaf topos PSh(NPos): covariant functors from B(NPos) to Set,
    equivalently sets equipped with a left NPos-action.  Since NPos is
    commutative, covariant and contravariant functors coincide up to
    isomorphism. -/
abbrev PresheafTopos := SingleObj NPos ⥤ Type

/-- PSh(NPos) is a Grothendieck topos.  This follows from the general fact
    that any presheaf category on a small category is a Grothendieck topos;
    the site is (NPos, J) where J is the chaotic topology. -/
lemma presheafTopos_isGrothendieckTopos :
    -- Statement placeholder: PSh(NPos) has the structure of a Grothendieck topos
    True := trivial

end ArithmeticSite
