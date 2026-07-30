import MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.MarkovChainAdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse