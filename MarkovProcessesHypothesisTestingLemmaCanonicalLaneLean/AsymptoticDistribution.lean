import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.HypothesisTestingFramework

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure AsymptoticDistribution (M : MarkovChainSpace) (H : HypothesisTest M) where
  limitingDistribution : M.stateSpace → ℝ
  convergenceRate : ℝ
  distributionClosed : Prop

structure AsymptoticDistributionEvidence (M : MarkovChainSpace) (H : HypothesisTest M) (D : AsymptoticDistribution M H) where
  distributionClosedClosed : D.distributionClosed

def AsymptoticDistributionClosed (M : MarkovChainSpace) (H : HypothesisTest M) (D : AsymptoticDistribution M H) : Prop :=
  D.distributionClosed

theorem asymptoticDistributionClosedFromEvidence (M : MarkovChainSpace) (H : HypothesisTest M) (D : AsymptoticDistribution M H) (E : AsymptoticDistributionEvidence M H D) : AsymptoticDistributionClosed M H D :=
  E.distributionClosedClosed

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse