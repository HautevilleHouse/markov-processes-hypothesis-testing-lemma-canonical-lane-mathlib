import MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.MarkovChainAdmissibleClass
import Mathlib.Probability.Process.Markov

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure TestStatistics (S : Type) [Fintype S] where
  logLikelihoodRatio : (S → ℝ) → ℝ
  threshold : ℝ
  rejectionRegion : (S → ℝ) → Prop

structure HypothesisTestEvidence (S : Type) [Fintype S] (M : AdmissibleMarkovProcess S) where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testLevel : ℝ
  powerFunction : (S → ℝ) → ℝ
  levelCondition : Prop
  powerCondition : Prop

def TestClosed (S : Type) [Fintype S] (M : AdmissibleMarkovProcess S) (T : TestStatistics S) : Prop :=
  T.logLikelihoodRatio = (λ x => ∑ s, x s * Real.log (M.kernel s 0 / M.kernel s 1)) ∧
  T.threshold > 0 ∧
  (∀ x, ¬ T.rejectionRegion x → T.logLikelihoodRatio x < T.threshold)

theorem test_closed_from_evidence (S : Type) [Fintype S] (M : AdmissibleMarkovProcess S) (T : TestStatistics S)
    (E : HypothesisTestEvidence S M) : TestClosed S M T := by
  sorry

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse