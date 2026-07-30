import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MarkovChainSpace where
  stateSpace : Type u
  transitionKernel : stateSpace → stateSpace → ℝ
  kernelSumToOne : ∀ s : stateSpace, ∑ t, transitionKernel s t = 1

structure MarkovChainEvidence (M : MarkovChainSpace) where
  stateSpaceNonempty : Nonempty M.stateSpace
  transitionMeasurable : Prop
  kernelSumOneClosed : M.kernelSumToOne = M.kernelSumToOne

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse