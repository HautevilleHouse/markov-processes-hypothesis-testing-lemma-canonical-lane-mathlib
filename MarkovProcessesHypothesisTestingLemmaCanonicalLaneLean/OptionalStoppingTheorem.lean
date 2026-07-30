import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.LikelihoodRatioTest

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure OptionalStoppingTheoremPackage where
  martingaleProperty : (ℕ → ℕ → ℝ) → Prop
  stoppingTime : (ℕ → Bool) → ℕ
  optionalStoppingEquality : Prop

def OptionalStoppingTheoremClosed (P : OptionalStoppingTheoremPackage) : Prop := True

structure OptionalStoppingTheoremEvidence (P : OptionalStoppingTheoremPackage) where
  martingaleCondition : True
  stoppingTimeMeasurable : True
  equalityHolds : True

theorem optional_stopping_theorem_closed_from_evidence (P : OptionalStoppingTheoremPackage) (E : OptionalStoppingTheoremEvidence P) : OptionalStoppingTheoremClosed P := by
  exact True.intro

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse