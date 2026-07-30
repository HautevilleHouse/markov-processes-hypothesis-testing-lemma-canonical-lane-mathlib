import MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.MarkovProcessAdmissibleClass

/-!
# Stationarity Test Package
-/

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure StationarityTestPackage (A : MarkovAdmissibleClass) where
  stationarityAssumption : Prop
  unitRootTest : Prop
  autocorrelationTest : Prop
  decisionRule : Prop

structure StationarityTestEvidence (A : MarkovAdmissibleClass) (S : StationarityTestPackage A) where
  stationarityAssumptionClosed : S.stationarityAssumption
  unitRootTestClosed : S.unitRootTest
  autocorrelationTestClosed : S.autocorrelationTest
  decisionRuleClosed : S.decisionRule

def StationarityTestClosed (A : MarkovAdmissibleClass) (S : StationarityTestPackage A) : Prop :=
  S.stationarityAssumption ∧ S.unitRootTest ∧ S.autocorrelationTest ∧ S.decisionRule

theorem stationarity_test_closed_from_evidence (A : MarkovAdmissibleClass) (S : StationarityTestPackage A) (E : StationarityTestEvidence A S) : StationarityTestClosed A S := by
  exact And.intro E.stationarityAssumptionClosed
    (And.intro E.unitRootTestClosed
      (And.intro E.autocorrelationTestClosed E.decisionRuleClosed))

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse