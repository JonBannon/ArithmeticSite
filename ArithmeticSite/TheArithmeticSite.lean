/-
Copyright (c) 2026 Jon Bannon. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jon Bannon
-/
module

public import ArithmeticSite.StructureSheaf

/-!
# The Arithmetic Site

The Arithmetic Site is the ringed topos (PSh(NPos), O) consisting of the
presheaf topos PSh(NPos) together with its structure sheaf O = NBar.

This is a ringed topos of characteristic 1: the structure sheaf has idempotent
addition, placing the construction in the world of tropical algebra.  Connes
and Consani describe it as the "algebraic geometric incarnation" of the
non-commutative geometric approach to the Riemann hypothesis.
-/

@[expose] public section

namespace ArithmeticSite

/-- The Arithmetic Site is the ringed topos (PSh(NPos), O): the presheaf topos
    equipped with the tropical structure sheaf.  The pair is recorded here as
    the canonical instance of this construction. -/
def arithmeticSite : PresheafTopos := structureSheaf

end ArithmeticSite
