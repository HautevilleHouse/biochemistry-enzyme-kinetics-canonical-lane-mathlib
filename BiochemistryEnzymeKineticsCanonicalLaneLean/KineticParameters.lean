import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.SubstrateBinding
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.CatalyticStep

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure KineticParametersPackage {B : SubstrateBindingPackage} {C : CatalyticStepPackage B} where
  michaelisConstant : ℝ
  maximumVelocity : ℝ
  lineweaverBurkLinearization : Prop
  eadieHofsteeLinearization : Prop

structure KineticParametersEvidence {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    (K : KineticParametersPackage B C) where
  lineweaverBurkLinearizationClosed : K.lineweaverBurkLinearization
  eadieHofsteeLinearizationClosed : K.eadieHofsteeLinearization

def KineticParametersClosed {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    (K : KineticParametersPackage B C) : Prop :=
  K.lineweaverBurkLinearization ∧ K.eadieHofsteeLinearization

theorem kinetic_parameters_closed_from_evidence
    {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    (K : KineticParametersPackage B C) (E : KineticParametersEvidence K) :
    KineticParametersClosed K := by
  exact And.intro E.lineweaverBurkLinearizationClosed E.eadieHofsteeLinearizationClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse