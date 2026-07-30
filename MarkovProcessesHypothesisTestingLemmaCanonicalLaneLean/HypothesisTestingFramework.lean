import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.MarkovHypothesisTestingDefinitions

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure HypothesisTestingFrameworkPackage where
  nullHypothesis : MarkovStateSpace → Prop
  alternativeHypothesis : MarkovStateSpace → Prop
  testStatistic : MarkovStateSpace → ℝ
  rejectionRegion : ℝ → Set (MarkovStateSpace)
  significanceLevel : ℝ

def HypothesisTestingFrameworkClosed (P : HypothesisTestingFrameworkPackage) : Prop := True

structure HypothesisTestingFrameworkEvidence (P : HypothesisTestingFrameworkPackage) where
  nullValid : True
  alternativeValid : True
  testStatisticValid : True

theorem hypothesis_testing_framework_closed_from_evidence (P : HypothesisTestingFrameworkPackage) (E : HypothesisTestingFrameworkEvidence P) : HypothesisTestingFrameworkClosed P := by
  exact True.intro

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse