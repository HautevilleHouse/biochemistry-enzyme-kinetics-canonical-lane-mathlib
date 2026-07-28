import BiochemistryEnzymeKineticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure AllostericRegulationPackage (A : AdmissibleClass) where
  effectorConcentration : ℝ
  activationConstant : ℝ
  inhibitionConstant : ℝ
  cooperativityType : String
  hillCoefficient : ℝ
  sigmoidalKinetics : Prop
  cooperativeBinding : Prop

structure AllostericRegulationEvidence {A : AdmissibleClass} (R : AllostericRegulationPackage A) where
  sigmoidalKineticsClosed : R.sigmoidalKinetics
  cooperativeBindingClosed : R.cooperativeBinding

def AllostericRegulationClosed {A : AdmissibleClass} (R : AllostericRegulationPackage A) : Prop :=
  R.sigmoidalKinetics ∧ R.cooperativeBinding

theorem allosteric_regulation_closed_from_evidence {A : AdmissibleClass}
    (R : AllostericRegulationPackage A) (E : AllostericRegulationEvidence R) :
    AllostericRegulationClosed R := by
  exact And.intro E.sigmoidalKineticsClosed E.cooperativeBindingClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse