import canonicalLaneMathlib.AdmissibleClass

/-!
# Markov Transition Kernel Package
-/

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MarkovTransitionKernelPackage where
  stateSpace : Type u
  sigmaAlgebra : Set (Set stateSpace)
  transition : stateSpace -> Set (stateSpace) -> Real
  measurabilityCondition : Prop
  stochasticityCondition : Prop
  markovProperty : Prop

structure MarkovTransitionKernelEvidence (K : MarkovTransitionKernelPackage) where
  measurabilityConditionClosed : K.measurabilityCondition
  stochasticityConditionClosed : K.stochasticityCondition
  markovPropertyClosed : K.markovProperty

def MarkovTransitionKernelClosed (K : MarkovTransitionKernelPackage) : Prop :=
  K.measurabilityCondition ∧ K.stochasticityCondition ∧ K.markovProperty

theorem markov_transition_kernel_closed_from_evidence
    (K : MarkovTransitionKernelPackage)
    (E : MarkovTransitionKernelEvidence K) : MarkovTransitionKernelClosed K := by
  exact And.intro E.measurabilityConditionClosed
    (And.intro E.stochasticityConditionClosed E.markovPropertyClosed)

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse