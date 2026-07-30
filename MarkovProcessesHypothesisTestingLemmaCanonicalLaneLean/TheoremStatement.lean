import MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  markovConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean",
  theoremName := "MarkovProcessesHypothesisTestingLemma",
  theoremObject := "Markov Processes Hypothesis Testing Lemma",
  classicalBoundary := "Markov Process test statistic distribution under the null hypothesis",
  markovConstrainedStatement := "Markov-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
  certificateLane := "markov_constrained",
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse