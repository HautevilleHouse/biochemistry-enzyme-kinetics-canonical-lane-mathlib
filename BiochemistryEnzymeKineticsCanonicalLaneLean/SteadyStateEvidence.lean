import BiochemistryEnzymeKineticsCanonicalLaneLean.MichaelisMentenKinetics

/-!
# Steady State Evidence Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure SteadyStateEvidencePackage where
  initialSubstrate : ℝ
  initialEnzyme : ℝ
  productConcentration : ℝ
  steadyStateReached : Prop
  endpointMatchesRateEquation : Prop
  steadyStateReachedClosed : steadyStateReached
  endpointMatchesRateEquationClosed : endpointMatchesRateEquation

def SteadyStateEvidenceClosed (S : SteadyStateEvidencePackage) : Prop :=
  S.steadyStateReached ∧ S.endpointMatchesRateEquation

theorem steady_state_evidence_closed_from_evidence (S : SteadyStateEvidencePackage) :
    SteadyStateEvidenceClosed S := by
  exact And.intro S.steadyStateReachedClosed S.endpointMatchesRateEquationClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse
