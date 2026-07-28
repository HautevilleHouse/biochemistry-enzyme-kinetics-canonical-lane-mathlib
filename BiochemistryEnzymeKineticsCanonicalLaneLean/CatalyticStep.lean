import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.SubstrateBinding

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure CatalyticStepPackage (B : SubstrateBindingPackage) where
  catalyticRate : ℝ
  turnoverNumber : ℝ
  product : Type
  catalyticMechanism : Prop
  steadyStateAssumption : Prop

structure CatalyticStepEvidence {B : SubstrateBindingPackage} (C : CatalyticStepPackage B) where
  catalyticMechanismClosed : C.catalyticMechanism
  steadyStateAssumptionClosed : C.steadyStateAssumption

def CatalyticStepClosed {B : SubstrateBindingPackage} (C : CatalyticStepPackage B) : Prop :=
  C.catalyticMechanism ∧ C.steadyStateAssumption

theorem catalytic_step_closed_from_evidence
    {B : SubstrateBindingPackage} (C : CatalyticStepPackage B)
    (E : CatalyticStepEvidence C) : CatalyticStepClosed C := by
  exact And.intro E.catalyticMechanismClosed E.steadyStateAssumptionClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse