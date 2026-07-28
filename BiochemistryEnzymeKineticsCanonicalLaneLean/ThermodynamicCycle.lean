import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.SubstrateBinding
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.CatalyticStep
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.KineticParameters

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure ThermodynamicCyclePackage {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} where
  activationEnergy : ℝ
  gibbsFreeEnergyChange : ℝ
  equilibriumConstant : ℝ
  thermodynamicConsistency : Prop

structure ThermodynamicCycleEvidence {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} (T : ThermodynamicCyclePackage B C K) where
  thermodynamicConsistencyClosed : T.thermodynamicConsistency

def ThermodynamicCycleClosed {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} (T : ThermodynamicCyclePackage B C K) : Prop :=
  T.thermodynamicConsistency

theorem thermodynamic_cycle_closed_from_evidence
    {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} (T : ThermodynamicCyclePackage B C K)
    (E : ThermodynamicCycleEvidence T) : ThermodynamicCycleClosed T :=
  E.thermodynamicConsistencyClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse