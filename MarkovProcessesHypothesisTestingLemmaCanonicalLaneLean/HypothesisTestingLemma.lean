import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemma

structure HypothesisTestingLemmaPackage (Ω : Type u) [TopologicalSpace Ω] (Σ : Type v) [MeasurableSpace Σ]
    (K : TransitionKernelPackage Ω Σ) where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testStatistic : Ω → ℝ
  rejectionRegion : Set Ω
  significanceLevel : ℝ
  powerFunction : Σ → ℝ
  nullHypothesisMeasurable : Measurable (λ ω : Ω => if nullHypothesis then 1 else 0)
  alternativeHypothesisMeasurable : Measurable (λ ω : Ω => if alternativeHypothesis then 1 else 0)
  testStatisticMeasurable : Measurable testStatistic
  rejectionRegionMeasurable : MeasurableSet rejectionRegion
  significanceLevelNonneg : 0 ≤ significanceLevel
  significanceLevelLeOne : significanceLevel ≤ 1
  powerFunctionNonneg : ∀ s, 0 ≤ powerFunction s
  powerFunctionLeOne : ∀ s, powerFunction s ≤ 1

structure HypothesisTestingLemmaEvidence {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    {K : TransitionKernelPackage Ω Σ} (H : HypothesisTestingLemmaPackage Ω Σ K) where
  nullHypothesisClosed : H.nullHypothesis
  alternativeHypothesisClosed : H.alternativeHypothesis
  testStatisticMeasurableClosed : H.testStatisticMeasurable
  rejectionRegionMeasurableClosed : H.rejectionRegionMeasurable
  significanceLevelConstraintsClosed : H.significanceLevelNonneg ∧ H.significanceLevelLeOne
  powerFunctionConstraintsClosed : (∀ s, 0 ≤ H.powerFunction s) ∧ (∀ s, H.powerFunction s ≤ 1)

def HypothesisTestingLemmaClosed {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    {K : TransitionKernelPackage Ω Σ} (H : HypothesisTestingLemmaPackage Ω Σ K) : Prop :=
  H.nullHypothesis ∧ H.alternativeHypothesis ∧ H.testStatisticMeasurable ∧ H.rejectionRegionMeasurable ∧
  (H.significanceLevelNonneg ∧ H.significanceLevelLeOne) ∧ ((∀ s, 0 ≤ H.powerFunction s) ∧ (∀ s, H.powerFunction s ≤ 1))

theorem hypothesis_testing_lemma_closed_from_evidence {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    {K : TransitionKernelPackage Ω Σ} (H : HypothesisTestingLemmaPackage Ω Σ K)
    (E : HypothesisTestingLemmaEvidence H) : HypothesisTestingLemmaClosed H := by
  exact And.intro E.nullHypothesisClosed
    (And.intro E.alternativeHypothesisClosed
      (And.intro E.testStatisticMeasurableClosed
        (And.intro E.rejectionRegionMeasurableClosed
          (And.intro E.significanceLevelConstraintsClosed
            E.powerFunctionConstraintsClosed))))

end MarkovProcessesHypothesisTestingLemma
end HautevilleHouse