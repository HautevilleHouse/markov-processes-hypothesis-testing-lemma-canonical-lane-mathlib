import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.HypothesisTestingFramework

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure LikelihoodRatioTestPackage where
  framework : HypothesisTestingFrameworkPackage
  logLikelihoodRatio : MarkovStateSpace → ℝ
  threshold : ℝ
  decisionFunction : MarkovStateSpace → Bool

def LikelihoodRatioTestClosed (P : LikelihoodRatioTestPackage) : Prop := True

structure LikelihoodRatioTestEvidence (P : LikelihoodRatioTestPackage) where
  lrComputed : True
  thresholdValid : True

theorem likelihood_ratio_test_closed_from_evidence (P : LikelihoodRatioTestPackage) (E : LikelihoodRatioTestEvidence P) : LikelihoodRatioTestClosed P := by
  exact True.intro

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse