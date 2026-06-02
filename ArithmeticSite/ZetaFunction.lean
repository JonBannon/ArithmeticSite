module

public import Mathlib.NumberTheory.LSeries.RiemannZeta
public import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
public import ArithmeticSite.FrobeniusCorrespondences

/-!
# The Riemann zeta function as the Hasse–Weil zeta of the Arithmetic Site

The Frobenius correspondences act on the points of the Arithmetic Site over
[0,1]_max.  Counting the fixed points of Ψ(λ) as λ varies produces a counting
distribution N(u), and the Hasse–Weil zeta function assembled from N(u) via
the formula

  ∂_s ζ_N(s) / ζ_N(s) = -∫₁^∞ N(u) u^{-s} d*u

is the complete Riemann zeta function ζ_ℚ(s) = π^{-s/2} Γ(s/2) ζ(s).

This is the central result of Connes–Consani (Theorem 2.7) and the main
motivation for the construction of the Arithmetic Site.
-/

@[expose] public section
namespace ArithmeticSite

/-- The counting distribution N(u) recording the number of fixed points of the
    Frobenius action on points of the Arithmetic Site over [0,1]_max. -/
noncomputable def countingDistribution : ℝ → ℝ := sorry

/-- The Hasse–Weil zeta function of the Arithmetic Site, assembled from the
    counting distribution by the Mellin-type formula:
      ∂_s ζ_N(s) / ζ_N(s) = -∫₁^∞ N(u) u^{-s} d*u -/
noncomputable def hasseWeilZeta : ℂ → ℂ := sorry

/-- The complete Riemann zeta function ζ_ℚ(s) = π^{-s/2} Γ(s/2) ζ(s). -/
noncomputable def completeRiemannZeta (s : ℂ) : ℂ :=
  Complex.exp (-s / 2 * Complex.log Real.pi) *
  Complex.Gamma (s / 2) *
  riemannZeta s

/-- The Hasse–Weil zeta function of the Arithmetic Site equals the complete
    Riemann zeta function.  This is Theorem 2.7 of Connes–Consani (2014).
    The proof identifies the counting distribution N(u) via Theorem 2.6 with
    the geometric term of Connes' distributional trace formula and applies
    the computation from Connes–Consani (2010). -/
theorem hasseWeilZeta_eq_riemannZeta :
    hasseWeilZeta = completeRiemannZeta := by
  sorry

end ArithmeticSite
