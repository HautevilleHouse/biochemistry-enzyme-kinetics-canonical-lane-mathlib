import BiochemistryEnzymeKineticsCanonicalLaneLean.GateLemmas
import BiochemistryEnzymeKineticsCanonicalLaneLean.MichaelisMenten

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

def ConstrainedEnzymeKineticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_enzyme_kinetics_endgame (A : AdmissibleClass) :
    ConstrainedEnzymeKineticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse