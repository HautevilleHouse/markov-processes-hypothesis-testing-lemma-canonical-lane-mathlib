import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MarkovState (S : Type) where
  value : S
  time : ℕ

def transitionKernel (S : Type) [Fintype S] : Type := S → S → ℝ

structure AdmissibleMarkovProcess (S : Type) [Fintype S] where
  stateSpace : Fintype S
  initialDistribution : S → ℝ
  kernel : transitionKernel S
  kernelConditions : (∀ s t, kernel s t ≥ 0) ∧ (∀ s, (∑ t, kernel s t) = 1)
  hypothesis : Prop
  hypothesisTest : Prop
  conclusion : hypothesisTest

structure AdmissibleClass where
  object : AdmissibleMarkovProcess (Fin 2)
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def MarkovWitnessClosed (O : AdmissibleMarkovProcess (Fin 2)) : Prop :=
  O.hypothesisTest

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse