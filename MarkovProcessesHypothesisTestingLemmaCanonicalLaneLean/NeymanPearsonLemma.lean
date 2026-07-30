import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemma

structure NeymanPearsonLemmaPackage (Ω : Type u) [TopologicalSpace Ω] [MeasurableSpace Ω]
    (K : TransitionKernelPackage Ω Ω) (H : HypothesisTestingLemmaPackage Ω Ω K) where
  likelihoodRatio : Ω → ℝ
  likelihoodRatioMeasurable : Measurable likelihoodRatio
  optimalTest : Set Ω
  optimalTestMeasurable : MeasurableSet optimalTest
  neymanPearsonProperty :
    ∀ (α : ℝ) (0 ≤ α) (α ≤ 1),
    ∃ (c : ℝ), H.rejectionRegion = {ω | likelihoodRatio ω > c} ∪
      (if H.significanceLevel = α then {ω | likelihoodRatio ω = c ∧ ω ∈ optimalTest} else ∅)
  powerOptimal : ∀ (T : Set Ω) (measT : MeasurableSet T),
    (∫ ω in T, (1 : ℝ) ∂(K.target H.nullHypothesis)) ≤ H.significanceLevel →
    ∫ ω in H.rejectionRegion, H.powerFunction (K.source ω) ∂(K.target H.nullHypothesis) ≥
    ∫ ω in T, H.powerFunction (K.source ω) ∂(K.target H.nullHypothesis)

structure NeymanPearsonLemmaEvidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {H : HypothesisTestingLemmaPackage Ω Ω K}
    (N : NeymanPearsonLemmaPackage Ω K H) where
  likelihoodRatioMeasurableClosed : N.likelihoodRatioMeasurable
  optimalTestMeasurableClosed : N.optimalTestMeasurable
  neymanPearsonPropertyClosed : N.neymanPearsonProperty
  powerOptimalClosed : N.powerOptimal

def NeymanPearsonLemmaClosed {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {H : HypothesisTestingLemmaPackage Ω Ω K}
    (N : NeymanPearsonLemmaPackage Ω K H) : Prop :=
  N.likelihoodRatioMeasurable ∧ N.optimalTestMeasurable ∧ N.neymanPearsonProperty ∧ N.powerOptimal

theorem neyman_pearson_lemma_closed_from_evidence {Ω : Type u} [TopologicalSpace Ω] [MeasurableSpace Ω]
    {K : TransitionKernelPackage Ω Ω} {H : HypothesisTestingLemmaPackage Ω Ω K}
    (N : NeymanPearsonLemmaPackage Ω K H) (E : NeymanPearsonLemmaEvidence N) :
    NeymanPearsonLemmaClosed N := by
  exact And.intro E.likelihoodRatioMeasurableClosed
    (And.intro E.optimalTestMeasurableClosed
      (And.intro E.neymanPearsonPropertyClosed E.powerOptimalClosed))

end MarkovProcessesHypothesisTestingLemma
end HautevilleHouse