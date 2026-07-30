import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemma

structure TransitionKernelPackage (Ω : Type u) [TopologicalSpace Ω] (Σ : Type v) [MeasurableSpace Σ] where
  source : Ω → Set Σ
  target : Σ → Set Ω
  measurabilitySource : Measurable source
  measurabilityTarget : Measurable target
  normalization : ∀ ω, source ω ≠ ∅
  markovProperty : ∀ s, ∀ ω, target s ω ∈ source ω

structure TransitionKernelEvidence {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    (K : TransitionKernelPackage Ω Σ) where
  measurabilitySourceClosed : K.measurabilitySource
  measurabilityTargetClosed : K.measurabilityTarget
  normalizationClosed : K.normalization
  markovPropertyClosed : K.markovProperty

def TransitionKernelClosed {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    (K : TransitionKernelPackage Ω Σ) : Prop :=
  K.measurabilitySource ∧ K.measurabilityTarget ∧ K.normalization ∧ K.markovProperty

theorem transition_kernel_closed_from_evidence {Ω : Type u} [TopologicalSpace Ω] {Σ : Type v} [MeasurableSpace Σ]
    (K : TransitionKernelPackage Ω Σ) (E : TransitionKernelEvidence K) : TransitionKernelClosed K := by
  exact And.intro E.measurabilitySourceClosed
    (And.intro E.measurabilityTargetClosed
      (And.intro E.normalizationClosed E.markovPropertyClosed))

end MarkovProcessesHypothesisTestingLemma
end HautevilleHouse