import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemma

structure StationaryDistributionPackage (Ω : Type u) [TopologicalSpace Ω] [MeasurableSpace Ω]
    (K : TransitionKernelPackage Ω Ω) where
  measure : Measure Ω
  invariance : ∀ s : Set Ω, MeasurableSet s → measure (K.source ⁻¹' s) = measure s
  probability : measure univ = 1
  uniquenessCondition : Prop

structure StationaryDistributionEvidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} (S : StationaryDistributionPackage Ω K) where
  invarianceClosed : S.invariance
  probabilityClosed : S.probability
  uniquenessConditionClosed : S.uniquenessCondition

def StationaryDistributionClosed {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} (S : StationaryDistributionPackage Ω K) : Prop :=
  S.invariance ∧ S.probability ∧ S.uniquenessCondition

theorem stationary_distribution_closed_from_evidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} (S : StationaryDistributionPackage Ω K)
    (E : StationaryDistributionEvidence S) : StationaryDistributionClosed S := by
  exact And.intro E.invarianceClosed
    (And.intro E.probabilityClosed E.uniquenessConditionClosed)

end MarkovProcessesHypothesisTestingLemma
end HautevilleHouse