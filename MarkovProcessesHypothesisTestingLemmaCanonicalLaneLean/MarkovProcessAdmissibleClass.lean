import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MarkovAdmittedObject where
  stateSpace : Type
  transitionKernel : Type
  stationarity : Prop
  hypothesisStatement : Prop
  conclusion : hypothesisStatement

structure MarkovAdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedMarkovClosure (A : MarkovAdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.hypothesisStatement

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse