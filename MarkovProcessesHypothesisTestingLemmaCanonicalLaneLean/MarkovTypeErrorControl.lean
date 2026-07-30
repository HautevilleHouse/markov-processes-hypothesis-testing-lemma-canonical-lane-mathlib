import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.LikelihoodRatioTest

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure ErrorControl (M : MarkovChainSpace) (H : HypothesisTest M) (L : LikelihoodRatioTest M H) where
  typeIError : ℝ
  typeIIError : ℝ
  powerFunction : M.stateSpace → ℝ
  errorControlClosed : Prop

structure ErrorControlEvidence (M : MarkovChainSpace) (H : HypothesisTest M) (L : LikelihoodRatioTest M H) (E : ErrorControl M H L) where
  errorControlClosedClosed : E.errorControlClosed

def ErrorControlClosed (M : MarkovChainSpace) (H : HypothesisTest M) (L : LikelihoodRatioTest M H) (E : ErrorControl M H L) : Prop :=
  E.errorControlClosed

theorem errorControlClosedFromEvidence (M : MarkovChainSpace) (H : HypothesisTest M) (L : LikelihoodRatioTest M H) (E : ErrorControl M H L) (Ev : ErrorControlEvidence M H L E) : ErrorControlClosed M H L E :=
  Ev.errorControlClosedClosed

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse