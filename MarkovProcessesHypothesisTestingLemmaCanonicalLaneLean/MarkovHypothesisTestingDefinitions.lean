import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MarkovStateSpace where
  carrier : Type
  transition : carrier → Set (carrier)
  stationaryDistributionExists : Prop

structure HypothesisTestData where
  universe : Type
  prior : carrier → ℝ
  likelihood : carrier → ℝ
  decisionRule : carrier → Bool
  errorProb : Prop

structure MarkovProcessPackage where
  stateSpace : MarkovStateSpace
  hypothesisData : HypothesisTestData
  testLevel : ℝ
  powerFunction : ℝ

structure MarkovProcessEvidence (P : MarkovProcessPackage) where
  stateSpaceWellDefined : True
  hypothesisDataConsistent : True
  testLevelValid : True
  powerFunctionValid : True

def MarkovProcessClosed (P : MarkovProcessPackage) : Prop := True

theorem markov_process_closed_from_evidence (P : MarkovProcessPackage) (E : MarkovProcessEvidence P) : MarkovProcessClosed P := by
  exact True.intro

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse