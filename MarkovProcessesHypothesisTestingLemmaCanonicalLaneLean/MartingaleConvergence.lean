import MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean.MarkovProcessAdmissibleClass

/-!
# Martingale Convergence Package
-/

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean

structure MartingaleConvergencePackage (A : MarkovAdmissibleClass) where
  martingaleProperty : Prop
  almostSureConvergence : Prop
  stoppingTimeOptional : Prop
  convergenceRate : Prop

structure MartingaleConvergenceEvidence (A : MarkovAdmissibleClass) (M : MartingaleConvergencePackage A) where
  martingalePropertyClosed : M.martingaleProperty
  almostSureConvergenceClosed : M.almostSureConvergence
  stoppingTimeOptionalClosed : M.stoppingTimeOptional
  convergenceRateClosed : M.convergenceRate

def MartingaleConvergenceClosed (A : MarkovAdmissibleClass) (M : MartingaleConvergencePackage A) : Prop :=
  M.martingaleProperty ∧ M.almostSureConvergence ∧ M.stoppingTimeOptional ∧ M.convergenceRate

theorem martingale_convergence_closed_from_evidence (A : MarkovAdmissibleClass) (M : MartingaleConvergencePackage A) (E : MartingaleConvergenceEvidence A M) : MartingaleConvergenceClosed A M := by
  exact And.intro E.martingalePropertyClosed
    (And.intro E.almostSureConvergenceClosed
      (And.intro E.stoppingTimeOptionalClosed E.convergenceRateClosed))

end MarkovProcessesHypothesisTestingLemmaCanonicalLaneLean
end HautevilleHouse