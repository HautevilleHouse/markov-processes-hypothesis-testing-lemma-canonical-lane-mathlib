import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemma

structure MarkovChainConvergencePackage (Ω : Type u) [TopologicalSpace Ω] [MeasurableSpace Ω]
    (K : TransitionKernelPackage Ω Ω) (S : StationaryDistributionPackage Ω K) where
  initialDistribution : Measure Ω
  nStepTransition : ℕ → Ω → Set Ω
  nStepMeasurable : ∀ n, Measurable (nStepTransition n)
  convergenceInTotalVariation :
    Tendsto (λ n : ℕ => TVdist (K.target (nStepTransition n) S.measure) S.measure) atTop (𝓝 0)
  ergodicTheorem : (∀ f : Ω → ℝ, Measurable f → Integrable f S.measure →
    (∀ ω, Filter.Tendsto (λ n : ℕ => (1/(n+1 : ℝ)) * ∑ i in Finset.range (n+1), f (K.source (K.target (nStepTransition i) ω))) atTop (𝓝 (∫ x, f x ∂ S.measure))))

structure MarkovChainConvergenceEvidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {S : StationaryDistributionPackage Ω K}
    (M : MarkovChainConvergencePackage Ω K S) where
  nStepMeasurableClosed : ∀ n, M.nStepMeasurable n
  convergenceInTotalVariationClosed : M.convergenceInTotalVariation
  ergodicTheoremClosed : M.ergodicTheorem

def MarkovChainConvergenceClosed {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {S : StationaryDistributionPackage Ω K}
    (M : MarkovChainConvergencePackage Ω K S) : Prop :=
  (∀ n, M.nStepMeasurable n) ∧ M.convergenceInTotalVariation ∧ M.ergodicTheorem

theorem markov_chain_convergence_closed_from_evidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {S : StationaryDistributionPackage Ω K}
    (M : MarkovChainConvergencePackage Ω K S) (E : MarkovChainConvergenceEvidence M) :
    MarkovChainConvergenceClosed M := by
  exact And.intro E.nStepMeasurableClosed
    (And.intro E.convergenceInTotalVariationClosed E.ergodicTheoremClosed)

end MarkovProcessesHypothesisTestingLemma
end HautevilleHouse