import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.SubstrateBinding
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.CatalyticStep
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.KineticParameters
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.ThermodynamicCycle
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.RateEquations

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure BiochemistryFoundation where
  binding : SubstrateBindingPackage
  bindingEvidence : SubstrateBindingEvidence binding
  catalytic : CatalyticStepPackage binding
  catalyticEvidence : CatalyticStepEvidence catalytic
  kinetic : KineticParametersPackage binding catalytic
  kineticEvidence : KineticParametersEvidence kinetic
  thermodynamic : ThermodynamicCyclePackage binding catalytic kinetic
  thermodynamicEvidence : ThermodynamicCycleEvidence thermodynamic
  rate : RateEquationsPackage thermodynamic
  rateEvidence : RateEquationsEvidence rate

def BiochemistryFoundationClosed (F : BiochemistryFoundation) : Prop :=
  SubstrateBindingClosed F.binding ∧
  CatalyticStepClosed F.catalytic ∧
  KineticParametersClosed F.kinetic ∧
  ThermodynamicCycleClosed F.thermodynamic ∧
  RateEquationsClosed F.rate

theorem biochemistry_foundation_closed_from_evidence (F : BiochemistryFoundation) :
    BiochemistryFoundationClosed F := by
  have hbinding := substrate_binding_closed_from_evidence F.binding F.bindingEvidence
  have hcatalytic := catalytic_step_closed_from_evidence F.catalytic F.catalyticEvidence
  have hkinetic := kinetic_parameters_closed_from_evidence F.kinetic F.kineticEvidence
  have hthermo := thermodynamic_cycle_closed_from_evidence F.thermodynamic F.thermodynamicEvidence
  have hrate := rate_equations_closed_from_evidence F.rate F.rateEvidence
  exact And.intro hbinding (And.intro hcatalytic (And.intro hkinetic (And.intro hthermo hrate)))

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse