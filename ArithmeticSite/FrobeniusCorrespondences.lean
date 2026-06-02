module

public import ArithmeticSite.Points

@[expose] public section

/-!
# The Frobenius correspondences

The Frobenius correspondences Ψ(λ) for λ ∈ ℚ×₊ are correspondences on the
square of the Arithmetic Site.  They live in the square (PSh(NPos²), N̄ ⊗_𝔹 N̄)
and are built from the endomorphisms Fr_{n,m} that scale the two factors of the
tensor product independently.

For rational λ = n/m (coprime), the Frobenius correspondence is:
  Ψ(n/m) = μ ∘ Fr_{n,m}
where μ : N̄ ⊗_𝔹 N̄ → N̄ is the product map and Fr_{n,m} scales each factor by
the scaling endomorphisms.  For general λ ∈ ℝ×₊ the correspondence is defined
by the formula F(λ, q)(Σ qⁿⁱ ⊗ qᵐⁱ) = q^{inf(λnᵢ + mᵢ)}.

The key theorem is that Frobenius correspondences compose multiplicatively:
Ψ(λ) ∘ Ψ(λ') = Ψ(λλ').
-/

namespace ArithmeticSite

/-- The Boolean semifield 𝔹 = ({0,1}, max, ×). -/
noncomputable def BooleanSemifield : Type* := sorry

/-- The tensor product N̄ ⊗_𝔹 N̄ over the Boolean semifield.
    This is the structure sheaf of the square of the Arithmetic Site.
    Its elements are formal sums Σ qᵃⁱ ⊗ qᵇⁱ. -/
noncomputable def NBarTensor : Type* := sorry

/-- The endomorphism Fr_{n,m} of N̄ ⊗_𝔹 N̄ that scales the left factor by φₙ
    and the right factor by φₘ:
      Fr_{n,m}(Σ qᵃⁱ ⊗ qᵇⁱ) = Σ q^{naᵢ} ⊗ q^{mbᵢ} -/
noncomputable def Fr (n m : NPos) : NBarTensor → NBarTensor := sorry

/-- The product map μ : N̄ ⊗_𝔹 N̄ → N̄ defined by μ(qᵃ ⊗ qᵇ) = q^{a+b}. -/
noncomputable def productMap : NBarTensor → NBar := sorry

/-- The Frobenius correspondence Ψ(λ) for λ = n/m ∈ ℚ×₊ (n, m coprime).
    This is the reduced correspondence μ ∘ Fr_{n,m} on the square of the
    Arithmetic Site.  It acts on points over [0,1]_max by x ↦ λx. -/
noncomputable def frobeniusCorrespondence (n m : NPos) : NBar → NBar := sorry

/-- The Frobenius correspondences compose multiplicatively:
    Ψ(m/k) ∘ Ψ(n/l) = Ψ((mn)/(kl)).
    This is Theorem 4.3 of Connes–Consani (2014). -/
theorem frobeniusCorrespondence_comp (m n k l : NPos) :
    frobeniusCorrespondence m k ∘ frobeniusCorrespondence n l =
    frobeniusCorrespondence (m * n) (k * l) := by
  sorry

end ArithmeticSite
